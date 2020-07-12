Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
 by mx.groups.io with SMTP id smtpd.web12.1271.1594516917268074174
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Jul 2020 18:21:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista-com.20150623.gappssmtp.com header.s=20150623 header.b=xwiKpYuo;
 spf=permerror, err=parse error for token &{10 18 websitewelcome.com}: parse error for token &{10 18 _spf.google.com}: limit exceeded (domain: mvista.com, ip: 209.85.214.193, mailfrom: rahulk@mvista.com)
Received: by mail-pl1-f193.google.com with SMTP id b9so3953940plx.6
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Jul 2020 18:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=BvyErwEM+H9smFlOFEf/StMmP/Xw6LdGM7bWu7f5xao=;
        b=xwiKpYuoxY8sBxotp7rveTMnevXrqPrC69hFKd6slfkgBWwWvIaz6NBudeckyAExTE
         Ody3ZEt2eNmHV9sOV1eWCSgUfu1AO5Ej8dQImrrFNW9zYCD57+y/t/udBqINJ/iZY+1c
         UgDxGZ7nlV/40qB52xAdnsKqf2ny7d5IZJMIBnHsSeY+OJVqdjcibswree+H2PsWeJxI
         zLWKOdJavo/e8A6gfk7lUuOSjv6qDMcoLvgRKnZ2qQ349txg0e/OYXr5t2SPz0bDqqrL
         QIOkzyNWkJZB3rklhaBMGRT3uvR0aKchWcKHjRo14YRE7nzxmBnw7fKiZ6MDHrVdRr9g
         VW8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=BvyErwEM+H9smFlOFEf/StMmP/Xw6LdGM7bWu7f5xao=;
        b=WhYnK9fZo9cSplqN29kvr8EfcaOzmMheHpFsO/7N8y6N3djTvbBeXSrV9pAu6Qm9Ao
         i/NtuH7FceLjmBzfqPqtKlc6Ri8E7mVggTCYYUXgdqCrMimcbOvbEBX26W9TLMSwQU+K
         CXSE7+g7K6RcAVFrRoWx7AzOog1MzOHpyoIkR7XgpTIj42rYfF7UdrZuEeI8gDHxvy7S
         iR8BbafBcSaj6tTnLIC5ai3U/cfUmokmark1uorHB1Na8EvNaHnXIURicQpmkoYiqQjn
         Z3pcN/mO/eXBnLrnyOu797svRygAzFTkzBvJgvGGFZ1cuPRNx3ttDXcIyzd7P/Hp/M8A
         Pfhw==
X-Gm-Message-State: AOAM533L9NPhyK2IGvbNxuckU5FSkR4KxcLhAKxDkiVJQLeKm6PU5NUL
	DFM2XdgbxVrxSYkrI3hYxUOcVT6p6oplLg==
X-Google-Smtp-Source: ABdhPJzt2/ddZ4C8OIUU2ruQcAXuRmqBH/g558hcyGo5INPgdPqFpW29itFRfUHRsFrMlou0WVxpCA==
X-Received: by 2002:a17:902:64c9:: with SMTP id y9mr20272346pli.289.1594516916269;
        Sat, 11 Jul 2020 18:21:56 -0700 (PDT)
Return-Path: <rahulk@mvista.com>
Received: from CelSys065.mvista.com ([103.217.132.76])
        by smtp.gmail.com with ESMTPSA id g8sm9731387pgr.70.2020.07.11.18.21.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 11 Jul 2020 18:21:55 -0700 (PDT)
From: "Rahul Kumar" <rahulk@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Rahul Kumar <rahulk@mvista.com>
Subject: [dunfell][PATCH] busybox: Security Fix For CVE-2018-1000500
Date: Sun, 12 Jul 2020 06:51:35 +0530
Message-Id: <1594516895-5308-1-git-send-email-rahulk@mvista.com>
X-Mailer: git-send-email 2.7.4

CVE: CVE-2018-1000500

Signed-off-by: Rahul Kumar <rahulk@mvista.com>
---
 .../busybox/busybox/busybox-CVE-2018-1000500.patch | 98 ++++++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.31.1.bb        |  1 +
 2 files changed, 99 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/busybox-CVE-2018-1000500.patch

diff --git a/meta/recipes-core/busybox/busybox/busybox-CVE-2018-1000500.patch b/meta/recipes-core/busybox/busybox/busybox-CVE-2018-1000500.patch
new file mode 100644
index 0000000..cde3923
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/busybox-CVE-2018-1000500.patch
@@ -0,0 +1,98 @@
+From 71e7e2fb35c806d20f9739d832cd9ae3a86fdee2 Mon Sep 17 00:00:00 2001
+From: Dimitri John Ledkov <xnox@ubuntu.com>
+Date: Tue, 19 May 2020 18:20:39 +0100
+Subject: [PATCH] wget: implement TLS verification with
+ ENABLE_FEATURE_WGET_OPENSSL
+
+When ENABLE_FEATURE_WGET_OPENSSL is enabled, correctly implement TLS
+verification by default. And only ignore verification errors, if
+--no-check-certificate was passed.
+
+Also note, that previously OPENSSL implementation did not implement
+TLS verification, nor printed any warning messages that verification
+was not performed.
+
+Bug-Ubuntu: https://bugs.launchpad.net/bugs/1879533
+
+CVE-2018-1000500
+
+Upstream Status: Backport https://git.busybox.net/busybox/commit/?id=45fa3f18adf57ef9d743038743d9c90573aeeb91
+CVE: CVE-2018-1000500
+
+Signed-off-by: Dimitri John Ledkov <xnox@ubuntu.com>
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+Signed-off-by: Rahul Kumar <rahulk@mvista.com>
+---
+ networking/wget.c | 20 +++++++++++++++++---
+ 1 file changed, 17 insertions(+), 3 deletions(-)
+
+diff --git a/networking/wget.c b/networking/wget.c
+index 9153264..a7e6deb 100644
+--- a/networking/wget.c
++++ b/networking/wget.c
+@@ -91,6 +91,9 @@
+ //config:	patches, but do want to waste bandwidth expaining how wrong
+ //config:	it is, you will be ignored.
+ //config:
++//config:	FEATURE_WGET_OPENSSL does implement TLS verification
++//config:	using the certificates available to OpenSSL.
++//config:
+ //config:config FEATURE_WGET_OPENSSL
+ //config:	bool "Try to connect to HTTPS using openssl"
+ //config:	default y
+@@ -115,6 +118,9 @@
+ //config:	If openssl can't be executed, internal TLS code will be used
+ //config:	(if you enabled it); if openssl can be executed but fails later,
+ //config:	wget can't detect this, and download will fail.
++//config:
++//config:	By default TLS verification is performed, unless
++//config:	--no-check-certificate option is passed.
+ 
+ //applet:IF_WGET(APPLET(wget, BB_DIR_USR_BIN, BB_SUID_DROP))
+ 
+@@ -124,8 +130,11 @@
+ //usage:	IF_FEATURE_WGET_LONG_OPTIONS(
+ //usage:       "[-c|--continue] [--spider] [-q|--quiet] [-O|--output-document FILE]\n"
+ //usage:       "	[-o|--output-file FILE] [--header 'header: value'] [-Y|--proxy on/off]\n"
++//usage:	IF_FEATURE_WGET_OPENSSL(
++//usage:       "	[--no-check-certificate]\n"
++//usage:	)
+ /* Since we ignore these opts, we don't show them in --help */
+-/* //usage:    "	[--no-check-certificate] [--no-cache] [--passive-ftp] [-t TRIES]" */
++/* //usage:    "	[--no-cache] [--passive-ftp] [-t TRIES]" */
+ /* //usage:    "	[-nv] [-nc] [-nH] [-np]" */
+ //usage:       "	[-P DIR] [-S|--server-response] [-U|--user-agent AGENT]" IF_FEATURE_WGET_TIMEOUT(" [-T SEC]") " URL..."
+ //usage:	)
+@@ -137,7 +146,9 @@
+ //usage:       "Retrieve files via HTTP or FTP\n"
+ //usage:	IF_FEATURE_WGET_LONG_OPTIONS(
+ //usage:     "\n	--spider	Only check URL existence: $? is 0 if exists"
+-///////:     "\n	--no-check-certificate	Don't validate the server's certificate"
++//usage:	IF_FEATURE_WGET_OPENSSL(
++//usage:     "\n	--no-check-certificate	Don't validate the server's certificate"
++//usage:	)
+ //usage:	)
+ //usage:     "\n	-c		Continue retrieval of aborted transfer"
+ //usage:     "\n	-q		Quiet"
+@@ -662,7 +673,7 @@ static int spawn_https_helper_openssl(const char *host, unsigned port)
+ 	pid = xvfork();
+ 	if (pid == 0) {
+ 		/* Child */
+-		char *argv[8];
++		char *argv[9];
+ 
+ 		close(sp[0]);
+ 		xmove_fd(sp[1], 0);
+@@ -689,6 +700,9 @@ static int spawn_https_helper_openssl(const char *host, unsigned port)
+ 			argv[5] = (char*)"-servername";
+ 			argv[6] = (char*)servername;
+ 		}
++		if (!(option_mask32 & WGET_OPT_NO_CHECK_CERT)) {
++			argv[7] = (char*)"-verify_return_error";
++		}
+ 
+ 		BB_EXECVP(argv[0], argv);
+ 		xmove_fd(3, 2);
+-- 
+2.7.4
+
diff --git a/meta/recipes-core/busybox/busybox_1.31.1.bb b/meta/recipes-core/busybox/busybox_1.31.1.bb
index 2bb1d59..a6b4702 100644
--- a/meta/recipes-core/busybox/busybox_1.31.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.31.1.bb
@@ -48,6 +48,7 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://0001-Remove-syscall-wrappers-around-clock_gettime-closes-.patch \
            file://0001-Remove-stime-function-calls.patch \
            file://0001-sysctl-ignore-EIO-of-stable_secret-below-proc-sys-ne.patch \
+           file://busybox-CVE-2018-1000500.patch \
 "
 SRC_URI_append_libc-musl = " file://musl.cfg "
 
-- 
2.7.4

