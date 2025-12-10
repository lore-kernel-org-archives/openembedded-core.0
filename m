Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5417AD3C52A
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 11:04:02 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12953.1765364627000928640
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Dec 2025 03:03:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=klPXJZ2P;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.208.47, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6416133c627so992709a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 03:03:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1765364625; x=1765969425; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jiewv3/B0zapvNESDnSHjR+8ubx7oGCJeDzSJwQBYYE=;
        b=klPXJZ2PVaLvGasmvGJFfyDZvZqBmqEbfRyRsFOEdqyMKQEhBejweuCzVOWPFa+PzT
         IE/N72BqV/wMOAzlAeT8CSr8VDDNhRDDpYzC091sJmdWgZSG6xr9SAEx7ZqFacNGV8tP
         Z+m40MlA/tMOv3qeMeUUsoKz+57KsfUlhaZ9Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765364625; x=1765969425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jiewv3/B0zapvNESDnSHjR+8ubx7oGCJeDzSJwQBYYE=;
        b=eSUhk+Cpygl0DIAU9a4oZEHOacpx9KKeXdP4Ug3Nn4o/zEsVdxFaNCmPGYJQjEghV0
         Of+Wv3gwp6YFSo5cluvfg6Ui7USAhkS9usmcnC5pdH6YZpBFrPMCRPPt6AGkk6G9XRFH
         Cc2V4SSupacf/L956N667AfvWZorrc9q8y31oisaYWnYnXUmoBXzCkBv/Ryk6tlVUa7Y
         CR0g8D3h/aD1MX0dODBPckMMg5U+LerZI8jH7F8L/Py6OnlKHbMAN1N9YR/hwQJSdvAv
         RuQrXHgPZfYeAHr05mKN9WSjKRCePOewsFVkJlZMovPiR/pcQbsEMgnFeDjQxMoJMfzj
         xVtQ==
X-Gm-Message-State: AOJu0YyZ3pyfNkMr3dooV5U/EHIx21VYa9aaeFmHj0P12sURR0tyvHWp
	9O1yA4KB5J0rNO0XtrkycuJMztAXa0C9KClKXmv/KG0DKU+Eiwyw5brNIKO7+kLs1HjYngEK+CX
	9oVWC
X-Gm-Gg: AY/fxX6bOMbjmyG7MpfHuMdzzGV2Vr1ZwLqAKlc+kiP0hoNpyQdNoEvBVxex7y2dQKf
	fy0DYwJfYjMOt2ftD6hihaOaQp7c+gJwS5UCorlDQ229c54R4qvKKSl+704bqe/6iPjuz0NmyAk
	miEDx/4FzODn/5q1Ptua8bM0oQjF6E6OoKnz5nDpluaaMSAMUg9+cI4uS3v+VBUUhjHX5zkR8iV
	E806SE/j8gj/XY+NACydY3ivQWRlmvgRJLI+f0oGlBvCZee3LBUajqNnkGpMRjPjYjXgk7OMSEl
	dWuywS9DEuVqh5ITidj7FAiRVy3y1eb3jEXS+a4MnnVk9RJBCUsLWroRrReAiGwDUhqLuV7kWbi
	L8TfsVRa4+JXGbfhDJEvlsZwdFHtWmCw5UpL0pmKDjbvRH6wFuqq+xRX/lrLeJ9+XjCQp+OJigD
	eHgVb5KXsNgEnVnhuzw7Bb3NuALobBqOPkQXOZvqf2kB2a+6FHfxp/FlGuLO2EW35/328g01K3N
	DA2PuCCDGUkP4RUIzGgf2NIaBCLNOmpyC28p2Y+PTi4rQ7bkRMN
X-Google-Smtp-Source: AGHT+IE48LK24t+roQroHtnJMyP59XwdSmQkP17pwda9xEADVFof9vH6PkkQ4XdCRB05EmOGkUgqWg==
X-Received: by 2002:a05:6402:518b:b0:643:4e9c:d17c with SMTP id 4fb4d7f45d1cf-6496c9cde43mr1218336a12.0.1765364625329;
        Wed, 10 Dec 2025 03:03:45 -0800 (PST)
Received: from adam.arnhem.chello.nl (2001-1c00-8101-1200-3ddc-5bb8-0efa-16f1.cable.dynamic.v6.ziggo.nl. [2001:1c00:8101:1200:3ddc:5bb8:efa:16f1])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647b2ec31a7sm16227636a12.2.2025.12.10.03.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 03:03:44 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH 4/5] librepo: add PACKAGECONFIG[sequoia]
Date: Wed, 10 Dec 2025 12:03:39 +0100
Message-ID: <20251210110340.3631065-4-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251210110340.3631065-1-adam.duskett@amarulasolutions.com>
References: <20251210110340.3631065-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 11:04:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227469

Currently, librepo compiled iwth -DUSE_GPGME=ON (the default setting)
causes dnf5 to fail importing repository keys. A very long writeup
of the issue is linked below. [1]

Add a new PACKAGECONFIG[sequoia] optn which sets -DUSE_GPGME=OFF
and adds rpm and rpm-sequoia to the dependency list which ensures
dnf5 works with repository signing.

1: https://github.com/rpm-software-management/dnf5/issues/2539

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 meta/recipes-devtools/librepo/librepo_1.20.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/librepo/librepo_1.20.0.bb b/meta/recipes-devtools/librepo/librepo_1.20.0.bb
index 6557dda43a..7a2e9e6b9b 100644
--- a/meta/recipes-devtools/librepo/librepo_1.20.0.bb
+++ b/meta/recipes-devtools/librepo/librepo_1.20.0.bb
@@ -15,6 +15,8 @@ DEPENDS = "curl glib-2.0 openssl attr gpgme libxml2"
 
 inherit cmake setuptools3-base pkgconfig
 
+PACKAGECONFIG[sequoia] = "-DUSE_GPGME=OFF,-DUSE_GPGME=ON,rpm rpm-sequoia"
+
 EXTRA_OECMAKE = " \
     -DPYTHON_INSTALL_DIR=${PYTHON_SITEPACKAGES_DIR} \
     -DPYTHON_DESIRED=3 \
-- 
2.52.0


