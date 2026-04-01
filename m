Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C6DA10FCAE4
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 21:06:27 +0000 (UTC)
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2182.1775077586307908987
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 14:06:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=kZrWrXF5;
 spf=pass (domain: gmail.com, ip: 74.125.82.171, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2c54c68db4dso401012eec.0
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 14:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775077585; x=1775682385; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NgFVNwsj+eIN85Jz6PyfCeDVfWXUxYrDGSYuz/4a+9s=;
        b=kZrWrXF5iCKze4cqMpZyKHNi2I4dRL5kPzudVC2X2vcQCBOe/cjCuZ7TOlh7EBQYnY
         mb+RirwFoIA86uHZDbAnRyPUiHRfMgqGOBnMzaBiBj9NbO2FcjbRau70jg7HM83RnatG
         aZKf1MqVNgUaztZRgcX4iawbdJoFs/bUxM1+kwnAD1F/xwR7SiDOiVrX+qJN3FxReEcD
         EryXzNaV2hWEHKKhXm2sQInC23j7ijwPOdqMnDK0NG7twKPpx+w0foy4IE9UxHh4qKKQ
         UV6hL4qrjCsIEa9sJ/jrzISYTYu7DjLbL8ENvIx9X5x7EzDwbUFTyzMxdF3G3JKN+xXm
         Q93Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775077585; x=1775682385;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NgFVNwsj+eIN85Jz6PyfCeDVfWXUxYrDGSYuz/4a+9s=;
        b=BNlCHL7BS4NStHHLBMCKWdpCsjuhC9QmGo9B3du0pg84jasusoS0d3bDwOpWrYdSEJ
         xw1gzTlnxk01LRS6ljAI9mlvL8deHdV5NigaxyXzvew6Hr9V837fF92stiT5MJachixc
         wg6sWOPLKF7leMDOumGwEGpSKbpCMPks6xswxI47q+MimxBYxg1vuTJUVDI6G0SRbNKO
         5JbCUcR6VFl0OZQIyzy07BcAwuFfIeRfESnx0iCnGDvHONbGBhHsE4yc9q/SXsHwXTZJ
         97s7NQEw0Sm/DIWdokslBlhV5qf+QvoRg2XVTcoS633NuWiSgFG58RPPnU1bGUuveYCM
         /PdQ==
X-Gm-Message-State: AOJu0Yws6Qls5KbfWVc/b5x8ARWyfFe0KCsZwVPMKxxUeV2j/HC+1U3e
	4G6JjW29x8P8sADryMyUloEgzAMOZwbfxG+a5LHIDtoEomlIcaomsxMpOJTObahhS9c=
X-Gm-Gg: ATEYQzz/JS/b7SJRxoVGJmNoAUD+i6Lwu0mNceXCC8UJtXlfugS/Agz6fbmkJuOCD6j
	JquENbzsW6eFvw1hEiXgT2UAD5y05EOS40r+NcZkbvh+croq4FC4mzx5byaLjnBox9TfoUi7Unf
	k5tINiq+OGkP3Yk97SsVHy80Q8CRmYJnkZqQbVP04wWnKUV3LwhNyietXevViqHhsG4krqmpD9N
	xDzNjksAy5cslYJ29+Vo54Nqe/kjQCJV4m375cvh1PM6RuaZ1ha5aFKL42G5oaENfgzBkvbvJ74
	E1YZ3hokj2vCQeS85T0007z+ASkk+qekRFji9AuiLQ6VqJrE91DT+Tp+8eM3ewG3DZRDjdqSS0U
	u6dxcCVaDS3bybMBBleUsZ9UkqFBVMnjzGp5LB203YYaxeKywe53hx5N6ImttgGSQfDvlyZVeIJ
	GR3hrUXw8GxNfNwD/Cs58nqnYy3olC4n5DQ0WXD8gwih0zwED0iiFcGm/RJ5PdR8vhkrSQuEuGW
	wgiWQSAHR/evR+2VPRmFWdzQUbwZ0emiiw8bBqRbEpzKQezhO8hzaOlUeUf
X-Received: by 2002:a05:7300:6d1f:b0:2c8:6361:ab58 with SMTP id 5a478bee46e88-2c931276e6amr3286816eec.13.1775077585231;
        Wed, 01 Apr 2026 14:06:25 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca78df8942sm1215009eec.2.2026.04.01.14.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 14:06:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH] lrzsz: Convert K&R function definitions to ANSI C prototypes
Date: Wed,  1 Apr 2026 14:06:21 -0700
Message-ID: <20260401210621.3438170-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 21:06:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234461

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...R-function-definitions-to-ANSI-C-pro.patch | 64 +++++++++++++++++++
 meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb       |  1 +
 2 files changed, 65 insertions(+)
 create mode 100644 meta/recipes-bsp/lrzsz/lrzsz-0.12.20/0001-lrzsz-convert-K-R-function-definitions-to-ANSI-C-pro.patch

diff --git a/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/0001-lrzsz-convert-K-R-function-definitions-to-ANSI-C-pro.patch b/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/0001-lrzsz-convert-K-R-function-definitions-to-ANSI-C-pro.patch
new file mode 100644
index 0000000000..afffc00bbd
--- /dev/null
+++ b/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/0001-lrzsz-convert-K-R-function-definitions-to-ANSI-C-pro.patch
@@ -0,0 +1,64 @@
+From bec790ecc4618b67604668601f84fa896476572c Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Wed, 1 Apr 2026 13:53:42 -0700
+Subject: [PATCH] lrzsz: convert K&R function definitions to ANSI C prototypes
+
+clang-22 with -std=gnu23 fails to build lrzsz because lib/long-options.c and
+lib/xstrtol.c still use old K&R-style function definitions, which
+newer toolchains reject.
+
+Rewrite parse_long_options() and __xstrtol() using standard prototype
+syntax so the sources compile cleanly with modern compilers.
+
+Upstream-Status: Submitted [https://github.com/UweOhse/lrzsz/pull/10]
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ lib/long-options.c | 11 ++++++-----
+ lib/xstrtol.c      | 12 ++++++------
+ 2 files changed, 12 insertions(+), 11 deletions(-)
+
+diff --git a/lib/long-options.c b/lib/long-options.c
+index 2c8d267..71d0e65 100644
+--- a/lib/long-options.c
++++ b/lib/long-options.c
+@@ -36,11 +36,12 @@ static struct option const long_options[] =
+ /* Process long options --help and --version, but only if argc == 2.
+    Be careful not to gobble up `--'.  */
+ void
+-parse_long_options (argc, argv,version, usage)
+-     int argc;
+-     char **argv;
+-     void (*version)();
+-     void (*usage)(int);
++parse_long_options (
++     int argc,
++     char **argv,
++     void (*version)(),
++     void (*usage)(int)
++)
+ {
+   int c;
+   int saved_opterr;
+diff --git a/lib/xstrtol.c b/lib/xstrtol.c
+index 0ab337d..a34e23b 100644
+--- a/lib/xstrtol.c
++++ b/lib/xstrtol.c
+@@ -68,12 +68,12 @@ extern int errno;
+ /* FIXME: comment.  */
+ 
+ strtol_error
+-__xstrtol (s, ptr, base, val, valid_suffixes)
+-     const char *s;
+-     char **ptr;
+-     int base;
+-     __unsigned long int *val;
+-     const char *valid_suffixes;
++__xstrtol (
++     const char *s,
++     char **ptr,
++     int base,
++     __unsigned long int *val,
++     const char *valid_suffixes)
+ {
+   char *t_ptr;
+   char **p;
diff --git a/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb b/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
index 777560bd22..042cf7fbac 100644
--- a/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
+++ b/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
@@ -20,6 +20,7 @@ SRC_URI = "https://www.ohse.de/uwe/releases/lrzsz-${PV}.tar.gz \
            file://include.patch \
            file://0001-Fix-cross-compilation-using-autoconf-detected-AR.patch \
            file://0001-Fix-build-with-GCC-15.patch \
+           file://0001-lrzsz-convert-K-R-function-definitions-to-ANSI-C-pro.patch \
            "
 SRC_URI[sha256sum] = "c28b36b14bddb014d9e9c97c52459852f97bd405f89113f30bee45ed92728ff1"
 

