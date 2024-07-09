Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 308E9C3DA41
	for <webhook@archiver.kernel.org>; Tue,  9 Jul 2024 10:38:09 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.9894.1720521484357795726
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jul 2024 03:38:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Wc3h4hZ2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52ea1a69624so5743925e87.1
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jul 2024 03:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1720521482; x=1721126282; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=smA/zS7iTz1xTK3bSF4GL3W3l2mMcc3euM5vu9X/zC4=;
        b=Wc3h4hZ24Fmi7bZzzyqFHslg10JEeIrLt8ZI4Z8BjBrTPimcyF+GdZHvkL1WtauZFl
         aqjykh7UB1CDd6urbdnwKIX1osGviObfBckvSkWlvy8U1vAktWrvdf+PQs8gBoHekQqN
         +KH+8Y5PviV2jx30i5eopzIW3Ju4M5wHkxxeY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720521482; x=1721126282;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=smA/zS7iTz1xTK3bSF4GL3W3l2mMcc3euM5vu9X/zC4=;
        b=G6lUW/99P7GuZvgGxVTYltUzt6AssXgj0Bj0g2CW6iN2p+rA5qb68Bg8wGHwmfb2Nj
         6pUoSxRLzfsKj4vty4k9VjXRghGBgFzxKAppDtznFsBYfu8ilecKNYbqS9v63VY4/Z+Q
         FHAr0E/XyFrt+G/YlW0+WOsFPn5r0FgBL2fQgVq/flF3Y9NYzwvwZHGu+6i+kmm0I2fa
         jtdEikZnwXcfxrbUQx5B85dEqEcY2J9OXDmHINqDYT4yJAK1YzdzHggx3ff91sO690oR
         VKWNStXmnvrLZN0Rm23BVAANOw1u2OEFmfCLZG/yQjKeHddLyCPJU89QhSz8W1BPSpkQ
         aefQ==
X-Forwarded-Encrypted: i=1; AJvYcCXB1dZROXZ9DP50FzdCQcfuD43KRtkOFdmMYokJwNeR0sEC7VURygXycE2nHxrQrJQk2ON2i4dd9gNk58u3Z3gPKhZJJO95c3r6f4JGoLRNXsMeq7SFrewU
X-Gm-Message-State: AOJu0Yyi5UKySff5RZUCDK/iJQYHRY2Aghm8XEwqxDVVwKaEXM7ru5eb
	YBq2NnPzcRiaCs2wF+dGQ0pP3bmaVCqpFdhtFwwvoZZb7sF8sXK+v4KuQli9dIg=
X-Google-Smtp-Source: AGHT+IEpCbZsIIpUG4Url6tWwpjHB1kGofcdJ4M+CdyAQhIXj4iu4OLyeMVvhOomUEKcTvqYB8kqIw==
X-Received: by 2002:a05:6512:1396:b0:52c:d626:77aa with SMTP id 2adb3069b0e04-52eb99d3dd2mr1301918e87.58.1720521482528;
        Tue, 09 Jul 2024 03:38:02 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:eb12:75be:8387:683a? ([2001:8b0:aba:5f3c:eb12:75be:8387:683a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4266f6f1d51sm33731375e9.17.2024.07.09.03.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 03:38:02 -0700 (PDT)
Message-ID: <b53e107f63f55072c08bebef4dce6e16065c4ed6.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] icu: fix make-icudata package config
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: S.Mueller-Klieser@phytec.de, openembedded-core@lists.openembedded.org
Date: Tue, 09 Jul 2024 11:38:01 +0100
In-Reply-To: <20240709062539.4581-1-s.mueller-klieser@phytec.de>
References: <20240709062539.4581-1-s.mueller-klieser@phytec.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jul 2024 10:38:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201653

On Tue, 2024-07-09 at 08:25 +0200, Stefan Mueller-Klieser via lists.openemb=
edded.org wrote:
> The location of files changed during unpackdir transition. Adapt dirs
> to fix custom icu data generation.
>=20
> Signed-off-by: Stefan M=C3=BCller-Klieser <s.mueller-klieser@phytec.de>
> ---
> =C2=A0meta/recipes-support/icu/icu_75-1.bb | 4 ++--
> =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-support/icu/icu_75-1.bb b/meta/recipes-support/=
icu/icu_75-1.bb
> index 14fbf31de5..27fe392e4d 100644
> --- a/meta/recipes-support/icu/icu_75-1.bb
> +++ b/meta/recipes-support/icu/icu_75-1.bb
> @@ -126,7 +126,7 @@ do_make_icudata:class-target () {
> =C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('PACKAGECONFIG', 'make-icud=
ata', '', 'exit 0', d)}
> =C2=A0=C2=A0=C2=A0=C2=A0 cd ${S}
> =C2=A0=C2=A0=C2=A0=C2=A0 rm -rf data
> -=C2=A0=C2=A0=C2=A0 cp -a ${WORKDIR}/data .
> +=C2=A0=C2=A0=C2=A0 cp -a ${UNPACKDIR}/data .
> =C2=A0=C2=A0=C2=A0=C2=A0 AR=3D'${BUILD_AR}' \
> =C2=A0=C2=A0=C2=A0=C2=A0 CC=3D'${BUILD_CC}' \
> =C2=A0=C2=A0=C2=A0=C2=A0 CPP=3D'${BUILD_CPP}' \
> @@ -136,7 +136,7 @@ do_make_icudata:class-target () {
> =C2=A0=C2=A0=C2=A0=C2=A0 CPPFLAGS=3D'${BUILD_CPPFLAGS}' \
> =C2=A0=C2=A0=C2=A0=C2=A0 CXXFLAGS=3D'${BUILD_CXXFLAGS}' \
> =C2=A0=C2=A0=C2=A0=C2=A0 LDFLAGS=3D'${BUILD_LDFLAGS}' \
> -=C2=A0=C2=A0=C2=A0 ICU_DATA_FILTER_FILE=3D${WORKDIR}/filter.json \
> +=C2=A0=C2=A0=C2=A0 ICU_DATA_FILTER_FILE=3D${UNPACKDIR}/filter.json \
> =C2=A0=C2=A0=C2=A0=C2=A0 ./runConfigureICU Linux --with-data-packaging=3D=
archive
> =C2=A0=C2=A0=C2=A0=C2=A0 oe_runmake
> =C2=A0=C2=A0=C2=A0=C2=A0 install -Dm644 ${S}/data/out/icudt${ICU_MAJOR_VE=
R}l.dat ${S}/data/in/icudt${ICU_MAJOR_VER}l.dat
>=20

Thanks for the fix. Are there any tests we should add to detect problems ea=
rlier in future?

Cheers,

Richard

