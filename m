Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3562CD3ABD7
	for <webhook@archiver.kernel.org>; Mon, 11 Nov 2024 17:34:51 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.65309.1731346488552768716
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Nov 2024 09:34:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZSIxIjNa;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4314fa33a35so38427735e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 09:34:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731346486; x=1731951286; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fKBwPXOvZVdKIE9DtBlxGhLKWU+LpxDy6UrQBWDIvU8=;
        b=ZSIxIjNaPXO4JDcp2jGEccZ/UTY+8Jgozz2kTAeS+BAjZV0YW6bzYqraki0bLiVP70
         3fCcF3PKf0zQq6v917IDzT40gAs4ICiBSvqJ/qi4t+4ri8kKivsdF5L0Y7KsTV5Z6EGr
         eOC2YZTGkUAEImEGTEGX718uKbMKIbbOPwC6DEByqQ18+tzW9ei+z1ofmwHU5d7YISYH
         vyM085eMIfUsQaPcICFgPcLh8UrBI3bDwovT5W2bB3CpiJj8x3YC7Y9+m1zU+jbb9QKP
         o4PQYNLBzvLFXhvOxewq+NgP9xUpDc5C9xV2axtJhnxZTd1vgiLsW/jCLu22uQiuSxXs
         lbUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731346486; x=1731951286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fKBwPXOvZVdKIE9DtBlxGhLKWU+LpxDy6UrQBWDIvU8=;
        b=DS1oc3b8AiuEFH7Se7y6LIP2sIBDRMQRr15pGvkZA2IL7m0frWrRdwF7fMJ2nOROBq
         GE6A/qq0HzfRirFi1maIOKNI/0IRHdfF9LILN9aYL2j5NT5Wg/YfllfhJpK29n+wXvFN
         oGAkbYIIGp3w1iX3c2Pd6fqcbOTvFI87C8wRZBn+3sfShh4T5FEfyRO4DSqCJ3aVzGMV
         aK1k2kS60rFeHOWmC2ncnHIwXCiIMRZrOnXGzKYQBwtGO/QYZVFx91SDGpqat0msJLqu
         Y6q9Wi1TmNafggjV5fDTCuBA3KX1MRlLw2NRh96Iy7iQYWGY7ustkrbj2tybsKiCfW/g
         j4CA==
X-Gm-Message-State: AOJu0Yx6I3p6h/5SCNx+n0kP67GW+qSghoirwSoVfdLlQf5LDqC9bAQN
	ZR1601q3YH7TbCKv1j0EidAub6DGJ4LpXPv9SP+ZRvhubxDreZP+OmMAHw==
X-Google-Smtp-Source: AGHT+IEoMubvC1jE4KE7C+qwsd1FfSFcMzQHShuWkwq2VK5AjpLqUmc5bOOoammDTa6naA72WRfM3w==
X-Received: by 2002:a05:600c:3514:b0:431:52b7:a485 with SMTP id 5b1f17b1804b1-432b7508b3dmr120425965e9.19.1731346486377;
        Mon, 11 Nov 2024 09:34:46 -0800 (PST)
Received: from localhost.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432b04753d5sm190057575e9.0.2024.11.11.09.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 09:34:45 -0800 (PST)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
Subject: [PATCH 2/2] python3: add bluez5-native to DEPENDS conditionally
Date: Mon, 11 Nov 2024 17:34:21 +0000
Message-ID: <20241111173421.44377-3-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241111173421.44377-1-gudni.m.g@gmail.com>
References: <20241111173421.44377-1-gudni.m.g@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 17:34:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206965

When bluetooth is in DISTRO_FEATURES, Python should enable support for Bluetooth sockets
in the socket library. To enable AF_BLUETOOTH socket family and its protocols, bluetooth.h
header needs to be available at build-time.

With this change a Python application can open and use Bluetooth sockets natively without
using 3rd party packages like pybluez.

An example is the following line:
    sock = socket.socket(socket.AF_BLUETOOTH, socket.SOCK_STREAM, socket.BTPROTO_RFCOMM)

With this patch the code will not fail due to missing symbols.

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
---
 meta/recipes-devtools/python/python3_3.13.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/python/python3_3.13.0.bb b/meta/recipes-devtools/python/python3_3.13.0.bb
index 54742f5257..8a98386576 100644
--- a/meta/recipes-devtools/python/python3_3.13.0.bb
+++ b/meta/recipes-devtools/python/python3_3.13.0.bb
@@ -71,6 +71,9 @@ DEPENDS = "bzip2-replacement-native expat libffi bzip2 openssl sqlite3 zlib virt
 DEPENDS:append:class-target = " python3-native"
 DEPENDS:append:class-nativesdk = " python3-native"
 
+# Enable support for AF_BLUETOOTH socket family
+DEPENDS:append:class-target = " ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez5-native', '', d)}"
+
 EXTRA_OECONF = " --without-ensurepip --enable-shared --with-platlibdir=${baselib} --with-system-expat"
 EXTRA_OECONF:append:class-native = " --bindir=${bindir}/${PN}"
 EXTRA_OECONF:append:class-target = " --with-build-python=nativepython3"
-- 
2.43.0


