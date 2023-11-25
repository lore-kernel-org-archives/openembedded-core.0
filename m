Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6420FC61D9D
	for <webhook@archiver.kernel.org>; Sat, 25 Nov 2023 07:38:32 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.web11.22072.1700897909115786027
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Nov 2023 23:38:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kh/E8auo;
 spf=pass (domain: gmail.com, ip: 209.85.167.169, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3b83ed78a91so1569029b6e.1
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Nov 2023 23:38:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700897908; x=1701502708; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q2+74KZaoq2Tg2IzKS92/qkV/ThCLe07Vi3w8CPhB3I=;
        b=kh/E8auoDUedyFXGNKB3roF+yF3/jIRJk1NaaAG/DuMivEwHgVdb/p1FjyvZfBJEby
         xxBEtj8xWGXGRqTiDxIYFwln8iT6LVe5wvrNEhxnVkKvOdyAg6INcfKHpjaMJhLN0gzh
         gC69Xv8T4ebef/uB8RX8lk6Sy4BEgi99ae3P9t99idA1WzfGHhUorZ7BO8GSf03TPy4f
         tcf2qlSRNfR5BBZlH2xKEJHJWlmL9wrfgh9jCOUlzBReZrnXYa20ikWPtkXkHbT5Y+DF
         DDqNdLZ6vAaaoCaDBvyNTJkJbyAHpefhnhASnONSL8/B8XLUwtz20PP0N1sAaCl6ObGQ
         DNKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700897908; x=1701502708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q2+74KZaoq2Tg2IzKS92/qkV/ThCLe07Vi3w8CPhB3I=;
        b=d1SLjShqH12k1MADSFIkIcQ8xFGLgsF75P/7/umZKkRwX1ELSy9GaE6IAq/YPwMWio
         KLwd9LfNJvNmFCI5sAtCgzGBe8iOGBzYQCTSV1nh0BBwcZ2zR/r1eBP+hIiekD9do6yG
         /6ANQUik1M5wQlD0+guPkAywaT3eC79pUnu06DAi7ZkT74et/s7Y3sGSwys7YnkOpJ0b
         Q2heOQoMzcpjLUhy3E6PvKrgSYwx9UBsp/NWakcDTeP5i+TQg4AIhHJaoF1GwCaRcV59
         KGsJJ2z5DDJfAiSn74xjFs1xQ2uTQ3tiSd1ZmW6VBcK3n9IsmgoG0OUacsElAnezreB0
         mMkQ==
X-Gm-Message-State: AOJu0YwJhvAspIjJ5/sDxAK3cYdzwgYydIXogyucKjW8TXja7kaUx+yO
	3mvb5nJIcrV9bEoNYfb3p5VdWdGdz9X6sQ==
X-Google-Smtp-Source: AGHT+IEo43BUeuf7H/D8Yl4Maok16JMjPFXgC06QA/9a9ptJV0rboey5I4f1i3c+t2mRX8m2ZQVR1w==
X-Received: by 2002:a05:6808:1b25:b0:3b5:75ad:5b73 with SMTP id bx37-20020a0568081b2500b003b575ad5b73mr7306205oib.13.1700897907890;
        Fri, 24 Nov 2023 23:38:27 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::2c3f])
        by smtp.gmail.com with ESMTPSA id ei40-20020a056a0080e800b006933822e7a6sm3806105pfb.66.2023.11.24.23.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 23:38:27 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Ross Burton <ross.burton@arm.com>
Subject: [PATCH v10 3/3] vte: Separate out gtk4 pieces of vte into individual packages
Date: Fri, 24 Nov 2023 23:38:21 -0800
Message-ID: <20231125073823.159294-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231125073823.159294-1-raj.khem@gmail.com>
References: <20231125073823.159294-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Nov 2023 07:38:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191220

This avoids adding gtk4 dependencies when image may only desire the gtk3
pieces of vte.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Ross Burton <ross.burton@arm.com>
---
v10: Added new

 meta/recipes-support/vte/vte_0.74.1.bb | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/vte/vte_0.74.1.bb b/meta/recipes-support/vte/vte_0.74.1.bb
index 8a7054a13cd..91c331d44cc 100644
--- a/meta/recipes-support/vte/vte_0.74.1.bb
+++ b/meta/recipes-support/vte/vte_0.74.1.bb
@@ -36,7 +36,15 @@ PACKAGECONFIG[gtk4] = "-Dgtk4=true,-Dgtk4=false,gtk4"
 PACKAGECONFIG[gnutls] = "-Dgnutls=true,-Dgnutls=false,gnutls"
 PACKAGECONFIG[systemd] = "-D_systemd=true,-D_systemd=false,systemd"
 
-PACKAGES =+ "libvte ${PN}-prompt"
+PACKAGES =+ "libvte-gtk4 ${PN}-gtk4 ${PN}-gtk4-dev libvte ${PN}-prompt"
+FILES:libvte-gtk4 = "${libdir}/lib*gtk4.so.* ${libdir}/girepository-1.0/Vte-3.91.typelib"
+FILES:${PN}-gtk4 ="${bindir}/vte-2.91-gtk4"
+FILES:${PN}-gtk4-dev = "${libdir}/lib*gtk4.so \
+                        ${libdir}/pkgconfig/vte-2.91-gtk4.pc \
+                        ${datadir}/vala/vapi/vte-2.91-gtk4.deps \
+                        ${datadir}/vala/vapi/vte-2.91-gtk4.vapi \
+                        ${includedir}/vte-2.91-gtk4 \
+                        "
 FILES:${PN} +="${systemd_user_unitdir}"
 FILES:libvte = "${libdir}/*.so.* ${libdir}/girepository-1.0/*"
 FILES:${PN}-prompt = " \
-- 
2.43.0


