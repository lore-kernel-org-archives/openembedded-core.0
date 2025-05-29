Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6160CC54FB3
	for <webhook@archiver.kernel.org>; Thu, 29 May 2025 09:23:45 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.16817.1748510617264105413
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 May 2025 02:23:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fHG8COUo;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cfe574976so5780865e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 02:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1748510615; x=1749115415; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MhE0SUoytpbSvMLeXnRE8j935AxTH889rCwF96tgS7s=;
        b=fHG8COUotOxznnbPwOtUo9UEicAlOad8QczRBHS1hZ4tsEsy/pnbud/R7IrtNKQUsz
         rWZrfQ/gkjbgruRFB1BJXBGcRm+1RZetL5td+hJEr5l0utDPnPw0ep8hTevx58DZiuhp
         FrZm4l2l21HO+RaXvM0xAJTWEYf+oTMzVOojU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748510615; x=1749115415;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MhE0SUoytpbSvMLeXnRE8j935AxTH889rCwF96tgS7s=;
        b=UzAqOvEixrJdIEmz0YLL/OWHS+XUM5y69xbjAon50KVFitjW7aVi0uD3yOqiSd5UfW
         0OLh4m1qb0BD3HHT0ZUDEHmBAaNu1g22Xj6JonzRxBSSLSUROKcdMx19rDem3Rc6t25+
         3hSDaH6J1UKAmv08eHHNHoQK/mWrIbDOn0tX/zNz3TakqDYSiNWMJhgq+j6pKR3Wn2mm
         uCOUSdCglO4M/6klhNsy+xQ3X3ScABnVYZyNND8cnEfGqHygY4AsUXCNE4Tq6tv2U0YT
         00CRXkf3p/WrRgVcrUddiHOqMR7Hkjb8d+bl9h6MunLvit0NCsYYV+J0z5ObJgtlnISC
         Ve9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVdY4nDLEBx+NisgVyd024Ezg+cXTCPcLtORfmNVUVIphWjO1I3FjpBlPA7QQN+Ex28ESIGhp29DUw7mZHOA8jDMg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy/l7Vi2Qutxu7vrEi3YDjZO/dIF4RHaHeep8DCPZ8IpzOYP8/R
	t3SnDrmcfJNOn+TXQshUEu922MlX3uApy4XNbHOqercl6JOBzCeX1v84Vm4sivOxv5k=
X-Gm-Gg: ASbGncspglZvxc7M8Su9uSQNsgnibI8WRuo8ZZ3E/kEBJQb7587vk3yWhpvBxqgdsG9
	P5lxgJT2taLUhkQxhRJ+5SB/7cMkrENSGMHxo8sql9TBkzpndbOMCtrGx6nAVSxWB8VJFajl0rL
	9pGaiWU9gKIBcYTpRjS0se6bJ+obML86RQYLK2qGZJi61mTLkPq5cODD0OLf/++BrllWAtwO6Dg
	9YrWbQgBRi7mLiu7exdXYmZ3QHtDKBUZNLVTfWZFaNioG1DPJKH6UqDyEQ6T80hk5AUgrou2BfK
	1frV0UF2FnUKmwlsGIWSCQf/NBsu6wHEauKaKvho5xzgHYYIenAZ77uzicL3YGMAxX2rfND82jR
	yuG7R1H2iFUFNi2tGRCzHkBa/K5YX5wIhFQk=
X-Google-Smtp-Source: AGHT+IGzC51Edy5GO8MSinHgfH97XB2t07FVcYvDYEeTeYYGTWls2XyFQ4sqji6Q+C/XkutWH+EMRg==
X-Received: by 2002:a05:600c:5396:b0:43c:fe5e:f040 with SMTP id 5b1f17b1804b1-45077e36cc8mr47340615e9.23.1748510615545;
        Thu, 29 May 2025 02:23:35 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:1a5e:81:40ad:9da7? ([2001:8b0:aba:5f3c:1a5e:81:40ad:9da7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe6c91fsm1428557f8f.35.2025.05.29.02.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 02:23:34 -0700 (PDT)
Message-ID: <2b0c3c19b6800989d7ebdd1b693a54ac0e111b44.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3 07/13] pixman: Fix build with mips/clang
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: raj.khem@gmail.com, openembedded-core@lists.openembedded.org
Date: Thu, 29 May 2025 10:23:34 +0100
In-Reply-To: <20250522-clang-toolchain-v3-7-16cfc6d9891b@gmail.com>
References: <20250522-clang-toolchain-v3-0-16cfc6d9891b@gmail.com>
	 <20250522-clang-toolchain-v3-7-16cfc6d9891b@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 09:23:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217404

On Thu, 2025-05-22 at 20:52 -0700, Khem Raj via lists.openembedded.org wrot=
e:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> =C2=A0meta/recipes-graphics/xorg-lib/pixman_0.46.0.bb | 3 +++
> =C2=A01 file changed, 3 insertions(+)
>=20
> diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.46.0.bb b/meta/recip=
es-graphics/xorg-lib/pixman_0.46.0.bb
> index c1c71fd42023fbd8c82d49ff623a981139f5ac7e..0c779ac3b4e6d035d9105c98a=
ea0560a71d57ba3 100644
> --- a/meta/recipes-graphics/xorg-lib/pixman_0.46.0.bb
> +++ b/meta/recipes-graphics/xorg-lib/pixman_0.46.0.bb
> @@ -6,6 +6,7 @@ including trapezoids, triangles, and rectangles."
> =C2=A0HOMEPAGE =3D "http://www.pixman.org"
> =C2=A0SECTION =3D "x11/libs"
> =C2=A0DEPENDS =3D "zlib"
> +DEPENDS:append:toolchain-clang:mipsarch =3D " openmp"
> =C2=A0
> =C2=A0SRC_URI =3D "https://www.cairographics.org/releases/${BP}.tar.gz"
> =C2=A0SRC_URI[sha256sum] =3D "02d9ff7b8458ef61731c3d355f854bbf461fd0a4d35=
63c51f1c1c7b00638050d"
> @@ -38,6 +39,8 @@ EXTRA_OEMESON:append:armv7ve =3D "${@bb.utils.contains(=
"TUNE_FEATURES","neon","","
> =C2=A0
> =C2=A0EXTRA_OEMESON:append:class-native =3D " -Dopenmp=3Ddisabled"
> =C2=A0
> +CFLAGS:append:toolchain-clang:mipsarch =3D " -fno-integrated-as"
> +
> =C2=A0BBCLASSEXTEND =3D "native nativesdk"

See the comment on libjpeg-turbo. Should there be a -f here or not?

Cheers,

Richard



