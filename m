Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71966C5AD49
	for <webhook@archiver.kernel.org>; Thu, 29 May 2025 09:18:45 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.16760.1748510318968907935
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 May 2025 02:18:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OTtqFHIY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a4d877dfb3so700135f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 02:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1748510317; x=1749115117; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YNo4nJwy671hO5RoPsolCEWmTdFnx1rgnTGHaN19iaE=;
        b=OTtqFHIYkUQGIkSS+t0NmTuZmaEUDxyKKRLS9ZGfrqiTCepyreuuo31ZzpnNs4EbTs
         i3atCCQ+kieHuzLVMXMxInAcx6bejQUqwzsZwKYbbtsvmK9a8EwKoRQEBAtkYZAKaZfx
         ErsNj4ES38YTPVN+awiciTfW2QX3vd7eVvGvw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748510317; x=1749115117;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YNo4nJwy671hO5RoPsolCEWmTdFnx1rgnTGHaN19iaE=;
        b=HkmoXoRQv2ez31dBn6gNoDAL092g9y0Ne291BJmgfeXEyij2wPFfagReJje99aF5Aq
         vUOQmiyv8EDmYZUdGUHua8QIWcFvmK42RQ4dHrkbsnrG7UeyF+BNZmU74mOfjbRzz7O2
         AxyqsEuEnqOaEy5Qfl77rF7EKm9irAZclbqnrRC/7twP2BN57xKt9jJ4QFlWeEF+dDho
         FtF2McxlX+/siOzbl2FeCcZjxvsxykLiYii/HJiPatecL9ZGAJ4JQZ9PupXj7B7Q0ZNo
         dbhHrhPGxNhkKYjRPPeCCob5QhyVyqTdjVx8Z2Ek6+xC+tNG+kxKrzT7Rh+ht4l3YsSB
         CgdA==
X-Forwarded-Encrypted: i=1; AJvYcCWo5zFwNfAh8N7RIxonJr4KuP2D3teh9yvfvHB1wHXeWeNreRff4zDNISlt7byw+hxr2ickX1+XM1q4344Iur1IHw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyhqVoWMF7IdTK43cKFOcrytsp8w5zatMzueufmBjjX2VMkFnov
	i+I5A8KXjw25alTxpSv1/q/xdcfEXzGyOL7xYDlQLu/D21ysRyhXuSSjygpZS1dConQ=
X-Gm-Gg: ASbGncsKBA10mNc6ucFuutex7tgLQJSUXAqpOp2/vnQ4ikD8ggY1WpDxJfVnkHeTb9B
	2iWdlle6zNw5pQCD+0lXqqKr0WTRJ+LBVUCbwGFBZe7DFVo+lbLm3N/Xk09SGB0eoyE9Awx2GbL
	gnZ6lNG7KNA2Mw8Y1PoKfc1OMCa6zi170Qox5VJQ9UK02dF3oD1mm1SHcIklgiad0e5vdi7irr9
	Uoho7/Efmc8FeUAIEKMU7cwyF6hlHPaZ1jttyqObrFRv6POiG0wsPqDb0w2i8H/XcqT+MDuhMYS
	35sqsY+WQP7gH1AEH/ZhD1ajSDMDzj2Lwfmba4+wSbYXOuo5Rl9z0dWTrKfPfgXYNh1k5v8Rhng
	X0tViHhSDcrCI6WT+0H+2qF/UkyuMAoYdvOE=
X-Google-Smtp-Source: AGHT+IEBnZpqsqRaYvJ33LjT3pAp+uaftfa31JPs5V1AEWj1EgvmQ53zlw9OCCIdWpMLhPKZb4Gusw==
X-Received: by 2002:a05:6000:178b:b0:3a4:dfaa:df8f with SMTP id ffacd0b85a97d-3a4dfaae1e8mr8758523f8f.16.1748510317159;
        Thu, 29 May 2025 02:18:37 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:1a5e:81:40ad:9da7? ([2001:8b0:aba:5f3c:1a5e:81:40ad:9da7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f009745esm1386057f8f.71.2025.05.29.02.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 02:18:36 -0700 (PDT)
Message-ID: <052f4ddc8081195b753ca305eae99efb1a61f518.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 03/28] vte: Disable gi data generation when
 using clang on arm
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: raj.khem@gmail.com, openembedded-core@lists.openembedded.org
Date: Thu, 29 May 2025 10:18:35 +0100
In-Reply-To: <20250520-clang-toolchain-v2-3-db97c2eb3756@gmail.com>
References: <20250520-clang-toolchain-v2-0-db97c2eb3756@gmail.com>
	 <20250520-clang-toolchain-v2-3-db97c2eb3756@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 09:18:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217401

On Tue, 2025-05-20 at 23:19 -0700, Khem Raj via lists.openembedded.org wrot=
e:
> Fixes Qemu usermode crashes
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> =C2=A0meta/recipes-support/vte/vte_0.78.2.bb | 4 ++++
> =C2=A01 file changed, 4 insertions(+)
>=20
> diff --git a/meta/recipes-support/vte/vte_0.78.2.bb b/meta/recipes-suppor=
t/vte/vte_0.78.2.bb
> index 0593d16cd8678d010c240581138caf22f2908659..e37d59833cf3313bdb369f4e0=
957dfc5e3cb3ace 100644
> --- a/meta/recipes-support/vte/vte_0.78.2.bb
> +++ b/meta/recipes-support/vte/vte_0.78.2.bb
> @@ -26,6 +26,10 @@ SRC_URI[archive.sha256sum] =3D "35d7bcde07356846b4a128=
81c8e016705b70a9004a9082285e
> =C2=A0
> =C2=A0ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
> =C2=A0
> +# qemu usermode crashes when using clang as system compiler but works wi=
th gcc
> +# see https://patchwork.yoctoproject.org/project/oe-core/patch/202409232=
34336.3978188-1-raj.khem@gmail.com/
> +GI_DATA_ENABLED:pn-vte:toolchain-clang:armv7ve =3D "False"
> +
> =C2=A0EXTRA_OEMESON +=3D "${@bb.utils.contains('GI_DATA_ENABLED', 'True',=
 '-Dvapi=3Dtrue', '-Dvapi=3Dfalse', d)}"
> =C2=A0EXTRA_OEMESON:append =3D " ${@bb.utils.contains('GI_DATA_ENABLED', =
'False', '-Ddocs=3Dfalse', '', d)}"

I don't really want to regress a feature like like this in a very
specific target as it is just going to confuse people. We should
probably just force gcc until this gets resolved.

I'm also puzzled why some people can replicate and some can't. We need
therefore better data on this too.

As such I'm reluctant to merge due to the difference in features it
creates.

Cheers,

Richard

