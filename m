Received: from mga01.intel.com (mga01.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.12746.1603112401054954403
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2020 06:00:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: Sy/CpCD2vkmSfdReVMqOR9lKpDe36K5JYWm678UtOwGeWV4E+QagRl/oJVoRLmi0D73x9mDK9c
 j27IYc7v23Og==
X-IronPort-AV: E=McAfee;i="6000,8403,9778"; a="184632582"
X-IronPort-AV: E=Sophos;i="5.77,394,1596524400"; 
   d="scan'208";a="184632582"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2020 06:00:01 -0700
IronPort-SDR: 4ydp192dFf0AmoSWUXwWndPdqMxZRq7VYiDq50d5shkmtApYo30fWOcjveJvFJTRiAcEy76Otx
 G5wTLq578jeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,394,1596524400"; 
   d="scan'208";a="301360990"
Received: from unknown (HELO guest1-ubuntu1804.png.intel.com) ([10.221.183.51])
  by fmsmga008.fm.intel.com with ESMTP; 19 Oct 2020 06:00:00 -0700
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][dunfell 3/3] grub2: fix CVE-2020-10713
Date: Mon, 19 Oct 2020 20:59:57 +0800
Message-Id: <20201019125957.70874-3-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201019125957.70874-1-chee.yang.lee@intel.com>
References: <20201019125957.70874-1-chee.yang.lee@intel.com>

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../grub/files/CVE-2020-10713.patch           | 73 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 74 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2020-10713.patch

diff --git a/meta/recipes-bsp/grub/files/CVE-2020-10713.patch b/meta/recipes-bsp/grub/files/CVE-2020-10713.patch
new file mode 100644
index 0000000000..c507ed3ea8
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2020-10713.patch
@@ -0,0 +1,73 @@
+From a4d3fbdff1e3ca8f87642af2ac8752c30c617a3e Mon Sep 17 00:00:00 2001
+From: Peter Jones <pjones@redhat.com>
+Date: Wed, 15 Apr 2020 15:45:02 -0400
+Subject: yylex: Make lexer fatal errors actually be fatal
+
+When presented with a command that can't be tokenized to anything
+smaller than YYLMAX characters, the parser calls YY_FATAL_ERROR(errmsg),
+expecting that will stop further processing, as such:
+
+  #define YY_DO_BEFORE_ACTION \
+        yyg->yytext_ptr = yy_bp; \
+        yyleng = (int) (yy_cp - yy_bp); \
+        yyg->yy_hold_char = *yy_cp; \
+        *yy_cp = '\0'; \
+        if ( yyleng >= YYLMAX ) \
+                YY_FATAL_ERROR( "token too large, exceeds YYLMAX" ); \
+        yy_flex_strncpy( yytext, yyg->yytext_ptr, yyleng + 1 , yyscanner); \
+        yyg->yy_c_buf_p = yy_cp;
+
+The code flex generates expects that YY_FATAL_ERROR() will either return
+for it or do some form of longjmp(), or handle the error in some way at
+least, and so the strncpy() call isn't in an "else" clause, and thus if
+YY_FATAL_ERROR() is *not* actually fatal, it does the call with the
+questionable limit, and predictable results ensue.
+
+Unfortunately, our implementation of YY_FATAL_ERROR() is:
+
+   #define YY_FATAL_ERROR(msg)                     \
+     do {                                          \
+       grub_printf (_("fatal error: %s\n"), _(msg));     \
+     } while (0)
+
+The same pattern exists in yyless(), and similar problems exist in users
+of YY_INPUT(), several places in the main parsing loop,
+yy_get_next_buffer(), yy_load_buffer_state(), yyensure_buffer_stack,
+yy_scan_buffer(), etc.
+
+All of these callers expect YY_FATAL_ERROR() to actually be fatal, and
+the things they do if it returns after calling it are wildly unsafe.
+
+Fixes: CVE-2020-10713
+
+Signed-off-by: Peter Jones <pjones@redhat.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=a4d3fbdff1e3ca8f87642af2ac8752c30c617a3e]
+CVE: CVE-2020-10713
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ grub-core/script/yylex.l | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/grub-core/script/yylex.l b/grub-core/script/yylex.l
+index 7b44c37b7..b7203c823 100644
+--- a/grub-core/script/yylex.l
++++ b/grub-core/script/yylex.l
+@@ -37,11 +37,11 @@
+ 
+ /* 
+  * As we don't have access to yyscanner, we cannot do much except to
+- * print the fatal error.
++ * print the fatal error and exit.
+  */
+ #define YY_FATAL_ERROR(msg)                     \
+   do {                                          \
+-    grub_printf (_("fatal error: %s\n"), _(msg));     \
++    grub_fatal (_("fatal error: %s\n"), _(msg));\
+   } while (0)
+ 
+ #define COPY(str, hint)                         \
+-- 
+cgit v1.2.1
+
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index e796904f5b..e3d929a824 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -18,6 +18,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://autogen.sh-exclude-pc.patch \
            file://grub-module-explicitly-keeps-symbole-.module_license.patch \
            file://0001-grub.d-10_linux.in-add-oe-s-kernel-name.patch \
+           file://CVE-2020-10713.patch \
 "
 SRC_URI[md5sum] = "5ce674ca6b2612d8939b9e6abed32934"
 SRC_URI[sha256sum] = "f10c85ae3e204dbaec39ae22fa3c5e99f0665417e91c2cb49b7e5031658ba6ea"
-- 
2.17.1

