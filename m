Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 613DFC98314
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 06:59:00 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2125.1790233138611268965
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 23:58:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=x+rexVO+;
 spf=pass (domain: smile.fr, ip: 74.125.225.140, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd5462b69so9366595e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 23:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790233137; x=1790837937; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xvL0fJoqxKgdNxjxi0bRDxgni73GAtfqmbmKZ5147xg=;
        b=x+rexVO+fA8FXC6IgaP+jcJdvztrYZVuiKrmxd7eGxM65aKq7Ze7Qb9i75XR/BQyS+
         Dn231KSAsc1WPqvCPStcxdtPpdF+6Pjd+M/VjF9BH5tu/fSE7Uhk3ls1Ig12V5DrRFB6
         eGW0b4Y5EepDWqn2Bn+FpupEW1iT9dD2NilkM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790233137; x=1790837937;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xvL0fJoqxKgdNxjxi0bRDxgni73GAtfqmbmKZ5147xg=;
        b=emUVMYeON6vhE/LQkf8+9S/4QDbYCyP5X+I0YNFW8vZthcUtbXNeWL/GvrcRUpPb04
         pvplGlyRJ0Bp8R0i64EDOEbEl7wX3V48E4/IgmKvUSxemilraSWBCfaMhjswPFT79sZ1
         lwWYT/I/So/QwT1/mLlwkxyk+sQm1gZjR4cgFY9n3eZX4glmyZaZeiThuh2w+FpeR5h3
         cOo0zO65NQzbXiC3+CMo5/GkF/jx39ojzm1HhjyShQJ92jCt/H2YoNn4BTjBA/gpZ7NV
         Hnb4I4Swepibth5sC3qeg/OiW/g5HWtECW6ch4fCwDoFEpchyh4tzSy2nJlD9c+npeM+
         bNOw==
X-Forwarded-Encrypted: i=1; AKwUvBxkUV0jM+fkFpGq/0xCznz0kN47xMlLN7MjmrmpGVzdPFzd3nhlmk+kGiBhmS35nQPo4xXSJJcKG/mfmpS1Or8TCQ==@lists.openembedded.org
X-Gm-Message-State: AFuF++k3SZ2PW3IsYw/WtXwsBQztaX/wxvn38/n5pk1W8BFI5t4Pfusu
	7J3KK62fOCm7UoftJtr5szNjRaNXj/CVGJpFrXD7GjNmFMJJ674POsOz5PuYfG/5CD9MRpjhDV3
	osuIHFjo=
X-Gm-Gg: AYBFou2EfLZFGOvXmy5VPz7HnaRJNoTOjdfunMduFEUEw0GKu6/WxR5VEYoT0eWHNjh
	cjoZVnQt43DswS+ajMO4EuiEax0SDhA2XafC3jWgg0zGmgM8K3glWDvmJ9ty4DezpBMlzcdrPPI
	j4UjOMWJGVElcSLAaS/eDBpAaZRXT3JPzsj3UZgodY0PSWaYeR6vULac+J0SKlsmWlK7/sqgodF
	TjONNP4Bu/tkRfymd9bcQ77oSsxQz9hAuo0ZwXj+yMb6kKs6Byrxp8l1KzeU4mkaeGkohoPKQho
	mneVyu+mAOOL5BP1ROp3SJptFliHwC7Sa6atUkqo7kfM3JL5iiQzZx4Co/7jEQHAXO9+fBTCZ6J
	46RYthEzwz77KGhSKcOiGQvKoiRMU2bSOdn67SrPdE64Mirw8SBravTnrWyXTNeP9b13B9t2xVd
	Tu/t+ns2tpVpQfLM2k0g1fS440civEwBnTwxo65dTvRO5RKHayMoBslpFG/rd9oesTkVokNxBO4
	ku+xCsTDFx2hCxi6vPX8089R6xUxXV081mc2+UGZfZ6+bE3XhLDjTAdhQ9Fog==
X-Received: by 2002:a05:600c:a013:b0:49d:2555:1a6d with SMTP id 5b1f17b1804b1-49fe66f1ac3mr19812845e9.16.1790233136721;
        Wed, 23 Sep 2026 23:58:56 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886876c1fdsm14245232f8f.14.2026.09.23.23.58.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 23:58:56 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 24 Sep 2026 08:58:56 +0200
Message-Id: <DLNCOL2DYWSG.25YF0NZK1F7GI@smile.fr>
Subject: Re: [OE-core][scarthgap][PATCH 2/3] curl: Security Fix for
 CVE-2026-18924
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <sdoshi@mvista.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260910083055.208955-1-sdoshi@mvista.com>
 <20260910083055.208955-2-sdoshi@mvista.com>
In-Reply-To: <20260910083055.208955-2-sdoshi@mvista.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Sep 2026 06:59:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246572

On Thu Sep 10, 2026 at 10:30 AM CEST, Siddharth Doshi via lists.openembedde=
d.org wrote:
> From: Siddharth Doshi <sdoshi@mvista.com>
>
> Picking patch as per [1], and same patch is mentioned in [2]
>
> [1] https://curl.se/docs/CVE-2026-18924.html
> [2] https://security-tracker.debian.org/tracker/CVE-2026-18924
>
> Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
> ---
>  .../curl/curl/CVE-2026-18924.patch            | 39 +++++++++++++++++++
>  meta/recipes-support/curl/curl_8.7.1.bb       |  1 +
>  2 files changed, 40 insertions(+)
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-18924.patch

Hello,

This was dropped from my review branch:
see https://lore.kernel.org/openembedded-core/cover.1790154074.git.yoann.co=
ngal@smile.fr/T/#m4f835129f23b0d8463c4fa282be5da86e94ef80c

Regards,
--=20
Yoann Congal
Smile ECS


