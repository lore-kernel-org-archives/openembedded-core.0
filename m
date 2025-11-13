Return-Path: <corentin.guillevic@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E786CD8CBD
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 18:12:19 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.648.1763057532841601246
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Nov 2025 10:12:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=BBwFBIHd;
 spf=pass (domain: smile.fr, ip: 209.85.208.178, mailfrom: corentin.guillevic@smile.fr)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-37a2dcc52aeso9838271fa.0
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Nov 2025 10:12:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1763057531; x=1763662331; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o2rGx/BiaO0xDahFe43paB74yHkGHzHB+GY+2kLWx64=;
        b=BBwFBIHdG3fyMdNnrTb6qGYXL+8wEwOWcXRueMsXIK4Hi4JsFqOkH4+uJX6P1eT03m
         mDF+73dUgESfOsDHxUDU4z8erSu3eNifcbkry73vdOGDPMgqQ7sdaeqeXXRDdg7iyTDz
         Xx1l1rP/6lzn1wtmFDplT2RgpNpasEpW8N47s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763057531; x=1763662331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o2rGx/BiaO0xDahFe43paB74yHkGHzHB+GY+2kLWx64=;
        b=pdDMjVFrNK/zsTieZtTaUcpjsa3BzxM3++7NGOxe6qf1YvjcTvNYxJtJlYDP9EIGAX
         PRnZJLHOjZ7+HaJBeEsNc4RwpcTKNoKsIVIu2kkkr0/StM5R1r7SKziBhaV7QjAE8Hew
         4uKqXZ1agY8Aiubww1EOUVkqiP51t7MsQ/WmmmndQWhDdvvFvHFFBp3Xn0UoXvUK6N27
         L2urRv1Hlg4HGs4lg5d35sPlpGc68bX6NcALWVK1s9E5gilwwIYfvoGC3v071Ny3koIi
         D8G1+rCxxUqe7hfh428Afzq3v5AduGv1+S2Qykdf4YAdKGaoNVoVKCgm9t2GaSKI4/6C
         s/dg==
X-Gm-Message-State: AOJu0YyTj5MxAee6Xw5uF1NuHzbsgy9CT/xUqH13nUxYwVkpq7LwwI24
	UHrB2gnakahluybpadSrMSjAlHjfoS4VRmGXWr6qD23TyohMV7UtlDscq4D4eckZ+W7Lmes5XTN
	6xwz4Ib9Elg==
X-Gm-Gg: ASbGncvEu/0Lek6dljBYYnArJdEAKx+aVVhdRRI8MODc4eMBVJY1jNisapmBt4cQeN+
	zdLW9I8caQzd37dAgcBRTDcxFqhBuEaCDupg5/HcR2WGhXcs+OKZNTIVaeaBab22/+hX/C9MTL7
	GdiyF7fKodZfrzRqOfIFuJ2nGmCoe2e9iRKSNO3Ye+3/+LWrHVOA+aeO6yqaBCOfX6rXt1OOscN
	WAiX4I9VrTHjxMG2smipUzKjUZbn1DEiYYS1maw9+gmyu8Cul6iJqpk+fRJLhmZMEBZuaWuVirZ
	Z7B+tm4CZ62vIc/5WY2pB5meT9Gcz/ZDbiVXrMbx0/7/mUnhw9Hafy2H6WW9kgY7dhvZ3GhBoac
	487pBKdofTUI333d1SLHfxjtwtrCqi3xsJzgeaQ4E1htyVQnhonokElCEpxin7/qhSC/sL6rUkK
	jN6S2Hdt2RcHjeYDo+Pk4p
X-Google-Smtp-Source: AGHT+IFIWLSIidtJNBFopOdIYKW5eHOC4qNZ+mkJuuYG+NQqrS3M+WgJ9l09sTbK4GyIHwcTT6Om1Q==
X-Received: by 2002:a05:6512:23a2:b0:592:f4e8:71fe with SMTP id 2adb3069b0e04-5958419e93dmr147523e87.9.1763057530790;
        Thu, 13 Nov 2025 10:12:10 -0800 (PST)
Received: from heaven.lan ([2001:861:3080:b0f0:8ab:bf5a:da73:c932])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595803acc1asm543232e87.13.2025.11.13.10.12.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 10:12:10 -0800 (PST)
From: Corentin Guillevic <corentin.guillevic@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Corentin Guillevic <corentin.guillevic@smile.fr>
Subject: [PATCH 2/2] layer.conf: enable test for revision alongside a git URI
Date: Thu, 13 Nov 2025 19:11:57 +0100
Message-ID: <20251113181157.410053-2-corentin.guillevic@smile.fr>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251113181157.410053-1-corentin.guillevic@smile.fr>
References: <20251113181157.410053-1-corentin.guillevic@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Nov 2025 18:12:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226256

As meta is the main layer, its recipes should fully comply with revisions
for git URIs. Enable the check for this layer only.

Signed-off-by: Corentin Guillevic <corentin.guillevic@smile.fr>
---
 meta/conf/layer.conf | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index ba25ca3029..1f95867165 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -19,6 +19,9 @@ BBLAYERS_LAYERINDEX_NAME_core = "openembedded-core"
 # Set a variable to get to the top of the metadata location
 COREBASE = '${@os.path.normpath("${LAYERDIR}/../")}'
 
+# Raise an error if no revision is provided with a git URI
+ERROR_QA:append:layer-core = " missing-srcrev"
+
 # opkg-utils is for update-alternatives :(
 SIGGEN_EXCLUDERECIPES_ABISAFE += " \
   sysvinit-inittab \
-- 
2.49.0


