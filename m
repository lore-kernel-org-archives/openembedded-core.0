Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47361E77183
	for <webhook@archiver.kernel.org>; Mon, 16 Dec 2024 14:36:50 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.57973.1734359807228728984
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Dec 2024 06:36:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FljoVA2p;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43635796b48so13777595e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Dec 2024 06:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1734359805; x=1734964605; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=70fgTmpoc7+Y1B8m8HyZK4TTJNsg1dDoibBBDDDhfXU=;
        b=FljoVA2pTgidiAIFQfN+zLpbIi0maeIagMM2h0vTqi8qPHL9aqymG86TLc5cWI+oIN
         1UzuMCkbrplFOQeBdoehTDGxuQ8btUPNA4Il24VonXv0NpnBVhe0gTmGhlXxFoAm+5It
         M6PnCTpzLChXWo/fqVtR8NL8xVlJvaMBFyoVQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734359805; x=1734964605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=70fgTmpoc7+Y1B8m8HyZK4TTJNsg1dDoibBBDDDhfXU=;
        b=LAKju7V/n5KSVsP9qUgsiBW4UYS8pWVOu2KFjKyxSbK5nTRuVc2eV2fIzS/ZrclZZC
         hE0VnfmZHV5z07e78eENh82gUTB2lzECQMb22YUjrNtTIRhwqB1ASQ0dJW82hhQMWws8
         WYxOqOi4saW6mVmIo4jKj83oWKfhhXwSN87bLnE8zHfr4Kk3f4mRbUMPyrJwN7kUw5cm
         Lic1lPCCs1DPbhQKY9F0siDii0Lwv4t1jNJh1LHCvWmFaUFsUO+VZ7skI/PO3ymVziX3
         XZfRdcH+8WHMWVnCfixETH4WfuGh4CDxYJnHMdSuNP9gmn5NkegH+jFBIBi+4zMpd+0K
         GjaA==
X-Gm-Message-State: AOJu0YwROcOkCKeaDp/4W8R0GFq4SkG/85qloH/kwT2jOFfmx2M9GpoJ
	ub0DKkpH7iBJT0esV6o//lhF9kbtxqbeUFjY710syx/vLY9z/O7rxo+FPWNMIcLRpAvtKSKoYJF
	v
X-Gm-Gg: ASbGncvF+KTV6dDsGBcxDI3TQYTwz1opgCK55txgN4grccbiQMMIBEnfgJxaJIoWBiE
	+rIIcg70siiWe/qy0rr9Jru5mdYILF2eDO7BgJb0KixT4M1IsKmowFNQuXOYxkQnUtkXwEe4EtF
	8BOKTqmWURpUBfHqM/1V+CjqFHHgrfr18CnzjHmgtPIlBmOH4kxipXCRUeq+jlMzuuahgCAotfz
	i1AF4CDQRUCXvMa8q0sb049X3PPvBG6O6RNRqqZcgjIl75DNRdh0OqzYrYw5tP7CzE4OeNax1Uk
	GPvDhM+pvg==
X-Google-Smtp-Source: AGHT+IGAO6HLlXikMIbm5ystXMEyTLnUrhC6cnmD6BEj7dKD/ngseTvgrdz5OhCTys5an/2Ny1sYKw==
X-Received: by 2002:a05:600c:c8c:b0:42c:b8c9:16c8 with SMTP id 5b1f17b1804b1-4362b14bbe0mr99088165e9.10.1734359805081;
        Mon, 16 Dec 2024 06:36:45 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:1ad8:ac77:3170:84a7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c80163b8sm8191107f8f.35.2024.12.16.06.36.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 06:36:44 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] subversion: Upgrade 1.14.4 -> 1.14.5
Date: Mon, 16 Dec 2024 14:36:39 +0000
Message-ID: <20241216143643.1485197-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Dec 2024 14:36:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208767

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../subversion/{subversion_1.14.4.bb => subversion_1.14.5.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/subversion/{subversion_1.14.4.bb => subversion_1.14.5.bb} (97%)

diff --git a/meta/recipes-devtools/subversion/subversion_1.14.4.bb b/meta/recipes-devtools/subversion/subversion_1.14.5.bb
similarity index 97%
rename from meta/recipes-devtools/subversion/subversion_1.14.4.bb
rename to meta/recipes-devtools/subversion/subversion_1.14.5.bb
index 0f453db2473..c8a2e12f4f0 100644
--- a/meta/recipes-devtools/subversion/subversion_1.14.4.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.14.5.bb
@@ -12,7 +12,7 @@ SRC_URI = "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://serfmacro.patch \
            "
 
-SRC_URI[sha256sum] = "44ead116e72e480f10f123c914bb6f9f8c041711c041ed7abff1b8634a199e3c"
+SRC_URI[sha256sum] = "e78a29e7766b8b7b354497d08f71a55641abc53675ce1875584781aae35644a1"
 
 inherit autotools pkgconfig gettext python3native
 

