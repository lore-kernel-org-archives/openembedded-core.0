Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71633C32789
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 22:36:38 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web10.4535.1661294179804728120
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 15:36:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=DzqNEko0;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id g18so15333336pju.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 15:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=N2+5+PV1hkwtFVqsfTYOKeplUwU17dxssXoKw1V8hqQ=;
        b=DzqNEko0F7uz0wHYm4L2irqXtnUgrLs+gjav7MdVApMzAosMln73+WaZLaFbVaG1+U
         N8u04qMZRa9D1P3YmJTY/+xoIkfD4P35MN4DdpqRmC+MeWA2wENZYLWxplOO3Mau0oOb
         NFItCKIu23xpYyij298XAarGWPFhcV7y3Wu6gyws39P0rRxQhqikbSbS4s33GRuhxEbJ
         8oqfFy54j/gS+lSbn0zI4D/KwlKiskmaZgi8NaJVVP7VLBSOkZzrKqFdKzpOSBKHb7NZ
         8FHEpQnaag3sYxWKiLS2K5rQRon+pA6KASkMg5Om9kJWdzUvjyt8UZXZRCj8/xeeOIun
         JS7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=N2+5+PV1hkwtFVqsfTYOKeplUwU17dxssXoKw1V8hqQ=;
        b=yA+yQ4xwTw2ZpYT26p08gukbZj0aE4QH2GTtQ+yALYJCW8sy+/5O5GBBCS2wjb0Uoe
         06cozRi8TN/xLMMp4p3iW11N72f+s2iko8zb8hhCr66lHXXeYgETulqE4HSTAT9iBQha
         eF04F9aPa0E3Rj/w9Tg+cOZo1Cx/qNzjCaD5jrfm0748TKlVSYsX8XPn5u5zGhxj+mzA
         MDL2LNdr73LeqI+PkNH8INRKdr+XA/YpoW4+O0pfVmoxEoYNNA4MqIDD978ys+LIJ3oI
         xcrbouXjka2b2h3gzoSd1a9ni0A6nWPe+CfY4Q6hiNPSpb9Yqtab+OdzJihbYpVanJfw
         FaXg==
X-Gm-Message-State: ACgBeo052ByjGLfXP7d4Qk4ymXdExgNNM+Nacp4w6/R8xwdV2bWYyw17
	2Be0Q7KejtlNHIphjPbvi7WhJOLZxmV2WrYN
X-Google-Smtp-Source: 
 AA6agR5ryWjBh1CRtpo3KL45Neh4MDfQvpllsccSDgPhLsMId/TcZsMZ6KsUkIkYfbF0+hB4xPJRQA==
X-Received: by 2002:a17:90a:d982:b0:1fb:aec:e8db with SMTP id
 d2-20020a17090ad98200b001fb0aece8dbmr5152920pjv.148.1661294192264;
        Tue, 23 Aug 2022 15:36:32 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 p4-20020a1709026b8400b001729da53673sm11042141plk.14.2022.08.23.15.36.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 15:36:31 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 21/28] tcp-wrappers: Fix
 implicit-function-declaration warnings
Date: Tue, 23 Aug 2022 12:35:33 -1000
Message-Id: 
 <a5555a2d38521ef1c8d93676fbc2f6fec3558160.1661293746.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1661293745.git.steve@sakoman.com>
References: <cover.1661293745.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Aug 2022 22:36:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169753

From: Khem Raj <raj.khem@gmail.com>

This is seen with clang-15+

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4b882afd6c1a67b48cf4e7ace95d46ca2ff12aa0)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...plicit-function-declaration-warnings.patch | 109 ++++++++++++++++++
 .../tcp-wrappers/tcp-wrappers_7.6.bb          |   1 +
 2 files changed, 110 insertions(+)
 create mode 100644 meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/0001-Fix-implicit-function-declaration-warnings.patch

diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/0001-Fix-implicit-function-declaration-warnings.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/0001-Fix-implicit-function-declaration-warnings.patch
new file mode 100644
index 0000000000..ec793ac8ff
--- /dev/null
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/0001-Fix-implicit-function-declaration-warnings.patch
@@ -0,0 +1,109 @@
+From 9c97b5db237a793e0d1b6b0241570bdc6e35ee24 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 7 Aug 2022 17:42:24 -0700
+Subject: [PATCH] Fix implicit-function-declaration warnings
+
+These are seen with clang-15+
+
+Upstream-Status: Inappropriate [upstream is dead]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ hosts_access.c | 3 +++
+ safe_finger.c  | 1 +
+ shell_cmd.c    | 3 +++
+ tcpd.c         | 2 +-
+ tcpdchk.c      | 1 +
+ workarounds.c  | 1 +
+ 6 files changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/hosts_access.c b/hosts_access.c
+index 0133e5e..58697ea 100644
+--- a/hosts_access.c
++++ b/hosts_access.c
+@@ -33,6 +33,7 @@ static char sccsid[] = "@(#) hosts_access.c 1.21 97/02/12 02:13:22";
+ #endif
+ #include <netinet/in.h>
+ #include <arpa/inet.h>
++#include <rpcsvc/ypclnt.h>
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <syslog.h>
+@@ -45,6 +46,8 @@ static char sccsid[] = "@(#) hosts_access.c 1.21 97/02/12 02:13:22";
+ #endif
+ 
+ extern int errno;
++extern int match_pattern_ylo(const char *s, const char *pattern);
++extern unsigned long cidr_mask_addr(char* str);
+ 
+ #ifndef	INADDR_NONE
+ #define	INADDR_NONE	(-1)		/* XXX should be 0xffffffff */
+diff --git a/safe_finger.c b/safe_finger.c
+index 23afab1..a6458fb 100644
+--- a/safe_finger.c
++++ b/safe_finger.c
+@@ -34,6 +34,7 @@ static char sccsid[] = "@(#) safe_finger.c 1.4 94/12/28 17:42:41";
+ #include <syslog.h>
+ 
+ extern void exit();
++extern int pipe_stdin(char  **argv);
+ 
+ /* Local stuff */
+ 
+diff --git a/shell_cmd.c b/shell_cmd.c
+index 62d31bc..a566092 100644
+--- a/shell_cmd.c
++++ b/shell_cmd.c
+@@ -16,10 +16,13 @@ static char sccsid[] = "@(#) shell_cmd.c 1.5 94/12/28 17:42:44";
+ 
+ #include <sys/types.h>
+ #include <sys/param.h>
++#include <sys/wait.h>
++#include <fcntl.h>
+ #include <signal.h>
+ #include <stdio.h>
+ #include <syslog.h>
+ #include <string.h>
++#include <unistd.h>
+ 
+ extern void exit();
+ 
+diff --git a/tcpd.c b/tcpd.c
+index dc9ff17..4353caa 100644
+--- a/tcpd.c
++++ b/tcpd.c
+@@ -46,7 +46,7 @@ void fix_options(struct request_info *);
+ int     allow_severity = SEVERITY;	/* run-time adjustable */
+ int     deny_severity = LOG_WARNING;	/* ditto */
+ 
+-main(argc, argv)
++void main(argc, argv)
+ int     argc;
+ char  **argv;
+ {
+diff --git a/tcpdchk.c b/tcpdchk.c
+index 5dca8bd..67c12ce 100644
+--- a/tcpdchk.c
++++ b/tcpdchk.c
+@@ -38,6 +38,7 @@ static char sccsid[] = "@(#) tcpdchk.c 1.8 97/02/12 02:13:25";
+ 
+ extern int errno;
+ extern void exit();
++extern unsigned long cidr_mask_addr(char* str);
+ extern int optind;
+ extern char *optarg;
+ 
+diff --git a/workarounds.c b/workarounds.c
+index b22b378..6335049 100644
+--- a/workarounds.c
++++ b/workarounds.c
+@@ -21,6 +21,7 @@ char    sccsid[] = "@(#) workarounds.c 1.6 96/03/19 16:22:25";
+ #include <stdio.h>
+ #include <syslog.h>
+ #include <string.h>
++#include <unistd.h>
+ 
+ extern int errno;
+ 
+-- 
+2.37.1
+
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb b/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
index 814d7fd913..8137d257c8 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
@@ -50,6 +50,7 @@ SRC_URI = "http://ftp.porcupine.org/pub/security/tcp_wrappers_${PV}.tar.gz \
            file://fix_warnings.patch \
            file://fix_warnings2.patch \
            file://0001-Remove-fgets-extern-declaration.patch \
+           file://0001-Fix-implicit-function-declaration-warnings.patch \
            "
 
 SRC_URI[md5sum] = "e6fa25f71226d090f34de3f6b122fb5a"
-- 
2.25.1


