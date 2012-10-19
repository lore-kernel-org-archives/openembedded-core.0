Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TPE3d-0006tA-VF for openembedded-core@lists.openembedded.org;
	Fri, 19 Oct 2012 17:00:18 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9JEkvWM031757
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Oct 2012 15:46:57 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 31581-02 for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Oct 2012 15:46:53 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9JEkmVs031750
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Oct 2012 15:46:50 +0100
Message-ID: <1350658008.2520.26.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 19 Oct 2012 15:46:48 +0100
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: base.bbclass: Add PKGTRIPLETS and PKGMLTRIPLETS variables
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
X-List-Received-Date: Fri, 19 Oct 2012 15:00:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

These variables correspond to the PACKAGE_ARCH list combined with the TARGET_VENDOR
and TARGET_OS values. These can be used to traverse the pkgdata structure.

Setting these once in base.bbclass stops pkgdata needing to recalculate the values
and is also useful for the reworked shlibs code in a patch that will follow this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index f8efbf9..860f390 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -334,6 +334,38 @@ do_build () {
 	:
 }
 
+def set_packagetriplet(d):
+    archs = []
+    tos = []
+    tvs = []
+
+    archs.append(d.getVar("PACKAGE_ARCHS", True).split())
+    tos.append(d.getVar("TARGET_OS", True))
+    tvs.append(d.getVar("TARGET_VENDOR", True))
+
+    def settriplet(d, varname, archs, tos, tvs):
+        triplets = []
+        for i in range(len(archs)):
+            for arch in archs[i]:
+                triplets.append(arch + tvs[i] + "-" + tos[i])
+        triplets.reverse()
+        d.setVar(varname, " ".join(triplets))
+
+    settriplet(d, "PKGTRIPLETS", archs, tos, tvs)
+
+    variants = d.getVar("MULTILIB_VARIANTS", True) or ""
+    for item in variants.split():
+        localdata = bb.data.createCopy(d)
+        overrides = localdata.getVar("OVERRIDES", False) + ":virtclass-multilib-" + item
+        localdata.setVar("OVERRIDES", overrides)
+        bb.data.update_data(localdata)
+
+        archs.append(localdata.getVar("PACKAGE_ARCHS", True).split())
+        tos.append(localdata.getVar("TARGET_OS", True))
+        tvs.append(localdata.getVar("TARGET_VENDOR", True))
+
+    settriplet(d, "PKGMLTRIPLETS", archs, tos, tvs)
+
 python () {
     import exceptions, string, re
 
@@ -521,6 +553,8 @@ python () {
     if ".zip" in srcuri:
         d.appendVarFlag('do_unpack', 'depends', ' unzip-native:do_populate_sysroot')
 
+    set_packagetriplet(d)
+
     # 'multimachine' handling
     mach_arch = d.getVar('MACHINE_ARCH', True)
     pkg_arch = d.getVar('PACKAGE_ARCH', True)




