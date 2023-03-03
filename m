Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AC27C64EC4
	for <webhook@archiver.kernel.org>; Fri,  3 Mar 2023 16:18:07 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.27606.1677860268373605161
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Mar 2023 08:17:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=eez21ke1;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id y2so3027124pjg.3
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Mar 2023 08:17:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1677860279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PfTMj45keV43866JrwdJFHzFpagnu9oQm63+2JVeIX0=;
        b=eez21ke1sBjRB0oTBBSIRpJ7+1EJ3dKan9iWKMHdqPoj3sNv20wn7rJR0rgZ7YxiwW
         H8pZuROS1OTxs4xfz6ROdc1r095pnExajy+Vmo6Jw579NoFw6jK7QQqFVFfhv4gLg5+B
         MnpNr1AryhS+RXa54u9bCXQOOU8P+CbfWuz/6tTRZpuRseQnT9Hhk7v++NfEMEUWOQH4
         3fSFJWjknFaVDRKrSawXWiL5ngMPJxXH8aN31qgOJQNDIN7JxjDDSBtF3Tq1Uo7LyTRp
         dMrofn+iRnmtiO05qq5Tl7lA+yeHm22Pe7sIXvZEAUpQM7kk120RILgRAC8+v41J8Unr
         H/wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677860279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PfTMj45keV43866JrwdJFHzFpagnu9oQm63+2JVeIX0=;
        b=PR4Y9MTBLum5zC8BAjkGJqwvDfMr5GjZVphco0yoPfshS17p6txzi59D4CcDoLPPqQ
         xZTHh4dtLM3GH8GKXrXvLPEAMzwX5FDU5QsP1hBN2GvkblhTnr3A/vtMWg8oRtH/C2S/
         Cy9d299At6SGZR+p5oN9UOT6m2E05mJ2Uj04jLvd2TsIYFSSP5VPh+nj6KIAFESrqRja
         HZINTOWfSJoTK3J8FWeXc2xZRduNTXHKkJ4odKsxCKDFLHuIVjHUO9Mxpn8qRGUfGpx6
         Jnqe3SYkKOvNOoGkpvsDB14NwIx9b69WQqOILyjB/wPQfAlC2WJUcgQUIKJAq0ANgjTh
         d64Q==
X-Gm-Message-State: AO0yUKVSO7oguhFfPaJowjGa8fqYiN5z/q7wtrRej0qG7OLVpID40Bb+
	sx6PXeGLWBAdV9U4Cy5QwnUq1w70zvbsAYJWyIg=
X-Google-Smtp-Source: AK7set8c31UBuywor/pAbgpuzFMbcJJu41/96cpJ83IQgj3X2ByF7dkV+/33+dwVEgG9dwjiRMn6dA==
X-Received: by 2002:a17:903:1212:b0:19a:996c:5c2b with SMTP id l18-20020a170903121200b0019a996c5c2bmr2613210plh.39.1677860278981;
        Fri, 03 Mar 2023 08:17:58 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id ko4-20020a17090307c400b00186b7443082sm1702474plb.195.2023.03.03.08.17.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 08:17:58 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 15/29] wireless-regdb: upgrade 2022.08.12 -> 2023.02.13
Date: Fri,  3 Mar 2023 06:17:13 -1000
Message-Id: <1b58ad41177323bd61821dc0025d2be66e33c2a8.1677859897.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1677859897.git.steve@sakoman.com>
References: <cover.1677859897.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Mar 2023 16:18:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178004

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
index 357e79d7e1..ce60154f1e 100644
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


