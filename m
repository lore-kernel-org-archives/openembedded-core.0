Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE74BC25B75
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 18:28:34 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web10.1524.1715797713791712536
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 May 2024 11:28:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=emFS2t/6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.180, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2e6ffe57c23so1998971fa.3
        for <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 11:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1715797712; x=1716402512; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=37w7hznzKykWZW0TQ9FYS8YCu79MDhwsc8E08lQ3aP4=;
        b=emFS2t/6fCmgqorajfbvjvN4fvdnM3zLAVX+ZSFYscdSWy73IZ6SBMbBY86lqCLLlr
         fjl11M5ik+eGQ3+0JWBi/IvznN81J19XVxR29Q1ZD0haziymHqe7MVPgS2vqFOY0NsxB
         kCLT3JUhnOrgC40XfFBqFSPYV129z5YETJdMk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715797712; x=1716402512;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=37w7hznzKykWZW0TQ9FYS8YCu79MDhwsc8E08lQ3aP4=;
        b=olnwjv9GjTUxcQGtPMGoFOrRLKnRAxRc2wW2uVID5Kv0vyn9/0hhYOGr9E6hxaXjXP
         WEMOZFrBdWmkfKZd4JCS06QJ8L4Xq+SBmNnd3pix3oYiL2LYMGhEp3ZrXQr+CM1HDiRA
         6Ab2H2mPjnmdgsfHP6G6uN7PTw2cNCPn7g1pli4VmscfuaKhYcFjssdVILEPJIg6ITzF
         gXVHGHXN/BJ7xUbBff4DYTLCBhQDw3l8ypdRRpfvj7FujIW+LqS/vn7r011CD/5MNXhM
         iwVM2b1uVQZQPqh/rmSBOZtuXxQulAftjrHU+BEJ45D+sI/fCBZK5WKq2w5yhnzhzhbe
         yNPw==
X-Forwarded-Encrypted: i=1; AJvYcCV5eHRiFWMWohdoA3BAT9ifbgOImW3NSOq8+jwpff6inOLDLrIbWleWMwLcQZjQ1Yx+QoLc+oObkUeX9vBKOF+JYPGPVXJHhQctsnSrLWXAWfB8o3XBnZ4I
X-Gm-Message-State: AOJu0YwlRuQuKf+R3yD5Q39cn+uUxM1SFFI2mZ+5d8r8OdOfQlJ52OGA
	o0B5lFsRqj1c7DtJyOzSp9Brl+oGui0VE/u1becGHlkokl5okjUs7Of/7B3T0Te7EGI25azLw5m
	mvVY=
X-Google-Smtp-Source: AGHT+IE4SQv+dQOK0p/MurSM+KcgATT/eQUhLnlBSWvNBTt7sMRBr8knUVQPcRjEzOCfwfcjU7drWg==
X-Received: by 2002:a2e:a7c5:0:b0:2e6:f4c1:31e5 with SMTP id 38308e7fff4ca-2e6f4c13875mr25557691fa.23.1715797711714;
        Wed, 15 May 2024 11:28:31 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:13b6:dedd:c8fc:b915? ([2001:8b0:aba:5f3c:13b6:dedd:c8fc:b915])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42016b88f99sm115327385e9.10.2024.05.15.11.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 11:28:31 -0700 (PDT)
Message-ID: <83e296cd1840fb6ad73209ac6d10593ff34dfa33.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 05/10] base: Switch UNPACKDIR to a subdir of
 WORKDIR
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Wed, 15 May 2024 19:28:30 +0100
In-Reply-To: <DB5PR02MB10213711E57BF5F07C4259761EFEC2@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20240515115620.420558-1-richard.purdie@linuxfoundation.org>
	 <20240515115620.420558-5-richard.purdie@linuxfoundation.org>
	 <DB5PR02MB10213711E57BF5F07C4259761EFEC2@DB5PR02MB10213.eurprd02.prod.outlook.com>
Autocrypt: addr=richard.purdie@linuxfoundation.org; prefer-encrypt=mutual; keydata=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
 YNvg==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 18:28:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199424

On Wed, 2024-05-15 at 17:42 +0000, Peter Kjellerstedt wrote:
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org=C2=A0<openembedded-core@=
lists.openembedded.org> On Behalf Of Richard Purdie
> > Sent: den 15 maj 2024 13:56
> > To: openembedded-core@lists.openembedded.org
> > Subject: [OE-core] [PATCH 05/10] base: Switch UNPACKDIR to a subdir of =
WORKDIR
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
>=20
> Would it be an option to create a symbolic link by default, and instead=
=20
> let the autotools bbclass replace it with a moved directory? If it is
> in fact only autotools based projects that have this problem.

Maybe. I've reached the point with this where I really didn't want to
try and explore that particular set of problems and I'd rather things
were consistent.

I'm not going to rule out trying to clean up and improve this somehow
in the future but for now, it works, it solves the original major
problem (cleanup of obsolete sources) and we have most of the major
pieces like devtool working. It also doesn't look as different to users
as moving S would from a documentation perspective.

I'm a bit torn on what the end result for S should look like. I'm happy
enough with the changes so far and I think the best thing to do is
merge these, then consider if we do want to go further or not.

> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> > =C2=A0meta/classes-global/base.bbclass | 21 ++++++++++++++++++---
> > =C2=A0meta/conf/bitbake.conf=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> > =C2=A02 files changed, 19 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/meta/classes-global/base.bbclass b/meta/classes-
> > global/base.bbclass
> > index 066f3848f7c..cdce0538273 100644
> > --- a/meta/classes-global/base.bbclass
> > +++ b/meta/classes-global/base.bbclass
> > @@ -153,20 +153,35 @@ python base_do_fetch() {
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
> > =C2=A0=C2=A0=C2=A0=C2=A0 src_uri =3D (d.getVar('SRC_URI') or "").split(=
)
> > =C2=A0=C2=A0=C2=A0=C2=A0 if not src_uri:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return
> >=20
> > +=C2=A0=C2=A0=C2=A0 sourcedir =3D d.getVar('S')
> > +=C2=A0=C2=A0=C2=A0 basedir =3D None
> > +=C2=A0=C2=A0=C2=A0 workdir =3D d.getVar('WORKDIR')
> > +=C2=A0=C2=A0=C2=A0 unpackdir =3D d.getVar('UNPACKDIR')
> > +=C2=A0=C2=A0=C2=A0 if sourcedir.startswith(workdir) and not sourcedir.=
startswith(unpackdir):
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 basedir =3D sourcedir.repla=
ce(workdir, '').strip("/").split('/')[0]
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.utils.remove(sourcedir, =
True)
>=20
> This remove() seems wrong and should not be needed. There are two=20
> cases here:
>=20
> 1) either ${S} =3D=3D ${WORKDIR}, in which case the above will remove=20
> =C2=A0=C2=A0 ${WORKDIR}, which is sure to lead to problems, or

Which is why S =3D WORKDIR has to become a hard error. We have to drop
support for it.

> 2) ${S} =3D=3D ${WORKDIR}/foo[/...], in which case the removal of=20
> =C2=A0=C2=A0 workdir + '/' + basedir below will also remove ${S} as=20
> =C2=A0=C2=A0 basedir =3D=3D "foo".

You're right. This code did go through several iterations as I found
all the weird corner cases this needs to support. Ultimately, I suspect
it should probably unconditionally remove ${S}. I'd need yet another
test run to try and identify if that causes any new weird issues
though.

>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if basedir:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.=
utils.remove(workdir + '/' + basedir, True)
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
> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > index b2c500d8739..75c850760f6 100644
> > --- a/meta/conf/bitbake.conf
> > +++ b/meta/conf/bitbake.conf
> > @@ -405,7 +405,7 @@ STAMP =3D
> > "${STAMPS_DIR}/${MULTIMACH_TARGET_SYS}/${PN}/${PV}"
> > =C2=A0STAMPCLEAN =3D "${STAMPS_DIR}/${MULTIMACH_TARGET_SYS}/${PN}/*-*"
> > =C2=A0BASE_WORKDIR ?=3D "${TMPDIR}/work"
> > =C2=A0WORKDIR =3D "${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}/${PN}/${PV}"
> > -UNPACKDIR ??=3D "${WORKDIR}"
> > +UNPACKDIR ??=3D "${WORKDIR}/sources-unpack"
>=20
> "sources-unpack" does not exactly fall off the tongue.
> Would "unpack" or "unpacked" be alternatives?

I don't feel they're as clear...

Cheers,

Richard

