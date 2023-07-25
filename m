Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54A32C0015E
	for <webhook@archiver.kernel.org>; Tue, 25 Jul 2023 10:29:43 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.17210.1690280980736147312
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jul 2023 03:29:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Wf/4rBsj;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-31438512cafso4876098f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Jul 2023 03:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1690280979; x=1690885779;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jGSwRLCG8JNVW0pxjNXOO3W1PoqwMNXonMZHrYDJ/Vg=;
        b=Wf/4rBsjH1XxiUQbc/V12ddiC7VA4ce5/uKVkYhadIMAfpdjcv6UKWwOLS+YSQDMIv
         omkw9k1Kduej3mfVykfgYgqYWlJMQ1c55u/104vg+xJgZdf40SM4xPhWzjKn49Jg9bGt
         K+kevB4knQGVtuDPsFYX4pExe28VEPVgnw9dg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690280979; x=1690885779;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jGSwRLCG8JNVW0pxjNXOO3W1PoqwMNXonMZHrYDJ/Vg=;
        b=LiKGLVRnrzgvUQ0G3w4ZJtUSbryBqoWhBrqJ3cD98yZ2UeVTWVX2pAKh1FH/M/RKlL
         Ar8Ji88XVB2gCSMCrmLLcioQG12UWXahJzlFm5AEHOCqY7cZ8e1/shEIsrkB9hPBXa+D
         Kb4e9ULyfnVfBWft27KDHJeohM/+Gi4XUMdV5AUHodjgTxjVy06ds8M+NQs26LggGWUd
         T1gs7yb6ZIWroES2AAKTGC8W7IebgrgZfqWdMvzxohB10z+KFiS3eJh/yOaZ4rDB8dDG
         BLRAXRnXr31++ExQ7/DoXoZvr8o0AfsmGhF1M6rNRDS2iCNaoTBTSKAmgIekVjHvLbPB
         9EuQ==
X-Gm-Message-State: ABy/qLatTNYBewuc30+QryJgvprqQHDm0FJjRP3KD/X9mw5EjIKFVHor
	6HTfTvq4IIT+HJMzy3VkT+BwVw==
X-Google-Smtp-Source: APBJJlG90wR6g/e4p21tNghskUxfZ12v5ReVcxPuPEMfPxscjl1BS6wlWMMlSKr/5MVcW8AFyfrs2g==
X-Received: by 2002:a5d:5965:0:b0:317:3a18:df26 with SMTP id e37-20020a5d5965000000b003173a18df26mr7696389wri.39.1690280978919;
        Tue, 25 Jul 2023 03:29:38 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:42df:c474:f29d:a4f9? ([2001:8b0:aba:5f3c:42df:c474:f29d:a4f9])
        by smtp.gmail.com with ESMTPSA id t15-20020a5d49cf000000b003143765e207sm15931980wrs.49.2023.07.25.03.29.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jul 2023 03:29:38 -0700 (PDT)
Message-ID: <594e2d0f34266070c7b257ac150d9d48d54c23d1.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] rpm: Install and/or tweak rpm macros file to
 make rpmbuild work
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: =?ISO-8859-1?Q?B=F6sz=F6rm=E9nyi_Zolt=E1n?= <zboszor@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: Ross Burton <Ross.Burton@arm.com>
Date: Tue, 25 Jul 2023 11:29:37 +0100
In-Reply-To: <ec544384-9953-5448-1cd0-35d5385409f5@gmail.com>
References: <20230724123529.288581-1-zboszor@gmail.com>
	 <0a32f2ba6a3d55a160423da13ffc3e3f30a1e02a.camel@linuxfoundation.org>
	 <b000bd79-9788-5345-eaee-b50f27d2fe45@gmail.com>
	 <fdd49f8d5f6bbf5814b9b27a400f16d367ced3ae.camel@linuxfoundation.org>
	 <ec544384-9953-5448-1cd0-35d5385409f5@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Jul 2023 10:29:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184833

On Tue, 2023-07-25 at 12:24 +0200, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n w=
rote:
> 2023. 07. 24. 22:16 keltez=C3=A9ssel, Richard Purdie =C3=ADrta:
> > On Mon, 2023-07-24 at 20:13 +0200, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=
=A1n wrote:
> > > 2023. 07. 24. 17:59 keltez=C3=A9ssel, Richard Purdie =C3=ADrta:
> > > > On Mon, 2023-07-24 at 14:35 +0200, Zoltan Boszormenyi wrote:
> > > > > Some BSP architecture builds (e.g. genericx86-64 or anything from
> > > > > meta-intel) don't have their /usr/lib/rpm/platform/<arch>-linux
> > > > > directories. This causes rpmbuild fail on the target machine.
> > > > >=20
> > > > > Use ${SDK_ARCH}-linux as the base arch which likely exists in
> > > > > /usr/lib/rpm/platform and clone it as ${MACHINE_ARCH}-linux.
> > > > >=20
> > > > > Also, fix %_lib and %_libdir in the new cloned platform directory
> > > > > to use ${baselib} and ${libdir} so the RPM package contents will
> > > > > be correct for library packages.
> > > > >=20
> > > > > Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gm=
ail.com>
> > > > > ---
> > > > >    meta/recipes-devtools/rpm/rpm_4.18.1.bb | 13 +++++++++++++
> > > > >    1 file changed, 13 insertions(+)
> > > > >=20
> > > > > diff --git a/meta/recipes-devtools/rpm/rpm_4.18.1.bb b/meta/recip=
es-devtools/rpm/rpm_4.18.1.bb
> > > > > index 95a9e92f96..21f0127561 100644
> > > > > --- a/meta/recipes-devtools/rpm/rpm_4.18.1.bb
> > > > > +++ b/meta/recipes-devtools/rpm/rpm_4.18.1.bb
> > > > > @@ -131,7 +131,20 @@ do_install:append:class-nativesdk() {
> > > > >    # Rpm's make install creates var/tmp which clashes with base-f=
iles packaging
> > > > >    do_install:append:class-target() {
> > > > >        rm -rf ${D}/var
> > > > > +
> > > > > +    if [ -d "${D}${prefix}/lib/rpm/platform/${SDK_ARCH}-linux" ]=
; then
> > > > > +        if [ ! -d ${D}${prefix}/lib/rpm/platform/${MACHINE_ARCH}=
-linux ]; then
> > > > > +            cp -r ${D}${prefix}/lib/rpm/platform/${SDK_ARCH}-lin=
ux ${D}${prefix}/lib/rpm/platform/${MACHINE_ARCH}-linux
> > > > > +        fi
> > > > > +    fi
> > > > SDK_ARCH should not be referenced outside of nativesdk recipes. Thi=
s
> > > > reference is almost certainly incorrect as it would make the target
> > > > recipe dependent on the value of SDKMACHINE.
> > > Please advise what setting should be used instead.
> > >=20
> > > MACHINE_ARCH is what ends up in /etc/rpm/platform.
> > > TARGET_ARCH is not available in Honister but SDK_ARCH is.
> > >=20
> > > Suggest a common setting that can be used in both older and
> > > newer Yocto versions that has the base arch name and is
> > > usable for target builds.
> > I'm afraid I don't understand the problem you're running into from your
> > description so I don't know how to answer that. TARGET_ARCH has been
> > around in OE for many years so I'd be surprised it is unavailable in
> > honister though.
>=20
> I usually verify variable settings via "bitbake -e packagename"
> and what I can see is that this:
>=20
> bitbake -e rpm >rpm-vars.txt 2>&1
> grep TARGET_ARCH rpm-vars.txt
>=20
> shows TRANSLATED_TARGET_ARCH on Honister with TARGET_ARCH missing.
> Can I still use TARGET_ARCH in the rpm recipe on this old Yocto version?

In honister there is this:

$ grep TARGET_ARCH.*export * -R
meta/conf/bitbake.conf:# Make sure TARGET_ARCH isn't exported
meta/conf/bitbake.conf:TARGET_ARCH[unexport] =3D "1"

which is why it doesn't show up in bitbake -e, the variable does exist
though.

Cheers,

Richard

