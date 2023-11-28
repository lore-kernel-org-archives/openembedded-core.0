Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89F3CC4167B
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 00:07:12 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web10.142.1701130027756941668
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Nov 2023 16:07:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CDgOmGt7;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2856437b584so3487619a91.3
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 16:07:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701130027; x=1701734827; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JDMGMgBwL+nXJknrZs2+EgySrzsPZOfDqHCg1l1gVqw=;
        b=CDgOmGt7zUuAUdJb9zvylUKN+cCPxlmVo37GUUI9SJEYW2udojty5/Avj0Df5DnT88
         eeuejK9onO3NzCClbj/mKCGbvSr9V51HnPdg9EWNEUpEIcP0CIcSDI/BN7xHPzVcR6Id
         RofsktE96HIxDPb/w6Hc+QW5E42nO12dKEQf/LCH6Wp8TvQC/werWirb8gxZ062yGtU9
         t1+7mEg4+H1Ryy97M886gOLDJ5Wfj8Zj0QIh9NmgTvRfSj10CTtEFrhAqyZb5SUBWzBK
         x2yMfBTeMfelCtYyL/q4jpYeuECqKoIN8sGmSkBUq/5zjdtfxI9p3wdO0PUyDPx8rgEe
         MMxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701130027; x=1701734827;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JDMGMgBwL+nXJknrZs2+EgySrzsPZOfDqHCg1l1gVqw=;
        b=gVa7+pY+R75Z7snJwxHYppZNgNtQ2St6+hMJCHMwlRP7e1e5r4bCmXsIuCk39yVkeu
         jOLXXmQrYauU2ugqUKkTL/kMOQbT5BSIIB371DeMHSGABVU3L1r32FZcThvoLU/f8IV3
         t0yuDSCP0NhGCRegs9k4rAEYe86q1F1yzxg12NXSRLBxGkt+LT0YjSNVnfYslFUqodDJ
         uRuI9c1KAuqEMwbHHC0UAyDp/MbHDkNGmRV0Wl7hoaM/TKyrGVvBHG4/+drZpdKxZMJu
         573ZFDFku06KyVk3GAqTk3eaipV7sjWxzi1vmijfxQtjrQftTOEjRiNCC9c7u7370PDM
         HleA==
X-Gm-Message-State: AOJu0YwIO8m/CCbnnwhAfq0jF8qH2QxtpxGiRilZ6kBg61YtbWg+8OFa
	MULn4BFNBf5FLVffabc+1Nz5le0WCvooGg==
X-Google-Smtp-Source: AGHT+IFUQzyWGtjPxthiDB1d2TX1x6chUlsmS234deu18opeRPSzswKi5QVfcY8R0SOmNn1xITgBag==
X-Received: by 2002:a17:90b:3907:b0:27c:ed8e:1840 with SMTP id ob7-20020a17090b390700b0027ced8e1840mr12611830pjb.10.1701130025258;
        Mon, 27 Nov 2023 16:07:05 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::2c3f])
        by smtp.gmail.com with ESMTPSA id fw13-20020a17090b128d00b002839d7d8bf3sm6475652pjb.55.2023.11.27.16.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 16:07:04 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Ross Burton <ross.burton@arm.com>
Subject: [PATCH v11] vte: Separate out gtk4 pieces of vte into individual packages
Date: Mon, 27 Nov 2023 16:07:01 -0800
Message-ID: <20231128000701.3180126-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 00:07:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191330

This avoids adding gtk4 dependencies when image may only desire the gtk3
pieces of vte.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Ross Burton <ross.burton@arm.com>
---
v11: Package Vte-3.91.gir into ${PN}-gtk4-dev

 meta/recipes-support/vte/vte_0.74.1.bb | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/vte/vte_0.74.1.bb b/meta/recipes-support/vte/vte_0.74.1.bb
index 8a7054a13cd..071f6684644 100644
--- a/meta/recipes-support/vte/vte_0.74.1.bb
+++ b/meta/recipes-support/vte/vte_0.74.1.bb
@@ -36,7 +36,16 @@ PACKAGECONFIG[gtk4] = "-Dgtk4=true,-Dgtk4=false,gtk4"
 PACKAGECONFIG[gnutls] = "-Dgnutls=true,-Dgnutls=false,gnutls"
 PACKAGECONFIG[systemd] = "-D_systemd=true,-D_systemd=false,systemd"
 
-PACKAGES =+ "libvte ${PN}-prompt"
+PACKAGES =+ "libvte-gtk4 ${PN}-gtk4 ${PN}-gtk4-dev libvte ${PN}-prompt"
+FILES:libvte-gtk4 = "${libdir}/lib*gtk4.so.* ${libdir}/girepository-1.0/Vte-3.91.typelib"
+FILES:${PN}-gtk4 ="${bindir}/vte-2.91-gtk4"
+FILES:${PN}-gtk4-dev = "${libdir}/lib*gtk4.so \
+                        ${libdir}/pkgconfig/vte-2.91-gtk4.pc \
+                        ${datadir}/gir-1.0/Vte-3.91.gir \
+                        ${datadir}/vala/vapi/vte-2.91-gtk4.deps \
+                        ${datadir}/vala/vapi/vte-2.91-gtk4.vapi \
+                        ${includedir}/vte-2.91-gtk4 \
+                        "
 FILES:${PN} +="${systemd_user_unitdir}"
 FILES:libvte = "${libdir}/*.so.* ${libdir}/girepository-1.0/*"
 FILES:${PN}-prompt = " \
-- 
2.43.0


