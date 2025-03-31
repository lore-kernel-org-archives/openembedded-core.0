Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B34A6C3600B
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 19:24:46 +0000 (UTC)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
 by mx.groups.io with SMTP id smtpd.web10.1328.1743449080045527199
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Mar 2025 12:24:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CA3tlsa3;
 spf=pass (domain: gmail.com, ip: 209.85.219.172, mailfrom: jan.vermaete@gmail.com)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e6cea43bb31so412491276.0
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 12:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743449079; x=1744053879; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aQW+j0n44aaYy3bNzGiaEKy4PIAtVD/Lsd+6Z4hOkDg=;
        b=CA3tlsa3TgNGFAylkV6zWUZW1CcolWKkLu/E3H+wFvPNx2JF1OPQ2QdT+qKIuDJnez
         C929nYahZo4RIcJGHneA4KKitavrhzV2B03dtKynP1u4FvMyYhfW9WgxoVEV2P5X4G46
         sz2P4PyfgauL1fzZ9UiUU3i5OagTdPHuR4yVKA+vaM9WQO6dlNMl1DtUerAhBsFrawMY
         baao4qPbhdyWrLOQ9rRphZwuneF1H86EpN+R1d5+ztPZLkhy4PlHZ9RPaGhRu8UwxdOH
         OuDXcLW2YOlDuztlGV0XJCmUUi2EqU01+k/fjY+7qA3X3IY0NAA/seuo28G0O8x2JZf9
         +SiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743449079; x=1744053879;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aQW+j0n44aaYy3bNzGiaEKy4PIAtVD/Lsd+6Z4hOkDg=;
        b=h/TUyjFMrpEtLSlgC/DLRvL3ECRZt0InfcBRLFt5sW+fufPh8kr8OarkDOqdc8hGiO
         /hVbDpif0ZkfinAdOtD13iYsvew8x3Lq/ztSzFmN/F0w8YnKK4ACwOF8tQkKoJoZO+UF
         RA4WkKKa8y34W7NxbzRsyMfh5baOyR8isuh2QTHeDRtYM2Zh66ct/LkQ7fORZNDVq6Th
         Nhx8lA/TbDQG0Z3iQk4C3puXXKFyud7hzfMhFUvnM/KHODgPL+cqROuySvmpe6AHjOjm
         UrfSGeXA4Dc7SNNtZhTadAZrfLMTzRZsbM4MxeUHy3Px8aa5kE1BoCHv1KnspHy9IK2e
         duGA==
X-Gm-Message-State: AOJu0YyMpQr1AWFYoijYBLgXSWQMotSTqf7L+ZLasIXelmZiXueSxQ+5
	yalvStXoPU5x/mHKECj5cK2YMydbqWmtFaKhcF2eAIALO6BJuhR8aeS75axJyZchbU6Jl/B4mC7
	uF4/d2SXqi5Utegp3ybKNj9yMRfVtlETQ
X-Gm-Gg: ASbGncsB30zetORD5OntQXKt8hGZDeiWRNL3+/jgQKx3d31rgGasve5DuIRhhpwsFi7
	36Ms5iYnw1Od9JVYX8QnnGZnOeysLyXtmjRHfkKCSuAroXMMVI0aroKmYgI7OIxh48zBEI4ntWk
	DTLfY+RnjwVpLqKyJImUzg1e/GIWYcYpMVXRe5pogmvTvc7P3nVsRim3zoE38=
X-Google-Smtp-Source: AGHT+IE1k5z4bzSor2wI5HXbX0MH5QGnXtagZ3ZWshFAmowXzz0Wr4aF7LJKZPz5eVYuFICKXfuJM34HXFBR7dz7s4I=
X-Received: by 2002:a05:6902:2788:b0:e69:1d81:1a97 with SMTP id
 3f1490d57ef6-e6b83a9629cmr11415745276.44.1743449079105; Mon, 31 Mar 2025
 12:24:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250329204049.1463241-1-jan.vermaete@gmail.com> <D8UCM95EEMA2.N4I5RG575VNY@bootlin.com>
In-Reply-To: <D8UCM95EEMA2.N4I5RG575VNY@bootlin.com>
From: jan vermaete <jan.vermaete@gmail.com>
Date: Mon, 31 Mar 2025 21:24:28 +0200
X-Gm-Features: AQ5f1JoiWHVi07Yu5UeTvv4kvy4RMPdq4qUkCO39Rm8XGiuaisbPpPJ7IHH40xI
Message-ID: <CABF_=yjUM6GsACAcEOrxYY+cNBY7thh0FnNC9du1JbdMfaZgzw@mail.gmail.com>
Subject: Re: [OE-core] [v2] python3-sphinx: version bump 8.2.1 -> 8.2.3
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 19:24:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213994

Hi,

Strange.  Classic story I think: "I didn't have this error yesterday,
but now I do".

The same error comes when jumping from 8.2.1 (currently at master) to 8.2.2=
.
8.2.3 and 8.3.0 do have the same issue.  Note that 8.3.0 release is
yanked on pypi.org

It does not seem to be related to the changes in the tar.gz file from pypi.

I could not find why it fails.  I'm looking forward to the correct answer.

Sorry for the inconvenience.

On Mon, Mar 31, 2025 at 11:36=E2=80=AFAM Mathieu Dubois-Briand
<mathieu.dubois-briand@bootlin.com> wrote:
>
> On Sat Mar 29, 2025 at 9:40 PM CET, Jan Vermaete via lists.openembedded.o=
rg wrote:
> > Release 8.2.3 (released Mar 02, 2025)
> >   Bugs fixed
> >
> >       #13403: Define _StrPath.__radd__(). Patch by Adam Turner.
> >       #13399: Fix _CurrentDocument membership testing with =E2=80=98{c,=
cpp}:parent_symbol=E2=80=99. Patch by Adam Turner.
> >
> >   Release 8.2.2 (released Mar 02, 2025)
> >   Bugs fixed
> >
> >       #13392: Fix argument type for jieba.load_userdict().
> >       Add workaround for nbsphinx implicit imports. Patch by Adam Turne=
r.
> >       #13402: Ensure inline <script/> tags are written exactly once. Pa=
tch by Dmitry Shachnev and Adam Turner.
> >       #13391: apidoc: Fix TOC file not having a title. Patch by Dave Ho=
ese and Adam Turner.
> >
> >   https://www.sphinx-doc.org/en/master/changes/
> >
> > Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
> > ---
>
> Hi Jan,
>
> Thanks for your patch.
>
> It appears the build fails on the autobuilder:
>
> ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/musl-qem=
ux86/build/build/tmp/work/core2-32-poky-linux-musl/python3-sphinx/8.2.3/tem=
p/log.do_compile.1693254
> Log data follows:
> | DEBUG: Executing shell function do_compile
> | * Getting build dependencies for wheel...
> |
> | ERROR Missing dependencies:
> |       sphinxcontrib-serializinghtml>=3D1.1.9
> |       Jinja2>=3D3.1
> |       sphinxcontrib-devhelp>=3D1.0.6
> |       sphinxcontrib-qthelp>=3D1.0.6
> |       snowballstemmer>=3D2.2
> |       Pygments>=3D2.17
> |       alabaster>=3D0.7.14
> |       sphinxcontrib-htmlhelp>=3D2.0.6
> |       docutils<0.22,>=3D0.20
> |       roman-numerals-py>=3D1.0.0
> |       imagesize>=3D1.3
> |       sphinxcontrib-jsmath>=3D1.0.1
> |       sphinxcontrib-applehelp>=3D1.0.7
> |       babel>=3D2.13
> |       requests>=3D2.30.0
> | WARNING: exit code 1 from a shell command.
> NOTE: recipe python3-sphinx-8.2.3-r0: task do_compile: Failed
> ERROR: Task (/srv/pokybuild/yocto-worker/musl-qemux86/build/meta/recipes-=
devtools/python/python3-sphinx_8.2.3.bb:do_compile) failed with exit code '=
1'
>
> Can you have a look at this error please?
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>


--=20
Jan Vermaete
=E2=80=9CSuccess is a self-correcting phenomenom.=E2=80=9D -- Gary Hamel

