Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBE5ACCF9E3
	for <webhook@archiver.kernel.org>; Fri,  7 Nov 2025 22:27:13 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.318.1762554427241734010
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Nov 2025 14:27:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=0sAh9+f5;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.180, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-7868b7b90b8so12544957b3.1
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Nov 2025 14:27:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1762554426; x=1763159226; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=einfezxEXmQUVMw/mQfeRj9DCIIF3/P00PEkFDEAz4s=;
        b=0sAh9+f5bjj+4or2J37HDmpJi2nWidHfRI1DLIuBlcp/8D3KaZWlmANJrwyNA7q8AQ
         +VD89A0xvLplkTzo9tPfqHOg2uIh0TVoe7Y+dwVn+mLM2HslWB0X59E7vuuxRxfeFqeJ
         A2xD9dsGGR/fl9s10ljETfSy3XVCrVSe56aUweJgFhYC6bXlZO8RgdBOClSi/jHCJ3LV
         PN0YgszKy8gVrHtZsYsvnML3BLCRYmne/BHHyMjzHbC+e9l95he5Ppzq5G+bMc4jjhFd
         GlarLamjjp/1kgWAIzWXGLc+0Carak+SL+PR4n9EpRxgB9Sq949Ca2iwtyvJErQIynIy
         xZ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762554426; x=1763159226;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=einfezxEXmQUVMw/mQfeRj9DCIIF3/P00PEkFDEAz4s=;
        b=EVW8vBF41ndsAEO77TW/hhMk+Ii8elGlVnlwUb5ZhvsGIoLfd8VZZ257LgxTonkcsR
         0NgIiZoviw+c9vWQr/lSoa858LXoQnwvtyicqgpw2DnGofNSn/Ezmt/+aDAOCiob54OK
         tBS/g5AP2Clbhsmw2qr2z23RyfKXTDrJVmfapWXTElg94RgC4zqpwC4M/2T2mGV8XRB0
         Oqr8TOTC87lKV2d5N/qiHbgDIqNU4DMG2Jcqbq4KdNpadyxoDO6n2oTEhe1b7SW8LG1G
         qGhdFrnhrp0EJgmLQ0mF9xkVWyvX0FuqkrlCOruwGLmYZKoN/DneAYgfTcXkWyyHU2gX
         o6Lw==
X-Forwarded-Encrypted: i=1; AJvYcCVQhvAhTrbw1k3D/yY2zrETWYZ4Mfim2HWjJIQ6cCXz5X9lXKKUe18m7doJQCNPKtfegIzpFcqo/sfCZI7/DdIHJA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyfFafSLlys8GvgvaY/8UDLsxA6U4SGnVF7qa9+gvmNwtPmYjAP
	Wbmz5pPQlYhHI1s8g7fKuEe9sjAfqY8lVsMrD4KV5ReyJLo1mhNvISAJU0TEvlAUctMUsV2qpDz
	mmU2qzJ0XqpCaRMDdCwGTYroxmsYDXqzHlCQQGfHapw==
X-Gm-Gg: ASbGncuDNoZNI68mp4V7TjEVMAlGWiXp/li3LgHTKZ/78F+U2LtKgMT45y/dx0NChT8
	xWRwAHoUWnCb0dzZ+jav0t/0rEDCBqw8goFTlbuQ06Tvq328U5J+225lV+prbGZtvvx2qrNDd4Z
	h2MjJvksxOedw4FeHEzOX2yVrmtu/Ew5xduVK1vGF5U1Hzvc6gRMnKAEySYFvaSbLKKNMl+SGvh
	KC1/UTAEI66za2aSEts99bzIpGEOzSM8MgDDffpljV7/58wJ0gv/QodhdicRj8FjsZ5EHVd4zLN
	rWzzDWP6JqUzCuC4/FJ+yiu7XzY=
X-Google-Smtp-Source: AGHT+IEZkUmkSGhTm3suwTf+vMIDWOJ/1D6zellc/EItrjOAZWb9dbr/O53kHdsgc9xRptXHf66Df9H/cn2ja1O450o=
X-Received: by 2002:a05:690c:6011:b0:786:6b92:b200 with SMTP id
 00721157ae682-787d53b3ac3mr10125557b3.30.1762554426313; Fri, 07 Nov 2025
 14:27:06 -0800 (PST)
MIME-Version: 1.0
References: <20251107131502.3857600-1-kamel.bouhara@bootlin.com>
 <CAOSpxdb+gEFgEHnqoUmvzyiXy7+C7DcTgK54EEgc-BsSzv5VJw@mail.gmail.com> <CAJdd5GYt08qYeQrBAWYx3_OT5LGCaDgc53p+2hvJSXQ76XwPYA@mail.gmail.com>
In-Reply-To: <CAJdd5GYt08qYeQrBAWYx3_OT5LGCaDgc53p+2hvJSXQ76XwPYA@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 7 Nov 2025 14:26:55 -0800
X-Gm-Features: AWmQ_bnMI-Fx3R_1ND_GeRof_MKARK0jrhBli6Q3AqJcUWmQ_qoUNBO49LuWWm4
Message-ID: <CAOSpxdb_zgoFN6qhCbA1Hy=_ueze+A+3aBokjTAi4hj6OXQCQQ@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap v4 00/17] backport: SPDX 3.0 support to Scarthgap
To: Joshua Watt <jpewhacker@gmail.com>
Cc: kamel.bouhara@bootlin.com, openembedded-core@lists.openembedded.org, 
	thomas.petazzoni@bootlin.com, Miquel Raynal <miquel.raynal@bootlin.com>, 
	mathieu.dubois-briand@bootlin.com, antonin.godard@bootlin.com, 
	Pascal Eberhard <pascal.eberhard@se.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Nov 2025 22:27:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226066

On Fri, Nov 7, 2025 at 1:22=E2=80=AFPM Joshua Watt <jpewhacker@gmail.com> w=
rote:
>
> On Fri, Nov 7, 2025 at 2:16=E2=80=AFPM Steve Sakoman <steve@sakoman.com> =
wrote:
> >
> > Unfortunately I'm still getting autobuilder errors on the oeeselftest
> > runs, example below:
> >
> > https://errors.yoctoproject.org/Errors/Details/887588/
>
> Is this the correct link? I looked at it an the failure is in devtool wit=
h:
>
> Unable to resolve 'mbedtls-2.28' in upstream git repository in git
> ls-remote output for github.com/ARMmbed/mbedtls.git
>
> Which I don't _think_ should be related to the SPDX changes.....
> perhaps an unrelated transient error?

This is the right link, and you are correct, this does appear to be an
unrelated transient issue!

Sorry for the false alarm, this series was the only addition to a
previously passing patch set so I jumped to a bad conclusion :-(

Steve

> > On Fri, Nov 7, 2025 at 5:15=E2=80=AFAM Kamel Bouhara via
> > lists.openembedded.org
> > <kamel.bouhara=3Dbootlin.com@lists.openembedded.org> wrote:
> > >
> > > Hello,
> > >
> > > This is the v4 series to backport SPDX 3.0 support from upstream
> > > Walnascar to Scarthgap (Yocto Project 5.0 LTS).
> > >
> > > Changes since v2:
> > > -----------------
> > > Cherry-picked commits:
> > >
> > >     c5b5136bf8: Exclude do_create_spdx from automatic sysroot extensi=
on.
> > >
> > >     03c6ace6c6: Fix SPDX_VERSION handling in selftests.
> > >
> > >     7be5a6e699: Add tar test for SPDX 2.2.
> > >
> > > Local fix:
> > >
> > >     7e14a5b966: Align DEPLOY_DIR_SPDX in create-spdx-2.2.bbclass with
> > >        ${SPDX_VERSION} layout, restoring successful SPDX 2.2 selftest=
s.
> > >
> > > Changes since v3:
> > > -----------------
> > > Cherry-picked commits:
> > >
> > >      29d3f8ad4: classes/create-spdx-2.2: Handle empty packages
> > >
> > > Greetings,
> > > Kamel
> > >
> > > Hongxu Jia (1):
> > >   oeqa/selftest: Add SPDX 3.0 include source case for work-share
> > >
> > > Joshua Watt (11):
> > >   classes-global/license: Move functions to library code
> > >   classes-global/staging: Exclude do_create_spdx from automatic sysro=
ot
> > >     extension
> > >   lib/license: Move package license skip to library
> > >   lib: oe: license: Add missing import
> > >   classes-recipe/image: Add image file manifest
> > >   classes-recipe/baremetal-image: Add image file manifest
> > >   selftest: spdx: Add SPDX 3.0 test cases
> > >   lib: oeqa: spdx: Add tests for extra options
> > >   spdx 3.0: Rework how SPDX aliases are linked
> > >   oeqa: spdx: Add tar test for SPDX 2.2
> > >   classes/create-spdx-2.2: Handle empty packages
> > >
> > > Kamel Bouhara (Schneider Electric) (4):
> > >   backport: SPDX 3.0 fixes and tasks from upstream version Walnascar
> > >   spdx30_tasks: fix FetchData attribute in add_download_files
> > >   classes/create-spdx-2.2: align DEPLOY_DIR_SPDX with SPDX_VERSION
> > >     layout
> > >   spdx30_tasks: adapt CVE handling to new cve-check API
> > >
> > > Richard Purdie (1):
> > >   selftest/spdx: Fix for SPDX_VERSION addition
> > >
> > >  meta/classes-global/base.bbclass              |   41 +-
> > >  meta/classes-global/license.bbclass           |  165 -
> > >  meta/classes-global/staging.bbclass           |    9 +-
> > >  meta/classes-recipe/baremetal-image.bbclass   |   32 +-
> > >  .../create-spdx-image-3.0.bbclass             |   85 +
> > >  .../create-spdx-sdk-3.0.bbclass               |   74 +
> > >  meta/classes-recipe/image.bbclass             |   58 +
> > >  meta/classes-recipe/license_image.bbclass     |   14 +-
> > >  meta/classes-recipe/nospdx.bbclass            |   13 +
> > >  meta/classes/create-spdx-2.2.bbclass          |   85 +-
> > >  meta/classes/create-spdx-3.0.bbclass          |  200 +
> > >  meta/classes/spdx-common.bbclass              |   99 +
> > >  meta/lib/oe/__init__.py                       |    2 +-
> > >  meta/lib/oe/license.py                        |  203 +
> > >  meta/lib/oe/sbom30.py                         | 1096 ++++
> > >  meta/lib/oe/spdx30.py                         | 5593 +++++++++++++++=
++
> > >  meta/lib/oe/spdx30_tasks.py                   | 1343 ++++
> > >  meta/lib/oe/spdx_common.py                    |  244 +
> > >  meta/lib/oeqa/selftest/cases/spdx.py          |  256 +-
> > >  19 files changed, 9348 insertions(+), 264 deletions(-)
> > >  create mode 100644 meta/classes-recipe/create-spdx-image-3.0.bbclass
> > >  create mode 100644 meta/classes-recipe/create-spdx-sdk-3.0.bbclass
> > >  create mode 100644 meta/classes-recipe/nospdx.bbclass
> > >  create mode 100644 meta/classes/create-spdx-3.0.bbclass
> > >  create mode 100644 meta/classes/spdx-common.bbclass
> > >  create mode 100644 meta/lib/oe/sbom30.py
> > >  create mode 100644 meta/lib/oe/spdx30.py
> > >  create mode 100644 meta/lib/oe/spdx30_tasks.py
> > >  create mode 100644 meta/lib/oe/spdx_common.py
> > >
> > > --
> > > 2.43.0
> > >
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#226036): https://lists.openembedded.org/g/openemb=
edded-core/message/226036
> > > Mute This Topic: https://lists.openembedded.org/mt/116169967/3620601
> > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub=
 [steve@sakoman.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >

