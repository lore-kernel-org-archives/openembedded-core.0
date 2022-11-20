Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B24EC4321E
	for <webhook@archiver.kernel.org>; Sun, 20 Nov 2022 14:16:30 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web10.13270.1668953756379792125
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Nov 2022 06:16:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=S8andq3y;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id e7-20020a17090a77c700b00216928a3917so12216901pjs.4
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 06:16:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZwUA8tF6734Yf51bdUKhadUmKeVNwZpdHKxlCWMmu9Q=;
        b=S8andq3yuPcowqV86LBA8PSFIdxv1r8Vsw9hk+5oYhcCmvZUnwlQyPFNjrrSIFhigP
         vfk5Ku0iq+nkR0KDu/WT9XH4njfswIdHS/hgddS2TenotxGUjva/sW7Ai35yzdGGvYUC
         zHJ7kxm3Nq1bLKH4QkyYeTv2mUJx7wlsIdcPd+OyL7rNS4jl7wMihwvLBPc2KjydtohZ
         am4h4t4kOjfa/7XFsdsf8DJJuhxqY0NMI2eh5pWVXziGohvvJCac1NXV3YjqgPSAg7+Y
         CYhktPj/rTacIgZdFRhqpz2XSxRUL9IMA6VppQWzkiccvP60/HbjRStaLuypgpycEC5b
         Tk5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZwUA8tF6734Yf51bdUKhadUmKeVNwZpdHKxlCWMmu9Q=;
        b=Gkas4ucJYi/LRGT33WePSkR7RtazLUC22vuu2+G9C2Bbpdnn//DrdrZ7fVamwWDqdO
         I16jCiFlTS9q1jUhPe/COQFUAuKklw0pcjzF5P1v6A0sDqX4ttK4Xn+RTh/15a8xO7j1
         DwcryCJwYaWGfpwPlfRkxRasoFLt5OtNzQFkEhLDdHGn6qR0j18I3kx7ENozYewHlYOs
         OhEtmG2R/yjEj6wluUGj1i6pbWSScjr580OBqK5KRcQ4nDGQsr+Hy1Ji15Nddflc4OJI
         PJU2iriBc6tt+4LXnchH4Xng7NYEtkwtNIvJo8taEEDvuGGbMe/AnyZvNFjak1+c09OX
         s7ew==
X-Gm-Message-State: ANoB5pmhDCGPptE4Ke8KK2Z6bJoiNGTMMqUs6GuAw+X+uahXovF4z3vP
	DwrzbbcBG/2pbd9/eMxTu+VDhOLwOOMLQkVs6es=
X-Google-Smtp-Source: AA0mqf6Gzm2o/gHCaoM5i3iWUHDVO4k2PcDCStwIGNs5vj9GuN5vvGcNBX8bPwkFba422haGJUE8jw==
X-Received: by 2002:a17:902:e849:b0:188:ff96:a7df with SMTP id t9-20020a170902e84900b00188ff96a7dfmr7969186plg.38.1668953783858;
        Sun, 20 Nov 2022 06:16:23 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id x15-20020aa78f0f000000b0056be4dbd4besm6721379pfr.111.2022.11.20.06.16.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Nov 2022 06:16:23 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 25/35] bluez5: Point hciattach bcm43xx firmware search path to /lib/firmware
Date: Sun, 20 Nov 2022 04:15:14 -1000
Message-Id: <67f6fe7d2cfb95c9a39a0d288daabf69babf6f17.1668952942.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668952942.git.steve@sakoman.com>
References: <cover.1668952942.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 14:16:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173625

From: Marek Vasut <marex@denx.de>

Currently the hciattach bcm43xx firmware loader looks up the firmware
blob in /etc/firmware . Change this to /lib/firmware instead, so that
the path is consistent with Linux kernel which also looks up firmware
for the WiFi part in /lib/firmware .

Signed-off-by: Marek Vasut <marex@denx.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 72b3b79ad8b980e8dd9470d16b72c2c70072bbc0)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index f07e318897..a8eaba1dd6 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -68,6 +68,8 @@ EXTRA_OECONF = "\
   --without-zsh-completion-dir \
 "
 
+CFLAGS += "-DFIRMWARE_DIR=\\"${nonarch_base_libdir}/firmware\\""
+
 # bluez5 builds a large number of useful utilities but does not
 # install them.  Specify which ones we want put into ${PN}-noinst-tools.
 NOINST_TOOLS_READLINE ??= ""
-- 
2.25.1


