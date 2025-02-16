Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62905C021A4
	for <webhook@archiver.kernel.org>; Sun, 16 Feb 2025 03:11:00 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.23090.1739675455063338387
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Feb 2025 19:10:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JCql7JSc;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2fc33aef343so3170325a91.1
        for <openembedded-core@lists.openembedded.org>; Sat, 15 Feb 2025 19:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739675454; x=1740280254; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RQiLKp765IUBHJItLpP3WBERUajT0AjdWJNDIvU816E=;
        b=JCql7JSc6pHfXC/RFGU2zYrKwPgB2c4kJ3GB8ZCNSYvodI2X8sKy/+zSntwX1+mlH2
         pWNDDOsImxz/SqLG/mcyuwaXVhv74JruitAGJWvbbHft+wRwXMiFtk4pHvq3Nw8td2cY
         dhCCX+zXKTrkFyfHCNLCl2qjtPZte+1yBmVw488gpK+D4oYhdLTb0Rdxub50zEDhaQuC
         BvXUcanEhGAUKCks4h6NOgf3u2cVT6leZMtGocayswOhWvShkdIOCQvs89vwoH9Db1K9
         Mit+yr7VT2zzWM8guIZZaI42fhFg9mNcw9RbiasY2LauKQORK7rT3VAJP3R2Vb97/nJF
         idPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739675454; x=1740280254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RQiLKp765IUBHJItLpP3WBERUajT0AjdWJNDIvU816E=;
        b=okTpIPFNLbq3ri3BN5TpuXh4F4vPsOfKEGc3oRyL2g563n42Poa5HUQiWKgDIsPmwu
         CnRsq381WElD1X1BMzmybHITMNDHpxOIaOnsMtRcRAwZQy9HOF2RNLwu+KM6y578YEJH
         nBtNsVl8c+5fnI+Ou60ZaiEn1tnSEhfeAenetH2KYf3rchXOiZw86VmL/Bfe4NWVr0rf
         ch69qXAhfXeEgouHdEwxW4cRLUP6f3GDi8ink0cDnnvLBFCxI6KHRSlFTgxT5//GQNdS
         0XFBN0Cmf5862FutnOpBrH7fWSwN55V06UqcMzsveX7kN4FHauRIjwaTvmI08APZqdsU
         7Akw==
X-Gm-Message-State: AOJu0Yxu0CWsoROklRL1f4B1RraTSScwMAzdgfF9oonYkmt17V5kxcZb
	fyCroEQpm0F5qy8MPGgFP+9N61cYahD9knoNOtoRGQ75MbtmxrSFGDTr3GKh
X-Gm-Gg: ASbGncvOwa8biLA+S11gRGfr1L7pKI7Lqdq4TEvSQOUVzHFJ/U8jk23XNWs1d3eFCSs
	b5Nq6zVWLyJdrT8H0TRtj5n5FrJCl8IPj+wwjBzB+rrwv6wdsiVqWvGfKmWrnmjLbQhosF5offp
	KQuDsEVorHG9p2M8JlziKRov3/sFRMM4x7ylWGSw/AtCrYoTvw6JH14I/B93vW/7qynHKSWbwKO
	YcytE7CWmRwJbJNg3hSoD+ev8nbewpIB1e/UOADVyqKTHBZnWnbpySMl3iT+QLQ9h7D0qU3CUV3
	VIXZfQQ=
X-Google-Smtp-Source: AGHT+IGBl2DG7DswypFvW2pPzv50qDnZ4eGFIke3Zx4xZGQaTN7sei9oOUe4N06Sv9GXkWD4tVPsLg==
X-Received: by 2002:a05:6a00:1706:b0:730:91b8:af1 with SMTP id d2e1a72fcca58-732618c103emr8443526b3a.18.1739675454194;
        Sat, 15 Feb 2025 19:10:54 -0800 (PST)
Received: from apollo.localdomain ([2601:646:8201:fd20::b976])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73242568adasm5774999b3a.52.2025.02.15.19.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 19:10:53 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] python3-lxml: upgrade 5.3.0 -> 5.3.1
Date: Sat, 15 Feb 2025 19:10:50 -0800
Message-ID: <20250216031050.2543316-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250216031050.2543316-1-raj.khem@gmail.com>
References: <20250216031050.2543316-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Feb 2025 03:11:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211493

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/{python3-lxml_5.3.0.bb => python3-lxml_5.3.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-lxml_5.3.0.bb => python3-lxml_5.3.1.bb} (95%)

diff --git a/meta/recipes-devtools/python/python3-lxml_5.3.0.bb b/meta/recipes-devtools/python/python3-lxml_5.3.1.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-lxml_5.3.0.bb
rename to meta/recipes-devtools/python/python3-lxml_5.3.1.bb
index 4c9c22e5c40..8a3ec862f71 100644
--- a/meta/recipes-devtools/python/python3-lxml_5.3.0.bb
+++ b/meta/recipes-devtools/python/python3-lxml_5.3.1.bb
@@ -18,7 +18,7 @@ LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=e4c045ebad958ead4b48008f70838403 \
 
 DEPENDS += "libxml2 libxslt"
 
-SRC_URI[sha256sum] = "4e109ca30d1edec1ac60cdbe341905dc3b8f55b16855e03a54aaf59e51ec8c6f"
+SRC_URI[sha256sum] = "106b7b5d2977b339f1e97efe2778e2ab20e99994cbb0ec5e55771ed0795920c8"
 
 SRC_URI += "${PYPI_SRC_URI}"
 inherit pkgconfig pypi setuptools3

