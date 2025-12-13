Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A3B5D5AE5D
	for <webhook@archiver.kernel.org>; Sat, 13 Dec 2025 10:00:39 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2880.1765620038533815293
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Dec 2025 02:00:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LH/EsOsD;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2a081c163b0so8785515ad.0
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 02:00:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765620038; x=1766224838; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0JFwvZNNyHPrpumIdtp9u98NIrVzT9H+VaHkEyA1U5I=;
        b=LH/EsOsDh+RB5ZCj9lpYyCSJrmQr7QixHEH9xGURlSdSgOvhwrw/EC7Um8nMsgOGiY
         f3+vDq/Mx6DnnAnQM32VHJZINn2R8BJpPASmsyaGA64p6eB4PJ2vXBAIzbLAimTQKp2D
         5JNPXfZJsVXqpYGto9+iyTXAts6pivGeCKd/mJp9x2bRosD5r1C5GtEy5pPYpXpElGf4
         f1oQLyhLWu3LzeWrgYeoHiLBAvWL37YYPMCXuKMevyjp0chb3aymMlf8aYBxhukrB3R8
         wK3e79e0/4CXXGOa9nVMfUqbEmH9/XQqydbc8ahefNsfumty3gxCKMhjs5Auc9c48uj1
         NB3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765620038; x=1766224838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0JFwvZNNyHPrpumIdtp9u98NIrVzT9H+VaHkEyA1U5I=;
        b=mctvF4HfsW418h6K3NeTSJhDCWTokSvR9TShiK2DGAOsXA+LAYvckcbnK8dyCAGSKR
         BeXkFqHdBq/DK2RKlM3+agujHKNciejlw2jCvSqcKOlThG0jpNrMlnhNZnm3j19CNQAV
         z1OpS5f78YZECFH5E5PzA73pFNb5zAiKYmLAPTCgfYT87mWGmIVCRkZ6RAMymhPpZe8c
         Q8lbg9CsdzMYimBDC9dZrVZf4LNS4xdvUbkklMTOs7idGUKwur3lskkw5NxhgB4sS5xO
         Nw1iDUCFSQHaMQNyB6atpx6Eqcu9weszjB5qbDUGhn6ajhxrgl1LmXX1nZcY5gwHqns/
         U1VQ==
X-Gm-Message-State: AOJu0YxHgSPTo1Tq6/PAShQg1tmUwBXXOfuxryN+etRy7Vd7JvHPBuG6
	Jm9C2McPcgLsbM5fwxqtW5S+a6ZoSS0Vcbpxg1PX6d8zOxk1fqmguTjbHVDjtMsz
X-Gm-Gg: AY/fxX4Pln28vMjIzKW+b3zO9WNJH0d0zkSlDRyTWPJpyPQFFBf0im74ZGB2EC/tEoG
	WxkdB6aNjo7av0iksdH+tFFhWEJAoxFpexnZ+QZIVJq3aTZLi/ys6Cr4Az6hFlVRw6rVNrlRmiO
	VmjZnpV+mdfF6hqc+FqNuqy2FAzOK0YiweUK2iWbZWxF6UXYK8VtARIOjHmZg/M3C+SBdRcWbkG
	TLAHHfvkKiuSh/1IY99ndmngbmLt1aVFeo9viF0chCvMNH4Nc3GaAgaggxhjT2zwchYFxIqWEAA
	KC9noBRXN+ZGJMlhDgM7XbqfDaNtbaNjapzWq9ByQ7icBni7WN02MjHt2g9x7oO2aY8ZwsylSTe
	TBEL6l4AutoYP51+N/3bwpa4J19mrHLEfCbkRsyTz7IDNlsB5quZhhydp+Zmw/PBnT2+U8Ngcwe
	UkonuL4HQwhn1icHP6Ze2skcSd
X-Google-Smtp-Source: AGHT+IHJ+us3xSIhDefOuhrqtHuSKWbCqv6ZLly3wBlynZB8mc3cNbpRNJIXuSAq5WlV1KEZEoXHeg==
X-Received: by 2002:a17:902:f543:b0:29f:1a16:5578 with SMTP id d9443c01a7336-29f23dde5bbmr44556245ad.11.1765620037669;
        Sat, 13 Dec 2025 02:00:37 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([136.226.230.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a082b13b6bsm26173725ad.99.2025.12.13.02.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 02:00:37 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH 22/67] ccache: upgrade 4.12 -> 4.12.1
Date: Sat, 13 Dec 2025 15:28:46 +0530
Message-ID: <20251213095931.2571498-22-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
References: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 10:00:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227640

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit e47f62e44f44d0e45a02ad13826d3a7fb722079c)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../ccache/{ccache_4.12.bb => ccache_4.12.1.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/ccache/{ccache_4.12.bb => ccache_4.12.1.bb} (93%)

diff --git a/meta/recipes-devtools/ccache/ccache_4.12.bb b/meta/recipes-devtools/ccache/ccache_4.12.1.bb
similarity index 93%
rename from meta/recipes-devtools/ccache/ccache_4.12.bb
rename to meta/recipes-devtools/ccache/ccache_4.12.1.bb
index 52643c4bff..2d0b83e244 100644
--- a/meta/recipes-devtools/ccache/ccache_4.12.bb
+++ b/meta/recipes-devtools/ccache/ccache_4.12.1.bb
@@ -17,7 +17,7 @@ DEPENDS = "zstd fmt xxhash"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz"
 
-SRC_URI[sha256sum] = "e884c62cbacae2e9488b8641a671a79fb7a1221db01310dacef61c9e55c2e55b"
+SRC_URI[sha256sum] = "a3da50ab0fb0d42f60c17d1450312e6ace9b681f6221cb77c8a09a845f9d760c"
 
 inherit cmake github-releases
 

