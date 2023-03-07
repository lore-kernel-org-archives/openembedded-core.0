Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB473C6FA99
	for <webhook@archiver.kernel.org>; Tue,  7 Mar 2023 22:48:45 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.8615.1678229297038846880
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Mar 2023 14:48:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=6iTV7hvV;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id y11so15853732plg.1
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 14:48:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1678229319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h/qC8J4/W2oKJ1ODVbb9o9k7iZHBze20RsIGasdQKRU=;
        b=6iTV7hvVKKlt3Un69KV4MfYQ8odAv2i7XcR/SwoArzdvtDBchogrI07tm4v3Fve2rJ
         Hwdk4Dx8GFWyRUfRvBx3B0/5qS7uM7zdd/aBo+qFVPVmcKxvmK/TbPidF9GKedc/buiC
         cSI+adTkAGmGNnwAJG72s/NqegUn9SXmUaBl8TjUZ9OxfjUnOBV+4YyzskBDDcdGVjNy
         FIsUAF8DNyS67sLoUdTBpmQXD4KY59VEN4d3Svn6aWsKUhabjc6JeH/WcZIWnDImRtQi
         iKhRdBVWCfyCCKuycgKLp9m+qyjLxIK05x/lyFyk47z0jDOLKMJ2v7r0Rnf+ERrRi6AO
         SBZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678229319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h/qC8J4/W2oKJ1ODVbb9o9k7iZHBze20RsIGasdQKRU=;
        b=uyyT2wfgV3UWFNQ74Gr12mhWFPb2pbd33Cari01T6Czp5rvAFC0/MaiO6tL+2jGAoS
         INYxTyFNFcAztWEFigaVgCkKKnhzkcQOXCbGRcEjt+PhK/4wOjPXgkFRebCFmczLB0FV
         4DnyOhwmMeClPr6A2g0yulDvnYuKOTuxoEOsCX+lGL4fCg2trZl9WOoxgc0LJuj41feM
         QTDcBzhPMpiwZ2hcNbRRCHEQPevmSB3lve2ClpBLKhaPxvPuN53iJK2akeqVmV/Uw5/1
         HHJlKB7/Df4i5zSqHfhOOFF3MgScWfV4irpR/YD7BGKQnvSoLceyPTXB+HWbI3HZkQf6
         l3+A==
X-Gm-Message-State: AO0yUKU1rqiWZ7/xkQfDSjTi3IiP+zG8hTxwPBw3Q64gwacZX/bkZBHX
	meKa25SOxoCFDmgM28iX6oU+iRh0/cz+++bIOdc=
X-Google-Smtp-Source: AK7set8YjTAG41sYQBu8OzjRAbsFuMZLKoUwt3S1D8Dd4lQxjDp35EHUz02VIQgbQl/31lP0ZKhGgg==
X-Received: by 2002:a05:6a20:841a:b0:bc:96bd:d701 with SMTP id c26-20020a056a20841a00b000bc96bdd701mr22785953pzd.13.1678229319613;
        Tue, 07 Mar 2023 14:48:39 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id k1-20020aa78201000000b005cdbd9c8825sm8388958pfi.195.2023.03.07.14.48.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 14:48:39 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 12/23] wireless-regdb: upgrade 2022.08.12 -> 2023.02.13
Date: Tue,  7 Mar 2023 12:47:46 -1000
Message-Id: <a9a7c73b2b2b584b80f3a70029d1c5ce5fd6784f.1678228988.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1678228988.git.steve@sakoman.com>
References: <cover.1678228988.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 22:48:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178134

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit a8e8ea1b4b100b6f0ba5ca9441a8f3f1ac31fbfd)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ireless-regdb_2022.08.12.bb => wireless-regdb_2023.02.13.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2022.08.12.bb => wireless-regdb_2023.02.13.bb} (94%)

diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2022.08.12.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2023.02.13.bb
similarity index 94%
rename from meta/recipes-kernel/wireless-regdb/wireless-regdb_2022.08.12.bb
rename to meta/recipes-kernel/wireless-regdb/wireless-regdb_2023.02.13.bb
index 7165a9f9b3..295510225a 100644
--- a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2022.08.12.bb
+++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2023.02.13.bb
@@ -5,7 +5,7 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "59c8f7d17966db71b27f90e735ee8f5b42ca3527694a8c5e6e9b56bd379c3b84"
+SRC_URI[sha256sum] = "fe81e8a8694dc4753a45087a1c4c7e1b48dee5a59f5f796ce374ea550f0b2e73"
 
 inherit bin_package allarch
 
-- 
2.34.1


