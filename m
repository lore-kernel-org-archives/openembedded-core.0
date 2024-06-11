Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DC40C27C5E
	for <webhook@archiver.kernel.org>; Tue, 11 Jun 2024 09:23:45 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.5245.1718097819551720785
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jun 2024 02:23:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HPdiG9NY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-42249a4f9e4so3926665e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Jun 2024 02:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1718097818; x=1718702618; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sVEHAJ9EiGu+IOC/vgcNRTTCmZOOtBHoNHVHSqrcOMc=;
        b=HPdiG9NYFT/4OOfHv+CEHL6iKkIBwzCtuLyh/ohSvt+2OJe4PPeAsXSfn5z/ePgn44
         LnSAqDSIhEzN6p8MmG3M4cixGme2eF35sbbIoaHKhW36NkdWIbzRLdJ23nLLltR6LTmt
         +Vu4DAvAdII86R3uqYXAD32F8Gg3ThB8kBnOs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718097818; x=1718702618;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sVEHAJ9EiGu+IOC/vgcNRTTCmZOOtBHoNHVHSqrcOMc=;
        b=oxn0Pe/mPXgyp/+y4AuXQoWU+l6OS9c1gm+tMyrn8qihH/7kEXt2g5x2+719q/+O5J
         r/o+/Dd389kO7ZOdHTGD8ITzwaslecT0sAZ0AH+pUm5ljr8yiQOJAuGzZ95T+dJhwbv+
         A1c8s5g2F8KID24eLdYP5uFvP8uRG8MMlXDl7YMtlSAnqRN+gfiEqRNAS8Gc0/tdrVAO
         gehsq5EWBv97Jv+W7/n32/sG/1I84uKv4z1UDU0RWO3c1E8Y7fZkunRWnXnloVq56MOw
         fSvqiiJkbMVVY36ZiZD23wqLLGxK3WaMO0QaGJG99AbTuZMyx2WLpci8W6bnwc2LkXdP
         Vqkg==
X-Forwarded-Encrypted: i=1; AJvYcCUCWIxTYUYJeRqhgVpquXx9Vys+OygwIp9KA+3T21NGkbYpWRFDWdmSWVQOmL2BdRClSi1QbzuwQtIQdgcg5/F2rQeg8peVzqbZZnyXG7nRSuJi8ht+5N2r
X-Gm-Message-State: AOJu0YxvT5FM3KyoqWz+Y36JK6KXOojI9nEk2yecn0qqcfWEB85j5u7o
	ZAy3jKxh3y9M/OhpDhlCJMKEhE5AIQpySARRekThHvE+x3uxtjco4cjY6xjc3/4=
X-Google-Smtp-Source: AGHT+IHwl7VJbNUfd6y+tjkrA+tsHR5HIYmk3+MrfdjM4PcSfww43zMIpy2PX23Zl9JzIq+ObvOG+Q==
X-Received: by 2002:a5d:5887:0:b0:35f:21a5:510b with SMTP id ffacd0b85a97d-35f21a5517cmr5134824f8f.4.1718097817697;
        Tue, 11 Jun 2024 02:23:37 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:d58d:9b4d:d265:3c2e? ([2001:8b0:aba:5f3c:d58d:9b4d:d265:3c2e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35f2b46332esm1866348f8f.73.2024.06.11.02.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 02:23:37 -0700 (PDT)
Message-ID: <55dfaabcdf802dc7fc114346f445e1b587cbf468.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH v4][PATCH] libbsd: Fix conflict error when
 enable multilib.
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: leimaohui@fujitsu.com, openembedded-core@lists.openembedded.org
Date: Tue, 11 Jun 2024 10:23:36 +0100
In-Reply-To: <20240430082706.51856-1-leimaohui@fujitsu.com>
References: <20240430082706.51856-1-leimaohui@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jun 2024 09:23:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200496

On Tue, 2024-04-30 at 16:27 +0800, leimaohui via lists.openembedded.org wro=
te:
> From: Lei Maohui <leimaohui@fujitsu.com>
>=20
> - Fix the conflict error by oe_multilib_header. The conflict error is as =
the following:
> Error: Transaction test error:
> =C2=A0 file /usr/include/bsd/sys/cdefs.h conflicts between attempted inst=
alls of libbsd-dev-0.12.1-r0.core2_64 and lib32-libbsd-dev-0.12.1-r0.core2_=
32
>=20
> The difference of bsd/sys/cdefs.h between libbsd-dev and lib32-libbsd-dev=
 is as following:
>=20
> =C2=A0/* Define the ABI for the current system. */
> =C2=A0-#define LIBBSD_SYS_TIME_BITS 64
> =C2=A0+#define LIBBSD_SYS_TIME_BITS 32
> =C2=A0#define LIBBSD_SYS_HAS_TIME64 1
>=20
> - After oe_multilib_header on cdefs.h, the path of cdefs-64.h and cdefs-3=
2.h in cdefs.h need to be corrected for overlay-mode. Please reference to h=
ttps://man.archlinux.org/man/libbsd.7=C2=A0for details.
> =C2=A0 @@ -12,19 +12,19 @@
> =C2=A0#ifdef _MIPS_SIM
>=20
> =C2=A0#if _MIPS_SIM =3D=3D _ABIO32
> -#include <bsd/sys/cdefs-32.h>
> +#include <sys/cdefs-32.h>
> =C2=A0#elif _MIPS_SIM =3D=3D _ABIN32
> -#include <bsd/sys/cdefs-n32.h>
> +#include <sys/cdefs-n32.h>
> =C2=A0#else
> =C2=A0#error "Unknown _MIPS_SIM"
> =C2=A0#endif
>=20
> =C2=A0#else /* _MIPS_SIM is not defined */
> -#include <bsd/sys/cdefs-32.h>
> +#include <sys/cdefs-32.h>
> =C2=A0#endif
>=20
> =C2=A0#elif __WORDSIZE =3D=3D 64
> -#include <bsd/sys/cdefs-64.h>
> +#include <sys/cdefs-64.h>
> =C2=A0#else
> =C2=A0#error "Unknown __WORDSIZE detected"
> =C2=A0#endif /* matches #if __WORDSIZE =3D=3D 32 */
>=20
> Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
> ---
> =C2=A0meta/recipes-support/libbsd/libbsd_0.12.2.bb | 10 +++++++++-
> =C2=A01 file changed, 9 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-support/libbsd/libbsd_0.12.2.bb b/meta/recipes-=
support/libbsd/libbsd_0.12.2.bb
> index 7d5e88f293..1791d97dfd 100644
> --- a/meta/recipes-support/libbsd/libbsd_0.12.2.bb
> +++ b/meta/recipes-support/libbsd/libbsd_0.12.2.bb
> @@ -40,8 +40,16 @@ SRC_URI =3D "https://libbsd.freedesktop.org/releases/$=
{BPN}-${PV}.tar.xz"
> =C2=A0
> =C2=A0SRC_URI[sha256sum] =3D "b88cc9163d0c652aaf39a99991d974ddba1c3a9711d=
b8f1b5838af2a14731014"
> =C2=A0
> -inherit autotools pkgconfig
> +inherit autotools pkgconfig multilib_header
> =C2=A0
> =C2=A0DEPENDS +=3D "libmd"
> =C2=A0
> +do_install:append () {
> +=C2=A0=C2=A0 oe_multilib_header bsd/sys/cdefs.h
> +=C2=A0=C2=A0 # It hasn't been tested when libbsd is used in 'namespaced =
headers' mode according to
> +=C2=A0=C2=A0 # https://man.archlinux.org/man/libbsd.7.
> +=C2=A0=C2=A0 sed -i 's:#include <bsd/sys/cdefs:#include <sys/cdefs:g' ${=
D}${includedir}/bsd/sys/cdefs.h
> +}
> +
> +
> =C2=A0BBCLASSEXTEND =3D "native nativesdk"

Firstly, I know several of us are not convinced this is the right thing
to do. We've not been able to easily describe why we're uneasy about
it. We did do some wider testing with this patch and it causes several
errors in meta-openembedeed:

https://errors.yoctoproject.org/Errors/Build/186567/

so we can't merge something with this approach.

We really do need to stick with the way upstream use their code.

Cheers,

Richard



