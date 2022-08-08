Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9224C19F2A
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 00:45:34 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web09.19913.1659919529232967042
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 17:45:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PqSvEB1D;
 spf=pass (domain: gmail.com, ip: 209.85.215.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id f65so7244339pgc.12
        for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 17:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=csi8DwrB3k/txh2CZdQ/xHpJdpQMnh+NdWBEtDm0N3s=;
        b=PqSvEB1DBG8dwzf1YeRiFWip5Nal6P2gbRLq+TcwyJf+y/9Q3FW4avAXl3mkW60Jsw
         ates+1S6FW76k7N/7zXhbzudPhyrBZYKEigc/1XClFjNEuZTKa3Ezt8YvdwMGA1yX+od
         FkJMAu+a98OOhY0A2RHBQjuCEjbOnkzkeUZ616dDQTiH/MS8pfv4ZeA1+fXdoJMmpq5J
         f9IyZX6XIEdGJA00G5j4MR8t86nn9ixLesN/wAM00BGyrXX8y/0fBrsR93eex0ASslre
         0mUelF5rEOxgUTi1L4Xi/UdJuNopwy2RBuflAA24hq5LECW60lwFtgBgKwj67ym2TzK5
         tG5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=csi8DwrB3k/txh2CZdQ/xHpJdpQMnh+NdWBEtDm0N3s=;
        b=ORMVbEmZl+K+W+/fue5k25NP4FG6XgdhYZ3P73wLpvItMq8SSu8Jd0JaG5VNc35zFC
         Rohi1PlQpstNEZIp+/X++PKwLuv4aRDvu2yI39CYzSe9UDrDafGRJvaqEN1hQs1oViD0
         GNilrsoRO/XNP24k8vxR6sJmPDbvUmZ3dpcuJ5IN1dz7xoRaKLn+zmhzrb0WeyIguLNf
         y6SlICKHoqmkvtETVhucB7P8yjNGosqdSpZjIQJa4aSRtnjoZG6oDCHHurrXoXl+a2x1
         SY6VDhonTfExgPKEXG2/vZQSWTVfCH96Tsa6B1lI4yhRX3Hnu/yNrNc/JELRmMjo6VXv
         KZoQ==
X-Gm-Message-State: ACgBeo0HXf+coz/7dNyBj9VCfuBYfktmPUyW90TIuA5rlNg8Q1Azkbpq
	g8PM08JZ+sXlYDvUDde056ApzB8cnqM=
X-Google-Smtp-Source: 
 AA6agR5//p5MIc0MYIsGeF2fVjQTZAVSCOq7typDckBH2Gnxq7O+Ni1mYiz7D1Hj421uM78kWLPOjA==
X-Received: by 2002:a63:5a58:0:b0:41c:7d4c:8fd5 with SMTP id
 k24-20020a635a58000000b0041c7d4c8fd5mr14177827pgm.92.1659919528158;
        Sun, 07 Aug 2022 17:45:28 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::9f45])
        by smtp.gmail.com with ESMTPSA id
 z5-20020a170902d54500b0016d338160d6sm7109053plf.155.2022.08.07.17.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Aug 2022 17:45:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] tcp-wrappers: Fix implicit-function-declaration warnings
Date: Sun,  7 Aug 2022 17:45:25 -0700
Message-Id: <20220808004525.1909493-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Aug 2022 00:45:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169010

This is seen with clang-15+

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...plicit-function-declaration-warnings.patch | 109 ++++++++++++++++++
 .../tcp-wrappers/tcp-wrappers_7.6.bb          |   1 +
 2 files changed, 110 insertions(+)
 create mode 100644 meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/0001-Fix-implicit-function-declaration-warnings.patch

diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/0001-Fix-implicit-function-declaration-warnings.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/0001-Fix-implicit-function-declaration-warnings.patch
new file mode 100644
index 00000000000..ec793ac8ffe
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
index 814d7fd9139..8137d257c82 100644
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
2.37.1


