Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BC4DC02198
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 16:47:01 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.56181.1739206013386892909
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Feb 2025 08:46:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JgcPv6Ge;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4394a823036so5837525e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Feb 2025 08:46:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1739206011; x=1739810811; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=FYwVoh7b98dk+LTFrTbcPrKe0yACCDk/mRry7OiDgcU=;
        b=JgcPv6Ge4I/4EkqBVhdezILoaNcheg3OiXgN0OH8hfRGcoWKMxoM4cf5pRu8gy/0AQ
         bsr+ekutN57gNqud2PSz/qAP7lgZ9HI2LOiR1NjTeFqlhsLjKn/VP0v2MwDwKfubZcKA
         1tD+QBMWQjQKr0TJfcLp+MG2i+badqhrvvT44=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739206011; x=1739810811;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FYwVoh7b98dk+LTFrTbcPrKe0yACCDk/mRry7OiDgcU=;
        b=SaWFckvnmBu/PhdkaqsU1ruSH2ahCyQhvqzjB2G8d4IYvoGeiBWlYy2A2zuZxGz4Q8
         n67LZayb6i7dTNCB93ev+Qwc8zY6U9Joy7TW51fGioKe3vKn+GYjiQLH9GkQ0cKX/Ctq
         /fvDLG4vcjFvurCKb+pbHHVVm5zffJ21VcILfiSSYnqL8NhpqKf0padlTZytl+JTNVLq
         Ijjn65JsDDlgdDeL46cu86oa0qU2bU2fIbD1eJWRQ3M9sAvr8WWCsbJhEb2JFFC/JttR
         u/agvimdmXwG0Cem0OWITToMi0csNiHu4z4iva0WpO6MNPCogXkTiTkqhK6W2gHmCgoy
         4yLg==
X-Gm-Message-State: AOJu0Yx+OGVjykdgSkeSBnPnqrbmr+Eg05B41n/jniu2xw3DrqCfnwKR
	UitTceNxgZC76rIL8bwLaS6B2lpQSK9pttDtT5ci7Scj7EH5FCP3IK0TXTFvQ5oucxYnUiIqRD/
	3
X-Gm-Gg: ASbGncvkXviNzdRdzql8p6H04I0NieKivK+UAripasLFvE4hrXByxQJ4sBsbetcBU0u
	luWcgUKtlxD5HGPSzfWoo2RxRmsEpFsuuuLh+vxMcONGjQjDFb7hyORYFKdw+Lc/OSQsX3WxeGZ
	1rHErFTtA3hBSi2i1hwfJ5Bcf7I6rI/ymuf6p/GLK0JMOvyADptzXqrvAfwNzLAxgr7hRWejw3o
	+Zlwt02j6VvEXBAq1EibROJdNtsYly4Lxi6nrRpNlIMIyZIc/LDRM3eu1V2Xr0kgi792iFpKgTs
	qLBTfdSWbk5Ndyiw0/k5mjH6B6cUzLBKKDQoAgIOypA=
X-Google-Smtp-Source: AGHT+IHOiwuhtRlyQ4EIkqTmdiwVLSQ7VfxaDjvr12HZguEqGanQh3oEpg+ked4gcQz96hy161e7Zg==
X-Received: by 2002:a05:600c:3552:b0:438:a1f5:3e38 with SMTP id 5b1f17b1804b1-439249c75c3mr136387145e9.30.1739206011273;
        Mon, 10 Feb 2025 08:46:51 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:d33a:26d6:1846:991])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dd093e1ffsm8328259f8f.100.2025.02.10.08.46.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 08:46:50 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] package_ipk: Use preferred for of --force-postinstall
Date: Mon, 10 Feb 2025 16:46:49 +0000
Message-ID: <20250210164649.395225-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Feb 2025 16:47:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211105

opkg accepts both - and _ in its options but use the help text
preferred format. From https://github.com/yoctoproject/poky/pull/14
from Philipp-Alexander Blum <blum@gessler.de>.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/package_ipk.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-global/package_ipk.bbclass b/meta/classes-global/package_ipk.bbclass
index 209568ae5f1..3e72c4c4941 100644
--- a/meta/classes-global/package_ipk.bbclass
+++ b/meta/classes-global/package_ipk.bbclass
@@ -17,7 +17,7 @@ PKGWRITEDIRIPK = "${WORKDIR}/deploy-ipks"
 # Program to be used to build opkg packages
 OPKGBUILDCMD ??= 'opkg-build -Z zstd -a "${ZSTD_DEFAULTS}"'
 
-OPKG_ARGS += "--force_postinstall --prefer-arch-to-version"
+OPKG_ARGS += "--force-postinstall --prefer-arch-to-version"
 OPKG_ARGS += "${@['', '--no-install-recommends'][d.getVar("NO_RECOMMENDATIONS") == "1"]}"
 OPKG_ARGS += "${@['', '--add-exclude ' + ' --add-exclude '.join((d.getVar('PACKAGE_EXCLUDE') or "").split())][(d.getVar("PACKAGE_EXCLUDE") or "").strip() != ""]}"
 

