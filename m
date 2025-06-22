Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D6CAC7EE2A
	for <webhook@archiver.kernel.org>; Sun, 22 Jun 2025 13:37:51 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.26157.1750599466276746420
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Jun 2025 06:37:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=XuLkTRjm;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-748f54dfa5fso2281129b3a.2
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Jun 2025 06:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1750599465; x=1751204265; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=APN/4pJ9hjCy1caV98neP5Flhq0IKosjKxYZL+nYrzk=;
        b=XuLkTRjmWcRfX1C2uFsRKD8Gny8W6aYX6QbLEU2Lrt+1EhAtCAvt9N0BySdepH3u1O
         cS1AtzSOKhJJfWNdkQQuIyIHHuLEgMulvIWGGti5EIxjF4xkLiSwgZktSRWSMAgEIEdb
         4SIT7u9SJ61vkvV5V0Mw5jTNUmRzvyLdA2keSuBEeSJHDaVt/IBlyI+M+EYuc+MpP8Kn
         os5wVc6zKQDItx6kSsQK7bmb1O8YiQrFcyw+9fe6sxUKLorPJoZjHfQKRs5mq3/8H3BK
         ksPNkz8qA/K2/KqSmSV3HI0e7DoOS23RBXpiPpJx3UnvTATeaxuwa7W42iVbiZ1aikT6
         c6ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750599465; x=1751204265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=APN/4pJ9hjCy1caV98neP5Flhq0IKosjKxYZL+nYrzk=;
        b=WclB6PISW8mBTn6PRH/ggjcWg1Z5zr8BUIwzOT9gyVdj865va0WdC4+IO/auPraJRm
         C/scLm43z9A5PixkLOrZL6bBqVoQLqaFlWI+ThjDYgRN26ZgNBWFC/EzD0bPBc6fAYPu
         rLGKhJq+eBL93jIrMwck+UblwPQYlsKAzeBTx1P2Lwt8POv2TpWMPyzPaDp2QQ27P4Nk
         AVVPQb5JlKoJO1iQLVDDUnb/VysTFLOOWkks25qLv1iYmSHamFDtvJYjAPTIk3GI/LtR
         XYIRDSOX1xJHll65bKib93fCnVqY7rzb2/vSa0MeDyr8YPVYHCwUNtKUk0OMUNF0ThoB
         LmLw==
X-Gm-Message-State: AOJu0YyDfJXQE+i3yWUidapAEK3UqXoaUZSfiNBuNN48efIbfZDXhtIQ
	ZKOBy4z8vFkmDdqaiscxANe+0VK5Hroaqgo8XToLe7FlkXmng7pDsNd+yCNrlODditgNaZ+RtMp
	08metd/Q=
X-Gm-Gg: ASbGncsU/63N63xQULJa+jyxBR9ZZeXrPc9VDbqrEE9vBaCQDFRX/pCGoibSFUZkQI4
	vJYQU5PS2Ruff1Mk9+DGulfFBVpaUMObH9bNVMYAQVdDGZ4PxL39T6ceq6yOTByootbbtGnYevT
	448CQUsIkxWSZ+zbkO+opg883287JgSCCa4lplegqdSaUOeAqFMDSb1M1OM//+AEIupeK65B5wl
	RCc22JuZmkzy3HUwrBVfMRRiW16uBQnsBUe6unJfPMxYM8JmYd7DDOwGrV3X9qnskTi6Rcx4Ez5
	eO4WPWCW0M6PwiPttff7svPU5BaPw3TdW5B4fvdEGRyb+JjNNlop/A==
X-Google-Smtp-Source: AGHT+IHCy+8CK3cX5RKO2g/xRukz6Jx53Th9livvJnpDDu6uvSPpxoHUztL81i9N9EE5vnmud8EKzw==
X-Received: by 2002:a05:6a00:a1f:b0:748:2e1a:84e3 with SMTP id d2e1a72fcca58-7490d9aae0emr15709326b3a.8.1750599465502;
        Sun, 22 Jun 2025 06:37:45 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:4a75:9ad8:d661:8bd8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a6a72afsm5960189b3a.163.2025.06.22.06.37.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 06:37:45 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 1/4] go: set status of CVE-2024-3566
Date: Sun, 22 Jun 2025 06:37:29 -0700
Message-ID: <b8841097eaf7545abf56eb52a122e113b54ba2a7.1750599311.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750599311.git.steve@sakoman.com>
References: <cover.1750599311.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Jun 2025 13:37:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219175

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
 meta/recipes-devtools/go/go-binary-native_1.22.12.bb | 1 +
 meta/recipes-devtools/go/go-common.inc               | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/go/go-binary-native_1.22.12.bb b/meta/recipes-devtools/go/go-binary-native_1.22.12.bb
index 747737ff94..b15b60a691 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.22.12.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.22.12.bb
@@ -17,6 +17,7 @@ UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
 
 CVE_PRODUCT = "golang:go"
+CVE_STATUS[CVE-2024-3566] = "not-applicable-platform: Issue only applies on Windows"
 
 S = "${WORKDIR}/go"
 
diff --git a/meta/recipes-devtools/go/go-common.inc b/meta/recipes-devtools/go/go-common.inc
index db165792dc..a39dea6c1c 100644
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


