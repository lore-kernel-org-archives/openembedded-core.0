Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB18AC47073
	for <webhook@archiver.kernel.org>; Fri,  5 Jan 2024 02:37:22 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.15481.1704422240193717883
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jan 2024 18:37:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hocWSQ0m;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: festevam@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1d4c77effe9so1458935ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jan 2024 18:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704422239; x=1705027039; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gLqjoPcY/Yi+CTbvvXfKdAOfVU6wnn9Lz+nOOpJ+C50=;
        b=hocWSQ0mULKGhqTslgKKMVvOTPQGJgRGkW2rN0w1jKhsVgJFIoc9dUB++zH8XmCodN
         D+STrxTokj46oy8++flWPnMYAALn4hvBph4QI5UrP0OoZRXHnFzYmZSVNLhmZ7G9QhJt
         2qhJfQrF1F0deTazv3IHhmXhejZXph280ZIeFIodshf3w0PouE8wmBHaVZeIa/6ywRU5
         E4bImCol137wIieOQ+PjIcwAywORXWYv50wFVduMkavCMkeabrb0S9Uav54Xl6cIQc8e
         EJtzcRsD/DFAnbGkzel7aJ6hPMZBeOFu0yaJ0sjq8MA69dommuuqqdsffS40Tqo/nqCV
         K8hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704422239; x=1705027039;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gLqjoPcY/Yi+CTbvvXfKdAOfVU6wnn9Lz+nOOpJ+C50=;
        b=T2SWthNv7w4ghkVupHzg4Xs+/s32teZFm1jx0m7x3dOJJNOyr+itQmVzG/YGLm2+v0
         zCR6FFfZyNsYxWmKrn5vW+5Kbazd9FqyQPUsp4Ux3SgNlCT54ASQOgHiRfJdY0uWMFNt
         TrVSj5to/G+2wdpYWKy1NSdXlO50nE/RQCZjAEP8EVxDfMuIRbX/ndXXom3zrXNuEMrt
         S0HYHgiax7AiJ2SJwYDa9tJSIev1xLqLpNV4uXtCuH8TaG7GerCTANYXtuaV1OJe76Sy
         EvpUNUmi+gZCft+dpj3I6EsOl+Z1zLP+rG6DqeD2D22XIHk1cadZxfYeUZ8C41k6pB/m
         nDJw==
X-Gm-Message-State: AOJu0YzkLqN5NkSI2JYeMkRM02YU1MEJ+KufMhTDLA1oEdZQdNG/IZiJ
	FZ/RlDLBk1Z1rkilpNJSxCtu5ys0134=
X-Google-Smtp-Source: AGHT+IHoO6Y4jO1E9/PufHaezQcns2WqlElmge58g5fr8GzWOqbemHe/t30FnsN66ypcgkTKv7O8uw==
X-Received: by 2002:a05:6a00:2e23:b0:6da:838f:b004 with SMTP id fc35-20020a056a002e2300b006da838fb004mr2977019pfb.1.1704422239228;
        Thu, 04 Jan 2024 18:37:19 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:6dda:5a0d:233e:f49a])
        by smtp.gmail.com with ESMTPSA id w22-20020a63c116000000b005ccf10e73b8sm355890pgf.91.2024.01.04.18.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jan 2024 18:37:18 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: anuj.mittal@intel.com,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH] libusb1: Do not match on -rc versions
Date: Thu,  4 Jan 2024 23:36:55 -0300
Message-Id: <20240105023655.2135358-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jan 2024 02:37:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193338

From: Fabio Estevam <festevam@denx.de>

Currently, the upstream check gives incorrect results:

$ devtool latest-version libusb1
...
INFO: Current version: 1.0.26
INFO: Latest version: 1.0.27

There is no 1.0.27 release yet, only 1.0.27-rc1.

Anuj Mittal has submitted the fix in v2:
https://lists.openembedded.org/g/openembedded-core/message/192683

but the original version was applied instead.

Fix it by passing "$" to make an exact match on the version.

With this change applied, devtool reports the correct
latest version:

INFO: Current version: 1.0.26
INFO: Latest version: 1.0.26

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 meta/recipes-support/libusb/libusb1_1.0.26.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libusb/libusb1_1.0.26.bb b/meta/recipes-support/libusb/libusb1_1.0.26.bb
index 1b93a80f3e..2af6fcdea7 100644
--- a/meta/recipes-support/libusb/libusb1_1.0.26.bb
+++ b/meta/recipes-support/libusb/libusb1_1.0.26.bb
@@ -16,7 +16,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/libusb-${PV}.tar.bz2 \
           "
 
 GITHUB_BASE_URI = "https://github.com/libusb/libusb/releases"
-UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)"
+UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
 
 SRC_URI[sha256sum] = "12ce7a61fc9854d1d2a1ffe095f7b5fac19ddba095c259e6067a46500381b5a5"
 
-- 
2.37.3


