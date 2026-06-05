Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B433CD8C8E
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 22:34:26 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6133.1780698862051745118
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jun 2026 15:34:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=RVTbFIc/;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4600ddc4017so1863613f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 15:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1780698860; x=1781303660; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GX2HkIAeN6+P6NJDa+VcSOqb89EPzCvSyhLttXVqluU=;
        b=RVTbFIc/Y6Biw4/OvTIu3DPwLsG1K1GayKtQM8HsD4mqhKQSEqpR/+8Wg+OXgXfQK0
         4Ebr9WjlDddQaob2GVs+VeQJQHriY9/Z7cQG4Wb2HXb46mqUHubmsJYOj8WYTfCbJKgK
         2r7evfGhEMi5AdxXZ02R2tEW64TdFLxu3P+7o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780698860; x=1781303660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GX2HkIAeN6+P6NJDa+VcSOqb89EPzCvSyhLttXVqluU=;
        b=Ma+83Hf6C+M85kQjPWFdtmRfQynnPZNQQIaYaiO+ivoCCNoH2vDXIbyQOFJouq8lTG
         g28gGFdERxEp+ctjlQhR/wRNFtXOv2HzpM9bSrQTziA/+XVnxluDQpmfxrdRgSsr9YYs
         t49vqy7hBilk2E+vbb1THafQ1i5zOHIo7idDNmEoyRy8clmuiCKA759psa0kkKSTJnLd
         5jpdjMmooQ2Q44SL8XOLimDB37hjID4OjvH1m4u0oFSQMBqz2239B5h4WsUbyX2dh3hO
         19weTEyqI6Y0xURViO7dqooemLhCQZnUkyHNd/GL+TxXf7bEj6qO4cGpMkCj7MU3WwjJ
         d07g==
X-Gm-Message-State: AOJu0Ywp3mg31RNylczg3yPpcn9F6tS0q8FfOhjMgBOCfrinAOjsWTYS
	sxEeWYxeSY26ij8fRosvMfJTcWCD/DWBAw3bXSzoEyy94d8vNd6rcp38fxj6Kxme7GIrrmH301G
	XFX6u
X-Gm-Gg: Acq92OHQ//MrJTb8J3i0auoWVNx4hjeHi/fcbpVprg/LPJGVTrTj+QoSTspdnhWI+uP
	JHLct8hcOLsvsWR9GS0a/6MWtl1T61g5JnXfFrBWzFwbdRN5WNbfjZELulzjYi4jA4jhVAvZKY3
	bIQd183qi7kiGt0biQaFCQzQ4G6qVUHxcYV6ePrRXFwRvkHDVUw1Nyag0rMz/5J/sK24D/K4NeG
	SMWdQT6f3XeZ3j426yc12oVfcww0ssG+8I1Wpue5BC9yAifStHOKt2tqPxoHwyoRvVIX9uqr0mD
	+YmfPmHWrAWlZepZ2Exd0dKmj7g5iRv0C1nWTGAM3b6LoPT0pH+DicNRDGoYA/+KW+ns1zN/byf
	ATa0lSvWlMvW8BR1aNuRnOVkKmdCOnG/PMHC6DpsoXhl7Rzh7LW5b50NXkTobiKZCUD8WRfJEiZ
	qoAT5/LtjB3/Dpv8X9qcWIveeEtm3ytfGNinG1VgFUrcLbnkgOmfMxM8071tuCYX9VZ0UdX0t3r
	ezVm+mOxybLOhrWH0QHKUKpew9S0KPLpO/Yx/k=
X-Received: by 2002:a05:6000:4708:b0:455:7d77:1d25 with SMTP id ffacd0b85a97d-460305124cfmr10041807f8f.27.1780698860411;
        Fri, 05 Jun 2026 15:34:20 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00b3e1ccc1be2b2798.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:b3e1:ccc1:be2b:2798])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2e4b18sm22132409f8f.10.2026.06.05.15.34.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 15:34:19 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 13/25] openssh: patch CVE-2026-35385
Date: Sat,  6 Jun 2026 00:33:58 +0200
Message-ID: <8a5742fdc3d60e8ab0da2e1f1401995105b742b9.1780698373.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780698373.git.yoann.congal@smile.fr>
References: <cover.1780698373.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 22:34:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238200

From: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>

Backport patch from [1] matching CVE description in [2] and change described
in release note [3].

[1] https://github.com/openssh/openssh-portable/commit/487e8ac146f7d6616f65c125d5edb210519b833a

[2] https://security-tracker.debian.org/tracker/CVE-2026-35385

[3] https://www.openssh.org/releasenotes.html#10.3p1

Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
Reviewed-by: Bruno Vernay <bruno.vernay@se.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../openssh/openssh/CVE-2026-35385.patch      | 47 +++++++++++++++++++
 .../openssh/openssh_9.6p1.bb                  |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-35385.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-35385.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-35385.patch
new file mode 100644
index 00000000000..4fc19a60620
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-35385.patch
@@ -0,0 +1,47 @@
+From 9df287221ad61f6b05b3e80bc57bdaacfa5ab243 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Thu, 2 Apr 2026 07:42:16 +0000
+Subject: [PATCH] upstream: when downloading files as root in legacy (-O) mode
+ and
+
+without the -p (preserve modes) flag set, clear setuid/setgid bits from
+downloaded files as one might expect.
+
+AFAIK this bug dates back to the original Berkeley rcp program.
+
+Reported by Christos Papakonstantinou of Cantina and Spearbit.
+
+OpenBSD-Commit-ID: 49e902fca8dd933a92a9b547ab31f63e86729fa1
+
+CVE: CVE-2026-35385
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/487e8ac146f7d6616f65c125d5edb210519b833a]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ scp.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/scp.c b/scp.c
+index 492dace12..2c21fa19a 100644
+--- a/scp.c
++++ b/scp.c
+@@ -1,4 +1,4 @@
+-/* $OpenBSD: scp.c,v 1.260 2023/10/11 05:42:08 djm Exp $ */
++/* $OpenBSD: scp.c,v 1.273 2026/04/02 07:42:16 djm Exp $ */
+ /*
+  * scp - secure remote copy.  This is basically patched BSD rcp which
+  * uses ssh to do the data transfer (instead of using rcmd).
+@@ -1682,8 +1682,10 @@ sink(int argc, char **argv, const char *src)
+ 
+ 	setimes = targisdir = 0;
+ 	mask = umask(0);
+-	if (!pflag)
++	if (!pflag) {
++		mask |= 07000;
+ 		(void) umask(mask);
++	}
+ 	if (argc != 1) {
+ 		run_err("ambiguous target");
+ 		exit(1);
+-- 
+2.43.0
+
diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
index 1cdd888ccb2..3a9010a7a4d 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
@@ -34,6 +34,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://CVE-2025-32728.patch \
            file://CVE-2025-61985.patch \
            file://CVE-2025-61984.patch \
+           file://CVE-2026-35385.patch \
            "
 SRC_URI[sha256sum] = "910211c07255a8c5ad654391b40ee59800710dd8119dd5362de09385aa7a777c"
 

