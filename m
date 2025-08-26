Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79AC2CA0FE7
	for <webhook@archiver.kernel.org>; Tue, 26 Aug 2025 13:41:46 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.64948.1756215696930252361
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Aug 2025 06:41:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=21UVIhtJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.172, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b47052620a6so4759394a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Aug 2025 06:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1756215696; x=1756820496; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TUXLvngtYCA8NcpLXjXCkHNO7YeuRJdfORK4sUd0Zvw=;
        b=21UVIhtJbswjnS1rWCMdByOxej5FmHFXUvm/eBhtt9afOzGucv6Dr15CSZI0Pi4H3i
         dJ9dn+8HsOQwpH+173Ff6IerlNgWJFwV74Tvt1IHuolK0Mf6gLBIy/TfVvw5lBZ5USWV
         cIqdNX2Xdh6c6VWz1bf2gks6RwEObJEdRZoeXngX8Eb/xtQ8AuOA7zMyZG2P5wCWNfk7
         1zM+2w8Ww8Lddh2BWCvX05fsWPe9aCaRiF2C3FVXDGqomDDb/sZZTejOOcd2tjWjBu4u
         uEZXWK48oD1VrmmnsNp9zISUoWLrzKUQpKcc8VDMFt4cxfhbeyq8EbJQdfa5nlpPDPiB
         DAQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756215696; x=1756820496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TUXLvngtYCA8NcpLXjXCkHNO7YeuRJdfORK4sUd0Zvw=;
        b=v3V5StiTYHDzkzxbpsPyaGdeAifWGB0cZ7j2pV6JaOUp2Mu1fuyEW7pUy+2KEjzKwz
         pP01rXey/nzj26Xso5BQu0mF9+QYst1AzuyKkhFOyv3BHGxcNkIE834U7SDSzjR8/JLN
         JtvZ4qZwqxrua1PBAwttuJIJOp9WnixaRy/wyQP+LAwoV0KBNfp8+GpkvP3Z6fe6UCez
         gKUQEtiwUS/vKMzoHYDlTvRqciasTO5hxIw3E583eH9VvtylvytHVJ1skRQmUK6Gh/dS
         WbSnZUbPIYesN+u8tZfPGhiNrXBjlUkZXZm6zSzZYcOIoF+WhT0pzqCgP4YiCNjRgaiI
         +TXA==
X-Gm-Message-State: AOJu0YwZ5vS0iLyDxf4UP4VQOsO+wo5Q3NfruOLtb4gFs0o2ad2hN2kX
	s3sSQ/dooy4eE+e52ug/CkoLXCIPH0UMEdwywWgI/cf2V9L70KPiECLeNOljzzzzbHbE0RI/gWr
	/z1D6
X-Gm-Gg: ASbGnctdWYx1cwMQKH+6qxF/EV3N84Ku4yHRydVovEnd1ZVIWQKddh5LEiPhnYmuDKe
	dwjkLCfaHTLXtp/AanrGgA/j/z4rypQgIRSmJ512fAUjWTJBMRiZq7rDhxv5/Ws6kX2HRuIGCmv
	s8+WdPyqS02XEKVdl1uI3T4qBYhpdg+5a9IMDxs3Pae9yWtV2d6AZqtrdXySAPpvZ2IQERF8Uhg
	q38nMXc8jh/sAgeOTaRLdM5E/z7CflW0kAk67/655eBaaRYT3qyuQY06KfNPuBVqjT2/SegQnON
	KhxkPgQRNDaKKVVS9xmc9WOHtI/CTqwyDIjN4EsUSGahXSnjwPMOOsbayj9Kno7sq2y7P+wiRNA
	LuuzXpP/aHnDmSQ==
X-Google-Smtp-Source: AGHT+IE5n1dXQPjf8XjlwvvrrUxLjx9ZhwZQZpw2jfzcGh4zsrZvzzl680JEKZlotame6oYByceMyA==
X-Received: by 2002:a17:903:181:b0:246:9a0b:402f with SMTP id d9443c01a7336-248753a2672mr20698615ad.24.1756215696120;
        Tue, 26 Aug 2025 06:41:36 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:1687:ddce:d4c7:f578])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3274191c389sm1007414a91.4.2025.08.26.06.41.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 06:41:35 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 16/19] gstreamer1.0-vaapi: upgrade 1.24.12 -> 1.24.13
Date: Tue, 26 Aug 2025 06:40:50 -0700
Message-ID: <5b918f7a9002472c271f412bec19c6ef9eaf6098.1756215509.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756215509.git.steve@sakoman.com>
References: <cover.1756215509.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Aug 2025 13:41:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222456

From: Archana Polampalli <archana.polampalli@windriver.com>

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...reamer1.0-vaapi_1.24.12.bb => gstreamer1.0-vaapi_1.24.13.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.24.12.bb => gstreamer1.0-vaapi_1.24.13.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.12.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.13.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.12.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.13.bb
index c634de7c6a..bb0343f765 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.12.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.13.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "39ab3d2a381c99a9e10f46182ed57c6baaeaa8be810bd2f84f162c8be299753c"
+SRC_URI[sha256sum] = "b92c008841387043aec83b08b1fa8cf41e7866a106311a7d99e274e7d24ddc47"
 
 S = "${WORKDIR}/${REALPN}-${PV}"
 DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
-- 
2.43.0


