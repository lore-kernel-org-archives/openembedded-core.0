Return-Path: <trini@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3C2FEB64DA
	for <webhook@archiver.kernel.org>; Sun, 16 Jul 2023 15:03:45 +0000 (UTC)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
 by mx.groups.io with SMTP id smtpd.web10.17988.1689519820725661299
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Jul 2023 08:03:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=hlLWQpmW;
 spf=pass (domain: konsulko.com, ip: 209.85.219.171, mailfrom: trini@konsulko.com)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-c84fd44593aso3877758276.0
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Jul 2023 08:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1689519820; x=1692111820;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/y+LH4t6iglhxUYaOsbgr1RkW+O149HzXQdrgm6+Bpg=;
        b=hlLWQpmWm3JsWGnbGXIKtJo/HgM8/u1CtYU/CeGtPdW9AFuqOv0QfGyjd7XXSQ56xV
         5xk6KDxoomxhLmi22mI4Gzp/w8SFc4M5xno/nRvdE30cSsTNpdRUMQJZobNcXe+PVS4f
         mZn3uWJsULGPZlVoqjH1yyvyMesR4xwMit9/A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689519820; x=1692111820;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/y+LH4t6iglhxUYaOsbgr1RkW+O149HzXQdrgm6+Bpg=;
        b=Q1rdaTF3vjCV8BdTygTxmp5jMEId7qwcRq5i6b1ri6e5d1bAQVrDY8qcrc2ZqZ9dQe
         qNofjzIc40M8J9wDxJA4N9VVUzDIvn6DftnnNLI/fh8dWpRGIm0FTgrpzqKJJzVl3fbd
         xM/nXB7IdmCvzq1r4W6f6xO8xiUBqCwo+DVIpaf7N1NB4d9tVcXfF7CgzxwetKV1pOcf
         SaBJ2ruWYKt8c6/sKHrSmS/WK+pvRw5xoOjTLk+6Q7xhVix8HUEcUssc6eGP//xy3zpO
         OlElAUO4ko2W3FhkKtnQnEdXEuwJuWCcmd+8XWGLuWt3D98zA7N8Pf/M8DurxUMQVGBL
         04Vw==
X-Gm-Message-State: ABy/qLZwFBHR5cQda1D5JHvM0lH/I3c73Pc6sNknXugOn+9ssiIE2BYO
	hfOH+trtJDPgqBmmBd4Hsr8vlg==
X-Google-Smtp-Source: APBJJlE+3Xe7bNW3stFkC4BdGSMPA0OwTAkfFD2SVanf6LtoshaDNcrxyRNhKMGo51WTwP99jd2JRQ==
X-Received: by 2002:a25:9e08:0:b0:c68:d894:c5b1 with SMTP id m8-20020a259e08000000b00c68d894c5b1mr8692521ybq.47.1689519819926;
        Sun, 16 Jul 2023 08:03:39 -0700 (PDT)
Received: from bill-the-cat (2603-6081-7b00-6400-5e84-cf0c-0c9a-a3e2.res6.spectrum.com. [2603:6081:7b00:6400:5e84:cf0c:c9a:a3e2])
        by smtp.gmail.com with ESMTPSA id o9-20020a254109000000b00cb2a8f888ebsm1444823yba.0.2023.07.16.08.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Jul 2023 08:03:39 -0700 (PDT)
Date: Sun, 16 Jul 2023 11:03:37 -0400
From: Tom Rini <trini@konsulko.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Marek Vasut <marex@denx.de>, Fabio Estevam <festevam@gmail.com>,
	Fabio Estevam <festevam@denx.de>,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 1/2] u-boot: Switch to nobranch=1
Message-ID: <20230716150337.GQ2066889@bill-the-cat>
References: <20230714161823.20685-1-festevam@gmail.com>
 <CANNYZj-8RV6tz_7kEH6uz=yZeyd=bPts6AoBqTd5DL3rGGu+yg@mail.gmail.com>
 <20230714213719.GX2066889@bill-the-cat>
 <CANNYZj8-vQbGEO3yMgRbk2j2L-XOc2EeG6=2w2GhFwUuZqD=mw@mail.gmail.com>
 <c851b7c8-892a-f592-56f1-a69bfa06c193@denx.de>
 <CANNYZj9o5B7y2yFYtHfwhv=KYk74+ZWqC-kuysP2qRY6ifhMeQ@mail.gmail.com>
 <a8148cd0-46f0-2f52-10cd-d90747179a33@denx.de>
 <CANNYZj-QcKyeLhxo_U0Wi88SFm4DjcfzxoqGjj3rzanrPo0tgA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2sfdxeEmFpu04cfx"
Content-Disposition: inline
In-Reply-To: <CANNYZj-QcKyeLhxo_U0Wi88SFm4DjcfzxoqGjj3rzanrPo0tgA@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Jul 2023 15:03:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184417


--2sfdxeEmFpu04cfx
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 16, 2023 at 08:12:42AM +0300, Alexander Kanavin wrote:
> On Sun 16. Jul 2023 at 4.01, Marek Vasut <marex@denx.de> wrote:
>=20
> > This protection is really weak, this check fails on every single
> > possibly bogus commit which is already on any random branch, so what is
> > the gain here really ?
>=20
> The gain is that the branch name is seen in the recipe and we can make the
> judgement about it. You wouldn=E2=80=99t be able to switch from main to
> my-ugly-hacks or dangling commit without having to explain that. With
> nobranch the branch name disappears and this opens the door for bogus
> commits. You may reassure us that right now the commit is not bogus, this
> may not hold in future revision updates or if the branch is force pushed =
on
> your side.

Does bitbake have any infrastructure atm for dealing with signed tags?
I'm fine with (for now, as LTS is a hope not a feature) keeping the
branch portion.  But if it was possible to say it must be a tag signed
by X key, that would help a little with the concern about moving to some
more arbitrary commit.

--=20
Tom

--2sfdxeEmFpu04cfx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmS0BsYACgkQFHw5/5Y0
tywakQv6AryAxO/sglP4iJPsiyhWt8T0iur2OeUURaYnTXj5q11q2dFBRBjlXcHo
3Gw1IrtMU1cJhnI5/ieeEAg+meha3SJucbPBYPpR4IsQTmgmeVTkziOHJ0VzLYh9
fC83FEQuIvQGwGj1LaqznwyXAlmvyLBQp+HmDKa9ZUpqZGa7oL7EBaMPwR6XBjEE
lDPVBkwXTCuolmZFQ9wVfgcVvPPb+3xSg9UW4wo0FbwiqxodmtQ1M46eccDD3pAm
gkm/tLVygtUAY38K2AXvDIhsgybSSGX4zUHfac8wmTdadg6yIOtjdRsu39N5Wp5U
AhGHhgOSolkvumHdW/bxAEFteTFR7aqzJUOf8xz1FUtKvbTmYF8NybpzjqnASPps
iHFRsFewMRIvnIpHYGovYYi2VXpjejyp3JRfVTC4HDg4+LF5OFccFEmRqeu9lrHI
QagBTGEUvZXyeypctcgjeOyqGqRRhbsyxjIJYoLc10Q6jFvPzDCeu1uIDDmlU3hy
F1rzMYur
=DslM
-----END PGP SIGNATURE-----

--2sfdxeEmFpu04cfx--

