Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A23B8EDEC5E
	for <webhook@archiver.kernel.org>; Wed, 13 Sep 2023 14:28:16 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.13407.1694615291355208331
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Sep 2023 07:28:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TZt2U9L2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-403004a96eeso49426585e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 07:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1694615290; x=1695220090; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SvX2Ow9U4XL26KjOte0jYXIOY4G5Ty1dLgE+fEacNwc=;
        b=TZt2U9L2k/tE9qmT2bMdssfXax+a39BSXZ4PViirgJNoi0bHdF+0GWf9CEfIMBGf7e
         U0957kpCDuHTy1p21fZtPD8gcY5tFpkkwOzdx5BHntGr2mVy8yHcaUOhJQKtFDbimEz4
         kayJO9ATq0g90n0TmH+YyUBjV5ZBr6FFSVyDI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694615290; x=1695220090;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SvX2Ow9U4XL26KjOte0jYXIOY4G5Ty1dLgE+fEacNwc=;
        b=HZdMte45ZDNTklYCv4BoA+2bUQK9jkz2qa5sRrZsUGOIVymO/ataYJNQNIP9hRXtZX
         38S3YSjjAnTBeSYW6vRt8+M1TJmE99PM7ktKs6O7KKjc9p+vJvETVLerO1ushy12QpcC
         gRLWMM2yoJsu5Px7iC8J0HtGhpw4WU/VQR8U4hf0nSaCvgsr+/MRy1K9xDMkn+1eNbpG
         7SUyBwDL0xTG7UY9GV5ki0b1TP8eH9/ZF0TdA8uqfAMvdkRH7W+tbfuUTdxdVWHz2bTu
         M047vXBqHFZJBKJnOBSUSgVrZrGCNJitQV62iQlvid+EJLAjrL4eFXO1FTFDfTOEnwg+
         2+Mg==
X-Gm-Message-State: AOJu0YysGGvWOfpWDPaqkhEyV+Sl+wTleEvzHfIONark0ofZvq/QSuT0
	brWx1JQJBI9reYuRzOnlYYiRDQ==
X-Google-Smtp-Source: AGHT+IETMGtjta2Kav1dHK+0pwTeyxGdyS1Ce6WCc/aXZOV/Iom703/MhLFlT7QmNt5Flx2KSyUlsQ==
X-Received: by 2002:a05:600c:2317:b0:3fe:2e0d:b715 with SMTP id 23-20020a05600c231700b003fe2e0db715mr2195337wmo.18.1694615289628;
        Wed, 13 Sep 2023 07:28:09 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:2a8:4888:9029:4207? ([2001:8b0:aba:5f3c:2a8:4888:9029:4207])
        by smtp.gmail.com with ESMTPSA id v14-20020adfa1ce000000b0031c855d52efsm11119270wrv.87.2023.09.13.07.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 07:28:09 -0700 (PDT)
Message-ID: <d437f4536bc25e87832b709eceed8171e85e1550.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 16/17] build-sysroots.bb: run tasks one after
 the other
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Alexander Kanavin
	 <alex@linutronix.de>
Date: Wed, 13 Sep 2023 15:28:08 +0100
In-Reply-To: <17847A21058EFB28.17301@lists.openembedded.org>
References: <20230906165633.2382629-1-alex@linutronix.de>
	 <20230906165633.2382629-16-alex@linutronix.de>
	 <18264a59f21e43aed1138bc58ffdf2471c5ccc05.camel@linuxfoundation.org>
	 <CANNYZj_ptnLNvwPGDcAciok0bsE7Ctzww4WkAJmamgkCyB19CQ@mail.gmail.com>
	 <781c93976fbd19e146ab2626a6202a0ccb23ab82.camel@linuxfoundation.org>
	 <CANNYZj_RfCwHmt_TnUgdHeoTNdqMcX+f7aAzZ7e=MYSx+E-rXg@mail.gmail.com>
	 <02407d75fc40487431a84d18b60476552083b1ce.camel@linuxfoundation.org>
	 <CANNYZj_HBxGaz9c8X875fZ8rgPGD4MNCjv6mkANAiVZKD4vswg@mail.gmail.com>
	 <ffda1a9441f4d6e947bb6aa383f5a1e2e2e0d39b.camel@linuxfoundation.org>
	 <CANNYZj8zRk0SYzX-GYdwhSQGQidGrK1PT9mCH7LPeSp4ANERhg@mail.gmail.com>
	 <e4706c56b8faab51081682ec06f1de645306f82a.camel@linuxfoundation.org>
	 <CANNYZj8PfsZdgYjwUXEm2vy2wEqO2bksNSvDb02smLvMxiAoLw@mail.gmail.com>
	 <e1e5f66bf13da82c0a8d06a3479f4881bbbef7ee.camel@linuxfoundation.org>
	 <CANNYZj9NtRqy0NL_r5QR6fcVRqp_rMV2pW-jttRPjRHk3w3-WQ@mail.gmail.com>
	 <17847A21058EFB28.17301@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 14:28:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187594

On Wed, 2023-09-13 at 15:00 +0100, Richard Purdie via
lists.openembedded.org wrote:
> On Mon, 2023-09-11 at 17:19 +0200, Alexander Kanavin wrote:
> > On Thu, 7 Sept 2023 at 14:04, Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > > See meta/conf/distro/include/no-static-libs.inc which does things lik=
e:
> > >=20
> > > meta/conf/distro/include/no-static-libs.inc:DISABLE_STATIC:pn-openssl=
-native =3D ""
> > > meta/conf/distro/include/no-static-libs.inc:DISABLE_STATIC:pn-natives=
dk-openssl =3D ""
> > >=20
> > > I wasn't sure how easy the shadow patch would be, that is hopefully t=
he
> > > main tricky part. sqlite-native used to be built allowing static for
> > > pseudo iirc but I don't think we need to do that there any more.
> >=20
> > I poked around at passing options from the shadow recipe, but couldn't
> > arrive at a working combination. libtool and automake insert too many
> > abstraction layers on the way to the linker invocation.
> >=20
> > So there has to be a custom, most likely non-upstreamable patch for
> > Makefile.am files all over the place, which I think is worse than
> > manually unrolling setscene dependencies.
>=20
> I was curious to see if I could make anything work, the best I could
> come up with was this:
>=20
> diff --git a/meta/conf/distro/include/no-static-libs.inc b/meta/conf/dist=
ro/include/no-static-libs.inc
> index 75359928a14..312629f394c 100644
> --- a/meta/conf/distro/include/no-static-libs.inc
> +++ b/meta/conf/distro/include/no-static-libs.inc
> @@ -30,3 +30,8 @@ EXTRA_OECMAKE:append:pn-libjpeg-turbo-native =3D " -DEN=
ABLE_STATIC=3DFalse"
>  EXCONFIG_ARGS:append:pn-ncurses =3D " --without-normal"
>  EXCONFIG_ARGS:append:pn-ncurses-native =3D " --without-normal"
>  EXCONFIG_ARGS:append:pn-nativesdk-ncurses =3D " --without-normal"
> +
> +# Needed so we can statically link shadow-native tools
> +DISABLE_STATIC:pn-attr-native =3D ""
> +DISABLE_STATIC:pn-libbsd-native =3D ""
> +DISABLE_STATIC:pn-libmd-native =3D ""
> diff --git a/meta/recipes-extended/shadow/shadow_4.14.0.bb b/meta/recipes=
-extended/shadow/shadow_4.14.0.bb
> index 4e554463125..8cd916d01bd 100644
> --- a/meta/recipes-extended/shadow/shadow_4.14.0.bb
> +++ b/meta/recipes-extended/shadow/shadow_4.14.0.bb
> @@ -4,6 +4,14 @@ require shadow.inc
>  # libcrypt. This breaks chsh.
>  BUILD_LDFLAGS:append:class-target =3D " ${@bb.utils.contains('DISTRO_FEA=
TURES', 'pam', '-lcrypt', '', d)}"
> =20
> +# Force static linking of utilities so we can use from the sysroot/sstat=
e for useradd
> +# without worrying about the dependency libraries being available
> +do_compile:prepend:class-native () {
> +	sed -i -e 's#\(mode=3Dlink.*CCLD.\s*\)#\1-all-static #g' \
> +	       -e 's#\(LIBS.*-lbsd\)#\1 -lmd#g' \
> +	       -e 's#\(LIBBSD.*-lbsd\)#\1 -lmd#g' ${B}/*/Makefile
> +}
> +
>  BBCLASSEXTEND =3D "native nativesdk"
> =20
>  # https://bugzilla.redhat.com/show_bug.cgi?id=3D884658
>=20
> which isn't nice but probably isn't too bad to maintain and does give
> us the static tools.

Of course since this removes libc, pseudo no longer works and the
chroot calls inside shadow then fail. Which then brings us to:

+       sed -i -e 's#\(LIBS.*\)-lbsd#\1 ${STAGING_LIBDIR}/libbsd.a ${STAGIN=
G_LIBDIR}/libmd.a#g' \
+              -e 's#\(LIBBSD.*\)-lbsd#\1 ${STAGING_LIBDIR}/libbsd.a ${STAG=
ING_LIBDIR}/libmd.a#g' ${B}/*/Makefile

instead...

Cheers,

Richard

