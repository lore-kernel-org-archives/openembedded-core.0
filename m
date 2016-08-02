Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 413CB6AC00
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Aug 2016 06:41:37 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u726fZRb014370
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 1 Aug 2016 23:41:36 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Mon, 1 Aug 2016 23:41:34 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 2 Aug 2016 14:38:10 +0800
Message-ID: <1470119890-29288-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH V2] grub2.inc: run autogen.sh before configure
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
X-List-Received-Date: Tue, 02 Aug 2016 06:41:40 -0000
Content-Type: text/plain

* When adding new source files from upstream the autogen.sh
  script needs to be run
* Rework grub2-remove-sparc64-setup-from-x86-builds.patch
  to remove the grub-setup helper program grub-sparc64-setup
  in Makefile.util.def instead of the previous Makefile.util.am
  to avoid the update for Makefile.util.am in do_patch phase is
  overwritten by the autogen.sh in do_configure phase

Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...rub2-remove-sparc64-setup-from-x86-builds.patch | 140 ++++++---------------
 meta/recipes-bsp/grub/grub2.inc                    |   4 +-
 meta/recipes-bsp/grub/grub_git.bb                  |   7 --
 3 files changed, 43 insertions(+), 108 deletions(-)

diff --git a/meta/recipes-bsp/grub/files/grub2-remove-sparc64-setup-from-x86-builds.patch b/meta/recipes-bsp/grub/files/grub2-remove-sparc64-setup-from-x86-builds.patch
index e15040d..5168d3c 100644
--- a/meta/recipes-bsp/grub/files/grub2-remove-sparc64-setup-from-x86-builds.patch
+++ b/meta/recipes-bsp/grub/files/grub2-remove-sparc64-setup-from-x86-builds.patch
@@ -1,104 +1,44 @@
-Upstream-Status: Inappropriate [embedded specific]
+Subject: [PATCH] grub2: remove grub-sparc64-setup from x86 builds
+
+* remove the grub-sparc64-setup files from the x86 builds.
 
-remove the grub-sparc64-setup files from the x86 builds.
+Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ Makefile.util.def | 18 ------------------
+ 1 file changed, 18 deletions(-)
+
+diff --git a/Makefile.util.def b/Makefile.util.def
+index b80187c..a670cf2 100644
+--- a/Makefile.util.def
++++ b/Makefile.util.def
+@@ -321,24 +321,6 @@ program = {
+ };
+ 
+ program = {
+-  name = grub-sparc64-setup;
+-  installdir = sbin;
+-  mansection = 8;
+-  common = util/grub-setup.c;
+-  common = util/lvm.c;
+-  common = grub-core/kern/emu/argp_common.c;
+-  common = grub-core/lib/reed_solomon.c;
+-  common = util/ieee1275/ofpath.c;
+-
+-  ldadd = libgrubmods.a;
+-  ldadd = libgrubkern.a;
+-  ldadd = libgrubgcry.a;
+-  ldadd = grub-core/gnulib/libgnu.a;
+-  ldadd = '$(LIBINTL) $(LIBDEVMAPPER) $(LIBUTIL) $(LIBZFS) $(LIBNVPAIR) $(LIBGEOM)';
+-  cppflags = '-DGRUB_SETUP_SPARC64=1';
+-};
+-
+-program = {
+   name = grub-ofpathname;
+   installdir = sbin;
+   mansection = 8;
+-- 
+2.8.1
 
---- a/Makefile.util.am	2014-08-15 11:41:02.441011278 -0700
-+++ b/Makefile.util.am	2014-08-15 11:44:26.245021142 -0700
-@@ -4692,9 +4692,9 @@
- endif
- 
- if COND_emu
--sbin_PROGRAMS += grub-sparc64-setup
-+sbin_PROGRAMS +=
- if COND_MAN_PAGES
--man_MANS += grub-sparc64-setup.8
-+man_MANS +=
- 
- grub-sparc64-setup.8: grub-sparc64-setup
- 	chmod a+x grub-sparc64-setup
-@@ -4715,9 +4715,9 @@
- endif
- 
- if COND_i386_pc
--sbin_PROGRAMS += grub-sparc64-setup
-+sbin_PROGRAMS +=
- if COND_MAN_PAGES
--man_MANS += grub-sparc64-setup.8
-+man_MANS +=
- 
- grub-sparc64-setup.8: grub-sparc64-setup
- 	chmod a+x grub-sparc64-setup
-@@ -4738,9 +4738,9 @@
- endif
- 
- if COND_i386_efi
--sbin_PROGRAMS += grub-sparc64-setup
-+sbin_PROGRAMS +=
- if COND_MAN_PAGES
--man_MANS += grub-sparc64-setup.8
-+man_MANS +=
- 
- grub-sparc64-setup.8: grub-sparc64-setup
- 	chmod a+x grub-sparc64-setup
-@@ -4761,9 +4761,9 @@
- endif
- 
- if COND_i386_qemu
--sbin_PROGRAMS += grub-sparc64-setup
-+sbin_PROGRAMS +=
- if COND_MAN_PAGES
--man_MANS += grub-sparc64-setup.8
-+man_MANS +=
- 
- grub-sparc64-setup.8: grub-sparc64-setup
- 	chmod a+x grub-sparc64-setup
-@@ -4784,9 +4784,9 @@
- endif
- 
- if COND_i386_coreboot
--sbin_PROGRAMS += grub-sparc64-setup
-+sbin_PROGRAMS +=
- if COND_MAN_PAGES
--man_MANS += grub-sparc64-setup.8
-+man_MANS +=
- 
- grub-sparc64-setup.8: grub-sparc64-setup
- 	chmod a+x grub-sparc64-setup
-@@ -4807,9 +4807,9 @@
- endif
- 
- if COND_i386_multiboot
--sbin_PROGRAMS += grub-sparc64-setup
-+sbin_PROGRAMS +=
- if COND_MAN_PAGES
--man_MANS += grub-sparc64-setup.8
-+man_MANS +=
- 
- grub-sparc64-setup.8: grub-sparc64-setup
- 	chmod a+x grub-sparc64-setup
-@@ -4830,9 +4830,9 @@
- endif
- 
- if COND_i386_ieee1275
--sbin_PROGRAMS += grub-sparc64-setup
-+sbin_PROGRAMS +=
- if COND_MAN_PAGES
--man_MANS += grub-sparc64-setup.8
-+man_MANS +=
- 
- grub-sparc64-setup.8: grub-sparc64-setup
- 	chmod a+x grub-sparc64-setup
-@@ -4853,9 +4853,9 @@
- endif
- 
- if COND_x86_64_efi
--sbin_PROGRAMS += grub-sparc64-setup
-+sbin_PROGRAMS +=
- if COND_MAN_PAGES
--man_MANS += grub-sparc64-setup.8
-+man_MANS +=
- 
- grub-sparc64-setup.8: grub-sparc64-setup
- 	chmod a+x grub-sparc64-setup
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


