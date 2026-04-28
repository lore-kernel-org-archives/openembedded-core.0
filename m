Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDF11FF8868
	for <webhook@archiver.kernel.org>; Tue, 28 Apr 2026 11:23:53 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10739.1777375427480053335
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Apr 2026 04:23:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bTTQMcmu;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso97593785e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Apr 2026 04:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777375426; x=1777980226; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vu9+bbsaPh/k/+d6x9FoJl59Hc2pFc9vZ79nCAWtOyE=;
        b=bTTQMcmuY4n5/7LGYagP4kl1iV8ANFWLdBhavWHRFQqt7rxi1ltHorqjXr8znyf+wl
         OfH8BxSFnm05QxmGSoO1Hd+BmA/2mzdcCHyWWc0upaQ3nnHwMn4naNBOzOH8yCxRLNUK
         UtbU2nn8H1WnRPw3a+Mg34+nXeLIErlJ8icWk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777375426; x=1777980226;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vu9+bbsaPh/k/+d6x9FoJl59Hc2pFc9vZ79nCAWtOyE=;
        b=CaAVsww7I0Boi0ufNWdk9Qvve1eN91xd8a+KXzXkWqGQ6eHhn3mkKoz3y7wWfC1VAg
         SiYJY7vCWxOHGZIKcxYhJgLf9GvHMfQq5j9fNFS5LUyNJx4K2QrKKrXi/vz8lr7lh9pi
         iHYk4YvfifDdvXIXXmbrfbzQbNuZsNLBZyPhxCuIOt2v+BRxjNTpN1phsL+JKA1pQx1e
         7GDe3a0z8feFDfQcMV0mniCH3fc5936dcfKpUS+EZbXN0j32KvaxPAVwNtRC+0Ms2mzT
         8OJS9Dd6esbCHP3B6qUQeJ9AC/53uwkGt9jbkYc6GOoI2pyGefMnoXzG35efSXwmY/hR
         eT2A==
X-Forwarded-Encrypted: i=1; AFNElJ9KwGhPLgLiiCMQ/aA04o3XaJrdjCiIXO8HtZpZAUbFk4prWhAujrMC214XcqZ30GpmGWK+MtNeJqZIplCcUdCBmg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwC27RJCrqQbXkhFcRfNynx0WYCeCrHQbNJtWzqyZ45avT7DNCy
	BnyFKpQ6PlvaEapqG6jsgE03XyhA5m/j9qUgSpETJk0qPahbVrOU38h4kJcl+iwE1Ck=
X-Gm-Gg: AeBDievU3CtX5vZWuH2xbt+x8HiwZsOIrbTw/NwVWCNY4uhmV+m7u3cJir565Ax3BuX
	Po9LynVrNPEon7ylCmMhT7j9g/6QfJwOgPTPXXLSiYBBIlClzrc6Ygk7+a7vPEo+WvtHxwn+P98
	IuBvlv/amCxBXDR0Wj9z0bsz6LS2taD8CNX8ZD9MHn0+X4h71FxD3QoQ9gJ0hgjxB/oAxsZarZU
	HtwAy/ncGOMvNUDn/JQjC4PsPrNX+yhQj8YwmjmGRuTbvmqwZZaStTxJzNOHJqpM8E3q3hiw3x+
	LxUWK+SKtERxqqkCDSE5CN7s1SBsE7wa5563D11S1sCdktpnh9iGw+bTnDCvBdxM3AqsmQ13NDR
	AdQjhOwsJ9nw9mt+voUMjKlN/i0s7oE8crLN2OcxlcccLnsITKZwYwJ6mXPFVzafNOPYKWIia4t
	dj5FiTvu3a5IbNE5rVo+1SxPxmVLd/JmbWXtmNtUI2KSAr3VGdi477eH/pS/Cy0QvX+w8kMaIsZ
	j4FAobc0ElT9dR7tECdbHgVkWg=
X-Received: by 2002:a05:600c:4fcd:b0:489:1c09:6c4b with SMTP id 5b1f17b1804b1-48a77adda1dmr38881605e9.6.1777375425782;
        Tue, 28 Apr 2026 04:23:45 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:d7fe:f02f:1ae8:3ae9? ([2001:8b0:aba:5f3c:d7fe:f02f:1ae8:3ae9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a77c24cedsm42518175e9.15.2026.04.28.04.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 04:23:45 -0700 (PDT)
Message-ID: <b9c4ddd5ae72ae21ee0b6e12fb1a1f63661c685c.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] mirrors: switch Yocto Project mirrors to HTTPS
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: quaresma.jose@gmail.com
Cc: antonin.godard@bootlin.com, viswanath.kraleti@oss.qualcomm.com, 
	openembedded-core@lists.openembedded.org, Michael Halstead
	 <mhalstead@linuxfoundation.org>
Date: Tue, 28 Apr 2026 12:23:44 +0100
In-Reply-To: <CANPvuRkVsWWCmUtt=O821j0YH0mCirsCytTywEx7YD=Qu4TMog@mail.gmail.com>
References: <20260427103040.1519121-1-viswanath.kraleti@oss.qualcomm.com>
	 <DI3WQFOXA6GG.23KER0QY230XL@bootlin.com>
	 <18AA3C050EE61D30.2188217@lists.openembedded.org>
	 <CANPvuRkVsWWCmUtt=O821j0YH0mCirsCytTywEx7YD=Qu4TMog@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Apr 2026 11:23:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236053

On Tue, 2026-04-28 at 11:46 +0100, Jose Quaresma via lists.openembedded.org=
 wrote:
>=20
>=20
> Jose Quaresma via lists.openembedded.org <quaresma.jose=3Dgmail.com@lists=
.openembedded.org> escreveu (segunda, 27/04/2026 =C3=A0(s) 15:09):
> >=20
> >=20
> > Antonin Godard via lists.openembedded.org <antonin.godard=3Dbootlin.com=
@lists.openembedded.org> escreveu (segunda, 27/04/2026 =C3=A0(s) 12:40):
> > > On Mon Apr 27, 2026 at 12:30 PM CEST, Viswanath Kraleti via lists.ope=
nembedded.org wrote:
> > > [...]
> > > > =C2=A0 svn://.*/.*=C2=A0 =C2=A0 =C2=A0http://sources.openembedded.o=
rg/ \
> > > > =C2=A0 git://.*/.*=C2=A0 =C2=A0 =C2=A0http://sources.openembedded.o=
rg/ \
> > > > =C2=A0 gitsm://.*/.*=C2=A0 =C2=A0http://sources.openembedded.org/ \
> > >=20
> > > On a related note, it seems that http://sources.openembedded.org/ is =
no longer
> > > active. Could we remove it?
> > >=20
> >=20
> >=20
> > I also noticed that when I tried it, but I was unsure if it was intermi=
ttent or if it didn't even exist.
> > Add Michael in cc and perhaps he can confirm.
> >=20
>=20
>=20
> It's not intermittent, because the address still can't be resolved today.
> I think it's safe to remove this addresses in a subsequent commit,
> and if there are any complaints, we can revert the commit.

I know a bit of the history there and agree we should remove them.

Cheers,

Richard

