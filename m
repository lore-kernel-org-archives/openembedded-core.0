Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4E45C02182
	for <webhook@archiver.kernel.org>; Thu, 23 Jan 2025 09:12:19 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web10.6935.1737623535344903900
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jan 2025 01:12:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=c3ZIMmuj;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30613037309so6366911fa.3
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Jan 2025 01:12:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737623533; x=1738228333; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=clKcJl5lxoJhmx6kCQuq4BwMzD3US3i2o8bC2CepdtU=;
        b=c3ZIMmujuP6PM2//SqTHx8mi5BxniQaZGfCYl9rn/0UVEzd+4Z+CUnq+nXSnsxzWkZ
         VL8gKai2WygDqkl98XgPjWhkCglipnU583MMfdnn9DYVgtkV5xEyNfRyM4kiX3Yhy91d
         aRymZZTbRKr1j9ze0WdIhOfs9CBLKkeVSecNbS4VE+ihjahJv+UBHcnouu9qKNkof9oH
         EYZhCDxEBYoKvuj89E+qDjhy77r1N++dbMK2n81HQ6Pia5a9EjVeJfxGL3X5cjO6ryXm
         kGM4Mn1DeUyPxBoZWdZMJhHSoq1MMCm5ufwci6LYOqZWFQmuSlBXwKzziAFZr2k/O/Fs
         Fq3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737623533; x=1738228333;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=clKcJl5lxoJhmx6kCQuq4BwMzD3US3i2o8bC2CepdtU=;
        b=p4E231mHBQ02Wo3snzug3LL44JwqPwIXP2l8DC/HfT22NCMlkOtNmBh30VTYa769cY
         5gSWMWO78TIVOtx/uJ/udwBJc5HBFooUw+0cR600LkGoPOdDP0bPtjld9BJIwo0vk+uF
         xEN8rd/kzVUgZIx+Fnn+pubnL6MMr86z3QFDY0HghCUTmqkA06Ng0IDqj6jRoDp9Rasf
         yY4oBOMjEMjR9u4OPl3iiO/TiEXIItw6E8THIQMN9JnEDbyjJWo0HrmFFcGHhha3bzfl
         0M92DHREadhI8dlzz44yINPNfxbSehetIZmCu+CYIY+Wt7opoueXyPz3BlljsFe8TtnU
         CCBQ==
X-Gm-Message-State: AOJu0YyxhRj8McGXNH0A7Mt/NUFOZqqEAehXdmUEYrUNW3oyCM+GSRzU
	IS24PqzHhXP2aO71zQlUDDUTuSbNFD4McDMHcco8DQweTVR8Ah5OWJO+BuMCb91LMEANR+uH3kn
	tb3ZakWhsaijBe9nAdxl7beXn55U=
X-Gm-Gg: ASbGncvPEMNW+/19zqe1IvmUnGeNmBS+/Ja4Z1LRADZ8KuetJ87poFoJ08VcQ5B6cla
	a6SMmR8/X33R9gh2WmwbwtQhDt164Ytm3DT1+LsS8svhugULiBYOPUeByCYg+PVO6ZiotokGekR
	k=
X-Google-Smtp-Source: AGHT+IHwdLtqFPGWUmw8kWRZGJKXo0zIMRlTVQiyhvzIIlV4KDfndwHb0zAOZqUZnwOZMrMn8hE3B1M5SAjTAjf02FU=
X-Received: by 2002:a05:651c:1305:b0:300:1dbd:b252 with SMTP id
 38308e7fff4ca-3072ca60bc4mr70569881fa.7.1737623532923; Thu, 23 Jan 2025
 01:12:12 -0800 (PST)
MIME-Version: 1.0
References: <264405d9-4f89-4102-acf2-320e73235a59@gmail.com>
 <CA+chaQePYP7LVSK_Fxbuf-+MexZVwUpnn35CO7=2Ji3xB3nZeA@mail.gmail.com>
 <181CB1A49703171B.28835@lists.openembedded.org> <0f95eab6-489e-4be4-9add-5b0c5b39532a@gmail.com>
In-Reply-To: <0f95eab6-489e-4be4-9add-5b0c5b39532a@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 23 Jan 2025 10:11:59 +0100
X-Gm-Features: AWEUYZkqu65cqxjrN_L760czFhPdJqLrtphIvnj0QSPCaSL1VGmUvAGB4aiVO5I
Message-ID: <CA+chaQctwfYRBvb23gMpmH4NPZt=xieZdc-5XT1uX3iXd4PFgA@mail.gmail.com>
Subject: Re: [OE-core] npm based packages omit dependencies since Yocto 5.1
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex.kanavin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jan 2025 09:12:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210182

Please try it with the changes from
https://lists.openembedded.org/g/bitbake-devel/message/16920 as well.
I believe the destsuffix=3Dnpm doesn't work with them anymore, it
doesn't for me, but unfortunately I haven't had the time yet to figure
out why and provide proper feedback on that RFC.

On Tue, Jan 21, 2025 at 5:26=E2=80=AFPM B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=
=A1n <zboszor@gmail.com> wrote:
>
> The recent changes in Yocto master with the unmodified recipe didn't help=
.
> But npmsw://...;destsuffix=3Dnpm in the recipe did.
>
> Thanks again!
>
> 2025. 01. 21. 12:27 keltez=C3=A9ssel, Zoltan Boszormenyi via lists.openem=
bedded.org =C3=ADrta:
> > That's it! ;destsuffix=3Dnpm helped with Yocto 5.1.
> > Thank you very much!
> >
> > I will re-test with Yocto master and report back.
> >
> > 2025. 01. 21. 11:53 keltez=C3=A9ssel, Martin Jansa =C3=ADrta:
> >> I believe it's the side effect of UNPACKDIR changes, I had to add
> >> ;destsuffix=3Dnpm in all npmsw:// entries (or ;destsuffix=3Dgit where =
S is
> >> set to WORKDIR/git) for dependencies in node_modules to be unpacked
> >> where they used to be before.
> >>
> >> On Tue, Jan 21, 2025 at 11:31=E2=80=AFAM Zoltan Boszormenyi via
> >> lists.openembedded.org <zboszor=3Dgmail.com@lists.openembedded.org>
> >> wrote:
> >>> Hi,
> >>>
> >>> I have a minimalistic recipe for pm2 (https://www.npmjs.com/package/p=
m2):
> >>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>> node-pm2_5.3.1.bb
> >>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>> SUMMARY =3D "Production process manager for Node.JS applications with=
 a built-in load
> >>> balancer."
> >>> HOMEPAGE =3D "http://pm2.keymetrics.io/"
> >>> LICENSE =3D "AGPL-3.0-or-later"
> >>> LIC_FILES_CHKSUM =3D "file://GNU-AGPL-3.0.txt;md5=3D9f9fa01c099265d62=
f73735e404ff8bb"
> >>>
> >>> SRC_URI =3D " \
> >>>       npm://registry.npmjs.org/;package=3Dpm2;version=3D${PV} \
> >>>       npmsw://${THISDIR}/${BPN}/npm-shrinkwrap.json \
> >>>       "
> >>>
> >>> S =3D "${UNPACKDIR}/npm"
> >>>
> >>> inherit npm
> >>>
> >>> do_install:append () {
> >>>           rm -rf ${D}${libdir}/node_modules/pm2/lib/templates/init-sc=
ripts/openrc.tpl
> >>> }
> >>>
> >>> RDEPENDS:${PN} =3D "bash"
> >>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>>
> >>> Previously this recipe has built and worked correctly under
> >>> Yocto 4.3 and 5.0, as in the package included its own internal
> >>> dependencies in /usr/lib/node_modules/pm2/node_modules.
> >>> Yocto 4.3 ships nodejs 20.8.1, Yocto 5.0 ships nodejs 20.12.2.
> >>>
> >>> With Yocto 5.1 (node 20.18.0) and master (22.12.0), the package
> >>> only has the pm2 module contents in /usr/lib/node_modules/pm2
> >>> but no dependencies.
> >>>
> >>> It seems that at some point, nodejs 20.x LTS upgraded npm
> >>> to a version with a breaking change which now flattens the
> >>> dependencies into a single level in /usr/lib/node_modules
> >>> from the previously accustomed dependency tree in
> >>> /usr/lib/node_modules/pm2/node_modules.
> >>>
> >>> Is there an incantation of EXTRA_OENPM or the npm:// SRC_URI
> >>> that would allow either to unflatten the dependency tree, or
> >>> include the dependencies as well as the main node module?
> >>>
> >>> Thanks in advance,
> >>> Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi
> >>>
> >>>
> >>>
> >>>
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#210090): https://lists.openembedded.org/g/openembed=
ded-core/message/210090
> > Mute This Topic: https://lists.openembedded.org/mt/110731121/3617728
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
zboszor@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

