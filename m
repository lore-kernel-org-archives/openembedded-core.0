Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0380AFD45F5
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 21:24:36 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.56341.1772054666656275498
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Feb 2026 13:24:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=RpdP+zyE;
 spf=pass (domain: smile.fr, ip: 209.85.221.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4398f8e2837so148101f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Feb 2026 13:24:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772054665; cv=none;
        d=google.com; s=arc-20240605;
        b=hExrljAiKcQ+BMvMwn0R/AOmshGAttSYARWUeQ5sx4RsVJGS6YZknNYh66YwegMRJn
         prwrKhdRdq9RLNSFytUfe+28hVtUI5/+lxWmVrcNFsLi8LG66AMdExNVWd7VVDyP/J3z
         WRs3bwC5PTLjSeEzlWoJhqTIqAqXI6OovIudsSB74SK2p7dvpcT5i76YAnynMlqYtkFE
         PjMhB6HYidG9DcVNrA4m4AJYC/0sGys557eFub6q6AmRw8nDS01sM3L2ZS/K2ShifGOH
         H8+4wjJ3ZDz5r8T0wG7tQWmFt7xcHQ36b4pEfoSl6S3Lehi8yOSaXRhv1J6ZS1bP1pt+
         M0mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hm6nkhmT3+7G3uUioEbybSWvW2KSbi9LDQfQH6agY2E=;
        fh=CXLnjRBTDOvMNj9pqhCy3VcWHT0R0uJKEJGizxMZDWc=;
        b=Xzsda05zPj74vxZgbvAFBaXJIH75S+IvyXWRHRePWfc5tzed4duBXw75Xsh4L+pEP4
         OTwciVC1DFPde3HlRUSq7LF0fkz8MKuipPZa4otmp07w08953m3W2cxG+9z/x0sJ8SER
         0sls5E8kE214obb6gOcdA50bi5VIh+mHFkD5aUJ21P2j2fP/o0ZwVv/Ezs6Ul1PfReKi
         /UpcWXC1a718d+l5kTaxiP4CvLYAZnRxhAWJ+G1UDZFId/OIK9yvq+zqThD2yTaXFGFr
         Ig54PD/HDzYYG/mrRj+oQKXNKSt6NvNLWSN604RhTtcOO5vkv3rRy75UzgTq87qqI+7w
         mnRw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1772054665; x=1772659465; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hm6nkhmT3+7G3uUioEbybSWvW2KSbi9LDQfQH6agY2E=;
        b=RpdP+zyEP+5OBpN38LqTld3g04uW64LkQl8Li8wVskdbUS1seNtFnQ37OFJrlzbFMb
         uWggABbrjqLVtXb5FA1lY75dsuHpjY8a7ikoBfzZ4ec1ao8F0kre5e4rdTselfAksNBv
         9aj6IuSwo6hVe61GTqvcZVAy/SUY95R8fq6fU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772054665; x=1772659465;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hm6nkhmT3+7G3uUioEbybSWvW2KSbi9LDQfQH6agY2E=;
        b=VBeH6MyCJDjBLKC7PWGsJrY0SX9OG5T0Hplf3URxVbJSe8HgMt1N967INyWyWZf5As
         zRx7gDliRsM/k0GY+T3GvBYIljlk6DA88GyJMpmFdwWe1I11/vBdgobdnJZDFTJzRC2o
         5bVB9i3T1mFiGXm3WvmPR5EcPrpT9wyDAxh98hcGwiK9QtcMDPk0PBzZMstZiyCcf+xq
         c1E9+IlHpeyJ2IhhoeUDK0s4mkuITbyIMkVrBru9aV4SU8DvCxBnqVb4C+kz3bjwTuhB
         OAJPRhngNDwt6mPA6zs2wCAp/88faMLEtfjg2wdqj02vvjAivwyA0hSd7ghV+RwG7jeF
         r0fQ==
X-Forwarded-Encrypted: i=1; AJvYcCWC5Hqur/lTGgvY4ZbGZ9d39p+KWINLF9qGPrrw7OV2t4zSECWNwXvq/HIy5P8Ds0ZzYPwcGk3x5AuMLoUpx3WsSg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw3zu5toUJb/K8lkfFgFX0E2RKN1sHlvI4zbf+2G2axN+sZ0Dg4
	UmaSx4vMHYSxbxlFOWhDOvJcKovdxXzqJsVbjZJF/b51OE02TtU8gNrKOvn+2/Yp1ZVtLwOyqJh
	MUKMhkwBIoeI50sri9PqqlRPKGN9CXuTOVJNr7xzkkg==
X-Gm-Gg: ATEYQzzYwij1GfC8/3G5YNnsC5FaKWAX+qrYIA+gE4cQO4sPy/w8WCloK6AFJsW1gWn
	W5JGa/dVk9CXWQ5mS6L3HmyPmzyFU0enEOGsQIY2GTEIeQKjiqOtwlthCFZ9DgEqvp2EhiNqCku
	9FM1+hufVT3BvDxU4ZFVe/Dmbv+Egaa/LU/5ovufFJE50F00RP0da8LnZn8nu+fANPXXz9lACz0
	OmAm17m+VSm8YFcp779ZfCaTREzvSxZTlDmNf8gXZVD9ktUUfSy1ME2YYP7H8vtx1keunITYEUJ
	zxDmB8G+yQxIMPz8aADCBAHT0LscjTbRVT4CAAMf
X-Received: by 2002:a05:6000:4203:b0:439:9025:156a with SMTP id
 ffacd0b85a97d-4399025171dmr5996447f8f.31.1772054664882; Wed, 25 Feb 2026
 13:24:24 -0800 (PST)
MIME-Version: 1.0
References: <cover.1771943404.git.yoann.congal@smile.fr> <1977023397.617077.1772038793631@app.mailbox.org>
 <362912505.617728.1772039522960@app.mailbox.org> <AS1PR10MB5697DAA60A975971D99B575BFD75A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB5697DAA60A975971D99B575BFD75A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Wed, 25 Feb 2026 22:23:59 +0100
X-Gm-Features: AaiRm51HU6vm1d7cl9rYIZryYQKf1-dtSTdL77p_ODH7RGf21JBVi_jQ9S_U_14
Message-ID: <CAMSfU+7WhC2t=V8NGOa+4ri7UxXSohQKbR3GMgkUggMwmi-guQ@mail.gmail.com>
Subject: Re: [OE-core][scarthgap 00/44] Patch review
To: "Marko, Peter" <Peter.Marko@siemens.com>
Cc: "patrick.vogelaar.dev@mailbox.org" <patrick.vogelaar.dev@mailbox.org>, 
	"Yoann Congal via lists.openembedded.org" <yoann.congal=smile.fr@lists.openembedded.org>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000d2cde0064baca05a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Feb 2026 21:24:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231980

--000000000000d2cde0064baca05a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 25 f=C3=A9vr. 2026 =C3=A0 18:19, Marko, Peter <Peter.Marko@siemens.=
com> a
=C3=A9crit :

> Upgrade to 3.5.x is in progress.
> Testing was already performed successfully on AB.
> I'm planning to write a proposal to Yocto project TSC for approval next
> week.
>
> Patching current recipe is a regular LTS activity and should be accepted.
>

Patrick, Peter,

FYI, the Openssl 3.5.x upgrade for scarthgap is on the TSC agenda on monday=
.
In the meantime, I plan to start a new upgraded build on autobuilder.

So, this situation might evolve soon.

Regards,

>
> Peter
>
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-
> > core@lists.openembedded.org> On Behalf Of Patrick Vogelaar via
> > lists.openembedded.org
> > Sent: Wednesday, February 25, 2026 18:12
> > To: yoann.congal@smile.fr; Yoann Congal via lists.openembedded.org
> > <yoann.congal=3Dsmile.fr@lists.openembedded.org>; openembedded-
> > core@lists.openembedded.org
> > Subject: Re: [OE-core][scarthgap 00/44] Patch review
> >
> > Hi,
> >
> > I am a bit unsure about the openssl patches. I am not questioning them
> technically
> > but if it is the right way to patch openssl 3.2 since it is EOL [1].
> >
> > Wouldn't it be better, as suggested in [1], to upgrade to either versio=
n
> 3.6.x (EOL
> > 1st November 2026) or version 3.5.x (EOL April 2030 -> LTS).
> >
> > If you agree with that, I would prepare a patch. Just let me know hte
> preffered
> > version, since I am a bit unsure how this is usually handled on a LTS
> version.
> >
> > [1] https://openssl-library.org/post/2025-11-25-eol-32/
> >
> > Best Regards
> > Patrick
> >
> > > patrick.vogelaar@mailbox.org hat am 25.02.2026 17:59 CET geschrieben:
> > >
> > >
> > > Hi,
> > >
> > > I am a bit unsure about the openssl patches. I am not questioning the=
m
> > technically but if it is the right way to patch openssl 3.2 since it is
> EOL [1].
> > >
> > > Wouldn't it be better, as suggested in [1], to upgrade to either
> version 3.6.x
> > (EOL 1st November 2026) or version 3.5.x (EOL April 2030 -> LTS).
> > >
> > > If you agree with that, I would prepare a patch. Just let me know hte
> preffered
> > version, since I am a bit unsure how this is usually handled on a LTS
> version.
> > >
> > > [1] https://openssl-library.org/post/2025-11-25-eol-32/
> > >
> > > Best Regards
> > > Patrick
> > >
> > >
> > > > Yoann Congal via lists.openembedded.org
> > <yoann.congal=3Dsmile.fr@lists.openembedded.org> hat am 24.02.2026 15:3=
1
> CET
> > geschrieben:
> > > >
> > > >
> > > > Please review this set of changes for scarthgap and have comments
> back by
> > > > end of day Thursday, February 26.
> > > >
> > > > Passed a-full on autobuilder:
> > > >
> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/3276
> > > >
> > > > The following changes since commit
> > a1f4ae4e569bc0e36c27c1e4651e502e54d63b28:
> > > >
> > > >   build-appliance-image: Update to scarthgap head revision
> (2026-02-16
> > 09:52:44 +0000)
> > > >
> > > > are available in the Git repository at:
> > > >
> > > >   https://git.openembedded.org/openembedded-core-contrib
> stable/scarthgap-
> > nut
> > > >   https://git.openembedded.org/openembedded-core-
> > contrib/log/?h=3Dstable/scarthgap-nut
> > > >
> > > > for you to fetch changes up to
> 94a2960e1ae3923599affb6b227ef3f1870f5633:
> > > >
> > > >   u-boot: move CVE patches out of the common .inc file (2026-02-24
> 10:34:08
> > +0100)
> > > >
> > > > ----------------------------------------------------------------
> > > >
> > > > Aleksandar Nikolic (1):
> > > >   scripts/install-buildtools: Update to 5.0.15
> > > >
> > > > Amaury Couderc (2):
> > > >   avahi: patch CVE-2025-68468
> > > >   avahi: patch CVE-2025-68471
> > > >
> > > > Ankur Tyagi (4):
> > > >   avahi: patch CVE-2025-68276
> > > >   avahi: patch CVE-2026-24401
> > > >   mobile-broadband-provider-info: upgrade 20240407 -> 20251101
> > > >   vim: ignore CVE-2025-66476
> > > >
> > > > Benjamin Robin (Schneider Electric) (1):
> > > >   spdx30_tasks: Exclude 'doc' when exporting PACKAGECONFIG to SPDX
> > > >
> > > > Bruce Ashfield (7):
> > > >   linux-yocto/6.6: update to v6.6.112
> > > >   linux-yocto/6.6: update to v6.6.114
> > > >   linux-yocto/6.6: update to v6.6.116
> > > >   linux-yocto/6.6: update to v6.6.118
> > > >   linux-yocto/6.6: update to v6.6.119
> > > >   linux-yocto/6.6: update to v6.6.120
> > > >   linux-yocto/6.6: update to v6.6.123
> > > >
> > > > Daniel Dragomir (1):
> > > >   wic/engine: error on old host debugfs for standalone directory co=
py
> > > >
> > > > Deepak Rathore (7):
> > > >   go 1.22.12: Fix CVE-2025-61730
> > > >   go 1.22.12: Fix CVE-2025-61726
> > > >   go 1.22.12: Fix CVE-2025-61728
> > > >   go 1.22.12: Fix CVE-2025-61731
> > > >   go 1.22.12: Fix CVE-2025-68119
> > > >   go 1.22.12: Fix CVE-2025-61732
> > > >   go 1.22.12: Fix CVE-2025-68121
> > > >
> > > > Dragomir, Daniel (2):
> > > >   wic/engine: fix copying directories into wic image with ext*
> partition
> > > >   oeqa/selftest/wic: test recursive dir copy on ext partitions
> > > >
> > > > Fabio Berton (1):
> > > >   classes/buildhistory: Do not sign buildhistory commits
> > > >
> > > > Hitendra Prajapati (2):
> > > >   openssl: fix CVE-2025-15468
> > > >   openssl: fix CVE-2025-69419
> > > >
> > > > Ming Liu (1):
> > > >   weston: fix a touch-calibrator issue
> > > >
> > > > Peter Marko (10):
> > > >   libsndfile1: patch CVE-2025-56226
> > > >   libpng: patch CVE-2026-25646
> > > >   glib-2.0: patch CVE-2026-1484
> > > >   glib-2.0: patch CVE-2026-1485
> > > >   glib-2.0: patch CVE-2026-1489
> > > >   ffmpeg: ignore CVE-2025-1594
> > > >   libtheora: mark CVE-2024-56431 as not vulnerable yet
> > > >   ffmpeg: set status of CVE-2025-25468
> > > >   gnupg: patch CVE-2025-68973
> > > >   alsa-lib: patch CVE-2026-25068
> > > >
> > > > Pratik Farkase (1):
> > > >   libevent: merge inherit statements
> > > >
> > > > Richard Purdie (1):
> > > >   go-vendor: Fix absolute paths issue
> > > >
> > > > Vijay Anusuri (1):
> > > >   bind: Upgrade 9.18.41 -> 9.18.44
> > > >
> > > > Yoann Congal (2):
> > > >   pseudo: Update to include a fix for systems with kernel <5.6
> > > >   u-boot: move CVE patches out of the common .inc file
> > > >
> > > >  meta/classes/buildhistory.bbclass             |   2 +-
> > > >  meta/classes/go-vendor.bbclass                |   6 +-
> > > >  meta/lib/oe/spdx30_tasks.py                   |   8 +-
> > > >  meta/lib/oeqa/selftest/cases/wic.py           |  65 ++
> > > >  meta/recipes-bsp/u-boot/u-boot-common.inc     |  12 +-
> > > >  meta/recipes-bsp/u-boot/u-boot_2024.01.bb     |  10 +
> > > >  meta/recipes-connectivity/avahi/avahi_0.8.bb  |   4 +
> > > >  .../avahi/files/CVE-2025-68276.patch          |  65 ++
> > > >  .../avahi/files/CVE-2025-68468.patch          |  32 +
> > > >  .../avahi/files/CVE-2025-68471.patch          |  36 +
> > > >  .../avahi/files/CVE-2026-24401.patch          |  74 ++
> > > >  .../bind/{bind_9.18.41.bb =3D> bind_9.18.44.bb} |   2 +-
> > > >  .../mobile-broadband-provider-info_git.bb     |   4 +-
> > > >  .../openssl/openssl/CVE-2025-15468.patch      |  39 +
> > > >  .../openssl/openssl/CVE-2025-69419.patch      |  61 ++
> > > >  .../openssl/openssl_3.2.6.bb                  |   2 +
> > > >  .../glib-2.0/glib-2.0/CVE-2026-1484-01.patch  |  48 +
> > > >  .../glib-2.0/glib-2.0/CVE-2026-1484-02.patch  |  45 +
> > > >  .../glib-2.0/glib-2.0/CVE-2026-1485.patch     |  44 +
> > > >  .../glib-2.0/glib-2.0/CVE-2026-1489-01.patch  |  42 +
> > > >  .../glib-2.0/glib-2.0/CVE-2026-1489-02.patch  |  30 +
> > > >  .../glib-2.0/glib-2.0/CVE-2026-1489-03.patch  | 290 ++++++
> > > >  .../glib-2.0/glib-2.0/CVE-2026-1489-04.patch  |  68 ++
> > > >  meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb |   7 +
> > > >  meta/recipes-devtools/go/go-1.22.12.inc       |  10 +
> > > >  .../go/go/CVE-2025-61726.patch                | 196 +++++
> > > >  .../go/go/CVE-2025-61728.patch                | 171 ++++
> > > >  .../go/go/CVE-2025-61730.patch                | 460 ++++++++++
> > > >  .../go/go/CVE-2025-61731.patch                |  70 ++
> > > >  .../go/go/CVE-2025-61732.patch                |  53 ++
> > > >  .../go/go/CVE-2025-68119-dependent.patch      | 175 ++++
> > > >  .../go/go/CVE-2025-68119.patch                | 828
> ++++++++++++++++++
> > > >  .../go/go/CVE-2025-68121_p1.patch             | 253 ++++++
> > > >  .../go/go/CVE-2025-68121_p2.patch             | 385 ++++++++
> > > >  .../go/go/CVE-2025-68121_p3.patch             |  82 ++
> > > >  meta/recipes-devtools/pseudo/pseudo_git.bb    |   2 +-
> > > >  ...ator-Regularise-surface-view-mapping.patch |  78 ++
> > > >  .../recipes-graphics/wayland/weston_13.0.1.bb |   1 +
> > > >  .../linux/linux-yocto-rt_6.6.bb               |   6 +-
> > > >  .../linux/linux-yocto-tiny_6.6.bb             |   6 +-
> > > >  meta/recipes-kernel/linux/linux-yocto_6.6.bb  |  28 +-
> > > >  .../alsa/alsa-lib/CVE-2026-25068.patch        |  34 +
> > > >  .../alsa/alsa-lib_1.2.11.bb                   |   1 +
> > > >  .../recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb |   3 +-
> > > >  .../libpng/files/CVE-2026-25646.patch         |  61 ++
> > > >  .../libpng/libpng_1.6.42.bb                   |   1 +
> > > >  .../libsndfile1/CVE-2025-56226-01.patch       |  36 +
> > > >  .../libsndfile1/CVE-2025-56226-02.patch       |  43 +
> > > >  .../libsndfile/libsndfile1_1.2.2.bb           |   2 +
> > > >  .../libtheora/libtheora_1.1.1.bb              |   2 +
> > > >  .../gnupg/gnupg/CVE-2025-68973.patch          | 108 +++
> > > >  meta/recipes-support/gnupg/gnupg_2.4.8.bb     |   1 +
> > > >  .../libevent/libevent_2.1.12.bb               |   4 +-
> > > >  meta/recipes-support/vim/vim_9.1.bb           |   2 +
> > > >  scripts/install-buildtools                    |   4 +-
> > > >  scripts/lib/wic/engine.py                     |  92 +-
> > > >  56 files changed, 4132 insertions(+), 62 deletions(-)
> > > >  create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2025-
> > 68276.patch
> > > >  create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2025-
> > 68468.patch
> > > >  create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2025-
> > 68471.patch
> > > >  create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2026-
> > 24401.patch
> > > >  rename meta/recipes-connectivity/bind/{bind_9.18.41.bb =3D>
> bind_9.18.44.bb}
> > (97%)
> > > >  create mode 100644
> meta/recipes-connectivity/openssl/openssl/CVE-2025-
> > 15468.patch
> > > >  create mode 100644
> meta/recipes-connectivity/openssl/openssl/CVE-2025-
> > 69419.patch
> > > >  create mode 100644
> meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1484-
> > 01.patch
> > > >  create mode 100644
> meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1484-
> > 02.patch
> > > >  create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-
> > 1485.patch
> > > >  create mode 100644
> meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1489-
> > 01.patch
> > > >  create mode 100644
> meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1489-
> > 02.patch
> > > >  create mode 100644
> meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1489-
> > 03.patch
> > > >  create mode 100644
> meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1489-
> > 04.patch
> > > >  create mode 100644 meta/recipes-devtools/go/go/CVE-2025-61726.patc=
h
> > > >  create mode 100644 meta/recipes-devtools/go/go/CVE-2025-61728.patc=
h
> > > >  create mode 100644 meta/recipes-devtools/go/go/CVE-2025-61730.patc=
h
> > > >  create mode 100644 meta/recipes-devtools/go/go/CVE-2025-61731.patc=
h
> > > >  create mode 100644 meta/recipes-devtools/go/go/CVE-2025-61732.patc=
h
> > > >  create mode 100644 meta/recipes-devtools/go/go/CVE-2025-68119-
> > dependent.patch
> > > >  create mode 100644 meta/recipes-devtools/go/go/CVE-2025-68119.patc=
h
> > > >  create mode 100644
> meta/recipes-devtools/go/go/CVE-2025-68121_p1.patch
> > > >  create mode 100644
> meta/recipes-devtools/go/go/CVE-2025-68121_p2.patch
> > > >  create mode 100644
> meta/recipes-devtools/go/go/CVE-2025-68121_p3.patch
> > > >  create mode 100644 meta/recipes-graphics/wayland/weston/0001-touch=
-
> > calibrator-Regularise-surface-view-mapping.patch
> > > >  create mode 100644 meta/recipes-multimedia/alsa/alsa-lib/CVE-2026-
> > 25068.patch
> > > >  create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2026-
> > 25646.patch
> > > >  create mode 100644
> meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2025-
> > 56226-01.patch
> > > >  create mode 100644
> meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2025-
> > 56226-02.patch
> > > >  create mode 100644 meta/recipes-support/gnupg/gnupg/CVE-2025-
> > 68973.patch
> > > >
>


--=20
Yoann Congal
Smile ECS

--000000000000d2cde0064baca05a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mer. 25=
 f=C3=A9vr. 2026 =C3=A0=C2=A018:19, Marko, Peter &lt;<a href=3D"mailto:Pete=
r.Marko@siemens.com">Peter.Marko@siemens.com</a>&gt; a =C3=A9crit=C2=A0:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">Upgrade to 3.5.x i=
s in progress.<br>
Testing was already performed successfully on AB.<br>
I&#39;m planning to write a proposal to Yocto project TSC for approval next=
 week.<br>
<br>
Patching current recipe is a regular LTS activity and should be accepted.<b=
r></blockquote><div><br></div><div>Patrick, Peter,</div><div><br></div><div=
>FYI, the Openssl 3.5.x upgrade for scarthgap is on the TSC agenda on monda=
y.</div><div>In the meantime, I plan to start a new upgraded build on autob=
uilder.</div><div><br></div><div>So, this situation might evolve=C2=A0soon.=
</div><div><br></div><div>Regards,</div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">
<br>
Peter<br>
<br>
&gt; -----Original Message-----<br>
&gt; From: <a href=3D"mailto:openembedded-core@lists.openembedded.org" targ=
et=3D"_blank">openembedded-core@lists.openembedded.org</a> &lt;openembedded=
-<br>
&gt; <a href=3D"mailto:core@lists.openembedded.org" target=3D"_blank">core@=
lists.openembedded.org</a>&gt; On Behalf Of Patrick Vogelaar via<br>
&gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D=
"_blank">lists.openembedded.org</a><br>
&gt; Sent: Wednesday, February 25, 2026 18:12<br>
&gt; To: <a href=3D"mailto:yoann.congal@smile.fr" target=3D"_blank">yoann.c=
ongal@smile.fr</a>; Yoann Congal via <a href=3D"http://lists.openembedded.o=
rg" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a><br>
&gt; &lt;yoann.congal=3D<a href=3D"mailto:smile.fr@lists.openembedded.org" =
target=3D"_blank">smile.fr@lists.openembedded.org</a>&gt;; openembedded-<br=
>
&gt; <a href=3D"mailto:core@lists.openembedded.org" target=3D"_blank">core@=
lists.openembedded.org</a><br>
&gt; Subject: Re: [OE-core][scarthgap 00/44] Patch review<br>
&gt; <br>
&gt; Hi,<br>
&gt; <br>
&gt; I am a bit unsure about the openssl patches. I am not questioning them=
 technically<br>
&gt; but if it is the right way to patch openssl 3.2 since it is EOL [1].<b=
r>
&gt; <br>
&gt; Wouldn&#39;t it be better, as suggested in [1], to upgrade to either v=
ersion 3.6.x (EOL<br>
&gt; 1st November 2026) or version 3.5.x (EOL April 2030 -&gt; LTS).<br>
&gt; <br>
&gt; If you agree with that, I would prepare a patch. Just let me know hte =
preffered<br>
&gt; version, since I am a bit unsure how this is usually handled on a LTS =
version.<br>
&gt; <br>
&gt; [1] <a href=3D"https://openssl-library.org/post/2025-11-25-eol-32/" re=
l=3D"noreferrer" target=3D"_blank">https://openssl-library.org/post/2025-11=
-25-eol-32/</a><br>
&gt; <br>
&gt; Best Regards<br>
&gt; Patrick<br>
&gt; <br>
&gt; &gt; <a href=3D"mailto:patrick.vogelaar@mailbox.org" target=3D"_blank"=
>patrick.vogelaar@mailbox.org</a> hat am 25.02.2026 17:59 CET geschrieben:<=
br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; Hi,<br>
&gt; &gt;<br>
&gt; &gt; I am a bit unsure about the openssl patches. I am not questioning=
 them<br>
&gt; technically but if it is the right way to patch openssl 3.2 since it i=
s EOL [1].<br>
&gt; &gt;<br>
&gt; &gt; Wouldn&#39;t it be better, as suggested in [1], to upgrade to eit=
her version 3.6.x<br>
&gt; (EOL 1st November 2026) or version 3.5.x (EOL April 2030 -&gt; LTS).<b=
r>
&gt; &gt;<br>
&gt; &gt; If you agree with that, I would prepare a patch. Just let me know=
 hte preffered<br>
&gt; version, since I am a bit unsure how this is usually handled on a LTS =
version.<br>
&gt; &gt;<br>
&gt; &gt; [1] <a href=3D"https://openssl-library.org/post/2025-11-25-eol-32=
/" rel=3D"noreferrer" target=3D"_blank">https://openssl-library.org/post/20=
25-11-25-eol-32/</a><br>
&gt; &gt;<br>
&gt; &gt; Best Regards<br>
&gt; &gt; Patrick<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; &gt; Yoann Congal via <a href=3D"http://lists.openembedded.org" r=
el=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a><br>
&gt; &lt;yoann.congal=3D<a href=3D"mailto:smile.fr@lists.openembedded.org" =
target=3D"_blank">smile.fr@lists.openembedded.org</a>&gt; hat am 24.02.2026=
 15:31 CET<br>
&gt; geschrieben:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Please review this set of changes for scarthgap and have com=
ments back by<br>
&gt; &gt; &gt; end of day Thursday, February 26.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Passed a-full on autobuilder:<br>
&gt; &gt; &gt; <a href=3D"https://autobuilder.yoctoproject.org/valkyrie/?#/=
builders/29/builds/3276" rel=3D"noreferrer" target=3D"_blank">https://autob=
uilder.yoctoproject.org/valkyrie/?#/builders/29/builds/3276</a><br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; The following changes since commit<br>
&gt; a1f4ae4e569bc0e36c27c1e4651e502e54d63b28:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0build-appliance-image: Update to scarthgap head =
revision (2026-02-16<br>
&gt; 09:52:44 +0000)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; are available in the Git repository at:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0<a href=3D"https://git.openembedded.org/openembe=
dded-core-contrib" rel=3D"noreferrer" target=3D"_blank">https://git.openemb=
edded.org/openembedded-core-contrib</a> stable/scarthgap-<br>
&gt; nut<br>
&gt; &gt; &gt;=C2=A0 =C2=A0<a href=3D"https://git.openembedded.org/openembe=
dded-core-" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.o=
rg/openembedded-core-</a><br>
&gt; contrib/log/?h=3Dstable/scarthgap-nut<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; for you to fetch changes up to 94a2960e1ae3923599affb6b227ef=
3f1870f5633:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0u-boot: move CVE patches out of the common .inc =
file (2026-02-24 10:34:08<br>
&gt; +0100)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; ------------------------------------------------------------=
----<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Aleksandar Nikolic (1):<br>
&gt; &gt; &gt;=C2=A0 =C2=A0scripts/install-buildtools: Update to 5.0.15<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Amaury Couderc (2):<br>
&gt; &gt; &gt;=C2=A0 =C2=A0avahi: patch CVE-2025-68468<br>
&gt; &gt; &gt;=C2=A0 =C2=A0avahi: patch CVE-2025-68471<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Ankur Tyagi (4):<br>
&gt; &gt; &gt;=C2=A0 =C2=A0avahi: patch CVE-2025-68276<br>
&gt; &gt; &gt;=C2=A0 =C2=A0avahi: patch CVE-2026-24401<br>
&gt; &gt; &gt;=C2=A0 =C2=A0mobile-broadband-provider-info: upgrade 20240407=
 -&gt; 20251101<br>
&gt; &gt; &gt;=C2=A0 =C2=A0vim: ignore CVE-2025-66476<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Benjamin Robin (Schneider Electric) (1):<br>
&gt; &gt; &gt;=C2=A0 =C2=A0spdx30_tasks: Exclude &#39;doc&#39; when exporti=
ng PACKAGECONFIG to SPDX<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Bruce Ashfield (7):<br>
&gt; &gt; &gt;=C2=A0 =C2=A0linux-yocto/6.6: update to v6.6.112<br>
&gt; &gt; &gt;=C2=A0 =C2=A0linux-yocto/6.6: update to v6.6.114<br>
&gt; &gt; &gt;=C2=A0 =C2=A0linux-yocto/6.6: update to v6.6.116<br>
&gt; &gt; &gt;=C2=A0 =C2=A0linux-yocto/6.6: update to v6.6.118<br>
&gt; &gt; &gt;=C2=A0 =C2=A0linux-yocto/6.6: update to v6.6.119<br>
&gt; &gt; &gt;=C2=A0 =C2=A0linux-yocto/6.6: update to v6.6.120<br>
&gt; &gt; &gt;=C2=A0 =C2=A0linux-yocto/6.6: update to v6.6.123<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Daniel Dragomir (1):<br>
&gt; &gt; &gt;=C2=A0 =C2=A0wic/engine: error on old host debugfs for standa=
lone directory copy<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Deepak Rathore (7):<br>
&gt; &gt; &gt;=C2=A0 =C2=A0go 1.22.12: Fix CVE-2025-61730<br>
&gt; &gt; &gt;=C2=A0 =C2=A0go 1.22.12: Fix CVE-2025-61726<br>
&gt; &gt; &gt;=C2=A0 =C2=A0go 1.22.12: Fix CVE-2025-61728<br>
&gt; &gt; &gt;=C2=A0 =C2=A0go 1.22.12: Fix CVE-2025-61731<br>
&gt; &gt; &gt;=C2=A0 =C2=A0go 1.22.12: Fix CVE-2025-68119<br>
&gt; &gt; &gt;=C2=A0 =C2=A0go 1.22.12: Fix CVE-2025-61732<br>
&gt; &gt; &gt;=C2=A0 =C2=A0go 1.22.12: Fix CVE-2025-68121<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Dragomir, Daniel (2):<br>
&gt; &gt; &gt;=C2=A0 =C2=A0wic/engine: fix copying directories into wic ima=
ge with ext* partition<br>
&gt; &gt; &gt;=C2=A0 =C2=A0oeqa/selftest/wic: test recursive dir copy on ex=
t partitions<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Fabio Berton (1):<br>
&gt; &gt; &gt;=C2=A0 =C2=A0classes/buildhistory: Do not sign buildhistory c=
ommits<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Hitendra Prajapati (2):<br>
&gt; &gt; &gt;=C2=A0 =C2=A0openssl: fix CVE-2025-15468<br>
&gt; &gt; &gt;=C2=A0 =C2=A0openssl: fix CVE-2025-69419<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Ming Liu (1):<br>
&gt; &gt; &gt;=C2=A0 =C2=A0weston: fix a touch-calibrator issue<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Peter Marko (10):<br>
&gt; &gt; &gt;=C2=A0 =C2=A0libsndfile1: patch CVE-2025-56226<br>
&gt; &gt; &gt;=C2=A0 =C2=A0libpng: patch CVE-2026-25646<br>
&gt; &gt; &gt;=C2=A0 =C2=A0glib-2.0: patch CVE-2026-1484<br>
&gt; &gt; &gt;=C2=A0 =C2=A0glib-2.0: patch CVE-2026-1485<br>
&gt; &gt; &gt;=C2=A0 =C2=A0glib-2.0: patch CVE-2026-1489<br>
&gt; &gt; &gt;=C2=A0 =C2=A0ffmpeg: ignore CVE-2025-1594<br>
&gt; &gt; &gt;=C2=A0 =C2=A0libtheora: mark CVE-2024-56431 as not vulnerable=
 yet<br>
&gt; &gt; &gt;=C2=A0 =C2=A0ffmpeg: set status of CVE-2025-25468<br>
&gt; &gt; &gt;=C2=A0 =C2=A0gnupg: patch CVE-2025-68973<br>
&gt; &gt; &gt;=C2=A0 =C2=A0alsa-lib: patch CVE-2026-25068<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Pratik Farkase (1):<br>
&gt; &gt; &gt;=C2=A0 =C2=A0libevent: merge inherit statements<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Richard Purdie (1):<br>
&gt; &gt; &gt;=C2=A0 =C2=A0go-vendor: Fix absolute paths issue<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Vijay Anusuri (1):<br>
&gt; &gt; &gt;=C2=A0 =C2=A0bind: Upgrade 9.18.41 -&gt; 9.18.44<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Yoann Congal (2):<br>
&gt; &gt; &gt;=C2=A0 =C2=A0pseudo: Update to include a fix for systems with=
 kernel &lt;5.6<br>
&gt; &gt; &gt;=C2=A0 =C2=A0u-boot: move CVE patches out of the common .inc =
file<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 meta/classes/buildhistory.bbclass=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt; &gt; &gt;=C2=A0 meta/classes/go-vendor.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A06 +-<br>
&gt; &gt; &gt;=C2=A0 meta/lib/oe/spdx30_tasks.py=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A08 +-<br>
&gt; &gt; &gt;=C2=A0 meta/lib/oeqa/selftest/cases/wic.py=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 65 ++<br>
&gt; &gt; &gt;=C2=A0 meta/recipes-bsp/u-boot/u-boot-common.inc=C2=A0 =C2=A0=
 =C2=A0|=C2=A0 12 +-<br>
&gt; &gt; &gt;=C2=A0 meta/recipes-bsp/u-boot/<a href=3D"http://u-boot_2024.=
01.bb" rel=3D"noreferrer" target=3D"_blank">u-boot_2024.01.bb</a>=C2=A0 =C2=
=A0 =C2=A0|=C2=A0 10 +<br>
&gt; &gt; &gt;=C2=A0 meta/recipes-connectivity/avahi/<a href=3D"http://avah=
i_0.8.bb" rel=3D"noreferrer" target=3D"_blank">avahi_0.8.bb</a>=C2=A0 |=C2=
=A0 =C2=A04 +<br>
&gt; &gt; &gt;=C2=A0 .../avahi/files/CVE-2025-68276.patch=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 65 ++<br>
&gt; &gt; &gt;=C2=A0 .../avahi/files/CVE-2025-68468.patch=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 32 +<br>
&gt; &gt; &gt;=C2=A0 .../avahi/files/CVE-2025-68471.patch=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 36 +<br>
&gt; &gt; &gt;=C2=A0 .../avahi/files/CVE-2026-24401.patch=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 74 ++<br>
&gt; &gt; &gt;=C2=A0 .../bind/{<a href=3D"http://bind_9.18.41.bb" rel=3D"no=
referrer" target=3D"_blank">bind_9.18.41.bb</a> =3D&gt; <a href=3D"http://b=
ind_9.18.44.bb" rel=3D"noreferrer" target=3D"_blank">bind_9.18.44.bb</a>} |=
=C2=A0 =C2=A02 +-<br>
&gt; &gt; &gt;=C2=A0 .../<a href=3D"http://mobile-broadband-provider-info_g=
it.bb" rel=3D"noreferrer" target=3D"_blank">mobile-broadband-provider-info_=
git.bb</a>=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
&gt; &gt; &gt;=C2=A0 .../openssl/openssl/CVE-2025-15468.patch=C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 39 +<br>
&gt; &gt; &gt;=C2=A0 .../openssl/openssl/CVE-2025-69419.patch=C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 61 ++<br>
&gt; &gt; &gt;=C2=A0 .../openssl/<a href=3D"http://openssl_3.2.6.bb" rel=3D=
"noreferrer" target=3D"_blank">openssl_3.2.6.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +<br>
&gt; &gt; &gt;=C2=A0 .../glib-2.0/glib-2.0/CVE-2026-1484-01.patch=C2=A0 |=
=C2=A0 48 +<br>
&gt; &gt; &gt;=C2=A0 .../glib-2.0/glib-2.0/CVE-2026-1484-02.patch=C2=A0 |=
=C2=A0 45 +<br>
&gt; &gt; &gt;=C2=A0 .../glib-2.0/glib-2.0/CVE-2026-1485.patch=C2=A0 =C2=A0=
 =C2=A0|=C2=A0 44 +<br>
&gt; &gt; &gt;=C2=A0 .../glib-2.0/glib-2.0/CVE-2026-1489-01.patch=C2=A0 |=
=C2=A0 42 +<br>
&gt; &gt; &gt;=C2=A0 .../glib-2.0/glib-2.0/CVE-2026-1489-02.patch=C2=A0 |=
=C2=A0 30 +<br>
&gt; &gt; &gt;=C2=A0 .../glib-2.0/glib-2.0/CVE-2026-1489-03.patch=C2=A0 | 2=
90 ++++++<br>
&gt; &gt; &gt;=C2=A0 .../glib-2.0/glib-2.0/CVE-2026-1489-04.patch=C2=A0 |=
=C2=A0 68 ++<br>
&gt; &gt; &gt;=C2=A0 meta/recipes-core/glib-2.0/<a href=3D"http://glib-2.0_=
2.78.6.bb" rel=3D"noreferrer" target=3D"_blank">glib-2.0_2.78.6.bb</a> |=C2=
=A0 =C2=A07 +<br>
&gt; &gt; &gt;=C2=A0 meta/recipes-devtools/go/go-1.22.12.inc=C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 10 +<br>
&gt; &gt; &gt;=C2=A0 .../go/go/CVE-2025-61726.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 196 +++++<br>
&gt; &gt; &gt;=C2=A0 .../go/go/CVE-2025-61728.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 171 ++++<br>
&gt; &gt; &gt;=C2=A0 .../go/go/CVE-2025-61730.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 460 ++++++++++<br>
&gt; &gt; &gt;=C2=A0 .../go/go/CVE-2025-61731.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 70 ++<br>
&gt; &gt; &gt;=C2=A0 .../go/go/CVE-2025-61732.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 53 ++<br>
&gt; &gt; &gt;=C2=A0 .../go/go/CVE-2025-68119-dependent.patch=C2=A0 =C2=A0 =
=C2=A0 | 175 ++++<br>
&gt; &gt; &gt;=C2=A0 .../go/go/CVE-2025-68119.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 828 ++++++++++++++++++<br>
&gt; &gt; &gt;=C2=A0 .../go/go/CVE-2025-68121_p1.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 253 ++++++<br>
&gt; &gt; &gt;=C2=A0 .../go/go/CVE-2025-68121_p2.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 385 ++++++++<br>
&gt; &gt; &gt;=C2=A0 .../go/go/CVE-2025-68121_p3.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 82 ++<br>
&gt; &gt; &gt;=C2=A0 meta/recipes-devtools/pseudo/<a href=3D"http://pseudo_=
git.bb" rel=3D"noreferrer" target=3D"_blank">pseudo_git.bb</a>=C2=A0 =C2=A0=
 |=C2=A0 =C2=A02 +-<br>
&gt; &gt; &gt;=C2=A0 ...ator-Regularise-surface-view-mapping.patch |=C2=A0 =
78 ++<br>
&gt; &gt; &gt;=C2=A0 .../recipes-graphics/wayland/<a href=3D"http://weston_=
13.0.1.bb" rel=3D"noreferrer" target=3D"_blank">weston_13.0.1.bb</a> |=C2=
=A0 =C2=A01 +<br>
&gt; &gt; &gt;=C2=A0 .../linux/<a href=3D"http://linux-yocto-rt_6.6.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto-rt_6.6.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A06 +-<br>
&gt; &gt; &gt;=C2=A0 .../linux/<a href=3D"http://linux-yocto-tiny_6.6.bb" r=
el=3D"noreferrer" target=3D"_blank">linux-yocto-tiny_6.6.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A06 +-<br>
&gt; &gt; &gt;=C2=A0 meta/recipes-kernel/linux/<a href=3D"http://linux-yoct=
o_6.6.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto_6.6.bb</a>=C2=A0=
 |=C2=A0 28 +-<br>
&gt; &gt; &gt;=C2=A0 .../alsa/alsa-lib/CVE-2026-25068.patch=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 34 +<br>
&gt; &gt; &gt;=C2=A0 .../alsa/<a href=3D"http://alsa-lib_1.2.11.bb" rel=3D"=
noreferrer" target=3D"_blank">alsa-lib_1.2.11.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
&gt; &gt; &gt;=C2=A0 .../recipes-multimedia/ffmpeg/<a href=3D"http://ffmpeg=
_6.1.4.bb" rel=3D"noreferrer" target=3D"_blank">ffmpeg_6.1.4.bb</a> |=C2=A0=
 =C2=A03 +-<br>
&gt; &gt; &gt;=C2=A0 .../libpng/files/CVE-2026-25646.patch=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 61 ++<br>
&gt; &gt; &gt;=C2=A0 .../libpng/<a href=3D"http://libpng_1.6.42.bb" rel=3D"=
noreferrer" target=3D"_blank">libpng_1.6.42.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
&gt; &gt; &gt;=C2=A0 .../libsndfile1/CVE-2025-56226-01.patch=C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 36 +<br>
&gt; &gt; &gt;=C2=A0 .../libsndfile1/CVE-2025-56226-02.patch=C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 43 +<br>
&gt; &gt; &gt;=C2=A0 .../libsndfile/<a href=3D"http://libsndfile1_1.2.2.bb"=
 rel=3D"noreferrer" target=3D"_blank">libsndfile1_1.2.2.bb</a>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
&gt; &gt; &gt;=C2=A0 .../libtheora/<a href=3D"http://libtheora_1.1.1.bb" re=
l=3D"noreferrer" target=3D"_blank">libtheora_1.1.1.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +<br>
&gt; &gt; &gt;=C2=A0 .../gnupg/gnupg/CVE-2025-68973.patch=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 108 +++<br>
&gt; &gt; &gt;=C2=A0 meta/recipes-support/gnupg/<a href=3D"http://gnupg_2.4=
.8.bb" rel=3D"noreferrer" target=3D"_blank">gnupg_2.4.8.bb</a>=C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A01 +<br>
&gt; &gt; &gt;=C2=A0 .../libevent/<a href=3D"http://libevent_2.1.12.bb" rel=
=3D"noreferrer" target=3D"_blank">libevent_2.1.12.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
&gt; &gt; &gt;=C2=A0 meta/recipes-support/vim/<a href=3D"http://vim_9.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">vim_9.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
&gt; &gt; &gt;=C2=A0 scripts/install-buildtools=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
&gt; &gt; &gt;=C2=A0 scripts/lib/wic/engine.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 92 +-<br>
&gt; &gt; &gt;=C2=A0 56 files changed, 4132 insertions(+), 62 deletions(-)<=
br>
&gt; &gt; &gt;=C2=A0 create mode 100644 meta/recipes-connectivity/avahi/fil=
es/CVE-2025-<br>
&gt; 68276.patch<br>
&gt; &gt; &gt;=C2=A0 create mode 100644 meta/recipes-connectivity/avahi/fil=
es/CVE-2025-<br>
&gt; 68468.patch<br>
&gt; &gt; &gt;=C2=A0 create mode 100644 meta/recipes-connectivity/avahi/fil=
es/CVE-2025-<br>
&gt; 68471.patch<br>
&gt; &gt; &gt;=C2=A0 create mode 100644 meta/recipes-connectivity/avahi/fil=
es/CVE-2026-<br>
&gt; 24401.patch<br>
&gt; &gt; &gt;=C2=A0 rename meta/recipes-connectivity/bind/{<a href=3D"http=
://bind_9.18.41.bb" rel=3D"noreferrer" target=3D"_blank">bind_9.18.41.bb</a=
> =3D&gt; <a href=3D"http://bind_9.18.44.bb" rel=3D"noreferrer" target=3D"_=
blank">bind_9.18.44.bb</a>}<br>
&gt; (97%)<br>
&gt; &gt; &gt;=C2=A0 create mode 100644 meta/recipes-connectivity/openssl/o=
penssl/CVE-2025-<br>
&gt; 15468.patch<br>
&gt; &gt; &gt;=C2=A0 create mode 100644 meta/recipes-connectivity/openssl/o=
penssl/CVE-2025-<br>
&gt; 69419.patch<br>
&gt; &gt; &gt;=C2=A0 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0=
/CVE-2026-1484-<br>
&gt; 01.patch<br>
&gt; &gt; &gt;=C2=A0 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0=
/CVE-2026-1484-<br>
&gt; 02.patch<br>
&gt; &gt; &gt;=C2=A0 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0=
/CVE-2026-<br>
&gt; 1485.patch<br>
&gt; &gt; &gt;=C2=A0 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0=
/CVE-2026-1489-<br>
&gt; 01.patch<br>
&gt; &gt; &gt;=C2=A0 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0=
/CVE-2026-1489-<br>
&gt; 02.patch<br>
&gt; &gt; &gt;=C2=A0 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0=
/CVE-2026-1489-<br>
&gt; 03.patch<br>
&gt; &gt; &gt;=C2=A0 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0=
/CVE-2026-1489-<br>
&gt; 04.patch<br>
&gt; &gt; &gt;=C2=A0 create mode 100644 meta/recipes-devtools/go/go/CVE-202=
5-61726.patch<br>
&gt; &gt; &gt;=C2=A0 create mode 100644 meta/recipes-devtools/go/go/CVE-202=
5-61728.patch<br>
&gt; &gt; &gt;=C2=A0 create mode 100644 meta/recipes-devtools/go/go/CVE-202=
5-61730.patch<br>
&gt; &gt; &gt;=C2=A0 create mode 100644 meta/recipes-devtools/go/go/CVE-202=
5-61731.patch<br>
&gt; &gt; &gt;=C2=A0 create mode 100644 meta/recipes-devtools/go/go/CVE-202=
5-61732.patch<br>
&gt; &gt; &gt;=C2=A0 create mode 100644 meta/recipes-devtools/go/go/CVE-202=
5-68119-<br>
&gt; dependent.patch<br>
&gt; &gt; &gt;=C2=A0 create mode 100644 meta/recipes-devtools/go/go/CVE-202=
5-68119.patch<br>
&gt; &gt; &gt;=C2=A0 create mode 100644 meta/recipes-devtools/go/go/CVE-202=
5-68121_p1.patch<br>
&gt; &gt; &gt;=C2=A0 create mode 100644 meta/recipes-devtools/go/go/CVE-202=
5-68121_p2.patch<br>
&gt; &gt; &gt;=C2=A0 create mode 100644 meta/recipes-devtools/go/go/CVE-202=
5-68121_p3.patch<br>
&gt; &gt; &gt;=C2=A0 create mode 100644 meta/recipes-graphics/wayland/westo=
n/0001-touch-<br>
&gt; calibrator-Regularise-surface-view-mapping.patch<br>
&gt; &gt; &gt;=C2=A0 create mode 100644 meta/recipes-multimedia/alsa/alsa-l=
ib/CVE-2026-<br>
&gt; 25068.patch<br>
&gt; &gt; &gt;=C2=A0 create mode 100644 meta/recipes-multimedia/libpng/file=
s/CVE-2026-<br>
&gt; 25646.patch<br>
&gt; &gt; &gt;=C2=A0 create mode 100644 meta/recipes-multimedia/libsndfile/=
libsndfile1/CVE-2025-<br>
&gt; 56226-01.patch<br>
&gt; &gt; &gt;=C2=A0 create mode 100644 meta/recipes-multimedia/libsndfile/=
libsndfile1/CVE-2025-<br>
&gt; 56226-02.patch<br>
&gt; &gt; &gt;=C2=A0 create mode 100644 meta/recipes-support/gnupg/gnupg/CV=
E-2025-<br>
&gt; 68973.patch<br>
&gt; &gt; &gt;<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--000000000000d2cde0064baca05a--

