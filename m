Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9F31CD37AC
	for <webhook@archiver.kernel.org>; Tue,  3 Sep 2024 19:34:02 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.32452.1725392035351513508
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Sep 2024 12:33:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IDt8bFuN;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-42bb7298bdeso64390735e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Sep 2024 12:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725392034; x=1725996834; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=huviZSYTUAT8tQRNwlwGFvb06fu3l3OLMA+JbR8/Bu4=;
        b=IDt8bFuNV1SQlZ5Elq4xiwWd9muSuJ1iQSdy8zQdlm71qB9HBS5BqeNU547R7fPd+J
         oxmh5vBSuurug8PQOgHsFDGSArQrzyn9ntoJfxW3xRIaBWH4eD2xfVMu2ucyG5ibVbX4
         ln4DqioDkVsl52jFy0PjnQUV+6KZf/SoAJH/bJygyUiqUOP6EqQ0cbTrHeosbwAU82oD
         dVjWXxX7cj69hrhisyJVjRraqmru/sXOywpaxpoMsWDHmulLaCXLfhhLoGDm/+TxZvt3
         bwMbjHA3bMLhjya1rQ48IQrYbyRhEBL4rbDXoDMFL1wcyjMhtTn4y2Ng2m5Kmp2Xb1xU
         c5QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725392034; x=1725996834;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=huviZSYTUAT8tQRNwlwGFvb06fu3l3OLMA+JbR8/Bu4=;
        b=bpJ6zrZ3HT8dttwuRccjf9zIN/dGs557wqkmJAD8mwJmalTHRNJ2h9fkymoeO+bmXj
         X+PbjTP++ekpe+VoiCHG37Qyem4/uWZU26MNpiErKV5zx3l8br6ABTs0S5DirWvybaSJ
         wsIACkw4rGnC/MM0A0S492Sfh+dSWPNaxbPMB9MBz4JjGXJh9FfxTt0xQrnvb1RgZxrO
         GrKDE715HbJHJsxWsQSehpimGDzbxAC9RGzZyCvG6ebFgDn+UVr1aLTZqmuCGK0Dvs0d
         QUaOD4Dq0FLUIziVA3X+yWpitXnXWytsuwdk7Di875ozIkDaYyan82CmEahsnzYqURIO
         Xi9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWPi4bP9g4NMfIssxmh2WTbkFIv9/hAQtN9mO5V10qpMEeO5dgXRrvvGG8l6SWbK2FGZt8b69sw7qsbPjoA9LxZUw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yywrt6loB9XyEstOiMNkfPTybNmOeksbDYamrp6n9qPibBjKEfF
	TDavSQT0SCMNCtIFVd2XRpFjeY9MbZq9XHO4Y7httWEkMEOvoQ5t
X-Google-Smtp-Source: AGHT+IG8Gd+nZkgdjAMYa7KWPfv6oKX6ztdh9OX5Y4CtzSoY65R4DYaNr7Eu7WDGqbQOHBRtXC1Kew==
X-Received: by 2002:a05:600c:3b11:b0:426:6714:5415 with SMTP id 5b1f17b1804b1-42bb01edd2bmr139306345e9.30.1725392032834;
        Tue, 03 Sep 2024 12:33:52 -0700 (PDT)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ba6425a77sm218698915e9.45.2024.09.03.12.33.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 12:33:52 -0700 (PDT)
Message-ID: <847e3405fe80cc0efd8949b6ba4b01241bd3247a.camel@gmail.com>
Subject: Re: [OE-core] [PATCH 3/3] devtool: remove obsolete
 SRCTREECOVEREDTASKS handling
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Date: Tue, 03 Sep 2024 21:33:51 +0200
In-Reply-To: <a3f27a205be6de32831548d12be2e019ac9f3371.camel@linuxfoundation.org>
References: <20240902203154.265515-1-adrian.freihofer@gmail.com>
	 <20240902203154.265515-3-adrian.freihofer@gmail.com>
	 <a3f27a205be6de32831548d12be2e019ac9f3371.camel@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40app2) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Sep 2024 19:34:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204175

On Tue, 2024-09-03 at 07:15 +0100, Richard Purdie wrote:
> On Mon, 2024-09-02 at 22:31 +0200, Adrian Freihofer via
> lists.openembedded.org wrote:
> > From: Adrian Freihofer <adrian.freihofer@siemens.com>
> >=20
> > The kernel-yocto.bbclass defines some tasks tasks and it also adds
> > these
> > tasks to the SRCTREECOVEREDTASKS list. There is no need for devtool
> > to
> > duplicate this code and override what the kernel-yocto.bbclass
> > already
> > does.
> >=20
> > devtool modify generates a linux-yocto.6.6.bbappend containing:
> > =C2=A0 SRCTREECOVEREDTASKS=3D"\
> > =C2=A0=C2=A0=C2=A0 do_fetch \
> > =C2=A0=C2=A0=C2=A0 do_kernel_checkout \
> > =C2=A0=C2=A0=C2=A0 do_kernel_configcheck \
> > =C2=A0=C2=A0=C2=A0 do_unpack \
> > =C2=A0=C2=A0=C2=A0 do_validate_branches \
> > =C2=A0 "
> > =C2=A0 do_patch[noexec] =3D "1"
> >=20
> > linux-yocto set SRCTREECOVEREDTASKS to
> > =C2=A0 SRCTREECOVEREDTASKS=3D"\
> > =C2=A0=C2=A0=C2=A0 do_fetch \
> > =C2=A0=C2=A0=C2=A0 do_kernel_checkout \
> > =C2=A0=C2=A0=C2=A0 do_kernel_configcheck \
> > =C2=A0=C2=A0=C2=A0 do_patch \
> > =C2=A0=C2=A0=C2=A0 do_unpack \
> > =C2=A0=C2=A0=C2=A0 do_validate_branches \
> > =C2=A0 "
> >=20
> > The code in devtool modify is therefore considered as redundant and
> > removed.
> >=20
> > Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> > ---
> > =C2=A0scripts/lib/devtool/standard.py | 3 ---
> > =C2=A01 file changed, 3 deletions(-)
> >=20
> > diff --git a/scripts/lib/devtool/standard.py
> > b/scripts/lib/devtool/standard.py
> > index 312eb8ab506..b2e1a6ca3a5 100644
> > --- a/scripts/lib/devtool/standard.py
> > +++ b/scripts/lib/devtool/standard.py
> > @@ -952,9 +952,6 @@ def modify(args, config, basepath, workspace):
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 f.write('EXTERNALSRC_BUILD:pn-%s =3D "%s"\n' % =
(pn,
> > srctree))
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 if bb.data.inherits_class('kernel', rd):
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 f.write('SRCTREECOVEREDTASKS =3D
> > "do_validate_branches do_kernel_checkout '
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'do_f=
etch do_unpack
> > do_kernel_configcheck"\n')
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 f.write('\ndo_patch[noexec] =3D "1"\n')
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 f.write('\ndo_kernel_configme:prepend() {\n'
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 '=C2=A0=C2=A0=C2=A0 if [ -e ${S}/.config ]; then\n'
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 '=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mv ${S}/.config
> > ${S}/.config.old\n'
>=20
>=20
> Note that "kernel" !=3D "linux-yocto". Does a standard kernel still
> need fetch/unpack?

externalsrc.bbclass defaults to:
SRCTREECOVEREDTASKS ?=3D "do_patch do_unpack do_fetch"
https://git.yoctoproject.org/poky/tree/meta/classes/externalsrc.bbclass#n28
This should be fine for "kernel" !=3D "linux-yocto".

I will send a v2 which mentions this in the commit message and fixes
the other finding with the uppercase PN.

Thank you for the review.
Adrian


>=20
> Cheers,
>=20
> Richard
>=20


