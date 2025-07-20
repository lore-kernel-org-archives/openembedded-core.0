Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87DD8C83F22
	for <webhook@archiver.kernel.org>; Sun, 20 Jul 2025 20:05:27 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.24817.1753041923705183476
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Jul 2025 13:05:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=z0KYLZbI;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-234b440afa7so34669075ad.0
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Jul 2025 13:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1753041923; x=1753646723; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MHEDZh+3TMFKqPKlhTsCYlbv5r8Yvk7NxX8Z7UfO9AU=;
        b=z0KYLZbI4a3nHAbIK90S6G3oBA3ig7jEQId1/3zHqsQL0U1PIcd28p8vDtohdWxy01
         YPRxVu9AGYDzDjfkBZvsZNuaGpv5+PDEOWW926/Tly7pbGNmHigXtjVuBfQR4xUdztv/
         7O8XsVUwjr+94ROIxar0WIW6QhwmUQVNpjpxaMApxqgjqqHvV34hEftghAvj53f4GK0+
         8zY85SJnKnHpGJR4jO4i1aUCouKBd4MQmSALz5CsyZHpDdUQz1hhkUBbSpPccrx98yWZ
         AzRcZ9SH7d2O/DxoK/++S6IQdU77ncCfxZ0piJ0ZSWpcoacguU8EViX1Rn7iTsGWOUZT
         YTQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753041923; x=1753646723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MHEDZh+3TMFKqPKlhTsCYlbv5r8Yvk7NxX8Z7UfO9AU=;
        b=Wk9vvPljNuebbXLhOjdeez6mASGcwM1oF0IUAyjcljy/Jy7od1oOm86GOoNh2KLmWZ
         MPfbVhvs2VSUZLV2TGrIqqB2/XL1wyJlkplZZq/cjJ2uz1tG9T/1FL4MBfolpRlVtqbL
         d3MITAWu+2nRQp7/K1AduRhIOQlH6OEDES1OA2fhR1+keNpwC4d9sYXr0SDelI+qQI64
         0KwA51i+Fo6oLtOrfh6vo/htaNH5893n1lVHZsIycI20dI+YPfT24SDydwyLRTRWqRBn
         HhyiO6KIQ1e0hAQ+I8Ji6oPRk8l5+1i2zAVThGwDCjAOZE9BPPnJVZBumm8xB1WDkto/
         x7qw==
X-Gm-Message-State: AOJu0YxY/+ELBxvMmbMRNd5aHOOB95o5vVFLzhpYcDz3Zyc99Xzsg8Gu
	/fc8r0BiE9PMe8zQvHGO82eP5Q+SOYNYuWHhlbQvApnKhcEU6+T21XM+wH+whMgncjMqUB2nEmw
	IzyL+FPo=
X-Gm-Gg: ASbGnctUyCwo2hXKUZ4A2oGZhXTXJKAXMlTmXKNRtoN4qI5f8adZ+dRaWwtCyJy0VJa
	d8XSHIhapFitvld1ttN6lPPRZtlEUH7DXg7KcLga7r9L1MEJx1TSzLq6ir0UdndScNFy7OhJreA
	pNaCHMmmoaJKuPwWCyll/RGtro2FucHURriz6RifYJslmM6L233/uDq2IUfSm3ccCPX0W7xXAyA
	K1LWJSDCtBfrwaxJeBaR+FqgCG4ZMoD+yKmM4P730O/yFi+vSMhB7MGfp2B5scFDRwmI92n2jYU
	6Rf+/ZH5im45n7zs0a6NVV67hVMr75nnh+oGt475QQs3XJIY5HnGXPsgKALBnzRd4cBXwANgnGR
	9L2mv3gLvvNOeYQ==
X-Google-Smtp-Source: AGHT+IEeHXCAC+6DioltfDngfUv45YjKntfzcc/doH708kT4JzeR5gb7hkt15AV/0otAMqXHqfk/Fw==
X-Received: by 2002:a17:903:284c:b0:236:8df9:ab38 with SMTP id d9443c01a7336-23e3033890dmr155824215ad.34.1753041922696;
        Sun, 20 Jul 2025 13:05:22 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:31c9:438f:a923:8d3c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b60f096sm44894035ad.78.2025.07.20.13.05.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 13:05:22 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 12/12] linux-yocto/6.12: update CVE exclusions (6.12.38)
Date: Sun, 20 Jul 2025 13:04:49 -0700
Message-ID: <deabe5e19a1b91e7456ecf180f3822e1e0db2210.1753041740.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1753041740.git.steve@sakoman.com>
References: <cover.1753041740.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Jul 2025 20:05:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220637

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Data pulled from: https://github.com/CVEProject/cvelistV5

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 00087de9bcdd96a75ec143abb7b8312c815eca53)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/cve-exclusion_6.12.inc              | 228 +++++++++++++++++-
 1 file changed, 224 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
index 6c816b66f4..924e3b90ca 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
@@ -1,12 +1,12 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2025-07-09 07:57:09.220247+00:00 for kernel version 6.12.36
-# From cvelistV5 cve_2025-07-09_0700Z-1-gca2b12e7c08
+# Generated at 2025-07-15 14:54:42.649263+00:00 for kernel version 6.12.38
+# From linux_kernel_cves cve_2025-07-15_1400Z-4-gc77733e1fe6
 
 
 
 python check_kernel_cve_status_version() {
-    this_version = "6.12.36"
+    this_version = "6.12.38"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
@@ -13817,7 +13817,7 @@ CVE_STATUS[CVE-2025-38136] = "cpe-stable-backport: Backported in 6.12.34"
 
 CVE_STATUS[CVE-2025-38138] = "cpe-stable-backport: Backported in 6.12.34"
 
-# CVE-2025-38139 needs backporting (fixed from 6.16rc1)
+CVE_STATUS[CVE-2025-38139] = "cpe-stable-backport: Backported in 6.12.37"
 
 # CVE-2025-38140 needs backporting (fixed from 6.16rc1)
 
@@ -14015,8 +14015,228 @@ CVE_STATUS[CVE-2025-38236] = "cpe-stable-backport: Backported in 6.12.36"
 
 # CVE-2025-38237 needs backporting (fixed from 6.16rc1)
 
+CVE_STATUS[CVE-2025-38238] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2025-38239] = "cpe-stable-backport: Backported in 6.12.36"
+
 CVE_STATUS[CVE-2025-38240] = "cpe-stable-backport: Backported in 6.12.23"
 
+CVE_STATUS[CVE-2025-38241] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2025-38242] = "cpe-stable-backport: Backported in 6.12.37"
+
+CVE_STATUS[CVE-2025-38243] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2025-38244] = "cpe-stable-backport: Backported in 6.12.36"
+
+CVE_STATUS[CVE-2025-38245] = "cpe-stable-backport: Backported in 6.12.36"
+
+CVE_STATUS[CVE-2025-38246] = "cpe-stable-backport: Backported in 6.12.36"
+
+CVE_STATUS[CVE-2025-38247] = "fixed-version: only affects 6.15 onwards"
+
+# CVE-2025-38248 needs backporting (fixed from 6.16rc4)
+
+CVE_STATUS[CVE-2025-38249] = "cpe-stable-backport: Backported in 6.12.36"
+
+CVE_STATUS[CVE-2025-38250] = "cpe-stable-backport: Backported in 6.12.36"
+
+CVE_STATUS[CVE-2025-38251] = "cpe-stable-backport: Backported in 6.12.36"
+
+CVE_STATUS[CVE-2025-38252] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2025-38253] = "cpe-stable-backport: Backported in 6.12.36"
+
+CVE_STATUS[CVE-2025-38254] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2025-38255] = "cpe-stable-backport: Backported in 6.12.36"
+
+CVE_STATUS[CVE-2025-38256] = "cpe-stable-backport: Backported in 6.12.36"
+
+CVE_STATUS[CVE-2025-38257] = "cpe-stable-backport: Backported in 6.12.36"
+
+CVE_STATUS[CVE-2025-38258] = "cpe-stable-backport: Backported in 6.12.36"
+
+CVE_STATUS[CVE-2025-38259] = "cpe-stable-backport: Backported in 6.12.36"
+
+CVE_STATUS[CVE-2025-38260] = "cpe-stable-backport: Backported in 6.12.36"
+
+# CVE-2025-38261 needs backporting (fixed from 6.16rc1)
+
+CVE_STATUS[CVE-2025-38262] = "cpe-stable-backport: Backported in 6.12.36"
+
+CVE_STATUS[CVE-2025-38263] = "cpe-stable-backport: Backported in 6.12.36"
+
+CVE_STATUS[CVE-2025-38264] = "cpe-stable-backport: Backported in 6.12.36"
+
+CVE_STATUS[CVE-2025-38265] = "cpe-stable-backport: Backported in 6.12.33"
+
+CVE_STATUS[CVE-2025-38266] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2025-38267] = "cpe-stable-backport: Backported in 6.12.34"
+
+CVE_STATUS[CVE-2025-38268] = "cpe-stable-backport: Backported in 6.12.34"
+
+CVE_STATUS[CVE-2025-38269] = "cpe-stable-backport: Backported in 6.12.34"
+
+CVE_STATUS[CVE-2025-38270] = "cpe-stable-backport: Backported in 6.12.34"
+
+CVE_STATUS[CVE-2025-38271] = "fixed-version: only affects 6.15 onwards"
+
+# CVE-2025-38272 needs backporting (fixed from 6.16rc1)
+
+CVE_STATUS[CVE-2025-38273] = "cpe-stable-backport: Backported in 6.12.34"
+
+CVE_STATUS[CVE-2025-38274] = "cpe-stable-backport: Backported in 6.12.34"
+
+CVE_STATUS[CVE-2025-38275] = "cpe-stable-backport: Backported in 6.12.34"
+
+CVE_STATUS[CVE-2025-38276] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2025-38277] = "cpe-stable-backport: Backported in 6.12.34"
+
+CVE_STATUS[CVE-2025-38278] = "cpe-stable-backport: Backported in 6.12.34"
+
+CVE_STATUS[CVE-2025-38279] = "cpe-stable-backport: Backported in 6.12.37"
+
+CVE_STATUS[CVE-2025-38280] = "cpe-stable-backport: Backported in 6.12.34"
+
+CVE_STATUS[CVE-2025-38281] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2025-38282] = "cpe-stable-backport: Backported in 6.12.34"
+
+CVE_STATUS[CVE-2025-38283] = "cpe-stable-backport: Backported in 6.12.34"
+
+# CVE-2025-38284 needs backporting (fixed from 6.16rc1)
+
+CVE_STATUS[CVE-2025-38285] = "cpe-stable-backport: Backported in 6.12.34"
+
+CVE_STATUS[CVE-2025-38286] = "cpe-stable-backport: Backported in 6.12.34"
+
+CVE_STATUS[CVE-2025-38287] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2025-38288] = "cpe-stable-backport: Backported in 6.12.34"
+
+CVE_STATUS[CVE-2025-38289] = "cpe-stable-backport: Backported in 6.12.37"
+
+CVE_STATUS[CVE-2025-38290] = "cpe-stable-backport: Backported in 6.12.34"
+
+CVE_STATUS[CVE-2025-38291] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2025-38292] = "cpe-stable-backport: Backported in 6.12.34"
+
+CVE_STATUS[CVE-2025-38293] = "cpe-stable-backport: Backported in 6.12.34"
+
+CVE_STATUS[CVE-2025-38294] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2025-38295] = "cpe-stable-backport: Backported in 6.12.34"
+
+CVE_STATUS[CVE-2025-38296] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2025-38297] = "cpe-stable-backport: Backported in 6.12.34"
+
+CVE_STATUS[CVE-2025-38298] = "cpe-stable-backport: Backported in 6.12.34"
+
+CVE_STATUS[CVE-2025-38299] = "cpe-stable-backport: Backported in 6.12.34"
+
+CVE_STATUS[CVE-2025-38300] = "cpe-stable-backport: Backported in 6.12.34"
+
+CVE_STATUS[CVE-2025-38301] = "cpe-stable-backport: Backported in 6.12.34"
+
+CVE_STATUS[CVE-2025-38302] = "cpe-stable-backport: Backported in 6.12.34"
+
+CVE_STATUS[CVE-2025-38303] = "cpe-stable-backport: Backported in 6.12.34"
+
+CVE_STATUS[CVE-2025-38304] = "cpe-stable-backport: Backported in 6.12.34"
+
+CVE_STATUS[CVE-2025-38305] = "cpe-stable-backport: Backported in 6.12.34"
+
+# CVE-2025-38306 needs backporting (fixed from 6.16rc1)
+
+CVE_STATUS[CVE-2025-38307] = "cpe-stable-backport: Backported in 6.12.34"
+
+CVE_STATUS[CVE-2025-38308] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2025-38309] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2025-38310] = "cpe-stable-backport: Backported in 6.12.34"
+
+# CVE-2025-38311 needs backporting (fixed from 6.16rc1)
+
+CVE_STATUS[CVE-2025-38312] = "cpe-stable-backport: Backported in 6.12.34"
+
+CVE_STATUS[CVE-2025-38313] = "cpe-stable-backport: Backported in 6.12.34"
+
+CVE_STATUS[CVE-2025-38314] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2025-38315] = "cpe-stable-backport: Backported in 6.12.34"
+
+CVE_STATUS[CVE-2025-38316] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2025-38317] = "cpe-stable-backport: Backported in 6.12.34"
+
+CVE_STATUS[CVE-2025-38318] = "cpe-stable-backport: Backported in 6.12.34"
+
+CVE_STATUS[CVE-2025-38319] = "cpe-stable-backport: Backported in 6.12.34"
+
+CVE_STATUS[CVE-2025-38320] = "cpe-stable-backport: Backported in 6.12.35"
+
+CVE_STATUS[CVE-2025-38321] = "cpe-stable-backport: Backported in 6.12.35"
+
+CVE_STATUS[CVE-2025-38322] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2025-38323] = "cpe-stable-backport: Backported in 6.12.35"
+
+CVE_STATUS[CVE-2025-38324] = "cpe-stable-backport: Backported in 6.12.35"
+
+CVE_STATUS[CVE-2025-38325] = "cpe-stable-backport: Backported in 6.12.35"
+
+CVE_STATUS[CVE-2025-38326] = "cpe-stable-backport: Backported in 6.12.35"
+
+CVE_STATUS[CVE-2025-38327] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2025-38328] = "cpe-stable-backport: Backported in 6.12.35"
+
+CVE_STATUS[CVE-2025-38329] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2025-38330] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2025-38331] = "cpe-stable-backport: Backported in 6.12.35"
+
+CVE_STATUS[CVE-2025-38332] = "cpe-stable-backport: Backported in 6.12.35"
+
+CVE_STATUS[CVE-2025-38333] = "cpe-stable-backport: Backported in 6.12.35"
+
+CVE_STATUS[CVE-2025-38334] = "cpe-stable-backport: Backported in 6.12.35"
+
+# CVE-2025-38335 needs backporting (fixed from 6.16rc1)
+
+CVE_STATUS[CVE-2025-38336] = "cpe-stable-backport: Backported in 6.12.35"
+
+CVE_STATUS[CVE-2025-38337] = "cpe-stable-backport: Backported in 6.12.35"
+
+CVE_STATUS[CVE-2025-38338] = "cpe-stable-backport: Backported in 6.12.35"
+
+CVE_STATUS[CVE-2025-38339] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2025-38340] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2025-38341] = "cpe-stable-backport: Backported in 6.12.35"
+
+CVE_STATUS[CVE-2025-38342] = "cpe-stable-backport: Backported in 6.12.35"
+
+CVE_STATUS[CVE-2025-38343] = "cpe-stable-backport: Backported in 6.12.35"
+
+CVE_STATUS[CVE-2025-38344] = "cpe-stable-backport: Backported in 6.12.35"
+
+CVE_STATUS[CVE-2025-38345] = "cpe-stable-backport: Backported in 6.12.35"
+
+CVE_STATUS[CVE-2025-38346] = "cpe-stable-backport: Backported in 6.12.35"
+
+CVE_STATUS[CVE-2025-38347] = "cpe-stable-backport: Backported in 6.12.35"
+
+CVE_STATUS[CVE-2025-38348] = "cpe-stable-backport: Backported in 6.12.35"
+
 CVE_STATUS[CVE-2025-38479] = "cpe-stable-backport: Backported in 6.12.23"
 
 CVE_STATUS[CVE-2025-38575] = "cpe-stable-backport: Backported in 6.12.23"
-- 
2.43.0


