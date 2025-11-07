Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2C84CCF9F8
	for <webhook@archiver.kernel.org>; Fri,  7 Nov 2025 21:16:35 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10161.1762550191339327210
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Nov 2025 13:16:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Ppfpygm8;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.174, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-71d6014810fso10365557b3.0
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Nov 2025 13:16:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1762550190; x=1763154990; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9A46YdpBVanNvIWGcYKNteqVUpb21JV4HEiseEtNvWo=;
        b=Ppfpygm8QnfeAjDXlKFsd9mub6U1VESQRZX84a463MGAANWPhIuTuU5IIukzndZ5r1
         smp/31BTzzVidg3vO/Q1TNU/5bJirr+L1TFzUOFb9y25mGqNVfBwh63aWfLVVYewPcXZ
         WmittCRflesiIlvu576NJIDHeAUNUAWJ45SdDQMn24s2DfIo4oB9pKaSba5UJrrBu9Xb
         qN2scaXBPEtRMJS0P/v5gKQD3ozRfpRRcgir+cQeZz6vbtprSxPxxo4KeiM5XSo3eRDH
         AAMETr5v2oqgzZeKySiJDTNlpzqxXUfx1gEXPIHMHRdFygafAfo+oyGkOBv8uMOjo1ZS
         Z7Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762550190; x=1763154990;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9A46YdpBVanNvIWGcYKNteqVUpb21JV4HEiseEtNvWo=;
        b=kqwEtHI7Nk0K8t2QELblUkvoiGppzt7FCzOSNkCoqpYkdncfRsrznOQB4RmRY3ceaZ
         1Wx1Ifg1JmqFCtHb5fL1UXyKVgGtyjTIglY1a8voM/rzsxTJRqFLQgC7+42pe6gntZ50
         zdyFkEjCvHWFNcBnReGJX05M5pZJJVJaxi6+e6XL8f4I8jECwuFyjI0rRr+SDl7z98Ci
         oHagfK9Qf4lBPQlECgcQkLTtTpSpzoWTKTmSo3AZRWiv3RI93MZiz8oZLUqZc8K7PYAP
         8cGOwk+6MB1uoNjo6Ji9iNTZsNj5cpSi4pDX8LvTwu3mbxNdtx4tpsytI2iAmo4jTYcz
         o9Mw==
X-Gm-Message-State: AOJu0Yx+vpK+Bhr7guioSunuK4DJP5nxJqUc/jt71OkaNJ6jZQ7UDnAp
	6IPscpRPyZ5aZtaJj57Yu5sz01RoCfpXdpjH6J9tiwIq/Byh6cGuhvxZvvStNYZS6e32wxx6d02
	jfSfChXK1pWW+sLcNJd/4Ucc/sSleXmBeQ066uQ0sGQ==
X-Gm-Gg: ASbGnct7K03MLvCMS+NzQCSdk6J/kIa7Uby0naG4YPj8ViEgdSobpksbP4UlTEwrDU6
	/J5lnhlM8xI2WjP7vAP1iIccblDPr9d9Dye4+qUzFcs6ANlV9OkJH+jl9eop33Oh7TXXsuS6vwN
	fXBpc3Ddka3yT5vyPQjV5Px+vyT4cXNo0jhoYEcTHW3yEeDWIPAbqe+zBgFkn2tyHGxgTGYrkcJ
	31jRdiPzjJlN+1FfxbW3kZG/NPiFkhz10Oj0Gdm3e7TEAl2GGSpp5vxOd4h1gI8JfYEXgyHpHjk
	hSoeJovKn8sD3FKzGtBgvjA9y+/dbi+xU9E/LQ==
X-Google-Smtp-Source: AGHT+IEECC7z9IWPkfl84eSJC/Ti1TPyZYj/MuB/emP7e2mMyEJGuMOl29WDwTk80p6/l4fHr1JNPqU4332aWmFV1m0=
X-Received: by 2002:a05:690e:4254:b0:63f:9796:39b7 with SMTP id
 956f58d0204a3-640d45d2bf9mr366151d50.49.1762550190456; Fri, 07 Nov 2025
 13:16:30 -0800 (PST)
MIME-Version: 1.0
References: <20251107131502.3857600-1-kamel.bouhara@bootlin.com>
In-Reply-To: <20251107131502.3857600-1-kamel.bouhara@bootlin.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 7 Nov 2025 13:16:20 -0800
X-Gm-Features: AWmQ_bnCiq58hSh7JovtDNBRCWi4o6ojoj0D5KdR8OIU0bkC3XIwtJqrqQJdiUo
Message-ID: <CAOSpxdb+gEFgEHnqoUmvzyiXy7+C7DcTgK54EEgc-BsSzv5VJw@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap v4 00/17] backport: SPDX 3.0 support to Scarthgap
To: kamel.bouhara@bootlin.com
Cc: openembedded-core@lists.openembedded.org, JPEWhacker@gmail.com, 
	thomas.petazzoni@bootlin.com, Miquel Raynal <miquel.raynal@bootlin.com>, 
	mathieu.dubois-briand@bootlin.com, antonin.godard@bootlin.com, 
	Pascal Eberhard <pascal.eberhard@se.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Nov 2025 21:16:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226064

Unfortunately I'm still getting autobuilder errors on the oeeselftest
runs, example below:

https://errors.yoctoproject.org/Errors/Details/887588/

Steve

On Fri, Nov 7, 2025 at 5:15=E2=80=AFAM Kamel Bouhara via
lists.openembedded.org
<kamel.bouhara=3Dbootlin.com@lists.openembedded.org> wrote:
>
> Hello,
>
> This is the v4 series to backport SPDX 3.0 support from upstream
> Walnascar to Scarthgap (Yocto Project 5.0 LTS).
>
> Changes since v2:
> -----------------
> Cherry-picked commits:
>
>     c5b5136bf8: Exclude do_create_spdx from automatic sysroot extension.
>
>     03c6ace6c6: Fix SPDX_VERSION handling in selftests.
>
>     7be5a6e699: Add tar test for SPDX 2.2.
>
> Local fix:
>
>     7e14a5b966: Align DEPLOY_DIR_SPDX in create-spdx-2.2.bbclass with
>        ${SPDX_VERSION} layout, restoring successful SPDX 2.2 selftests.
>
> Changes since v3:
> -----------------
> Cherry-picked commits:
>
>      29d3f8ad4: classes/create-spdx-2.2: Handle empty packages
>
> Greetings,
> Kamel
>
> Hongxu Jia (1):
>   oeqa/selftest: Add SPDX 3.0 include source case for work-share
>
> Joshua Watt (11):
>   classes-global/license: Move functions to library code
>   classes-global/staging: Exclude do_create_spdx from automatic sysroot
>     extension
>   lib/license: Move package license skip to library
>   lib: oe: license: Add missing import
>   classes-recipe/image: Add image file manifest
>   classes-recipe/baremetal-image: Add image file manifest
>   selftest: spdx: Add SPDX 3.0 test cases
>   lib: oeqa: spdx: Add tests for extra options
>   spdx 3.0: Rework how SPDX aliases are linked
>   oeqa: spdx: Add tar test for SPDX 2.2
>   classes/create-spdx-2.2: Handle empty packages
>
> Kamel Bouhara (Schneider Electric) (4):
>   backport: SPDX 3.0 fixes and tasks from upstream version Walnascar
>   spdx30_tasks: fix FetchData attribute in add_download_files
>   classes/create-spdx-2.2: align DEPLOY_DIR_SPDX with SPDX_VERSION
>     layout
>   spdx30_tasks: adapt CVE handling to new cve-check API
>
> Richard Purdie (1):
>   selftest/spdx: Fix for SPDX_VERSION addition
>
>  meta/classes-global/base.bbclass              |   41 +-
>  meta/classes-global/license.bbclass           |  165 -
>  meta/classes-global/staging.bbclass           |    9 +-
>  meta/classes-recipe/baremetal-image.bbclass   |   32 +-
>  .../create-spdx-image-3.0.bbclass             |   85 +
>  .../create-spdx-sdk-3.0.bbclass               |   74 +
>  meta/classes-recipe/image.bbclass             |   58 +
>  meta/classes-recipe/license_image.bbclass     |   14 +-
>  meta/classes-recipe/nospdx.bbclass            |   13 +
>  meta/classes/create-spdx-2.2.bbclass          |   85 +-
>  meta/classes/create-spdx-3.0.bbclass          |  200 +
>  meta/classes/spdx-common.bbclass              |   99 +
>  meta/lib/oe/__init__.py                       |    2 +-
>  meta/lib/oe/license.py                        |  203 +
>  meta/lib/oe/sbom30.py                         | 1096 ++++
>  meta/lib/oe/spdx30.py                         | 5593 +++++++++++++++++
>  meta/lib/oe/spdx30_tasks.py                   | 1343 ++++
>  meta/lib/oe/spdx_common.py                    |  244 +
>  meta/lib/oeqa/selftest/cases/spdx.py          |  256 +-
>  19 files changed, 9348 insertions(+), 264 deletions(-)
>  create mode 100644 meta/classes-recipe/create-spdx-image-3.0.bbclass
>  create mode 100644 meta/classes-recipe/create-spdx-sdk-3.0.bbclass
>  create mode 100644 meta/classes-recipe/nospdx.bbclass
>  create mode 100644 meta/classes/create-spdx-3.0.bbclass
>  create mode 100644 meta/classes/spdx-common.bbclass
>  create mode 100644 meta/lib/oe/sbom30.py
>  create mode 100644 meta/lib/oe/spdx30.py
>  create mode 100644 meta/lib/oe/spdx30_tasks.py
>  create mode 100644 meta/lib/oe/spdx_common.py
>
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#226036): https://lists.openembedded.org/g/openembedde=
d-core/message/226036
> Mute This Topic: https://lists.openembedded.org/mt/116169967/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

