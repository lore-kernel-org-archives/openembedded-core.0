Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC143C7EE2D
	for <webhook@archiver.kernel.org>; Fri, 24 Feb 2023 16:56:51 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.23280.1677257804170971696
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Feb 2023 08:56:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=W9h93oee;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id j19-20020a05600c1c1300b003e9b564fae9so2645096wms.2
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 08:56:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uKxBtu7gSnvlxnb7acvLCTxgu2tU1jxLLOxmyJf98fA=;
        b=W9h93oeecsavQTjspcgrz8EVzVDVABu14dxFeBNiidHcedZWQIS+QAF4O92y63prfk
         hH2wB/8gExq7BDbSUwVbO2io7u6PiMJ/13Uh7DFLgfvV2fHzFwIkAe5cRJF4+WxTLXRr
         7pdcYn24QHn6f3ifWuR/9ENjqErZr7AFfNLCg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uKxBtu7gSnvlxnb7acvLCTxgu2tU1jxLLOxmyJf98fA=;
        b=4KwXSThxM8higQONXkzU8+IgaE9BKgxZKz9wLCbZO7PVZkEOvKA5ng/p3n0v/VQO8D
         fJYk7+JPDp0GVDYWvOObp7elQTwm2QXQIbVtAkVXeg29HLRASi1hh/O5Fk6AXa+HWcLB
         g9nDGpMWvoP7wG3NdFp1o06mibbBP2eZY2aBP/UHHZkP1P4YQ5iCfFzxMkm9Aj9pGzrv
         BU7FYBMyIujKS1WxJN5I4XRj442fmWBYEhSuP8YeHB6mRZHBZCRXkrSX+ur8ZQJVDZa5
         SdViRtOFWZEcEZ86ErXd0PCzQIQwxLnnHgOWSzzH5Ep8LaS7DKTaZ3H4ISeERcvP79nK
         iuSg==
X-Gm-Message-State: AO0yUKVzBBbVrDrahrggI25NRCeDBHLbWVSW9TPodjzMcoBEdtTPYN3b
	WnVod4eSU91XzoD/ivs3JGv9WA==
X-Google-Smtp-Source: AK7set+pyyUneoMl2yNejhcbrjtlcOhigq2hXtR7JIPISuwhBG08YlEwFrTcmVUBO1AvZ8mVV+peZA==
X-Received: by 2002:a05:600c:1652:b0:3e0:ffd4:bfb2 with SMTP id o18-20020a05600c165200b003e0ffd4bfb2mr13097587wmn.4.1677257802453;
        Fri, 24 Feb 2023 08:56:42 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:639b:9979:fd5f:bbb7? ([2001:8b0:aba:5f3c:639b:9979:fd5f:bbb7])
        by smtp.gmail.com with ESMTPSA id y4-20020a05600c364400b003e2066a6339sm3431220wmq.5.2023.02.24.08.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 08:56:42 -0800 (PST)
Message-ID: <0374a6afb3641957a6e51ee69c8c29a50d54c310.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] icecc.bbclass: enable the network only when
 ICECC_DISABLED is not set
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Jose Quaresma <quaresma.jose@gmail.com>, 
	openembedded-core@lists.openembedded.org, Jose Quaresma
	 <jose.quaresma@foundries.io>
Date: Fri, 24 Feb 2023 16:56:41 +0000
In-Reply-To: <CA+chaQchee2Yw5TooHEu6vBJXpDSNaMhrno1LN=aNY3f7cLpMQ@mail.gmail.com>
References: <20230217095855.1932015-1-jose.quaresma@foundries.io>
	 <bdc9e1da6cce62c017e767addc91633a724bf27d.camel@linuxfoundation.org>
	 <CA+chaQchee2Yw5TooHEu6vBJXpDSNaMhrno1LN=aNY3f7cLpMQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 16:56:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177705

On Fri, 2023-02-24 at 17:38 +0100, Martin Jansa wrote:
> On Fri, Feb 24, 2023 at 5:27 PM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Fri, 2023-02-17 at 09:58 +0000, Jose Quaresma wrote:
> > > Enabling the network uncondictional is not need for some use
> > > cases.
> > >=20
> > > Such use case is usefull to reuse the sstate-cache of the build
> > > and it requires the icecc inherit in all of the builds.
> > > The real control control of the icecc is in the variable
> > > ICECC_DISABLED
> > > so this patch change the logic to enable the network when the
> > > icecc is in use.
> > >=20
> > > Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> > > ---
> > > =C2=A0 meta/classes/icecc.bbclass | 10 ++++++----
> > > =C2=A0 1 file changed, 6 insertions(+), 4 deletions(-)
> > >=20
> > > diff --git a/meta/classes/icecc.bbclass
> > > b/meta/classes/icecc.bbclass
> > > index 312e0f17b5..159cae20f8 100644
> > > --- a/meta/classes/icecc.bbclass
> > > +++ b/meta/classes/icecc.bbclass
> > > @@ -428,22 +428,18 @@ set_icecc_env() {
> > > =C2=A0 =C2=A0 =C2=A0 bbnote "Using icecc tarball: $ICECC_VERSION"
> > > =C2=A0 }
> > > =C2=A0=20
> > > -do_configure[network] =3D "1"
> > > =C2=A0 do_configure:prepend() {
> > > =C2=A0 =C2=A0 =C2=A0 set_icecc_env
> > > =C2=A0 }
> > > =C2=A0=20
> > > -do_compile[network] =3D "1"
> > > =C2=A0 do_compile:prepend() {
> > > =C2=A0 =C2=A0 =C2=A0 set_icecc_env
> > > =C2=A0 }
> > > =C2=A0=20
> > > -do_compile_kernelmodules[network] =3D "1"
> > > =C2=A0 do_compile_kernelmodules:prepend() {
> > > =C2=A0 =C2=A0 =C2=A0 set_icecc_env
> > > =C2=A0 }
> > > =C2=A0=20
> > > -do_install[network] =3D "1"
> > > =C2=A0 do_install:prepend() {
> > > =C2=A0 =C2=A0 =C2=A0 set_icecc_env
> > > =C2=A0 }
> > > @@ -457,3 +453,9 @@ ICECC_SDK_HOST_TASK:pn-uninative-tarball =3D ""
> > > =C2=A0=20
> > > =C2=A0 # Add the toolchain scripts to the SDK
> > > =C2=A0 TOOLCHAIN_HOST_TASK:append =3D " ${ICECC_SDK_HOST_TASK}"
> > > +
> > > +python () {
> > > +=C2=A0 =C2=A0 if d.getVar('ICECC_DISABLED') !=3D "1":
> > > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 for task in ['do_configure', 'do_compile=
',
> > > 'do_compile_kernelmodules', 'do_install']:
> > > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVarFlag=
(task, 'network', '1')
> > > +}
> >=20
> > I did want to talk a little about the overhead this has. Basically
> > you've turned a simple flag setting into some anonymous python so
> > the
> > parsing overhead increases with it since there is now code parsing
> > and
> > execution to add in.
> >=20
> > For a single recipe this isn't so bad but when it is being added to
> > every recipe it adds up.
> >=20
> > I'm not against the change as such, I just see a continual flood of
> > patches adding conditions everywhere for various reasons and each
> > one
> > degrades parsing speed a little bit more (as well as complicates
> > the
> > test matrix).
> >=20
> > I personally don't use this class so I don't have a stake in this
> > one
> > but I thought it worth highlighting since I think the overhead of
> > this
> > was mentioned elsewhere and I think the overhead isn't widely
> > understood.
> >=20
>=20
>=20
> As the network evaluation patch was merged in bitbake:
> https://git.openembedded.org/bitbake/commit/?id=3D3d96c07f9fd4ba1a8482681=
1d14bb4e98ad58846
>=20
> I can send my inline version:
> https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Djansa/=
master&id=3D1b143f065ab5408f5543951a8c73fa01ce3ee0c1
>=20
> This works for master, for langdale and kirkstone we would need to
> backport this bitbake commit as well as "utils: Allow to_boolean to
> support int values", I have all 3 in my branches for kirkstone and
> langdale and can send them as soon as there is agreement to do that
> (e.g. top 5 changes from
> https://git.openembedded.org/bitbake-contrib/log/?h=3Djansa/2.0)

Just to explain things for the purposes of the archives, that inline
patch, whilst quite neat looking, will perform worse than the anonymous
python.

The reason is relatively simple. The anonymous python will run once,
the inline will cause 4 different python fragments to run at best when
the variable is expanded. Bitbake will have to expand it to compute the
recipes basehashes. In reality, the expansion cache is often
invalidated by datastore write operations so it can be expanded
multiple times.

I'm also reluctant to backport a performance regression and change in
behaviour back to stable branches so Jose's patch may be the better
option.

Cheers,

Richard


