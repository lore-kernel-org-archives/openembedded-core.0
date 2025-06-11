Return-Path: <anibal@limonsoftware.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 163CCC71133
	for <webhook@archiver.kernel.org>; Wed, 11 Jun 2025 15:33:41 +0000 (UTC)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
 by mx.groups.io with SMTP id smtpd.web11.1422.1749656020379572485
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Jun 2025 08:33:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@limonsoftware-com.20230601.gappssmtp.com header.s=20230601 header.b=O9b3hThC;
 spf=pass (domain: limonsoftware.com, ip: 209.85.219.177, mailfrom: anibal@limonsoftware.com)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e819aa98db9so3974884276.3
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Jun 2025 08:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=limonsoftware-com.20230601.gappssmtp.com; s=20230601; t=1749656018; x=1750260818; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qKZmdzpWEt2qxYKAYYufB81AlCdc4sR6hO54vloNjlY=;
        b=O9b3hThClMohSVYsREcY1bOaelltOVJdMr7CHX9fAilaeTnIHA5MMLMiUVeAiZIVxX
         ZL11IYm1/TpOsakbQTXmfoYN5mt8tH0MG0xMRg05rW/aJjeLx2rRQgAhbwwPAXfHbOj9
         ocoPaTK0d4ZGZ9sko5zMTDYDn106EZ5UxqGUB6YcwOdLYPvp0VigGQ5PtU6eDYnh+oXu
         XrF9afeQHjlapAX+Wp8YW2w2CR1mBJyIZWpJYlF1M/5nynW2KdnCzU8aN41Ty1wguKaa
         1Sr26C7sNYm8PEF1o3uQt9KD9zjRzxR1JQFZD41l+xO6XV95hDeoE7W2Gy71NJV7RAot
         xVuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749656018; x=1750260818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qKZmdzpWEt2qxYKAYYufB81AlCdc4sR6hO54vloNjlY=;
        b=A7zG4jmXx8Qn/E4OkgXZlWVBrB9hTRbO2xiyKemMh/RnAcQniF2eFxV2b7p2yaG3oV
         z/N9puRa69NspcolXfh/a9tORHapzUfbmk9dhKlNsfYZ/92Eyis9c9fBYMvzUCOSD7wT
         IvoGjWGO3iM1WA2Lk1WTUvpUojP7kU8SOeeH0dNhWKLkDVBKCuBGTzGk6K9T6C4Obmmw
         KJEN9/u4kVKGyFPmtC+La54dtQmnrFr1yP9NHsv4F3myQpZGDyt/pxRm19ZAXOmMdT6D
         RI18qJiLVq8rV2JCSLTUKOnuehleKNbo4edRGAZqlfkvfSCebSDQOhRXzM8NXcGL/Qcg
         PXcA==
X-Gm-Message-State: AOJu0YxLWF0EQcWwSwINt5Lc7STidAjwyOAfV6AlDT3iUhBvCTg2Cl5o
	iIQRPt8K6qZV5DMG0LvTRkX1lYxfhk01H3uHL24oLVLsjeYP3BXYHhe+XvDxSq/DAlzVdVz1dhA
	8GuKBtAQ=
X-Gm-Gg: ASbGncuyR6IWPfNDywqXSwkgdUuVDkC8ZIck/sTiN7EebxhHkF7RTV94oP+qM3iUFUD
	Md9ZhnrHJ1SrM+ZEeYliDiahbqZSac9Z88vcSgZbXiJvJa/wef0eEWeU3s/Ie6RKjUKOq5wnDLS
	9anq0OI4+e1wQhtpBfS2ge07XKzr9eriaLdiHBIG8o4A+VeeZt+2DH+wwDpBVw3Z3YwhYQbzq0g
	0DtnFZGfrzSoeaX0ksEmoYl2wReVZUyKA/aZExqe9GmpNJwMYWueWnWoImXdzQpWsIBGoDzm9EA
	DRr70VDx0O7MEw0vHRXcc2vhHpmKCFyuRTfG2liBXEMJRURyZ8ko7hM3/9mUNLRyKlWqgvPhrvJ
	odw==
X-Google-Smtp-Source: AGHT+IGtjo/bg01z5ES+FomlKaHo6+SoJGo5ptRuxLUGthM1dLdiR1rXI9Bn6SZBP1JljwbfAXmJ0g==
X-Received: by 2002:a05:6902:3009:b0:e82:54:5acb with SMTP id 3f1490d57ef6-e8200546959mr2481729276.2.1749656018395;
        Wed, 11 Jun 2025 08:33:38 -0700 (PDT)
Received: from ls.ts.net ([189.172.229.129])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e81a402c9aasm3589608276.18.2025.06.11.08.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 08:33:36 -0700 (PDT)
From: Anibal Limon <anibal@limonsoftware.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	Ross.Burton@arm.com,
	bruce.ashfield@gmail.com,
	Anibal Limon <anibal@limonsoftware.com>
Subject: [PATCH 3/3] wic: plugins source bootimage/isoimage rename to have valid indentifier
Date: Wed, 11 Jun 2025 15:33:19 +0000
Message-Id: <20250611153319.54778-3-anibal@limonsoftware.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250611153319.54778-1-anibal@limonsoftware.com>
References: <20250611153319.54778-1-anibal@limonsoftware.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Jun 2025 15:33:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218460

Python has rules on valid identifiers and not support modules with '-'
on the filename, change to '_';

Signed-off-by: Anibal Limon <anibal@limonsoftware.com>
---
 .../source/{bootimg-biosplusefi.py => bootimg_biosplusefi.py}     | 0
 scripts/lib/wic/plugins/source/{bootimg-efi.py => bootimg_efi.py} | 0
 .../plugins/source/{bootimg-partition.py => bootimg_partition.py} | 0
 .../wic/plugins/source/{bootimg-pcbios.py => bootimg_pcbios.py}   | 0
 .../source/{isoimage-isohybrid.py => isoimage_isohybrid.py}       | 0
 5 files changed, 0 insertions(+), 0 deletions(-)
 rename scripts/lib/wic/plugins/source/{bootimg-biosplusefi.py => bootimg_biosplusefi.py} (100%)
 rename scripts/lib/wic/plugins/source/{bootimg-efi.py => bootimg_efi.py} (100%)
 rename scripts/lib/wic/plugins/source/{bootimg-partition.py => bootimg_partition.py} (100%)
 rename scripts/lib/wic/plugins/source/{bootimg-pcbios.py => bootimg_pcbios.py} (100%)
 rename scripts/lib/wic/plugins/source/{isoimage-isohybrid.py => isoimage_isohybrid.py} (100%)

diff --git a/scripts/lib/wic/plugins/source/bootimg-biosplusefi.py b/scripts/lib/wic/plugins/source/bootimg_biosplusefi.py
similarity index 100%
rename from scripts/lib/wic/plugins/source/bootimg-biosplusefi.py
rename to scripts/lib/wic/plugins/source/bootimg_biosplusefi.py
diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg_efi.py
similarity index 100%
rename from scripts/lib/wic/plugins/source/bootimg-efi.py
rename to scripts/lib/wic/plugins/source/bootimg_efi.py
diff --git a/scripts/lib/wic/plugins/source/bootimg-partition.py b/scripts/lib/wic/plugins/source/bootimg_partition.py
similarity index 100%
rename from scripts/lib/wic/plugins/source/bootimg-partition.py
rename to scripts/lib/wic/plugins/source/bootimg_partition.py
diff --git a/scripts/lib/wic/plugins/source/bootimg-pcbios.py b/scripts/lib/wic/plugins/source/bootimg_pcbios.py
similarity index 100%
rename from scripts/lib/wic/plugins/source/bootimg-pcbios.py
rename to scripts/lib/wic/plugins/source/bootimg_pcbios.py
diff --git a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py b/scripts/lib/wic/plugins/source/isoimage_isohybrid.py
similarity index 100%
rename from scripts/lib/wic/plugins/source/isoimage-isohybrid.py
rename to scripts/lib/wic/plugins/source/isoimage_isohybrid.py
-- 
2.39.5


