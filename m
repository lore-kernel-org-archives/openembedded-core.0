Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C82F6C3F6B0
	for <webhook@archiver.kernel.org>; Mon, 15 Aug 2022 16:56:41 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.4731.1660582594192233097
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Aug 2022 09:56:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DtKrhBOG;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id s23so4090517wmj.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Aug 2022 09:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc;
        bh=i1+w5rwvG+BskEcO/+me4/mjKtOOEYl85nNxbsZPVtI=;
        b=DtKrhBOG7hBZVqpm//v+0ztpxIXAyLPz94oVo8683Lyqd4p0NZgowCys9cpSS6qoiV
         YNn/FnS6R4rWs2g6DjUF1JqcuLl1L2C1u3y+U+7oj4Kp4zAhjhYE0cS4f2ADF1AxOzx6
         5XAi2ISXdO7/g3/POUL/u7gh1dPvnEj6YIGio=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc;
        bh=i1+w5rwvG+BskEcO/+me4/mjKtOOEYl85nNxbsZPVtI=;
        b=noJhjuU6bNCfGbhPUMfSGkf/nqASeNzoNzpEveohOKfgoGxZBdBc2Yw8JoxwBUPuIB
         PyQFms1Fjfd0x+eK/1vH/i+G4DELiC1eASW+bJjali1cs9vVWNr1KUUPyob3VbOS8eCF
         saVBq9Ni9nu9gZ6UdE3tnW+HvAK1vCoO0Oil/BO/fAOc9wZWJRVXqWBaqiQj4m0EXNed
         cT7659EF6aXt66VoFfPiJXGPYO5GcBAPWK9P9skgTIkxo8hyOpvsdH6swpzFF//OM6tl
         5wGyAnW6WORmrqAnEttrKMBw+jq8AnS4yldLP05/3FHnF10EKo/CYRjWAcyUdsVkqaKb
         xv+Q==
X-Gm-Message-State: ACgBeo12oB2wyIDjONpHuYW2KoOGXWTWiEXfYkynq/W6wPdV+HbP3jeh
	jF2bYf7jo1WHmuk8acjbjiyrlg==
X-Google-Smtp-Source: 
 AA6agR5SHmGVOWJm5fCPXw37ke0V18dK1knS5nv9ZMsNRNHfYceF3Mg/cwxDhJQQ9ayqlk42BQfagQ==
X-Received: by 2002:a7b:cd0f:0:b0:3a5:ec59:daf0 with SMTP id
 f15-20020a7bcd0f000000b003a5ec59daf0mr4502468wmj.13.1660582592537;
        Mon, 15 Aug 2022 09:56:32 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:27d9:5f4a:b4:2f81?
 ([2001:8b0:aba:5f3c:27d9:5f4a:b4:2f81])
        by smtp.gmail.com with ESMTPSA id
 m8-20020a056000008800b0022063e5228bsm7711693wrx.93.2022.08.15.09.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Aug 2022 09:56:31 -0700 (PDT)
Message-ID: 
 <90f10fdbc5d44e771ce2c7e4b7c61a8e453c55e0.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 4/5] bitbake.conf: Handle S and B separately
 for debug mapping
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Mon, 15 Aug 2022 17:56:31 +0100
In-Reply-To: <ac198bef4bb248cead2a1c2e45b682eb@axis.com>
References: <20220813203501.1111519-1-richard.purdie@linuxfoundation.org>
	 <20220813203501.1111519-4-richard.purdie@linuxfoundation.org>
	 <ac198bef4bb248cead2a1c2e45b682eb@axis.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Aug 2022 16:56:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169357

On Mon, 2022-08-15 at 16:37 +0000, Peter Kjellerstedt wrote:
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-
> > core@lists.openembedded.org> On Behalf Of Richard Purdie
> > Sent: den 13 augusti 2022 22:35
> > To: openembedded-core@lists.openembedded.org
> > Subject: [OE-core] [PATCH 4/5] bitbake.conf: Handle S and B separately =
for
> > debug mapping
> >=20
> > We don't really need to keep S and B separate for debug source purposes
> > and there shouldn't be source references in WORKDIR that isn't S and B
> > either.
> >=20
> > Separating these out simplifies the shared-work directory handling for
> > gcc and should also help fix external source usage. Therefore handle
> > S and B in DEBUG_PREFIX_MAP separately and clean up other code.
> >=20
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> > =C2=A0meta/conf/bitbake.conf                      | 11 +++++++----
> > =C2=A0meta/recipes-devtools/gcc/gcc-runtime.inc   | 13 -------------
> > =C2=A0meta/recipes-devtools/gcc/libgcc-common.inc |  8 --------
> > =C2=A03 files changed, 7 insertions(+), 25 deletions(-)
> >=20
> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > index bdfb6784371..dd2df8a5520 100644
> > --- a/meta/conf/bitbake.conf
> > +++ b/meta/conf/bitbake.conf
> > @@ -645,10 +645,13 @@ EXTRA_OEMAKE:prepend:task-install =3D
> > "${PARALLEL_MAKEINST} "
> > =C2=A0# Optimization flags.
> > =C2=A0#################################################################=
#
> > =C2=A0# Beware: applied last to first
> > -DEBUG_PREFIX_MAP ?=3D "-fmacro-prefix-map=3D${WORKDIR}=3D/usr/src/debu=
g/${PN}/${EXTENDPE}${PV}-${PR} \
> > -                     -fdebug-prefix-map=3D${WORKDIR}=3D/usr/src/debug/=
${PN}/${EXTENDPE}${PV}-${PR} \
> > -                     -fdebug-prefix-map=3D${STAGING_DIR_HOST}=3D \
> > -                     -fdebug-prefix-map=3D${STAGING_DIR_NATIVE}=3D \
> > +DEBUG_PREFIX_MAP ?=3D "-fmacro-prefix-map=3D${S}=3D/usr/src/debug/${PN=
}/${EXTENDPE}${PV}-${PR} \
> > + -fdebug-prefix-map=3D${S}=3D/usr/src/debug/${PN}/${EXTENDPE}${PV}-${P=
R} \
> > + -fmacro-prefix-map=3D${B}=3D/usr/src/debug/${PN}/${EXTENDPE}${PV}-${P=
R} \
> > + -fdebug-prefix-map=3D${B}=3D/usr/src/debug/${PN}/${EXTENDPE}${PV}-${P=
R} \
> > + -fdebug-prefix-map=3D${STAGING_DIR_HOST}=3D \
> > + -fmacro-prefix-map=3D${STAGING_DIR_HOST}=3D \
> > + -fdebug-prefix-map=3D${STAGING_DIR_NATIVE}=3D \
> > =C2=A0"
>=20
> That should be:
>=20
> DEBUG_PREFIX_MAP ?=3D " \
> =C2=A0=C2=A0=C2=A0=C2=A0-fmacro-prefix-map=3D${S}=3D/usr/src/debug/${PN}/=
${EXTENDPE}${PV}-${PR} \
> =C2=A0=C2=A0=C2=A0=C2=A0-fdebug-prefix-map=3D${S}=3D/usr/src/debug/${PN}/=
${EXTENDPE}${PV}-${PR} \
> =C2=A0=C2=A0=C2=A0=C2=A0-fmacro-prefix-map=3D${B}=3D/usr/src/debug/${PN}/=
${EXTENDPE}${PV}-${PR} \
> =C2=A0=C2=A0=C2=A0=C2=A0-fdebug-prefix-map=3D${B}=3D/usr/src/debug/${PN}/=
${EXTENDPE}${PV}-${PR} \
> =C2=A0=C2=A0=C2=A0=C2=A0-fdebug-prefix-map=3D${STAGING_DIR_HOST}=3D \
> =C2=A0=C2=A0=C2=A0=C2=A0-fmacro-prefix-map=3D${STAGING_DIR_HOST}=3D \
> =C2=A0=C2=A0=C2=A0=C2=A0-fdebug-prefix-map=3D${STAGING_DIR_NATIVE}=3D \
> "
>=20
> to follow common variable indentation.

I should have mentioned this in the commit message but this was
deliberate. It avoids a ton of whitespace in the compiler commandline
which I think overrides the indentation standard give how commonly it
is used.

Cheers,

Richard



