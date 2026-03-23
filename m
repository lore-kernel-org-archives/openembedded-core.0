Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B1C8F46120
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 13:51:16 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18034.1774273871878439802
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Mar 2026 06:51:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z5qaM15t;
 spf=pass (domain: gmail.com, ip: 209.85.160.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-506a747448dso25083041cf.0
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 06:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774273871; x=1774878671; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ah1C8+WdBxno5f1MUNToR51MZMKAMXivCmEdkcfI7gA=;
        b=Z5qaM15tDxR6EO48C6/4BvWRGB+BCUtbgNeBm3QpiQUQrgj48ndt0ozipSkqnnwGPo
         x8wW7XCrUfeUlsqAO3aROv8v02M/OOMrAHG5U6wWjxZzxrRRXgHm+awnBgVHJmxNfvtl
         Ahv8NCAEWObsZbu03vkx0u10KgBbnlQq0kU38dcV9Tfq9mt+pvmtEySivpWSz1oT7o8X
         ermxESoZ5uHPp/eKguscQ/XspJHfr82g3jKIhKBccznpOw9Cw1UswPB0H68DOS7Gf6Cc
         trdRBmKfuzVeM0E6OaIhttH3GqCttaXQbS6mo50y8c1uzX0p5WcQv56KNmlK0/ZXoh49
         uFOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774273871; x=1774878671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ah1C8+WdBxno5f1MUNToR51MZMKAMXivCmEdkcfI7gA=;
        b=aMEvnwOAE7htRaTHWkVXji+kTQuzs67YoyymhJYFTqcaVcVGvXM8xqQTlhCAVXSfYm
         vc+rh52Si+jGmGo8WigAftzsrAaPyCz4DbXR8l25qyyWmVGPukp5Lx1YUNmfGYG5Gnnj
         tWiV2PlXzxoM9ewh0VlORTrFMutETEuBrMA/JHdtAM++ihx7jhM/yhRwNm+OvF4pio7N
         +e6QO0imGV9T/hRemBxnOlfXouhODUGUyJe/9YxZymFPzCaeMxsm45QjOomRC2KdbaGq
         fTagKx71V4WAijZo8VeGvU6jyehJMhUnbkqGJ79cybeStZX7YiJrlc7f4O5Z1ptmYWfX
         ZNwQ==
X-Gm-Message-State: AOJu0Yyj6kT8ahjEPQuZZYI0IIMqxfkDQ2+ukkYctpbdUFMj+hKMwZIU
	CBBTvMxQmAI6iK4dnmVI0ThnPo8BRMHo/ToJq2v84A7Z5JX9BAKStTzF
X-Gm-Gg: ATEYQzxG59RImpOBJvlCU/OmLBGixmMglma4B7OuSMIhA0suhpd4eV8UbpCre5vjk11
	SLJD8/m2Wba0TX2u+BHdsI7kiMDLtjniK2hmtqSIhZS8HA+Q+YjHLGoB1BmEw7QP/dFFappaVsM
	SU4eTQRa+VCtXDft/AELYIWoqKpSgbea/2VqPe3XAmVZbUHt06NBAamohd4Z/Z4fHcIw0EExkPh
	AHRUe2ur+T2vDMWm8W8S1a5qLwpQBgJ0qw1aB+qWel1trpdXVwPKXLv4iWkHYpaCc0gKdxw/L9C
	ztATlIoBDm08CT5b9N6ZGi1suxzdurkqZzgXZTX7E47BVixTwpyrcSAlRL5oUkdYy7Tv7ReJpgK
	zuo2VWOlqoFP5KV/qKiyFT2iuZFclPC3tviqZtt5QY6oSJ+J1sXE8s0iDYQvAE4p24zezOru+Cm
	Ll4RY3SsH0pwLkVjxBQfjT6Oak5WnlvxnzNPFoBH0y0Nb3xbMxAhzSyg19wkTKuqZhxlPFzSf3+
	EODnLbuoKVtH7E4BIiHdxWOKdbJ+wvpXp3+PuVpU5LeMHRI/q3RrQirPmY=
X-Received: by 2002:a05:622a:1a9f:b0:50b:37a6:e497 with SMTP id d75a77b69052e-50b37a6f68fmr191244671cf.44.1774273870710;
        Mon, 23 Mar 2026 06:51:10 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50b664cddc3sm17232041cf.5.2026.03.23.06.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 06:51:10 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [meta][PATCH 09/11] linux-yocto/6.18: update CVE exclusions (6.18.19)
Date: Mon, 23 Mar 2026 09:50:55 -0400
Message-ID: <20260323135057.1605923-10-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260323135057.1605923-1-bruce.ashfield@gmail.com>
References: <20260323135057.1605923-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 13:51:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233728

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Data pulled from: https://github.com/CVEProject/cvelistV5

    1/1 [
        Author: cvelistV5 Github Action
        Email: github_action@example.com
        Subject: 3 changes (1 new | 2 updated): - 1 new CVEs: CVE-2026-4606 - 2 updated CVEs: CVE-2024-1394, CVE-2025-7195
        Date: Mon, 23 Mar 2026 01:28:23 +0000

    ]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/cve-exclusion_6.18.inc              | 92 ++++++++++++++++++-
 1 file changed, 89 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.18.inc b/meta/recipes-kernel/linux/cve-exclusion_6.18.inc
index e6df676ae7..73b93ff135 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.18.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.18.inc
@@ -1,11 +1,11 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2026-03-17 18:38:31.921355+00:00 for kernel version 6.18.18
-# From linux_kernel_cves cve_2026-03-17_1700Z-2-g05851354eaa
+# Generated at 2026-03-23 02:14:01.393507+00:00 for kernel version 6.18.19
+# From linux_kernel_cves cve_2026-03-23_0100Z
 
 
 python check_kernel_cve_status_version() {
-    this_version = "6.18.18"
+    this_version = "6.18.19"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
@@ -20422,6 +20422,18 @@ CVE_STATUS[CVE-2025-71238] = "cpe-stable-backport: Backported in 6.18.13"
 
 CVE_STATUS[CVE-2025-71239] = "cpe-stable-backport: Backported in 6.18.16"
 
+CVE_STATUS[CVE-2025-71265] = "cpe-stable-backport: Backported in 6.18.16"
+
+CVE_STATUS[CVE-2025-71266] = "cpe-stable-backport: Backported in 6.18.16"
+
+CVE_STATUS[CVE-2025-71267] = "cpe-stable-backport: Backported in 6.18.16"
+
+CVE_STATUS[CVE-2025-71268] = "cpe-stable-backport: Backported in 6.18.10"
+
+CVE_STATUS[CVE-2025-71269] = "cpe-stable-backport: Backported in 6.18.10"
+
+CVE_STATUS[CVE-2025-71270] = "cpe-stable-backport: Backported in 6.18.10"
+
 CVE_STATUS[CVE-2026-22976] = "cpe-stable-backport: Backported in 6.18.6"
 
 CVE_STATUS[CVE-2026-22977] = "cpe-stable-backport: Backported in 6.18.6"
@@ -20954,3 +20966,77 @@ CVE_STATUS[CVE-2026-23240] = "cpe-stable-backport: Backported in 6.18.16"
 
 CVE_STATUS[CVE-2026-23241] = "cpe-stable-backport: Backported in 6.18.16"
 
+CVE_STATUS[CVE-2026-23242] = "cpe-stable-backport: Backported in 6.18.14"
+
+CVE_STATUS[CVE-2026-23243] = "cpe-stable-backport: Backported in 6.18.14"
+
+CVE_STATUS[CVE-2026-23244] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23245] = "cpe-stable-backport: Backported in 6.18.18"
+
+CVE_STATUS[CVE-2026-23246] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23247] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23248] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23249] = "cpe-stable-backport: Backported in 6.18.16"
+
+CVE_STATUS[CVE-2026-23250] = "cpe-stable-backport: Backported in 6.18.16"
+
+CVE_STATUS[CVE-2026-23251] = "cpe-stable-backport: Backported in 6.18.16"
+
+CVE_STATUS[CVE-2026-23252] = "cpe-stable-backport: Backported in 6.18.16"
+
+CVE_STATUS[CVE-2026-23253] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23254] = "cpe-stable-backport: Backported in 6.18.10"
+
+CVE_STATUS[CVE-2026-23255] = "cpe-stable-backport: Backported in 6.18.10"
+
+CVE_STATUS[CVE-2026-23256] = "cpe-stable-backport: Backported in 6.18.10"
+
+CVE_STATUS[CVE-2026-23257] = "cpe-stable-backport: Backported in 6.18.10"
+
+CVE_STATUS[CVE-2026-23258] = "cpe-stable-backport: Backported in 6.18.10"
+
+CVE_STATUS[CVE-2026-23259] = "cpe-stable-backport: Backported in 6.18.10"
+
+CVE_STATUS[CVE-2026-23260] = "cpe-stable-backport: Backported in 6.18.10"
+
+CVE_STATUS[CVE-2026-23261] = "cpe-stable-backport: Backported in 6.18.10"
+
+CVE_STATUS[CVE-2026-23262] = "cpe-stable-backport: Backported in 6.18.10"
+
+CVE_STATUS[CVE-2026-23263] = "cpe-stable-backport: Backported in 6.18.10"
+
+CVE_STATUS[CVE-2026-23264] = "cpe-stable-backport: Backported in 6.18.10"
+
+CVE_STATUS[CVE-2026-23265] = "cpe-stable-backport: Backported in 6.18.13"
+
+CVE_STATUS[CVE-2026-23266] = "cpe-stable-backport: Backported in 6.18.13"
+
+CVE_STATUS[CVE-2026-23267] = "cpe-stable-backport: Backported in 6.18.13"
+
+CVE_STATUS[CVE-2026-23268] = "cpe-stable-backport: Backported in 6.18.18"
+
+CVE_STATUS[CVE-2026-23269] = "cpe-stable-backport: Backported in 6.18.18"
+
+CVE_STATUS[CVE-2026-23270] = "cpe-stable-backport: Backported in 6.18.18"
+
+CVE_STATUS[CVE-2026-23271] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23272] = "cpe-stable-backport: Backported in 6.18.17"
+
+CVE_STATUS[CVE-2026-23273] = "cpe-stable-backport: Backported in 6.18.14"
+
+CVE_STATUS[CVE-2026-23274] = "cpe-stable-backport: Backported in 6.18.19"
+
+CVE_STATUS[CVE-2026-23275] = "cpe-stable-backport: Backported in 6.18.19"
+
+CVE_STATUS[CVE-2026-23276] = "cpe-stable-backport: Backported in 6.18.19"
+
+CVE_STATUS[CVE-2026-23277] = "cpe-stable-backport: Backported in 6.18.19"
+
+CVE_STATUS[CVE-2026-23278] = "cpe-stable-backport: Backported in 6.18.19"
+
-- 
2.43.0


