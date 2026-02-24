Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 089FCF357CB
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 14:33:02 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21658.1771943571906065990
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 06:32:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=s/dRorDf;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48379a42f76so43225315e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 06:32:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771943570; x=1772548370; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0zqNHUZzv/Kol/MGaN7B3wIWpuJ6Ad/vvMW3D5pIvuM=;
        b=s/dRorDfgnpJAs94Giq4Df/9nyxgQsb5npA3YFCOgo5phFjlpDhA5GVsoy46GVunWQ
         WG/z7EyxK/mkkmvesb05DV4LxCv0tZhRHv+Bi8Rw4Nsn2/VvEB9+hakswcnLM53cuYSS
         wgilnN2d0ojgRJjcihWg6hmBu9AJV8i3dy+6w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771943570; x=1772548370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0zqNHUZzv/Kol/MGaN7B3wIWpuJ6Ad/vvMW3D5pIvuM=;
        b=wtcOh7Pwa439DyyVXFYq4cU9ShSN664fGTjMrqJTL6Sw4+KUioSBVTyLe/mrcGpwg3
         kptYldT3MtAj7bZChLeBW+x88bAvDo+R5PUvQdQEdWBT6ueuUqBDu4SgMowee5B7S9Eq
         n997vZe6O/pZqmPpf9KtUMflQGkwzf5j05CXaAE+js+eON3yStb+mje8K8XGFWjlME1+
         ByJLizqLg1jMlrl4QFpYmgRsS0+1dZbUxMEtLNg9vlU7I4s1pj3/yPmrmvI0U5pssGY+
         Qst9Xi2HxAHsmD+UX/UJEhlfEPiA+T5kSOip5Xmqr2gfCAn0jzrMMLJp7MhZxOeZwuLg
         59tg==
X-Gm-Message-State: AOJu0YwGbBf6F68xpDIQGiGte0sUXJVsLhoAVGyqtD+g7ruJO4bOwbrN
	MqescXoWWzfNySsylEp/+vmo8+IArupF4CfQSArf5L7AEYY8FzRP2YMtpvH26F/89c2s4KVh9ml
	9hZdg
X-Gm-Gg: AZuq6aIfT2GHZznTu79tYK/JcVXQrmQTwbvNc3qUlhHNVhnX8i0jrEtkgGxNUcrRVOy
	dpRvS44EiPcjIoHFyIdEwmYHqkcuVjkhrFCF7sCPEzNxcMvHiZd7NYaEuw4yMurK0FVm/zApmaR
	jbwd7rgxFtGX2cS+5FZtmifg6IzlOmCl60J3VGfHJqYmwQWd3RI1pUS5kJ4kllgMe14684oWeZN
	yz4o4vVodr2TpDu3BmWBMTgrNoth4SbYbgIAaEcOQIE86nB5ePGUM/vdfuwHzbnt2Rnx5LRBJUm
	/fr3Ol318PIlNcrGE9bMFGNHN4DDfMqXWiqFpNd9bekAjFKOtmWLzfyE3fov1wmTAVMl85UhYDi
	KRMy3eI32CozT9yEVQkn3vf3TCKthRDX9M8Wct2KPbZ6bK35gKmjhL+o8vVe3dFCvG1HsxtMgr4
	VagNJDA3ybcfct/0k3+s0Mt5xgfF0vGqDvOA2KI+UvlxW7QKGgWzVL3gJbSPzZYjNzvbjw/SsBS
	3OxjgBIyInQ0PfVWkniQQGaR+ilLnR3dw==
X-Received: by 2002:a05:600c:5287:b0:47e:e807:a05a with SMTP id 5b1f17b1804b1-483a963c238mr201243525e9.33.1771943570067;
        Tue, 24 Feb 2026 06:32:50 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483b88f950esm19819895e9.15.2026.02.24.06.32.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 06:32:49 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 07/44] mobile-broadband-provider-info: upgrade 20240407 -> 20251101
Date: Tue, 24 Feb 2026 15:31:35 +0100
Message-ID: <da1ca9840be58ad0f206b4064c1d70061d6b49e6.1771943404.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771943404.git.yoann.congal@smile.fr>
References: <cover.1771943404.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 14:33:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231812

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://gitlab.gnome.org/GNOME/mobile-broadband-provider-info/-/blob/20251101/NEWS?ref_type=tags

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
[YC: commit 99e2dea3d4328f2aaa6e6e29f5bf4aa38b64b274 upstream]
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../mobile-broadband-provider-info_git.bb                     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
index 06ded459344..9e7dd9da76b 100644
--- a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
+++ b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
@@ -5,8 +5,8 @@ SECTION = "network"
 LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=87964579b2a8ece4bc6744d2dc9a8b04"
 
-SRCREV = "55ba955d53305df96123534488fd160ea882b4dd"
-PV = "20240407"
+SRCREV = "18cb97517d9c831e1d2ec057e62d04fd3665e10f"
+PV = "20251101"
 PE = "1"
 
 SRC_URI = "git://gitlab.gnome.org/GNOME/mobile-broadband-provider-info.git;protocol=https;branch=main"

