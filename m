Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40AA6F419A6
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 13:16:34 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18666.1776258987426379825
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 06:16:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RitgAv8K;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43d73422431so2833413f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 06:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1776258986; x=1776863786; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0/4yHIJAVG0YJkrpCe3VUo4z3FNJ98XkuB6vh450SmU=;
        b=RitgAv8KmvmI03wCNf4/AH679KaOE5X9sxHFb2whCeZmT0n8gLa84w18Ph+/LEqmuK
         7llk4cNw5DJIPKDR+EwJ7e5milImvOoNtWx1lt/0FbMqup0iqnvyC2jGrfvcUzp9yo0G
         tLuPoyZT8Oj7aCXjioc+q/vvyV4snswkYzlAg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776258986; x=1776863786;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0/4yHIJAVG0YJkrpCe3VUo4z3FNJ98XkuB6vh450SmU=;
        b=LgHTKai87CLKHGtRkAhEiH3CTxToH05+F0OE1Z0q/jKPQGubGAN6VC7Q9v4Rk2vvAf
         deGMYVLOgOb9kruVREbJukkjRwBJDDRDMEq8CMraXS36V0aIrXBQmJ1E+LubWV5CeNGk
         VDPEuKE/LMjzaO/m5M8H2BFckqzEjtvjlI21HcKxx5cyoxSJzPK3OgVyVTplVyXEIrlb
         Vs5eaaz208prpcUnOx35taTfP8CZqmEjIBq8gP1u5fNb9/pJaBLfNijBeC7FOS4F+K/9
         2yduBFaeTQ9g70smTAIK0qeCxX0yDpKHJ1jJARY6SdbCyyb4V9BGVCk/D2RI8q1jN0iR
         w6Xg==
X-Forwarded-Encrypted: i=1; AFNElJ9TSBx1vdXud4vdVf+dKpxyJbf/ARoFTVEO39/XatHGfQ7wozhsaKCJH1VYpGw+WITaQG1e0kzq3h/FJk2UPyT5mw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxhd0QYoLnHuzoji1oWwTQ3Ocqh7/LSi0vkJSvbsfIogohMI3IB
	Ml7YW8erW41YR6FudmZB+tmium9kmUFI3GUhhJZ+Qe8IP7Wyd0dkG8hpu/BtCei8SBs=
X-Gm-Gg: AeBDieuxDBICKgTcK0hSWtv57FFWz1MYgiVGIgYK8j+lGRjmduPRZPrlB5KfyCl8cH4
	j+T/tPdB361pwusPJxQ8ADHPpYTh9r1DUo7lNK9L36/MUsto4iHwNHWtRAoVYq9Ltqona4+cRnZ
	thLqqS5mctjR9eg6JmfbrnBPCpVUv0H7bFT4xh+Fw9w5WMITrqBAsuYWQuHs3tPZB/+z3GDnqRX
	6FNNjsSaevi01WCSpj0NVr9O3EUueAi1f8Iw8s9D8SRv9n6spNS8Jj4SOsJ+6MBqSNNz6E/NI42
	LHo9g1PTcJrqHSiVOQwqMUMztBEwhWdXd4TcPwaOzAXcwHFWi6zRL0psyL1tXW+y4i0CWvIxPzL
	SEXWGCI0REgbOOn8IKbRJ2BJngMHKzg+OjMfWlGGDcS/jmq0yPoWcO4tzZlMSCuFcTlnzVOFRqU
	thU/Wmv/IXNyVlsdDp27j2RgpcKAmX/OzY2NVNMB0pm1SEw3TYfc/qLU57jo4GcgJEe7GnybYHo
	v35p+OV9lCv+nPHknD3gKigcRQn22atvjETeQ==
X-Received: by 2002:a05:6000:1acc:b0:43e:b020:f8a2 with SMTP id ffacd0b85a97d-43eb020ffb0mr74071f8f.19.1776258985607;
        Wed, 15 Apr 2026 06:16:25 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:b93f:ee00:4e55:7087? ([2001:8b0:aba:5f3c:b93f:ee00:4e55:7087])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead35c026sm5158317f8f.15.2026.04.15.06.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 06:16:24 -0700 (PDT)
Message-ID: <a534592e54506e5576444250023b0bed775a298d.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 3/7] pseudo: fix for build with glibc-2.43
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: zboszor@gmail.com, Martin Jansa <martin.jansa@gmail.com>
Cc: Hemanth.KumarMD@windriver.com, openembedded-core@lists.openembedded.org,
 	Sundeep.Kokkonda@windriver.com, Randy.MacLeod@windriver.com
Date: Wed, 15 Apr 2026 14:16:24 +0100
In-Reply-To: <ed118dea-62cd-4d29-9ee1-336367a2aae5@gmail.com>
References: <20260308150834.2508331-1-Hemanth.KumarMD@windriver.com>
	 <20260308150834.2508331-3-Hemanth.KumarMD@windriver.com>
	 <CA+chaQcneoNBogdCZmZB3LCE-cVErs2-4NoNtYUGgK+REEBxLg@mail.gmail.com>
	 <18A40738790ACBCC.657799@lists.openembedded.org>
	 <e38f41d9-4af6-4389-90a7-0c2ae6b47330@gmail.com>
	 <CA+chaQdDkMUDBO8G=cku8SVe=Ow+Hgt606mZO863rCaNaznDrA@mail.gmail.com>
	 <18A41C5827F22307.777565@lists.openembedded.org>
	 <ed118dea-62cd-4d29-9ee1-336367a2aae5@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 13:16:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235200

On Tue, 2026-04-07 at 17:38 +0200, Zoltan Boszormenyi via lists.openembedde=
d.org wrote:
> 2026. 04. 07. 17:21 keltez=C3=A9ssel, Zoltan Boszormenyi via lists.openem=
bedded.org =C3=ADrta:
> > The issue turns out to be with GNU tar, specifically this build:
> > https://koji.fedoraproject.org/koji/buildinfo?buildID=3D2924033
> >=20
> > Manually downgrading to the previous build fixed the packaging problem:
> > https://koji.fedoraproject.org/koji/buildinfo?buildID=3D2917292
> >=20
> > I reported it here:
> > https://bugzilla.redhat.com/show_bug.cgi?id=3D2455965
>=20
> According to the changelog of the current GNU tar 1.35-8.fc44 build,
> it contains backports from what will be the official 1.36 version.
> With that release, whenever it will be out, other distros would fail, too=
.
>=20
> Note this from the Fedora package changelog:
>=20
> - Backport upstream changes to jailify extraction directory
> =C2=A0=C2=A0 Includes related gnulib changes to add openat2
> =C2=A0=C2=A0 Fixes CVE-2025-45582 (fedora#2380007)
>=20
> which seems to be this commit:
> https://cgit.git.savannah.gnu.org/cgit/tar.git/commit/?id=3D75b03fdff4891=
6bd0654677ed21379bdb0db016d
>=20
> commit 75b03fdff48916bd0654677ed21379bdb0db016d
> Author: Paul Eggert <eggert@cs.ucla.edu>
> Date:=C2=A0 =C2=A0Thu Nov 13 13:44:10 2025 -0800
>=20
> =C2=A0=C2=A0 =C2=A0 Use openat2 to jailify the extraction directory
>=20
> =C2=A0=C2=A0 =C2=A0 This addresses CVE-2025-45582.
> =C2=A0=C2=A0 =C2=A0 * gnulib.modules: Add openat2.
> =C2=A0=C2=A0 =C2=A0 * src/misc.c (open_subdir): New static function.
> =C2=A0=C2=A0 =C2=A0 (fdbase_opendir): Use it.
> =C2=A0=C2=A0 =C2=A0 * src/tar.c (open_searchdir_how): New var, replacing =
and
> =C2=A0=C2=A0 =C2=A0 augmenting open_searchdir_flags.=C2=A0 All uses chang=
ed.
> =C2=A0=C2=A0 =C2=A0 * tests/extrac31.at: New file.
> =C2=A0=C2=A0 =C2=A0 * tests/Makefile (TESTSUITE_AT), tests/testuite.at: A=
dd it.
>=20
> I guess it will really need fixes in pseudo to overcome this.

I have put some patches onto this branch of pseudo:

https://git.yoctoproject.org/pseudo/log/?h=3Drpurdie/openat2

In my local testing, that did work but I don't have a Fedora 44 system
to test on right now. There are some potential issues with chroot
handling in there but I would be curious how this works on Fedora 44 if
you were able to test...

Cheers,

Richard

