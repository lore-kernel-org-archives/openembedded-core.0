Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FABEE77188
	for <webhook@archiver.kernel.org>; Fri, 20 Dec 2024 08:57:50 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.148473.1734685061332622002
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Dec 2024 00:57:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=rYqOZ6Sy;
 spf=pass (domain: linaro.org, ip: 209.85.167.50, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-53e3c47434eso1741780e87.3
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Dec 2024 00:57:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734685059; x=1735289859; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7c7Hl5DUFiQkshlgOqkgP3u7uP9Zys1yhTeA93pSZ4c=;
        b=rYqOZ6SyZbMRHSiJjuYHUl8bkTSY+RNtBzB626VA50a19PQV/ix19/Yts69+JmnH65
         tD3FrUWrZA0zMH4oS7QN7m8oRWLLkdAVTdbHRjDUcT4rzNJjCOLF7z5CVQCZc/EQHQSU
         qmpFxgeFMSecUp2/shFPRuShlOCDaMyRTw3dauiIwVFtH4XyKVSa2HgtT4lrsGHjwqIQ
         +vv7B9T2tGtgTiWD+Pwibmu3alJjVYUFO9q4l/wOw0YrpATKmgJYKrjEZYEjL98cXFHA
         qUsTnAPddxJFJi2C+F7iT0SSszyiQHymb2VQsEx2UAwBK5bL5On0Uv+zTaCinDEc/LAP
         JaBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734685059; x=1735289859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7c7Hl5DUFiQkshlgOqkgP3u7uP9Zys1yhTeA93pSZ4c=;
        b=ZgiwwgA74NCTlWrVWy4X1bf1op+Q9tfrbGNbB13S9yBRYl0c+nu3MRpdl/aMxx6ASS
         p6jnnJFGbVglfCgG3cmnFCoWx4ARC8GLtu0QIpLKQN76vjhpac6FCi83JmAsYd8of1sW
         KdVMwLdil6gNmLPNB+rQOFRkDg2tPvgHZ4Mmz8gSKP3m3QBnswURf8BvLVtDRt/6tTSJ
         EAKEu991LU24yaQpyTA3V4hfAoHd6kz31S8rADIIxfSkjGpmTwa01hwz8W+RlKZPNakL
         mlNw4SRnJCnG4FQCy/SyeeGTS8NJv57YAG8hmDRM+Llvzyn5e80SkcRRXjOO/QHta42N
         rk6g==
X-Gm-Message-State: AOJu0Yyw7N4QYkfHFy4yJzkXMETmGPwr1cYe/5H5MNsp+Hft+0UvFi76
	fZqIBJDbZkfhq4hshRUToQYbAdR2vW2emIPrV3NBG6Mc1YCSJLqE3QUkPKU2VqqspugT4SMVDl2
	v07Q=
X-Gm-Gg: ASbGnct8FMcpG7ZMV0NPhyXJL3GCxRv7WxmdIALZFxWJSOFtAI7hyzu3Uqx2YgJjbcP
	GJcrGPRxwEVgTcXiTNmUJ040GupdBcOZTlFnMNIDnPABqNQuWWsYBFTREBoekxmJgyMTkkpm83k
	OAefs10Fgl9Zf68LyOl8VMtO2vUGaVq/Vcy32g1uxnUQWo1JnfQrBVSAfMFCFp1mMJ7H1ZCF5ys
	1/skWMg8ddUGWituZpGFL11rRPpqbp2T2GhCl8IkwSm2CoVqocsQUQeeis+KcUV91sui4H0xRI4
	DFwcGogv2SMT0YwwsCEVT5EAkw==
X-Google-Smtp-Source: AGHT+IHjbq/I5job7Vl/2tPPF2ucxuhJ/K1JOdhywD3nXfNScwfFzJkPqCeq0TjhnPQhk8pJV2O/Cg==
X-Received: by 2002:ac2:4c48:0:b0:53e:362e:ed0 with SMTP id 2adb3069b0e04-54229561a53mr620074e87.44.1734685059480;
        Fri, 20 Dec 2024 00:57:39 -0800 (PST)
Received: from localhost.localdomain (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54228744c06sm218186e87.219.2024.12.20.00.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 00:57:37 -0800 (PST)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 2/2] systemd: add fido to PACKAGECONFIG option
Date: Fri, 20 Dec 2024 10:57:00 +0200
Message-ID: <20241220085700.228006-2-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241220085700.228006-1-mikko.rapeli@linaro.org>
References: <20241220085700.228006-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Dec 2024 08:57:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208970

To enable FIDO support.

meta-security can provide libfido2 but it depends on udev
which creates a dependency loop between systemd (provider of udev)
and libfido2 which is currently unresolved. systemd recipe
could split udev to a separate recipe to solve this, or libfido2
could be compiled in systemd source tree after udev but before
rest of systemd.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/recipes-core/systemd/systemd_256.9.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_256.9.bb b/meta/recipes-core/systemd/systemd_256.9.bb
index c047964953..b5e3e85a38 100644
--- a/meta/recipes-core/systemd/systemd_256.9.bb
+++ b/meta/recipes-core/systemd/systemd_256.9.bb
@@ -150,6 +150,7 @@ PACKAGECONFIG[default-compression-zstd] = "-Dzstd=true -Ddefault-compression=zst
 PACKAGECONFIG[dbus] = "-Ddbus=enabled,-Ddbus=disabled,dbus"
 PACKAGECONFIG[efi] = "-Defi=true -Dbootloader=enabled,-Defi=false -Dbootloader=disabled,python3-pyelftools-native"
 PACKAGECONFIG[elfutils] = "-Delfutils=enabled,-Delfutils=disabled,elfutils,,libelf libdw"
+PACKAGECONFIG[fido] = "-Dlibfido2=enabled,-Dlibfido2=disabled,libfido2"
 PACKAGECONFIG[firstboot] = "-Dfirstboot=true,-Dfirstboot=false"
 PACKAGECONFIG[repart] = "-Drepart=enabled,-Drepart=disabled"
 PACKAGECONFIG[homed] = "-Dhomed=enabled,-Dhomed=disabled"
-- 
2.43.0


