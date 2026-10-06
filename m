Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07B35CA5FED
	for <webhook@archiver.kernel.org>; Tue,  6 Oct 2026 09:47:13 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41722.1791280028491196250
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2026 02:47:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=bjUxJrQF;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a16bc2278aso3751235e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 02:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791280027; x=1791884827; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MuZ4CjNiqgaGo4q3Y7ogMgpLSi6YODJG586UMyYYd2g=;
        b=bjUxJrQF5SHrlx7PnC7kbEIk9BMaiommYohB9Ddg5WP9fj6HzMaIF36BLEcXT1rqxG
         WAy+upj8fBTqIxGO5tvVon6Bi+Vj6WdcZoAPB+XGo/ZNZ1cQDMLHNQCWf12w2mdXB5Zr
         Ewe+bmPXtSWgdUh9+M2mXehTlut+DEqOwo/TQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791280027; x=1791884827;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MuZ4CjNiqgaGo4q3Y7ogMgpLSi6YODJG586UMyYYd2g=;
        b=B87nB9VkAl9VLQFGbrttjZQaXrvenPVSxdfPdBfwufZ1X6RFZiEh2Qtw5ILrwVkgTP
         hBvnNEtxwxAGoHJSXlKhweNcA0rmP6D4h+Ha+odn8auusV8JJxlFeUxGm51B5m0ah+W3
         NJBRlSPYecarXUHWs3NF0/58S8SCPIabSD66AK/zTj6/X0jfY90UR9O1q1WBXSUBasmV
         HdkOaQhhgo9wdWT8FAQYgiXNu3mzAulWEldqnDwdnlHoOw42J57Hp4G2hUrm83Pz7s7I
         S8NnGhsgYYbVrvvcHjbVrBHJ3sYLDBhyRUYKZn3rDbiOW203PWLbdZsVvQ1mOis22Cxn
         +g1Q==
X-Forwarded-Encrypted: i=1; AKwUvBxpBQA8FTbkMu/caEIgWX5LV8HZJ/MFmNK7xlK2Ow+0aSr8rIhhQmCj5vXhpnsPB8I6qNqVgVZMMGD0/CCGd6hqsw==@lists.openembedded.org
X-Gm-Message-State: AFuF++k7+QfMT0rbt6D20LMRyxO9pFQnWz52nbn2N5BH9Aeo/odTrigv
	cUGZvry/g0iSn9Yit/TFNB9bFrscGCxxXGuYbuU/rpjeO/MhVG09S0DIhV9/7dWArKc=
X-Gm-Gg: AYBFou3HGlzmDDDYack+k6YeVseQgXbLfQzK3Q6x9P43d2/ABG+y9FkdaKQA5pAPlrR
	BEfGORHuZ3UqDLNK/fE//wcFlR/dc36XGUsGWdIMeCQmjtbKg0F0bKu1avzqV0zFnAze7f4/kwk
	/eGC891GY4SdpzrlzfQDyumkfAcSHS214FRukwzS9w8om1igXdQp18a/E/saB+NELcKXVouCQIh
	sTg/DCtAEHXyHJwhvOHYXPW5pdnJAe/qa0C2eX5IGpubdvLLlHoE8SDIyejzOgM731Hkrp4cYv1
	d9jEnfPCaL7I1lmWhFHaxJMewY0rFLK8RPGxBx/KzK3dKH46zjeX79SKsjPC1FnG7XgxWO2q762
	yxu+quTGqPAj4qBsZslpKs4wbUMiHDncRRN0JVk6DZj6oU9uEIZkJgJrrTzO//ErmIJpZ3ZETZC
	Xj7mXYKx1gJkPISLIhEmBPpGthrl03ZBd/CTfib+A57pBd0Bg3XP6E7Xu4HcIQGqsb1m2SHjRE3
	26PnMN64zHmXFqcJWljKFEHagDE2sWbVAsPXYcPiDQjMwELUKvqt66afHY=
X-Received: by 2002:a05:600c:468a:b0:4a1:6af7:9c23 with SMTP id 5b1f17b1804b1-4a17b5268dfmr13946675e9.7.1791280026657;
        Tue, 06 Oct 2026 02:47:06 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178ca8127sm64616305e9.2.2026.10.06.02.47.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2026 02:47:06 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 06 Oct 2026 11:47:06 +0200
Message-Id: <DLXNRVNEBF1U.29SNKE4PFII0N@smile.fr>
Subject: Re: [blacksail][PATCH] recipes-support/gnutls: disable slow tests
 for RISCV64
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <thomas.petazzoni@bootlin.com>
To: =?utf-8?q?Jo=C3=A3o_Marcos_Costa?= <joaomarcos.costa@bootlin.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261006092810.2407651-1-joaomarcos.costa@bootlin.com>
In-Reply-To: <20261006092810.2407651-1-joaomarcos.costa@bootlin.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 09:47:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247280

On Tue Oct 6, 2026 at 11:28 AM CEST, Jo=C3=A3o Marcos Costa wrote:
> Timeouts have been observed (very frequently in the past weeks)
> in the autobuilder, and a bug [1] was filed at Bugzilla.
>
> After some investigation [2] was performed by Trevor Gamblin, we now have=
 a
> list of the most time consuming test cases:
>
> - mini-record-2 (187880ms)
> - record-retvals (145390ms)
> - rng-op-key (63820ms)
> - rng-op-random (63330ms)
> - rng-op-nonce (63260ms)
> - dtls-rehandshake-cert (61360ms)
> - dtls-rehandshake-cert-2 (61230ms)
> - dtls-rehandshake-anon (61030ms)
> - mini-loss-time (60130ms)
> - mini-dtls-hello-verify-48 (30050ms)
> - tls12-ffdhe (27790ms)
> - x509sign-verify-rsa (18460ms)
> - x509sign-verify-ecdsa (16050ms)
>
> Disable the tests that take > 60000ms to avoid so many timeouts in qemuri=
scv64-ptest runs.
>
> [1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16162
> [2] https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16162#c19
>
> Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
> ---
>  meta/recipes-support/gnutls/gnutls/run-ptest |  1 +
>  meta/recipes-support/gnutls/gnutls_3.8.13.bb | 18 ++++++++++++++++++
>  2 files changed, 19 insertions(+)

Thanks for this first blacksail backport patch :)

I just did the very same cherry-pick.

Regards,
--=20
Yoann Congal
Smile ECS


