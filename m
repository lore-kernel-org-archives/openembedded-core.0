Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5164CC433FE
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 15:34:55 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web12.11516.1634657694259239281
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:34:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Y1fSAN9I;
 spf=pass (domain: gmail.com, ip: 209.85.128.53,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id v127so12470501wme.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=p28KPVD2SSqByspwLX+zpfB+T6aBlCWLPZXJJrQ4k7Q=;
        b=Y1fSAN9ICb/rAUAxcdZqSn6wJwfJ3j4aGNvseuYIm1Y2YX8yht7K+kxNrzCVvYHUwi
         28AsmQwqtQCc8YEChg2+qFQVFxaKvH04PrjEcvy7Ba8DxY+3H7lKE6iZjExe+IavzzuH
         efx73HdFK9dRriaRlWLL/A8/P75Tn6mtihViDgBYx8eG4eDvLsZbkK5F2FcKc8NBck8v
         DNucfaDv/GftmZyfloHRg5iqpfk2yu9HoeqAhcWPtgDm62VQ2TJwXDkG0W6AUyNW6Drb
         MKMZQVdd23GvgQ6Yzvz97y2gy2mBXxHAfSTEWGgE3mPEr0MZmjw+5syX2zVnTa8WToGZ
         WekQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=p28KPVD2SSqByspwLX+zpfB+T6aBlCWLPZXJJrQ4k7Q=;
        b=Gv9X5WlcV2olhmaB1TNjyI9GIhCWEzxtg0YjJ1pCsH4m4C0BAHsUejTTN60JsPtvcR
         7Kr2RINOpC2NdkMpc8r+TLGFS/IaRzqA63QsMee8aZ+5R0SmkKvmQXpH0IuYTvviND0X
         /iuEUzqWPt6TjWEYsEeshHJ5kX7DhMWQ1x5HSLUopPhjDNakiZzoimw3lAlGzpiNiDAt
         BAiKtGmqbzPAIJfoHAnBZG2n6a24Ae11pjXmEI+2LEwZoW4S/sqRxcMnfhpRlWclOB6t
         SK6BYII7RKI5TG/1p6fmi6k8tXLIMTNiHlOmmQLL19tNnG2fU9AI1AKhOl7I1Jmmn4yr
         CwhQ==
X-Gm-Message-State: AOAM532ypXrX4VKl2+8R6X71kmhSa1Vz4eZWk7cgvAN3LL0FGhrcxSQm
	idGWRlPeDdRrCxlk+McD31QoCGdiSpM=
X-Google-Smtp-Source: 
 ABdhPJywfUCMqwgxn+2r2I2WO5ny8x36nxQxqggN3oMf/zsRtvKNGlRwZADZsm89pfAVXOtb4WBiWA==
X-Received: by 2002:adf:bb41:: with SMTP id x1mr45173966wrg.346.1634657692928;
        Tue, 19 Oct 2021 08:34:52 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 t1sm5868537wre.32.2021.10.19.08.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 08:34:52 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 41/65] msmtp: upgrade 1.8.15 -> 1.8.17
Date: Tue, 19 Oct 2021 17:33:55 +0200
Message-Id: <20211019153419.3319802-41-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211019153419.3319802-1-alex@linutronix.de>
References: <20211019153419.3319802-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 15:34:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157160

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../recipes-extended/msmtp/{msmtp_1.8.15.bb => msmtp_1.8.17.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/msmtp/{msmtp_1.8.15.bb => msmtp_1.8.17.bb} (91%)

diff --git a/meta/recipes-extended/msmtp/msmtp_1.8.15.bb b/meta/recipes-extended/msmtp/msmtp_1.8.17.bb
similarity index 91%
rename from meta/recipes-extended/msmtp/msmtp_1.8.15.bb
rename to meta/recipes-extended/msmtp/msmtp_1.8.17.bb
index bb56a2e347..b451ff7f28 100644
--- a/meta/recipes-extended/msmtp/msmtp_1.8.15.bb
+++ b/meta/recipes-extended/msmtp/msmtp_1.8.17.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 UPSTREAM_CHECK_URI = "https://marlam.de/msmtp/download/"
 
 SRC_URI = "https://marlam.de/${BPN}/releases/${BP}.tar.xz"
-SRC_URI[sha256sum] = "2265dc639ebf2edf3069fffe0a3bd76749f8b58f4001d5cdeae19873949099ce"
+SRC_URI[sha256sum] = "0fddbe74c1a9dcf6461b4a1b0db3e4d34266184500c403d7f107ad42db4ec4d3"
 
 inherit gettext autotools update-alternatives pkgconfig
 
-- 
2.20.1


