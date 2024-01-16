Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2835C47077
	for <webhook@archiver.kernel.org>; Tue, 16 Jan 2024 12:44:14 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.12551.1705409046420927138
 for <Openembedded-core@lists.openembedded.org>;
 Tue, 16 Jan 2024 04:44:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TOHSThaw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-40e60e135a7so43000485e9.0
        for <Openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 04:44:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1705409045; x=1706013845; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mzkYMrK3gWzhnuT53bIDtPgnQ1kj91A53DvTqdQCzPQ=;
        b=TOHSThawXjPyvAqAADbj0/pX/lnQrI+oJzXSrlZY31TgwpIuJbjCBAsioVghHAFCtK
         Bgb9WtuJfmn3HGX+95MN6i/+7ICZj0SKBHnQv2Pvd9wXO9RYEzAFg8Hs5ikJhnC8aVte
         3MwzdxeBx2ENHWvirx4yzDj/2QxgV3GokRnCc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705409045; x=1706013845;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mzkYMrK3gWzhnuT53bIDtPgnQ1kj91A53DvTqdQCzPQ=;
        b=ilWaycnrzDnqlaJ8qVl2UlsGHcfcvNZFPtMxiih1NOhKKBvqrLgDbPDvDFUlRA83ku
         P14v3ziLnww7C0LQ3TSqdbdXkPpgfhB/Qpsetvo7lYhlRZib4M0fDPhQOxcMi6/mPyzL
         WAGcj8NSevozPoE4DEEKxQisVD448QCAe2TNptPzZNvJJXf0GZZt98WnikLrSg6F0hUQ
         PgOL1GISMvXajyDpR/AYtpDd+H0k6HfhY/G16wztq/eG7bwAml2NiCc21Sex6k7Ae6pp
         s7dPgo1byKysQuAduJpUzMexM5V+qMvV8T2upkDkLdjD3pBBlZj8JGlOpcSkTi7z/34t
         7FpA==
X-Gm-Message-State: AOJu0YxqfTCWfD+EVskW7BdzoNPSqwVSfxD9pQ+zzfMQErQtwXJbOCXk
	eI++tspsZih+l07gW2Yb+9y6KmakTvoFJA==
X-Google-Smtp-Source: AGHT+IHHjgIgFfpC627MpOPp8V4IxZJnunlXBbK2++Xf1VdlAFtOuaGlVB4bnpZmhFLQ3PKIA4RVMw==
X-Received: by 2002:a05:600c:6b13:b0:40c:2b29:1bbe with SMTP id jn19-20020a05600c6b1300b0040c2b291bbemr4190244wmb.54.1705409044729;
        Tue, 16 Jan 2024 04:44:04 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:717c:d951:6325:d768? ([2001:8b0:aba:5f3c:717c:d951:6325:d768])
        by smtp.gmail.com with ESMTPSA id m11-20020a05600c4f4b00b0040e86a4c0b3sm675672wmq.11.2024.01.16.04.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jan 2024 04:44:04 -0800 (PST)
Message-ID: <134864b05fb8e2ad52835fff909d1dda5c8d561f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/3] recipetool: Don't fail on local go modules
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Vyacheslav Yurkov <uvv.mail@gmail.com>, Lukas Funke
 <lukas.funke-oss@weidmueller.com>, Openembedded-core@lists.openembedded.org
Date: Tue, 16 Jan 2024 12:44:03 +0000
In-Reply-To: <be7981e3-0d3d-44af-9ce1-6b9ca51d06b7@gmail.com>
References: <20240110115335.92914-1-uvv.mail@gmail.com>
	 <8a756432917f8120a8e2d0d5b1e8ee9daebd6132.camel@linuxfoundation.org>
	 <3ec7d9d9-c1bb-45ad-ae57-54ff7733d487@weidmueller.com>
	 <be7981e3-0d3d-44af-9ce1-6b9ca51d06b7@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 12:44:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193860

On Tue, 2024-01-16 at 09:33 +0100, Vyacheslav Yurkov wrote:
> On 10.01.2024 16:45, Lukas Funke wrote:
> > On 10.01.2024 14:59, Richard Purdie wrote:
> > > On Wed, 2024-01-10 at 12:53 +0100, Vyacheslav Yurkov wrote:
> > > > Local modules are usually referenced with a 'replace' directive in
> > > > go.mod file. If that's the case, remove them from populating SRC_UR=
I.
> > > >=20
> > > > Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
> > > > ---
> > > > =C2=A0 scripts/lib/recipetool/create_go.py | 32=20
> > > > +++++++++++++++++------------
> > > > =C2=A0 1 file changed, 19 insertions(+), 13 deletions(-)
> > >=20
> > > Do these changes mean we need to improve the test coverage in oe-
> > > selftest for recipetool?
> >=20
> > Test converage needs improvement, yes. I haven't considered the case=
=20
> > for local modules since this seems to be rare(?). Are there public=20
> > projects which use this mechanism?
> >=20
> > Best regards
> > Lukas
> >=20
>=20
> I added coverage for local modules in my v2.
>=20
> I'm not a golang expert, but it seems that local modules in golang is a=
=20
> means to "place a patched version into the project space until upstream=
=20
> fixes it" more or less like Yocto does with Upstream patches. It's used=
=20
> a lot by in-house projects, but you could also get a glimpse on github=
=20
> with this query=20
> https://github.com/search?q=3Dpath%3A%2Fgo.mod+NOT+is%3Afork+content%3A%2=
F%5Ereplace+.*%2F&type=3Dcode&query=3Dcontent%3Ago.mod+replace&p=3D3=20
> . Note, Github is able to display only first 100 search results (Github=
=20
> API restriction).
>=20
> One thing I don't like in my v2 is that I need to look up a public=20
> project to add required coverage. I would rather improve tests further=
=20
> by having everything in one repository and just one test, i.e. it has to=
=20
> be a small test project that could be used to test all go-related=20
> functionality. The question is though where it should be placed? I could=
=20
> create it on my Github account, but would that be a good option?
>=20
> Richard, any suggestions on where these projects for selftest coverage=
=20
> should be hosted?

Thanks for the tests, they are massively helpful in maintaining this
code.

We could always add something to git.yoctoproject.org, we do have a few
test repositories there already for various purposes like this.

If you want to do that, please send an email to
helpdesk@yoctoproject.org with an ssh key (or I think a pointer to your
github account), requesting setup for the repo and a brief description
of what it is for.

Cheers,

Richard


