Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11EDCC7EE2A
	for <webhook@archiver.kernel.org>; Sat, 21 Jun 2025 14:23:34 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web11.8198.1750515806403483597
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Jun 2025 07:23:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=B86u8B7a;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.177, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b2c4476d381so2084362a12.0
        for <openembedded-core@lists.openembedded.org>; Sat, 21 Jun 2025 07:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1750515806; x=1751120606; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X2S2RQy+nY4/yRf1uQdvgYSSBqX6w4ZBIADagJq2ROM=;
        b=B86u8B7aSBDSp7OdQ8U8N2TlxRb4CUzR9R31LDxi4fH85L/ELjdJNM8aPrSYrDU0qp
         rKOiaU/72KrsT7gy6QA0crAflJCWxuVLBfgQ/QzfGkg9J0vlDelrFB3tv+318QEMlMSb
         YF+H7h+qJRRQ3qBJtmHJ9tP/JxqExkcXnN16j0jP7Vmt6N6AmQJLiz5Dve8adHfPAlQ6
         /E+vmnRqq45P6wiG4KvKQFeeU/TAbgXQVAtVRBw09szzHaHbsAlkrUv1koITY/GP1Dd2
         uc1g/39JMjncYlnupLaBQCPkTMfRe50EGIsFPhR1blWtE01dhnZ8J6UHw68r1xyzJ9Zl
         7SzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750515806; x=1751120606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X2S2RQy+nY4/yRf1uQdvgYSSBqX6w4ZBIADagJq2ROM=;
        b=fjyIA9ISadDJS3nxW7nu21rCgratm+hNIOX0G2wy4kKbzIyEH6uBL+6+issm/fSTz4
         HUmEXisTErGfO9BeNezF8v8IoKadbFoqajGAuwFayyDpMYa2h6P8adNXItmpow1D3DX3
         wLbdoc8mkqLBSeI5UvFJ4/DZy+bkLbp6QbDCOEw0iCzm5jpvUbPaDc1NQzv3GPsUBF30
         ISOenccEM3avIsT2qspZ5SDEEJEhl2+9KFWTZ7KMCtLa+tY7G2FXOlXQEqERjpyu2jbU
         fKBC+6DEPYWa7H5eHFQZ2HEmDntJn5shL8ITyBdiVfSk5tNUvTGBsjNZos3DJO35f9Ot
         mTSg==
X-Gm-Message-State: AOJu0YwEYJ2EAGzhmRdVFZv0ggBAOG7SUPuST8O93pyE2BTCIUfe49Pz
	VzJDD/7kr11ltza+83p6Ykq5XRn+V2WNox8PHo99ibtzqBBuZpIJv2vALF59tNpCa3KmqKHBgOF
	luh8z
X-Gm-Gg: ASbGncvtBVOBzVgiUybgmFpYXORGjcmfTyaM1BQe12GxXxhKE/9WefquzizQw1UK1+y
	5nyPsi1++/Y89yIBpyQAbJjpgwNutKqjbA/PWscNgPrsaXwgSm0ITbuvxdjqxSZUw2JrpznStGr
	hiSJIK0Kmyel5Pk2pvEGtzRIJkrVhmL7WPJ9+PW0e6qXp9GVzPMP3nIqgMMxwfIOzil+6NR7wRV
	+PYRcO3RS3wGgLM63Y7a8B7sRdWoa2gDNnxKjK8qqE8pxsHr/XXPxJTIzX4/urqouWMN5DhWP5Y
	hz9baCSlIYkeEUgpMo6XFokEM9pTHUxfMTtr7Tf9HRgOrMoGRrXWsQ==
X-Google-Smtp-Source: AGHT+IGLNNyoleuEvcKtVFRLJEG1F48wZC1bNSnniOhcmDU44GEYfdY5rpzLFDEJvlSDz2J7bKM8OA==
X-Received: by 2002:a17:90b:4ad0:b0:302:fc48:4f0a with SMTP id 98e67ed59e1d1-3159f39964amr9236487a91.0.1750515805559;
        Sat, 21 Jun 2025 07:23:25 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5bf1:320c:7400:5bfc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3158a23e6efsm6596807a91.16.2025.06.21.07.23.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 07:23:25 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 1/7] go: set status of CVE-2024-3566
Date: Sat, 21 Jun 2025 07:23:11 -0700
Message-ID: <c43a9f7ca85f1c25a72f7b1efa494e30d6cf4906.1750515680.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750515680.git.steve@sakoman.com>
References: <cover.1750515680.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Jun 2025 14:23:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219159

From: Peter Marko <peter.marko@siemens.com>

NVD ([1]) tracks this as:
cpe:2.3:a:golang:go:*:*:*:*:*:*:*:*
Running on/with
  cpe:2.3:o:microsoft:windows:-:*:*:*:*:*:*:*

Yocto cve-check ignores the "Running on/with", so it needs to be ignored
explicitly.

[1] https://nvd.nist.gov/vuln/detail/CVE-2024-3566

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go-binary-native_1.24.4.bb | 1 +
 meta/recipes-devtools/go/go-common.inc              | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/go/go-binary-native_1.24.4.bb b/meta/recipes-devtools/go/go-binary-native_1.24.4.bb
index 9f788536c4..a5324d0f06 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.24.4.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.24.4.bb
@@ -17,6 +17,7 @@ UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
 
 CVE_PRODUCT = "golang:go"
+CVE_STATUS[CVE-2024-3566] = "not-applicable-platform: Issue only applies on Windows"
 
 S = "${WORKDIR}/go"
 
diff --git a/meta/recipes-devtools/go/go-common.inc b/meta/recipes-devtools/go/go-common.inc
index ca8469dbd9..a79c90faf8 100644
--- a/meta/recipes-devtools/go/go-common.inc
+++ b/meta/recipes-devtools/go/go-common.inc
@@ -21,6 +21,7 @@ UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.src\.tar"
 
 # all recipe variants are created from the same product
 CVE_PRODUCT = "golang:go"
+CVE_STATUS[CVE-2024-3566] = "not-applicable-platform: Issue only applies on Windows"
 
 INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
 SSTATE_SCAN_CMD = "true"
-- 
2.43.0


