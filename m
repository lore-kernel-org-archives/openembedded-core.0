Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2DDDC369C2
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 14:27:14 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.13852.1745497706702891291
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Apr 2025 05:28:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=mRfbEGoK;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: ines.kchelfi@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso8230365e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 05:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1745497705; x=1746102505; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NAP59XRqXJaM4vIQSNGv760fYFd3TZ1Oq8Ubl70jdxY=;
        b=mRfbEGoKjDToUTgeqltlfQdR53jio53QVF37QXS3SypNoTP3QlcPr3shVKs4nNi99K
         K6nc7VMI8u7VPu0HJ7Hm9Vh/3sUPZLK6/Emz7lTcuWb7lLJLFdBrASDgrTOV/ZGMgbkY
         pxicaJtEdEv2TK2yYF9Dl00GK6PD53TNKJNK0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745497705; x=1746102505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NAP59XRqXJaM4vIQSNGv760fYFd3TZ1Oq8Ubl70jdxY=;
        b=H0UuXIi8Gpi50P5ZI59hHmvXd3kvRtlc/9ztTgyEAwQ5UjGdQv0Vya50RDtGwDcenh
         6Q1qEBkvgyg390Bka4OXDXdD6OkKrSktYenhNBTs6QAIgH+pRq6AsPT7jna1MhePrwRT
         zP3hZc3GAHjmVQzoexI1hAMDCOwnURHSiG28gOuhz+VQCIXQKDwGIbWv8EcjT/KkXd3U
         /vA96HTdKQ0Bsf4t+IjESgO0zJFZufblyfBV04rwPt15kZw+F/9cHr15ASVNjS9KZkV+
         iBPhdEMKE/OfFokLpRfzmwHsxKZcdGAVYpYB5imiXI2YgpK170MlryaIh59P11zcr1S+
         Uq0A==
X-Gm-Message-State: AOJu0Yx2dBWHmDl2AmK+gzsqtWMf4JvztgOx6/FpCxFAmo6xlyL6vq0K
	oUyfUQCNm3ZjQs6WHbzLQRhlLjS1xCLIQQWStIypctypkl4qoeU7qNfp77R/wob27Dv/+Mvfsrv
	Q
X-Gm-Gg: ASbGncu1rcYixQVYCIgHNSpw6AxjuzzGujlox9uQ6YqiRU/XCpKgsfC3bQdCp9hTizo
	cPinmeLF7p8qwmg8DqV+6srF3UHibnuwDRXTiQ0WmzTBqdCxnF8ibwTDO9Z3pgxOtuo9F3tlp51
	OV1Yq2gPHOdmXdeQkBwWw3hFVWU/SGlOe+XcO25cQBq8sqOPTvE2EGdQ5L/rX39VRo2Mm7GF9jr
	akLgkLzCXIkf/vUYvsBxMHTTEUQ/hlP0Gq07rU5+8Asrk2DFJNLEdKh/ndqQuvU8+A5fI6a4XT5
	BPFn0CAFewvjRfsmP4rlWNbaWE4lkLhzTy6r2kfwSYWUbsO0ZIxUeRGN+TI9zaHDLqUioS1b80h
	V/IouuvKC11TdB1ZoRSx8qMYgrSRNVjpOXVUNUbLt+V62iBo=
X-Google-Smtp-Source: AGHT+IEgu0u1DXuCjUxlTdroPiayx1Zal12qFSnd3xtARFCbsQ1RtvsrkHJgWX0QslryfiGcRA6wAA==
X-Received: by 2002:a05:600c:3553:b0:43c:f5fe:5c26 with SMTP id 5b1f17b1804b1-4409bcfc73bmr19212695e9.4.1745497705113;
        Thu, 24 Apr 2025 05:28:25 -0700 (PDT)
Received: from FRSMI24-WIZAR.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d29bfa6sm19546445e9.3.2025.04.24.05.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 05:28:24 -0700 (PDT)
From: ines.kchelfi@smile.fr
To: openembedded-core@lists.openembedded.org
Cc: Ines KCHELFI <ines.kchelfi@smile.fr>
Subject: [PATCH 2/2] Add meta-stage-rust layer
Date: Thu, 24 Apr 2025 14:28:14 +0200
Message-ID: <20250424122815.884740-2-ines.kchelfi@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250424122815.884740-1-ines.kchelfi@smile.fr>
References: <20250424122815.884740-1-ines.kchelfi@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 14:27:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215375

From: Ines KCHELFI <ines.kchelfi@smile.fr>

---
 qemux86-64-master-menu.json | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/qemux86-64-master-menu.json b/qemux86-64-master-menu.json
index 4656462..0128c85 100644
--- a/qemux86-64-master-menu.json
+++ b/qemux86-64-master-menu.json
@@ -5,7 +5,8 @@
 		{ "url": "ssh://git@git.smile.fr/contribution-yocto/yocto-docs", "branch": "upstream/master", "dir":"poky/documentation"},
 		{ "url": "ssh://git@git.smile.fr/contribution-yocto/meta-yocto", "branch": "upstream/master", "dir":"meta-yocto"},
 		{ "url": "ssh://git@git.smile.fr/contribution-yocto/meta-smile", "branch": "main", "dir":"meta-smile"},
-		{ "url": "ssh://git@git.smile.fr/contribution-yocto/meta-openembedded", "branch": "upstream/master", "dir":"meta-openembedded"}
+		{ "url": "ssh://git@git.smile.fr/contribution-yocto/meta-openembedded", "branch": "upstream/master", "dir":"meta-openembedded"},
+		{ "url": "ssh://git@git.smile.fr/stage-ecs-2025-yocto-rust/meta-stage-rust", "branch": "main", "dir":"meta-stage-rust"}
 	],
 
 	"layers" : [
@@ -13,7 +14,8 @@
 		"meta-yocto/meta-poky",
 		"meta-yocto/meta-yocto-bsp",
 		"meta-smile/meta-test",
-		"meta-openembedded/meta-oe"
+		"meta-openembedded/meta-oe",
+		"meta-stage-rust/meta-stage-rust"
 	],
 
 	"override_distro": {
@@ -37,7 +39,8 @@
 			"local.conf": [
 				"MACHINE               = 'qemux86-64'",
 				"IMAGE_FSTYPES        += 'wic.bz2 wic.bmap'",
-				"EXTRA_IMAGE_FEATURES += 'allow-empty-password empty-root-password allow-root-login'"
+				"EXTRA_IMAGE_FEATURES += 'allow-empty-password empty-root-password allow-root-login'",
+				"CORE_IMAGE_EXTRA_INSTALL ='hellocargo'"
 			]
 		}
 	}
-- 
2.43.0


