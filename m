Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 254D56FF0E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Aug 2016 01:58:18 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u711wIwB005700
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Jul 2016 18:58:19 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Sun, 31 Jul 2016 18:58:18 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 1 Aug 2016 09:54:59 +0800
Message-ID: <1470016499-30815-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] grub2.inc: run autogen.sh before configure
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 01 Aug 2016 01:58:19 -0000
Content-Type: text/plain

When adding new source files from upstream the autogen.sh
script needs to be run

Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/recipes-bsp/grub/grub2.inc   | 4 +++-
 meta/recipes-bsp/grub/grub_git.bb | 7 -------
 2 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 0b169bf..d77a0d4 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -33,7 +33,7 @@ SRC_URI = "ftp://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
            file://0001-grub-core-gettext-gettext.c-main_context-secondary_c.patch \
             "
 
-DEPENDS = "flex-native bison-native"
+DEPENDS = "flex-native bison-native autogen-native"
 
 SRC_URI[md5sum] = "e927540b6eda8b024fb0391eeaa4091c"
 SRC_URI[sha256sum] = "65b39a0558f8c802209c574f4d02ca263a804e8a564bc6caf1cd0fd3b3cc11e3"
@@ -60,6 +60,8 @@ do_configure_prepend() {
 	# for its own purposes. Remove the OE versions from the environment to
 	# avoid conflicts.
 	unset TARGET_CPPFLAGS TARGET_CFLAGS TARGET_CXXFLAGS TARGET_LDFLAGS
+	( cd ${S}
+	${S}/autogen.sh )
 }
 
 # grub and grub-efi's sysroot/${datadir}/grub/grub-mkconfig_lib are
diff --git a/meta/recipes-bsp/grub/grub_git.bb b/meta/recipes-bsp/grub/grub_git.bb
index 7a900d0..493b695 100644
--- a/meta/recipes-bsp/grub/grub_git.bb
+++ b/meta/recipes-bsp/grub/grub_git.bb
@@ -1,7 +1,5 @@
 require grub2.inc
 
-DEPENDS += "autogen-native"
-
 DEFAULT_PREFERENCE = "-1"
 DEFAULT_PREFERENCE_arm = "1"
 
@@ -34,11 +32,6 @@ EXTRA_OECONF = "--with-platform=${GRUBPLATFORM} --disable-grub-mkfont --program-
 
 EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'largefile', '--enable-largefile', '--disable-largefile', d)}"
 
-do_configure_prepend() {
-    ( cd ${S}
-      ${S}/autogen.sh )
-}
-
 do_install_append () {
     install -d ${D}${sysconfdir}/grub.d
     rm -rf ${D}${libdir}/charset.alias
-- 
2.8.1


