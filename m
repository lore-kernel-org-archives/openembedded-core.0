Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 918BECAC5B3
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 19:05:43 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web11.39.1758654340313516926
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Sep 2025 12:05:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Qs9gkM2H;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-7bb414430d4so1540106d6.0
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 12:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758654339; x=1759259139; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Ce1Svr83pKu6TEtIk+QrzKzuwmqFJYyAF0N7isHZNw=;
        b=Qs9gkM2HKFDanpzsIwh5vyBEgSv8igNqSXemlRAljrTFsev6mkJDFzVcmDiXJA+wiK
         Le+669oUZik/TmV8bA/2hgzL9axgyI9DqpsMN5zTs0HL0MbUxXOlgY4VIirYTkLcrGmL
         UChjWYxWMEsfRvCIe11Cv2cmdW1YRGeqFwwClhxdocD0sQBY9bCn3HR6Hi5hKinBg1aQ
         GOJ6/3nKWW/To2PifYfWFU3MHcoZxetKD6TZakVpD9s1NLKlK3JU8AesvivrzVVSp+3e
         AcrcatPQnS1sfvSFuzAHvowbP+576YwrcbExwsHd1ZK+cZjTzGwl30DjQ8R46Siz+rux
         Gzpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758654339; x=1759259139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Ce1Svr83pKu6TEtIk+QrzKzuwmqFJYyAF0N7isHZNw=;
        b=KC7qKqjuQ53trcz4aI/mTjUuRvZfF2TuJdk96LRPi0EUyFeWHTvRr7cAT9fyiyHcrH
         wrQxFoBNskus1G+i23P0nFcwx4v+G4hGY+xT2UKhobeDpQzeWsw8hTIX58fF+UUFUlHa
         JmZM8+F9da3drVGVumVDpDjPS7gKK8VfMqb2pb0GNOeRyJsV/FgsCbRAIw8Z47lRG8lb
         4VeKdXntp41Qb0MdcnVvIjmlNj7zDzTH59vZlxZCXHrSVvpeA1oWaZ3TSIgxt4NX4/MW
         8hgUGlv2TEWbHJz1OtncyqFuxKt92PlekqDkNCH5jMuF5AAHocAl4RxXG+TendTvuiHl
         C9Fw==
X-Gm-Message-State: AOJu0YyFYqLkLGcjy89yRaHxi50t0g1OGLBR/SmB912d8gYpn/SULUH9
	LrOvjhe6TNasKZx5RmOj8y+H9HV5Xhyq+O5d9MdqYoXkAK7/6cXGUv+ftV0vWqdoKmg=
X-Gm-Gg: ASbGncvI7oTgtX3wAT9wZ8Ysfguvv4yjnyB7m9Z8r+KGdQHHAOHqf6blHmxNIDoKuHt
	C6JDLyr+jvbz4YT+wrUIVwi4FJpU14X6OmLK5CzYPO/o1sTfLRGobCtfoVC4mYsp213DUws5YZs
	W9+sx9HnhTYBIpWat0Z7+3oUm/AiRfu7+5x4EttBTFRoxRS6P0V9B0iF+BUhmiL12NOqaU1X31I
	R4AI7MvuRc5h53iTptcpVuUrRCH/x61aM92poiGtQOIffByw40DrLJ2D/58t9IsP9YopsbB5yHY
	NAo8WIAdtJj7hOxABQ1IJYirTPxjZpdcZ7fGvXQqjx8Hg/QjlrJvFSiQAoIc703h3U/l8etaYDB
	Y1CzFtZYLuTHSWbp/k6RyM/yuuzRRfM2uWsFMj7ZMlh5QeuCr1Q/ML82f2lOV5gR/c5U95ZSbR+
	Gm/a27dHE2jT38SPfohnnBzTSaOt4grCKTfF7GKyEjmdNz2DW4cdHufkE=
X-Google-Smtp-Source: AGHT+IEnP2oYrbqJK0X5eLjGeMTGaQdBV5CB2zNaqEzhwgXEjnvwZsHGGi2s/f9zNdNt7gvmu2cexw==
X-Received: by 2002:a05:6214:2463:b0:7ad:2ac3:c475 with SMTP id 6a1803df08f44-7e7a480fafbmr42826756d6.12.1758654338541;
        Tue, 23 Sep 2025 12:05:38 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7b0c0934e27sm55463576d6.64.2025.09.23.12.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 12:05:37 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/5] linux-yocto/6.16: update CVE exclusions (6.16.8)
Date: Tue, 23 Sep 2025 15:05:30 -0400
Message-Id: <a843fae9f0ed0a6b846b578b258552618a66ad3d.1758654194.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1758654194.git.bruce.ashfield@gmail.com>
References: <cover.1758654194.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 19:05:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223917

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Data pulled from: https://github.com/CVEProject/cvelistV5

    1/1 [
        Author: cvelistV5 Github Action
        Email: github_action@example.com
        Subject: 4 changes (4 new | 0 updated): - 4 new CVEs: CVE-2025-10779, CVE-2025-59799, CVE-2025-59800, CVE-2025-59801 - 0 updated CVEs:
        Date: Mon, 22 Sep 2025 03:15:41 +0000

    ]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/cve-exclusion_6.16.inc              | 1462 ++++++++++++++---
 1 file changed, 1276 insertions(+), 186 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.16.inc b/meta/recipes-kernel/linux/cve-exclusion_6.16.inc
index 631d65f197..a6d72242e2 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.16.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.16.inc
@@ -1,11 +1,11 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2025-09-11 19:55:57.111103+00:00 for kernel version 6.16.7
-# From linux_kernel_cves cve_2025-09-11_1900Z-3-gccd3d370b06
+# Generated at 2025-09-22 03:24:59.110083+00:00 for kernel version 6.16.8
+# From linux_kernel_cves cve_2025-09-22_0200Z-2-gd662e5ed470
 
 
 python check_kernel_cve_status_version() {
-    this_version = "6.16.7"
+    this_version = "6.16.8"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
@@ -4654,6 +4654,370 @@ CVE_STATUS[CVE-2022-50231] = "fixed-version: Fixed from version 6.0"
 
 CVE_STATUS[CVE-2022-50233] = "fixed-version: Fixed from version 6.0"
 
+CVE_STATUS[CVE-2022-50234] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50235] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50236] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50239] = "fixed-version: Fixed from version 6.1"
+
+# CVE-2022-50240 has no known resolution
+
+CVE_STATUS[CVE-2022-50241] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50242] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50243] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50244] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50245] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50246] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50247] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50248] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50249] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50250] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50251] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50252] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50253] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50254] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50255] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50256] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50257] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50258] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2022-50259] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50260] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50261] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50262] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50263] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50264] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50265] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50266] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50267] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50268] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50269] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2022-50270] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50271] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50272] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50273] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50274] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50275] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50276] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50277] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50278] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50279] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2022-50280] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50281] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50282] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50283] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50284] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50285] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50286] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50287] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50288] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50289] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50291] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50292] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50293] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50294] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2022-50295] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50296] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50297] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50298] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50299] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50300] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50301] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50302] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50303] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50304] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50305] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50306] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50307] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50308] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50309] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50310] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50311] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50312] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50313] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50314] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50315] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50316] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50317] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50318] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50319] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50320] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50321] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2022-50322] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50323] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50324] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50325] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50326] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50327] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50328] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50329] = "fixed-version: Fixed from version 6.1.3"
+
+CVE_STATUS[CVE-2022-50330] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50331] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50332] = "fixed-version: Fixed from version 6.0.6"
+
+CVE_STATUS[CVE-2022-50333] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50334] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50335] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50336] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50337] = "fixed-version: Fixed from version 6.2"
+
+# CVE-2022-50338 has no known resolution
+
+CVE_STATUS[CVE-2022-50339] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50340] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50341] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50342] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50343] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50344] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50345] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50346] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50347] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50348] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50349] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50350] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50351] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50352] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50353] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50354] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50355] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50356] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50357] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50358] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50359] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50360] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50361] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2022-50362] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50363] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50364] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50365] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50366] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50367] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50368] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50369] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2022-50370] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50371] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50372] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50373] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50374] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50375] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50376] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50378] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50379] = "fixed-version: Fixed from version 6.1"
+
+# CVE-2022-50380 has no known resolution
+
+CVE_STATUS[CVE-2022-50381] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50382] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50383] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50384] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50385] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50386] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50387] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50388] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50389] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50390] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50391] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50392] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50393] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50394] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50395] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50396] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50397] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50398] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50399] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50400] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50401] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50402] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50403] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50404] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50405] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50406] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50407] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50408] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50409] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50410] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50411] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50412] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50413] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50414] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50415] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50416] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50417] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50418] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50419] = "fixed-version: Fixed from version 6.1"
+
 CVE_STATUS[CVE-2023-32246] = "fixed-version: Fixed from version 6.4"
 
 CVE_STATUS[CVE-2023-32249] = "fixed-version: Fixed from version 6.4"
@@ -5506,365 +5870,943 @@ CVE_STATUS[CVE-2023-52924] = "fixed-version: Fixed from version 6.5"
 
 CVE_STATUS[CVE-2023-52925] = "fixed-version: Fixed from version 6.4.12"
 
-CVE_STATUS[CVE-2023-52926] = "fixed-version: Fixed from version 6.7"
+CVE_STATUS[CVE-2023-52926] = "fixed-version: Fixed from version 6.7"
+
+CVE_STATUS[CVE-2023-52927] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-52928] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2023-52929] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2023-52930] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2023-52931] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2023-52932] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2023-52933] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2023-52934] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2023-52935] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2023-52936] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2023-52937] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2023-52938] = "fixed-version: Fixed from version 6.1.11"
+
+CVE_STATUS[CVE-2023-52939] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2023-52940] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2023-52941] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2023-52942] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2023-52973] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2023-52974] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2023-52975] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2023-52976] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2023-52977] = "fixed-version: Fixed from version 6.1.11"
+
+CVE_STATUS[CVE-2023-52978] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2023-52979] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2023-52980] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2023-52981] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2023-52982] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2023-52983] = "fixed-version: Fixed from version 6.1.11"
+
+CVE_STATUS[CVE-2023-52984] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2023-52985] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2023-52986] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2023-52987] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2023-52988] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2023-52989] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2023-52991] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2023-52992] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2023-52993] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2023-52994] = "fixed-version: Fixed from version 6.1.9"
+
+CVE_STATUS[CVE-2023-52995] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2023-52996] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2023-52997] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2023-52998] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2023-52999] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2023-53000] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2023-53002] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2023-53003] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2023-53004] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2023-53005] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2023-53006] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2023-53007] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2023-53008] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2023-53009] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2023-53010] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2023-53011] = "fixed-version: Fixed from version 6.2"
+
+# CVE-2023-53012 has no known resolution
+
+CVE_STATUS[CVE-2023-53013] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2023-53014] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2023-53015] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2023-53016] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2023-53017] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2023-53018] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2023-53019] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2023-53020] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2023-53021] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2023-53022] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2023-53023] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2023-53024] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2023-53026] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2023-53028] = "fixed-version: Fixed from version 6.1.8"
+
+CVE_STATUS[CVE-2023-53029] = "fixed-version: Fixed from version 6.1.8"
+
+CVE_STATUS[CVE-2023-53030] = "fixed-version: Fixed from version 6.1.8"
+
+CVE_STATUS[CVE-2023-53031] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2023-53032] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2023-53033] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2023-53034] = "fixed-version: Fixed from version 6.15"
+
+CVE_STATUS[CVE-2023-53035] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53036] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53037] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53038] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53039] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53040] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53041] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53042] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53043] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53044] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53045] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53046] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53047] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53048] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53049] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53050] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53051] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53052] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53053] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53054] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53055] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53056] = "fixed-version: Fixed from version 6.2.9"
+
+CVE_STATUS[CVE-2023-53057] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53058] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53059] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53060] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53061] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53062] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53064] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53065] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53066] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53067] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53068] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53069] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53070] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53071] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53072] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53073] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53074] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53075] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53077] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53078] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53079] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53080] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53081] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53082] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53083] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53084] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53085] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53086] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53087] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53088] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53089] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53090] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53091] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53092] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53093] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53094] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53095] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53096] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53097] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53098] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53099] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53100] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53101] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53102] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53103] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53105] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53106] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53107] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53108] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53109] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53110] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53111] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53112] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53113] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53114] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53115] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53116] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53117] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53118] = "fixed-version: Fixed from version 6.2.8"
+
+CVE_STATUS[CVE-2023-53119] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53120] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53121] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53123] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53124] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53125] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53126] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53127] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53128] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53131] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53132] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53133] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53134] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53135] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53136] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53138] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53139] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53140] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53141] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53142] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53143] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53144] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53145] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53146] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53147] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53148] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53149] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53150] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53151] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53152] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53153] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53163] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2023-53164] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53165] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53166] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53167] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53168] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53169] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53170] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53171] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53172] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53173] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53174] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53175] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53176] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53177] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53178] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53179] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53180] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53181] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53182] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53183] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53184] = "fixed-version: Fixed from version 6.4.8"
+
+CVE_STATUS[CVE-2023-53185] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53186] = "fixed-version: Fixed from version 6.3"
+
+# CVE-2023-53187 has no known resolution
+
+CVE_STATUS[CVE-2023-53188] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53189] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53190] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2023-53191] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53192] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53193] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53194] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53195] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53196] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53197] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53198] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53199] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53200] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53201] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53202] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53203] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53204] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53205] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53206] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53207] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53208] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53209] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53210] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53211] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53213] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53214] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53215] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53216] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53217] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53218] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53219] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53220] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53221] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53222] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53223] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53224] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53225] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53226] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53228] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53229] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53230] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53231] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53232] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53233] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53234] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53235] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53236] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53237] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53238] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53239] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53240] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53241] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53242] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53243] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53244] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53245] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53246] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53247] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53248] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53249] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53250] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53251] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53252] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53253] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53254] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53255] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53256] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53257] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53258] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53259] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53260] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53261] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53262] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53263] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53264] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53265] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53266] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53267] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-52927] = "fixed-version: Fixed from version 6.6"
+CVE_STATUS[CVE-2023-53268] = "fixed-version: Fixed from version 6.4"
 
-CVE_STATUS[CVE-2023-52928] = "fixed-version: Fixed from version 6.2"
+CVE_STATUS[CVE-2023-53269] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-52929] = "fixed-version: Fixed from version 6.2"
+CVE_STATUS[CVE-2023-53270] = "fixed-version: Fixed from version 6.4"
 
-CVE_STATUS[CVE-2023-52930] = "fixed-version: Fixed from version 6.2"
+CVE_STATUS[CVE-2023-53271] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-52931] = "fixed-version: Fixed from version 6.2"
+CVE_STATUS[CVE-2023-53272] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2023-52932] = "fixed-version: Fixed from version 6.2"
+CVE_STATUS[CVE-2023-53273] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-52933] = "fixed-version: Fixed from version 6.2"
+CVE_STATUS[CVE-2023-53274] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2023-52934] = "fixed-version: Fixed from version 6.2"
+CVE_STATUS[CVE-2023-53275] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2023-52935] = "fixed-version: Fixed from version 6.2"
+CVE_STATUS[CVE-2023-53276] = "fixed-version: Fixed from version 6.4"
 
-CVE_STATUS[CVE-2023-52936] = "fixed-version: Fixed from version 6.2"
+CVE_STATUS[CVE-2023-53277] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-52937] = "fixed-version: Fixed from version 6.2"
+CVE_STATUS[CVE-2023-53278] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-52938] = "fixed-version: Fixed from version 6.1.11"
+CVE_STATUS[CVE-2023-53279] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-52939] = "fixed-version: Fixed from version 6.2"
+CVE_STATUS[CVE-2023-53280] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2023-52940] = "fixed-version: Fixed from version 6.2"
+CVE_STATUS[CVE-2023-53281] = "fixed-version: Fixed from version 6.4"
 
-CVE_STATUS[CVE-2023-52941] = "fixed-version: Fixed from version 6.2"
+CVE_STATUS[CVE-2023-53282] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-52942] = "fixed-version: Fixed from version 6.2"
+CVE_STATUS[CVE-2023-53284] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-52973] = "fixed-version: Fixed from version 6.2"
+CVE_STATUS[CVE-2023-53285] = "fixed-version: Fixed from version 6.4"
 
-CVE_STATUS[CVE-2023-52974] = "fixed-version: Fixed from version 6.2"
+CVE_STATUS[CVE-2023-53286] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2023-52975] = "fixed-version: Fixed from version 6.2"
+CVE_STATUS[CVE-2023-53287] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2023-52976] = "fixed-version: Fixed from version 6.2"
+CVE_STATUS[CVE-2023-53288] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2023-52977] = "fixed-version: Fixed from version 6.1.11"
+CVE_STATUS[CVE-2023-53289] = "fixed-version: Fixed from version 6.4"
 
-CVE_STATUS[CVE-2023-52978] = "fixed-version: Fixed from version 6.2"
+CVE_STATUS[CVE-2023-53290] = "fixed-version: Fixed from version 6.4"
 
-CVE_STATUS[CVE-2023-52979] = "fixed-version: Fixed from version 6.2"
+CVE_STATUS[CVE-2023-53291] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2023-52980] = "fixed-version: Fixed from version 6.2"
+CVE_STATUS[CVE-2023-53292] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2023-52981] = "fixed-version: Fixed from version 6.2"
+CVE_STATUS[CVE-2023-53293] = "fixed-version: Fixed from version 6.4"
 
-CVE_STATUS[CVE-2023-52982] = "fixed-version: Fixed from version 6.2"
+CVE_STATUS[CVE-2023-53294] = "fixed-version: Fixed from version 6.4"
 
-CVE_STATUS[CVE-2023-52983] = "fixed-version: Fixed from version 6.1.11"
+CVE_STATUS[CVE-2023-53295] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-52984] = "fixed-version: Fixed from version 6.2"
+CVE_STATUS[CVE-2023-53296] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-52985] = "fixed-version: Fixed from version 6.2"
+CVE_STATUS[CVE-2023-53297] = "fixed-version: Fixed from version 6.4"
 
-CVE_STATUS[CVE-2023-52986] = "fixed-version: Fixed from version 6.2"
+CVE_STATUS[CVE-2023-53298] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-52987] = "fixed-version: Fixed from version 6.2"
+CVE_STATUS[CVE-2023-53299] = "fixed-version: Fixed from version 6.4"
 
-CVE_STATUS[CVE-2023-52988] = "fixed-version: Fixed from version 6.2"
+CVE_STATUS[CVE-2023-53300] = "fixed-version: Fixed from version 6.4"
 
-CVE_STATUS[CVE-2023-52989] = "fixed-version: Fixed from version 6.2"
+CVE_STATUS[CVE-2023-53301] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-52991] = "fixed-version: Fixed from version 6.2"
+CVE_STATUS[CVE-2023-53302] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-52992] = "fixed-version: Fixed from version 6.2"
+CVE_STATUS[CVE-2023-53303] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2023-52993] = "fixed-version: Fixed from version 6.2"
+CVE_STATUS[CVE-2023-53304] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2023-52994] = "fixed-version: Fixed from version 6.1.9"
+CVE_STATUS[CVE-2023-53305] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2023-52995] = "fixed-version: Fixed from version 6.2"
+CVE_STATUS[CVE-2023-53306] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-52996] = "fixed-version: Fixed from version 6.2"
+CVE_STATUS[CVE-2023-53307] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-52997] = "fixed-version: Fixed from version 6.2"
+CVE_STATUS[CVE-2023-53308] = "fixed-version: Fixed from version 6.4"
 
-CVE_STATUS[CVE-2023-52998] = "fixed-version: Fixed from version 6.2"
+CVE_STATUS[CVE-2023-53309] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2023-52999] = "fixed-version: Fixed from version 6.2"
+CVE_STATUS[CVE-2023-53310] = "fixed-version: Fixed from version 6.4"
 
-CVE_STATUS[CVE-2023-53000] = "fixed-version: Fixed from version 6.2"
+CVE_STATUS[CVE-2023-53311] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2023-53002] = "fixed-version: Fixed from version 6.2"
+CVE_STATUS[CVE-2023-53312] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2023-53003] = "fixed-version: Fixed from version 6.2"
+CVE_STATUS[CVE-2023-53313] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2023-53004] = "fixed-version: Fixed from version 6.2"
+CVE_STATUS[CVE-2023-53314] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2023-53005] = "fixed-version: Fixed from version 6.2"
+CVE_STATUS[CVE-2023-53315] = "fixed-version: Fixed from version 6.4"
 
-CVE_STATUS[CVE-2023-53006] = "fixed-version: Fixed from version 6.2"
+CVE_STATUS[CVE-2023-53316] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2023-53007] = "fixed-version: Fixed from version 6.2"
+CVE_STATUS[CVE-2023-53317] = "fixed-version: Fixed from version 6.4"
 
-CVE_STATUS[CVE-2023-53008] = "fixed-version: Fixed from version 6.2"
+CVE_STATUS[CVE-2023-53318] = "fixed-version: Fixed from version 6.4"
 
-CVE_STATUS[CVE-2023-53009] = "fixed-version: Fixed from version 6.2"
+CVE_STATUS[CVE-2023-53319] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2023-53010] = "fixed-version: Fixed from version 6.2"
+CVE_STATUS[CVE-2023-53320] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-53011] = "fixed-version: Fixed from version 6.2"
+CVE_STATUS[CVE-2023-53321] = "fixed-version: Fixed from version 6.6"
 
-# CVE-2023-53012 has no known resolution
+CVE_STATUS[CVE-2023-53322] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2023-53013] = "fixed-version: Fixed from version 6.2"
+CVE_STATUS[CVE-2023-53323] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2023-53014] = "fixed-version: Fixed from version 6.2"
+CVE_STATUS[CVE-2023-53324] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2023-53015] = "fixed-version: Fixed from version 6.2"
+CVE_STATUS[CVE-2023-53325] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2023-53016] = "fixed-version: Fixed from version 6.2"
+CVE_STATUS[CVE-2023-53326] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-53017] = "fixed-version: Fixed from version 6.2"
+CVE_STATUS[CVE-2023-53327] = "fixed-version: Fixed from version 6.4"
 
-CVE_STATUS[CVE-2023-53018] = "fixed-version: Fixed from version 6.2"
+CVE_STATUS[CVE-2023-53328] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2023-53019] = "fixed-version: Fixed from version 6.2"
+CVE_STATUS[CVE-2023-53329] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2023-53020] = "fixed-version: Fixed from version 6.2"
+CVE_STATUS[CVE-2023-53330] = "fixed-version: Fixed from version 6.2"
 
-CVE_STATUS[CVE-2023-53021] = "fixed-version: Fixed from version 6.2"
+CVE_STATUS[CVE-2023-53331] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2023-53022] = "fixed-version: Fixed from version 6.2"
+CVE_STATUS[CVE-2023-53332] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-53023] = "fixed-version: Fixed from version 6.2"
+CVE_STATUS[CVE-2023-53333] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2023-53024] = "fixed-version: Fixed from version 6.2"
+CVE_STATUS[CVE-2023-53334] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-53026] = "fixed-version: Fixed from version 6.2"
+CVE_STATUS[CVE-2023-53335] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-53028] = "fixed-version: Fixed from version 6.1.8"
+CVE_STATUS[CVE-2023-53336] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2023-53029] = "fixed-version: Fixed from version 6.1.8"
+CVE_STATUS[CVE-2023-53337] = "fixed-version: Fixed from version 6.4"
 
-CVE_STATUS[CVE-2023-53030] = "fixed-version: Fixed from version 6.1.8"
+CVE_STATUS[CVE-2023-53338] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2023-53031] = "fixed-version: Fixed from version 6.2"
+CVE_STATUS[CVE-2023-53339] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2023-53032] = "fixed-version: Fixed from version 6.2"
+CVE_STATUS[CVE-2023-53340] = "fixed-version: Fixed from version 6.4"
 
-CVE_STATUS[CVE-2023-53033] = "fixed-version: Fixed from version 6.2"
+CVE_STATUS[CVE-2023-53341] = "fixed-version: Fixed from version 6.2"
 
-CVE_STATUS[CVE-2023-53034] = "fixed-version: Fixed from version 6.15"
+CVE_STATUS[CVE-2023-53342] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2023-53035] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53343] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2023-53036] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53344] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-53037] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53345] = "fixed-version: Fixed from version 6.4"
 
-CVE_STATUS[CVE-2023-53038] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53346] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-53039] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53347] = "fixed-version: Fixed from version 6.4"
 
-CVE_STATUS[CVE-2023-53040] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53348] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-53041] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53349] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-53042] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53350] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2023-53043] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53351] = "fixed-version: Fixed from version 6.4"
 
-CVE_STATUS[CVE-2023-53044] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53352] = "fixed-version: Fixed from version 6.4.10"
 
-CVE_STATUS[CVE-2023-53045] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53353] = "fixed-version: Fixed from version 6.4"
 
-CVE_STATUS[CVE-2023-53046] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53354] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2023-53047] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53355] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-53048] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53356] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2023-53049] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53357] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2023-53050] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53358] = "fixed-version: Fixed from version 6.4"
 
-CVE_STATUS[CVE-2023-53051] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53359] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-53052] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53360] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2023-53053] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53361] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2023-53054] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53362] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2023-53055] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53363] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-53056] = "fixed-version: Fixed from version 6.2.9"
+CVE_STATUS[CVE-2023-53364] = "fixed-version: Fixed from version 6.4.12"
 
-CVE_STATUS[CVE-2023-53057] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53365] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2023-53058] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53366] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-53059] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53367] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2023-53060] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53368] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2023-53061] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53369] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2023-53062] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53370] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2023-53064] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53371] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2023-53065] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53372] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-53066] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53373] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-53067] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53374] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2023-53068] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53375] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-53069] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53376] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-53070] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53377] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2023-53071] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53378] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-53072] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53379] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2023-53073] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53380] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2023-53074] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53381] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-53075] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53382] = "fixed-version: Fixed from version 6.4"
 
-CVE_STATUS[CVE-2023-53077] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53383] = "fixed-version: Fixed from version 6.4"
 
-CVE_STATUS[CVE-2023-53078] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53384] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2023-53079] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53385] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2023-53080] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53386] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2023-53081] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53387] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-53082] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53388] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-53083] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53389] = "fixed-version: Fixed from version 6.4"
 
-CVE_STATUS[CVE-2023-53084] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53390] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-53085] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53391] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2023-53086] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53392] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-53087] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53393] = "fixed-version: Fixed from version 6.2"
 
-CVE_STATUS[CVE-2023-53088] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53394] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2023-53089] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53395] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2023-53090] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53396] = "fixed-version: Fixed from version 6.4"
 
-CVE_STATUS[CVE-2023-53091] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53397] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2023-53092] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53398] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-53093] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53399] = "fixed-version: Fixed from version 6.4"
 
-CVE_STATUS[CVE-2023-53094] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53400] = "fixed-version: Fixed from version 6.4"
 
-CVE_STATUS[CVE-2023-53095] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53401] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2023-53096] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53402] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-53097] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53403] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-53098] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53404] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-53099] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53405] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-53100] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53406] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-53101] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53407] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-53102] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53408] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-53103] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53409] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-53105] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53410] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-53106] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53411] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-53107] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53412] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-53108] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53413] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-53109] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53414] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-53110] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53415] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-53111] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53416] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-53112] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53417] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-53113] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53418] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-53114] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53419] = "fixed-version: Fixed from version 6.4"
 
-CVE_STATUS[CVE-2023-53115] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53420] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2023-53116] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53421] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2023-53117] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53422] = "fixed-version: Fixed from version 6.4"
 
-CVE_STATUS[CVE-2023-53118] = "fixed-version: Fixed from version 6.2.8"
+CVE_STATUS[CVE-2023-53423] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-53119] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53424] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2023-53120] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53425] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2023-53121] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53426] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2023-53123] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53427] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-53124] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53428] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2023-53125] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53429] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2023-53126] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53430] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-53127] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53431] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-53128] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53432] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2023-53131] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53433] = "fixed-version: Fixed from version 6.4"
 
-CVE_STATUS[CVE-2023-53132] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53434] = "fixed-version: Fixed from version 6.4"
 
-CVE_STATUS[CVE-2023-53133] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53435] = "fixed-version: Fixed from version 6.4"
 
-CVE_STATUS[CVE-2023-53134] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53436] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2023-53135] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53437] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-53136] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53438] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2023-53138] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53439] = "fixed-version: Fixed from version 6.4"
 
-CVE_STATUS[CVE-2023-53139] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53440] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-53140] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53441] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2023-53141] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53442] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2023-53142] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53443] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-53143] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53444] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2023-53144] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53445] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-53145] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-53446] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2023-53146] = "fixed-version: Fixed from version 6.6"
+CVE_STATUS[CVE-2023-53447] = "fixed-version: Fixed from version 6.5"
 
 CVE_STATUS[CVE-2024-26581] = "fixed-version: Fixed from version 6.8"
 
@@ -14308,8 +15250,6 @@ CVE_STATUS[CVE-2025-38378] = "fixed-version: Fixed from version 6.16"
 
 CVE_STATUS[CVE-2025-38379] = "fixed-version: Fixed from version 6.15.6"
 
-CVE_STATUS[CVE-2025-38380] = "fixed-version: Fixed from version 6.16"
-
 CVE_STATUS[CVE-2025-38381] = "fixed-version: Fixed from version 6.16"
 
 CVE_STATUS[CVE-2025-38382] = "fixed-version: Fixed from version 6.16"
@@ -15258,6 +16198,156 @@ CVE_STATUS[CVE-2025-39790] = "cpe-stable-backport: Backported in 6.16.4"
 
 CVE_STATUS[CVE-2025-39791] = "cpe-stable-backport: Backported in 6.16.4"
 
+CVE_STATUS[CVE-2025-39792] = "cpe-stable-backport: Backported in 6.16.2"
+
+CVE_STATUS[CVE-2025-39793] = "cpe-stable-backport: Backported in 6.16.2"
+
+CVE_STATUS[CVE-2025-39794] = "cpe-stable-backport: Backported in 6.16.2"
+
+CVE_STATUS[CVE-2025-39795] = "cpe-stable-backport: Backported in 6.16.2"
+
+CVE_STATUS[CVE-2025-39796] = "cpe-stable-backport: Backported in 6.16.2"
+
+CVE_STATUS[CVE-2025-39797] = "cpe-stable-backport: Backported in 6.16.2"
+
+CVE_STATUS[CVE-2025-39798] = "cpe-stable-backport: Backported in 6.16.2"
+
+CVE_STATUS[CVE-2025-39799] = "fixed-version: only affects 6.17rc1 onwards"
+
+CVE_STATUS[CVE-2025-39800] = "cpe-stable-backport: Backported in 6.16.4"
+
+CVE_STATUS[CVE-2025-39801] = "cpe-stable-backport: Backported in 6.16.4"
+
+CVE_STATUS[CVE-2025-39802] = "cpe-stable-backport: Backported in 6.16.4"
+
+CVE_STATUS[CVE-2025-39803] = "cpe-stable-backport: Backported in 6.16.4"
+
+CVE_STATUS[CVE-2025-39804] = "cpe-stable-backport: Backported in 6.16.4"
+
+CVE_STATUS[CVE-2025-39805] = "cpe-stable-backport: Backported in 6.16.5"
+
+CVE_STATUS[CVE-2025-39806] = "cpe-stable-backport: Backported in 6.16.5"
+
+CVE_STATUS[CVE-2025-39807] = "cpe-stable-backport: Backported in 6.16.5"
+
+CVE_STATUS[CVE-2025-39808] = "cpe-stable-backport: Backported in 6.16.5"
+
+CVE_STATUS[CVE-2025-39809] = "cpe-stable-backport: Backported in 6.16.5"
+
+CVE_STATUS[CVE-2025-39810] = "cpe-stable-backport: Backported in 6.16.5"
+
+CVE_STATUS[CVE-2025-39811] = "cpe-stable-backport: Backported in 6.16.5"
+
+CVE_STATUS[CVE-2025-39812] = "cpe-stable-backport: Backported in 6.16.5"
+
+CVE_STATUS[CVE-2025-39813] = "cpe-stable-backport: Backported in 6.16.5"
+
+CVE_STATUS[CVE-2025-39814] = "cpe-stable-backport: Backported in 6.16.5"
+
+CVE_STATUS[CVE-2025-39815] = "cpe-stable-backport: Backported in 6.16.5"
+
+CVE_STATUS[CVE-2025-39816] = "cpe-stable-backport: Backported in 6.16.5"
+
+CVE_STATUS[CVE-2025-39817] = "cpe-stable-backport: Backported in 6.16.5"
+
+CVE_STATUS[CVE-2025-39818] = "cpe-stable-backport: Backported in 6.16.5"
+
+CVE_STATUS[CVE-2025-39819] = "cpe-stable-backport: Backported in 6.16.5"
+
+CVE_STATUS[CVE-2025-39820] = "cpe-stable-backport: Backported in 6.16.5"
+
+CVE_STATUS[CVE-2025-39821] = "cpe-stable-backport: Backported in 6.16.5"
+
+CVE_STATUS[CVE-2025-39822] = "cpe-stable-backport: Backported in 6.16.5"
+
+CVE_STATUS[CVE-2025-39823] = "cpe-stable-backport: Backported in 6.16.5"
+
+CVE_STATUS[CVE-2025-39824] = "cpe-stable-backport: Backported in 6.16.5"
+
+CVE_STATUS[CVE-2025-39825] = "cpe-stable-backport: Backported in 6.16.5"
+
+CVE_STATUS[CVE-2025-39826] = "cpe-stable-backport: Backported in 6.16.5"
+
+CVE_STATUS[CVE-2025-39827] = "cpe-stable-backport: Backported in 6.16.5"
+
+CVE_STATUS[CVE-2025-39828] = "cpe-stable-backport: Backported in 6.16.5"
+
+CVE_STATUS[CVE-2025-39829] = "cpe-stable-backport: Backported in 6.16.5"
+
+CVE_STATUS[CVE-2025-39830] = "cpe-stable-backport: Backported in 6.16.5"
+
+CVE_STATUS[CVE-2025-39831] = "cpe-stable-backport: Backported in 6.16.5"
+
+CVE_STATUS[CVE-2025-39832] = "cpe-stable-backport: Backported in 6.16.5"
+
+CVE_STATUS[CVE-2025-39833] = "cpe-stable-backport: Backported in 6.16.5"
+
+CVE_STATUS[CVE-2025-39834] = "cpe-stable-backport: Backported in 6.16.5"
+
+CVE_STATUS[CVE-2025-39835] = "cpe-stable-backport: Backported in 6.16.5"
+
+CVE_STATUS[CVE-2025-39836] = "cpe-stable-backport: Backported in 6.16.5"
+
+CVE_STATUS[CVE-2025-39837] = "cpe-stable-backport: Backported in 6.16.6"
+
+CVE_STATUS[CVE-2025-39838] = "cpe-stable-backport: Backported in 6.16.6"
+
+CVE_STATUS[CVE-2025-39839] = "cpe-stable-backport: Backported in 6.16.6"
+
+CVE_STATUS[CVE-2025-39840] = "cpe-stable-backport: Backported in 6.16.6"
+
+CVE_STATUS[CVE-2025-39841] = "cpe-stable-backport: Backported in 6.16.6"
+
+CVE_STATUS[CVE-2025-39842] = "cpe-stable-backport: Backported in 6.16.6"
+
+CVE_STATUS[CVE-2025-39843] = "cpe-stable-backport: Backported in 6.16.6"
+
+CVE_STATUS[CVE-2025-39844] = "cpe-stable-backport: Backported in 6.16.6"
+
+CVE_STATUS[CVE-2025-39845] = "cpe-stable-backport: Backported in 6.16.6"
+
+CVE_STATUS[CVE-2025-39846] = "cpe-stable-backport: Backported in 6.16.6"
+
+CVE_STATUS[CVE-2025-39847] = "cpe-stable-backport: Backported in 6.16.6"
+
+CVE_STATUS[CVE-2025-39848] = "cpe-stable-backport: Backported in 6.16.6"
+
+CVE_STATUS[CVE-2025-39849] = "cpe-stable-backport: Backported in 6.16.6"
+
+CVE_STATUS[CVE-2025-39850] = "cpe-stable-backport: Backported in 6.16.6"
+
+CVE_STATUS[CVE-2025-39851] = "cpe-stable-backport: Backported in 6.16.6"
+
+CVE_STATUS[CVE-2025-39852] = "cpe-stable-backport: Backported in 6.16.6"
+
+CVE_STATUS[CVE-2025-39853] = "cpe-stable-backport: Backported in 6.16.6"
+
+CVE_STATUS[CVE-2025-39854] = "cpe-stable-backport: Backported in 6.16.6"
+
+CVE_STATUS[CVE-2025-39855] = "cpe-stable-backport: Backported in 6.16.6"
+
+CVE_STATUS[CVE-2025-39856] = "cpe-stable-backport: Backported in 6.16.6"
+
+CVE_STATUS[CVE-2025-39857] = "cpe-stable-backport: Backported in 6.16.6"
+
+CVE_STATUS[CVE-2025-39858] = "cpe-stable-backport: Backported in 6.16.6"
+
+CVE_STATUS[CVE-2025-39859] = "cpe-stable-backport: Backported in 6.16.6"
+
+CVE_STATUS[CVE-2025-39860] = "cpe-stable-backport: Backported in 6.16.6"
+
+CVE_STATUS[CVE-2025-39861] = "cpe-stable-backport: Backported in 6.16.6"
+
+CVE_STATUS[CVE-2025-39862] = "cpe-stable-backport: Backported in 6.16.6"
+
+CVE_STATUS[CVE-2025-39863] = "cpe-stable-backport: Backported in 6.16.6"
+
+CVE_STATUS[CVE-2025-39864] = "cpe-stable-backport: Backported in 6.16.6"
+
+CVE_STATUS[CVE-2025-39865] = "cpe-stable-backport: Backported in 6.16.6"
+
+CVE_STATUS[CVE-2025-39866] = "cpe-stable-backport: Backported in 6.16.6"
+
 CVE_STATUS[CVE-2025-39930] = "fixed-version: Fixed from version 6.15"
 
 CVE_STATUS[CVE-2025-39989] = "fixed-version: Fixed from version 6.15"
@@ -15266,7 +16356,7 @@ CVE_STATUS[CVE-2025-40014] = "fixed-version: Fixed from version 6.15"
 
 CVE_STATUS[CVE-2025-40114] = "fixed-version: Fixed from version 6.15"
 
-# CVE-2025-40300 has no known resolution
+CVE_STATUS[CVE-2025-40300] = "cpe-stable-backport: Backported in 6.16.7"
 
 CVE_STATUS[CVE-2025-40325] = "fixed-version: Fixed from version 6.15"
 
-- 
2.39.2


