Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 8490E77ACD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Oct 2017 12:59:42 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.42,505,1500912000"; d="scan'208";a="28805792"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 10 Oct 2017 20:59:44 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id A71FD48029C1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Oct 2017 20:59:40 +0800 (CST)
Received: from localhost.localdomain (10.167.225.125) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Tue, 10 Oct 2017 20:59:40 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 10 Oct 2017 20:59:32 +0800
Message-ID: <1507640372-934-3-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1507640372-934-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1507640372-934-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.125]
X-yoursite-MailScanner-ID: A71FD48029C1.A705A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] at-spi2-core: 2.24.1 -> 2.26.0
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
X-List-Received-Date: Tue, 10 Oct 2017 12:59:43 -0000
Content-Type: text/plain

1) Upgrade at-spi2-core from 2.24.1 to 2.26.0.
2) Delete one patch "0001-nls.m4-Take-it-from-gettext-0.15.patch", since it is integrated upstream.
3) Modify one patch "0001-nls.m4-Take-it-from-gettext-0.15.patch", since the data has been changed.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../0001-build-Add-with-systemduserunitdir.patch   | 21 +++++----
 .../0001-nls.m4-Take-it-from-gettext-0.15.patch    | 54 ----------------------
 ...-spi2-core_2.24.1.bb => at-spi2-core_2.26.0.bb} |  5 +-
 3 files changed, 13 insertions(+), 67 deletions(-)
 delete mode 100644 meta/recipes-support/atk/at-spi2-core/0001-nls.m4-Take-it-from-gettext-0.15.patch
 rename meta/recipes-support/atk/{at-spi2-core_2.24.1.bb => at-spi2-core_2.26.0.bb} (84%)

diff --git a/meta/recipes-support/atk/at-spi2-core/0001-build-Add-with-systemduserunitdir.patch b/meta/recipes-support/atk/at-spi2-core/0001-build-Add-with-systemduserunitdir.patch
index 4103eaa..8cbb5a1 100644
--- a/meta/recipes-support/atk/at-spi2-core/0001-build-Add-with-systemduserunitdir.patch
+++ b/meta/recipes-support/atk/at-spi2-core/0001-build-Add-with-systemduserunitdir.patch
@@ -7,6 +7,7 @@ Default to "pkg-config --variable=systemduserunitdir systemd" but
 allow overriding the value.
 
 Upstream-Status: Submitted [https://bugzilla.gnome.org/show_bug.cgi?id=767911]
+
 Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
 ---
  bus/Makefile.am | 2 +-
@@ -14,23 +15,23 @@ Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
  2 files changed, 8 insertions(+), 1 deletion(-)
 
 diff --git a/bus/Makefile.am b/bus/Makefile.am
-index b189e02..52fbb0b 100644
+index 688f82a..10cde62 100644
 --- a/bus/Makefile.am
 +++ b/bus/Makefile.am
-@@ -26,7 +26,7 @@ dbusservice_DATA = org.a11y.Bus.service
- org.a11y.Bus.service: org.a11y.Bus.service.in
- 	sed -e $(substitutions) $< > $@.tmp && mv $@.tmp $@
+@@ -29,7 +29,7 @@ org.a11y.Bus.service: org.a11y.Bus.service.in
+ EXTRA_DIST += org.a11y.Bus.service.in
+ CLEANFILES += org.a11y.Bus.service
  
 -systemd_userdir = $(prefix)/lib/systemd/user
 +systemd_userdir = $(systemduserunitdir)
  systemd_user_DATA = at-spi-dbus-bus.service
  at-spi-dbus-bus.service: at-spi-dbus-bus.service.in Makefile
- 	sed -e $(substitutions) $< > $@.tmp && mv $@.tmp $@
+ 	$(AM_V_GEN) $(SED) -e $(substitutions) $< > $@.tmp && mv $@.tmp $@
 diff --git a/configure.ac b/configure.ac
-index f9061c2..2b8eeed 100644
+index 8c4fca2..ffc5ae6 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -183,6 +183,13 @@ else
+@@ -146,6 +146,13 @@ else
  fi
  AC_SUBST(DBUS_SERVICES_DIR)
  
@@ -41,9 +42,9 @@ index f9061c2..2b8eeed 100644
 +            [with_systemduserunitdir=$($PKG_CONFIG --variable=systemduserunitdir systemd)])
 +AC_SUBST([systemduserunitdir], [$with_systemduserunitdir])
 +
- AC_PATH_PROG(GLIB_MKENUMS, glib-mkenums)
+ GOBJECT_INTROSPECTION_CHECK([1.32.0])
  
- GOBJECT_INTROSPECTION_CHECK([0.9.6])
+ AC_SUBST(LIBTOOL_EXPORT_OPTIONS)
 -- 
-2.1.4
+2.7.4
 
diff --git a/meta/recipes-support/atk/at-spi2-core/0001-nls.m4-Take-it-from-gettext-0.15.patch b/meta/recipes-support/atk/at-spi2-core/0001-nls.m4-Take-it-from-gettext-0.15.patch
deleted file mode 100644
index 69a51d5..0000000
--- a/meta/recipes-support/atk/at-spi2-core/0001-nls.m4-Take-it-from-gettext-0.15.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From c320799c941d42a9b7e351805359694ea3b36d2d Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 5 Apr 2015 09:08:38 -0700
-Subject: [PATCH] nls.m4: Take it from gettext-0.15
-
-It otherwise expects gettext to provide it. Lets go independent
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Pending
----
- m4/nls.m4 | 30 ++++++++++++++++++++++++++++++
- 1 file changed, 30 insertions(+)
- create mode 100644 m4/nls.m4
-
-diff --git a/m4/nls.m4 b/m4/nls.m4
-new file mode 100644
-index 0000000..2c8fe69
---- /dev/null
-+++ b/m4/nls.m4
-@@ -0,0 +1,30 @@
-+dnl Copyright (C) 1995-2003, 2005-2006 Free Software Foundation, Inc.
-+dnl This file is free software; the Free Software Foundation
-+dnl gives unlimited permission to copy and/or distribute it,
-+dnl with or without modifications, as long as this notice is preserved.
-+dnl
-+dnl This file can can be used in projects which are not available under
-+dnl the GNU General Public License or the GNU Library General Public
-+dnl License but which still want to provide support for the GNU gettext
-+dnl functionality.
-+dnl Please note that the actual code of the GNU gettext library is covered
-+dnl by the GNU Library General Public License, and the rest of the GNU
-+dnl gettext package package is covered by the GNU General Public License.
-+dnl They are not in the public domain.
-+
-+dnl Authors:
-+dnl Ulrich Drepper drepper@cygnus.com, 1995-2000.
-+dnl Bruno Haible haible@clisp.cons.org, 2000-2003.
-+
-+AC_PREREQ(2.50)
-+
-+AC_DEFUN([AM_NLS],
-+[
-+AC_MSG_CHECKING([whether NLS is requested])
-+dnl Default is enabled NLS
-+AC_ARG_ENABLE(nls,
-+[ --disable-nls do not use Native Language Support],
-+USE_NLS=$enableval, USE_NLS=yes)
-+AC_MSG_RESULT($USE_NLS)
-+AC_SUBST(USE_NLS)
-+])
--- 
-2.1.4
-
diff --git a/meta/recipes-support/atk/at-spi2-core_2.24.1.bb b/meta/recipes-support/atk/at-spi2-core_2.26.0.bb
similarity index 84%
rename from meta/recipes-support/atk/at-spi2-core_2.24.1.bb
rename to meta/recipes-support/atk/at-spi2-core_2.26.0.bb
index 1687ae3..3cfc620 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.24.1.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.26.0.bb
@@ -6,12 +6,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e9f288ba982d60518f375b5898283886"
 MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
-           file://0001-nls.m4-Take-it-from-gettext-0.15.patch \
            file://0001-build-Add-with-systemduserunitdir.patch \
           "
 
-SRC_URI[md5sum] = "61d0a471e693292934a73f288ebff35c"
-SRC_URI[sha256sum] = "1e90d064b937aacfe79a96232ac7e63d28d716e85bd9ff4333f865305a959b5b"
+SRC_URI[md5sum] = "ef3de25da46da8f650915205eb7e1a33"
+SRC_URI[sha256sum] = "511568a65fda11fdd5ba5d4adfd48d5d76810d0e6ba4f7460f1b2ec0dbbbc337"
 
 DEPENDS = "dbus glib-2.0 virtual/libx11 libxi libxtst intltool-native"
 
-- 
2.7.4




