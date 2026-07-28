Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A9C3C53219
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 12:06:39 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9965.1785240396823213267
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2026 05:06:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=DVgSQbpm;
 spf=pass (domain: smile.fr, ip: 209.85.221.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47f6609c657so1804288f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2026 05:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785240395; x=1785845195; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:cc:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=d7X/sEouX8AB7tb60KIM8PKleOirg3aVAQVTJeisY5o=;
        b=DVgSQbpm2V96qwDbsq0Jz+HUU4K37NljpDeHR6dkOiUFliMwAOgWlsqSkD3O4Uf5XI
         Y36bLfjHNJAPgc1kY43kLe1Lj4vfs3bTZ+f3eYFvBowYH+NZAXy4ZWWhnqeai6OVXEaS
         YF6dGSQ9X+8Jyq+F0giheRrIzG9gvytlCfrlk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785240395; x=1785845195;
        h=in-reply-to:references:subject:to:cc:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d7X/sEouX8AB7tb60KIM8PKleOirg3aVAQVTJeisY5o=;
        b=RKg7jsUJg84827A4OWUG4+TkDphYMbNwCKOZdASw/3DLwxslGKw+9XKfwdRh22q9yM
         mkiHdJU3UeJCermr9iuz1S3JBWtagxrc6GGE3HER2rqLZ+mLB1gPo4WHxyarxiav1nPF
         mv6J8wZu7Gl80TAJ0Fd/Gs07aN45bj3Rl6pKZLRHlkgjP8zTdDOZKrEiBAKiFCe+vB3Z
         t5s7G8cpJ+JP8ulaUcOAdmxvVNXuFeH8GmnugRbkpP9ju9fy0UTltxPp6gtRsnAQ8Ewp
         O3UufXWXJcgIfBlmV5ssmsJnMrjyRkj5gclH4cGMrL5+MLEHe3xt77mQlf9/A7OVUgAf
         NdhA==
X-Forwarded-Encrypted: i=1; AHgh+Ro5IPVut7Y8LPZzpAQ6vxNiZZTjwvkZtXttmhtose4OLQ75lPEBO0kylkvr0GQUwUqcmcFw86bvX4i+lavHk2Dnuw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw/PebEIaYKTySpomV+FEDLNFs3asPFz6tyg3KyuWAqDutWYJEK
	8KtHDrE6AuEV3FUmyG8WWAJ2GbJ+EWz7FHSmtAvFGYPSxu5VNAGSNVuUOTVHXjnwRSs=
X-Gm-Gg: AR+sD122DjgSKrvRYi83ygSmjsk+WJ+xWntgPr74Ykzuxyp9ccp7HqZanweaBQfZkvu
	vTL6n+uWGyNkSwbM8133CO+4W/IL+2Da3fOlVfNqWrwu/VJnWwEbIB9TprjhJ1qa3RfZMHawJ7N
	Mq0efg58QD9qUCh72epcBc024Syv8lBjKZsHd6VfxYX92ouLTWx4G0w+8TCak6O0Hl2/J0p5HI0
	hXkFjogUPM9b9BW3jpC74wo4nctHCenk3D3UezNNwiK4IkkCI9g09cX2uJpmDWbZSy2iXCCmwkf
	ErgtHI5+1oWCaImwRAiiJwkzVIzSvXTZT/tE/aT2TVwO5tMnU+MGmNSuuYgHh8Rw88TLj9M+dA2
	fUqpoLgp5iy/lr2rTQnDpgSySDozN4069X8DR76FKP+DBUnpon/81qAbnc4QWtRnH8GbF8F8wnh
	aVLikblg1CPJ2juWpEmvTNPWITdgWrkZXyc3ANHyyQOH2RSbZ7faQb/VRT53bClA==
X-Received: by 2002:a5d:584d:0:b0:461:a15f:6df4 with SMTP id ffacd0b85a97d-47fb1ea7d19mr2539593f8f.35.1785240394911;
        Tue, 28 Jul 2026 05:06:34 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85bb5a46sm57327028f8f.9.2026.07.28.05.06.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 05:06:34 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 28 Jul 2026 14:06:34 +0200
Message-Id: <DKA6WJ3DRSM1.15EVL7LBX6ZC0@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <miaoqing.pan@oss.qualcomm.com>, <gaole.zhang@oss.qualcomm.com>
To: <hangtian.zhu@oss.qualcomm.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [wrynose] wpa-supplicant: add PACKAGECONFIG controls
 for suiteb, wnm, and mbo
X-Mailer: aerc 0.20.0
References: <20260728090159.3864155-1-hangtian.zhu@oss.qualcomm.com>
In-Reply-To: <20260728090159.3864155-1-hangtian.zhu@oss.qualcomm.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2026 12:06:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242187

On Tue Jul 28, 2026 at 11:01 AM CEST, Hangtian Zhu via lists.openembedded.o=
rg wrote:
> Add optional PACKAGECONFIG entries for suiteb, wnm, and mbo and map
> these to the corresponding upstream build flags:
>
> - suiteb: enable CONFIG_SUITEB and CONFIG_SUITEB192 for
>   WPA-EAP-SUITE-B/WPA-EAP-SUITE-B-192 enterprise modes
> - wnm: enable CONFIG_WNM for IEEE 802.11v Wireless Network Management
> - mbo: enable CONFIG_MBO for Multi Band Operation extensions used with
>   BSS Transition Management
>
> Upstream hostap configuration keeps these as optional capabilities.
> Exposing them as PACKAGECONFIG options lets distros opt in for
> enterprise and roaming use cases without changing the default oe-core
> feature set.
>
> Signed-off-by: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>
> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit 38860938302e6167b1c890b75e808f3a4ff08805)
> ---
>  .../wpa-supplicant/wpa-supplicant_2.11.bb        | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)

Hello,

I'm sorry but PACKAGECONFIG adding new features are not acceptable per
stable policy. I recommend doing this in downstream layers.

Regards,
--=20
Yoann Congal
Smile ECS


