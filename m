Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E851FC02183
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 14:06:06 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.17279.1736777158383082337
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jan 2025 06:05:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IqYlzpgF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4361f796586so44841135e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 06:05:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1736777157; x=1737381957; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dWcS0Lo4hCN0csJF2+Aww49wiMLqdyVtnKUGaYh59bs=;
        b=IqYlzpgFe9x9CxMzrCm4on+ChK5LBhHin6Wpu7ZjSeoS/u7GJsh9ETOj8OvS1W98B3
         5/8ydeglO60kn9YGP7Vr/CGX35h/8/WFUBZAxro9fXHVjXfBxIq7llyniGsWmK2TKFVt
         Hxb5rIrGFXmE1whcwZMEfmk/BkeZ+yj7UjeLg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736777157; x=1737381957;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dWcS0Lo4hCN0csJF2+Aww49wiMLqdyVtnKUGaYh59bs=;
        b=Z/+Yo5NWW64nYMF0qZsGcdbN2RsZDgMYy9nB+DJuvnr6gLTqG9umcWugRNhzWQvlHp
         K2IQ/yNPpT5Bj9najwO36Rd97AI0XjkYuh3DO7IGgT01ULSh0vFQzA9PFzGI67g9d5e5
         D3zq36Zh6jUe31JerE5d76agygQ5vXX6RkzQfxz0KCU3FPPeQ8zuSSUG0oeMo5HqWpW4
         8n7+mNW5ILPtqhpiNCjTP9ZX1pd8mf/j5mFanlERZuun6lyHaNDA98YA4J5fKPknjrlL
         W0/c9tGrH6kfefiDf/9XwtD6Oopykinhx151bM0Xtjdz+qmhJQnzSJJZNhwyYEu9N3Fn
         c81A==
X-Forwarded-Encrypted: i=1; AJvYcCXeAUljNaPWow7ayXqSEtSCusdwVzGUGAgJVdqZXQJXD7KsDu3t69e1bfA6SzE6vI4UWDIYO5WDl0WkmRbaObfqeA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzbV1vaaj3wLFNk6FcpgRTH87HMyWua4zPHXsrk9fJ+qKL1oXBc
	NWG2OxzSMAZolanoUBEM4FNgJy3zaa1Sa4YZpJdl2X9acJTRgMXYEO+pOUHHDao=
X-Gm-Gg: ASbGncum0NbYsSFMeJdKPxsyRurmxlrZdf5+ReZYhRRxDo1kva+L5bR4ajMBqRl3thf
	5S1xpe915jLH8x2fPlgANji/DHgXgzwZ+zbdm47HLfl/CgLsQVeICuV6y/gvCuJ4/yON8EFpxf5
	yfQ6syiIZbjoT9YvJqBMxXKJaBpunRYmbTzUsFI156Lw74LVayPy+m147Z1pmXKfujGjiys33qU
	0snHcgsCqUW/q5CnxCu34Dtu4p6mL7ap0cB8SbnkBgDETivByVZ6dQRUe2CTsoe3ssZfyDAiQc4
	IFOXzLiCJnr/IwdKzdJ8497qyE2LukkJpMt+AItvi7eTpA==
X-Google-Smtp-Source: AGHT+IGqq3SKq0awmvUHRtpAObod1GYTxAVCtiDA62rNBIm9V667KG148mEh0Mux2WrNhMlHadQJ/g==
X-Received: by 2002:a05:600c:a0a:b0:434:a04d:1670 with SMTP id 5b1f17b1804b1-436e25548e3mr86656215e9.0.1736777156676;
        Mon, 13 Jan 2025 06:05:56 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:8c02:7837:65dd:9212? ([2001:8b0:aba:5f3c:8c02:7837:65dd:9212])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e38bf65sm12133685f8f.49.2025.01.13.06.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 06:05:55 -0800 (PST)
Message-ID: <5e0b242f7567c19dfe2bc3f1eea4e2e0744e1e47.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 4/4] native: Improve ${PN}-XXX package name
 handling
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Quentin Schulz <quentin.schulz@cherry.de>, 
	openembedded-core@lists.openembedded.org
Cc: docs <docs@lists.yoctoproject.org>
Date: Mon, 13 Jan 2025 14:05:54 +0000
In-Reply-To: <83b689cd-fca0-4ced-a644-68c9437de9ba@cherry.de>
References: <20250106160948.803305-1-richard.purdie@linuxfoundation.org>
	 <20250106160948.803305-4-richard.purdie@linuxfoundation.org>
	 <83b689cd-fca0-4ced-a644-68c9437de9ba@cherry.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 14:06:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209725

On Mon, 2025-01-13 at 14:45 +0100, Quentin Schulz wrote:
> Cc docs
>=20
> On 1/6/25 5:09 PM, Richard Purdie via lists.openembedded.org wrote:
> > If a recipe has something like:
> >=20
> > RPROVIDES:${PN}-xxx =3D "yyy"
> >=20
> > then the current code will turn this into:
> >=20
> > RPROVIDES:${BPN}-native-xxx =3D "yyy-native"
> >=20
> > which can lead to errors. Add in some handling for this special case in=
 the class
> > extension code.
> >=20
> > The corresponding entry in PACAGES is correctly remapped, the variables=
 aren't
> > remapped to match though.
> >=20
> > Note that merging this does trigger new dependencies to be exposed, som=
e of which
> > can't be met or are incorrect. These need to be fixed on a case by case=
 basis.
> >=20
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> > =C2=A0 meta/classes-recipe/native.bbclass | 7 ++++++-
> > =C2=A0 1 file changed, 6 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/meta/classes-recipe/native.bbclass b/meta/classes-recipe/n=
ative.bbclass
> > index d9651a7f22d..0fad42a5a45 100644
> > --- a/meta/classes-recipe/native.bbclass
> > +++ b/meta/classes-recipe/native.bbclass
> > @@ -158,7 +158,12 @@ python native_virtclass_handler () {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 newdeps.append(dep.replace(pn, bpn) + "-n=
ative")
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 else:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 newdeps.append(dep)
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.setVar(varname, " ".join(=
newdeps))
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 output_varname =3D varname
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Handle ${PN}-xxx -> ${BPN=
}-xxx-native
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if suffix !=3D "${PN}" and =
"${PN}" in suffix:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 out=
put_varname =3D varname.replace("${PN}", "${BPN}") + "-native"
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.r=
enameVar(varname, output_varname)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.setVar(output_varname, " =
".join(newdeps))
> > =C2=A0=20
>=20
> This seems like a bug we should document in known issues in old release=
=20
> notes?
>=20
> I assume we may patch currently supported releases so stable dot=20
> releases may receive the patch, but outdated releases would be unpatched=
=20
> forever.

The change in behaviour is enough that I don't think we should be
backporting this to stable releases. The issue is rare and seemingly
not being run into by many people in the wild.

> I guess we can say that the fix is to have each of RDEPENDS,=20
> RRECOMMENDS, RSUGGESTS, RPROVIDES, RREPLACES, PACKAGES overrides and=20
> PACKAGES_DYNAMIC to have ${BPN}-xxx+${BPN}-xxx-native instead of just
> ${PN}-xxx? Is that an appropriate suggestion?

We'd probably suggest that users "spell out" the native mappings
explicitly for any problems encountered. I'd argue they should be
mapped correctly rather than introducing the "bad" naming.

> I'm bringing this up because we have a Known issues section in the=20
> migration guides which is pretty much empty right now. I don't know what=
=20
> we should actually put in there but this seems like a candidate? What do=
=20
> you think? Antonin?

That is something we should consider, yes.

Cheers,

Richard



