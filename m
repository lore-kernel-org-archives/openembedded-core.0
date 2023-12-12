Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8774CC35274
	for <webhook@archiver.kernel.org>; Tue, 12 Dec 2023 14:28:32 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.2852.1702391311058161909
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Dec 2023 06:28:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=JLXrbJqt;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6ce76f0748fso3547778b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 06:28:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1702391310; x=1702996110; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DGJZKNScMolf+dZYfMlmOned+9r13v4H9PhecZaB2Mw=;
        b=JLXrbJqtFM9yHN83/nzrZTFvBGCrOt2/4EqIXej+m89b39dQWizGIRQcWB28aMISDl
         RSSRztdpCioWS3MNKGYURE8WGZU7P8nfpG/SPw0UxSfh4NpRQgqhuadZ9AA+oSGaZC1G
         Hv/bU2RBh4DAAuVdv7giXrovzlNs5/Y+8pUhKGwqho6PM2PuTi7dLNd08osITINSNs4J
         ADzApYFgUazg8hRm/s0meq7l3ihiPZ3spw3qKT/t/k7ykAkEyysnJFmkY/QNeVy903jF
         WrRuvCAe15uzDihEZbQlJucxjcjYLE40Aw/BjWGD41kjkAIT/RXGyEjsy8Sp4AaC9/9w
         USAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702391310; x=1702996110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DGJZKNScMolf+dZYfMlmOned+9r13v4H9PhecZaB2Mw=;
        b=TIgTOKk+uxd155YQ/5L0uVoyt+ctq36XCMGoh/9BIlJCYP2I0TFJtu7FJ+pUdiQx7u
         p2KlGP5hAukEcYuhWXlSavqAZiMPs8JGc+IG5OD2fKO6bTjx0/XBigybSfr0kP1YYa47
         H4lY7MEnWGMF/1y9LnvdA7H3D5sv9zTGlKtbRJwqbNCAoqPXxPToiZIiudj1Rub5GrOT
         CfH5BohCFrf7z8wVUYqe2obs+JF8iwz4wdqvXVtriMr8CKoEozFOb0V7QQI38SR2Pb6C
         a/6La27QD5hzYXoLkmHDnVz3ScxHaIE8rZmXnKsKpboNLBPHUhDXNxxKZtdHDpfxO36G
         W3SA==
X-Gm-Message-State: AOJu0YwF7Y5Re+VsT0XiBtGMFRlZkwvj509ULLJHUin7wVXYiLKEpQwS
	XlE7C/5QE60ShUtRKRRl5wnC5ATifPRtMTci7/U=
X-Google-Smtp-Source: AGHT+IHbXly4xDNLrNyvcBCKjy01Ir+vZFBS1aBhUlGfOBkU8t8qm9vUy+bajYN3qlrJ8AAoQJpOIQ==
X-Received: by 2002:a05:6a00:608b:b0:6ce:f735:11f4 with SMTP id fp11-20020a056a00608b00b006cef73511f4mr2266904pfb.0.1702391310190;
        Tue, 12 Dec 2023 06:28:30 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id n23-20020a056a000d5700b006cbb40669b1sm8188928pfv.23.2023.12.12.06.28.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 06:28:29 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 25/29] linux-yocto: update CVE exclusions
Date: Tue, 12 Dec 2023 04:27:31 -1000
Message-Id: <c8b93b08f663384f358fed72b9d3d86172fae8b7.1702391115.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702391115.git.steve@sakoman.com>
References: <cover.1702391115.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 14:28:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192229

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 34835847442c15ebe12970bc31b6a949e66da48e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/cve-exclusion_6.1.inc               | 26 +++++++++++++++----
 .../linux/cve-exclusion_6.5.inc               | 22 +++++++++++++---
 2 files changed, 40 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.1.inc b/meta/recipes-kernel/linux/cve-exclusion_6.1.inc
index a8df51f321..650b83a900 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.1.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.1.inc
@@ -1,9 +1,9 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2023-11-03 13:24:16.070181+00:00 for version 6.1.57
+# Generated at 2023-12-05 13:22:34.961692+00:00 for version 6.1.65
 
 python check_kernel_cve_status_version() {
-    this_version = "6.1.57"
+    this_version = "6.1.65"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
@@ -4524,7 +4524,7 @@ CVE_STATUS[CVE-2022-43945] = "fixed-version: Fixed from version 6.1rc1"
 
 # CVE-2022-44033 needs backporting (fixed from 6.4rc1)
 
-# CVE-2022-44034 has no known resolution
+# CVE-2022-44034 needs backporting (fixed from 6.4rc1)
 
 # CVE-2022-4543 has no known resolution
 
@@ -5016,6 +5016,10 @@ CVE_STATUS[CVE-2023-39193] = "cpe-stable-backport: Backported in 6.1.53"
 
 CVE_STATUS[CVE-2023-39194] = "cpe-stable-backport: Backported in 6.1.47"
 
+CVE_STATUS[CVE-2023-39197] = "cpe-stable-backport: Backported in 6.1.39"
+
+CVE_STATUS[CVE-2023-39198] = "cpe-stable-backport: Backported in 6.1.47"
+
 CVE_STATUS[CVE-2023-4004] = "cpe-stable-backport: Backported in 6.1.42"
 
 # CVE-2023-4010 has no known resolution
@@ -5102,7 +5106,7 @@ CVE_STATUS[CVE-2023-4881] = "cpe-stable-backport: Backported in 6.1.54"
 
 CVE_STATUS[CVE-2023-4921] = "cpe-stable-backport: Backported in 6.1.54"
 
-# CVE-2023-5090 needs backporting (fixed from 6.6rc7)
+CVE_STATUS[CVE-2023-5090] = "cpe-stable-backport: Backported in 6.1.62"
 
 CVE_STATUS[CVE-2023-5158] = "cpe-stable-backport: Backported in 6.1.57"
 
@@ -5112,7 +5116,19 @@ CVE_STATUS[CVE-2023-5197] = "cpe-stable-backport: Backported in 6.1.56"
 
 CVE_STATUS[CVE-2023-5345] = "cpe-stable-backport: Backported in 6.1.56"
 
-# CVE-2023-5633 needs backporting (fixed from 6.6rc6)
+CVE_STATUS[CVE-2023-5633] = "fixed-version: only affects 6.2 onwards"
 
 # CVE-2023-5717 needs backporting (fixed from 6.1.60)
 
+# CVE-2023-5972 needs backporting (fixed from 6.6rc7)
+
+# CVE-2023-6039 needs backporting (fixed from 6.5rc5)
+
+CVE_STATUS[CVE-2023-6111] = "fixed-version: only affects 6.6rc3 onwards"
+
+# CVE-2023-6121 needs backporting (fixed from 6.7rc3)
+
+CVE_STATUS[CVE-2023-6176] = "cpe-stable-backport: Backported in 6.1.54"
+
+# CVE-2023-6238 has no known resolution
+
diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.5.inc b/meta/recipes-kernel/linux/cve-exclusion_6.5.inc
index d48b0e1493..046c3f95c3 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.5.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.5.inc
@@ -1,9 +1,9 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2023-11-03 13:24:25.010946+00:00 for version 6.5.7
+# Generated at 2023-12-05 13:22:43.339114+00:00 for version 6.5.13
 
 python check_kernel_cve_status_version() {
-    this_version = "6.5.7"
+    this_version = "6.5.13"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
@@ -4524,7 +4524,7 @@ CVE_STATUS[CVE-2022-44032] = "fixed-version: Fixed from version 6.4rc1"
 
 CVE_STATUS[CVE-2022-44033] = "fixed-version: Fixed from version 6.4rc1"
 
-# CVE-2022-44034 has no known resolution
+CVE_STATUS[CVE-2022-44034] = "fixed-version: Fixed from version 6.4rc1"
 
 # CVE-2022-4543 has no known resolution
 
@@ -5016,6 +5016,10 @@ CVE_STATUS[CVE-2023-39191] = "fixed-version: Fixed from version 6.3rc1"
 
 CVE_STATUS[CVE-2023-39194] = "fixed-version: Fixed from version 6.5rc7"
 
+CVE_STATUS[CVE-2023-39197] = "fixed-version: Fixed from version 6.5rc1"
+
+CVE_STATUS[CVE-2023-39198] = "fixed-version: Fixed from version 6.5rc7"
+
 CVE_STATUS[CVE-2023-4004] = "fixed-version: Fixed from version 6.5rc3"
 
 # CVE-2023-4010 has no known resolution
@@ -5116,3 +5120,15 @@ CVE_STATUS[CVE-2023-4732] = "fixed-version: Fixed from version 5.14rc1"
 
 # CVE-2023-5717 needs backporting (fixed from 6.6rc7)
 
+CVE_STATUS[CVE-2023-5972] = "cpe-stable-backport: Backported in 6.5.9"
+
+CVE_STATUS[CVE-2023-6039] = "fixed-version: Fixed from version 6.5rc5"
+
+CVE_STATUS[CVE-2023-6111] = "fixed-version: only affects 6.6rc3 onwards"
+
+# CVE-2023-6121 needs backporting (fixed from 6.7rc3)
+
+CVE_STATUS[CVE-2023-6176] = "cpe-stable-backport: Backported in 6.5.4"
+
+# CVE-2023-6238 has no known resolution
+
-- 
2.34.1


