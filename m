Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58F44E9D406
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 15:54:08 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23701.1770220439535693390
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Feb 2026 07:53:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=iB60P2Be;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f66.google.com with SMTP id ffacd0b85a97d-432d28870ddso639066f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 07:53:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1770220438; x=1770825238; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=S/kYZ54fFlvtKnSpHGioCo0PjGUxfXbljDr2A7rlXfA=;
        b=iB60P2BecTZ6gQRPQj3fW1Igl93SloSxtC85z0NeYtRwdV0JC+eSpEhxi+N6RU5qvn
         FwHdZhgxWZkNLzhU5MkZeq7zCCUL7gIMsD5GmrmSwK0jCZSjYbMjFDgAbrbpL7IW/HmF
         PpRZs+NB3KkiHPTu+seoqrNYvC7SFC5fbgdzo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770220438; x=1770825238;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S/kYZ54fFlvtKnSpHGioCo0PjGUxfXbljDr2A7rlXfA=;
        b=bM0WZQQEgpXd1e5eNjly+Ex0Jx7uGCDBNZS+8Mriwg9gJLlU371ttiVOx4ktxDwwp5
         nmPLl4Zvzw/OBqmRiFw/+zznN106PdVC2fXn+60N1TxBCpRujnaPKQt6WURAch5QDrBe
         LuIE42KfeKDPUk7HoMQk5jqXX1fOrvT3saP2CNXvAIsHRiwtxC6pGTaw8hf7oUshw+3j
         wbIHlgQMGmxK+tK2gVzL6MpjNEE3koEaOMMaKVr3CRgffyBItvETpNeVVYeyEuHlY5uM
         7BTPnjJ5OKV7Q0TOYw9VzMt7FzdQHbeb8VNUEyfxhggD+s3Qxrz8DyuSKx7bpt+xsZ46
         W65g==
X-Forwarded-Encrypted: i=1; AJvYcCUpASRjKxwyi7GvEgvSoO3vmbRRLQmTLR3z1T6sYnHmUPxM5xztE7DTqVjwJG5DC1qfYnaSF9dZ52qdQJaOg+YYcA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyPkz2c3WdCXpThQoXJkpMLw6TyGVsU7PZokZoapHquv0CeQKHm
	aD7s6v5jUKIQMHuj5VGLhYok02l4KdFlXHgnYZweCMt1tgCmWArf0M6R76BBeTVZJkk=
X-Gm-Gg: AZuq6aKiUXhheoXadpvyuCrW+4Ycig6ZEJdDYOA9F5/4rFG1Mtj/GXmu9Q4lKdYxvGv
	2Ca9+EZzRKgjl49XtHx/2cbNCGfcOBBbYQ8hYdNpB526CjYR+J+yvBJN+3VVD+iB+uiQVfQ/pKp
	/Dp14LFGexvfmh6m86upb+BQ0w/50chRXEZCAX/732uiNFGEahbrqXtTEZuW6Pnnx32PJS6YLGe
	gdvPVzCxrIHyCmZYS3ZYDlOQjncQWaFJTK0FtWz7ZqP53ntEidH1TxJVc5DmpWZ2C8AYMkjwoz3
	Tn9OxlS6gaRw+nF3JJJ4XVeGofCCHZ16sXFwGZw+72WA78xs/DvNLrb5PS4SMEIn42c1G/zFtUb
	Wge5hNbnrE+idDUXfOi/3owLStwG6qAYc29yfXcUitevXfrHUdY2IzDhtWDheZ/odK/qa98Rm6M
	Ibed1cLp9JLCEEzq6ROO1Z5Hl47tpfhKE+oilEkIZ7SHiwoYBMRamlbYhpI4gAXHtm2FZ/ugR7e
	g4ggZhSzPeQbw==
X-Received: by 2002:a5d:52d1:0:b0:436:18d2:e723 with SMTP id ffacd0b85a97d-43618d2e7a4mr3117471f8f.10.1770220437887;
        Wed, 04 Feb 2026 07:53:57 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:ac04:f180:6f5c:7b1d? ([2001:8b0:aba:5f3c:ac04:f180:6f5c:7b1d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43617e387b9sm7699652f8f.12.2026.02.04.07.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 07:53:57 -0800 (PST)
Message-ID: <260247994ff827c43a775d9f549dacb073e60f5f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] module.bbclass: check whether CONFIG_MODULES
 set
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: kai.kang@windriver.com, openembedded-core@lists.openembedded.org
Date: Wed, 04 Feb 2026 15:53:56 +0000
In-Reply-To: <CADkTA4Pr3GFrZVM6LLQ-ATL-y+YFybjtgtcVMrgYrUKnDeSo7g@mail.gmail.com>
References: <20260204020908.864912-1-kai.kang@windriver.com>
	 <CADkTA4PZ9df8xCge6F+m4M02OTXbiOhYJ7S7hPvze95ah5BWDQ@mail.gmail.com>
	 <71fa18fd1ae7612c9d3f8161c6aeb2575d22e280.camel@linuxfoundation.org>
	 <CADkTA4N=XXArnsygSnAUptBby_BBX1qxsL2bjT+r1gDePWVmZg@mail.gmail.com>
	 <4c2fe6d55fc04781560d73fd038ee6b8d205c08e.camel@linuxfoundation.org>
	 <CADkTA4Pr3GFrZVM6LLQ-ATL-y+YFybjtgtcVMrgYrUKnDeSo7g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 15:54:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230550

On Wed, 2026-02-04 at 09:10 -0500, Bruce Ashfield wrote:
>=20
>=20
> On Wed, Feb 4, 2026 at 9:05=E2=80=AFAM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Wed, 2026-02-04 at 09:02 -0500, Bruce Ashfield wrote:
> > > On Wed, Feb 4, 2026 at 8:58=E2=80=AFAM Richard Purdie
> > > <richard.purdie@linuxfoundation.org> wrote:
> > > > On Wed, 2026-02-04 at 08:46 -0500, Bruce Ashfield via
> > > > lists.openembedded.org wrote:
> > > > > On Tue, Feb 3, 2026 at 9:09=E2=80=AFPM Kai Kang via
> > > > > lists.openembedded.org
> > > > > <kai.kang=3Dwindriver.com@lists.openembedded.org> wrote:
> > > > > > From: Kai Kang <kai.kang@windriver.com>
> > > > > >=20
> > > > > > Check whether kernel config CONFIG_MODULES set or not
> > > > > > before do_compile
> > > > > > and do_install in module.bbclass. If not set, it cannot
> > > > > > build and
> > > > > > install external modules.
> > > > > >=20
> > > > >=20
> > > > >=20
> > > > > This isn't the place to do that check.
> > > > >=20
> > > > > If modules are disabled get modules_do_compile out of the
> > > > > tasks.
> > > >=20
> > > > Does it make sense to have something including module.bbclass
> > > > which
> > > > doesn't have CONFIG_MODULES set?
> > >=20
> > > Yes, that's what I'm trying to say.
> > >=20
> > > Don't even include it if you can't build modules. That puts
> > > the conditional in a single place, and keeps the code cleaner
> > > in the class.
> >=20
> > I think we're talking cross purposes a bit.
> >=20
> > The issue is that if you ever reach do_compile in something using
> > module.bbclass which does not have CONFIG_MODULES set, that is a
> > problem and a hard error.
> >=20
> > So I'd argue that:
> >=20
> > * we only need the check in do_compile
> > * it should be a fatal exit hard error, not a warning
> >=20
> > which means the patch needs tweaking but not as you're suggesting.
> >=20
> >=20
>=20
>=20
> I don't have a strong opinion, so won't object.
>=20
> I just don't think adding any conditionals for module support in
> moduldes.bbclass makes sense. So one versus two checks
> is a wash for me.

I agree the warn conditional isn't quite right. I think it should be:

if [ CONFIG_MODULES not set in config ];
    bberror Broken config, CONFIG_MODULES not set
    exit 1
fi

so it is basically a sanity test that the config is valid.

I'm a bit worried about what I'm missing though :/

Cheers,

Richard




