Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58048EC8738
	for <webhook@archiver.kernel.org>; Thu,  7 Sep 2023 15:20:22 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.15626.1694100015959697849
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Sep 2023 08:20:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TAcN1CvM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-401b5516104so12032275e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Sep 2023 08:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1694100014; x=1694704814; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=n9m67171Duy9u+hS5CHtsNNupYKMtln3B7N/ObZyFtw=;
        b=TAcN1CvMSyj35naeaVr8ARNEZRGDNE3qIIxSzejaoH5sQf+vbweMogqUZl+fxRRMni
         PpXsQ0o79yqQlkL56c59Y4uOPMGTCQGZKCBluieGVhCgWZvCMiHJa2gqrJIMm1L4w9XS
         RkxWq60Di9WmhfeDAYZ6qo8cc9X7He4FmSRHA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694100014; x=1694704814;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n9m67171Duy9u+hS5CHtsNNupYKMtln3B7N/ObZyFtw=;
        b=P6ZV9ql3/bIpOIjLSKEEEgC5wxxIT0U3RsuhdU4gQqHn3f/YKqVOnDYwCx1NwAUFzd
         89EBMk1qKyDr+ugB2IzGua74J7G95Co3wD7bIBIwjhebGQKF6on+efcuK4QynJqAkDut
         gN4fO4cdwr/1qXxnpll0xrROPsfqZq8Hg3PiQVC36ZNeQg85l2AkYkGGNFZlcXprmACI
         QjIf3s0Lo85jdYr9GF/yJFPdA+LhIX7fyR9bUE91miTnUiPdAx9aQNpzZPYByMxhAD7J
         8GeCm7JPwG2o2z/yEl4Nkg/3HhOaETpquf1RlSdX2ujqLQnDa89WzcYh7TMG2lc6RgSh
         hIjA==
X-Gm-Message-State: AOJu0Yw9KxEGjH8/8p4YRiL81Fl372V65hCqyiCzDCz3KUxVfKCrQFmt
	Gf0b5ziSHRnO4038PUkS+AN0TQ==
X-Google-Smtp-Source: AGHT+IEHekud/7PzN4yJzQ7sKsIVqfnrJBmQY3oZvB5clgnSATQeXfgkSUEFg2cQqGUUPVa40JKqQA==
X-Received: by 2002:a05:600c:204d:b0:402:e68f:888a with SMTP id p13-20020a05600c204d00b00402e68f888amr22723wmg.3.1694100014284;
        Thu, 07 Sep 2023 08:20:14 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5f38:2f43:a165:5f10? ([2001:8b0:aba:5f3c:5f38:2f43:a165:5f10])
        by smtp.gmail.com with ESMTPSA id v8-20020a05600c214800b00401c9228bf7sm2816875wml.18.2023.09.07.08.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 08:20:13 -0700 (PDT)
Message-ID: <76baa8fcdcec7125b30dcf050af6a84c7a4c59bd.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] pybootchartgui: also match subtasks of the
 main ones
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Jose Quaresma
	 <jose.quaresma@foundries.io>
Date: Thu, 07 Sep 2023 16:20:12 +0100
In-Reply-To: <CANPvuRmWb+TtJoQ__9nWa9dPmTGNaMKob8pLAL-+tok72UWOvA@mail.gmail.com>
References: <20230829143541.3837919-1-jose.quaresma@foundries.io>
	 <bf604882ff482c21044429a08a31fe07efc5b0e7.camel@linuxfoundation.org>
	 <CANPvuRmWb+TtJoQ__9nWa9dPmTGNaMKob8pLAL-+tok72UWOvA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Sep 2023 15:20:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187388

On Thu, 2023-09-07 at 15:59 +0100, Jose Quaresma wrote:
>=20
>=20
> Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia
> quinta, 7/09/2023 =C3=A0(s) 15:16:
> > On Tue, 2023-08-29 at 14:35 +0000, Jose Quaresma wrote:
> > > This will match other deviation subtask of the same main task,
> > > a couple of them can be found on oe-core layer:
> > > =C2=A0 do_compile_kernelmodules
> > > =C2=A0 do_compile_ptest
> > > =C2=A0 native_add_do_populate_sysroot_deps
> > > =C2=A0 do_package_qa
> > > =C2=A0 cmake_do_configure
> > > =C2=A0 setuptools3_do_configure
> > > =C2=A0 cargo_common_do_configure
> > > =C2=A0 python_pyo3_do_configure
> > > =C2=A0 python_setuptools3_rust_do_configure
> > >=20
> > > Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> > > ---
> > > =C2=A0 scripts/pybootchartgui/pybootchartgui/draw.py | 18 +++++++++--=
-
> > > ------
> > > =C2=A0 1 file changed, 9 insertions(+), 9 deletions(-)
> > >=20
> > > diff --git a/scripts/pybootchartgui/pybootchartgui/draw.py
> > > b/scripts/pybootchartgui/pybootchartgui/draw.py
> > > index 3d1ff695c1..2beb3c7c67 100644
> > > --- a/scripts/pybootchartgui/pybootchartgui/draw.py
> > > +++ b/scripts/pybootchartgui/pybootchartgui/draw.py
> > > @@ -661,20 +661,20 @@ def render_processes_chart(ctx, options,
> > > trace, curr_y, width, h, sec_w):
> > > =C2=A0=20
> > > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #print("proc at %s %=
s %s %s" % (x, y, w, proc_h))
> > > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 col =3D None
> > > -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if task =3D=3D "do_compile=
":
> > > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if "_setscene" in task:
> > > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 col =3D WHIT=
E
> > > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif "do_compile" in task:
> > > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 col =
=3D TASK_COLOR_COMPILE
> > > -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif task =3D=3D "do_confi=
gure":
> > > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif "do_configure" in tas=
k:
> > > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 col =
=3D TASK_COLOR_CONFIGURE
> > > -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif task =3D=3D "do_insta=
ll":
> > > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif "do_install" in task:
> > > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 col =
=3D TASK_COLOR_INSTALL
> > > -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif task =3D=3D "do_popul=
ate_sysroot":
> > > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif "do_populate_sysroot"=
 in task:
> > > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 col =
=3D TASK_COLOR_SYSROOT
> > > -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif task =3D=3D "do_packa=
ge":
> > > -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 col =3D TASK=
_COLOR_PACKAGE
> > > -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif task =3D=3D "do_packa=
ge_write_rpm" or \
> > > -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0task =3D=3D "do_package_write_deb" or \
> > > -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0task =3D=3D "do_package_write_ipk":
> > > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif "do_package_write" in=
 task:
> > > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 col =
=3D TASK_COLOR_PACKAGE_WRITE
> > > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif "do_package" in task:
> > > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 col =3D TASK=
_COLOR_PACKAGE
> > > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:
> > > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 col =
=3D WHITE
> > > =C2=A0=20
> >=20
> > I'm a bit torn on this as the patch changes the approach of the
> > code.
> >=20
> > Currently, the tasks are marked without any fuzz, i.e. it matches
> > do_compile alone. The code is entirely consistent in that all the
> > other
> > areas match specific tasks too.
> >=20
> > After the change you're changing the meaning to "any compile task"=C2=
=A0
> > and
> > "any configure task".
> >=20
>=20
>=20
> Yeah that was my intention and they still be consistent by color but
> now=C2=A0
> matching a sequential group of tasks:
>=20
> "any configure task" -> "any compile task" -> "any package task" ->
> "any package write task" -> "do_populate_sysroot"
>=20
> and in this way it is easier to identify the color patterns of the
> above groups,
> currently we get a couple of white bars for the majority of the
> tasks.=C2=A0
>=20
> >=20
> > I'm not entirely convinced this is a good thing. Should do_package
> > match do_package_qa for example? Those are quite different. I think
> > we're swapping something which is currently at least quite clear
> > for
> > something which is very fuzzy and not easy for the user to
> > understand
> > without looking at the code :/.
> >=20
>=20
>=20
> I can rework the patch to have the same colors as before with more
> new colors
> for the new tasks I added but with many colors=C2=A0It will be harder to
> understand.

How about a compromise. Keep do_compile and "compile like" tasks
separate and use a pale version of the compile colour for "compile
like". Do something similar for configure and leave the others
unchanged?


Cheers,

Richard

