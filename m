Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD53ED59D99
	for <webhook@archiver.kernel.org>; Mon, 15 Dec 2025 10:05:13 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45214.1765793106995631268
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Dec 2025 02:05:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=W9dScrHA;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.218.44, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b79f698aa91so58513866b.1
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Dec 2025 02:05:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1765793105; x=1766397905; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9rakWXif7/2W2aWvX2S8sH08Hq00+0jnjL6Ub+zmcJQ=;
        b=W9dScrHAHmzMNqI40iI3lnNfKT7heI8iS/P6vqyOmXEs860U8lQeKhQJVrjyyHWL9M
         aqNFU+qooH1v3xf1/8dqD6Lyk4Qc5VAlGj8M+2e2Pqw/uMxG+QGzb74oQkRLin9dZeWl
         +13wLv3Ri+ug7FtJZFTpa5xfkPsz9DlQK15Pc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765793105; x=1766397905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9rakWXif7/2W2aWvX2S8sH08Hq00+0jnjL6Ub+zmcJQ=;
        b=oryImQ/COykoHujs5cWplh5xr3ZcZATvrPVjUFB/BMJho+aGN4aS+b/CTTUHz/s9ry
         LH30QYnruZoTz/NWPHXmJ1tV4WZ80xyj0hLwoVFd4hfARx7SvZzj0tGp8Fw08gTR6L9R
         NoLoTuEd4lciO6sDsJnDMsw7hKuMpAEU3C+U3jMrHyUaISANq4+2aq01TO52tkZdHa7M
         4K3fyQc87nbCElk72TrBwavidKrXOBHhJCzlrYe6zF/sTZtmWfVsmsDIyZw+ulERW10m
         66VUEYjt8pFSEA5OafpKXySIYhHwj9c1heBW8E1VFWXXoqswsOKXfDLCq7DbmPH9sqh+
         NT/A==
X-Gm-Message-State: AOJu0YxT+9bI0oR6kzd+M8hmF9zFd+Xd0msTRaZVWiaRMgYs44Nei/52
	lI9SbAX4SSHnvcKZCi9JTdibTEJSYE35Z0zAixAmqH4jHG4UpwuWtNeErSMWa5K6IIP9M26sO3V
	VHkD8
X-Gm-Gg: AY/fxX50tAxw3ijEapwfG6YgqQB8byzKgr+ghOvrGuPzc0462xeKj7LWV8g4cK6AH6P
	NaP2uIFTbN378E1VR1R0BA21qN+N7PRYGuKgmjUQohizHcfi8JYbiMsxjmez6w4LlM/pryoenaX
	GG125kuZwZBkQpiJdhRgYHPlaeKIbJm7zJgx+7yVT4uq16TuHoIoQ6w+bHmtKs7xhUD8R+pEayQ
	7KWCuMmcWdR267aZ6S7uYi3BUU4dZ44VrdHYtAqEBcNteItwxmrGCbACYuI2CAanHxTm2wsq9YQ
	UwvdKzFDP9vIJjkNCMDNBx3gUuIwQ0ivujIpLDj072NE5N+zis9SuwlZyZNSDnLgm8mWemQx02y
	UV/dibPnqG6cpFNX9CB378xlb51ce51lduGSrFG8m2k8m375vwVYNy2W5YWLV6/rGyxpTnxCb2s
	DX4NqKlvNB+GyLlqqu0qsRRQAeRZ1x/YeYcyZhPc6Z8ROFAO6jT/qZoA4afuTz0QMiIJE/3Vjxo
	fpwkiaFPSfhOcTVotFyg+04nyNpNsXURA8xvE6oeS9XZsr4UisGTvo3Nw==
X-Google-Smtp-Source: AGHT+IHw0dSZ+wvqxyjv1lyfVKlDMHhQ1oVZYRyzw5oDwH5cqdQ8DCcM948mzlXQHLu96hN/8v986w==
X-Received: by 2002:a17:907:94c6:b0:b76:3d45:51d9 with SMTP id a640c23a62f3a-b7d2320d0demr601998266b.0.1765793105208;
        Mon, 15 Dec 2025 02:05:05 -0800 (PST)
Received: from adam.amarulasolutions.com (2001-1c00-8101-1200-3ddc-5bb8-0efa-16f1.cable.dynamic.v6.ziggo.nl. [2001:1c00:8101:1200:3ddc:5bb8:efa:16f1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa57192bsm1336898366b.53.2025.12.15.02.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 02:05:04 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH v3 5/6] librepo: add PACKAGECONFIG[sequoia]
Date: Mon, 15 Dec 2025 11:04:59 +0100
Message-ID: <20251215100500.1626964-5-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251215100500.1626964-1-adam.duskett@amarulasolutions.com>
References: <20251215100500.1626964-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Dec 2025 10:05:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227710

Currently, librepo compiled with -DUSE_GPGME=ON (the default setting)
causes dnf5 to fail importing repository keys. A very long writeup
of the issue is linked below. [1]

Add a new PACKAGECONFIG[sequoia] option which sets -DUSE_GPGME=OFF
and adds rpm and rpm-sequoia to the dependency list which ensures
dnf5 works with repository signing.

1: https://github.com/rpm-software-management/dnf5/issues/2539

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
v1 -> v2: Clean up several typos in the commit message

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


