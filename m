Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85121FB3CF5
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 09:40:28 +0000 (UTC)
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47244.1774863623851864306
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Mar 2026 02:40:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=e+A75QDm;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.218.67, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ej1-f67.google.com with SMTP id a640c23a62f3a-b977165c465so63004466b.3
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2026 02:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1774863622; x=1775468422; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5OTFadSx1al3SvLzRroVqTL0u9S9NnA8rLSuZl+8sRM=;
        b=e+A75QDmWPCSAfnJSyLcDHrwwDz1UQj1MDJf2si39QB2bprb/7BJ4d+BlVltgoUo6p
         kEeHXOzhQnYExoW9T9osQl4zJbYAOZ6veAza5ZAH35fDaud06zxkwKyMIeQxkelSyu/x
         1agEv91+RT1oV19ZfeFRs/MskCg9R/Ir+6Vu0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774863622; x=1775468422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5OTFadSx1al3SvLzRroVqTL0u9S9NnA8rLSuZl+8sRM=;
        b=kWxYcEVgecc9xdrZNONkD1DznUFXNU/g0xWwnp2XtetmBdRr5vXIGw/kOyfZ3TL9uB
         ccMeFOlv7EU75qF0RvpyrjNQ+bN/IaQP/Yz4zVpRmDxExm/GL13TfD75ii0QDP2mqXaC
         4UYF1evID90ZRhqFvlaEa5mF7fyindRCoM41ps5Bsgf48jkxNm3b4Hr7Y2udW5mIrVo6
         RFH55UGXNp2oGFVW6vra9HsxYmqQzjP76frhtGqyZy7joaNZRcY07RxK3c3SxjoQSxeh
         xrnzDNnF2MFx1/NgiM99tLuykffjz+jekjzhRWEfFRpGdAIaLl38eK5q9/HUGbry38L0
         usmw==
X-Gm-Message-State: AOJu0YwwSQKn1NV4z4LuFxWpBCF31xUYD3GXdeK/G5S2DH7lbZm2atX0
	kIV5nIBEDmOnZ5WoPsoWzBXLliBbzwvz0pOyn4yNqoif8dIFT1ZCt2txK4wY9Go7fZp7SdJjQNG
	AzrJloUerSQ==
X-Gm-Gg: ATEYQzz9LclzFzcEYL+CHyUi1R4aLiKrp9w1RA0Jl/MLvhEPRHCdNmjJrHAev6BxEwq
	9SlC8VVQ5IKligzqqRIVST0Sek1fzhUtAhNGc6QBqFGMcUgZnqMByLg13tpUnvcs/E9s0K8MOWv
	8SZcBV+wG0RDefJQGSPd/DZ2TGVSGFoK7YUUqw5dAwJm5zBM/wexFR3eQc8WSKWS7ZWtHgaYsuu
	7WixQQP6Hll2bv7Z0yC5IrmMBhpLyOflt7jx2SYd5tXdGgXEnxybKTWuEhbN+zXUuZeBRqlDI8I
	v/pHZMhyOQ3dfBHw2l/N8X7PruxXGpcXvW/U5ijsO8NGesQeEQM9gwQvfXZbi+khcB7EKQacyCK
	Lwl1XAIqdhDhFhUFWn7OH0Nn+hi4i7QVaW1hT2PWTkypG5cASiLgLaciLKqhworscwzYb6k0yiy
	CLDo5X6OiFcuWCmp8IzV0ay/U7XkfYwtJdDBDvTmqpzGqb1+QRT+4FdfehBM1s3cERhiyfmZ0+x
	2jL76RVMf5HQtNxt+fYn7QDU94w7tcRMo7Ol8tfPc9fIWQGDVhGm7Aem4yPDzxvUg==
X-Received: by 2002:a17:907:96a5:b0:b99:5ee2:fd89 with SMTP id a640c23a62f3a-b9b503b397bmr327561466b.2.1774863622074;
        Mon, 30 Mar 2026 02:40:22 -0700 (PDT)
Received: from adam.arnhem.chello.nl (2001-1c00-8183-9900-1333-c39e-a751-6a95.cable.dynamic.v6.ziggo.nl. [2001:1c00:8183:9900:1333:c39e:a751:6a95])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7b225327sm266108666b.58.2026.03.30.02.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 02:40:21 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH v6 5/7] librepo: add PACKAGECONFIG[sequoia]
Date: Mon, 30 Mar 2026 11:40:14 +0200
Message-ID: <20260330094016.102637-5-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260330094016.102637-1-adam.duskett@amarulasolutions.com>
References: <20260330094016.102637-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2026 09:40:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234211

Currently, librepo compiled with -DUSE_GPGME=ON (the default setting)
causes dnf5 to fail importing repository keys. A very long writeup
of the issue is linked below. [1]

Add a new PACKAGECONFIG[sequoia] option which sets -DUSE_GPGME=OFF
and adds rpm and rpm-sequoia to the dependency list which ensures
dnf5 works with repository signing.

1: https://github.com/rpm-software-management/dnf5/issues/2539

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 meta/recipes-devtools/librepo/librepo_1.21.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/librepo/librepo_1.21.0.bb b/meta/recipes-devtools/librepo/librepo_1.21.0.bb
index d65567c14b..674919716f 100644
--- a/meta/recipes-devtools/librepo/librepo_1.21.0.bb
+++ b/meta/recipes-devtools/librepo/librepo_1.21.0.bb
@@ -16,6 +16,8 @@ DEPENDS = "curl glib-2.0 openssl attr gpgme libxml2"
 
 inherit cmake setuptools3-base pkgconfig
 
+PACKAGECONFIG[sequoia] = "-DUSE_GPGME=OFF,-DUSE_GPGME=ON,rpm rpm-sequoia"
+
 EXTRA_OECMAKE = " \
     -DPYTHON_INSTALL_DIR=${PYTHON_SITEPACKAGES_DIR} \
     -DPYTHON_DESIRED=3 \
-- 
2.53.0


