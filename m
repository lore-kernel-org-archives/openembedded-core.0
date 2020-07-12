Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
 by mx.groups.io with SMTP id smtpd.web10.1629.1594518306209128354
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Jul 2020 18:45:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista-com.20150623.gappssmtp.com header.s=20150623 header.b=2CsIauGL;
 spf=permerror, err=parse error for token &{10 18 websitewelcome.com}: parse error for token &{10 18 _spf.google.com}: limit exceeded (domain: mvista.com, ip: 209.85.216.65, mailfrom: rahulk@mvista.com)
Received: by mail-pj1-f65.google.com with SMTP id cv18so5649220pjb.1
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Jul 2020 18:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=v2WG8Pi+2XB1G/K9wCVeekR/tCVptSEaU2aI4k0yzW8=;
        b=2CsIauGLAJyABiy4gXFZ+F7fbCJjj0lRiC0j9v+cjYw32QTwkPF2nEgFV0ixu95fBk
         UyLpH1fFihJ3dAdN9cfnIaFknhtMcaXwWIOeFaGXo+H4Mfk5Fr+PrcgXpgpsmHJctw2I
         AuOKXqoOyTRHEy7H/gsui4fWv3wpVvStaFc/3HNtw4O6GbfAPzpngD8VGU+5j4twG5pS
         MZKFYjY50MTFESGYqQAMB80m+G1bqcLVBoBdpWG99MN717t6+iuB+dolTR/ci6Eyu/Z3
         DxovS4WRLJZVTFjiA2e1wc0cwXMAT87+kOzJT1U4I4rlghoXaeEYdvGoKX2x7SvahnWL
         /+Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=v2WG8Pi+2XB1G/K9wCVeekR/tCVptSEaU2aI4k0yzW8=;
        b=XR9yMaaoi7CKNRepWaYC9459DE492ijKZJOs3U9vRiTuMW/S9affeyBcVL+rSuvyCs
         WdeB7uzwVnZq2RwCx1Xqe3UVtvbwuSbpF6lQGrkeSLRJhJDwkmGeBDJMNNuLmwoPSCWN
         vBjsRDWSrAYjv9wMhgEvhJdoGGK4DMOB4evkq0S7scmvdUg+GoD7VO/waup4xMYhrlvd
         ExO/1mtg7d627n30Z9CuIFEX/E9HIO8Bu/4c3GEn6K2ZytGoVjC64vuh63d3w3nwMfyy
         TvpweXHqikv/D4BZSaAaHxwUKCzacr1dHSaqKS6dNOYHIGf3e1yp226hRKf8W5n/6KYO
         6zpw==
X-Gm-Message-State: AOAM530s86JBG+VD+6bLiCL8m+gvg764u88n8EHu/N+ePyD2XQ3aS/Su
	yDgPgRFiKs8QV1HSmcuaKJOOrhT4kxfyPA==
X-Google-Smtp-Source: ABdhPJxzVxRCd2FKemKr/jgxSBSs7h/sDjTD/xr1F6mZCDakcaxpl/qJWqeNftN0XRy8jZwPSs8DNg==
X-Received: by 2002:a17:90a:8c0e:: with SMTP id a14mr12752173pjo.75.1594518305266;
        Sat, 11 Jul 2020 18:45:05 -0700 (PDT)
Return-Path: <rahulk@mvista.com>
Received: from CelSys065.mvista.com ([103.217.132.76])
        by smtp.gmail.com with ESMTPSA id c1sm10648528pje.9.2020.07.11.18.45.02
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 11 Jul 2020 18:45:04 -0700 (PDT)
From: "Rahul Kumar" <rahulk@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Rahul Kumar <rahulk@mvista.com>
Subject: [dunfell][PATCH v2] busybox: Security Fix For CVE-2018-1000500
Date: Sun, 12 Jul 2020 07:14:53 +0530
Message-Id: <1594518293-6014-1-git-send-email-rahulk@mvista.com>
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
index 0000000..d1a33e4
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
+Upstream-Status: Backport [https://git.busybox.net/busybox/commit/?id=45fa3f18adf57ef9d743038743d9c90573aeeb91]
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

