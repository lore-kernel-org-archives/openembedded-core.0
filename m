Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59A5ECA0FF7
	for <webhook@archiver.kernel.org>; Tue, 26 Aug 2025 13:41:16 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web10.64595.1756215674862538190
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Aug 2025 06:41:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=hPAO5oHZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.173, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b47174c3b3fso3359504a12.2
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Aug 2025 06:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1756215674; x=1756820474; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nTGf0G7vH5Uv/+D5Lil5x9kLyyjV9O7k1FECX9wLJ/Q=;
        b=hPAO5oHZ2/jv4vj6woF4PxbzGtefaG0ekG/3QcoXqQo4/Y1y1oifEkDsgOGnVEfW1M
         yC5NzgcNkUpzazJa+ir2cW9U5RHTgLl5AMRwEY7PDxcUP0kI3hZA1/b4u+vJZClEdFC0
         xDAJ7pVfDYWSduzxkJb4HkBqI8K2WrECnJtE7wDkrzDClMcBmh6JPavF0Ykuz1begBWS
         1VfXHk0J35xZ6o1zLnk9HZ9Wu7SaWQDSBwF/C1sJ2Ucvp2EmiBRXKb39BQ5UMXSOur5z
         C7aMbZ6e3tXsJnPzvm+iTf75Ojbhj7HoM5ciya9LXoHLZkZeYUM+bC64XoDfIa2rZbu2
         jFFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756215674; x=1756820474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nTGf0G7vH5Uv/+D5Lil5x9kLyyjV9O7k1FECX9wLJ/Q=;
        b=lr1oCzMo/efRPDG/We+/+CtbS/U5gbqUvRNTGM56Hpl2qHIfmriksN62CGcQqPLQ9E
         OmJl/JUiavc3U9hZk0UGFScld4GV6Tm+EiSQuY+3fucmGDPn7ZE4R5QLBMFsq4y4Mqcy
         7FCqlVo3BxVSmJhvcngch6n+SQgjDqHnERqfrEFJ8ZXTzPMulyk2/wrdFaBoCkmAHD6h
         7NT9ColuJHJkYBoSw3fDUmrKuvIXvsGEDKDMNgpcUkTtSGZ9TDBXaDHosBmfRe7RdrTc
         yFhmBQYI90IB7OkgofuNCwdumkUfEPcIyABvEUBi80uwtAHEdMtDRsguI92jjMOgFwX9
         SGvQ==
X-Gm-Message-State: AOJu0Yys/rtrEeRsp+j3lRR5mDpDSP6FFRpfFegaXlKJBzJRHuSBqhQZ
	YC7Sg6SMmnf0jS8s2Y8uJsSSexOqIhdk5jL2EwCtmSx4NubKA/A6PG5RDlSzHLhtCWQlo5jDkRP
	BpNWo
X-Gm-Gg: ASbGnctLa+bCSVw/MwZ/ck2478DeNiZGgD2GRj3uvQ26eBucWkg8tCm7iFFp9DxDbSq
	N3F88MISTc0dKmulqQwugBTRefNmgSxxhWTQfaIZLjSMaH9d9tl2JJbEsIiM7mAaGjC7LrnhcOZ
	VJvmavnolu/FZAmOYW4W4uZFWDhKigJXLsk9YRZb5i1ObGBV/JFQmg4NvJuv+cJi3n3FNfK1Nf7
	z5ehSWjFNhp8aCGZq4fXsaw/HGVN7f/ynoqhJP2TuPZioveg/QF6IKoJky0Po9W43H2ctdUoB0L
	mGCKdwRMZ3clirxRfVg/jaQ1cG5UTut0GZo9iXYYtVQu5P3Y+Uh3Fetgl1/Nl73/1sX5Lqu2aFQ
	s87IUgWqaLCKrhg==
X-Google-Smtp-Source: AGHT+IFpL+ATsuB8s91japrSecJZF6FfAy67GYjs7OXrG7jEHUEeeOioo381mqWYdbY5NGoceVGU+A==
X-Received: by 2002:a17:903:f85:b0:244:6a96:6912 with SMTP id d9443c01a7336-2462ee7b50bmr204630815ad.20.1756215674021;
        Tue, 26 Aug 2025 06:41:14 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:1687:ddce:d4c7:f578])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3274191c389sm1007414a91.4.2025.08.26.06.41.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 06:41:13 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 05/19] binutils: set status for CVE-2025-8224
Date: Tue, 26 Aug 2025 06:40:39 -0700
Message-ID: <c7297f46efa410a9204d3d386d307deada967bb6.1756215509.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756215509.git.steve@sakoman.com>
References: <cover.1756215509.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Aug 2025 13:41:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222445

From: Peter Marko <peter.marko@siemens.com>

Commit mentioned in CVE report is already included in current hash.
Can be verified by trying to cherry-pick.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/binutils/binutils-2.44.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/binutils/binutils-2.44.inc b/meta/recipes-devtools/binutils/binutils-2.44.inc
index 26c2a413b8..5ee82fa0e5 100644
--- a/meta/recipes-devtools/binutils/binutils-2.44.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.44.inc
@@ -19,6 +19,7 @@ SRCBRANCH ?= "binutils-2_44-branch"
 UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
 CVE_STATUS[CVE-2025-1153] = "cpe-stable-backport: fix available in used git hash"
+CVE_STATUS[CVE-2025-8224] = "cpe-stable-backport: fix available in used git hash"
 
 SRCREV ?= "8e98f97aecb0f0a1a1e2ef244e9aa235248ef8fa"
 BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=https"
-- 
2.43.0


