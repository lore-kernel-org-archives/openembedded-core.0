Return-Path: <trini@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 193C2EB64DD
	for <webhook@archiver.kernel.org>; Sun, 16 Jul 2023 17:21:05 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
 by mx.groups.io with SMTP id smtpd.web10.1865.1689528055924123544
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Jul 2023 10:20:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@konsulko.com header.s=google header.b=cIEqXmho;
 spf=pass (domain: konsulko.com, ip: 209.85.219.173, mailfrom: trini@konsulko.com)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-cc7863e7b82so1740126276.0
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Jul 2023 10:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1689528055; x=1692120055;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kDFgjJSJlFhPndFxKzCv6hhomOhu0dknYs1xRqmnRqQ=;
        b=cIEqXmhoUNDaIuru1T6ozGcyLxCBsNAjda+d4aJULt0n0ZKpTlhdtb5IbQ8CZVO6B9
         Vv6sAufs3O9rVjTb+99vQBQi3DxfcbZICZ6shjqExeoO5+SftrhOvQU1eGRefMayE5KV
         hNybMxIhv5JaCvRGrUGg+o57HMkndCXeSXj9I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689528055; x=1692120055;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kDFgjJSJlFhPndFxKzCv6hhomOhu0dknYs1xRqmnRqQ=;
        b=XLniJ+jU4V+4cqpYVT2HH7Y4U9y135yXQSwBcPvQigNR8HLSeS19k81tLCbB8bsKAi
         xzlNcsKIaN1w10dasThRBKB5WP6/H4HjX7Hf9QcZWGn7ZH6LaasIWcSlgYDtR16OUG8S
         6XuYpe3xXSzZqIB8b22t9RrD55WRV4DXDNtL309B6lS+bpkFMmwJHkVgYV29UIJCGzgE
         sIDUAUkRDrLqbHpOae+HS7Bcr0IOhe47PvwMB0OiGu6xH+OlauvmIut1wf72arIeNIRC
         XrDuAKpmmaXT9/sp+YATFytCs8ZAH3MNJhmiUc6ufhNXtIpIHsDlADVkgjxvjTaDezJv
         8Eig==
X-Gm-Message-State: ABy/qLbMoZOlx03vYc5N7jXv+WSLdTul0uQlDa8GQksNehIEPmhKqHv3
	PhP7WZMosbU+Xo1g4dFsEuNfNw==
X-Google-Smtp-Source: APBJJlF0RJpoP0n3uk0R9sJIJJhQJLw7/gTZIYrkI5L93f0TPRDfVqm9GP1ebGjaJ4kNe4GED6Grgg==
X-Received: by 2002:a5b:a4b:0:b0:c5e:fa62:ed3a with SMTP id z11-20020a5b0a4b000000b00c5efa62ed3amr10045633ybq.40.1689528055055;
        Sun, 16 Jul 2023 10:20:55 -0700 (PDT)
Received: from bill-the-cat (2603-6081-7b00-6400-5e84-cf0c-0c9a-a3e2.res6.spectrum.com. [2603:6081:7b00:6400:5e84:cf0c:c9a:a3e2])
        by smtp.gmail.com with ESMTPSA id s13-20020a25770d000000b00cac77619455sm1779493ybc.61.2023.07.16.10.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Jul 2023 10:20:54 -0700 (PDT)
Date: Sun, 16 Jul 2023 13:20:52 -0400
From: Tom Rini <trini@konsulko.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Marek Vasut <marex@denx.de>, Fabio Estevam <festevam@gmail.com>,
	Fabio Estevam <festevam@denx.de>,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 1/2] u-boot: Switch to nobranch=1
Message-ID: <20230716172052.GS2066889@bill-the-cat>
References: <20230714161823.20685-1-festevam@gmail.com>
 <CANNYZj-8RV6tz_7kEH6uz=yZeyd=bPts6AoBqTd5DL3rGGu+yg@mail.gmail.com>
 <20230714213719.GX2066889@bill-the-cat>
 <CANNYZj8-vQbGEO3yMgRbk2j2L-XOc2EeG6=2w2GhFwUuZqD=mw@mail.gmail.com>
 <c851b7c8-892a-f592-56f1-a69bfa06c193@denx.de>
 <CANNYZj9o5B7y2yFYtHfwhv=KYk74+ZWqC-kuysP2qRY6ifhMeQ@mail.gmail.com>
 <a8148cd0-46f0-2f52-10cd-d90747179a33@denx.de>
 <CANNYZj-QcKyeLhxo_U0Wi88SFm4DjcfzxoqGjj3rzanrPo0tgA@mail.gmail.com>
 <20230716150337.GQ2066889@bill-the-cat>
 <CANNYZj_KchfdPdgPMKqEzOfVhWhLRGbSonaewfOYeX8XJb-HHg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uq2JQn8gPfc0gEM2"
Content-Disposition: inline
In-Reply-To: <CANNYZj_KchfdPdgPMKqEzOfVhWhLRGbSonaewfOYeX8XJb-HHg@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Jul 2023 17:21:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184419


--uq2JQn8gPfc0gEM2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 16, 2023 at 07:19:56PM +0200, Alexander Kanavin wrote:
> On Sun, 16 Jul 2023 at 17:03, Tom Rini <trini@konsulko.com> wrote:
> > Does bitbake have any infrastructure atm for dealing with signed tags?
> > I'm fine with (for now, as LTS is a hope not a feature) keeping the
> > branch portion.  But if it was possible to say it must be a tag signed
> > by X key, that would help a little with the concern about moving to some
> > more arbitrary commit.
>=20
> As far as I know, git fetcher doesn't verify tags. They don't even
> have to be signed, checking that a tag specified in a recipe matches a
> commit id specified in a recipe would also guard against unwanted
> commits, but the fetcher doesn't do that check either.

That's what I figured, thanks.

--=20
Tom

--uq2JQn8gPfc0gEM2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmS0Ju4ACgkQFHw5/5Y0
tyz5XAwArFZCZCT1M9D1bOtTK/SGZ8PBWl6UEd4snEGn9Rq035oYRo3o33ujxFeH
10xfAgd/HZ6VjPYZDViq98w+GtKY2eJZ2BP1wec/j0yvyj4RUV1gVjnwnnn+fEr3
ZymDFDuMJAajp6ktSFmQpsiIwquC732xndzxlz/bdKdnMXYwUcc/f97fE3cV7V+6
jjqupEKqR9rErRlVcR3uddiQlwEM0cvmypmUBeYY56p8a6FMOGyLLJwzDC2e9E8+
RANU8tt6LySakpUiyh+vOj7fbVyf6qLhHWW9Z80+89KmKGBZts62tHiTBeUu7m/j
F3mgmG0QEKrFHIflqQ/qDUmIsoMnzQ4HNWHVDxR1upPhPBsV7P1IxRyF17EgMM01
oYu15OyBhp8Ka+ce+K5EtufmHinoR8gbA2e00ahkI3yHUsV8ZGKwMaEbYN+O9JjF
wd+tUtPdz3Xl94OLTova5S9Rqrj9r3q/dlPXul63yFiPN344h6uZuC+Dfgvjg+As
5vnQhU2G
=0Y1V
-----END PGP SIGNATURE-----

--uq2JQn8gPfc0gEM2--

