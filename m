Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D275E9905D
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 09:10:16 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.152080.1775812211074157850
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Apr 2026 02:10:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=MXmGKjmT;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5a3be187ffbso1442585e87.0
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Apr 2026 02:10:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775812209; cv=none;
        d=google.com; s=arc-20240605;
        b=IWtkkU218PoEW/a1cJ+1NV94UpxdeLpe8kLC4fVtS/EoHbGas7CEQ7F/IGfToky0Pp
         8yh1cnoDu0i57NhqBGuGxMKRPEqy6XiTPFdSVTKvQFcYXlqNMB+g/RHQwx4ojBp2OB3/
         ZFzgY4HMPG7g1WjaXB0VqKkq9BUdZ8vRZcHcvpvR/0Zy4lhtLsDJvQDXdqQR4lvxBwZK
         EBdjR72zg2lddoSHyTDnAQhyF8pz95uQROCIcLdU0URrGvmDi78/9C14kVzAdror4CVz
         5x1U9JovziJX6EonnaXatyY9vBj/GQih9nXm/pAojACvPlvCrtOURp7twUwDiz3XtAhh
         e/aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dccb4rz7EKXD2n47aU16pxPHUgFaoBWDE4u5ELHVnU8=;
        fh=ipws0wG+k0OA3kXqbycnQoCJAD8PbitcTEukBC/jmQo=;
        b=PP6pJS+G49dLefu8QqvUYtglj5Z+43Wpk38wVrzh6WYJPEvhsrVdJMZVKc8rdFQdna
         PoUCMZtXHRo5Yw7ahbJK/dZ/3ZmB0pCR5sMKeyAIfHJv/Pftx+7f0qXQk+KzyB2pZq9s
         x9a1CKoj8jUVU+jNWAu4+7zV2VqtWK/gZFaKVd0BLHTRuO/ChkxGJ5IKVXkdDN0lg3r6
         q9ftKxHmuDFdoYdxkWV1EuKEo5dS6JTVAH1xfu0aBKC+4yfhSep0sjVsQy+nsh/lIcGg
         RMS13Pi+GAwjSqxOetY85Kn+UQIpL7wRvPWC2hgPymQ/B6EzwuhTfKeEAzRdO+0j/B6/
         Cm2w==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775812209; x=1776417009; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dccb4rz7EKXD2n47aU16pxPHUgFaoBWDE4u5ELHVnU8=;
        b=MXmGKjmT+iXAIWfjJvdeMEW5SzpgXC5vfq8o69EcmZeapiMDrdWa4MxQURWwX22ihm
         Lf14j4Vy1Cwa3tC9wyLFmc+VjDI+CRxSpk1TkyuE9YpcnhW7NmV1SXc6wzx1bst/lDD8
         eaG6WsWIYDoanfmr4lpscSbi9KztUDuRvJ86bPW8s7e4PafShxQlmKw1QAF/ydQpBUTz
         RxUS/QkiW8AK0sPDnNzzkKdrywATimgnRejrlSWfmVg2BisvqC/KPLfi2KNSTcEoSbLl
         zEnOTkdQjTDmvPXSDZTzNyFi0CpTswRyBmfNvzY4FGh7pQjaRQznHJPn3OMadHUnvqbD
         sN5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775812209; x=1776417009;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dccb4rz7EKXD2n47aU16pxPHUgFaoBWDE4u5ELHVnU8=;
        b=GllSI6H0A3t1fS8nEZPtx2rsnRj0AxaDSDx7sMrU5pkXXLPOZpnWfSztXoYZdI9ZD8
         na1/PYOnMNr9v09ZkHZh3Q5cg/N3tpFfooEjyyFprF6tx9YSPtQRDOrDw1lkRgDlViGT
         9/ceVGau/maRdnumyMEFBrooj8WXH8XTgGtUD67bIYKbPb02vZD801Obgcn9XE7A4/t3
         xMG9cOXCH9TykBljhcLqWP8YcMNO8CiJHKRGY844fR7T3636qD5ltUep4W83PRLx4BYz
         SAC2wx5JuxUNaZ6aaA9ZtlC+/bJHk5QK4wOKRE7wNLMIusVOhSFo/kGl/vTG1sKipRdn
         AgFw==
X-Gm-Message-State: AOJu0YwHPNimtY++1bAY8+VJBF+upwqAhiDUH10q28UmRDQEJn9SpwDk
	aPZkEJFLkgYe7fit9x6mMJ+2s98AAXT0EdKxyEaGlvkitqmFOSF5kRskDws9c62YtRZ0glcfXUr
	53E+xXdfTW+8S4VXu783diYR2QWEiynY=
X-Gm-Gg: AeBDievMmREzYO6IJdh6A3f6vyXlhrJk97zU1ufweoxHOBKqgnv4JPkQssOZFgzgwf1
	3DjMmIGbmnAaF+41AeP5uM+EYXcqbnyn8tZ+VHcSDy5GBWz841mpMrxPeBpNDkvuueS/SZ0fktu
	9HMroETV7ULcVa9phk40idkP8b7FEliKNBBjQK0hdXs51x+83Eh/AEKi81t6Jx6+vZQpbyDRb8w
	eO+coduGKGkaNiIF9mjAt71/SFE7B7VDYI199iNK131wCWTKB+lD+J2C50y8m4ayAwCgctCXnk6
	ebv+rbpAW1Flk7gUS8PrVc4RDMZZeDjMl409DGB92gHa8tyP1JXTxkVzp28uid4njw==
X-Received: by 2002:a05:6512:3d0b:b0:5a2:b86b:56c2 with SMTP id
 2adb3069b0e04-5a3e7cbe108mr2366203e87.21.1775812208525; Fri, 10 Apr 2026
 02:10:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260409152839.2894434-1-martin.jansa@gmail.com>
 <DHOV6DD1DEG9.2REH24GS0QYC3@smile.fr> <CA+chaQdA95XBr+n+-Zm2dE9sxFiaAjhthSpGvP-g+N60yj=MJQ@mail.gmail.com>
 <DHPB0K1HXR2T.1N8T3183RMIUJ@smile.fr>
In-Reply-To: <DHPB0K1HXR2T.1N8T3183RMIUJ@smile.fr>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 10 Apr 2026 11:09:54 +0200
X-Gm-Features: AQROBzCEznZbHcLH2hq1dxrctzkPQ63A_Y3WpUcQCwIX7Mxghr5ki-lY6Rm8KgE
Message-ID: <CA+chaQcHomAk3+9-aJ5vKgnNE_q8EtacTMSv8v1Ns8n1gA0xPw@mail.gmail.com>
Subject: Re: [OE-core] [whinlatter][PATCH 1/9] dtc: backport fix for build
 with glibc-2.43
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-core@lists.openembedded.org, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Apr 2026 09:10:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234999

On Fri, Apr 10, 2026 at 9:42=E2=80=AFAM Yoann Congal <yoann.congal@smile.fr=
> wrote:
>
> On Thu Apr 9, 2026 at 11:29 PM CEST, Martin Jansa wrote:
> > On Thu, Apr 9, 2026 at 9:17=E2=80=AFPM Yoann Congal <yoann.congal@smile=
.fr> wrote:
> >>
> >> On Thu Apr 9, 2026 at 5:28 PM CEST, Martin Jansa via lists.openembedde=
d.org wrote:
> >> > From: Martin Jansa <martin.jansa@gmail.com>
> >> >
> >> > glibc-2.43 isn't used in OE builds yet, but this fixes dtc-native:
> >> > https://errors.yoctoproject.org/Errors/Details/903983/
> >> >
> >> > ../sources/dtc-1.7.2/libfdt/fdt_overlay.c: In function =E2=80=98over=
lay_fixup_phandle=E2=80=99:
> >> > ../sources/dtc-1.7.2/libfdt/fdt_overlay.c:424:21: error: assignment =
discards =E2=80=98const=E2=80=99 qualifier from pointer target type [-Werro=
r=3Ddiscarded-qualifiers]
> >> >   424 |                 sep =3D memchr(fixup_str, ':', fixup_len);
> >> >       |                     ^
> >> > ../sources/dtc-1.7.2/libfdt/fdt_overlay.c:434:21: error: assignment =
discards =E2=80=98const=E2=80=99 qualifier from pointer target type [-Werro=
r=3Ddiscarded-qualifiers]
> >> >   434 |                 sep =3D memchr(name, ':', fixup_len);
> >> >       |                     ^
> >> > cc1: all warnings being treated as errors
> >> >
> >> > Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> >> > Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.=
com>
> >> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> >> > ---
> >>
> >> Hello,
> >>
> >> I've started a whinlatter bringup build on the new Ubuntu 26.04 worker
> >> with this series applied:
> >> https://autobuilder.yoctoproject.org/valkyrie/#/builders/96/builds/23
> >>
> >> It got 2 errors (Other errors are most likely consequences of these on=
es):
> >>
> >> ERROR: shadow-native-4.18.0-r0 do_configure: configure failed:
> >> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/96/builds/23=
/steps/12/logs/stdio line 6269:
> >> | checking for crypt in -lcrypt... no
> >> | configure: error: crypt() not found
> >> | NOTE: The following config.log files may provide further information=
.
> >> | NOTE: /srv/pokybuild/yocto-worker/bringup/build/build/tmp/work/x86_6=
4-linux/shadow-native/4.18.0/build/config.log
> >> | ERROR: configure failed
> >> | WARNING: exit code 1 from a shell command.
> >> NOTE: recipe shadow-native-4.18.0-r0: task do_configure: Failed
> >
> > Hello,
> >
> > for shadow please read
> > https://lists.openembedded.org/g/openembedded-core/message/234119 the
> > important part:
> > "libcrypt-dev is no longer installed as a dependency in my minimal dock=
er image"
> > I guess it's now missing on your ubuntu-26.04 host as well.
> > It used to be typically installed by build-essential -> libc6-dev ->
> > libcrypt-dev but not anymore since 2.42-7:
> >
> > 25.10 questing with 2.42-0ubuntu3.1:
> > https://packages.ubuntu.com/questing/libc6-dev
> > 26.04 resolute with 2.43-2ubuntu1:
> > https://packages.ubuntu.com/resolute/libc6-dev
> >
> > https://changelogs.ubuntu.com/changelogs/pool/main/g/glibc/glibc_2.43-2=
ubuntu1/changelog:
> > ...
> > glibc (2.42-7) unstable; urgency=3Dmedium
> >
> >   [ Aurelien Jarno ]
> >   * debian/control.in/libc, debian/rules.d/debhelper.mk: drop libcrypt-=
dev
> >     dependency from libc6-dev. Thanks to Helmut Grohne for proposing th=
at,
> >     doing an archive rebuild and filling the bug reports.
> >   * debian/control.in/main, debian/sysdeps/linux.mk: enable SystemTap s=
tatic
> >     probes.
> >   * debian/debhelper.in/libc-dev.NEWS: add a NEWS entry about the remov=
al of
> >     the obsolete termio interface.  Closes: #1124068.
> >   * debian/rules.d/debhelper.mk: ensure that linker scripts work even w=
hen
> >     /usr is unmerged.  Closes: #1120508
> >   * debian/debhelper.in/libc-dev{,-alt}.lintian-overrides,
> >     source/lintian-overrides, rules.d/debhelper.mk, salsa-ci.yml: drop
> >     unpack-message-for-{orig,source} overrides, fixed in lintian 2.128.=
0.
> >   * debian/control.in/main: drop Rules-Requires-Root: no, this is now t=
he
> >     default.
> >   * debian/libc6.symbols.i386, debian/libc6-i386.symbols.{amd64,x32}: r=
emove
> >     the workaround for GLIBC_ABI_GNU_TLS.  Closes: #1122038.
> >   * debian/control.in/{libc,i386}: ensure that libdpkg-perl is fixed wr=
t
> >     GLIBC_ABI_GNU_TLS.
> >
> >  -- Aurelien Jarno <aurel32@debian.org>  Sun, 04 Jan 2026 10:07:24 +010=
0
> > ...
>
> Hello,
>
> In that case, shouldn't we remove "virtual/crypt-native" from ASSUME_PROV=
IDED?
> https://git.openembedded.org/openembedded-core/tree/meta/conf/bitbake.con=
f#n232
>
> I've tried it but then libxcrypt-native fails to build with:
> | ../sources/libxcrypt-4.4.38/lib/crypt-gost-yescrypt.c: In function =E2=
=80=98_crypt_crypt_gost_yescrypt_rn=E2=80=99:
> | ../sources/libxcrypt-4.4.38/lib/crypt-gost-yescrypt.c:134:16: error: in=
itialization discards =E2=80=98const=E2=80=99 qualifier from pointer target=
 type [-Werror=3Ddiscarded-qualifiers]
> |   134 |   char *hptr =3D strchr ((const char *) intbuf->retval + 3, '$'=
);
> |       |                ^~~~~~
> | cc1: all warnings being treated as errors
>
> It looks like the fixes for that are on master but the patches don't
> apply.
>
> Can you send an update series with those fixes?


Patches for building libxcrypt-native? I still see
virtual/crypt-native in ASSUME_PROVIDED in master, that's why I've
added libcrypt-dev into the ubuntu-26.04 image at least until the same
is resolved in wrynose/master. The same issue is in current master.

