Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B777B6A456
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jun 2013 08:32:48 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r568WnJO000735
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 6 Jun 2013 01:32:49 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.158) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Thu, 6 Jun 2013 01:32:49 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 6 Jun 2013 16:32:50 +0800
Message-ID: <d0a35bd3efbf5e528ea24b4682d6de6d7afe2720.1370506099.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1370506099.git.rongqing.li@windriver.com>
References: <cover.1370506099.git.rongqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] socat: enable termios
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
X-List-Received-Date: Thu, 06 Jun 2013 08:32:48 -0000
Content-Type: text/plain

From: "Roy.Li" <rongqing.li@windriver.com>

fix two cross-compile issue to enable termios:
1. Define ac_cv_ispeed_offset in EXTRA_OECONF to avoid to call AC_TRY_RUN()
on cross-compile environment.
2. fix autoheader to generate *_SHIFT macros

Signed-off-by: Roy.Li <rongqing.li@windriver.com>
---
 .../socat/files/fix-xxx_SHIFT-autoheader.patch     |   40 ++++++++++++++++++++
 meta/recipes-connectivity/socat/socat_1.7.2.1.bb   |   15 ++++++--
 2 files changed, 52 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-connectivity/socat/files/fix-xxx_SHIFT-autoheader.patch

diff --git a/meta/recipes-connectivity/socat/files/fix-xxx_SHIFT-autoheader.patch b/meta/recipes-connectivity/socat/files/fix-xxx_SHIFT-autoheader.patch
new file mode 100644
index 0000000..44659a0
--- /dev/null
+++ b/meta/recipes-connectivity/socat/files/fix-xxx_SHIFT-autoheader.patch
@@ -0,0 +1,40 @@
+Subject: [PATCH] fix autoheader for *_SHIFT values.
+
+Upstream-Status: Pending
+
+autoheader would not generate C `#define' statements if
+the first param of AC_DEFINE_UNQUOTED is a shell variable.
+This will cause build failures while enable termios, so
+expand these AC_DEFINE_UNQUOTED from the macro.
+
+Signed-off-by: Xin Ouyang <Xin.Ouyang@windriver.com>
+---
+ configure.in |    5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/configure.in b/configure.in
+index c54e4c4..13bae64 100644
+--- a/configure.in
++++ b/configure.in
+@@ -1335,8 +1335,6 @@ AC_CACHE_CHECK(shift offset of $1, $2,
+  [$2=-1]
+ )
+  LIBS="$LIBS1"])
+-SHIFT_NAME="$1"_SHIFT
+-AC_DEFINE_UNQUOTED($SHIFT_NAME, ${$2}, [foo])
+ if test "$2" = -1; then
+ AC_MSG_WARN(please determine $1_SHIFT manually)
+ fi
+@@ -1346,6 +1344,9 @@ AC_SHIFT_OFFSET(CRDLY,  sc_cv_sys_crdly_shift)
+ AC_SHIFT_OFFSET(TABDLY, sc_cv_sys_tabdly_shift)
+ AC_SHIFT_OFFSET(CSIZE,  sc_cv_sys_csize_shift)
+ 
++AC_DEFINE_UNQUOTED(CRDLY_SHIFT, ${sc_cv_sys_crdly_shift}, [shift for CRDLY, carriage return delay])
++AC_DEFINE_UNQUOTED(TABDLY_SHIFT, ${sc_cv_sys_tabdly_shift}, [shift for TABDLY, horizontal tab delay])
++AC_DEFINE_UNQUOTED(CSIZE_SHIFT, ${sc_cv_sys_csize_shift}, [shift for CSIZE, character size])
+ 
+ dnl find what physical type (basic C type) is equivalent to the given type.
+ dnl arg1: include file(s)
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-connectivity/socat/socat_1.7.2.1.bb b/meta/recipes-connectivity/socat/socat_1.7.2.1.bb
index 950e1e5..43c2d58 100644
--- a/meta/recipes-connectivity/socat/socat_1.7.2.1.bb
+++ b/meta/recipes-connectivity/socat/socat_1.7.2.1.bb
@@ -13,15 +13,24 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 PR = "r0"
 SRC_URI = "http://www.dest-unreach.org/socat/download/socat-${PV}.tar.bz2;name=src \
-           file://compile.patch"
+           file://compile.patch \
+           file://fix-xxx_SHIFT-autoheader.patch"
+
+EXTRA_OECONF += "ac_cv_have_z_modifier=yes sc_cv_sys_crdly_shift=9 \
+        sc_cv_sys_tabdly_shift=11 sc_cv_sys_csize_shift=4 \
+        ac_cv_ispeed_offset=13 \
+"
 
 SRC_URI[src.md5sum] = "7ddfea7e9e85f868670f94d3ea08358b"
 SRC_URI[src.sha256sum] = "faea2ed6c63bb97a59237fd43b7c35ad248317297e8bfeb2e6f2ec1e6bc58277"
 
-EXTRA_OECONF = " --disable-termios "
-
 inherit autotools
 
+do_configure_prepend() {
+    sed '/AC_DEFINE_UNQUOTED(ISPEED_OFFSET/a\AC_DEFINE(OSPEED_OFFSET,\
+(ISPEED_OFFSET+1)\ ,\ [have\ ospeed\ offset])' -i ${S}/configure.in
+}
+
 do_install_prepend () {
     mkdir -p ${D}${bindir}
     install -d ${D}${bindir} ${D}${mandir}/man1
-- 
1.7.10.4


