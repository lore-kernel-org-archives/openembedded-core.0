Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6097BC4167B
	for <webhook@archiver.kernel.org>; Fri, 30 Dec 2022 18:39:15 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.25150.1672425545343839005
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Dec 2022 10:39:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QyQ/eK95;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id b24-20020a05600c4a9800b003d21efdd61dso15679924wmp.3
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Dec 2022 10:39:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zezpfdb4xH2c0at1GQz7fumNIqKLHhloErLPZ1VehJo=;
        b=QyQ/eK95LQvtBlP7+DJW8CaeR865lS8L07jAxfXXY3BghmX4pNR0KIdzoEV1dXXcMK
         XyAxeFfRfv4WUoKE5zlFewKt/2ndQQ8X2+ToBuZBIssP8FbyYZ3F4PcKXTpFaiNHno2n
         JA353BaqJRKp8puIHvznO5INb4GVwk5mYc03h3KEZFBBMcYeyW1/S8Vuxx21JGV5o7u7
         PZS678kLsBS/p5sa+mP9CftlzPLkFZjo2wmWGfRcVyhL9qS/Hs4u6fENBCdQz7z5UhTG
         O696Ap7BiKUDssqZ4Uf7GbY0n+aTiN01getZjx30jFEDT1k2f2Z+B5rH+Tvrz2utYJdw
         iTyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zezpfdb4xH2c0at1GQz7fumNIqKLHhloErLPZ1VehJo=;
        b=yKmcGboZkPYt2TXVBkhqXj+1sg4DGTCoyuesWdkXPV2TG3Xdcw4jl5JiB6Swn0yEQ7
         ZvbZREgLpJwg5ZT7+g4cmQuwhtNpANoAEruIJRxRVdXNx2QBnMhRsjUsGX8BShZMiotj
         nW6GUjC2NwtBSRRBXX4trzWBTUJCd6ZBFQ1fOq0Ii3RGqC26XExcR2htfa6rVSJGLLa9
         lLIMz4kTbMeyb1F0HCYXzlMBkCPIFPAAX6Guu01qbjgKedOy+Ulj+8L+Key81NDfKBN7
         fPxt1etrKNYYdyJ4ASFq3oOObi6Ii1qGM83Ltyn/Tka8w/QQOh6bvv9Kfx/h1FYe7+F7
         dDKQ==
X-Gm-Message-State: AFqh2kqcw2RW7eTrn8TVEpARs4Gvfn+f5NG4c5GNm3G2gGIfI6jvA3hs
	pxZAQ63UthFSNLtTSFb/p+qcb6FfjQ8=
X-Google-Smtp-Source: AMrXdXvX7I6OXc5Tl7y4evwkyRod84g0S6YsCKE+lpsEx/Xa+cK5HlTg58BiTsBrB25T9OXYdF5w6Q==
X-Received: by 2002:a05:600c:228b:b0:3d2:37a4:222a with SMTP id 11-20020a05600c228b00b003d237a4222amr26855713wmf.38.1672425543879;
        Fri, 30 Dec 2022 10:39:03 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id n1-20020a05600c4f8100b003d96b8e9bcasm31426682wmq.32.2022.12.30.10.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Dec 2022 10:39:03 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 06/11] libportal: convert from gtk-doc to gi-docgen
Date: Fri, 30 Dec 2022 19:38:45 +0100
Message-Id: <20221230183850.3089510-6-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221230183850.3089510-1-alex@linutronix.de>
References: <20221230183850.3089510-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Dec 2022 18:39:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175169

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-gnome/libportal/libportal_0.6.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/libportal/libportal_0.6.bb b/meta/recipes-gnome/libportal/libportal_0.6.bb
index 9c628c457f..ca58ef4138 100644
--- a/meta/recipes-gnome/libportal/libportal_0.6.bb
+++ b/meta/recipes-gnome/libportal/libportal_0.6.bb
@@ -10,7 +10,8 @@ SRC_URI = "git://github.com/flatpak/${BPN}.git;protocol=https;branch=main"
 SRCREV = "13df0b887a7eb7b0f9b14069561a41f62e813155"
 S = "${WORKDIR}/git"
 
-inherit meson gtk-doc gobject-introspection vala features_check
+inherit meson gi-docgen gobject-introspection vala features_check pkgconfig
+GIDOCGEN_MESON_OPTION = 'docs'
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-- 
2.30.2


