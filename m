Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SIJqP-0005ug-BZ for openembedded-core@lists.openembedded.org;
	Thu, 12 Apr 2012 15:13:49 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3CD4SlR022340
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Apr 2012 14:04:28 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21439-04 for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Apr 2012 14:04:23 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3CD4IQB022333
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Apr 2012 14:04:21 +0100
Message-ID: <1334235858.7309.34.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 12 Apr 2012 14:04:18 +0100
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] base.bbclass: Fix PACKAGECONFIG issues with native and nativesdk BBCLASSEXTEND recipes (and multilib)
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
X-List-Received-Date: Thu, 12 Apr 2012 13:13:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This patch fixes up the issues that were being seen where BBCLASSEXTEND and
PACKAGECONFIG were interacting badly. It also ensures PACKAGECONFIG interacts
properly with multilib builds.

Ideally some of this code will be abstracted into lib/oe/classextend.py but
at this point in release more invasive changes like this are inappropriate.

This patch also removed empty strings from expressions rather than
passing them around as this was complicating the additional code
unnecessarily.

The patch was verified against the OE-Core metadata where the return values of 
expandFilter() were sanity checked by hand for native/nativesdk and
multilib combinations.

[YOCTO #2225]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 2e8a0b0..3c9d76c 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -305,9 +305,32 @@ python () {
     pkgconfigflags = d.getVarFlags("PACKAGECONFIG") or {}
     if pkgconfigflags:
         pkgconfig = (d.getVar('PACKAGECONFIG', True) or "").split()
+        pn = d.getVar("PN", True)
+        mlprefix = d.getVar("MLPREFIX", True)
+
+        def expandFilter(appends, extension, prefix):
+            appends = bb.utils.explode_deps(d.expand(" ".join(appends)))
+            newappends = []
+            for a in appends:
+               if a.endswith("-native") or a.endswith("-cross"):
+                   newappends.append(a)
+               elif a.startswith("virtual/"):
+                   subs = a.split("/", 1)[1]
+                   newappends.append("virtual/" + prefix + subs + extension)
+               else:
+                   newappends.append(prefix + a + extension)
+            return newappends
+
         def appendVar(varname, appends):
             if not appends:
                 return
+            if varname.find("DEPENDS") != -1:
+                if pn.endswith("-nativesdk"):
+                    appends = expandFilter(appends, "-nativesdk", "")
+                if pn.endswith("-native"):
+                    appends = expandFilter(appends, "-native", "")
+                if mlprefix:
+                    appends = expandFilter(appends, "", mlprefix)
             varname = d.expand(varname)
             d.appendVar(varname, " " + " ".join(appends))
 
@@ -324,11 +347,14 @@ python () {
             elif len(items) == 4:
                 enable, disable, depend, rdepend = items
             if flag in pkgconfig:
-                extradeps.append(depend)
-                extrardeps.append(rdepend)
-                extraconf.append(enable)
-            else:
-                extraconf.append(disable)
+                if depend:
+                    extradeps.append(depend)
+                if rdepend:
+                    extrardeps.append(rdepend)
+                if enable:
+                    extraconf.append(enable)
+            elif disable:
+                    extraconf.append(disable)
         appendVar('DEPENDS', extradeps)
         appendVar('RDEPENDS_${PN}', extrardeps)
         appendVar('EXTRA_OECONF', extraconf)




