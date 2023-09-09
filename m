Return-Path: <otavio@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3FAAEEB58F
	for <webhook@archiver.kernel.org>; Sat,  9 Sep 2023 12:55:37 +0000 (UTC)
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
 by mx.groups.io with SMTP id smtpd.web10.15951.1694264128244589834
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 Sep 2023 05:55:28 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.161.51, mailfrom: otavio.salvador@gmail.com)
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-573921661a6so1828314eaf.1
        for <openembedded-core@lists.openembedded.org>; Sat, 09 Sep 2023 05:55:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694264127; x=1694868927;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EH4MZiOFLwszK+WYCL2znCAqUAcQQ/o6lnceWvqU5mI=;
        b=fkiSs2XwHPTTWpua1IIu+uz68wsLW/YbhrNSaAAnIiQerizeyFYa7oe5bd+Il8H8lm
         SXebHSdhB4FAiSj3VktrtAg8QWaf1+7KzqjfADZ2d1DXh5s70g3dOuVXgvprufJ+AWCE
         5+knFcobESyB6K2k55zqcMJnM8HIHX4+XjMx/RsdffvvOwynOHD1yWWJK7ZPwez56ct7
         GdaT5lif/giTAryp5NSDuNBjRZEQB5WHJp/ZgfopxBqGhnf4caXJ43+5tWXT3rXKCYt2
         FtinjTIoACTeaDWOk/rp2/fYj5aO1ltDo2QklqXsETNxo8H9h7A0ALOWKS0B9XHU/RmZ
         mVqQ==
X-Gm-Message-State: AOJu0Ywhsq8IuX69oxAsdu/2b7RpPI/HRa4S+c1/BI6v/jq5ZcHsRRXW
	HC0VwRmXtdjWW5zjAhj6fPi5OtvDyhuTnA==
X-Google-Smtp-Source: AGHT+IFKYi8JgpJ+jnj6/v+xx3L8g8pJw/xMUVFZohSwXGDHm0MWkx/z5niRoyB1BKdI4IDo/deRZg==
X-Received: by 2002:a4a:c80b:0:b0:576:8c2c:c869 with SMTP id s11-20020a4ac80b000000b005768c2cc869mr684656ooq.7.1694264127122;
        Sat, 09 Sep 2023 05:55:27 -0700 (PDT)
Received: from localhost ([2804:d51:5956:ac00:e7a2:489a:8055:28a8])
        by smtp.gmail.com with ESMTPSA id x69-20020a4a4148000000b00541fbbbcd31sm1693848ooa.5.2023.09.09.05.55.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Sep 2023 05:55:26 -0700 (PDT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Tom Hochstein <tom.hochstein@nxp.com>
Subject: [PATCH 1/4] weston-init: remove misleading comment about udev rule
Date: Sat,  9 Sep 2023 09:54:58 -0300
Message-ID: <20230909125514.214512-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 09 Sep 2023 12:55:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187447

The udev rule has been removed but the comment has kept, by
mistake. Remove it.

Fixes: dd83fb40f7 ("weston-init: Stop running weston as root")
Tested-by: Tom Hochstein <tom.hochstein@nxp.com>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/recipes-graphics/wayland/weston-init.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-graphics/wayland/weston-init.bb
index 1884b5d440..024e400665 100644
--- a/meta/recipes-graphics/wayland/weston-init.bb
+++ b/meta/recipes-graphics/wayland/weston-init.bb
@@ -36,7 +36,7 @@ do_install() {
 		sed -i 's#ROOTHOME#${ROOT_HOME}#' ${D}/${sysconfdir}/init.d/weston
 	fi
 
-	# Install Weston systemd service and accompanying udev rule
+	# Install Weston systemd service
 	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
 		install -D -p -m0644 ${WORKDIR}/weston.service ${D}${systemd_system_unitdir}/weston.service
 		install -D -p -m0644 ${WORKDIR}/weston.socket ${D}${systemd_system_unitdir}/weston.socket
-- 
2.41.0


