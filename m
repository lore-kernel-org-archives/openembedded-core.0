Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25251C00523
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 15:22:53 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.42710.1695223371137702548
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Sep 2023 08:22:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=S6oRfGYA;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3214d4ecd39so3414587f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 08:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1695223369; x=1695828169; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bnwpQOqqTD4cNKzy8eNEc0bLddhyamcXTtSUNv/+xK0=;
        b=S6oRfGYA/FxuFECMGnwPqUTxD/jSeX7d+oj2LZ1JTSMnByRfrd0zIxnw2pYLjBHc9D
         HMpc5Lim1qhOQFnpWXt4JMnIdWpfHIEYJ99j1kWBQy1DA4pUkfarw8fayet0XbkfQvEy
         D5q1ZwZlvsymEQjalgRUd8sA0k7ASERbHfZCc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695223369; x=1695828169;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bnwpQOqqTD4cNKzy8eNEc0bLddhyamcXTtSUNv/+xK0=;
        b=o+hDe5vjqhzybZLnGD1XXcmW5V3ofvH76cLtjF2AgtxALgqhDGy6fx9B+uDk5do+br
         77w1rfhC0vGWNPZ7wj/PFG/OHqrJ3JvOcRnnF6ytobseZE/CYlNwXv2bkJY+WJCyppzz
         j8dMx9J5BV1ZiL2scUvRGAyyQCckU8PP+THafNxdU2cR2zxRItcr0JHTy4YcIZB+jGU0
         ytDySx6QIlLxyFxOUxIvP/iRESDGhexfbszU6O9929pxQiC9QF+VGxc6L0aCpeAtuuPR
         9KVkreLzJXpxliKBFcb93DpVkkvmyy5rOXfETwh3yh2wBtz/CepQFx2DT8WrrrcONN5R
         ioaQ==
X-Gm-Message-State: AOJu0YxoVD+SKL8oYuRzVCaHiga20qz77Z9ed7OUaGWVGwq/yJKHNJPb
	xR7XsViZN/yFqcmLS0tDtljVrg==
X-Google-Smtp-Source: AGHT+IE9USP+GHeX411ksg1la167vytumNrHrPWIXLA8OZNFj4YvlxSqbtyRdYd21A/bVlqQ9FCugw==
X-Received: by 2002:a5d:660f:0:b0:317:df3a:d030 with SMTP id n15-20020a5d660f000000b00317df3ad030mr2614050wru.14.1695223369403;
        Wed, 20 Sep 2023 08:22:49 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:34a6:a1c2:97a:851d? ([2001:8b0:aba:5f3c:34a6:a1c2:97a:851d])
        by smtp.gmail.com with ESMTPSA id cp43-20020a056000402b00b003217af3f530sm1320403wrb.0.2023.09.20.08.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 08:22:48 -0700 (PDT)
Message-ID: <ec346e04b25d09c7a68cbcfe3606424e09ddb29a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] gettext: Disable error_at_line detection for
 musl
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 20 Sep 2023 16:22:47 +0100
In-Reply-To: <CAMKF1sqSqdU-1Ndw-+UGd==Q4S3vZuG3i9wPuVN7YwF0JWmMXg@mail.gmail.com>
References: <20230920054733.2852549-1-raj.khem@gmail.com>
	 <4b37b846473fdd68aba377018638086590307722.camel@linuxfoundation.org>
	 <CAMKF1sqSqdU-1Ndw-+UGd==Q4S3vZuG3i9wPuVN7YwF0JWmMXg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 15:22:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187929

On Wed, 2023-09-20 at 07:46 -0700, Khem Raj wrote:
>=20
>=20
> On Wed, Sep 20, 2023 at 12:54 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Tue, 2023-09-19 at 22:47 -0700, Khem Raj wrote:
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > ---
> > > =C2=A0 meta/recipes-core/gettext/gettext_0.22.bb | 1 +
> > > =C2=A0 1 file changed, 1 insertion(+)
> > >=20
> > > diff --git a/meta/recipes-core/gettext/gettext_0.22.bb
> > > b/meta/recipes-core/gettext/gettext_0.22.bb
> > > index f5290ac0e44..91db6627748 100644
> > > --- a/meta/recipes-core/gettext/gettext_0.22.bb
> > > +++ b/meta/recipes-core/gettext/gettext_0.22.bb
> > > @@ -53,6 +53,7 @@ EXTRA_OECONF:append:class-target =3D " \
> > > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
gt_cv_locale_de_utf8=3Dde_DE \
> > > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
gt_cv_locale_de=3Dde_DE.ISO-8859-1 \
> > > =C2=A0 "
> > > +EXTRA_OECONF:append:libc-musl =3D " ac_cv_lib_error_at_line=3Dno"
> > > =C2=A0=20
> > > =C2=A0 PACKAGECONFIG ??=3D "croco glib libxml"
> > > =C2=A0 PACKAGECONFIG:class-native =3D ""
> >=20
> > Is this something which should be in the musl site file?
> >=20
>=20
>=20
> I was thinking on same lines but then I wanted to see how many
> packages would need it. It seems it=E2=80=99s packaged using gnulib that =
need
> it but then not all. Adding to site files is a bigger hammer I want
> to see the length and breadth of its impact=C2=A0
>=20
> I will refactor the bsd-headers patch to keep the error.h a bit more
>=20

I think the site file does make more sense for this.

Given I know you heard my comments yesterday about stabilising for
release, if you're going to send "test" changes like this could you
please at least note that in the commit message?=C2=A0

I really could do without debugging things for people at this point in
the release cycle.

Cheers,

Richard

