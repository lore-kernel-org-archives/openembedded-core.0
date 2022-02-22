Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FE2EC433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 19:17:28 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web08.1972.1645557447194058564
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 11:17:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RS5ZuUqn;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id
 ev16-20020a17090aead000b001bc3835fea8so467112pjb.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 11:17:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=X4xVXeduiKApS5jdl9z3vg0p3yiRh7xu17Yg0fxqzdw=;
        b=RS5ZuUqnXrZ5gv6JD3i0PX9Y0+9aO33qODFsVHFg9GOy/RtxasM8/HmKkhY7pEwl7B
         kuJE/psc6NI4efeo6Yu4vQJGCctfnmisj4g43GDwIk05FUt75Mx7q0ofk3j+so9LpZmP
         qMcSYpb9ALjO8V8idM1gG04Mk4Hv9n3IDfTDOFv/1+xSOBK9bRkQEdmVBG/HeVPn3pBq
         rlxVwUJ6Mh74oFHPblvMQKPxmo7DtJ5IsWxjRG8BDh8lCsQ0KqIapZw5cQDR+IoVTA1D
         y0J2NwRDslLMuqljw2wwPjo6b3M1SKUm0SU1V3D3buoYPLZa93DP1i1q8/E+CO/F2U7t
         Cuow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=X4xVXeduiKApS5jdl9z3vg0p3yiRh7xu17Yg0fxqzdw=;
        b=6EI1smGCICsOi1jYMhc43Znjc5UgGwF1SK1eHhExZRLLOgBe2vT39/aZAOqUFVQkdK
         4rliAgKPMD82IXk0vkpLjs8AZ8pKrwuuQ9JAJ91GfPp5rHtfiimbX6c9XiDReWCWkzbk
         i+2AUACnOTORs2IbDWzE6vMDAtQeMiwxiowlUrz1CWkdwoEdUZwb8djDRRMiA/7WCsFV
         moS3uHXfFa0rA4EoN7vwtk4prbejO+iOg61G4REPSkCvsMoUAJiFoBlav/Q35NDaBA+G
         MzBiOhW5e0LuIhbmiMN2WYsAZYgWIT7QBZZnGnbELSI8CfIjuaTQfz4KQ2tfy3A0GU28
         tyNw==
X-Gm-Message-State: AOAM530R6xDlRPNBL5654RsSiz541XeMmAzz99govyxcKWK77baWO/Pq
	v7DNqJ3kkEtHQNkCRMzEoCIafMHA2gxHpQ==
X-Google-Smtp-Source: 
 ABdhPJzoUPVEMtx+opS5gpEI6j5OGH7dTyN+ScD5b5BwGD9cPHuBpzWZcF3+6p2WLBSZbpHC5vvvNg==
X-Received: by 2002:a17:902:f693:b0:14f:da72:3acc with SMTP id
 l19-20020a170902f69300b0014fda723accmr5075330plg.15.1645557446210;
        Tue, 22 Feb 2022 11:17:26 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:d208:bddf:2b06:2b5a])
        by smtp.gmail.com with ESMTPSA id
 z13sm18402700pfe.20.2022.02.22.11.17.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 11:17:25 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 14/32] python3-py: inherit setuptools_build_meta
Date: Tue, 22 Feb 2022 11:16:40 -0800
Message-Id: 
 <90f1068451fccbfc805d652eb971ea3abd12a8e7.1645557032.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1645557032.git.tim.orling@konsulko.com>
References: <cover.1645557032.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 19:17:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162205

Upstreama provides a pyproject.toml which declares the
setuptools.build_meta backend for PEP-517 packaging.

[YOCTO #14638]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/recipes-devtools/python/python3-py_1.11.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-py_1.11.0.bb b/meta/recipes-devtools/python/python3-py_1.11.0.bb
index f8be3935e5e..02027248f46 100644
--- a/meta/recipes-devtools/python/python3-py_1.11.0.bb
+++ b/meta/recipes-devtools/python/python3-py_1.11.0.bb
@@ -7,7 +7,7 @@ SRC_URI[sha256sum] = "51c75c4126074b472f746a24399ad32f6053d1b34b68d2fa41e558e6f4
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 
-inherit pypi setuptools3
+inherit pypi setuptools_build_meta
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.30.2


