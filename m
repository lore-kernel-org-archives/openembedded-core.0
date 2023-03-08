Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47B3AC74A4B
	for <webhook@archiver.kernel.org>; Wed,  8 Mar 2023 10:18:10 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.3592.1678270684646138883
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Mar 2023 02:18:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IHryY4kx;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id az36so9475105wmb.1
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 02:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1678270683;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zlF5R+n81vQ9K8O/F8XTWr3SecefWQUMYY333/JabHQ=;
        b=IHryY4kx+kspPWISP7DfuaqXt9s4oNRu3+JbfZMGgqPasia8aGwporUeoEZ45FcYHv
         LReOj9OMyVhAI9h+b6LmfipPqLoK4he4/JYmdVh4wyQSyyP7W230KJhd0r2S+209n3Yk
         ann8RsOI2srkya1FymXFdXjlQo0XE+vUMvFBw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678270683;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zlF5R+n81vQ9K8O/F8XTWr3SecefWQUMYY333/JabHQ=;
        b=P13RkVSpBaw5X5KLCkfpj/rdq1iClnQp+HIE8TpuiHQuhIi1CQPoO6xl38Hfsd97Z1
         uxY85r+w0OI3vDcUVHL8KEleDagJtcMeVZJ0co/lSFKtQm1kgk8s/nuhQeRnvz4XyHWV
         M0qjY6P74LyRZ8AcDXgYxBSbGzX9u1Hzw11Xo64hv2nUUsPej0+uosgl8/ezVvICooOf
         iNGCMDhq2KYWggyW3j3JxPQynM5j2rPF4oyKwOCWWMZAJpBI1/3yi9X9uOrZ8Hgpv/bZ
         aW5Co5eM501ifI0Rj7ZVfxZOByCbYVqKpqbBt7Z4Wj8t+QBKpSJdaU/PzJIiskO6I1aZ
         FN2g==
X-Gm-Message-State: AO0yUKWemICSboxWX6P3ApZ2sKm19wV+f/FseLIU6DmEjEsSCsEPVXp1
	IbUv+2x7+aciQAPou3Va5l3nIVQglnHVon8Xq98=
X-Google-Smtp-Source: AK7set+VuM+wr/dvKpBGNdKK/McC5L6/VXuiiKfHjHCwRd4KffDqpiR81U5zwRdOrtHBLF2ectBEWw==
X-Received: by 2002:a05:600c:1906:b0:3eb:3c76:c23c with SMTP id j6-20020a05600c190600b003eb3c76c23cmr15846037wmq.3.1678270683150;
        Wed, 08 Mar 2023 02:18:03 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:1eb8:fdef:c144:ef0b? ([2001:8b0:aba:5f3c:1eb8:fdef:c144:ef0b])
        by smtp.gmail.com with ESMTPSA id t10-20020a05600c198a00b003e11f280b8bsm20527350wmq.44.2023.03.08.02.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 02:18:02 -0800 (PST)
Message-ID: <2e299a9c85e296fd265c3598f1329da78ba3c425.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] sstate.bbclass: fix cleanup when sysroot
 in manifest != RECIPE_SYSROOT
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ovidiu Panait <ovidiu.panait@windriver.com>, Ovidiu Panait
 <ovidiu.panait@eng.windriver.com>, openembedded-core@lists.openembedded.org
Date: Wed, 08 Mar 2023 10:18:01 +0000
In-Reply-To: <b9769316-02e6-90d2-fda6-4892bd1e8b02@windriver.com>
References: <20230227154230.3566400-1-ovidiu.panait@eng.windriver.com>
	 <20230227154230.3566400-2-ovidiu.panait@eng.windriver.com>
	 <1bb2511c3505e7d215e74fe3aaffe8d7bbf51976.camel@linuxfoundation.org>
	 <b0a4bad5-3c42-5b61-497d-4e2c9a74b828@windriver.com>
	 <72a6bfc96bebf4bc8a6d3720b072e65e38a2c515.camel@linuxfoundation.org>
	 <b9769316-02e6-90d2-fda6-4892bd1e8b02@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 10:18:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178163

On Wed, 2023-03-08 at 08:52 +0200, Ovidiu Panait wrote:
> On 3/7/23 22:45, Richard Purdie wrote:
> > CAUTION: This email comes from a non Wind River email account!
> > Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
> >=20
> > On Tue, 2023-03-07 at 21:04 +0200, Ovidiu Panait wrote:
> > >=20
> > > The manifest files still show lib32-recipe-sysroot instead of
> > > recipe-sysroot (the manifest file seems to have already been cached b=
y
> > > lib32-gcc-cross-arm):
> > > $ head -2
> > > tmp/work/x86_64-nativesdk-pokysdk-linux/gcc-cross-canadian-arm/12.2.0=
-r0/recipe-sysroot-native/installeddeps/lib32-linux-libc-headers
> > > lib32-recipe-sysroot/usr/include/asm/byteorder-32.h
> > > lib32-recipe-sysroot/usr/include/asm/sigcontext-32.h
> > >=20
> > > MLPREFIX is set to lib32- for gcc-cross-canadian-arm, so the existing
> > > manifest file with lib32-recipe-sysroot paths is used:
> > > $ bitbake -e gcc-cross-canadian-arm | grep ^MLPREFIX
> > > MLPREFIX=3D"lib32-"
> > >=20
> > > Adding an exception for cross-canadian to the the mlprefix code added
> > > earlier seems to make it work:
> > >=20
> > > diff --git a/meta/classes-global/staging.bbclass
> > > b/meta/classes-global/staging.bbclass
> > > index e6d0d1d55c..a9142ce780 100644
> > > --- a/meta/classes-global/staging.bbclass
> > > +++ b/meta/classes-global/staging.bbclass
> > > @@ -276,6 +276,10 @@ python extend_recipe_sysroot() {
> > >        stagingdir =3D d.getVar("STAGING_DIR")
> > >        sharedmanifests =3D d.getVar("COMPONENTS_DIR") + "/manifests"
> > >        mlprefix =3D d.getVar("MLPREFIX")
> > > +    if "-cross-canadian" in pn:
> > > +        mlprefix =3D "nativesdk-"
> > >        if mlprefix:
> > >            sharedmanifests =3D sharedmanifests + "/" + mlprefix
> > >        recipesysroot =3D d.getVar("RECIPE_SYSROOT")
> > Was this in a clean build? The change will need a clean TMPDIR to
> > properly take effect. I didn't force everyone to rebuild since the
> > issue is reported so rarely and has been present for a long time.
> Yes, this is still reproducible in a clean build, with a fresh poky=20
> clone. Same steps as before:
>=20
> git clone https://github.com/yoctoproject/poky.git;=C2=A0 cd poky/; .=20
> oe-init-build-env
>=20
>=20
> add to local.conf:
> require conf/multilib.conf
> MACHINE =3D "qemuarm64"
> MULTILIBS =3D "multilib:lib32"
> DEFAULTTUNE:virtclass-multilib-lib32 =3D "armv7athf-neon"
>=20
> bitbake gcc-cross-canadian-arm
>=20
> update local.conf to force a rebuild:
> GCCPIE =3D "--disable-default-pie"
>=20
> bitbake gcc-cross-canadian-arm
>=20

Sorry, it looks like I messed something up in testing. The approach is
the right one but as you mention, it isn't quite working.

I've sent another patch which does work with the steps above. We can't
just use nativesdk since the file lists of the different canadian
targets may be different and would cause a different kind of failure. I
therefore tweaked the prefix accordingly and made the fix multilib
specific at the call site that triggers the issue.

Cheers,

Richard


