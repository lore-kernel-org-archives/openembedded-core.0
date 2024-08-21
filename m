Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6891EC5321D
	for <webhook@archiver.kernel.org>; Wed, 21 Aug 2024 15:47:25 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.23306.1724255238012496623
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Aug 2024 08:47:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AaGm2IyY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4281ca54fd3so55727065e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Aug 2024 08:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1724255236; x=1724860036; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VMlCdc6G/yaA3GaEhL9m40TBzOL13O8x3BzGjLhA6Zs=;
        b=AaGm2IyYUTE0CXh7ICkmWZr2lqiSFfJAxmVvOLVjJJfeozlah7bkOHxDMSFLAnihko
         Rsw+8vlXNqBvPilnANPtJBXv8gAcCBtVMMSx6ihhEVI95QH+tY2y+IjUWzk3HBZ3vL5B
         l3BS3KWYNDe4yVElyAM0eSRdavjZrgmXcXxsM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724255236; x=1724860036;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VMlCdc6G/yaA3GaEhL9m40TBzOL13O8x3BzGjLhA6Zs=;
        b=HXGAjvSRVTUG4V1NKKpjcJRJHdvGgfiwalr8iUaK9BQdiFzwFuUAiCKQHDadmuLiZM
         W1tGsVt3/fMhLloC7Utk3RHlJLQVu12ajkPKUbU9+XRKD+ivZRE6D7ydacd+GO22wgYi
         vlLZ4UATJtt2lPGYnYnjcKl7aGQA4FQDqY+Sqcnl8XNjKRGjHqn/QrGu/lY8xPwP6Z9M
         nFmAYGtHdvy+7Cyj+AJkx1QdxKTBSa+wA4hPZGhiCZHsKWv4ujxLqiZDKr7lxb+wUS5P
         aXxEBYecFNnPJB6abfHDJ+52Eb03BaX36tD2XPJAsTNKgafpzar8+600t1r3ZkegkKxo
         L4jg==
X-Gm-Message-State: AOJu0Yzc/9nrZFCPaim726NPHa85ispdzSPI936JXv2eJGv7EaEqHLWj
	e0qnkXoxxdtnd3F3rAyAqsykD59IAGtUUyOpJ5K7F3RxyB4IFCJoD8ImD4QY6Ag=
X-Google-Smtp-Source: AGHT+IEZfHRRL6kZ4dkxhfV8cpGBapFd3KQiRjVYnBkx3h3Z86wGOE7TGvrQ2Z1ckyyVmyCUn9PokQ==
X-Received: by 2002:a05:6000:1e8c:b0:36b:a404:500b with SMTP id ffacd0b85a97d-372fd7310a2mr1441210f8f.51.1724255236078;
        Wed, 21 Aug 2024 08:47:16 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e724:d651:c8f9:e43? ([2001:8b0:aba:5f3c:e724:d651:c8f9:e43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3718985a3b9sm16016267f8f.56.2024.08.21.08.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 08:47:15 -0700 (PDT)
Message-ID: <ffa10f3c63eddb94f5c43d74f92e742e97339c09.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] cve-check: disable the text format by default
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Marta Rybczynska <rybczynska@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Marta Rybczynska
	 <marta.rybczynska@ygreky.com>
Date: Wed, 21 Aug 2024 16:47:14 +0100
In-Reply-To: <CAApg2=Q13RRBn3Xg3j3w-P8B-9WMgtyD=RRexmetYwuV0y=gdA@mail.gmail.com>
References: <20240821051721.70558-1-marta.rybczynska@ygreky.com>
	 <c1d1e39a3ef77428e273ecaed59ef1406869dd38.camel@linuxfoundation.org>
	 <CAApg2=Q13RRBn3Xg3j3w-P8B-9WMgtyD=RRexmetYwuV0y=gdA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Aug 2024 15:47:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203609

On Wed, 2024-08-21 at 11:43 +0200, Marta Rybczynska wrote:
>=20
>=20
> On Wed, Aug 21, 2024 at 10:58=E2=80=AFAM Richard Purdie <richard.purdie@l=
inuxfoundation.org> wrote:
> > On Wed, 2024-08-21 at 07:17 +0200, Marta Rybczynska via lists.openembed=
ded.org wrote:
> > > The cve-check JSON format has been present for a long time now,
> > > and this is a moment to disable the TEXT output.
> > >=20
> > > The JSON format is easier to parse by automatic tools, so users
> > > should have migrated already.
> > >=20
> > > Signed-off-by: Marta Rybczynska <marta.rybczynska@ygreky.com>
> > > ---
> > > =C2=A0meta/classes/cve-check.bbclass | 2 +-
> > > =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> > >=20
> > > diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.=
bbclass
> > > index 0d7c8a5835..41f2b8304f 100644
> > > --- a/meta/classes/cve-check.bbclass
> > > +++ b/meta/classes/cve-check.bbclass
> > > @@ -61,7 +61,7 @@ CVE_CHECK_REPORT_PATCHED ??=3D "1"
> > > =C2=A0CVE_CHECK_SHOW_WARNINGS ??=3D "1"
> > > =C2=A0
> > > =C2=A0# Provide text output
> > > -CVE_CHECK_FORMAT_TEXT ??=3D "1"
> > > +CVE_CHECK_FORMAT_TEXT ??=3D "0"
> > > =C2=A0
> > > =C2=A0# Provide JSON output
> > > =C2=A0CVE_CHECK_FORMAT_JSON ??=3D "1"
> >=20
> > I'm wondering if we should remove this at this point? I'd prefer the
> > build generated machine readable data and then external tools can be
> > used to create text based reports of that if/as/where needed rather
> > than complicate the code class code with potentially many different
> > report formats...
> >=20
> > Do we have a tool which can generate a text report from the json?
>=20
> I want to remove it :)
>=20
> But I also adhere to good practices of deprecating first, removing later.
>=20
> I do have a conversion script, so we can ask people to use it if they wan=
t
> the old format. The question is if people really still use it.=20
>=20
> The removal is a little more complex, because there are some dependencies
> between variables. We did it in the yocto-vex-tool code, and it took a li=
ttle time.
>=20
> There will also be a bigger cleanup in the docs when the removal happens.=
..
>=20
> So, no strong opinion from my side. However, given that the freeze is rea=
lly soon,
> deprecation looks like a minimum target.

Deprecation is definitely an option.=C2=A0

Given where we are with releases (just had an LTS and are in a position
to break things a bit more), if we could get this sorted before next
week (and feature freeze), I'd take something removing this. The timing
seems appropriate from the perspective that we're about to change the
tooling around this all quite a bit so we may as well given people a
clear path in the direction we're going.

Cheers,

Richard



