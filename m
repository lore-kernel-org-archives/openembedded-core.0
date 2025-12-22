Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41DA1E69189
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:08:47 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87831.1766434126765016860
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:08:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GSznMTVA;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b802d5e9f06so544609266b.1
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:08:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766434125; x=1767038925; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WPqfcW43lKUSCwqCxZNb3dcesjg1sndcmtGoe7IZDt8=;
        b=GSznMTVAQxR/a2nrNOrE4FlWUosUklwBffa4ppcZ5q+5Qqrj4gJ3n46RgyorPZWXB8
         NTHsdq9Jzam0hECvC0oTjmQJhg/Rdmy7jnoZFrYn8XzRmEyew8HqRdROPiZ8+EHKbfWC
         MbUILW+xNvkU1CNKBNYrJKn6E/JoSk18WLxv1S/daoAYRPH8pyD1/HvMUFll0V8CxcJE
         hzNXHjReIuhq/Gx2cwXQr3O+DT11ESnq5zVnI0Ns0ZwHE+6Cj/Z8qmCeb09h3YSLHRSR
         iLw/Hhe8sg3715jjzDWXM/9+6QhYGYvAGZ5JLpux0mUD/tXdDscUPbeN7kND4tgVtg/9
         myHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766434125; x=1767038925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WPqfcW43lKUSCwqCxZNb3dcesjg1sndcmtGoe7IZDt8=;
        b=C8lsE7qdKEqHGo6W3rmQYP4NNYkvTcT3eM09zqODzr/EKCBgAMjLoBhY5mXoFdUZX0
         MPOwwO3I1hUqPdZIDHCL6tl2gUGq+XAB3fDPrSAtZM6v3+t+TVL52gsf0K+59LGNrk5C
         e8UG8WH8WLZK9AdTBuz29CHwouw0tUvrUSHAIae2kW3aP/7i+TnQyoqsw6+jFWMsA0ip
         SZ1GB9Fir3KBwtwWl14TtZmwDLFNd4gx4KEUnz8jMKnWmaqUVfsBeipfSHpNEzX90bxR
         3dg8tZ61YeKQslE6hVKdc9S6I6beuPA86FYiZ9i8dGZeDggFPLcUJWMdjMBJYkGtVbq6
         JgUw==
X-Gm-Message-State: AOJu0YyJhHPjjyIEHy2xme1x9a8ZAVCfHh2kTf/KItt5rcGMOIqXRdqP
	LaB6wkOvkOAPxSFqf2p3TAgd6bJ9Rx/rvY5cO1Pa44FYX9qYaCEwvkfmrF28pw==
X-Gm-Gg: AY/fxX5ROAUel+V5GbbR+u+c0PWU9l3rRVO8uis/5a6CYRVc77FikLHr/Oi9pQq6juu
	WRJZ0ZJsCbd0UlJr+XPTL/X+sSEJ6B4bqcqkaGh8goU/iWiZRB6IBFY/VGBttExM/4SKcC6lhi6
	ihG4UrybJmRW31t+ul9sJeOlQejBuXtXb+kPV3D6hJDc28pVPIWSCU2csiIqwrSaH4S9kEQXUAM
	Zwr7c+8BBP82FQwLcKLqbxXsuVQ5RAyZzJuFtXvwUlJw9njrBdFZO7jbeyC0rkXAVj3xFmmV7S2
	05RbzLnksmA6+Y6QlMhzXxAUksOc5rsA+7PF+BTXIOz5SJcBDEIWYBiJ87Jx4+ijEPHBR8hNhYY
	Pnk7z6/BfY4jawBCr+Z1KBRDxEkL78IQU9YNcPFj+LH83jM8UIiRKb/WubEMkt5lGFbTfMKzowJ
	qJLjg+kV01VBF1eYTyq0hPVMbKW0kDdY+23oTKDtv6OuhI1Zg=
X-Google-Smtp-Source: AGHT+IGLlYb7SoQIckpBZrtMsxFTPvoGOBXb+RGMHwAjUAt+EXv3w1fChEU1eteW7EkmzzcJNRBysg==
X-Received: by 2002:a17:907:86a8:b0:b73:544d:ba2e with SMTP id a640c23a62f3a-b8036f62606mr1303104866b.25.1766434124941;
        Mon, 22 Dec 2025 12:08:44 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1182344066b.60.2025.12.22.12.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:08:44 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 087/114] python3-webcolors: upgrade 24.11.1 -> 25.10.0
Date: Mon, 22 Dec 2025 21:07:09 +0100
Message-ID: <20251222200739.2278706-87-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222200739.2278706-1-alex.kanavin@gmail.com>
References: <20251222200739.2278706-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:08:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228412

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...ython3-webcolors_24.11.1.bb => python3-webcolors_25.10.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-webcolors_24.11.1.bb => python3-webcolors_25.10.0.bb} (80%)

diff --git a/meta/recipes-devtools/python/python3-webcolors_24.11.1.bb b/meta/recipes-devtools/python/python3-webcolors_25.10.0.bb
similarity index 80%
rename from meta/recipes-devtools/python/python3-webcolors_24.11.1.bb
rename to meta/recipes-devtools/python/python3-webcolors_25.10.0.bb
index d537614545..8e4f264d04 100644
--- a/meta/recipes-devtools/python/python3-webcolors_24.11.1.bb
+++ b/meta/recipes-devtools/python/python3-webcolors_25.10.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/webcolors/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=cbaebec43b7d199c7fd8f5411b3b0448"
 
-SRC_URI[sha256sum] = "ecb3d768f32202af770477b8b65f318fa4f566c22948673a977b00d589dd80f6"
+SRC_URI[sha256sum] = "62abae86504f66d0f6364c2a8520de4a0c47b80c03fc3a5f1815fedbef7c19bf"
 
 inherit pypi python_pdm ptest-python-pytest
 
-- 
2.47.3


