Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3394CCF9F8
	for <webhook@archiver.kernel.org>; Fri,  7 Nov 2025 21:22:55 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10287.1762550568917979969
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Nov 2025 13:22:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=b4eam+HY;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: jpewhacker@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-786572c14e3so12516027b3.2
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Nov 2025 13:22:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762550568; x=1763155368; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ig7yeXpOwMA04fLNuoBW51gIxaEJsFt6UT/Uha0ElRA=;
        b=b4eam+HYT+z5gvs3CswRKvNF5+8YXC5izMtApsnvGSpJfcffOKxp1BjtTwgr404pZO
         k97D4chO2AdrVgIqKs+W2NsQU7LmT55Mv/ywdN6yWmhL3ItZUeg7HwsJxfNw0BNWj7iC
         NwwYSp3xybvvXeX2f8BuDipsYMnoztuLRsMlGzGn6Swi2IOqmkBw1JaFwsUsslPfUE85
         UoAwr7OcmZ5NOrmZQj7kAvsK4NM/QEIwXLKzGRKUMct77alN/FgALubDEx0Ei9KVz+gF
         +KbYOnLE9Z0bV6r4WRDpSUN9zlmy6pfuzbs71lcNemPClw0ik+D1QiO0Xy3tv89jQCTb
         nbbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762550568; x=1763155368;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ig7yeXpOwMA04fLNuoBW51gIxaEJsFt6UT/Uha0ElRA=;
        b=nj3S31QaxGQYHrLHAl+iD1gEQI0RoEn+gxkoAln5Cva+VTsAkBP1QMQb+PLyezTiPb
         zmY+VehlE2m1/y3T2qIDfN/pe+P5o9b8Sq+4fF95ZmSrGjZ59lA4hziTrZOMy3BNRg91
         O+QlQFROFfS7LJ/8AqStd/Zr75+P0NyaNFWl1WXJLQXks69BBd3wiZ7GTQjLlROxyZ6E
         DRC6s9y8Sq76o2IVTFxG0M16Vtb6XxqVbNfcbHdWkjxdLLA9K4UMmL0kJ060Fng65G5j
         TLSLz0vkg2BzmuhKi5IbzqS4VzxBVhY3ov9QtbIblMo8uuzdwk87t8vDXUDkXc9MhMRE
         Gdug==
X-Forwarded-Encrypted: i=1; AJvYcCVw36qPKwTYoW7S7v4+g3unCQxCWbxlOWYob69YcR1xJPG6Kg10vxa3NMbRy2/mzAEE7/Clj8tjtET3EiDNGAVC7g==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy0i+7f1W9LVLmWSpYKmKLMf4mNcpSJlsptVBbm1wPUP9Wl7+5g
	M/749Gxa+4sYa/XpHwgprB4sBt36MT453YTp+0mMk9nPhbusuaiUkubIO+7VzTNwRYlHIVK4FAL
	exbfZcxyjr6lnm2Wlk5sfMIiMOF+iEBg=
X-Gm-Gg: ASbGncu0xeKUf42ge/Eb3t5Pi8uuu7rZ+THSI1WzrjrdQ5jC2Wv5770n7OpYam9GeFB
	6XoWYmsqFftPNAYrGAwH2ttGmny7QHOP7LUWoHgQPnaPovz7Ke5ParIqfYeoRl7TRmlvcvhNFYa
	b9qB3aNw62a8jFbXa0zUeXvcu5SQ+t0IDNXGEmO9jrJqIDuNwJgTHFkFOOfb+XynO9LN5fQN351
	R5AqGw2aaS+sQt+4Ukf3GJkPrXQhbn+Ig7/F+Q3cFjxbK6b4FnMzWV5GupdxSHrOZYOjMqVWbB4
	GyEqJ7OkXQ==
X-Google-Smtp-Source: AGHT+IEuijDYTef63+RBb0Wsl7S+2GNyWLcyKK7ElmlOLiabwEq78Qv0SFo92jIMnqO7Vjm1jFyJwBh1OZhzmo40W5Y=
X-Received: by 2002:a05:690e:23d3:b0:63f:9fcb:2050 with SMTP id
 956f58d0204a3-640d45c1c81mr360717d50.50.1762550568024; Fri, 07 Nov 2025
 13:22:48 -0800 (PST)
MIME-Version: 1.0
References: <20251107131502.3857600-1-kamel.bouhara@bootlin.com> <CAOSpxdb+gEFgEHnqoUmvzyiXy7+C7DcTgK54EEgc-BsSzv5VJw@mail.gmail.com>
In-Reply-To: <CAOSpxdb+gEFgEHnqoUmvzyiXy7+C7DcTgK54EEgc-BsSzv5VJw@mail.gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Fri, 7 Nov 2025 14:22:36 -0700
X-Gm-Features: AWmQ_bnI1tAFkyFVr4j79zDmpo9CDYqjYj1Df4tapBOJZuG26tujxEvI_uD3fN8
Message-ID: <CAJdd5GYt08qYeQrBAWYx3_OT5LGCaDgc53p+2hvJSXQ76XwPYA@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap v4 00/17] backport: SPDX 3.0 support to Scarthgap
To: Steve Sakoman <steve@sakoman.com>
Cc: kamel.bouhara@bootlin.com, openembedded-core@lists.openembedded.org, 
	thomas.petazzoni@bootlin.com, Miquel Raynal <miquel.raynal@bootlin.com>, 
	mathieu.dubois-briand@bootlin.com, antonin.godard@bootlin.com, 
	Pascal Eberhard <pascal.eberhard@se.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Nov 2025 21:22:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226065

On Fri, Nov 7, 2025 at 2:16=E2=80=AFPM Steve Sakoman <steve@sakoman.com> wr=
ote:
>
> Unfortunately I'm still getting autobuilder errors on the oeeselftest
> runs, example below:
>
> https://errors.yoctoproject.org/Errors/Details/887588/

Is this the correct link? I looked at it an the failure is in devtool with:

Unable to resolve 'mbedtls-2.28' in upstream git repository in git
ls-remote output for github.com/ARMmbed/mbedtls.git

Which I don't _think_ should be related to the SPDX changes.....
perhaps an unrelated transient error?

>
> Steve
>
> On Fri, Nov 7, 2025 at 5:15=E2=80=AFAM Kamel Bouhara via
> lists.openembedded.org
> <kamel.bouhara=3Dbootlin.com@lists.openembedded.org> wrote:
> >
> > Hello,
> >
> > This is the v4 series to backport SPDX 3.0 support from upstream
> > Walnascar to Scarthgap (Yocto Project 5.0 LTS).
> >
> > Changes since v2:
> > -----------------
> > Cherry-picked commits:
> >
> >     c5b5136bf8: Exclude do_create_spdx from automatic sysroot extension=
.
> >
> >     03c6ace6c6: Fix SPDX_VERSION handling in selftests.
> >
> >     7be5a6e699: Add tar test for SPDX 2.2.
> >
> > Local fix:
> >
> >     7e14a5b966: Align DEPLOY_DIR_SPDX in create-spdx-2.2.bbclass with
> >        ${SPDX_VERSION} layout, restoring successful SPDX 2.2 selftests.
> >
> > Changes since v3:
> > -----------------
> > Cherry-picked commits:
> >
> >      29d3f8ad4: classes/create-spdx-2.2: Handle empty packages
> >
> > Greetings,
> > Kamel
> >
> > Hongxu Jia (1):
> >   oeqa/selftest: Add SPDX 3.0 include source case for work-share
> >
> > Joshua Watt (11):
> >   classes-global/license: Move functions to library code
> >   classes-global/staging: Exclude do_create_spdx from automatic sysroot
> >     extension
> >   lib/license: Move package license skip to library
> >   lib: oe: license: Add missing import
> >   classes-recipe/image: Add image file manifest
> >   classes-recipe/baremetal-image: Add image file manifest
> >   selftest: spdx: Add SPDX 3.0 test cases
> >   lib: oeqa: spdx: Add tests for extra options
> >   spdx 3.0: Rework how SPDX aliases are linked
> >   oeqa: spdx: Add tar test for SPDX 2.2
> >   classes/create-spdx-2.2: Handle empty packages
> >
> > Kamel Bouhara (Schneider Electric) (4):
> >   backport: SPDX 3.0 fixes and tasks from upstream version Walnascar
> >   spdx30_tasks: fix FetchData attribute in add_download_files
> >   classes/create-spdx-2.2: align DEPLOY_DIR_SPDX with SPDX_VERSION
> >     layout
> >   spdx30_tasks: adapt CVE handling to new cve-check API
> >
> > Richard Purdie (1):
> >   selftest/spdx: Fix for SPDX_VERSION addition
> >
> >  meta/classes-global/base.bbclass              |   41 +-
> >  meta/classes-global/license.bbclass           |  165 -
> >  meta/classes-global/staging.bbclass           |    9 +-
> >  meta/classes-recipe/baremetal-image.bbclass   |   32 +-
> >  .../create-spdx-image-3.0.bbclass             |   85 +
> >  .../create-spdx-sdk-3.0.bbclass               |   74 +
> >  meta/classes-recipe/image.bbclass             |   58 +
> >  meta/classes-recipe/license_image.bbclass     |   14 +-
> >  meta/classes-recipe/nospdx.bbclass            |   13 +
> >  meta/classes/create-spdx-2.2.bbclass          |   85 +-
> >  meta/classes/create-spdx-3.0.bbclass          |  200 +
> >  meta/classes/spdx-common.bbclass              |   99 +
> >  meta/lib/oe/__init__.py                       |    2 +-
> >  meta/lib/oe/license.py                        |  203 +
> >  meta/lib/oe/sbom30.py                         | 1096 ++++
> >  meta/lib/oe/spdx30.py                         | 5593 +++++++++++++++++
> >  meta/lib/oe/spdx30_tasks.py                   | 1343 ++++
> >  meta/lib/oe/spdx_common.py                    |  244 +
> >  meta/lib/oeqa/selftest/cases/spdx.py          |  256 +-
> >  19 files changed, 9348 insertions(+), 264 deletions(-)
> >  create mode 100644 meta/classes-recipe/create-spdx-image-3.0.bbclass
> >  create mode 100644 meta/classes-recipe/create-spdx-sdk-3.0.bbclass
> >  create mode 100644 meta/classes-recipe/nospdx.bbclass
> >  create mode 100644 meta/classes/create-spdx-3.0.bbclass
> >  create mode 100644 meta/classes/spdx-common.bbclass
> >  create mode 100644 meta/lib/oe/sbom30.py
> >  create mode 100644 meta/lib/oe/spdx30.py
> >  create mode 100644 meta/lib/oe/spdx30_tasks.py
> >  create mode 100644 meta/lib/oe/spdx_common.py
> >
> > --
> > 2.43.0
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#226036): https://lists.openembedded.org/g/openembed=
ded-core/message/226036
> > Mute This Topic: https://lists.openembedded.org/mt/116169967/3620601
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
steve@sakoman.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

