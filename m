Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96524C282C7
	for <webhook@archiver.kernel.org>; Thu, 27 Feb 2025 17:40:21 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.17123.1740678014906649471
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Feb 2025 09:40:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=zgENhMW4;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-22349bb8605so26713525ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 09:40:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1740678014; x=1741282814; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=49MmDGDqnn8h/VL1OGl0erJ60PR/KUAd94NQnc116P0=;
        b=zgENhMW4uUJjjdlmdGKdxdywZU6wPpRar4mKNgc6nyrspcgaJa4ndFn2jUHQ96TzzG
         4BWYVKvMKt1+Fj/75CqLsydJ33fh1TJwVrwGJWcRl0xfi2t0YY5nTdcargKQ4ixRBUcC
         iRocKJbfyZLZ5+7wV28hlnjnpD9Sjduf4XLEnirRxa5Frbgtdbf+Zg2G8xZZZLJa4vNi
         HCWnEkrkA8OHGS+jKJdL+/JJcfHFn89x6E5iB4gZvnn2fjvpKAA+sHuN2ynOanfMu091
         eZKE3kGFLOzU8wn2ouwbzW+CaYsoK0xCHLimNIrePGK29ntxDoKlJD9+goWQ3d3rX0Dv
         eKWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740678014; x=1741282814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=49MmDGDqnn8h/VL1OGl0erJ60PR/KUAd94NQnc116P0=;
        b=mDHVQQkh0b0ri/J2njD9fk5eJfUamD+LjRzZV1OsIYjulvCyfpaAcjaBZfI6EkGD7K
         B/2zVS8TdCAFlEymG1YabMoYbP31ZHWvAq66+CR2BD+OXEljfEsX6ZU2NZQoKRrvNJ7J
         MR/iUx5WVqtJbw+BDoXbWviRhumdBM1beVBD0h6WcFjF567J75+QlfMvKGWGtKoLESET
         DsnLxltVHu/2TC8rFB6UPaWzCxW+/nwLO1evLcxzvtvbEAL7/Ln27wDNuuSJoK6vkL1g
         zbOwYYTWjV01g1qOnBU3SWbUpRGL2AiLkvySflC/jYUHNNH+b6lvTVToBKaasZ6c1W0E
         TgZw==
X-Gm-Message-State: AOJu0YxnG8bHKVOwptH7I3stIRm/OlfWnDebTE4Qv2uvthFyu9Hrcac3
	69uK9b8hr9B5t3tPVO10Hk63Bzyyf0mAj71ZSl2Ly/xobSjHiaZhGua/mtOMjLHsjNG5cJJjji4
	0
X-Gm-Gg: ASbGncs3vkAPhnrJ4LGxvORZa2vRsP8jrJucXu/HO5ff3JlenJDPXIX6ecg9muUwz7z
	PJD6L2OZk3fgjkZTL5WICUcILau3s+UtQjyWlHbcGx8ko66k968RbaoTMuLjSrKi3nVeLtKsDpW
	8AJp9rdAlb5FP0dMIlGGxbWvniZaARBIo0UG+K6YnzbhapK8dIbtCT1+ItUSciSyBVZuaZHDTfn
	J7zEN49AyQWa/jfVA4OzwjQHWECt8rlE9XrH697OWLTN7CeTTf38o+ZkPGqzu6lerVhKU1iOECC
	6UsJeIIwnmerI9u5pQ==
X-Google-Smtp-Source: AGHT+IFEDSTuaGJamjYOJCdyeilRGypC5dpx7N1LcDFL8OnitFSfELuW3mUTMGPtyoyxl72ebX+Ubw==
X-Received: by 2002:a05:6a00:1702:b0:732:5a8f:f51a with SMTP id d2e1a72fcca58-734ac365d32mr446825b3a.8.1740678014196;
        Thu, 27 Feb 2025 09:40:14 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:1dd4:58fa:4fa2:f901])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-734a00249c3sm1914727b3a.85.2025.02.27.09.40.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 09:40:13 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/15] bind: Upgrade 9.18.28 -> 9.18.33
Date: Thu, 27 Feb 2025 09:39:44 -0800
Message-ID: <3488171fb594a28f8e9ed110e94c6a191f8f390e.1740677838.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1740677838.git.steve@sakoman.com>
References: <cover.1740677838.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 17:40:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212031

From: Vijay Anusuri <vanusuri@mvista.com>

Includes security fixes for CVE-2024-12705 CVE-2024-11187 and other bug
fixes

Release Notes:
https://downloads.isc.org/isc/bind9/9.18.33/doc/arm/html/notes.html#notes-for-bind-9-18-33
https://downloads.isc.org/isc/bind9/9.18.33/doc/arm/html/notes.html#notes-for-bind-9-18-32
https://downloads.isc.org/isc/bind9/9.18.33/doc/arm/html/notes.html#notes-for-bind-9-18-31
https://downloads.isc.org/isc/bind9/9.18.33/doc/arm/html/notes.html#notes-for-bind-9-18-30
https://downloads.isc.org/isc/bind9/9.18.33/doc/arm/html/notes.html#notes-for-bind-9-18-29

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../bind/{bind_9.18.28.bb => bind_9.18.33.bb}                   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind_9.18.28.bb => bind_9.18.33.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind_9.18.28.bb b/meta/recipes-connectivity/bind/bind_9.18.33.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.18.28.bb
rename to meta/recipes-connectivity/bind/bind_9.18.33.bb
index 67628a8650..ceea149699 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.28.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.33.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "e7cce9a165f7b619eefc4832f0a8dc16b005d29e3890aed6008c506ea286a5e7"
+SRC_URI[sha256sum] = "fb373fac5ebbc41c645160afd5a9fb451918f6c0e69ab1d9474154e2b515de40"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.43.0


