Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D66CCD3436
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 06:26:46 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7700.1778221604638223101
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2026 23:26:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=DWYKfUE/;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488b0046078so13419615e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 23:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778221603; x=1778826403; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=03H8+6WDHV4+n5IAiXkeuDgCAcZBbTD2JDMwYARiYyI=;
        b=DWYKfUE/Xq3uqc9DmXmJ0dMNtsObSH1odJQ2OqIGHUtnVnD2Ka01Gbpo5sdE90qGWQ
         rlEUJHKoExYhDXGfneaPKsoWtKVJasMXYVB6g7iv51w0ttT3XvUbdYwbijmO1wp2zGkN
         4BAx4Qyxl4rd5RKO1nWH4zUkGpfr+JJRTHMHo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778221603; x=1778826403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=03H8+6WDHV4+n5IAiXkeuDgCAcZBbTD2JDMwYARiYyI=;
        b=mHyp0H3CEtUCX9+PGQpKd/TlpcpWMpEwVbmjKgQ4L4QNmtxL88qeajgVskDZKDzT5n
         b+t5traY2PmbJUj4bj63hwkP3y/irZmUc+rT5S89qedPMe3UKVuBlUI+jMkj0Kuod/vo
         zeWHgwzRLuO/OiuG9YuwmW+CiJS37AB2wSY08bmmXgkz6q/BBJhCbk6B1B/cPUsUqoAi
         wIEQfLl0fGWECFY+3Ry5RBsDupICPUkMXzGXi5747pGYrF4wpMhIr2vNYMLfDAsWcFzo
         gLlT5FRE7laV1UocIKO52sHVOTmiLNVu/mMwACuX14hhy9SPn/vR6dQ1Z2/xdAlgNQgP
         wBiw==
X-Gm-Message-State: AOJu0YxKjGj8Kz9MMTlENfg5KlfBnuyE0Y3ptt+IBlMyWL4JaIrLhNwV
	MepByTzWRssVzMLO3MkVGTYhceKulB9dgw3+MfKPMtW7CE5dqf+sFYY4yi+3cnLWFLlVO5w/6wQ
	DFfUhPO4=
X-Gm-Gg: AeBDies7T0eBAtNlvkMIKZC6pB2zShZcMnftL81OaG3uwP4xqekycbcaZvZz9jArb2L
	7c+L197+j4EA7gxNwPDBzfQbQObZoE5SBJLvWD778IFpuJsVYemicvN2xe5Ce/HF2Ul4S1XNwUN
	435rja9VAoGgFfw7a09gjqTHAgQjjBzM97HaJzzEP8pxveEN1C5ejQqHvPvLKWksj6Lx5MrCN+v
	siYOVhl4sgd0ur2243BFtQupD8L9C/lUC5GYXeVXMPkCmWe9/B9zBb58OcfGXyvdAztrs/5da8V
	UxpFrPhudCx0ENnA9jjIF0Fey5P1zBa4T9wk1VTyVDGj11Nb0SAR8ZlXYbO1JkFQcBFizcXHYlY
	XTeT/fMW6LeyE6d31ZghPo8f+VHI73cpZ6w0aFp5aQqNp7Y5U5tpP6nzGyPu+sMgwu67NPtZvKa
	HuuMSXOUSWpTLY/hM8rgO6Mxy8yK4SUPLrwhjwTK8iqJBag/pbE/wKFX/DnmI2wvpu+XGWzuJfb
	Rfxq3RqChx6PYjI2CRvahFzLBdxwfoj4ZPGkQ==
X-Received: by 2002:a05:600c:354b:b0:48a:554d:b9a2 with SMTP id 5b1f17b1804b1-48e51e0c7c9mr165780915e9.6.1778221602544;
        Thu, 07 May 2026 23:26:42 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e68ec5c49sm15202695e9.11.2026.05.07.23.26.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 23:26:42 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 1/8] grub: update search parameter
Date: Fri,  8 May 2026 08:25:53 +0200
Message-ID: <2f509e353e2fc04923fc742312c81ed69b419643.1778198884.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1778198884.git.yoann.congal@smile.fr>
References: <cover.1778198884.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 06:26:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236633

From: Xiangyu Chen <xiangyu.chen@windriver.com>

[ Upstream commit 42b530581f7246b3143ee50e3c6f981dcbb1dc74 ]

Grub would report an error message in boot stage as below:

   "error: no such device: ((hd0,gpt1)/EFI/BOOT)/EFI/BOOT/grub.cfg"

Consequently, the root variable is not set, and the intended protection
against cross-device configuration loading (the purpose of the original 2014 commit)
is lost.

The most robust fix is to use the --hint parameter.
This separates the search target from the device hint, avoiding
fragile string concatenation and supporting both prefixed and
non-prefixed $cmdpath formats.

Fixes: 5ce73b6055ac ("grub: add cmdpath to grub configuration file")
Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-bsp/grub/files/cfg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/grub/files/cfg b/meta/recipes-bsp/grub/files/cfg
index 8ca53d24d7b..8fe1a8d0c74 100644
--- a/meta/recipes-bsp/grub/files/cfg
+++ b/meta/recipes-bsp/grub/files/cfg
@@ -1,2 +1,2 @@
-search.file ($cmdpath)/EFI/BOOT/grub.cfg root
+search --file --set=root --hint-efi=$cmdpath /EFI/BOOT/grub.cfg
 set prefix=($root)/EFI/BOOT

