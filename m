Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TQHGi-0000F6-Lq for openembedded-core@lists.openembedded.org;
	Mon, 22 Oct 2012 14:38:08 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9MCOiTN004938
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2012 13:24:44 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04487-05 for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2012 13:24:40 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9MCOadg004932
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2012 13:24:37 +0100
Message-ID: <1350908677.2520.87.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 22 Oct 2012 13:24:37 +0100
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] multilib/clsextend: Improve handling of regexps in PACKAGES_DYNAMIC
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 22 Oct 2012 12:38:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Now that PACKAGES_DYNAMIC is more standardised, starting with ^ anchors,
the variable manipulations performed by clsextend for multilib don't work.

This patch at least improves it to hack around the problem and enable
mulitlib builds to work again. If this code doesn't do the right thing, the
recipe is free to override the variable with the correct multilib case.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index eaaad5f..3824f3b 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -75,7 +75,7 @@ python __anonymous () {
     clsextend.map_depends_variable("DEPENDS")
     clsextend.map_packagevars()
     clsextend.map_variable("PROVIDES")
-    clsextend.map_variable("PACKAGES_DYNAMIC")
+    clsextend.map_regexp_variable("PACKAGES_DYNAMIC")
     clsextend.map_variable("PACKAGE_INSTALL")
     clsextend.map_variable("INITSCRIPT_PACKAGES")
 }
diff --git a/meta/lib/oe/classextend.py b/meta/lib/oe/classextend.py
index 86b1e8a..857a6c9 100644
--- a/meta/lib/oe/classextend.py
+++ b/meta/lib/oe/classextend.py
@@ -33,6 +33,22 @@ class ClassExtender(object):
             self.d.setVar(varname, newdata)
         return newdata
 
+    def map_regexp_variable(self, varname, setvar = True):
+        var = self.d.getVar(varname, True)
+        if not var:
+            return ""
+        var = var.split()
+        newvar = []
+        for v in var:
+            if v.startswith("^"):
+                newvar.append("^" + self.extname + "-" + v[1:])
+            else:
+                newvar.append(self.extend_name(v))
+        newdata =  " ".join(newvar)
+        if setvar:
+            self.d.setVar(varname, newdata)
+        return newdata
+
     def map_depends(self, dep):
         if dep.endswith(("-native", "-native-runtime")):
             return dep




