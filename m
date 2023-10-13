Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7379CDB483
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 21:53:33 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.51151.1697234009366609525
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Oct 2023 14:53:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Lv8xICH9;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6b497c8575aso782502b3a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 14:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697234008; x=1697838808; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oWcBNN6+nxlsuTLGgQjZNlLzlP/Dtjgm6X7JQgbeR2c=;
        b=Lv8xICH9+u6RObfoLDMIFMFPvPh9421IsbMXRrww0DNfChodMyFvn2/hTL5yZbUQBV
         HCZTOEcoMqeFs/1a5/mPCia9eZF7TWlVRIFROhzaXXyCEzXC3dMVIA+r6tCdYrhqOJnZ
         32ChIkSu0QrooG8Xgth3gqamhYKNgMMaT9rdzW5a6BvmYfJKVYcF3rnI7TsIXS6c2pFC
         gqfJPPXcJBtWBWNIh4obUxtyEFUXgznnFx44SDhxuoE9gNB0vXGu5VFl5NJL22VM61hG
         2G9QURQ4b+bTu6tX1L11pxo2Y3yCjdG5LBTYPFmiR44A1xegQ7JM4+uoClHfuy6CW8Uu
         3aYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697234008; x=1697838808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oWcBNN6+nxlsuTLGgQjZNlLzlP/Dtjgm6X7JQgbeR2c=;
        b=VHqrJc2Dc4AwnG5KddAcv8lMGeh2aL49zecS7/taORmMkD72jNwOMm6XSbdbHUIWHC
         vvX9v5pjG/iAGodrTbBaxYXi4nRLtwktNX3m1D0bUwbRSSAj4IwXiOLN8VZmKny8IVQn
         HvmR3tbYIISaOAC+TODj57YUBuHROp7OxUKlm+vEf4hkribfJ3m9DOLVqlWEv2zzNmTZ
         U+aSEpYk2Bk3Q/c3DqES8adiddyTWxSQTV0dxTW4Vaw90goELVtn0aa8skaTmAurHymz
         TpVXElWaKSj70G6imHaA27hYkUPnKODok1dS1tDyFW1CodnWBOznI6W4UtjnYCvRVVbY
         HXzQ==
X-Gm-Message-State: AOJu0YyJNDtl3S7vZerlmqyS+8ccXwTelayW6j1SVIfdJ+QWffAUEPnM
	6sl/fWksFUBUI82oyTTuN11Eyd1e6d543rqWvOk=
X-Google-Smtp-Source: AGHT+IFdHFShPUXyaJ7vxh23wQ4YEhfBjyq/Xrk6NKIAZowQxoCSClMRe55H/Vzv+CME7f5c7ISaRQ==
X-Received: by 2002:a05:6a00:1248:b0:690:2ecd:a597 with SMTP id u8-20020a056a00124800b006902ecda597mr32316870pfi.21.1697234008521;
        Fri, 13 Oct 2023 14:53:28 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id u22-20020a62ed16000000b00690fe1c928csm14307334pfh.147.2023.10.13.14.53.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 14:53:28 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 15/27] weston-init: remove misleading comment about udev rule
Date: Fri, 13 Oct 2023 11:52:39 -1000
Message-Id: <35367d029fedc78724396d94abd899e4bd8bef0c.1697233866.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697233866.git.steve@sakoman.com>
References: <cover.1697233866.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 21:53:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189092

From: Otavio Salvador <otavio@ossystems.com.br>

The udev rule has been removed but the comment has kept, by
mistake. Remove it.

Fixes: dd83fb40f7 ("weston-init: Stop running weston as root")
Tested-by: Tom Hochstein <tom.hochstein@nxp.com>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8aa3d43fa1c53cdce45ec88a49f27b076d3812ac)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-graphics/wayland/weston-init.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-graphics/wayland/weston-init.bb
index 99b99f72f1..c2708e38d6 100644
--- a/meta/recipes-graphics/wayland/weston-init.bb
+++ b/meta/recipes-graphics/wayland/weston-init.bb
@@ -35,7 +35,7 @@ do_install() {
 		sed -i 's#ROOTHOME#${ROOT_HOME}#' ${D}/${sysconfdir}/init.d/weston
 	fi
 
-	# Install Weston systemd service and accompanying udev rule
+	# Install Weston systemd service
 	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
 		install -D -p -m0644 ${WORKDIR}/weston.service ${D}${systemd_system_unitdir}/weston.service
 		install -D -p -m0644 ${WORKDIR}/weston.socket ${D}${systemd_system_unitdir}/weston.socket
-- 
2.34.1


