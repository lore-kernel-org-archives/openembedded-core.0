Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A567173CF7
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Apr 2016 09:22:15 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u379MFiL020066
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Apr 2016 02:22:15 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.210) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Thu, 7 Apr 2016 02:22:14 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 7 Apr 2016 17:22:58 +0800
Message-ID: <ca141106b28e9f213b0965de589507300ccbbca3.1460020929.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1460020929.git.Qi.Chen@windriver.com>
References: <cover.1460020929.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] grub2: fix do_configure failure when largefile is not in DISTRO_FEATURES
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
X-List-Received-Date: Thu, 07 Apr 2016 09:22:18 -0000
Content-Type: text/plain

When 'largefile' is not in DISTRO_FEATURES, '--disable-largefile' is passed
to the configure options. However, the configure script checks the size
of off_t regardless of this option. This raises the following error.

  configure: error: Large file support is required

This patch fixes the above problem.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...-configure.ac-support-disabling-largefile.patch | 44 ++++++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc                    |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/0001-configure.ac-support-disabling-largefile.patch

diff --git a/meta/recipes-bsp/grub/files/0001-configure.ac-support-disabling-largefile.patch b/meta/recipes-bsp/grub/files/0001-configure.ac-support-disabling-largefile.patch
new file mode 100644
index 0000000..e22dc00
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0001-configure.ac-support-disabling-largefile.patch
@@ -0,0 +1,44 @@
+Upstream-Status: Pending
+
+Subject: configure.ac: support disabling largefile
+
+Do not check off_t size when largefile is disabled.
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ configure.ac | 19 ++++++++++++-------
+ 1 file changed, 12 insertions(+), 7 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index df20991..14ff7ac 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -306,13 +306,18 @@ if test x$grub_cv_apple_cc = xyes ; then
+   HOST_LDFLAGS="$HOST_LDFLAGS -Wl,-allow_stack_execute"
+ fi
+ 
+-case "$host_os" in
+-  cygwin | windows* | mingw32* | aros*)
+-     ;;
+-  *)
+-     AC_CHECK_SIZEOF(off_t)
+-     test x"$ac_cv_sizeof_off_t" = x8 || AC_MSG_ERROR([Large file support is required]);;
+-esac
++AC_ARG_ENABLE([largefile],
++              [AS_HELP_STRING([--enable-largefile],
++                             [Enable large file support (default=guessed)])])
++if test x"$enable_largefile" = xyes ; then
++  case "$host_os" in
++    cygwin | windows* | mingw32* | aros*)
++       ;;
++    *)
++       AC_CHECK_SIZEOF(off_t)
++       test x"$ac_cv_sizeof_off_t" = x8 || AC_MSG_ERROR([Large file support is required]);;
++  esac
++fi
+ 
+ if test x$USE_NLS = xno; then
+   HOST_CFLAGS="$HOST_CFLAGS -fno-builtin-gettext"
+-- 
+1.9.1
+
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 146dde6..6cd8d36 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -30,6 +30,7 @@ SRC_URI = "ftp://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
            file://0001-Fix-CVE-2015-8370-Grub2-user-pass-vulnerability.patch \
            file://0001-Remove-direct-_llseek-code-and-require-long-filesyst.patch \
            file://fix-texinfo.patch \
+           file://0001-configure.ac-support-disabling-largefile.patch \
             "
 
 DEPENDS = "flex-native bison-native"
-- 
1.9.1


