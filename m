Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SJRaO-00079Z-GY for openembedded-core@lists.openembedded.org;
	Sun, 15 Apr 2012 17:41:56 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3FFWXTS022359
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Apr 2012 16:32:33 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21820-03 for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Apr 2012 16:32:28 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3FFWRl0022353
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Apr 2012 16:32:28 +0100
Message-ID: <1334503949.16992.31.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sun, 15 Apr 2012 16:32:29 +0100
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] man-pages: Fix to allow re-execution of tasks
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
X-List-Received-Date: Sun, 15 Apr 2012 15:41:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The all target in the makefile triggers "screen" and "remove" targets,
neither of which do anything useful/sane for our usecases. The simplest
way to get the makefile to behave is to only use the install target.

Clean up the recipe a bit whilst making these changes and simplify things.

[YOCTO #2194]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-extended/man-pages/man-pages_3.36.bb b/meta/recipes-extended/man-pages/man-pages_3.36.bb
index 4e888dc..6025a87 100644
--- a/meta/recipes-extended/man-pages/man-pages_3.36.bb
+++ b/meta/recipes-extended/man-pages/man-pages_3.36.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "The Linux man-pages project documents the Linux kernel and C libr
 SECTION = "console/utils"
 HOMEPAGE = "http://www.kernel.org/pub/linux/docs/man-pages"
 LICENSE = "GPLv2+"
-PR = "r0"
+PR = "r1"
 
 LIC_FILES_CHKSUM = "file://README;md5=0422377a748010b2b738342e24f141c1"
 SRC_URI = "${KERNELORG_MIRROR}/linux/docs/man-pages/Archive/${BPN}-${PV}.tar.gz"
@@ -13,19 +13,15 @@ SRC_URI[sha256sum] = "c0575e31f73cd9dc2761c274217e06e7130fdfee510170957a9d72d012
 
 RDEPENDS_${PN} = "man"
 
-do_configure_prepend() {
-	rm -rf not_installed
-}
-
 do_configure () {
-      :
+	:
 }
 
 do_compile() {
-	oe_runmake -f Makefile DESTDIR=${D} MANDIR=${D}${mandir}
+	:
 }
 
-fakeroot do_install() {
+do_install() {
         oe_runmake install DESTDIR=${D}
 }
 




