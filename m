Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4880371493
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Sep 2014 10:29:04 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8NAT3w9022654
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Sep 2014 03:29:03 -0700 (PDT)
Received: from pek-hostel-vm12.wrs.com (128.224.153.182) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 23 Sep 2014 03:29:03 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 23 Sep 2014 06:29:00 -0400
Message-ID: <b9a6d59d1ea54bfc8ff79b2d68b0d9df4cc6108a.1411467020.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1411467020.git.wenzong.fan@windriver.com>
References: <cover.1411467020.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] systemtap: disable libvirt
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
X-List-Received-Date: Tue, 23 Sep 2014 10:29:08 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

libvirt is automatically linked to if present, this undetermined
dependency may cause build errors like:

  ../lib/libvirt.so: undefined reference to `libssh2_channel_open_ex'
  ../lib/libvirt.so: undefined reference to `libssh2_session_hostkey'
  ...

Both libvirt and libssh2 are not oe-core recipes for now, just disable
libvirt to fix this issue.

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 .../configure-allow-to-disable-libvirt.patch       |   39 ++++++++++++++++++++
 meta/recipes-kernel/systemtap/systemtap_git.bb     |    3 ++
 meta/recipes-kernel/systemtap/systemtap_git.inc    |    1 +
 3 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/configure-allow-to-disable-libvirt.patch

diff --git a/meta/recipes-kernel/systemtap/systemtap/configure-allow-to-disable-libvirt.patch b/meta/recipes-kernel/systemtap/systemtap/configure-allow-to-disable-libvirt.patch
new file mode 100644
index 0000000..b4f2fbc
--- /dev/null
+++ b/meta/recipes-kernel/systemtap/systemtap/configure-allow-to-disable-libvirt.patch
@@ -0,0 +1,39 @@
+From 5eb10d90af9178edb65e6091ae939d1b5b19bb78 Mon Sep 17 00:00:00 2001
+From: Wenzong Fan <wenzong.fan@windriver.com>
+Date: Tue, 23 Sep 2014 04:47:10 -0400
+Subject: [PATCH] systemtap: allow to disable libvirt
+
+Upstream-Status: Pending
+
+Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
+---
+ configure.ac |   13 +++++++++----
+ 1 file changed, 9 insertions(+), 4 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index a631ae7..cb4885b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -525,10 +525,15 @@ dnl Check for the libvirt and libxml2 devel packages
+ 
+ dnl We require libvirt >= 1.0.2 because stapvirt relies on the
+ dnl virDomainOpenChannel function, which was implemented in 1.0.2.
+-PKG_CHECK_MODULES([libvirt], [libvirt >= 1.0.2], [
+-   have_libvirt=yes
+-   AC_DEFINE([HAVE_LIBVIRT],[1],[Define to 1 if libvirt development libraries are installed])
+-   ], [have_libvirt=no])
++AC_ARG_ENABLE([libvirt],
++  AS_HELP_STRING([--disable-libvirt], [Do not use libvirt even if present]))
++
++if test "$enable_libvirt" != no; then
++  PKG_CHECK_MODULES([libvirt], [libvirt >= 1.0.2], [
++     have_libvirt=yes
++     AC_DEFINE([HAVE_LIBVIRT],[1],[Define to 1 if libvirt development libraries are installed])
++     ], [have_libvirt=no])
++fi
+ AM_CONDITIONAL([HAVE_LIBVIRT], [test "${have_libvirt}" = "yes"])
+ PKG_CHECK_MODULES([libxml2], [libxml-2.0], [
+    have_libxml2=yes
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipes-kernel/systemtap/systemtap_git.bb
index 488d417..d0dd42a 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
@@ -20,6 +20,9 @@ STAP_DOCS ?= "--disable-docs --disable-publican --disable-refdocs"
 
 EXTRA_OECONF += "${STAP_DOCS} "
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[libvirt] = "--enable-libvirt,--disable-libvirt,libvirt"
+
 inherit autotools gettext pkgconfig
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
index 33aa136..f81e8ba 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -8,6 +8,7 @@ SRC_URI = "git://sourceware.org/git/systemtap.git \
            file://obsolete_automake_macros.patch \
            file://system_map_location.patch \
            file://tapset-linux-sendfile-syscall.patch \
+           file://configure-allow-to-disable-libvirt.patch \
           "
 
 # systemtap doesn't support mips
-- 
1.7.9.5


