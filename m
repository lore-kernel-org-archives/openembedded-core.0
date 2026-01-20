Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F3DAD2ED15
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 12:09:35 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5034.1768910966808422910
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 04:09:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=AmmR+T99;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4359249bbacso228704f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 04:09:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1768910965; x=1769515765; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lXo/CZ6o+twYNhJASlJkWrx0BTmzXf5fWMZ4Ju8ENiM=;
        b=AmmR+T99CImjYkP5BkWUB9v/cJ+QRM2mEOUkokm85uUX/ZASioOd9AAj5LhGPqb2KV
         ZdniUh22dc0UQ3TqZ6jxcyfM2AxqQ/JFH7Mm2uaukeLC9fRbGRK6xsh3hDaQq80gpLC3
         x/GM0PZRpuaDVW9Zl3++xNLvTbCfOL2S5B0qI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768910965; x=1769515765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lXo/CZ6o+twYNhJASlJkWrx0BTmzXf5fWMZ4Ju8ENiM=;
        b=O9mdpdJ5uZX3TCQM+EuodvA8+PbWgnxKih0bFWO+Z54Rlnn23gf5JQ01HZ0jlC1Q2d
         d1WmHJyaZcEQyiJmeOWslvTYzUPqro0dWdAk+TI+fXPqEctl/pFA+4eyKArnvblr6cCc
         og1QEuc1xxmFqj08xny+R3WY/lped+9HTe45CHxzIFMfoXQVRxEmxDHLXm67H+pz/4FP
         ebGlaW6k0e8heyGvZQrPWGUJRN47qvDiGXpT+mA+ioOwgO8H7iNc96OcPhDDhembQDCy
         BYnQQsM2IXqQO6QBVfzYi2/PkeEXSDFvWUxOboJtbIckrL2xrx8jBgrcuHsa4f8vbU/i
         ulBw==
X-Gm-Message-State: AOJu0YzcwJRRMJLbmZ8jDSDW3SYq8Jc5po+MEn0rezJPLaMO5R628fTW
	5pjylfdjWu9scRk8oid/ZdsPRa4Tr/E0DBSkTIBHMk7PY2iRPUN2P6kwm7gLvS5vDYXGwZetko4
	dkuHD
X-Gm-Gg: AZuq6aJ1YmTw/GndE+G3zrNNcy20hHQ+8gNmO316/GFRwXSjfG6/73BCgzx0NB4Ffnm
	HTJ6ucjrboCS+sUTKcinXdVk1lRqYoWvCZzoKw/Fz1g2k0nyBZ/gjT4BD6wjwhVJyXBnXhLXo8G
	3s+wdASpGUTKAjX/tFfjgn5F6L86YZgJi8PJ+iSK5bX9KkEL8qQWmbUOF0ZDNhUi6t2GTVGZ+kA
	gy8Ruz5IM5/jIVV3R0jGajCuEIZiCwBdn9hQSMbkPPUlaU7Fvb1VZ2zrPJFsBXL0h8GZWIHoLuL
	RRx06vQ2QJtIMc3ej1VMKMkbZMclBl0jXmHBWJei4fHaL/L/+BdIdFSI4HS7fJSl+k/h92tWrrH
	uH9kxiRHTqfK4/ukluMnL0LI2A3M9+L/ROAB4PiW2rvNH+q7LYFp5xaMyHKU5LMNEmw6EujC0ZK
	b2eaPGNs8cTLrkdunh9We9MFdfUrFHdlHGI8JHtIJI1Ob2FQOEP14BJvAqM8WTFkPEj+MlG7BBz
	jbmlMtltTWIk9lxmXQemQ==
X-Received: by 2002:a05:6000:2481:b0:432:86e3:84ec with SMTP id ffacd0b85a97d-435695652ecmr17731907f8f.23.1768910964868;
        Tue, 20 Jan 2026 04:09:24 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569927007sm28916097f8f.16.2026.01.20.04.09.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 04:09:24 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 18/22] pseudo: 1.9.0 -> 1.9.2
Date: Tue, 20 Jan 2026 13:08:32 +0100
Message-ID: <c7ef64dd23d4ed3044ab58306f0841afa4701f44.1768910519.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1768910519.git.yoann.congal@smile.fr>
References: <cover.1768910519.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 12:09:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229696

From: Robert Yang <liezhi.yang@windriver.com>

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 48a42747fd280ce68283e1491971d22273e3bdf2)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 5e2a8bf328..ec9ef2dd5d 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -12,9 +12,9 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "3fac97341f0f8270ca28a91098d0a58ca306a6bd"
+SRCREV = "b4645cb30573c5b3d5e94b9d50e1e2f8beefe9be"
 S = "${WORKDIR}/git"
-PV = "1.9.0+git"
+PV = "1.9.2"
 
 # largefile and 64bit time_t support adds these macros via compiler flags globally
 # remove them for pseudo since pseudo intercepts some of the functions which will be

