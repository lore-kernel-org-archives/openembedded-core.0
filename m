Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E79C4C7115D
	for <webhook@archiver.kernel.org>; Fri, 20 Jun 2025 11:16:46 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.5356.1750418200091835244
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Jun 2025 04:16:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BJI4j+tF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-451ebd3d149so10824745e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Jun 2025 04:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1750418198; x=1751022998; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=SVc6UgDwr28XJnbrLvRUO25rWYGh7vchLhmznn52aIw=;
        b=BJI4j+tFI/ap1zxaGlZXqZp0mZ4o1baMT80VKI2bQ8iKoRSRMR+bDUUgXXyubvvBj9
         vsEjix6kZNNDJtL1Gt5/uOhYX+ahtFR6uXGghIzey14AieBcUIXVzw5vwJuQeeLSQ1Mg
         rW75uz+p3dOgk5UGn6OixX9NgN90RI5gsk8KA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750418198; x=1751022998;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SVc6UgDwr28XJnbrLvRUO25rWYGh7vchLhmznn52aIw=;
        b=sm/AhtiCj0OO2u8sqImVBSnmZr16GLlTb/HSHKiSg0CdweaWeVhPLbLrlvuXl44LXc
         KQS/FCjn7ORtK/idmE2aqu1HsSu1iADXWqMnf0lqWve0ZxJjBwATXDue9woz6gam1t3r
         c7C1YBqd4KUZcjsccw8NHpwBZ/F2le2XBwrMzn/Es2n57cQayf8Wqw0lO/AcgnstTfFs
         8zTNjd6LbSbkkgPa8cKUQ/p+G73THk/sva0Snv0eamBNAtn0uo1IYyXVyziGYbBfkLfp
         1FWJhgoQ3ypf7BCdRmmukIhXIM67xzpFuaQM+K+E3L53NYl2nnuQkLenaf02GMMfnxDO
         gqhA==
X-Gm-Message-State: AOJu0YzzntdNm5/jEe+j5NqQ6ikjZrUTCsCZ3D2fv6pgUH7BPLOCn0dg
	wFhK0tYky59YJpEPmJQXlM8bba7CrXM4MPA6nEEYlsuTHdm7OFq3CbqtyVsrViwGGzvx7yeoqht
	rq3Dgm8k=
X-Gm-Gg: ASbGncvVvQPPrzo3V2NTjcUPtU4FER+LI6EKNDySateP/x5ViSnjrJCvs7vAfIgJ4sb
	cTqgX/x3DixO193EPCKDtJbOuQgZWBrvxiIHZtWQG9RyVTGCk841AmPj06deYH5UBWQ6Iahepka
	ptPO7fwKsaUphROTRbMvSgk1zX2dggMoSRA4CQf1JHSVH4xVpvvTB8FOnHYctj7AB8P59SAGrt/
	OF0DiVi5XeWYdr/Vdr5J2O9iNo4hzKEV9GOQ9SHa0arF2g48uqceZTiExBSJBl6YZ9Vqkvikbyr
	ya+pGTOeEBFrx2c2CfVUp5TJUfD/luiDnJCbnEob0geukggTQIq1Szp9AxplNX5yuiI6plIQeHG
	2U4Yqi9voaVWHct2EfLQs4cpuiQ==
X-Google-Smtp-Source: AGHT+IG+ccHJ3QRncT32ZeoPxRZlExJYKkZHRM1MbdibV0MtwQwEkg6gEAceAD+Kju4rNxhp1uJvKQ==
X-Received: by 2002:a05:6000:2d89:b0:3a4:eec5:441c with SMTP id ffacd0b85a97d-3a6d131345amr1391063f8f.47.1750418197712;
        Fri, 20 Jun 2025 04:16:37 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b606:370e:6752:7b3d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453646d7d8fsm21814425e9.15.2025.06.20.04.16.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 04:16:36 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libarchive: upgrade 3.7.9 -> 3.8.1
Date: Fri, 20 Jun 2025 12:16:36 +0100
Message-ID: <20250620111636.2468803-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jun 2025 11:16:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219121

Includes bugfixes for issues introduced in 3.8.0

License-Update: Public Domain file changed from libarchive/archive_getdate.c
    to libarchive/archive_parse_date.c
    https://github.com/libarchive/libarchive/commit/c26f0377457db392bd57a640e8fe25506120f810

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../libarchive/{libarchive_3.7.9.bb => libarchive_3.8.1.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/libarchive/{libarchive_3.7.9.bb => libarchive_3.8.1.bb} (93%)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.7.9.bb b/meta/recipes-extended/libarchive/libarchive_3.8.1.bb
similarity index 93%
rename from meta/recipes-extended/libarchive/libarchive_3.7.9.bb
rename to meta/recipes-extended/libarchive/libarchive_3.8.1.bb
index d70cdb3d835..472b5820f0a 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.8.1.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "C library and command-line tools for reading and writing tar, cpi
 HOMEPAGE = "http://www.libarchive.org/"
 SECTION = "devel"
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d499814247adaee08d88080841cb5665"
+LIC_FILES_CHKSUM = "file://COPYING;md5=7ce08437ff7f5e24d72e666313ae4084"
 
 DEPENDS = "e2fsprogs-native"
 
@@ -31,7 +31,7 @@ EXTRA_OECONF += "--enable-largefile --without-iconv"
 
 SRC_URI = "https://libarchive.org/downloads/libarchive-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "aa90732c5a6bdda52fda2ad468ac98d75be981c15dde263d7b5cf6af66fd009f"
+SRC_URI[sha256sum] = "bde832a5e3344dc723cfe9cc37f8e54bde04565bfe6f136bc1bd31ab352e9fab"
 
 inherit autotools update-alternatives pkgconfig
 

