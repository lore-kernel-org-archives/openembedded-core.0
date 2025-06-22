Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 220A0C7115D
	for <webhook@archiver.kernel.org>; Sun, 22 Jun 2025 15:02:52 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.27818.1750604562429023415
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Jun 2025 08:02:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=F6DS/0rx;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-747fc77bb2aso2531960b3a.3
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Jun 2025 08:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1750604561; x=1751209361; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8014B0WRf4ADef2GVkDK4FzOj4ttxhTLdNiAysIKrM8=;
        b=F6DS/0rxMMPLKwgG1DRY9nv1Pkh/gAVxwzVLYRNtSj8jaNJ3TKvp9NT5e+rl/e2y8I
         fJW7qyPBStHIT5E6Zatg4jCx5Ifs4an7R173RChPo5isqC1BR9nPDZVZ5u832sMBLCO3
         ilMd+I7n/up4VaBJ7Ss7QL5j83nmJyUFgegdhR6WnA2/Eg75FD6g8Bfq+oIX3U+tX+JP
         y2hDVrXXg++7hgsWw5XUWF9suy9GUeefsS1zRnDrizVcU9jDQzQeg8ZdgOqiWgCQ1WtZ
         LF4RK8b+4fGd249P8rQFgwlJehVY5nTXdC8dUE2h4ZPMszjnlFGj+hRKUTQoI9macjsD
         NB+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750604561; x=1751209361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8014B0WRf4ADef2GVkDK4FzOj4ttxhTLdNiAysIKrM8=;
        b=vfDssT+1IcqTzwRHqsahfT5k1oEnATZ22Qncs5ReK4cscNHGhMxX/tPZ/1HfoCCJ2/
         IcwAe2hzvqauK4eQxd8BwwkEOuzj+WOae7Zp8PdZg0n/CD72EUrnkSFvZzAUvrXENFkn
         y1sgM+dvkzIxZJHEtGpvD9IFAuC/ByvMCm32bM/kWVzWv8zozX/qZa097QjM5AUrRv1D
         TGjdQw7HNTW2PDrob7cK9t34qNgLTTf3xKp1BP9iEZqQzWqrsOtjEhTszJmxGKngR0g6
         TyGO+c4aBulpftxN/lCBoc4TBUG69vdXNFMk9oflE6amBQEtj3wmNPofqiMjokpUUaYj
         0Y6g==
X-Gm-Message-State: AOJu0YxlkucV57ExG8G6xkCBqXF8cwnkHFjnUbiGousB+hXgF8LvrgJx
	SH+dE9irl0SnJ7ZH73ugSEWwFsy6JZWpTO5QOO8VFpQvQzmZEkh0DMjTpZ9VK6hUtnwDA6+I6jH
	JKolThyw=
X-Gm-Gg: ASbGncswyLoUshl5RTtp0OkGg+YRTfHvarRUqTDChdc3rDqvzIgfe7onBWFQg39Wn9d
	4SejD/GEFoWb0qP+A26n17Kr1a6RoPNOsLT8hPkAq74IQcRE/TaYOq3gbzkEWpONu+eQA263jUD
	k+dfqzLhUbrnoY0RMQ3M/DfzKI7s7sxLUBWLAWaKyiqOV0QQ5BoZTI1JmvAwwtwnUUWwmA2UW/0
	hUbBpxrkrbBUd4qBFkpLdhwSTJZ9+wMl9VUUmaBdNMPm2+AXXEVb6YGTKNyi5YkMH1aRv+3yylE
	bVwsLBDdwhgyhJgtRGce898aFYvo68/mQ5I9N99Ro1TJvlDEV0TAlQ==
X-Google-Smtp-Source: AGHT+IEwpde34iuoG68wA/62B7R2nGGL8Spbs3wscHOhyuxlT27VVy4QvKh9jQHy4bWSgQXSiqtOMA==
X-Received: by 2002:a05:6a00:140f:b0:742:a111:ee6f with SMTP id d2e1a72fcca58-7490d6dc413mr10025744b3a.10.1750604561538;
        Sun, 22 Jun 2025 08:02:41 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:4a75:9ad8:d661:8bd8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a46eb71sm6222521b3a.22.2025.06.22.08.02.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 08:02:41 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 12/14] go: ignore CVE-2024-3566
Date: Sun, 22 Jun 2025 08:00:07 -0700
Message-ID: <571fd82e29fe809c63a5743e534ed7816d787963.1750604257.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750604257.git.steve@sakoman.com>
References: <cover.1750604257.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Jun 2025 15:02:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219190

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
 meta/recipes-devtools/go/go-binary-native_1.17.13.bb | 3 +++
 meta/recipes-devtools/go/go-common.inc               | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/meta/recipes-devtools/go/go-binary-native_1.17.13.bb b/meta/recipes-devtools/go/go-binary-native_1.17.13.bb
index 4ee0148417..0f356b0e79 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.17.13.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.17.13.bb
@@ -14,6 +14,9 @@ SRC_URI[go_linux_arm64.sha256sum] = "914daad3f011cc2014dea799bb7490442677e4ad6de
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
 
+# not-applicable-platform: Issue only applies on Windows
+CVE_CHECK_IGNORE += "CVE-2024-3566"
+
 S = "${WORKDIR}/go"
 
 inherit goarch native
diff --git a/meta/recipes-devtools/go/go-common.inc b/meta/recipes-devtools/go/go-common.inc
index 83f8db7b39..e2ffba27bd 100644
--- a/meta/recipes-devtools/go/go-common.inc
+++ b/meta/recipes-devtools/go/go-common.inc
@@ -19,6 +19,9 @@ S = "${WORKDIR}/go"
 B = "${S}"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.src\.tar"
 
+# not-applicable-platform: Issue only applies on Windows
+CVE_CHECK_IGNORE += "CVE-2024-3566"
+
 INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
 SSTATE_SCAN_CMD = "true"
 
-- 
2.43.0


