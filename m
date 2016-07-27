Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9BFF5606BF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 02:42:31 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u6R2gVPT002665
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2016 19:42:31 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 26 Jul 2016 19:42:30 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 26 Jul 2016 22:42:29 -0400
Message-ID: <1469587349-174197-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] systemd-boot: use lnr instead of ln --relative
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
X-List-Received-Date: Wed, 27 Jul 2016 02:42:31 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Use lnr instead of "ln --relative" as systemd does
to avoid needing coreutils 8.16.

The patch is from systemd recipe and is rebased
so it can be applied for systemd-boot.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 ...pper-instead-of-looking-for-relative-opti.patch | 61 ++++++++++++++++++++++
 meta/recipes-bsp/systemd-boot/systemd-boot.bb      |  2 +
 2 files changed, 63 insertions(+)
 create mode 100644 meta/recipes-bsp/systemd-boot/files/0001-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch

diff --git a/meta/recipes-bsp/systemd-boot/files/0001-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch b/meta/recipes-bsp/systemd-boot/files/0001-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch
new file mode 100644
index 0000000..103d286
--- /dev/null
+++ b/meta/recipes-bsp/systemd-boot/files/0001-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch
@@ -0,0 +1,61 @@
+From 9dcd2c80347493f73800d8c1cb539f1daef14394 Mon Sep 17 00:00:00 2001
+From: Jackie Huang <jackie.huang@windriver.com>
+Date: Tue, 26 Jul 2016 03:54:42 -0400
+Subject: [PATCH] use lnr wrapper instead of looking for --relative option for ln
+
+Upstream-Status: Inappropriate [OE-Specific]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ Makefile.am  | 6 +++---
+ configure.ac | 2 --
+ 2 files changed, 3 insertions(+), 5 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 305099a..f08d023 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -247,7 +247,7 @@ define move-to-rootlibdir
+ 		$(MKDIR_P) $(DESTDIR)$(rootlibdir) && \
+ 		so_img_name=$$(readlink $(DESTDIR)$(libdir)/$$libname) && \
+ 		rm -f $(DESTDIR)$(libdir)/$$libname && \
+-		$(LN_S) --relative -f $(DESTDIR)$(rootlibdir)/$$so_img_name $(DESTDIR)$(libdir)/$$libname && \
++		lnr $(DESTDIR)$(rootlibdir)/$$so_img_name $(DESTDIR)$(libdir)/$$libname && \
+ 		mv $(DESTDIR)$(libdir)/$$libname.* $(DESTDIR)$(rootlibdir); \
+ 	fi
+ endef
+@@ -321,7 +321,7 @@ define install-relative-aliases
+ 	while [ -n "$$1" ]; do \
+ 		$(MKDIR_P) `dirname $(DESTDIR)$$dir/$$2` && \
+ 		rm -f $(DESTDIR)$$dir/$$2 && \
+-		$(LN_S) --relative $(DESTDIR)$$1 $(DESTDIR)$$dir/$$2 && \
++		lnr $(DESTDIR)$$1 $(DESTDIR)$$dir/$$2 && \
+ 		shift 2 || exit $$?; \
+ 	done
+ endef
+@@ -2906,7 +2906,7 @@ systemd_dbus1_generator_LDADD = \
+ dbus1-generator-install-hook:
+ 	$(AM_V_at)$(MKDIR_P) $(DESTDIR)$(usergeneratordir)
+ 	$(AM_V_RM)rm -f $(DESTDIR)$(usergeneratordir)/systemd-dbus1-generator
+-	$(AM_V_LN)$(LN_S) --relative -f $(DESTDIR)$(systemgeneratordir)/systemd-dbus1-generator $(DESTDIR)$(usergeneratordir)/systemd-dbus1-generator
++	$(AM_V_LN)lnr $(DESTDIR)$(systemgeneratordir)/systemd-dbus1-generator $(DESTDIR)$(usergeneratordir)/systemd-dbus1-generator
+ 
+ dbus1-generator-uninstall-hook:
+ 	rm -f $(DESTDIR)$(usergeneratordir)/systemd-dbus1-generator
+diff --git a/configure.ac b/configure.ac
+index 329861a..52c6e3d 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -110,8 +110,6 @@ AC_PATH_PROG([SULOGIN], [sulogin], [/usr/sbin/sulogin], [$PATH:/usr/sbin:/sbin])
+ AC_PATH_PROG([MOUNT_PATH], [mount], [/usr/bin/mount], [$PATH:/usr/sbin:/sbin])
+ AC_PATH_PROG([UMOUNT_PATH], [umount], [/usr/bin/umount], [$PATH:/usr/sbin:/sbin])
+ 
+-AS_IF([! ln --relative --help > /dev/null 2>&1], [AC_MSG_ERROR([*** ln doesn't support --relative ***])])
+-
+ M4_DEFINES=
+ 
+ AC_CHECK_TOOL(OBJCOPY, objcopy)
+-- 
+2.8.1
+
diff --git a/meta/recipes-bsp/systemd-boot/systemd-boot.bb b/meta/recipes-bsp/systemd-boot/systemd-boot.bb
index 0dc0fa3..5b1164e 100644
--- a/meta/recipes-bsp/systemd-boot/systemd-boot.bb
+++ b/meta/recipes-bsp/systemd-boot/systemd-boot.bb
@@ -2,6 +2,8 @@ require recipes-core/systemd/systemd.inc
 
 DEPENDS = "intltool-native libcap util-linux gnu-efi"
 
+SRC_URI += "file://0001-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch"
+
 inherit autotools pkgconfig gettext
 inherit deploy
 
-- 
2.8.1


