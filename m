Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9165C982EA
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 09:11:33 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2912.1790154687178689165
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 02:11:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Mx7IhXvM;
 spf=pass (domain: smile.fr, ip: 74.125.225.141, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49cd4ba9f68so7452325e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 02:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790154685; x=1790759485; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ekfPxoRAjm/kidNkpnyOGVPU7xwLNbjhK0xD/orRBTQ=;
        b=Mx7IhXvMjWpnKKnhUF/07zFcHhsjmv6L+uztzsvYncwcwHG11BiLLjZzc0z7Zs8riO
         g3LFb+AnW7OlRCMdJDTZjWty6Ofhx0lpRGTWGasESJWprFg7Ep1hLwdkuMtiZ7QbvU2W
         4IdT117Okte3oUPTk8Pml6a4ntu4CZRbzjdtg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790154685; x=1790759485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ekfPxoRAjm/kidNkpnyOGVPU7xwLNbjhK0xD/orRBTQ=;
        b=TiSwLPcinsFrbcKCc+ywNQJTwYI78H1lXkLO2xu9WIBAronFyv6vsimaIg+u+J6qNV
         eGDrgT1X6000zdf4L49eFplzvgT7PIpDwwE6eZNreRcSPbNX8ndaRf0+BpVpk5RioK7b
         SYBxKdKz3ldWtEIAwAdb9Hs3WIFEzEHoj2QYr6RabhwnyBDujf5NLFpcV59lMagrikkH
         gIltMQL2t6tx1Lb9rEXicBCgflvgG/+nUD8lwujHzNW8eiWZiYL23zWbJTNGCJHwvX8M
         Bu/FskwekYof1L01i07FWZ7VxUqYXDwuQd+ZCiMKsGKrrpg+jrAyyMhXZG8iaR0zvvdN
         ViTg==
X-Gm-Message-State: AFuF++mdgGcEvCMG/p5BLXv5F4btHUsqojJb/k7qXbu15wY3YtqjCdeI
	gHoajBG5Jg52ULg6QXtBvuMnk3kl/xx0u5A9WTFp2tXzoOBK8pl4uS//1GFcVMOXVPekC5CAJMW
	+S19hBdI=
X-Gm-Gg: AYBFou2MdrvwpMio88BdMu3b1XfZeJG9+LLWhd2wWwi0MAQrT3ihPJYVJP1gwWPPM7D
	/xr8Fg/OZwMgRalcnX2My56/h4z6VgPmx7PQs6VQhLZGakqyUKggX971ufb8ivtLVtDfhx4IulQ
	Z+YA9Bdi/KZwuw/6Tv2sSuGLR1NQYhrhlLVZcdQzbZX4DFESRuwut1XKmuXurPEdP8sf/N73ftm
	UqgEiT1D2t/6r3LERCCIF+hHCb0S4dB53F84G+ifarGIMGdJYlni5QTQbDwkVbvzUQZNYeV+nx7
	+fH3SRUIYu3UFyyvlSYZloEt7XCGq5YV2O8oQkSDXdBKsP5ivDO23vtUIu2gkYjXU2BmzvAZPw3
	4TPYCEiN2zFb3W8BEwEh9DaMYC2fvdBea6GiqmojoYJ30qro6VoEuKHI/ExFX5+T3ddeCAS+HVL
	9hJOlL2/FLVJYDmGZHt1+URDbAK436zpkb5989C76KKGsXTeYCUzoICXeH5wlB5KssA5oIWuXjp
	fRkyR3RA9mTi1Vike5vB1qQoFZBh2kMcgqbuw0yvFosNzxfwqsoHoXjpB68qEwtM20I9O/s3w==
X-Received: by 2002:a05:600c:6297:b0:49c:fe46:7219 with SMTP id 5b1f17b1804b1-49fdf12ba37mr21874895e9.20.1790154685370;
        Wed, 23 Sep 2026 02:11:25 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a02-8440-b519-f416-8bed-8817-19fd-ccf7.rev.sfr.net. [2a02:8440:b519:f416:8bed:8817:19fd:ccf7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe2730da9sm14251525e9.4.2026.09.23.02.11.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 02:11:24 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 08/48] python3-mako: correct CVE_PRODUCT mapping
Date: Wed, 23 Sep 2026 11:10:10 +0200
Message-ID: <d419d38614ad7dae149e005ac6183c0290f54b2d.1790154074.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790154074.git.yoann.congal@smile.fr>
References: <cover.1790154074.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 09:11:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246470

From: Devansh Patel <devanshp@cisco.com>

The inherited "python:Mako" mapping is not used for the packaged Mako
source and causes its vulnerability records to be missed.

Use "makotemplates:mako" for its historical NVD configuration identity
and "sqlalchemy:mako" for the current NVD dictionary CPE, NVD
configuration, and CNA affected-data identity.

Backport note: this applies the metadata to Scarthgap Mako 1.3.2 rather
than master 1.4.1; the older release exposes applicable unpatched records.

Signed-off-by: Devansh Patel <devanshp@cisco.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 76fc2046d3f251af34dd04f8fdcfc0c1d6016380)
Signed-off-by: Devansh Patel <devanshp@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/python/python3-mako_1.3.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-mako_1.3.2.bb b/meta/recipes-devtools/python/python3-mako_1.3.2.bb
index 617bf33443c..21d37eab4eb 100644
--- a/meta/recipes-devtools/python/python3-mako_1.3.2.bb
+++ b/meta/recipes-devtools/python/python3-mako_1.3.2.bb
@@ -12,6 +12,8 @@ SRC_URI += "file://CVE-2026-41205.patch \
             "
 SRC_URI[sha256sum] = "2a0c8ad7f6274271b3bb7467dd37cf9cc6dab4bc19cb69a4ef10669402de698e"
 
+CVE_PRODUCT = "makotemplates:mako sqlalchemy:mako"
+
 RDEPENDS:${PN} = "python3-html \
                   python3-markupsafe \
                   python3-netclient \

