Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46B26C83F35
	for <webhook@archiver.kernel.org>; Wed, 16 Jul 2025 13:49:06 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web11.22531.1752673742015963836
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jul 2025 06:49:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LVBMBLaq;
 spf=pass (domain: gmail.com, ip: 209.85.222.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7d3f192a64eso642544185a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 06:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752673741; x=1753278541; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=deNx64KL82G3NL7ng0l326jG7bSTnyS+kNO89/59fas=;
        b=LVBMBLaq4k1VxSrZHZkA7hcK9rpsBgKK9FwixtjsciQAIkwJvzB/GpCnutHJ7lCW59
         JA4iLL6NiQ2TXLDZxhhHln0V2GJlU9VwN3yx7KX8rvhrVV6YUCghFYR5lf0LIMCbHId1
         dpeKcqF7AG06S1v1Q1MXXN6EGiPhxZQpMIIL5tSg+OlGACdkHDhxizJ4J9rIRrZtMlJ0
         wBIFGQomeK5jO6+SdflN2hQ5L4fiX+4a1u02OnuWp56ySGdxQa369tLtpdRrFcvwi9RF
         VgUxl5SEuyGwcngEZjoYNa3pPWMueFq4b6QQ+Hm8+IU0rIYOSa84dGtmfLivh/kgeGBw
         sjbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752673741; x=1753278541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=deNx64KL82G3NL7ng0l326jG7bSTnyS+kNO89/59fas=;
        b=ihlv77xsY32YbV3Zs6TNjjyPqrnu+hkrpc11M7ZP8zCnWrs+pTR5HrPBqifHm+tQ1y
         qTN9reMKRFUf9eTGHbTGIqoPkFFXd2wVLafC5tjaRPbH9kDYTwMvyu8L2X1JlbpMDflW
         /Ey2GOeTAk/cwUKmkjBzdF7JQG/Ko8ngTDetkHMkq9G1t0XX8UPOEPde7qkq2YgBve47
         cScJikM5UywEkh3mWYxRgyJAS8JsY6RezXlBiWFtPKYM9e3xqxPsSdJdc70HB0YBzybV
         4+9O/nEmznTmRt81n594qyrRSUf+eEl8Tc9yPlwVlOWWnUmPWIa0xXR0ATvTp19S5AP/
         Wlyg==
X-Gm-Message-State: AOJu0Yw3jTb7klD9FXduUXJ3CnEfaIoBSwvQRQeb4ak8CzMBMsVG3vNn
	JthVmCzVZ1Ia5zJQ5HLIkhnON9nEgz9N8ox+9UVulioNmtzcSqHy8ZzbySmrCsF3
X-Gm-Gg: ASbGncsTX9M5SvZ5VGylTy0weqxKcboDhZpI5Rhd99m1jCtt6LjOgnMl/b4y3hHktJX
	zgxlmZhsoDA82//4PMqDPX7twiADQLf326XI+S++3qiV61/YfhYRoNge0wexi748u8M38prtIZg
	dlJDnaj8EAmds8IVj5lzGaebIFUDteVWT7vHDpRmrtglW92gZYS6ZZ2zHBnIlZ4EUUSJGizUiHF
	3yiu6/EJ91kR5ZXeToopa4YgJjy4mpRBQegtFQiH6qMgMeSj0D1V34CyBw4WGz5TpZ/pECF4avG
	rM2d6RKag381vg5ILGkKjuAMdrU4H7kePWhuhMiZJCEKPEExVpSMiuNTAwULXmnXJQt8VmsZ0tx
	ddHEHjeCzE7wFt7CrjBa9L8dAORXbJssPfEJWDjahcCOgf20k0JZnvAWmd8+dcRnz2pwAFHZjMO
	bRyMj+OGotIck1oFzzO2xlp2UFJmtu0N5jgg==
X-Google-Smtp-Source: AGHT+IFZxi+Q7IfPIlIp1UKWuKKAY7ECA9MultKLrP26U2NuTiYarXA09jv290ZHeqOowXDZ0jpazA==
X-Received: by 2002:a05:620a:7007:b0:7e3:35fe:46b8 with SMTP id af79cd13be357-7e342b66c9cmr422401185a.44.1752673740660;
        Wed, 16 Jul 2025 06:49:00 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e3443d830bsm84245085a.25.2025.07.16.06.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 06:49:00 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] linux-yocto/6.12: update CVE exclusions (6.12.38)
Date: Wed, 16 Jul 2025 09:48:53 -0400
Message-Id: <aadfaf8570102a198e779c738e8be6e69da62351.1752673419.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1752673419.git.bruce.ashfield@gmail.com>
References: <cover.1752673419.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 13:49:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220459

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Data pulled from: https://github.com/CVEProject/cvelistV5

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/cve-exclusion_6.12.inc              | 228 +++++++++++++++++-
 1 file changed, 224 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
index 98e90078d4..02931bbf79 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
@@ -1,11 +1,11 @@
 
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
@@ -13816,7 +13816,7 @@ CVE_STATUS[CVE-2025-38136] = "cpe-stable-backport: Backported in 6.12.34"
 
 CVE_STATUS[CVE-2025-38138] = "cpe-stable-backport: Backported in 6.12.34"
 
-# CVE-2025-38139 needs backporting (fixed from 6.16rc1)
+CVE_STATUS[CVE-2025-38139] = "cpe-stable-backport: Backported in 6.12.37"
 
 # CVE-2025-38140 needs backporting (fixed from 6.16rc1)
 
@@ -14014,8 +14014,228 @@ CVE_STATUS[CVE-2025-38236] = "cpe-stable-backport: Backported in 6.12.36"
 
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
2.39.2


