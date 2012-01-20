Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RoHIz-0003Gy-GD for openembedded-core@lists.openembedded.org;
	Fri, 20 Jan 2012 17:27:09 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0KGJRWC019788
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2012 16:19:27 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18665-09 for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2012 16:19:23 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0KGJJM7019782
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2012 16:19:20 GMT
Message-ID: <1327076359.4268.6.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 20 Jan 2012 16:19:19 +0000
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] lib/oe: Add sstatesig, OE specific signature generator classes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 20 Jan 2012 16:27:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This patch adds SignatureGenerator classes specific to OE. For now,
these emulate the previous behaviour with the exception that
dependencies on quilt-native are now ignored for checksum purposes.

The intent is to allow easier experimentation and customisation of 
this code in future as a result of these changes.

Note that these changes require pending bitbake patches.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 091e965..bedb73b 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -9,7 +9,7 @@ inherit utility-tasks
 inherit metadata_scm
 inherit logging
 
-OE_IMPORTS += "os sys time oe.path oe.utils oe.data oe.packagegroup"
+OE_IMPORTS += "os sys time oe.path oe.utils oe.data oe.packagegroup oe.sstatesig"
 OE_IMPORTS[type] = "list"
 
 def oe_import(d):
diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
new file mode 100644
index 0000000..fdfab63
--- a/dev/null
+++ b/meta/lib/oe/sstatesig.py
@@ -0,0 +1,48 @@
+import bb.siggen
+
+def sstate_rundepfilter(fn, recipename, task, dep, depname):
+    # Return True if we should keep the dependency, False to drop it
+    def isNative(x):
+        return x.endswith("-native")
+    def isCross(x):
+        return x.endswith("-cross") or x.endswith("-cross-initial") or x.endswith("-cross-intermediate")
+    def isNativeSDK(x):
+        return x.endswith("-nativesdk")
+
+    # Always include our own inter-task dependencies
+    if recipename == depname:
+        return True
+
+    # Quilt (patch application) changing isn't likely to affect anything
+    if depname == "quilt-native":
+        return False
+    # Don't change native/cross/nativesdk recipe dependencies any further
+    if isNative(recipename) or isCross(recipename) or isNativeSDK(recipename):
+        return True
+
+    # Only target packages beyond here
+
+    # Drop native/cross/nativesdk dependencies from target recipes
+    if isNative(depname) or isCross(depname) or isNativeSDK(depname):
+        return False
+
+    # Default to keep dependencies
+    return True
+
+class SignatureGeneratorOEBasic(bb.siggen.SignatureGeneratorBasic):
+    name = "OEBasic"
+    def init_rundepcheck(self, data):
+        pass
+    def rundep_check(self, fn, recipename, task, dep, depname):
+        return sstate_rundepfilter(fn, recipename, task, dep, depname)
+
+class SignatureGeneratorOEBasicHash(bb.siggen.SignatureGeneratorBasicHash):
+    name = "OEBasicHash"
+    def init_rundepcheck(self, data):
+        pass
+    def rundep_check(self, fn, task, dep, dataCache):
+        return sstate_rundepfilter(fn, recipename, task, dep, depname)
+
+# Insert these classes into siggen's namespace so it can see and select them
+bb.siggen.SignatureGeneratorOEBasic = SignatureGeneratorOEBasic
+bb.siggen.SignatureGeneratorOEBasicHash = SignatureGeneratorOEBasicHash




