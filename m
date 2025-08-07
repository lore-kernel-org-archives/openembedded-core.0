Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3660C87FDA
	for <webhook@archiver.kernel.org>; Thu,  7 Aug 2025 18:44:52 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.3718.1754592292451405007
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Aug 2025 11:44:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=OEk1aHIM;
 spf=pass (domain: konsulko.com, ip: 209.85.210.172, mailfrom: tim.orling@konsulko.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-73c17c770a7so1782366b3a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Aug 2025 11:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1754592291; x=1755197091; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=knuOLqLHAU4Yur159xa471+NTqxl0LvvAXUr2QJy9p4=;
        b=OEk1aHIM5+VTjo9NkGOTOSoEe8QeyZPge3mCxb4mrwgz78Hm4yNQN9sipGrL41NSw2
         nUBltqIJsB570I97pE2q677ykf247xkGikHrj4QV0MModqb5BAaTq4eMjsdOkFSNVWrV
         i55XiKv2z/qFZWnmAeGUrRzV7CNNTAejrzoFM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754592291; x=1755197091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=knuOLqLHAU4Yur159xa471+NTqxl0LvvAXUr2QJy9p4=;
        b=UeuL3UDKH9+jagVrocPbZYZHdmB14E9Z5SAWPrFTu0091oYWqtE6l19c/HliBCplnt
         LjEh+CqTeRW/otyI5g1HcCY+ZJlVHvQGho4NRo65RFiuhfjttQKzEw74dgXPP+/p1Dij
         AmGaGWkAD4cmzvhT7va6LBURt+jfuGQ6LbTC1XM0McCKVDe8nsrjcQ1G1c7bcdwfPNfH
         HtzapCWviPVHXk8SCYz2ZWRSia43qkhnhoWDPCy1X+a0kQ8iJ0TwzR23FFnbWe/DCd4K
         S4uBE5vRIduMLQREtOfMwepgAxOk89tjcMHBJ96aYzuWSBPX4t3ta9KS8ZkzPJ+AnS1x
         fazg==
X-Gm-Message-State: AOJu0YzldYs5Iu+a5ajoRljF/qT/qhFOhsI+haCsGM7hQtSNOdVB71yq
	Xpqb5xvvWd4fBomBdW7lGuhqsapnGwp1bepIC9EsOiawqB4YIcmFosqzAkG+Ky2w79CcJVWHsYf
	MpsotDts=
X-Gm-Gg: ASbGncsJXHRj9mIC8/GoG4iq/3A+8RQ8LPTDjA3gFhN58hSkD8UgixrD98vDfDMsnJp
	pro3TQLj3kuKC/3jr64P0wfaULOj54vKWS6eoeWezYXWhFLhAjPwpq1TuvuimAbz+SR4SUiphxg
	6x8P3itjXB5XSPHZFmH+Ly5c2/v2R/wuadS03x4oSzCKIhFgZqX5kDESVEHXrBUglXbXMO1g3FY
	pPxzv39Jb4VM8jrOzLbl00szBxs7kEOfBsCmyRqElEg7sC9R8t8kUt2MPqSE4bTEptiDJSOPatU
	hU9UrgOmOZGGZXHcKBSxJ6bN9Rztka9Mc5cDQq5lCH4osnyWnXlcLY5UZ+u3kE3t8HD9fvyxWud
	WVpeI2Uj5gqtx5lLvkzuQpWly3ujaYKElFk94mS/+PMMJ8nUyu4jfwMRUtwAJ2g==
X-Google-Smtp-Source: AGHT+IG7m0zne9T1hOopBYhRCOGb8Pe86c1xrz4kCBb3dTB/feVuBOSy+U/spFYnJpR4kL0L6Lh+gw==
X-Received: by 2002:a05:6a20:734e:b0:240:7ed:402b with SMTP id adf61e73a8af0-2403313d7c0mr11691945637.33.1754592291270;
        Thu, 07 Aug 2025 11:44:51 -0700 (PDT)
Received: from localhost (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bccfdf9bdsm18610286b3a.111.2025.08.07.11.44.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 11:44:50 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] python3-maturin: upgrade 1.9.1 -> 1.9.3
Date: Thu,  7 Aug 2025 11:44:38 -0700
Message-ID: <ed58334972bfc047e00f24a2f61df670f529ac54.1754591996.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1754591996.git.tim.orling@konsulko.com>
References: <cover.1754591996.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Aug 2025 18:44:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221579

From: Tim Orling <tim.orling@konsulko.com>

[1.9.3]
* Fix adding project.license-files to source distributions.
* Fix relative Readme rewrite of the root crate in source distributions.

[1.9.2]
* Fix PEP 639 implementation, use License-Expression over License.

https://www.maturin.rs/changelog.html#193
https://www.maturin.rs/changelog.html#192

Comparing changes:
bitbake -c update_crates python3-maturin

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../{python3-maturin_1.9.1.bb => python3-maturin_1.9.3.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-maturin_1.9.1.bb => python3-maturin_1.9.3.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-maturin_1.9.1.bb b/meta/recipes-devtools/python/python3-maturin_1.9.3.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-maturin_1.9.1.bb
rename to meta/recipes-devtools/python/python3-maturin_1.9.3.bb
index ce38e931360..eca474af663 100644
--- a/meta/recipes-devtools/python/python3-maturin_1.9.1.bb
+++ b/meta/recipes-devtools/python/python3-maturin_1.9.3.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT | Apache-2.0"
 LIC_FILES_CHKSUM = "file://license-apache;md5=1836efb2eb779966696f473ee8540542 \
                     file://license-mit;md5=85fd3b67069cff784d98ebfc7d5c0797"
 
-SRC_URI[sha256sum] = "97b52fb19d20c1fdc70e4efdc05d79853a4c9c0051030c93a793cd5181dc4ccd"
+SRC_URI[sha256sum] = "267ac8d0471d1ee2320b8b2ee36f400a32cd2492d7becbd0d976bd3503c2f69b"
 
 S = "${UNPACKDIR}/maturin-${PV}"
 
-- 
2.43.0


