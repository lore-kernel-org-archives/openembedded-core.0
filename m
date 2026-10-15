Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5AB1CC6B3A
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 11:46:48 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37692.1792064802904139874
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 04:46:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dlK7Q6QR;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48c4be28b82so326555f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 04:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1792064801; x=1792669601; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=qlCehSl7ZrTy811Ojd4XyYHHM6sjjn9gfUpg/yGtqaE=;
        b=dlK7Q6QRJGtolPfEydFfkVgpTWzsieZiUiDH/ByW+w5o24feGTU3oqEgAyY7l6F+N5
         jt1NZc5buR5gWsFs+mDrvYHj6pIMdAEuA+iCx1Kd4UVGbg2vLUloYJnv9iPYjLXRwco4
         zJkqmvXJAatlfiaDTvezcA94DouLcG3zJjzxY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792064801; x=1792669601;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qlCehSl7ZrTy811Ojd4XyYHHM6sjjn9gfUpg/yGtqaE=;
        b=dFbxCKR9Yg+rDcT3+hkPr5mRDtMu73w0WVBOl/1nlehSKKJ6tsGi2YJ90pYk1CU/lr
         8VUvQmzL03/o83FPM4KZq+sjTdApioEQX6xoaoBCuvWF0u6ge9AROz35bFzUAUkdyygq
         PZBzxTtk2PSO+/D1Lp7jv5T2i5+auie+462L56QEDPETPF4T8LJ5CCRakEldJsp9lUXZ
         /0NuQTl9gL49YCljrwI9jZAp6Tzqvhk7wKpF6tsd3bwVsR2VwwtQvkysmydxQYuG7Jez
         ZZB6d9TMjvQUSZ+EnZAyO9OFoPQRgQOFifgEsuvKk2NKhPrE6DShTKUuzI5rtDOwC10X
         9Xpw==
X-Forwarded-Encrypted: i=1; AKwUvBy53BhuCGcH4lunTYCXeFaFd/N5gsbFSpz8ylmKUGB1JSnvubObGDsFWTPCcWOhHzUWUtZ7BaNgboNNLw/sDGWQ4Q==@lists.openembedded.org
X-Gm-Message-State: AFq9FYIaWhj3GH/+RCYaGCNJQnQV2RwyuW1tQEb6Ie6p3lQtxIiXO+pg
	jtOuQ8JvO3wlSvfNS7mXBrGNmmHR/qULpslUiFx8xO+4NQwZRjVccTyzVCgW1GKTrbk=
X-Gm-Gg: AYBFou2rxoI8cvuUsgT78njDXVpHwUGUf5zHiXTieArj9kqx/oGFHH4wlpGPU6G28gk
	box6EYoiX6igJysvqhNrMEVVqsTKLCZ4/0qY6T3UE9AW+KniQnuwBxQochdRZomsqdvI+EXjjIV
	w8qxJ6j9WkFrisw8Whuk77ks9tQ5vy5OJPL+JIWxA+HjXB66coAFk7dXQ165e7FlaqDs+Xs6w5t
	vKhQqNBwFGDSmzesdn7MwkYJJyb8BIetMZO4YVVkajP/eivssjFSSKaWr0sFAnxpXcDPTAkrE7z
	qLyiXgUlTxSsGddgcyTO3Pg38g6wHQvY6IUVEa5tCw9lZLeaPZqgHvmUFEVdyUMrON6FKBfaEn8
	nN40OyLZYA/kEVaFEYsIPqehOJl3BlVnsM7L/rdaclcvsEKgyFvwYmuObqkZdyoOOntrgVehFmf
	wppfWkRwHro6PC98HoAvw4eAOg2WuNiOj5O56yiNmF/06LAnGLSv5U98R2gGu0SuC4mLNoxcWtg
	0BQjhMN43UKG3w4noQ7Xpz+3zhAVvxsgzp5TcjJQzEWLU31vp6Bh5H27UFoXjg=
X-Received: by 2002:a05:600c:4685:b0:4a0:27eb:49b with SMTP id 5b1f17b1804b1-4a18e4ae6fcmr399623635e9.30.1792064800903;
        Thu, 15 Oct 2026 04:46:40 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:8627:1727:8a8a:57f5? ([2001:8b0:aba:5f3c:8627:1727:8a8a:57f5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bdbace19sm68403065e9.14.2026.10.15.04.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 04:46:40 -0700 (PDT)
Message-ID: <096790ccd54c920d4a235bd1a0d10c74d8931a7e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v5 1/3] classes/base: exclude
 __CACHED_SOURCE_DATE_EPOCH from task hash
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Daniel Turull <daniel.turull@ericsson.com>, 
 "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Cc: "JPEWhacker@gmail.com" <JPEWhacker@gmail.com>, 
 "mathieu.dubois-briand@bootlin.com"
	 <mathieu.dubois-briand@bootlin.com>
Date: Thu, 15 Oct 2026 12:46:39 +0100
In-Reply-To: <c94c04e26107cd68c66e7f5678dad7f176307678.camel@ericsson.com>
References: <20261012115319.1704048-1-daniel.turull@ericsson.com>
		 <20261012115319.1704048-2-daniel.turull@ericsson.com>
		 <f864589a2efc32e1b80429eb59016badac9ba25b.camel@linuxfoundation.org>
	 <c94c04e26107cd68c66e7f5678dad7f176307678.camel@ericsson.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 11:46:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247874

On Thu, 2026-10-15 at 10:46 +0000, Daniel Turull wrote:
> On Thu, 2026-10-15 at 11:16 +0100, Richard Purdie wrote:
> > On Mon, 2026-10-12 at 13:53 +0200, Daniel Turull via lists.openembedded=
.org wrote:
> > > From: Daniel Turull <daniel.turull@ericsson.com>
> > >=20
> > > epochfile_read() memoizes its result into __CACHED_SOURCE_DATE_EPOCH
> > > via d.setVar(), so its runtime value leaks into the basehash of any
> > > task that calls it, causing a "metadata is not deterministic" error
> > > once SDE_FILE is populated.
> > >=20
> > > Exclude it, since it is not meaningful build metadata.
> > >=20
> > > AI-Generated: Uses Kiro with Claude Sonnet 5
> > > Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
> > > ---
> > > This should fix the selftest errors reported by Mathieu
> > > ---
> > > =C2=A0meta/classes-global/base.bbclass | 4 ++++
> > > =C2=A01 file changed, 4 insertions(+)
> > >=20
> > > diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/b=
ase.bbclass
> > > index 9553f00432..01a030399e 100644
> > > --- a/meta/classes-global/base.bbclass
> > > +++ b/meta/classes-global/base.bbclass
> > > @@ -249,6 +249,10 @@ do_unpack[postfuncs] +=3D "create_source_date_ep=
och_stamp"
> > > =C2=A0def get_source_date_epoch_value(d):
> > > =C2=A0=C2=A0=C2=A0=C2=A0 return oe.reproducible.epochfile_read(d.getV=
ar('SDE_FILE'), d)
> > > =C2=A0
> > > +# epochfile_read() memoizes into this variable via d.setVar(), so it=
s
> > > +# runtime value must not leak into any task's hash.
> > > +oe.reproducible.epochfile_read[vardepsexclude] =3D "__CACHED_SOURCE_=
DATE_EPOCH"
> > > +
> > > =C2=A0def get_layers_branch_rev(d):
> > > =C2=A0=C2=A0=C2=A0=C2=A0 revisions =3D oe.buildcfg.get_layer_revision=
s(d)
> > > =C2=A0=C2=A0=C2=A0=C2=A0 layers_branch_rev =3D ["%-20s =3D \"%s:%s\""=
 % (r[1], r[2], r[3]) for r in revisions]
> >=20
> > This is the old syntax and is less maintainable. It can be done
> > alongside the actual function now, for example:
> >=20
> > meta/lib/oe/packagedata.py:@bb.parse.vardepsexclude("BB_NUMBER_THREADS"=
)
> >=20
> > Could you tweak and resend please?
>=20
> Sure. I'll send a v6 on the series. Beside this, is the autobuilder test
> passing?
>=20

The autobuilder tests passed, yes. I'd like Joshua's review on the
other patches before we merge though.

Cheers,

Richard

