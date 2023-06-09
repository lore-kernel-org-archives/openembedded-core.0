Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC95DC7EE29
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 16:54:25 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web10.162.1686329657843028510
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jun 2023 09:54:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=vPjTolU8;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.179, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-53404873a19so724219a12.3
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 09:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1686329657; x=1688921657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8k8ioO4rwvhWw1hSHTiHVayZiyPByHFFA4QzicUGRJY=;
        b=vPjTolU8Z0o4EDWA/RMZ6Oh9OHtg9LGC7jd89jAZtPGzX0DaU0IExL08bVMEfdTYqB
         0NflhIp6Tmla1M6bowRuKJCAi/rUu3rMBZXmvleJjTebR7P7rhqU6ecjEE9YvhNd36vW
         8wmvmDfE/JxynBtbnKmPR0/TWGcdg5YNaEeIRes+aCM2MdTmVHuknZ52YzmPKBS77Qfc
         NmWD/KoOArtxkyt+kubxbi42BL6bJfrq1oac0A+3ZcKXAxEFJE7fOq+k9rfgXCvlbhgV
         7pEqcif5/kJSWwvThJIC+DQIPPOALkR9U51FevyDsmgVAOE6omQdwRxFaSu3ulDZcYVC
         /Uxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686329657; x=1688921657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8k8ioO4rwvhWw1hSHTiHVayZiyPByHFFA4QzicUGRJY=;
        b=iyb7whpgYDEop+UQdElQBS21TbeetJtDzbGJ2gFLxE7vZ5ECRlIjLhaUcqn/05u+bi
         8RyWzaSHpt0wLoqYzrwyDXspyU6MTAJJV4of1yLq5LvCq8am9INSNbpBphZaUwCa+Ns+
         iI9uHSrRBcwFe9iscxgqF0F+8hE9SGj6HsGI76o1KpTIGP4JLK7RnWyN5hLoBU5LZj1Y
         hQCO0OGzy7lwaL8fKVZk3dFFy1zRdkHb37XeFH786lFJ/QYv7INWsgySkDf7gfGTw/WR
         WcruELhw/4wkqbAFT8KBXrR9G1OILTTGWCeG2UWLa6gCoshvp+fNf7i3Anip1xhrLAGS
         NNjg==
X-Gm-Message-State: AC+VfDw2VU6Ax+Y5kELP4OqX+QQ6QxSYQ/daAdZdzPoXAgHY1yEqeLH2
	iyElpXhJodviFr01TGAmB9IWFInLfjzIE2GSFu0=
X-Google-Smtp-Source: ACHHUZ7blrUS5COBn36ULaGgx7h8oqXl3tlUoZhKQ03Gfzdjqz7tR/6PK4G1fDIq57coXBVwvcRpTg==
X-Received: by 2002:a05:6a20:e489:b0:10c:3557:399a with SMTP id ni9-20020a056a20e48900b0010c3557399amr1218484pzb.49.1686329656828;
        Fri, 09 Jun 2023 09:54:16 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id j24-20020a62b618000000b0065980654baasm2901071pff.130.2023.06.09.09.54.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 09:54:16 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 08/30] libxi: upgrade to v1.8.1
Date: Fri,  9 Jun 2023 06:53:35 -1000
Message-Id: <fbe7b8b6d51201273de2f164c403778630e7bae8.1686329289.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1686329289.git.steve@sakoman.com>
References: <cover.1686329289.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 16:54:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182574

From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>

Changes:
Use xz: upstream has not released bz2.
Update sha256sum for new version.

Details at: https://gitlab.freedesktop.org/xorg/lib/libxi/-/commits/libXi-1.8.1

Signed-off-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 278f73b2bc06f25fd66322e38c06ef5ebf894f98)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xorg-lib/{libxi_1.8.bb => libxi_1.8.1.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxi_1.8.bb => libxi_1.8.1.bb} (85%)

diff --git a/meta/recipes-graphics/xorg-lib/libxi_1.8.bb b/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb
similarity index 85%
rename from meta/recipes-graphics/xorg-lib/libxi_1.8.bb
rename to meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb
index a6cf9b3002..00bd46ef13 100644
--- a/meta/recipes-graphics/xorg-lib/libxi_1.8.bb
+++ b/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb
@@ -16,8 +16,8 @@ DEPENDS += "libxext xorgproto libxfixes"
 PE = "1"
 
 XORG_PN = "libXi"
-XORG_EXT = "tar.bz2"
+XORG_EXT = "tar.xz"
 
-SRC_URI[sha256sum] = "2ed181446a61c7337576467870bc5336fc9e222a281122d96c4d39a3298bba00"
+SRC_URI[sha256sum] = "89bfc0e814f288f784202e6e5f9b362b788ccecdeb078670145eacd8749656a7"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


