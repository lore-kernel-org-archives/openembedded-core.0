Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55959E9D404
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 15:48:28 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23690.1770220104247355242
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Feb 2026 07:48:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=e+6OY11o;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-480142406b3so53003575e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 07:48:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1770220102; x=1770824902; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WcJ9TflpNoNNC/koMdBFFCGnBeVpbQA+e7h07Ay+sWI=;
        b=e+6OY11oYmrRlY2u+XDbPYOCGpH+0FPzJEf8x//IBYIXghAnCoOcLrPM4Pvj180GQt
         oQPYnCnPUBIK9aW2aKjAKQZ63fzThAXGhEtunU3IlB9XTdVHfqVOCGK+7nqop5mo5l4Z
         ypT8q3B7SyaNV9J6cNO62bnHFUHhE4j5ZN3aw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770220102; x=1770824902;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WcJ9TflpNoNNC/koMdBFFCGnBeVpbQA+e7h07Ay+sWI=;
        b=vyrHtxjuYKlEXsE3guP0tMT6zAh0tiuXN6OJsKIba5Gfd9HxIazXukmDhiNYLGuGbc
         /4fjIaZypDIgrZzktxBZlSQ1WrCt9/2WvCXmsV5ogToBRv9HzFQ/mId9cTYuiqX2XEby
         EqztWCjNMPo7eQwgfGfgu1rOTEKaYY+pryTF5dbJTR22MKhbVyc9OBPpVQlVdRhBrUfu
         FeAZGC55szz55kqof6iYKF/IeuUAtsHXO/PVMsEBAY3OXn9jM8GjOMPzFoYHFVqMqnop
         RaX71/iaKLH8DnsJKkZ4/psyb1KyP/WLh2Vx4nlGbEE4Q9Cy6itrtUsYU1e4b4tPIVs2
         Nn8g==
X-Forwarded-Encrypted: i=1; AJvYcCUZwoqLENfHncLSpAlAUhiFVq0r09iKFRtK/MNlxyS5zXYYl34xfwmHZGuH+a5s8YdExwPa7l15EfDnH0nqsD14Kg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx2uM3UK6XkMFS4Cwa0Ri7iAJ9eP6OM5N7z+lrU6aO4aKnd8yBh
	zpnei7Ibqc0pQtH7FyhiAKUCH3fGgEmOplewrkrkKMxUbOOL8xck7rttvCsmtHxap9Y=
X-Gm-Gg: AZuq6aIYfc1jWOv4UTEIMa1/aaM2U/TN8/cUS9uRvkRWaut9wx00n8gtJWIK9w2uuzU
	gqrqoYh8fn5IjAkl1EgY7/qVI+VDykMvqX8c68Gd3ZT/jnuaoRWDC/RFharbYYh3OSXIWCQ1GtJ
	umRHHBf6qe6R9KTeh+EvDF3LJnddzUaNlFiC+t9CRYlxwT0uccQr9nvNLvaqq9U4y5nPbh74Ngy
	JqwhSnAqHpvdUBeVCMPk/PS3F99tZ81+3RY1k9QfLp7C0Yrdoxa9t1DkB5lmhWQfJF5Y1AEmaYT
	6MkN8cA7CPrl7iFyyth2VA9fuMsrK9mx5039StYey4PiNbId9dxiJ3z6xHeqkGlMmy+3xdDUPHr
	NP0rdppxY627ShFslpuGCASUV1n2Uiy1ir8kXER4QyXupYiW/bBt1C/i3pmtcCJSqd/rcISXDm/
	cBOCoaJomVpyrCzTEBO4Wki2GUDuAPy2TQ3fma4lDeCQerSMBpbqiaBdr362NbZlAR3BjqB29eU
	a8=
X-Received: by 2002:a05:600c:4fcc:b0:480:1d0b:2d15 with SMTP id 5b1f17b1804b1-4830e9926c0mr50619345e9.27.1770220102571;
        Wed, 04 Feb 2026 07:48:22 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:ac04:f180:6f5c:7b1d? ([2001:8b0:aba:5f3c:ac04:f180:6f5c:7b1d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43617e25683sm7132202f8f.6.2026.02.04.07.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 07:48:21 -0800 (PST)
Message-ID: <31db3ad25183f3d6b7d31987c70d10c7181aef3a.camel@linuxfoundation.org>
Subject: Re: [OE-core] meson: buildtype flags get overriden by CFLAGS
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: kubiznak@2n.com, "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Wed, 04 Feb 2026 15:48:21 +0000
In-Reply-To: <DB4PR02MB10030DB96660867379C9C45C0E2B02@DB4PR02MB10030.eurprd02.prod.outlook.com>
References: 
	<DB4PR02MB10030DB96660867379C9C45C0E2B02@DB4PR02MB10030.eurprd02.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 15:48:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230549

On Tue, 2024-07-30 at 12:59 +0000, Petr Kubiz=C5=88=C3=A1k via
lists.openembedded.org wrote:
> I have issues with setting optimization flags in meson-built project.
>=20
> 1. In do_write_config task, meson.cross is generated with `c =3D ${CC}`
> and `c_args =3D ${CFLAGS}`.
> 2. In do_configure, meson setup is called with recipe-defined
> buildtype and generated meson.cross file.
> 3. In do_compile, compile commands are composed roughly as `$c
> <meson_flags> $c_args`, i.e. `${CC} <meson_flags> ${CFLAGS}`. Recipe-
> defined buildtype propagates as optimization flags into <meson_flags>
> (based on
> https://mesonbuild.com/Builtin-options.html#details-for-buildtype=C2=A0ma=
p
> ping).
>=20
> CFLAGS is composed of TARGET_CFLAGS, which is in turn composed of
> SELECTED_OPTIMIZATION, which equals either DEBUG_OPTIMIZATION ("-Og
> ${DEBUG_FLAGS} -pipe") or FULL_OPTIMIZATION ("-O2 -pipe
> ${DEBUG_FLAGS}"), based on value of DEBUG_BUILD. In any case, CFLAGS
> features optimization flags including -Ox.
>=20
> As a result, the -Oy flag in <meson_flags> does not have any effect
> because it is always overriden by ${CFLAGS}.
>=20
> Is it intentional that meson buildtype has in fact no effect? Or am I
> missing something?

I suspect most users would want OE's flags to win over meson's ideas on
which ones might apply so that doesn't seem unreasonable. We might want
to document that we effectively override the buildtype in the class
though?

Cheers,

Richard

