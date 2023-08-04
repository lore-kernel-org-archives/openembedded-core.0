Return-Path: <otavio@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3FEAC001DE
	for <webhook@archiver.kernel.org>; Fri,  4 Aug 2023 20:04:58 +0000 (UTC)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.web10.6741.1691179496630777944
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Aug 2023 13:04:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.167.176, mailfrom: otavio.salvador@gmail.com)
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3a6f3ef3155so1832291b6e.1
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Aug 2023 13:04:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691179495; x=1691784295;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EH4MZiOFLwszK+WYCL2znCAqUAcQQ/o6lnceWvqU5mI=;
        b=FHtaERwtjOCBaR/VKMfeV7Jx3bgOEqANupma8vYkEbVAQtW1DwCOh/I8FsEwfBvIZ9
         JGrXQh4RFivOp+jXfZgFJgq9MsEyJhGcu/2REdutS2YKbYz3FzE8qe/UncPVdmO2dP9h
         ZdZPsg84Shk843xUBr+cbDtpkIgetuONsc8YezJxzZJ88gBabPeGGvMN3NQHJwUFa62U
         bIH1Mn2zsI4A6dIY16ATzslqKuLjmitCNmhTt0d/RTmSx3qeqlU5s8HRcfaXEVD04tAu
         8xlG154Pe3JqYueBispplayRyEOK++5ftWxCtw4U6KXCN/ywcAs4PG93N9RQvYSu9Uqq
         ti5Q==
X-Gm-Message-State: AOJu0YwiTBl8zJnOZE4udrZrvMLNLimAeTzrRYjQwMyV5zFlcNprXbV5
	MDbcIgxnL8mXMhAaK2M13IZ9STc0uUbQgw==
X-Google-Smtp-Source: AGHT+IEGDpisnmpqOFp6SEGP0iN07RqrHyF71ivrzysbObTVDZOPlnUL799Wy2vlnn++q0I1wgOEfQ==
X-Received: by 2002:a05:6808:2a59:b0:3a7:4dd0:d4db with SMTP id fa25-20020a0568082a5900b003a74dd0d4dbmr2888352oib.11.1691179494888;
        Fri, 04 Aug 2023 13:04:54 -0700 (PDT)
Received: from localhost ([2804:d51:5904:c000:7713:9c86:e19c:d8a6])
        by smtp.gmail.com with ESMTPSA id bl41-20020a05680830a900b003a761fc74fbsm1453801oib.11.2023.08.04.13.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 13:04:54 -0700 (PDT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Tom Hochstein <tom.hochstein@nxp.com>
Subject: [PATCH 1/3] weston-init: remove misleading comment about udev rule
Date: Fri,  4 Aug 2023 17:04:09 -0300
Message-ID: <20230804200438.1651568-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Aug 2023 20:04:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185539

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


