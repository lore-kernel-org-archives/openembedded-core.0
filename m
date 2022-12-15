Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 179BBC3DA79
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 19:21:44 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.143564.1671132082168738641
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 11:21:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=dyQjgIPX;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id u15-20020a17090a3fcf00b002191825cf02so127704pjm.2
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 11:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OkLLvecsjgY06UrWyRQQAZdLZOAIdUSrn76jy7SEIXA=;
        b=dyQjgIPXR45jivXn/9K0SbqwNflQYdnNNV7iCrpDyYxOTkSIwZ7nyPXV/Ay1Im8r4H
         qaptbQ5+T1LS02Ezk5jd0iIhbl8s4J1vcFFius47s4xdtaI0Iv6GDqFw7k7vv2bL0l2L
         KCKdif1hwJXYLx0xklQItgmTg9UkVjR7I8C9wnrZ8jWN00EXFryHvhJcbkO2wL4Hv4fe
         cxDMDZn9s7uLVNyRMIIDjWiM3AzLQOzzGAxmtthZzdpjW5xN1I4oMDSQVV4L2Gmw6oU5
         t8jxoBlZC0aKl2fvHdvqOAPwMXJBgjMKdJ4F9W7Oko78MlArxk6rP/2A2smA8E859LzC
         NUtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OkLLvecsjgY06UrWyRQQAZdLZOAIdUSrn76jy7SEIXA=;
        b=vSBZ+74bxaoR/JZ2PYBOe7DB+UUhKwI2/PpmRG/XQrc1CxCZetdzwGi7JH4u/ngJVu
         D02wyATo+KJi5XrWv5+8qlh83cBdtaGY0KTVJAy8W3oQHLBb6l3p8kr8nEVaOlgu5BVE
         xOIInljC22ppuj0AUmbddbl9qFbN3wDTiIvyjPnVHtJwlfaAIx81khiWOX+gqaG+1/Fm
         o6QZETX3tqQjCXYYz2MMCuuKqCOXqInxcjp4bXq07J5X0Do2d49vnJEVjA/XT0gntzLH
         pdcSr2jvc5cqVFnyXQxrirHM97eEctqxRzbP1xrNVsMyycjoVfflgnO1b8D2Y3NhN3Vl
         9fvw==
X-Gm-Message-State: ANoB5pkwYgYwPnuTbAgijTnC0lvc+CR9MFoEDmboPCy3L5Ack2mu7kGM
	GkfI65cSd+3Mq2P8BoKQwtzg+/jXHti5yHD7kU8=
X-Google-Smtp-Source: AA0mqf7iXxcZExRP1wU4x52ykLd9YTs8gcxv1LqrvJ2+jd4Zaq8wiEvdOo1HUlV/OBP+4AgDb1RBdg==
X-Received: by 2002:a17:902:d3d3:b0:189:cc58:77a8 with SMTP id w19-20020a170902d3d300b00189cc5877a8mr28594910plb.46.1671132095884;
        Thu, 15 Dec 2022 11:21:35 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id r19-20020a170902c61300b001869b988d93sm4167095plr.187.2022.12.15.11.21.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Dec 2022 11:21:35 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 20/30] qemu: Ensure libpng dependency is deterministic
Date: Thu, 15 Dec 2022 09:20:44 -1000
Message-Id: <a52aee0dae884aaff6857490df4865e033dd39df.1671122751.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1671122751.git.steve@sakoman.com>
References: <cover.1671122751.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 19:21:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174612

From: Richard Purdie <richard.purdie@linuxfoundation.org>

If the host has libpng, because of the way we handle the GL dependency in qemu,
it can cause determinism issues. Add a specific PACKAGECONFIG entry for libpng
to avoid this (and the associated autobuilder/uninative glibc symbol mismatch
failures).

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 34afdd0bf5e2810d440bcd378ba1023159c2b2d0)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 55aced9f9a..0b24540bf9 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -148,6 +148,7 @@ PACKAGECONFIG:remove:darwin = "kvm virglrenderer epoxy gtk+"
 PACKAGECONFIG:remove:mingw32 = "kvm virglrenderer epoxy gtk+"
 
 PACKAGECONFIG[sdl] = "--enable-sdl,--disable-sdl,libsdl2"
+PACKAGECONFIG[png] = "--enable-png,--disable-png,libpng"
 PACKAGECONFIG[virtfs] = "--enable-virtfs --enable-attr --enable-cap-ng,--disable-virtfs,libcap-ng attr,"
 PACKAGECONFIG[aio] = "--enable-linux-aio,--disable-linux-aio,libaio,"
 PACKAGECONFIG[uring] = "--enable-linux-io-uring,--disable-linux-io-uring,liburing"
-- 
2.25.1


