Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C9DFC43327
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 21:04:32 +0000 (UTC)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31000.1782853470349495379
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2026 14:04:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ATq5m0FF;
 spf=pass (domain: gmail.com, ip: 209.85.210.53, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7e9ecb1e13cso1498499a34.3
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 14:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782853469; x=1783458269; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lxnLKSe+U84H+E798KYZ1vrCSh9Q/KwJtgJMVpjVg1Y=;
        b=ATq5m0FFH6Wcyjr0vRYE9/Sp/7VU+ZurqtwGco0RU8Nm4pLCt4Nf1lnL6Nj4zaiQ8M
         nQuqMGSogLsz/khG/tiOmnBsskx5/m+7k2Ff99GiHHJxJX01Bm3V9oTvoPrtJfuMrWTp
         uZDwgklyFPF05i7e59G302ygs6TbuAGB+wvBWDjDrdAe6W0tjBOV9TncSEvfupOuZXfd
         8PvarCUgs4kF73Ym8R4M3J3phukt3H8+uVljLzoFPobMJYT5z6czqbulXb1LjdLmQI1B
         SPTHxqDFGVu2HmxzcWAP/q8TMn71PWtMfJN0vNdb+8SUVddwjXfDbUz0tNj10kd1gWrz
         ZVsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782853469; x=1783458269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lxnLKSe+U84H+E798KYZ1vrCSh9Q/KwJtgJMVpjVg1Y=;
        b=U2wWAZ9Rq8SUSWaNI11p/vfdkstX8JrLyw+WpB/T9PJEA3dLfBMLuxGQdt+kvLsNAu
         dM2dMCpCSqaiimHJbYUTl9Ep6N9aziCNy6OwXmEjGZSNstUPfcY9gi2/5VD49CU73i3X
         G3jsw2TBfbK848733Wy4pdbJtArYU/N/btVtejRLJGgD8LwfLPgxnjEToZdAN/GIW+f7
         hmLlrliGPaxTQXQqu8nVwNdq0bAsqdcOJ3cHB4jhBDmm3CUJf02RItvBXvAY80snOSOD
         oiJjCtVOMieSUltagZFi1wWkYPN8HbfmYFGAdw9WWx6/kNBOWAJJZqdFKtN8D4bQhTGE
         LSJA==
X-Gm-Message-State: AOJu0YynQM3ssKE6fTKIZMQBTovG+MrB+qRpVfvppigXV/7FntvN/u6B
	eFGcU2GTfHaMWHh3wzqlXbajMK8vf0mj7lfM4OmE47J2C8UpR2ywFgrfzpUfJw==
X-Gm-Gg: AfdE7ckafuSdn1gTRFpqQtTjMmAS/KR95bedhROlPs3wISiwfAHxmbfrMSwwkMcryME
	u2QIVcDfA4A17wuMLClPlikKBxfs8s9wX0TpIMjS0GO2phD/SbNiVjBsZ99gzk5PHoWSi7hAe5d
	MXn68VVIi9cAJy307NJ/W3QABQL/74NpVqzRY6wj83BWB1xrxhzLkhn5ieEbAXxKfn7Zj75Ot1B
	g983i6tsnig5c5PECuy0nCMzP3Fwx93vGkrFnf2z+PLQo0UwYUJjiIqCCQs9tr0Y93BWlwOM5/T
	o7qCnLTiRjwQbxEmmxneKSKU+OVXRRvBpb/yo9H1/LNsrVNOz4ZGydcFVj9pXh+J9abBjnuM6yq
	D9vsQHQ/5lIOJGZpNPMMoaZTQ93pI9kGwcRPc+atcHVnHnaC2lUPL95Y0fSaIfUQotr9YtMpHji
	RIYnZ855F6kA==
X-Received: by 2002:a05:6830:2584:b0:7dc:c4ae:a679 with SMTP id 46e09a7af769-7e9fbd969f9mr1531891a34.9.1782853469515;
        Tue, 30 Jun 2026 14:04:29 -0700 (PDT)
Received: from localhost.localdomain ([2601:283:4b02:22d0::3cfc])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e9ebfd01cdsm3248143a34.8.2026.06.30.14.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 14:04:29 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v4 07/10] grub-efi: Change to MACHINE_ARCH
Date: Tue, 30 Jun 2026 15:01:41 -0600
Message-ID: <20260630210422.1903245-8-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260630210422.1903245-1-JPEWhacker@gmail.com>
References: <20260624141706.2164567-1-JPEWhacker@gmail.com>
 <20260630210422.1903245-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 21:04:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239922

Machines can change EFI_PROVIDER which changes the way grub-efi is
built, meaning two machine may not build it the same way. As such, the
arch should be MACHINE_ARCH.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-bsp/grub/grub-efi_2.14.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-bsp/grub/grub-efi_2.14.bb b/meta/recipes-bsp/grub/grub-efi_2.14.bb
index e535d99710..8d8671614a 100644
--- a/meta/recipes-bsp/grub/grub-efi_2.14.bb
+++ b/meta/recipes-bsp/grub/grub-efi_2.14.bb
@@ -41,6 +41,8 @@ python __anonymous () {
     d.setVar("GRUB_IMAGE_PREFIX", prefix)
 }
 
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
 inherit deploy
 
 CACHED_CONFIGUREVARS += "ac_cv_path_HELP2MAN="
-- 
2.54.0


