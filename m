Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9380EFC0374
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 15:45:33 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.764.1776959127753545981
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2026 08:45:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=BNQ8j3hs;
 spf=pass (domain: gmail.com, ip: 209.85.160.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-50e97863425so42775401cf.0
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 08:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776959127; x=1777563927; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZJGOXdYu10fwpMr9zBsLqeRD3t7DOwS/an95sVp0ipI=;
        b=BNQ8j3hsCX4beM7orXCckh+eD+FnV8Ml4Lz5fwmfvaCTf1fBK1Ok+dYKiLJc337t6K
         QX4eR83A7kKRWHKLw4TSipKnTeOBtW5I5b1mWFmztC3lEDAZJWj54lBc7oAYj9GftdMG
         xe0Pf+xG+NY9KposSSKqkk5AFNq9cbMh+v0zkhtFfre+qszRbF8EwB2VaiyKEs148wnQ
         72PDeGsnMVX8KZYjs2SZ+Tu5d1jKLlOyZIjYQfHJt+IGzPsobf4fNbclmqbfqZTWjCs8
         rHuxMiHF/LDxThM+wWRDcQJaRkNYYcb7h+Oaf8VWeK7z16fqXxUnXCaGg+9tOFZrWum/
         srMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776959127; x=1777563927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZJGOXdYu10fwpMr9zBsLqeRD3t7DOwS/an95sVp0ipI=;
        b=VabEhtXAv3O+41IUZRewoN0p5r34m0+e3r9vg5CwoGR7QKF8T+aGdaj1TUh7+/YXnO
         hJkCv65O+v26MsABgG5pM4PDLRmjyTFb3h/Q6uysoRYhnpU2SCt01zc7gciD44qKV92w
         ogufkR1dGALJfghGzQTP7mMdKW90IiHos4UTHTcElS6kxNjxq8txNNah1u/1cfwTN+WE
         mDZYUAqg6cTyTrkNh4uAfaJPy31uqSpZKgU1CZh1D6t2iVNUL8I2Y3NKgZG09v+Co4v6
         Ge8tWktbCqpyOjtt5yt9RXP51QujS0LkgpkVm4LLCmAVjlFbpROltrILRWm1Mj2izl8q
         kNWw==
X-Gm-Message-State: AOJu0Yzs3cBfbjqMakg2XqH1jB4HfgVrQknJMZl9O397o/c2Uxg3oLtw
	m6KcMf3tLjigFjzpYSSd7947evn9GsBiLpDVHcTl8hWCfkit1UPk/FWKmY6USAVV
X-Gm-Gg: AeBDievY/sLN+UcGuhK0RmoNrosLXdws9uQ4f+unrjl967xBJaIlvwamcTlktXyUx+q
	uTg0XJ94C386sE6SgK02jdJOo2Ff/ZREjNX6jY01h+xas+qGcemsLzcFG9hRpm0QF7DKn2D1Md8
	I6mRFEck1G63Zdqdmryb04TKcMzj3aRFEKGX2nHUYquK/YkSogHGoQyTnaeABDtuG4v7AKs1zn3
	NbU9NHCFD19Xo4CvKJmL/RiL4gcsf1x9DXHbbOF6BNszptOHcfLRb628eU34quUeXuFWnzJVX1l
	AYeU/mAN+4QRcZ/41+CX/MtJ3cCeFOZa2lAXl/sLrkWrSKRUKQHju6xnGpqQnRpDGRB7095DKsd
	BudVJBQpapUAGdztKyjj1GVdE5/s2dvkJ8p9AjlNKNrxC6q9OcQzWIBV93qdSaVkIULv9xMR1SK
	okGMPJV+B3W++EHDKIf5zkY5RY0Ct55KwGqYgkvo361XAHi7u4h4QBhEXM1kYp5zUs2lYZ04pD7
	gvy/ikorMA2DdheSRT5yu5MkNc5qgfibwdZuuUHZYNb7c+tUhPexqRlPNjEEtpExIXDcQ==
X-Received: by 2002:ac8:59cd:0:b0:50f:c5f0:f2fd with SMTP id d75a77b69052e-50fc5f0f44amr94754101cf.47.1776959126640;
        Thu, 23 Apr 2026 08:45:26 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50fb416b3f5sm74400031cf.28.2026.04.23.08.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 08:45:23 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: yoann.congal@smile.fr
Cc: openembedded-core@lists.openembedded.org
Subject: [openembedded-core][whinlatter][PATCH 10/18] linux-yocto/6.12: update CVE exclusions (6.12.77)
Date: Thu, 23 Apr 2026 11:45:01 -0400
Message-ID: <20260423154509.1933646-11-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423154509.1933646-1-bruce.ashfield@gmail.com>
References: <20260423154509.1933646-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 15:45:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235810

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Data pulled from: https://github.com/CVEProject/cvelistV5

    1/1 [
        Author: cvelistV5 Github Action
        Email: github_action@example.com
        Subject: 21 changes (20 new | 1 updated): - 20 new CVEs: CVE-2025-47873, CVE-2025-58427, CVE-2025-61952, CVE-2025-61979, CVE-2025-62403, CVE-2025-62500, CVE-2025-64301, CVE-2025-64733, CVE-2025-64735, CVE-2025-64776, CVE-2025-65119, CVE-2025-66000, CVE-2025-66042, CVE-2025-66342, CVE-2025-66503, CVE-2025-66617, CVE-2025-66633, CVE-2026-20726, CVE-2026-22882, CVE-2026-25790 - 1 updated CVEs: CVE-2026-3207
        Date: Tue, 17 Mar 2026 18:55:39 +0000

    ]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/cve-exclusion_6.12.inc              | 20 +++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
index 60d337b010..5fa3966719 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
@@ -1,11 +1,11 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2026-03-09 19:34:33.465338+00:00 for kernel version 6.12.76
-# From linux_kernel_cves cve_2026-03-09_1900Z-1-gab0cca33c43
+# Generated at 2026-03-17 19:07:54.629545+00:00 for kernel version 6.12.77
+# From linux_kernel_cves cve_2026-03-17_1800Z-2-g4ae4487ca91
 
 
 python check_kernel_cve_status_version() {
-    this_version = "6.12.76"
+    this_version = "6.12.77"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
@@ -9032,7 +9032,7 @@ CVE_STATUS[CVE-2023-54326] = "fixed-version: Fixed from version 6.5"
 
 CVE_STATUS[CVE-2023-7324] = "fixed-version: Fixed from version 6.3"
 
-# CVE-2024-14027 needs backporting (fixed from 6.13)
+CVE_STATUS[CVE-2024-14027] = "cpe-stable-backport: Backported in 6.12.77"
 
 CVE_STATUS[CVE-2024-26581] = "fixed-version: Fixed from version 6.8"
 
@@ -20420,6 +20420,8 @@ CVE_STATUS[CVE-2025-71237] = "cpe-stable-backport: Backported in 6.12.72"
 
 CVE_STATUS[CVE-2025-71238] = "cpe-stable-backport: Backported in 6.12.74"
 
+CVE_STATUS[CVE-2025-71239] = "cpe-stable-backport: Backported in 6.12.75"
+
 CVE_STATUS[CVE-2026-22976] = "cpe-stable-backport: Backported in 6.12.66"
 
 CVE_STATUS[CVE-2026-22977] = "cpe-stable-backport: Backported in 6.12.66"
@@ -20920,9 +20922,9 @@ CVE_STATUS[CVE-2026-23224] = "cpe-stable-backport: Backported in 6.12.72"
 
 CVE_STATUS[CVE-2026-23225] = "fixed-version: only affects 6.19 onwards"
 
-# CVE-2026-23226 needs backporting (fixed from 7.0rc1)
+CVE_STATUS[CVE-2026-23226] = "cpe-stable-backport: Backported in 6.12.77"
 
-# CVE-2026-23227 needs backporting (fixed from 7.0rc1)
+CVE_STATUS[CVE-2026-23227] = "cpe-stable-backport: Backported in 6.12.77"
 
 CVE_STATUS[CVE-2026-23228] = "cpe-stable-backport: Backported in 6.12.72"
 
@@ -20946,3 +20948,9 @@ CVE_STATUS[CVE-2026-23237] = "cpe-stable-backport: Backported in 6.12.74"
 
 CVE_STATUS[CVE-2026-23238] = "cpe-stable-backport: Backported in 6.12.74"
 
+CVE_STATUS[CVE-2026-23239] = "cpe-stable-backport: Backported in 6.12.75"
+
+CVE_STATUS[CVE-2026-23240] = "cpe-stable-backport: Backported in 6.12.75"
+
+CVE_STATUS[CVE-2026-23241] = "cpe-stable-backport: Backported in 6.12.75"
+
-- 
2.43.0


