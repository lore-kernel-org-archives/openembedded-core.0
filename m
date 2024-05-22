Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F3A6C25B7C
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 13:09:53 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.9582.1716383390171318195
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 May 2024 06:09:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DQn8ndiQ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-34d8d11a523so3078665f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 06:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1716383388; x=1716988188; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vQw+WDnfGLz7wWBY3vIaJudEJiPJDnpwCaLv1VwKaxM=;
        b=DQn8ndiQ4Ns5nkjMV5NgqyFo1PHtC3L24rhOmfXgCql7tT0RUBbPKaztgjZjndW4Wh
         Sk4LEIowKP+1rL08VmvPMU7oHBvGiN/7YOyhOi68ItfihMbqk2k01YlDzLQXzXIQAsqK
         d0YCwbxE0VKFf6ZaV3jSEsve4QmAVIJP8f/ws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716383388; x=1716988188;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vQw+WDnfGLz7wWBY3vIaJudEJiPJDnpwCaLv1VwKaxM=;
        b=cQn4olegWX2EckwrsLMlmokQ1V6qHVZZgQmmAIMYU7kABvGiTyx4cVOJCxyNuK5cuk
         ddKKgm5WD3hLSqaQPz+Cz3LfmhscdRF9p4FDq7rOzChuOglxRE/TV+BgYFWO4mDdEuAZ
         p6LhzqtzkYFLyvo7JnggCHAEGVR140QqgVR5LlG7mWEP5ZHkbneHk4oqGuhGXPMns0lR
         jLZpk2nUmt5gUoS86DK5VfRLpzwPElYy/NZ678wnoqd78hyD+j1O1e1lU//Jwwvg4AU1
         otF2kgvpUJ+mdq9GFZ9TRGAdfdItSrNLd2MY7m24ZpZk/EnTbZOeW6mbePxruU9Groog
         8rCg==
X-Forwarded-Encrypted: i=1; AJvYcCUlpE+3JBEA5ZTWy7w4tEUXUBDuy0RxLTCm/X8QSUNBol+nCkhNR1BEX+qm9QMkOFpeDYS27ific0aqjg1C4GRfzaAQ7B4QOsnk5RADXfb6VngvUY9PZZ0N
X-Gm-Message-State: AOJu0YxP70vGJNlmEVSSfRc/UWMVLkC3/LSVvAmfBrU4E8CIysUqsJWm
	YwsftQlodSYKu3YWOTOvi5sLlb3FP0go4CzMVnHRf/P2AXYmJ4m1H0gEkbnFIjuG0xoO/obTRxi
	Ac6Q=
X-Google-Smtp-Source: AGHT+IFBax0XPjkfza7HfwzKVsqGlPl+hZ7wZJ+6RIw9YKL8q2wCqSUbMRmhzPxAapCED0zh0F4bUg==
X-Received: by 2002:a5d:4ecd:0:b0:341:d8a9:5b7d with SMTP id ffacd0b85a97d-354d8d0150amr1310569f8f.28.1716383388609;
        Wed, 22 May 2024 06:09:48 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ef1c:155d:9d8e:11ce? ([2001:8b0:aba:5f3c:ef1c:155d:9d8e:11ce])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-354c2a40548sm9490942f8f.34.2024.05.22.06.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 06:09:48 -0700 (PDT)
Message-ID: <a24a5efe30e6cf61c30c56fa12e25bd29e6c9ec2.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/3] base: Switch UNPACKDIR to a subdir of
 WORKDIR
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Wed, 22 May 2024 14:09:47 +0100
In-Reply-To: <DB5PR02MB102130544E52F16C92DD69492EFEB2@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20240522092817.1250809-1-richard.purdie@linuxfoundation.org>
	 <DB5PR02MB102130544E52F16C92DD69492EFEB2@DB5PR02MB10213.eurprd02.prod.outlook.com>
Autocrypt: addr=richard.purdie@linuxfoundation.org; prefer-encrypt=mutual; keydata=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
 YNvg==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 13:09:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199750

On Wed, 2024-05-22 at 13:00 +0000, Peter Kjellerstedt wrote:
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org=C2=A0<openembedded-core@=
lists.openembedded.org> On Behalf Of Richard Purdie
> > Sent: den 22 maj 2024 11:28
> > To: openembedded-core@lists.openembedded.org
> > Subject: [OE-core] [PATCH 1/3] base: Switch UNPACKDIR to a subdir of WO=
RKDIR
> >=20
> > Change do_unpack to unpack files to a subdirectory of WORKDIR instead o=
f WORKDIR
> > itself. There are several good reasons for this but it is mainly about =
being able
> > to isolate the output of the unpack task and tell the files apart from =
other things
> > which are created in workdir (logs, sysroots, temp dirs and more).
> >=20
> > This means that when the do_unpack task reruns, we can clean UNPACKDIR =
and know
> > we have a standard point to start builds from.
> >=20
> > It also makes code in tools like devtool and recipetool easier.
> >=20
> > To reduce the impact to users, if a subdirectory under UNPACKDIR matche=
s
> > the first subdirectory under WORKDIR of S, that directory is moved into=
 position
> > inside WORKDIR. This preserves the behaviour of S =3D "${WORKDIR}/git",
> > S =3D "${WORKDIR}/${BPN}" and other commonly used source directory setu=
ps.
> >=20
> > The directory is moved since sadly many autotools based projects can't =
cope with
> > symlinks in their paths.
> >=20
> > The patch also updates reproducible and SOURCE_DATE_EPOCH handling to
> > match the new potential source locations. We can get rid of the horribl=
e
> > list of hardcoded directories in WORKDIR to ignore from that code.
> >=20
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> > =C2=A0meta/classes-global/base.bbclass | 28 +++++++++++++++++++++++----=
-
> > =C2=A0meta/conf/bitbake.conf=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> > =C2=A0meta/lib/oe/reproducible.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 19 ++=
++++++++---------
> > =C2=A03 files changed, 34 insertions(+), 15 deletions(-)
> >=20
> > diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/bas=
e.bbclass
> > index 066f3848f7c..13e91b24a3b 100644
> > --- a/meta/classes-global/base.bbclass
> > +++ b/meta/classes-global/base.bbclass
> > @@ -153,20 +153,38 @@ python base_do_fetch() {
> > =C2=A0}
> >=20
> > =C2=A0addtask unpack after do_fetch
> > -do_unpack[dirs] =3D "${UNPACKDIR}"
> > -
> > -do_unpack[cleandirs] =3D "${@d.getVar('S') if os.path.normpath(d.getVa=
r('S')) !=3D os.path.normpath(d.getVar('WORKDIR')) else os.path.join('${S}'=
, 'patches')}"
> > +do_unpack[cleandirs] =3D "${UNPACKDIR}"
> >=20
> > =C2=A0python base_do_unpack() {
> > +=C2=A0=C2=A0=C2=A0 import shutil
> > +
> > +=C2=A0=C2=A0=C2=A0 sourcedir =3D d.getVar('S')
> > +=C2=A0=C2=A0=C2=A0 # Intentionally keep SOURCE_BASEDIR internal to the=
 task just for SDE
> > +=C2=A0=C2=A0=C2=A0 d.setVar("SOURCE_BASEDIR", sourcedir)
> > +
> > =C2=A0=C2=A0=C2=A0=C2=A0 src_uri =3D (d.getVar('SRC_URI') or "").split(=
)
> > =C2=A0=C2=A0=C2=A0=C2=A0 if not src_uri:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return
> >=20
> > +=C2=A0=C2=A0=C2=A0 basedir =3D None
> > +=C2=A0=C2=A0=C2=A0 unpackdir =3D d.getVar('UNPACKDIR')
> > +=C2=A0=C2=A0=C2=A0 workdir =3D d.getVar('WORKDIR')
> > +=C2=A0=C2=A0=C2=A0 if sourcedir.startswith(workdir) and not sourcedir.=
startswith(unpackdir):
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 basedir =3D sourcedir.repla=
ce(workdir, '').strip("/").split('/')[0]
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if basedir:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.=
utils.remove(workdir + '/' + basedir, True)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.s=
etVar("SOURCE_BASEDIR", workdir + '/' + basedir)
> > +
> > =C2=A0=C2=A0=C2=A0=C2=A0 try:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fetcher =3D bb.fetch2.=
Fetch(src_uri, d)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fetcher.unpack(d.getVa=
r('UNPACKDIR'))
> > =C2=A0=C2=A0=C2=A0=C2=A0 except bb.fetch2.BBFetchException as e:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.fatal("Bitbake Fetc=
her Error: " + repr(e))
> > +
> > +=C2=A0=C2=A0=C2=A0 if basedir and os.path.exists(unpackdir + '/' + bas=
edir):
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Compatibility magic to en=
sure ${WORKDIR}/git and ${WORKDIR}/${BP}
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # as often used in S work a=
s expected.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 shutil.move(unpackdir + '/'=
 + basedir, workdir + '/' + basedir)
> > =C2=A0}
> >=20
> > =C2=A0SSTATETASKS +=3D "do_deploy_source_date_epoch"
> > @@ -199,8 +217,8 @@ addtask do_deploy_source_date_epoch_setscene
> > =C2=A0addtask do_deploy_source_date_epoch before do_configure after do_=
patch
> >=20
> > =C2=A0python create_source_date_epoch_stamp() {
> > -=C2=A0=C2=A0=C2=A0 # Version: 1
> > -=C2=A0=C2=A0=C2=A0 source_date_epoch =3D oe.reproducible.get_source_da=
te_epoch(d, d.getVar('S'))
> > +=C2=A0=C2=A0=C2=A0 # Version: 2
> > +=C2=A0=C2=A0=C2=A0 source_date_epoch =3D oe.reproducible.get_source_da=
te_epoch(d, d.getVar('SOURCE_BASEDIR') or d.getVar('S'))
> > =C2=A0=C2=A0=C2=A0=C2=A0 oe.reproducible.epochfile_write(source_date_ep=
och, d.getVar('SDE_FILE'), d)
> > =C2=A0}
> > =C2=A0do_unpack[postfuncs] +=3D "create_source_date_epoch_stamp"
>=20
> The following code is part of the anonymous python() function in base.bbc=
lass:
>=20
> =C2=A0=C2=A0=C2=A0 if os.path.normpath(d.getVar("WORKDIR")) !=3D os.path.=
normpath(d.getVar("S")):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.appendVar("PSEUDO_IGNORE_PAT=
HS", ",${S}")
> =C2=A0=C2=A0=C2=A0 if os.path.normpath(d.getVar("WORKDIR")) !=3D os.path.=
normpath(d.getVar("B")):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.appendVar("PSEUDO_IGNORE_PAT=
HS", ",${B}")
>=20
> Since it is (or will be) an error to have S =3D "${WORKDIR}", it should n=
ow be=20
> possible to move the addition of ${S} to PSEUDO_IGNORE_PATHS to bitbake.c=
onf.=20

Yes, we should be able to start finding and cleaning up things like
this.

> I also believe ${UNPACKDIR} should be added to PSEUDO_IGNORE_PATHS.

Why? I don't think we want UNPACKDIR there, we only need S.

> And on a related note, would it make sense to make B =3D ${WORKDIR} an er=
ror too?
> In which case the addition of ${B} to PSEUDO_IGNORE_PATHS could also be m=
oved=20
> to bitbake.conf.

I'd hope no one is doing that so yes, I'd also like to move that. We
can make that an error too.

Cheers,

Richard

