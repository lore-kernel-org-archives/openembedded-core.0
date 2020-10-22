Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.785.1603381997085595025
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Oct 2020 08:53:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=G3k1RGE0;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id h4so1200198pjk.0
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2020 08:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=8QVIzktUg1aNIOxAKEkBLHZI6cUe3F0nSYUlFpC/dRs=;
        b=G3k1RGE0kQB+/BWLO4xLJeRx+BB5yJupLzoPkdHsIexi5kOtsuYC8CEAe2ABXN1/B/
         FdGDiYnMQxNLjc5t6t+mbsVyRKrznszESoOj1v8MraR/2W10yROzMjWNJRKdqlUrA0uD
         peefXQwPoFiJFtI0LmNMh2XCDOPgAVAwULC0tCHvDkZKCa2G5T18bHCeslNpiO8Xse+z
         Srvq4gPr21/WrE327V5MXfn+vdcccb0dauVcySFv1xPR6P+eE4Banw1rNhzOLMRABxAt
         HVVYYyiOQLr9O6kvNP1Kx9dK4zhnhm+k+Hqu5BHj8CfzxCj6fGAvN0Eco/wbdKNF6Uyv
         ZrMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=8QVIzktUg1aNIOxAKEkBLHZI6cUe3F0nSYUlFpC/dRs=;
        b=ElVysPGG4csy4b6dlbOPY0FavYfykLVYhh80A3YYUz8dzXJSfEBv3WJQnc57pBPdP0
         xhJhMDnwwu/qdVTCTGlHsHdP3fMpswa431U4IXCaFDH3kSeKKoHhqG6KTxoNxv2zmF6J
         yFZD+DQlnbbqVXgYkVOVzpdDH12PcVH1dCmKx3PFFb1I2YZUeEcyeWWMnuftc8YyQrY7
         D8/baw1IS3FNpDBFgltCcw2NCKVuc1bzmVoLBv2GOH6D11GvNZkazD4hWgwq0eqy0SY7
         czVWDRfyNROMIXWdjv5SBDTzwW3AVxaS8MNQUBj74LS1YiwijcD3V0YLGyqA1Fqa6eWr
         QiEg==
X-Gm-Message-State: AOAM533dKzbtG+AVOgsEt2z1jDvzIqxQN13kBZLUNoZS2yZigZnVKkdp
	0eWDurX5GPkVkmp9n0AVzc/OvTdwFB4myt8U
X-Google-Smtp-Source: ABdhPJwAHSEkLv2rT4Nuo5Ub7DUN7paz12xsQxChVF6gbLgkhps+NNj85YWzzpe4dLpOOqsgppLICw==
X-Received: by 2002:a17:902:a70a:b029:d3:b4d2:32c3 with SMTP id w10-20020a170902a70ab02900d3b4d232c3mr2946763plq.66.1603381996024;
        Thu, 22 Oct 2020 08:53:16 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id kc21sm2423558pjb.36.2020.10.22.08.53.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2020 08:53:15 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 11/14] grub2: fix CVE-2020-10713
Date: Thu, 22 Oct 2020 05:51:44 -1000
Message-Id: <0a22c2a37f5971ea472894fcd83044feda807cb1.1603381705.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1603381704.git.steve@sakoman.com>
References: <cover.1603381704.git.steve@sakoman.com>

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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

