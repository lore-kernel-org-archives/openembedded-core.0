Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FF3CFC036B
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 15:45:23 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.693.1776959120279849150
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2026 08:45:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=m90coPmG;
 spf=pass (domain: gmail.com, ip: 209.85.160.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-506a6cf8242so49090131cf.1
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 08:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776959119; x=1777563919; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kn5kEVViL/uH01PMuBI96casTOGCMSkkm5O/AwwlGog=;
        b=m90coPmGR2KKBwtVvrlI7f65Zwg2LF2FuoHqXn2Bw5f156p1OAU8OC7GVUi0zhsiz9
         T8brPfwmuo7ApO1hq6XAdh2tqCx53OU20D9NtaYui0XvLFajsnDUNWwheBnYKDKqU5Gh
         T0MP4mLVOjYhPG/4b8pyeh02BFqhV0fJ5YcrS0ePV4dzxFHzjf14s7PyPEB5aGeDXrp2
         ltztavroyCoBu4iCPy2XwqDe8lyhvU4QiQyR0ojljaENXJoP/LlUX1z6YREyf6WAtR9i
         z0G1FsfpWDibp1FxXxcZC0Zu7pKsVmYOddO4WsWsgEJSXZnxYFGgEdUS3KDVKYC5Bzp5
         e7JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776959119; x=1777563919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Kn5kEVViL/uH01PMuBI96casTOGCMSkkm5O/AwwlGog=;
        b=h6bgMBmCkc+WL4x0xgdkpTERgdapM6NlVDzfcXG4ysap4SIQYvccUdQ5fKP0D6+vRb
         KWlTEVl6aHPt4x8rxvv4vrAv4bMvU+TuDSnEJkfBcX+IRiNAytQ3M5u9gEIcuXn8VcTS
         f5NWl5JkkFM1Mayx5kyaXYw0VshJUjCoAIUDM/fqBZHdZY2kqT+9191n+OZtkIEdbz2M
         9aMAKezDwXD23jOuA2MAttJ5TSFH7r1rG7JlqTSAxoGdtY/JLBIGcrDXBW+XI2XMnoPB
         OBCwmrEoctV5/EJ89I3hIG0viyIUJEe178dvPvy3xSCSLb7Ch6uHGM8ZnNCqgKhjQIeF
         MJXg==
X-Gm-Message-State: AOJu0YyJzYVRyeUAnheAH/tReyBRNnuJ5kWP+ZzYMXIyKelXrS4CPsYc
	c+eLDHfAXW/42A70PgQXLKhtjA4Udxj5P7H7KdLO/a85EEQYVJzv2WAoNl4j8KUz
X-Gm-Gg: AeBDieuY/0JH6mHa3HMwoyFydPskVMqKVg/DRyzGVm+25QiISJw7meHW5lFpOESPY5+
	zotreVj01YFhmloh1c52wBnH8WpaWLr4Mnj9+cYhn+LSP9kGqbuYq9ixHLwFU6K5sBnrAFRsdAe
	ERNghk2Yexk9gTdX/WQiWZmvtACziyZu42kpEc4kJwpb8/ypfTdcK6iie/4tNsdnxnJUtwQ5Qhu
	Se4SzcPUOa36hvV9wy+uZ3YlTJ5YK2x21C1VcBk9FYrYeqKncA+8o9X3s64C7nLs/68Pzqrjx09
	ICNj30KgeDiV1s5Rj9eziBCUaEt1wEbLdnKAD3dU+4Y4dVFHjXUkTuuxUq9H0qhbytoveTvQB/z
	52PLlj+6g2d1X0crtGH+jlwuxDbipxJtC4upo95amf6NdwWhl9cI2gvEuE97EyrLc/2pJaGKw/5
	uiQ38wte0P1Py7wRW8+rtp69H2s6t+yRpOsKZkE8SKRlYmjPV43ltbyZUiZlhRm0aRfV0uhIAOl
	HuCpY1kI72qlhR0TTjCQ5qJepdguInNIwczoH5K70tUHu8y9WTNYuKkSqWMEzgmqSVoRQ==
X-Received: by 2002:a05:622a:60d:b0:50d:7568:b904 with SMTP id d75a77b69052e-50e368209f8mr395201941cf.2.1776959118825;
        Thu, 23 Apr 2026 08:45:18 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50fb416b3f5sm74400031cf.28.2026.04.23.08.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 08:45:17 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: yoann.congal@smile.fr
Cc: openembedded-core@lists.openembedded.org
Subject: [openembedded-core][whinlatter][PATCH 06/18] linux-yocto/6.12: update CVE exclusions (6.12.74)
Date: Thu, 23 Apr 2026 11:44:57 -0400
Message-ID: <20260423154509.1933646-7-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423154509.1933646-1-bruce.ashfield@gmail.com>
References: <20260423154509.1933646-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 15:45:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235806

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Data pulled from: https://github.com/CVEProject/cvelistV5

    1/1 [
        Author: cvelistV5 Github Action
        Email: github_action@example.com
        Subject: 1 changes (1 new | 0 updated): - 1 new CVEs: CVE-2026-2971 - 0 updated CVEs:
        Date: Mon, 23 Feb 2026 04:58:05 +0000

    ]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/cve-exclusion_6.12.inc              | 48 +++++++++----------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
index 92a12f2c1f..c7726e1306 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
@@ -1,11 +1,11 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2026-02-18 20:12:59.836870+00:00 for kernel version 6.12.73
-# From linux_kernel_cves cve_2026-02-18_1900Z-2-ge0bc67e5ce4
+# Generated at 2026-02-23 05:12:32.087151+00:00 for kernel version 6.12.74
+# From linux_kernel_cves cve_2026-02-23_0400Z-1-g3cbc7410733
 
 
 python check_kernel_cve_status_version() {
-    this_version = "6.12.73"
+    this_version = "6.12.74"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
@@ -20402,23 +20402,23 @@ CVE_STATUS[CVE-2025-71225] = "cpe-stable-backport: Backported in 6.12.70"
 
 CVE_STATUS[CVE-2025-71228] = "cpe-stable-backport: Backported in 6.12.70"
 
-# CVE-2025-71229 has no known resolution
+CVE_STATUS[CVE-2025-71229] = "cpe-stable-backport: Backported in 6.12.72"
 
-# CVE-2025-71230 has no known resolution
+CVE_STATUS[CVE-2025-71230] = "fixed-version: only affects 6.13 onwards"
 
-# CVE-2025-71231 has no known resolution
+CVE_STATUS[CVE-2025-71231] = "cpe-stable-backport: Backported in 6.12.72"
 
-# CVE-2025-71232 has no known resolution
+CVE_STATUS[CVE-2025-71232] = "cpe-stable-backport: Backported in 6.12.72"
 
-# CVE-2025-71233 has no known resolution
+CVE_STATUS[CVE-2025-71233] = "cpe-stable-backport: Backported in 6.12.72"
 
-# CVE-2025-71234 has no known resolution
+CVE_STATUS[CVE-2025-71234] = "cpe-stable-backport: Backported in 6.12.72"
 
-# CVE-2025-71235 has no known resolution
+CVE_STATUS[CVE-2025-71235] = "cpe-stable-backport: Backported in 6.12.72"
 
-# CVE-2025-71236 has no known resolution
+CVE_STATUS[CVE-2025-71236] = "cpe-stable-backport: Backported in 6.12.72"
 
-# CVE-2025-71237 has no known resolution
+CVE_STATUS[CVE-2025-71237] = "cpe-stable-backport: Backported in 6.12.72"
 
 CVE_STATUS[CVE-2026-22976] = "cpe-stable-backport: Backported in 6.12.66"
 
@@ -20668,7 +20668,7 @@ CVE_STATUS[CVE-2026-23098] = "cpe-stable-backport: Backported in 6.12.68"
 
 CVE_STATUS[CVE-2026-23099] = "cpe-stable-backport: Backported in 6.12.68"
 
-CVE_STATUS[CVE-2026-23100] = "fixed-version: only affects 6.13 onwards"
+CVE_STATUS[CVE-2026-23100] = "cpe-stable-backport: Backported in 6.12.74"
 
 CVE_STATUS[CVE-2026-23101] = "cpe-stable-backport: Backported in 6.12.68"
 
@@ -20908,25 +20908,25 @@ CVE_STATUS[CVE-2026-23218] = "fixed-version: only affects 6.18 onwards"
 
 CVE_STATUS[CVE-2026-23219] = "cpe-stable-backport: Backported in 6.12.70"
 
-# CVE-2026-23220 has no known resolution
+CVE_STATUS[CVE-2026-23220] = "cpe-stable-backport: Backported in 6.12.72"
 
-# CVE-2026-23221 has no known resolution
+CVE_STATUS[CVE-2026-23221] = "cpe-stable-backport: Backported in 6.12.74"
 
-# CVE-2026-23222 has no known resolution
+CVE_STATUS[CVE-2026-23222] = "cpe-stable-backport: Backported in 6.12.72"
 
-# CVE-2026-23223 has no known resolution
+CVE_STATUS[CVE-2026-23223] = "cpe-stable-backport: Backported in 6.12.72"
 
-# CVE-2026-23224 has no known resolution
+CVE_STATUS[CVE-2026-23224] = "cpe-stable-backport: Backported in 6.12.72"
 
-# CVE-2026-23225 has no known resolution
+CVE_STATUS[CVE-2026-23225] = "fixed-version: only affects 6.19 onwards"
 
-# CVE-2026-23226 has no known resolution
+# CVE-2026-23226 needs backporting (fixed from 7.0rc1)
 
-# CVE-2026-23227 has no known resolution
+# CVE-2026-23227 needs backporting (fixed from 7.0rc1)
 
-# CVE-2026-23228 has no known resolution
+CVE_STATUS[CVE-2026-23228] = "cpe-stable-backport: Backported in 6.12.72"
 
-# CVE-2026-23229 has no known resolution
+CVE_STATUS[CVE-2026-23229] = "cpe-stable-backport: Backported in 6.12.72"
 
-# CVE-2026-23230 has no known resolution
+CVE_STATUS[CVE-2026-23230] = "cpe-stable-backport: Backported in 6.12.72"
 
-- 
2.43.0


