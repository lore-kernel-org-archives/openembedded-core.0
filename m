Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEC95C0218E
	for <webhook@archiver.kernel.org>; Thu, 23 Jan 2025 03:00:17 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.2980.1737601213821623253
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jan 2025 19:00:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=bpiuJe4b;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-21675fd60feso7702145ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jan 2025 19:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1737601213; x=1738206013; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=huFhUOwohlNSw+rn2skzyaNDBwD1RcVbUqR/CLHRtY4=;
        b=bpiuJe4bkOst6v0lLkkZlpghGBYNvkN27xI3yS2e04RwvnzHqW1Qd7OHNbeEUOj/Pu
         xm19wYFBpjlLS84kKeWdKTvnHQUAOISWWgORbmnYQaMLABkbxg98kSZ4sFByDapcUzlQ
         aTTzmYR+d8otnDmtYXgPzr5OPAuZL9Mxl98qXXjQEW4D5spf4Z/wQJ1ivFRxH9eOTmON
         n5qfinta2PnEZZylTvnSdpY8uTIJFMQ4iA4Wi52T3t0TUJec4Fg3lal755MXvhJTCMGJ
         fDgagB0TXRism/2weATkpyGca3YThpOEZRJfs83yTDwTE2a1e3ErB1wgrLbv2brYm9RS
         MhmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737601213; x=1738206013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=huFhUOwohlNSw+rn2skzyaNDBwD1RcVbUqR/CLHRtY4=;
        b=KfL4znt5hv4bznELZzIQ9QDbjNNNukXah79FdD7Omo2DsEVmBIdfbKB2XCAThLTKNe
         IYrm8ZdruBzA6HbKsITXsU1ODn1SPfrAkcKNG0BlVHys4s4Z6QCiPbO7dTWkWh158Tyx
         htRP3FLU1fWPmjTvugu3pJsPBL4Y8av77/D6K4CO/tSok9PFzaL9ORLLKV/BZTmWjx3k
         6i2AwqIh+JzC08J/seQ8aOl9aWeTO2AfOTOfvQA7DJ4UpffWDN0crq6bXTfLZj2tzve1
         7Ld9RpamY3C01V0Z71hYkOhWFkGnZY4HlXa4ilE1xm4sUSiPl+tbjfAFN0Ql5/IVo2IT
         GzqA==
X-Gm-Message-State: AOJu0Yw0q4uUYhOUoK8v9COUCrE6D5llKEAFB8dNaCSBiKEYZin4RDcr
	/K16+snba50fBZFhj+mP8Ek5UhtBcPSPkCpvZQRuBluIeSXgVcvHT+qTrAL6mE5jkvGktRdj/nt
	g4k0=
X-Gm-Gg: ASbGncsTZvCXeA3MngeB5WTfPCXL6HixqYo9UQQRr6BjCCgQ1dLRghWnnQ3s0GcB7Bu
	XPCbDlu3Glbdp1pgT+Ge+z+aP6xIcqLnYfYswRu42XV5p2l21xQ7IdvGCpLzEvQmpi9D50jYhF7
	VGzb1OBmqtrUdbbucIVO3ksLr18qHSaEYnvA7czrnYiZeHrtT13K2imECy/IexxJkNn5W5Hgrbz
	Jgjm0m3hiBBlw/xQnz3xbHeYRUNOR321XWEUU6ouiu9bSo396ioSvXmyb0/3/ujxLLpAA==
X-Google-Smtp-Source: AGHT+IENPTHNphFwMqssNo4/hzj7/X9y4igWeO+R4CmdmxZ4qY+ZkY2lSjlNsE79wA0R23HmysN6sA==
X-Received: by 2002:a05:6a20:7491:b0:1e1:bef7:af57 with SMTP id adf61e73a8af0-1eb214a4638mr36594770637.21.1737601213017;
        Wed, 22 Jan 2025 19:00:13 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72dab816accsm12048389b3a.69.2025.01.22.19.00.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 19:00:12 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 2/8] rsync: fix CVE-2024-12085
Date: Wed, 22 Jan 2025 18:59:52 -0800
Message-ID: <fb8439e856d5ea10d12180020a14442c3b101e56.1737601063.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1737601063.git.steve@sakoman.com>
References: <cover.1737601063.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jan 2025 03:00:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210167

From: Archana Polampalli <archana.polampalli@windriver.com>

A flaw was found in the rsync daemon which could be triggered when rsync compares
file checksums. This flaw allows an attacker to manipulate the checksum length
(s2length) to cause a comparison between a checksum and uninitialized memory and
leak one byte of uninitialized stack data at a time.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../rsync/files/CVE-2024-12085.patch          | 32 +++++++++++++++++++
 meta/recipes-devtools/rsync/rsync_3.2.7.bb    |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2024-12085.patch

diff --git a/meta/recipes-devtools/rsync/files/CVE-2024-12085.patch b/meta/recipes-devtools/rsync/files/CVE-2024-12085.patch
new file mode 100644
index 0000000000..165d5a62f9
--- /dev/null
+++ b/meta/recipes-devtools/rsync/files/CVE-2024-12085.patch
@@ -0,0 +1,32 @@
+From 589b0691e59f761ccb05ddb8e1124991440db2c7 Mon Sep 17 00:00:00 2001
+From: Andrew Tridgell <andrew@tridgell.net>
+Date: Thu, 14 Nov 2024 09:57:08 +1100
+Subject: [PATCH] prevent information leak off the stack
+
+prevent leak of uninitialised stack data in hash_search
+
+CVE: CVE-2024-12085
+
+Upstream-Status: Backport [https://git.samba.org/?p=rsync.git;a=commit;h=589b0691e59f761ccb05ddb8e1124991440db2c7]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ match.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/match.c b/match.c
+index 36e78ed2..dfd6af2c 100644
+--- a/match.c
++++ b/match.c
+@@ -147,6 +147,9 @@ static void hash_search(int f,struct sum_struct *s,
+	int more;
+	schar *map;
+
++	// prevent possible memory leaks
++	memset(sum2, 0, sizeof sum2);
++
+	/* want_i is used to encourage adjacent matches, allowing the RLL
+	 * coding of the output to work more efficiently. */
+	want_i = 0;
+--
+2.40.0
diff --git a/meta/recipes-devtools/rsync/rsync_3.2.7.bb b/meta/recipes-devtools/rsync/rsync_3.2.7.bb
index 2f3ea61978..0d9c68a915 100644
--- a/meta/recipes-devtools/rsync/rsync_3.2.7.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.2.7.bb
@@ -17,6 +17,7 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/src/${BP}.tar.gz \
            file://0001-Add-missing-prototypes-to-function-declarations.patch \
            file://CVE-2024-12084-0001.patch \
            file://CVE-2024-12084-0002.patch \
+           file://CVE-2024-12085.patch \
            "
 SRC_URI[sha256sum] = "4e7d9d3f6ed10878c58c5fb724a67dacf4b6aac7340b13e488fb2dc41346f2bb"
 
-- 
2.43.0


