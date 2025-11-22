Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2BAACFD2F9
	for <webhook@archiver.kernel.org>; Sat, 22 Nov 2025 22:14:43 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3747.1763849680996138624
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Nov 2025 14:14:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=2UxcHayS;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-297ef378069so28460855ad.3
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Nov 2025 14:14:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1763849678; x=1764454478; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qemn87Sd+YJW+tsT1Rm60an8k4/9528uHl8OMAIFFiw=;
        b=2UxcHaySWQsB6rVEikj2jLPo0kbadHoYWWqJmfyb7b1ckarW4p5zL4tvKzjM7i7nds
         UA/QI3XnlU53RlavaF+9sbGzJsLaT6Pnn4yl7QaUomdMVByoojYrb3XevROTtU/FKq9Y
         Vd5KLFgKh4mFYwGQBnf2H/2eB24IzNQVd/FVePG3YPiWodE6Tskyu2g9tN5YoSzgzn0p
         tgCSCrNNvHg5Fm3OR6KQwHlpYsMx33Yd43v39dg4EqRZjch4quTIgiNQJVVLC7IMc58p
         cT+9Acu7snQOg2AdBkS9xBaLm2oWgkX2SjMuaO2NUEFf2PayJ9u2bZm5GWid4dbQdOBO
         ZkQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763849678; x=1764454478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qemn87Sd+YJW+tsT1Rm60an8k4/9528uHl8OMAIFFiw=;
        b=kYez1/mrE3j1t15mb2brNo5SHzZj+FxAunKEOsOG0StcdNWHCatNShyHirRRfa7siO
         yOlSry9Jwx4DksU3RpKeifl0OGmJZTvgkCPtCEbMPEU5pug/vDQOaVeSmz2exadYR4xW
         HV9fJPacgOrO+xPOOxHqmxJ+rcgNqeeako6LbxodhCvzAsTz0KFtuPrenqHFqjvxsXld
         xo4+pun4uZt/D1Vhpapazcx5YPz12ay/FOXugce4Vggl/7Wft72vxY+/CgNOoIxTrpGU
         GXl0YZ8Dh6QiDybUkgXtdQI1diFbSVgn9BCb8Cl79pb66GtZCeMENEvl5rVRnqDZPfmU
         pKFA==
X-Gm-Message-State: AOJu0Ywq6YGY/41aCfcfi24LFyDDALUmH85sapbfQ/uBkMO0SaqweS3g
	uw+grsLHVqlAemBfKHULRtiEiQ8fGRMzQCONWccUcKlY8DUB9u2vllh4imxB4q3VQw1BP2fmHSE
	UbIia
X-Gm-Gg: ASbGncs3ImGINQZt3SoAUqRxnhwGbJ+DYdpDF/m6bZnw9yI3boYzpABczH3aM5UXP6c
	lWQEaK+gSYIQR95Iq2uPqxHMnIiweOviOYpNxbjU3GwcFGqjEneDFWr5JkPwJPO3R2w33ppj7Pt
	AfHDVZezbxob1LYEdM8ai8Pl9Eb0KCtjDm2pxa67WRoBiKsNDEI1HyhiGjE2HCEJ9HKS5TtS+Ox
	0pKPW9Hdz+sY3JHHWKMvQKfWBrFeB++jMX/EociVQ218/RjLz0c2a7PVhIQpNz/CrVXreyJjz7r
	S/aPGZUNXjquVlUSP8ukXYUwKVWd3a8NQDn/zwYOcb0RkTt3wgEab42LKw3XQi2ry8JqKg5UNUu
	jVF/RnY7I630rfa4d9wx2AE609s89euLl/07fa3t+Ul+hg8Fw3V1l13lBKZ4FqpNBsMplLaqBq3
	nXig==
X-Google-Smtp-Source: AGHT+IHZ90nEOmXBcj6e3a1S1xpNYAYeBgA1okG+tSaI+EicYd5n2pkE4YrATF6Lz3PkxYt7TP+P0g==
X-Received: by 2002:a17:90b:58ab:b0:341:88c9:ca62 with SMTP id 98e67ed59e1d1-34733f2a45bmr5232845a91.31.1763849678264;
        Sat, 22 Nov 2025 14:14:38 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:a812:a9e4:3291:bb61])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-345af26d8b1sm7158274a91.3.2025.11.22.14.14.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Nov 2025 14:14:37 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 03/21] sqlite3: patch CVE-2025-7709
Date: Sat, 22 Nov 2025 14:14:09 -0800
Message-ID: <baaf28f6f2eac600f7caf53660a0b75f0329e86a.1763849517.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1763849517.git.steve@sakoman.com>
References: <cover.1763849517.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Nov 2025 22:14:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226702

From: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>

Pick commit used in debian patch https://git.launchpad.net/ubuntu/+source/sqlite3/commit/?id=9a309a50fa99e3b69623894bfd7d1f84d9fab33c
Upstream-Status: Backport [https://github.com/sqlite/sqlite/commit/192d0ff8ccf0bf55776a5930cdc64e25f87299d6]

Signed-off-by: Bruno VERNAY <bruno.vernay@se.com>
Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../sqlite/sqlite3/CVE-2025-7709.patch        | 33 +++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.45.3.bb |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2025-7709.patch

diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2025-7709.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2025-7709.patch
new file mode 100644
index 0000000000..820262881f
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3/CVE-2025-7709.patch
@@ -0,0 +1,33 @@
+From a7ed2fcba8ef1df4bcd846d895469ca72542be07 Mon Sep 17 00:00:00 2001
+From: Hugo SIMELIERE <simeliere.hugo@non.se.com>
+Date: Fri, 14 Nov 2025 15:31:17 +0100
+Subject: [PATCH] Optimize allocation of large tombstone arrays in fts5.
+
+FossilOrigin-Name: 0fcc3cbdfa21adf97aed01fa76991cccf9380e2755b0182a9e2c94e3c8fb38d7
+
+CVE: CVE-2025-7709
+Upstream-Status: Backport [https://github.com/sqlite/sqlite/commit/192d0ff8ccf0bf55776a5930cdc64e25f87299d6]
+Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
+---
+ sqlite3.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/sqlite3.c b/sqlite3.c
+index 1ee8de4..43f59e2 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -240724,9 +240724,9 @@ static void fts5SegIterSetNext(Fts5Index *p, Fts5SegIter *pIter){
+ ** leave an error in the Fts5Index object.
+ */
+ static void fts5SegIterAllocTombstone(Fts5Index *p, Fts5SegIter *pIter){
+-  const int nTomb = pIter->pSeg->nPgTombstone;
++  const i64 nTomb = (i64)pIter->pSeg->nPgTombstone;
+   if( nTomb>0 ){
+-    int nByte = nTomb * sizeof(Fts5Data*) + sizeof(Fts5TombstoneArray);
++    i64 nByte = nTomb * sizeof(Fts5Data*) + sizeof(Fts5TombstoneArray);
+     Fts5TombstoneArray *pNew;
+     pNew = (Fts5TombstoneArray*)sqlite3Fts5MallocZero(&p->rc, nByte);
+     if( pNew ){
+-- 
+2.43.0
+
diff --git a/meta/recipes-support/sqlite/sqlite3_3.45.3.bb b/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
index 60a8f1449b..05bfaac1af 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
@@ -7,6 +7,7 @@ SRC_URI = "http://www.sqlite.org/2024/sqlite-autoconf-${SQLITE_PV}.tar.gz \
            file://CVE-2025-3277.patch \
            file://CVE-2025-29088.patch \
            file://CVE-2025-6965.patch \
+           file://CVE-2025-7709.patch \
           "
 SRC_URI[sha256sum] = "b2809ca53124c19c60f42bf627736eae011afdcc205bb48270a5ee9a38191531"
 
-- 
2.43.0


