Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web09.5604.1622190695291254516
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 May 2021 01:31:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: changqing.li@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 14S8VWBN030759
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Fri, 28 May 2021 01:31:34 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Fri, 28 May 2021 01:31:32 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.10 via Frontend Transport; Fri, 28 May 2021 01:31:31 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] bash: fix non-fatal error in log.do_configure
Date: Fri, 28 May 2021 16:29:55 +0800
Message-ID: <20210528082955.6819-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

error in log.do_configure:
ERROR: invalid first argument to AM_GNU_GETTEXT
ERROR: Use of AM_GNU_GETTEXT without [external] argument is no longer supported.

autotools.bbclass removes aclocal.m4 and regenerate it, but used
gettext.m4 is different version with the local one included in source
tree, and the defination is different. Make configure.ac to use
correct argument.

upstream commit to remove argument no-libtool:
http://git.savannah.gnu.org/gitweb/?p=gettext.git;a=commit;h=ed4cb97d6336f193f1aabe479f916469c26611e8

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...001-configure.ac-fix-non-fatal-error.patch | 37 +++++++++++++++++++
 meta/recipes-extended/bash/bash_5.1.bb        |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-extended/bash/bash/0001-configure.ac-fix-non-fatal-error.patch

diff --git a/meta/recipes-extended/bash/bash/0001-configure.ac-fix-non-fatal-error.patch b/meta/recipes-extended/bash/bash/0001-configure.ac-fix-non-fatal-error.patch
new file mode 100644
index 0000000000..bf0e6fbf40
--- /dev/null
+++ b/meta/recipes-extended/bash/bash/0001-configure.ac-fix-non-fatal-error.patch
@@ -0,0 +1,37 @@
+From e2bad7fa39f7234d54a7844c520d453d0e6f91f1 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Fri, 28 May 2021 15:14:50 +0800
+Subject: [PATCH] configure.ac: fix non fatal error
+
+fix non-fatal error in log.do_configure:
+ERROR: invalid first argument to AM_GNU_GETTEXT
+ERROR: Use of AM_GNU_GETTEXT without [external] argument is no longer supported.
+
+autotools.bbclass removes aclocal.m4 and regenerate it, but used
+gettext.m4 is different version with the local one included in source
+tree, and the defination is different. correct configure.ac to use
+correct argument.
+
+Upstream-Status: Inappropriate [oe-specific]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 77217ae..2c46ccd 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -703,7 +703,7 @@ AC_C_VOLATILE
+ AC_C_RESTRICT
+ 
+ dnl initialize GNU gettext
+-AM_GNU_GETTEXT([no-libtool], [need-ngettext], [lib/intl])
++AM_GNU_GETTEXT([use-libtool], [need-ngettext], [lib/intl])
+ 
+ dnl header files
+ AC_HEADER_DIRENT
+-- 
+2.17.1
+
diff --git a/meta/recipes-extended/bash/bash_5.1.bb b/meta/recipes-extended/bash/bash_5.1.bb
index e5e013b734..3e4a74553c 100644
--- a/meta/recipes-extended/bash/bash_5.1.bb
+++ b/meta/recipes-extended/bash/bash_5.1.bb
@@ -18,6 +18,7 @@ SRC_URI = "${GNU_MIRROR}/bash/${BP}.tar.gz;name=tarball \
            file://fix-run-builtins.patch \
            file://use_aclocal.patch \
            file://makerace.patch \
+           file://0001-configure.ac-fix-non-fatal-error.patch \
            "
 
 SRC_URI[tarball.sha256sum] = "cc012bc860406dcf42f64431bcd3d2fa7560c02915a601aba9cd597a39329baa"
-- 
2.17.1

