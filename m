Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 744D7CCD187
	for <webhook@archiver.kernel.org>; Sun, 12 Oct 2025 19:19:23 +0000 (UTC)
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
 by mx.groups.io with SMTP id smtpd.web10.24852.1760296755169302803
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Oct 2025 12:19:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=in7glwWf;
 spf=softfail (domain: sakoman.com, ip: 74.125.224.44, mailfrom: steve@sakoman.com)
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-6353ff1a78dso3214168d50.0
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Oct 2025 12:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1760296754; x=1760901554; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iH+sjr0NcDlHMA5tTjXwIn95OPB+Mu2adRQBePD0CWY=;
        b=in7glwWfg5n/R04iMwejezC41Boqo7fe1oi5JBZrdjjU6bpmHkqBVdeWl5lwQAMsLo
         +VW+X4L35mAmMko1iSqNJA5V/IoEsCsXfo5IDLCcWhtObYrEiEYk9F7v5yGwiA2Mhq55
         exrLQwr9cEOK8DOeyQnQjesjX5NkBLEiXAokQ9g7sRPQ+9PRsrQKFNe7g1X4uVy7stHb
         uNJ+nEEE8kUpsvzAotMDOMAi0gAzwcQeK7dd97qgbtv7WllAofRoujDJxcQ40auwOWth
         2X/e/G+Wv0liFmNCAfef4wzd+KSddU2XZLuYi63AjrAheRUn1Z6bRCA2YoGjp5+WyZ/T
         ls9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760296754; x=1760901554;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iH+sjr0NcDlHMA5tTjXwIn95OPB+Mu2adRQBePD0CWY=;
        b=h5EyLFMXmBsaEipc6ks7zdNz/YNNS0OjwWYW+wNuheb0/JNzZ8l1FEUhhGVPNm7Fd+
         QJBpiPvYMqkWIu4gzB1VA2W7T2yG+esT/bs1TsVDlJJUSUVKM28FuDsJ3Ne4HV2xn7dZ
         HOdcHfvcLWKEiOnNayCsbFS7GbsSw7OKL7opaEfWteMhpK6/nAOXGPmqNRjMN2BZN2Pn
         k9l3Yre6K4I9sLvg5MLy7dgno/FMo3QBMPkHk34+ibbO56lhpAQ0aRw3i/Jv2QqbW75l
         zKayLrLvlMWvHF39stiB55N2q8byYXLTvVhmr/YbLBt3SN+X6fxPUm9P8Szo75xwBJJm
         zNQQ==
X-Gm-Message-State: AOJu0YwEVJ2Me5O89TcbcrpVvecsAEeXx58RKODlCJHehxxOUALlbD4N
	gfWPX7hpMLy+0V0W6Oq2kSDAr92A4VmhJLHnaa5oc18bU2amT+7moTzPIrMVbIT1lNn6/DPYJ7A
	BdpEn+hRvVK138AW19dJAdNJ6hKoviqBp9s8sULPCAA==
X-Gm-Gg: ASbGncuBjyttwBe27/ExaWqYGjZ6m/yB9AVbHGxj8R6zb5eYdGkCd3HSManyN5cinL7
	6paUZ8FvJaVtnDt969Uscqos40Ks4wi/T7kl8TIYqsXOBLJMVMkIfl080niK0/pUd39+zcOIP14
	x8iagkymnLtOMKu3LmN85cZErHrh3XNGU4m/H16gKsqpmn/Hhjhteg660IPa19qy3UedwU4uMt+
	n7n+U0jKkreYY47dfrJ6YMRmYxjfrmkc9I+hL5eSNSYeEj5kJFjZzAVloYpKy8nG6I=
X-Google-Smtp-Source: AGHT+IE8rS0xy5d7t/xrAPQjZVW9Xj36/aIKUgFnvq1dvHrURs+KXL9nJdkAuFFr8WAyhX94CoelHHnGGxfW5ie1mks=
X-Received: by 2002:a05:690e:48b:b0:63c:eb82:6d45 with SMTP id
 956f58d0204a3-63ceb826ec6mr8127612d50.46.1760296753884; Sun, 12 Oct 2025
 12:19:13 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1760064493.git.steve@sakoman.com> <b4728274-d6cd-4fd8-b26b-ceef7811ffa0@gmail.com>
In-Reply-To: <b4728274-d6cd-4fd8-b26b-ceef7811ffa0@gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Sun, 12 Oct 2025 12:19:03 -0700
X-Gm-Features: AS18NWD04JGjmPIV08oW6eYE72QmFE741qK_hMK0hmpX96s2kbE3-XnGThL7RNI
Message-ID: <CAOSpxdZnAdDy9cutt62pJPxL-X2GLv1R6HzYzfMTrct2t+BMtA@mail.gmail.com>
Subject: Re: [OE-core][scarthgap 00/18] Patch review
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Oct 2025 19:19:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224747

On Sun, Oct 12, 2025 at 12:02=E2=80=AFPM Gyorgy Sarvari <skandigraun@gmail.=
com> wrote:
>
> On 10/10/25 04:50, Steve Sakoman via lists.openembedded.org wrote:
> > Please review this set of changes for scarthgap and have comments back =
by
> > end of day Monday, October 13
> >
> > Passed a-full on autobuilder:
> >
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/2553
>
> This didn't pass... though I guess it's some infra problem?

Yes, intermittent issue.  I retested that one failing test and it succeeded=
:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/66/builds/2483

Steve

>
> > The following changes since commit 2696c50af9946f425ccaf7d0e7e0eb3fd87c=
36bb:
> >
> >   expect: fix native build with GCC 15 (2025-10-02 08:40:43 -0700)
> >
> > are available in the Git repository at:
> >
> >   https://git.openembedded.org/openembedded-core-contrib stable/scarthg=
ap-nut
> >   https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dstabl=
e/scarthgap-nut
> >
> > Aleksandar Nikolic (1):
> >   scripts/install-buildtools: Update to 5.0.12
> >
> > Archana Polampalli (1):
> >   go: fix CVE-2025-47906
> >
> > Deepesh Varatharajan (1):
> >   glibc: stable 2.39 branch updates
> >
> > Gyorgy Sarvari (1):
> >   conf/bitbake.conf: use gnu mirror instead of main server
> >
> > Hitendra Prajapati (1):
> >   grub2: mark CVE-2024-2312 as not applicable
> >
> > Peter Marko (10):
> >   busybox: patch CVE-2025-46394
> >   gstreamer1.0: ignore CVEs fixed in plugins
> >   gstreamer1.0: ignore CVE-2025-2759
> >   ghostscript: patch CVE-2025-59798
> >   ghostscript: patch CVE-2025-59799
> >   ghostscript: patch CVE-2025-59800
> >   expat: follow-up for CVE-2024-8176
> >   tiff: ignore 5 CVEs
> >   ffmpeg: ignore 8 CVEs fixed in 6.1.1 and 6.1.3 releases
> >   openssl: upgrade 3.2.4 -> 3.2.6
> >
> > Ross Burton (1):
> >   pulseaudio: ignore CVE-2024-11586
> >
> > Steve Sakoman (2):
> >   selftest/cases/meta_ide.py: use use gnu mirror instead of main server
> >   oeqa/sdk/cases/buildcpio.py: use gnu mirror instead of main server
> >
> >  meta/conf/bitbake.conf                        |    2 +-
> >  meta/lib/oeqa/sdk/cases/buildcpio.py          |    2 +-
> >  meta/lib/oeqa/selftest/cases/meta_ide.py      |    2 +-
> >  meta/recipes-bsp/grub/grub2.inc               |    1 +
> >  .../openssl/openssl/CVE-2025-27587-1.patch    | 1918 -----------------
> >  .../openssl/openssl/CVE-2025-27587-2.patch    |  129 --
> >  .../{openssl_3.2.4.bb =3D> openssl_3.2.6.bb}    |    4 +-
> >  .../busybox/busybox/CVE-2025-46394-01.patch   |   57 +
> >  .../busybox/busybox/CVE-2025-46394-02.patch   |   32 +
> >  meta/recipes-core/busybox/busybox_1.36.1.bb   |    2 +
> >  .../expat/expat/CVE-2024-8176-03.patch        |   35 +
> >  .../expat/expat/CVE-2024-8176-04.patch        |  115 +
> >  .../expat/expat/CVE-2024-8176-05.patch        |   78 +
> >  meta/recipes-core/expat/expat_2.6.4.bb        |    3 +
> >  meta/recipes-core/glibc/glibc-version.inc     |    4 +-
> >  meta/recipes-devtools/go/go-1.22.12.inc       |    1 +
> >  .../go/go/CVE-2025-47906.patch                |  183 ++
> >  .../ghostscript/CVE-2025-59798.patch          |  134 ++
> >  .../ghostscript/CVE-2025-59799.patch          |   41 +
> >  .../ghostscript/CVE-2025-59800.patch          |   36 +
> >  .../ghostscript/ghostscript_10.05.1.bb        |    3 +
> >  .../recipes-multimedia/ffmpeg/ffmpeg_6.1.3.bb |    4 +
> >  .../gstreamer/gstreamer1.0_1.22.12.bb         |   19 +-
> >  meta/recipes-multimedia/libtiff/tiff_4.6.0.bb |    4 +
> >  .../pulseaudio/pulseaudio.inc                 |    2 +
> >  scripts/install-buildtools                    |    4 +-
> >  26 files changed, 754 insertions(+), 2061 deletions(-)
> >  delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2025-=
27587-1.patch
> >  delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2025-=
27587-2.patch
> >  rename meta/recipes-connectivity/openssl/{openssl_3.2.4.bb =3D> openss=
l_3.2.6.bb} (98%)
> >  create mode 100644 meta/recipes-core/busybox/busybox/CVE-2025-46394-01=
.patch
> >  create mode 100644 meta/recipes-core/busybox/busybox/CVE-2025-46394-02=
.patch
> >  create mode 100644 meta/recipes-core/expat/expat/CVE-2024-8176-03.patc=
h
> >  create mode 100644 meta/recipes-core/expat/expat/CVE-2024-8176-04.patc=
h
> >  create mode 100644 meta/recipes-core/expat/expat/CVE-2024-8176-05.patc=
h
> >  create mode 100644 meta/recipes-devtools/go/go/CVE-2025-47906.patch
> >  create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2=
025-59798.patch
> >  create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2=
025-59799.patch
> >  create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2=
025-59800.patch
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#224644): https://lists.openembedded.org/g/openembed=
ded-core/message/224644
> > Mute This Topic: https://lists.openembedded.org/mt/115683663/6084445
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
skandigraun@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

