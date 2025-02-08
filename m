Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95586C02198
	for <webhook@archiver.kernel.org>; Sat,  8 Feb 2025 14:05:12 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.9237.1739023507042311452
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Feb 2025 06:05:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=UBGZeG1P;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2fa2eb7eb45so2117868a91.1
        for <openembedded-core@lists.openembedded.org>; Sat, 08 Feb 2025 06:05:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1739023506; x=1739628306; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+toJ5Xe6dLM3aSRZ/Rvi72JrtIHYVdw/oeCoxiMsjrc=;
        b=UBGZeG1PjeKsMpPZRUxDZBwjDkriX7Pt+u9y0jRygfDgvfMwQUITYVZXF+hvUkmvD2
         mLAJKWYZJj+jziXHo8apC8zr3ZpjJ0U1I8xYALhheXZFtgklVcI9SNlpUJoVa3DjnOfN
         kXk744QyQtA85+xnVKB5Ir+SHVdnlB0qm6jKvQ5jT7iNAlPHpzSVYswa40zZJS0N5gH9
         8bW7MdC2zxsDu9xccURmBh0opn9r9KZi9QRnydIyA5C8xd/59BvXkzhiHdqgqxoRf7YS
         F8nVQiSc6QBcxYIXMVGVvCu+1SisIaniZjgCSP4rKhbh4SplUP08ogGXryNISQBBUAEL
         L3JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739023506; x=1739628306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+toJ5Xe6dLM3aSRZ/Rvi72JrtIHYVdw/oeCoxiMsjrc=;
        b=rXawSV2XhWZAOlvK/wFOWMVYo6ms9F+z5uV4AF/KmTM4Gjxq7WT5G4Sjf3SNPdIbrN
         0p8VABOXLeZV9+lEnD+f2gPBeawSVMVpaIZft6c0oDWEVsaKHEPzYWAol30QOz+iqpJa
         J4r0vYYjwRLiqAeLpObboqEGnnyIxX/sxUQjeywA4C+VWJMF2MxAQwWbA1vICW5R0Fe/
         OsiFfhoH6RiErp1yG6JbZBIXZt5S2Io3JLYgMBDthgylDYbadEmwZ2FE8NU258Xq3k4M
         pOo/8oCaBi4IupvsR4Msj1B94BtIIl425Blq5a7hPorKWbQxm+vXmvMIgu27W/cP7R5Z
         iQOA==
X-Gm-Message-State: AOJu0YwwShx8+d9vtvTyl85sVNpBCMIgYrghWlBWiRxou/aaOKepXMBQ
	hqautPe8X5WbAPgvD35bDgHl/BInayix4c5t0rUM31+s+PuGDU8IblR3ZMg+k3TXfaKwhiIYPn9
	Q
X-Gm-Gg: ASbGncuIXWkroiqateDap4kWQ9ibi1OQV3Ru/T07dpMb9xmst7opfMWQXInXfTDjvoT
	BYxj/TbexVWqg2pk2F0BIKaPTAhtuvbpvwUqN+cTGHuAzkmqnUb3KE+HAce8+ucCtB9fTZClsqj
	8XbFLv0qyr29NeX32EcnalHrHpRWT/eXhuTdXb1ns0KdXaWceaMlZXU2twUzwtIoELo62bX6uTz
	H1bB5E3KkvWOLyw7/C2khxa01EWISR5K14ff4Z+hkrMK9vh8O+2BZY4eCddS6FBJDpHwUjHgppz
	epC3
X-Google-Smtp-Source: AGHT+IHz4JziuHcgVnaUI6eSAOQlH5PgM+m7pDzc5iMtP9xJZdKa8e2pUZJ2Q35uG7oO3VIS9HQbXA==
X-Received: by 2002:a17:90b:4a52:b0:2ee:d9d4:64a8 with SMTP id 98e67ed59e1d1-2f9fea60ae9mr19597644a91.0.1739023506199;
        Sat, 08 Feb 2025 06:05:06 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3687c820sm47278345ad.173.2025.02.08.06.05.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 06:05:05 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 01/13] binutils: stable 2.42 branch update
Date: Sat,  8 Feb 2025 06:04:48 -0800
Message-ID: <6ce232df15834cae44f3eda0f786132086afb76e.1739023409.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1739023409.git.steve@sakoman.com>
References: <cover.1739023409.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Feb 2025 14:05:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211021

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Below commits on binutils-2.42 stable branch are updated.
758a2290dbd PR32387 ppc64 TLS optimization bug with -fno-plt code
ed489bf1574 s390: Add arch15 Concurrent-Functions Facility insns
64e8e16a906 s390: Add arch15 instruction names

Tested on qemux86_64.
There were no additional PASS or FAIL after the update

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/binutils/binutils-2.42.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipes-devtools/binutils/binutils-2.42.inc
index 41ed39632d..3784d26f48 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -20,7 +20,7 @@ UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
 CVE_STATUS[CVE-2023-25584] = "cpe-incorrect: Applies only for version 2.40 and earlier"
 
-SRCREV ?= "09ba78f051319e8f8861b26fb9340e21ca973c70"
+SRCREV ?= "758a2290dbdf0d6d6c148c6cf25b2bcfd7a5b84f"
 BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=https"
 SRC_URI = "\
      ${BINUTILS_GIT_URI} \
-- 
2.43.0


