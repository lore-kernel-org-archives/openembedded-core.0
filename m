Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72E7BD1CDD7
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 04:30:42 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35240.1764822639694509028
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Dec 2025 20:30:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GaEjG4/r;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-88057f5d041so4432606d6.1
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Dec 2025 20:30:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764822639; x=1765427439; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nfo2Fh9u9vD1Uxm3r9xLG3nzBGEHLLoHUk7Hr+7Lpmc=;
        b=GaEjG4/rZo1eX3AaU0K11kF/Tjw/tGhYD6vSc4CjlmxJk1UIDjH0nZZgcSBVypmXKF
         QFYeK+48MMnZWyiBHwiicxZzF20CYpzKVb84TABXxAD9qW3nnhXSwv2Eo4BgfqSc9EAS
         Cfzx5oYAi2Uqv9ayMGEL13mPQz+dyU+x4ypo2g+ydVX8g+JsJIEPc0MB+QsG1MLfDB9I
         86Az9uCav3CVKMFYKBfXficTpMzNiu+PCjjcdx2o5izcAAnIfMzgmtcXkrwpflRMEeIC
         yTi+wKP1J/r0hrtnGkwBw41DHNkEJfAX8+VZ1nbJK8wXOfl+HeeKhpoALOnbG91yBozx
         dGqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764822639; x=1765427439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nfo2Fh9u9vD1Uxm3r9xLG3nzBGEHLLoHUk7Hr+7Lpmc=;
        b=lK4+AZ0rLKN235v3z3TmSnUhVtZnAGurx4wy+ZcWVL5LcYRzzO56ATE6sueXVBdeQ7
         Q9cByl+8MNgIs6Gezk54xdf5lceQeVBrYatblu7PD3XpYN+rMdme5XgiBzgV3qSpgDtL
         V5oF7ji+TQXdqXMVy8eTirYHyIlWMsLyk/UlgaU7Ziyq2gyW9LMn1tE8kyX7kqJxxbA6
         J4dj7owVsKBShvez6mCvjnF85ZyOUwMLUdqRcUvjZpijD4nODPyWwFvu/jNAF1epCvA+
         UIP/qqlNGhI+X+tAFlmV97mumpsIumt+U+QnqJVcCNk33VugNRc3qxVUGsoqfqK7eMgy
         Ek5w==
X-Gm-Message-State: AOJu0YwAMnd6qxPUUyAzbxDCMjrAEZIbqO1csC2oildUPj72GvpzQBPH
	IhD1KTiC9c8J/lxR95yjDWWS1MS1CcYjIGDcAG5Y3fc+rMFT1OxfcemhVruXJq3Q5vM=
X-Gm-Gg: ASbGncvbLHdL9qzYyniTm5lQmj+35ZR6MW2eXyXxIGkyd1dQjWHpr2Oxa7H2cPp/xjJ
	GF0T79iST3h212kZ3y/u3DiYnRc5O/y81DuPNhZRK2zKMoUvFzLSCKr9M++PoljC/uGjekqomkg
	ejNK5uznmB9DwaKWo4dxeoK6YzXG2LDfrUOC5IoGR6Afcysr5TGfnmuUBL6ZqHtYi5eRLooHtVH
	b6sYaHhPvKNGcUdR86ontIGTrMeyMvh3K/qWQJQXydyUpumpKd7yms3A2moAh0tU6sR6571ElTO
	zBnUzZQbKGWOoKxght3GNr8KoQuiHaE+jLF2kDCVpjy/t/A03CDnhS9wOqtvKrfTSxPv5Zt23I0
	5P1Mv2SMvWKW6AUU/L2f++500MrZFX+ivHjYcoErb/jVhRjdzM2KUQU9pvKvHxaZHctMJt0hJwF
	p78XLpgL06e6+QqAMwXZ/kQeAqBZGrRoSPMUxLdoOq7ROqcI+FOzdYgJbjpMln92ZnQZIM97Iil
	oLp9W5ZUXQ6gKk=
X-Google-Smtp-Source: AGHT+IFbqnqFokB6pKPoA5Wb4+IG2008AwMKAjrqxBdaUzol/M4CZuIa8i0HMpt8YEx7SSLmq6KidQ==
X-Received: by 2002:a05:6214:2aa4:b0:880:22f3:335e with SMTP id 6a1803df08f44-88824818833mr29722026d6.7.1764822638650;
        Wed, 03 Dec 2025 20:30:38 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88827f3347asm3191476d6.6.2025.12.03.20.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 20:30:38 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 06/16] linux-yocto/6.17: update CVE exclusions (6.17.8)
Date: Wed,  3 Dec 2025 23:30:18 -0500
Message-Id: <b2ade059f752afcd313cabf4ecb055e9991392ab.1764822465.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1764822465.git.bruce.ashfield@gmail.com>
References: <cover.1764822465.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 04:30:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227257

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Data pulled from: https://github.com/CVEProject/cvelistV5

    1/1 [
        Author: cvelistV5 Github Action
        Email: github_action@example.com
        Subject: 4 changes (2 new | 2 updated): - 2 new CVEs: CVE-2024-44630, CVE-2025-64446 - 2 updated CVEs: CVE-2024-11920, CVE-2024-7021
        Date: Fri, 14 Nov 2025 15:57:02 +0000

    ]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/cve-exclusion_6.17.inc              | 204 +++++++++++++++++-
 1 file changed, 201 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.17.inc b/meta/recipes-kernel/linux/cve-exclusion_6.17.inc
index f60050d6470..10dc5930194 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.17.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.17.inc
@@ -1,11 +1,11 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2025-11-04 13:42:54.522185+00:00 for kernel version 6.17.7
-# From linux_kernel_cves cve_2025-11-04_1300Z-2-geaff4df6d09
+# Generated at 2025-11-14 16:03:48.166784+00:00 for kernel version 6.17.8
+# From linux_kernel_cves cve_2025-11-14_1500Z-6-g27598c15037
 
 
 python check_kernel_cve_status_version() {
-    this_version = "6.17.7"
+    this_version = "6.17.8"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
@@ -17692,8 +17692,206 @@ CVE_STATUS[CVE-2025-40106] = "cpe-stable-backport: Backported in 6.17.6"
 
 CVE_STATUS[CVE-2025-40107] = "fixed-version: Fixed from version 6.17"
 
+CVE_STATUS[CVE-2025-40108] = "cpe-stable-backport: Backported in 6.17.2"
+
+CVE_STATUS[CVE-2025-40109] = "cpe-stable-backport: Backported in 6.17.2"
+
+CVE_STATUS[CVE-2025-40110] = "cpe-stable-backport: Backported in 6.17.4"
+
+CVE_STATUS[CVE-2025-40111] = "cpe-stable-backport: Backported in 6.17.4"
+
+CVE_STATUS[CVE-2025-40112] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40113] = "cpe-stable-backport: Backported in 6.17.3"
+
 CVE_STATUS[CVE-2025-40114] = "fixed-version: Fixed from version 6.15"
 
+CVE_STATUS[CVE-2025-40115] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40116] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40117] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40118] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40119] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40120] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40121] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40122] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40123] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40124] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40125] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40126] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40127] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40129] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40130] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40131] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40132] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40133] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40134] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40135] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40136] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40137] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40138] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40139] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40140] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40141] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40142] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40143] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40144] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40145] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40146] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40147] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40148] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40149] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40150] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40151] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40152] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40153] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40154] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40155] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40156] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40157] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40158] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40159] = "cpe-stable-backport: Backported in 6.17.4"
+
+CVE_STATUS[CVE-2025-40160] = "cpe-stable-backport: Backported in 6.17.4"
+
+CVE_STATUS[CVE-2025-40161] = "cpe-stable-backport: Backported in 6.17.4"
+
+CVE_STATUS[CVE-2025-40162] = "cpe-stable-backport: Backported in 6.17.5"
+
+CVE_STATUS[CVE-2025-40163] = "cpe-stable-backport: Backported in 6.17.5"
+
+CVE_STATUS[CVE-2025-40164] = "cpe-stable-backport: Backported in 6.17.5"
+
+CVE_STATUS[CVE-2025-40165] = "cpe-stable-backport: Backported in 6.17.5"
+
+CVE_STATUS[CVE-2025-40166] = "cpe-stable-backport: Backported in 6.17.5"
+
+CVE_STATUS[CVE-2025-40167] = "cpe-stable-backport: Backported in 6.17.5"
+
+CVE_STATUS[CVE-2025-40168] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40169] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40170] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40171] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40172] = "cpe-stable-backport: Backported in 6.17.5"
+
+CVE_STATUS[CVE-2025-40173] = "cpe-stable-backport: Backported in 6.17.5"
+
+CVE_STATUS[CVE-2025-40174] = "cpe-stable-backport: Backported in 6.17.5"
+
+CVE_STATUS[CVE-2025-40175] = "cpe-stable-backport: Backported in 6.17.5"
+
+CVE_STATUS[CVE-2025-40176] = "cpe-stable-backport: Backported in 6.17.5"
+
+CVE_STATUS[CVE-2025-40177] = "cpe-stable-backport: Backported in 6.17.5"
+
+CVE_STATUS[CVE-2025-40178] = "cpe-stable-backport: Backported in 6.17.4"
+
+CVE_STATUS[CVE-2025-40179] = "cpe-stable-backport: Backported in 6.17.4"
+
+CVE_STATUS[CVE-2025-40180] = "cpe-stable-backport: Backported in 6.17.4"
+
+CVE_STATUS[CVE-2025-40181] = "cpe-stable-backport: Backported in 6.17.4"
+
+CVE_STATUS[CVE-2025-40182] = "cpe-stable-backport: Backported in 6.17.4"
+
+CVE_STATUS[CVE-2025-40183] = "cpe-stable-backport: Backported in 6.17.4"
+
+CVE_STATUS[CVE-2025-40184] = "cpe-stable-backport: Backported in 6.17.4"
+
+CVE_STATUS[CVE-2025-40185] = "cpe-stable-backport: Backported in 6.17.4"
+
+CVE_STATUS[CVE-2025-40186] = "cpe-stable-backport: Backported in 6.17.4"
+
+CVE_STATUS[CVE-2025-40187] = "cpe-stable-backport: Backported in 6.17.4"
+
+CVE_STATUS[CVE-2025-40188] = "cpe-stable-backport: Backported in 6.17.4"
+
+CVE_STATUS[CVE-2025-40189] = "cpe-stable-backport: Backported in 6.17.4"
+
+CVE_STATUS[CVE-2025-40190] = "cpe-stable-backport: Backported in 6.17.4"
+
+CVE_STATUS[CVE-2025-40191] = "cpe-stable-backport: Backported in 6.17.4"
+
+CVE_STATUS[CVE-2025-40192] = "cpe-stable-backport: Backported in 6.17.4"
+
+CVE_STATUS[CVE-2025-40193] = "cpe-stable-backport: Backported in 6.17.4"
+
+CVE_STATUS[CVE-2025-40194] = "cpe-stable-backport: Backported in 6.17.4"
+
+CVE_STATUS[CVE-2025-40195] = "cpe-stable-backport: Backported in 6.17.4"
+
+CVE_STATUS[CVE-2025-40196] = "cpe-stable-backport: Backported in 6.17.4"
+
+CVE_STATUS[CVE-2025-40197] = "cpe-stable-backport: Backported in 6.17.4"
+
+CVE_STATUS[CVE-2025-40198] = "cpe-stable-backport: Backported in 6.17.4"
+
+CVE_STATUS[CVE-2025-40199] = "cpe-stable-backport: Backported in 6.17.4"
+
+CVE_STATUS[CVE-2025-40200] = "cpe-stable-backport: Backported in 6.17.4"
+
+CVE_STATUS[CVE-2025-40201] = "cpe-stable-backport: Backported in 6.17.4"
+
+CVE_STATUS[CVE-2025-40202] = "cpe-stable-backport: Backported in 6.17.4"
+
+CVE_STATUS[CVE-2025-40203] = "cpe-stable-backport: Backported in 6.17.4"
+
+CVE_STATUS[CVE-2025-40204] = "cpe-stable-backport: Backported in 6.17.4"
+
+CVE_STATUS[CVE-2025-40205] = "cpe-stable-backport: Backported in 6.17.4"
+
+CVE_STATUS[CVE-2025-40206] = "cpe-stable-backport: Backported in 6.17.4"
+
+CVE_STATUS[CVE-2025-40207] = "cpe-stable-backport: Backported in 6.17.4"
+
+CVE_STATUS[CVE-2025-40208] = "cpe-stable-backport: Backported in 6.17.4"
+
 CVE_STATUS[CVE-2025-40300] = "fixed-version: Fixed from version 6.17"
 
 CVE_STATUS[CVE-2025-40325] = "fixed-version: Fixed from version 6.15"
-- 
2.39.2


