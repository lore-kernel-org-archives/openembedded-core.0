Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E26C0E99065
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 09:40:19 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.152416.1775814012812871494
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Apr 2026 02:40:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=eut4XUxx;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5a3be187ffbso1465865e87.0
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Apr 2026 02:40:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775814011; cv=none;
        d=google.com; s=arc-20240605;
        b=btKJSGXg5AdtHggkE4aP2lUeTkwoH9cA/mlSw12mJjIw2frSzjBAv5SESZ8I2n/bU8
         saXYEhLI9TXnsQjQLnr07dI4aPCKc+QgYMcakt1zVAR1h7JICSNhaDtOgkaKjdEhEkG8
         OsJir0l41Ql2NCW4FLgOvmg7hFYC6RA2hXHSxCbP7JnL0aN7SGuEUKyeFfZgo8v8Nh5r
         32N5M9dgpBjSB3kpkGfGJ35EihdrZmR4EPFFpwr8w1rLxMAiEEdCkJP/cxORJ8tSWfG4
         XFdNNBkbKmaR+IgSgv3GbYinITNHKq2WO9dGfTbnlTMS7tD2fML0L7tSJ8u3htKEUAdu
         lX4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bAnXBneca/AsGxtNvVYLZX0C5rlS49sO2izJ1309Ack=;
        fh=ipws0wG+k0OA3kXqbycnQoCJAD8PbitcTEukBC/jmQo=;
        b=QgBxCSc88aaM4NIusqeOJAL1XsMSz8DP44OCaQL2chGpKICSregPWKhtARKgMIB1SF
         EEBMVOOTRDDidTXytUz5jLYi7soS/2SjFs4n7T9SMIl721Wr/CIBdHblCYtdy47sJ/BG
         Rwndp7adjC80iwJm+S3q1DSejwgyU9YW15IH5JLOq0rM1CoGs2zY0r3i3+Nd7R5Vsl66
         tJycZou3naWH9jP3Qh8IehWYHs8v/r/sfZK3XKY+5mvdvYo+3lK6x6nDCXHv7v+mZuRF
         BfLxc6ITSMqIYofEBmZPDBvIPVLr3+eEDaWHWq2vBOKmMXbRoCi2IXhoTX2UssXc7ORC
         0yVg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775814011; x=1776418811; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bAnXBneca/AsGxtNvVYLZX0C5rlS49sO2izJ1309Ack=;
        b=eut4XUxxBF29WuunZnE/JcZnkRBNe6n1+F8wxBIpHiREpClW3C5qAE97EmkIxXSKJF
         vrzmj1sTGm9oceqB97ke1enQ7BRdnrHXrXBcYskXjFcfFGupYRCm1jt54cyXBMmDKYTC
         /+lzAGFeSwiY5MSXbJ3QF+dvCPRUtUMeJjOQo1sikjHY0vYr25qXYFT0iJmtm98FPIfr
         PiePhtcZUiB5efFeR7ghO6yVwFa5f6rqIkaLuRrsglJpUGh9y6yIhWaUodgX2mhpbH/u
         tIU6NwC/BbNnmuzhOeT2xy+XjU8+nnf+G02rh2ytSeq0DktAEL8Qf88ZDwDkdELLMhk0
         dumQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775814011; x=1776418811;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bAnXBneca/AsGxtNvVYLZX0C5rlS49sO2izJ1309Ack=;
        b=e0vP/Hn+xcrTFxz8VakKpUCenZhc4K+rbx7jkWHLQTl12AAyrSavpf3NxKg3NiFFPJ
         rTe0uCFIRbDoutzpjyPiUSp6i0DxTQP1BEgQ2GWvj99Cf+hWdvFo2so4ZYtYQ9ZU0rrz
         AEDS5DDnjISOZV+aP7L/GH7d8aTKNvSm/86eCtTtS7mxRHuSJgRgrBURg9eThMc9ok9i
         /ehr4Ia1ze2kdSlsfEpXDc/Z/dsBMqhEZlKn6Fptk/DrmnZXwgWG+FlSSVHvSQFtOP7P
         WOSSi8gJqKMkb4qrmFRnhavhYisZAJb4K247j860VcoVWLjiXcmCHcDPvA14cWatRXi4
         lzAg==
X-Gm-Message-State: AOJu0YwwV6WyJIOjXbntiYvBNElDhvXeyMBRhtio7sCWm1PKoLMkf64W
	xd0JddtvIUPr75rzpCqGqMih2wtRmcWc7kjVfqKyQvSJynpI8wm4yJ1+FxRQWgaKvFCBNVvVd/J
	tv4Xxq9YWiBCL7icwMMaZPfKZOI4Iwiw=
X-Gm-Gg: AeBDiev83OoIRzAHgsK+Fn0Y5h+6m+VeNZCt2ZhxPXa3eoOE4ebmYdzpUzEZ1mVJy8z
	djw+Ly2sGY5GZ+/Y5VIHQQqYvWtjn3C65n4Yct7z8SCxu1VUuSOR1MGC+YSpgv9Sjwub3E5zBR8
	XhhCLUBjc9jMym3t7nyn6RZP3jQwYrehyf+/xRXBuQzvCe07lGZk8q0qJamA8p5Uh8K1cqZFmsr
	I7UTWXoIzybn7m64LkuQvPeAEHxYixaBcVYkvTdmtHyaLQNgYNmD+B01Tof4qyDELq68b0jz2mW
	8zeB/HC2m6Klp18JekmNlU0DGksEbd+jiDkpNrJZGFjAigkDBN6EutHD1uBlXLCdJw==
X-Received: by 2002:a05:6512:118d:b0:5a2:b514:4fbb with SMTP id
 2adb3069b0e04-5a3f086e9dcmr816928e87.11.1775814010191; Fri, 10 Apr 2026
 02:40:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260409152839.2894434-1-martin.jansa@gmail.com>
 <DHOV6DD1DEG9.2REH24GS0QYC3@smile.fr> <CA+chaQdA95XBr+n+-Zm2dE9sxFiaAjhthSpGvP-g+N60yj=MJQ@mail.gmail.com>
 <DHPB0K1HXR2T.1N8T3183RMIUJ@smile.fr> <CA+chaQcHomAk3+9-aJ5vKgnNE_q8EtacTMSv8v1Ns8n1gA0xPw@mail.gmail.com>
 <DHPDA3LTW9U8.2AC8TDM9LDC0L@smile.fr>
In-Reply-To: <DHPDA3LTW9U8.2AC8TDM9LDC0L@smile.fr>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 10 Apr 2026 11:39:56 +0200
X-Gm-Features: AQROBzDUp3pBQXVXBN21J3eju-mkteQX5zc1XXuKIsda_9qMRARPg0rvbFabWGE
Message-ID: <CA+chaQfMPZ3266azx2veSiK4nwXDXMQ_i4RoiKQuKicaU-L0Jw@mail.gmail.com>
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
 <openembedded-core@lists.openembedded.org>; Fri, 10 Apr 2026 09:40:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235002

On Fri, Apr 10, 2026 at 11:28=E2=80=AFAM Yoann Congal <yoann.congal@smile.f=
r> wrote:
>
> On Fri Apr 10, 2026 at 11:09 AM CEST, Martin Jansa wrote:
> > On Fri, Apr 10, 2026 at 9:42=E2=80=AFAM Yoann Congal <yoann.congal@smil=
e.fr> wrote:
> >>
> >> On Thu Apr 9, 2026 at 11:29 PM CEST, Martin Jansa wrote:
> >> > On Thu, Apr 9, 2026 at 9:17=E2=80=AFPM Yoann Congal <yoann.congal@sm=
ile.fr> wrote:
> >> >>
> >> >> On Thu Apr 9, 2026 at 5:28 PM CEST, Martin Jansa via lists.openembe=
dded.org wrote:
> >> >> > From: Martin Jansa <martin.jansa@gmail.com>
> >> >> >
> >> >> > glibc-2.43 isn't used in OE builds yet, but this fixes dtc-native=
:
> >> >> > https://errors.yoctoproject.org/Errors/Details/903983/
> >> >> >
> >> >> > ../sources/dtc-1.7.2/libfdt/fdt_overlay.c: In function =E2=80=98o=
verlay_fixup_phandle=E2=80=99:
> >> >> > ../sources/dtc-1.7.2/libfdt/fdt_overlay.c:424:21: error: assignme=
nt discards =E2=80=98const=E2=80=99 qualifier from pointer target type [-We=
rror=3Ddiscarded-qualifiers]
> >> >> >   424 |                 sep =3D memchr(fixup_str, ':', fixup_len)=
;
> >> >> >       |                     ^
> >> >> > ../sources/dtc-1.7.2/libfdt/fdt_overlay.c:434:21: error: assignme=
nt discards =E2=80=98const=E2=80=99 qualifier from pointer target type [-We=
rror=3Ddiscarded-qualifiers]
> >> >> >   434 |                 sep =3D memchr(name, ':', fixup_len);
> >> >> >       |                     ^
> >> >> > cc1: all warnings being treated as errors
> >> >> >
> >> >> > Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> >> >> > Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootl=
in.com>
> >> >> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org=
>
> >> >> > ---
> >> >>
> >> >> Hello,
> >> >>
> >> >> I've started a whinlatter bringup build on the new Ubuntu 26.04 wor=
ker
> >> >> with this series applied:
> >> >> https://autobuilder.yoctoproject.org/valkyrie/#/builders/96/builds/=
23
> >> >>
> >> >> It got 2 errors (Other errors are most likely consequences of these=
 ones):
> >> >>
> >> >> ERROR: shadow-native-4.18.0-r0 do_configure: configure failed:
> >> >> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/96/builds=
/23/steps/12/logs/stdio line 6269:
> >> >> | checking for crypt in -lcrypt... no
> >> >> | configure: error: crypt() not found
> >> >> | NOTE: The following config.log files may provide further informat=
ion.
> >> >> | NOTE: /srv/pokybuild/yocto-worker/bringup/build/build/tmp/work/x8=
6_64-linux/shadow-native/4.18.0/build/config.log
> >> >> | ERROR: configure failed
> >> >> | WARNING: exit code 1 from a shell command.
> >> >> NOTE: recipe shadow-native-4.18.0-r0: task do_configure: Failed
> >> >
> >> > Hello,
> >> >
> >> > for shadow please read
> >> > https://lists.openembedded.org/g/openembedded-core/message/234119 th=
e
> >> > important part:
> >> > "libcrypt-dev is no longer installed as a dependency in my minimal d=
ocker image"
> >> > I guess it's now missing on your ubuntu-26.04 host as well.
> >> > It used to be typically installed by build-essential -> libc6-dev ->
> >> > libcrypt-dev but not anymore since 2.42-7:
> >> >
> >> > 25.10 questing with 2.42-0ubuntu3.1:
> >> > https://packages.ubuntu.com/questing/libc6-dev
> >> > 26.04 resolute with 2.43-2ubuntu1:
> >> > https://packages.ubuntu.com/resolute/libc6-dev
> >> >
> >> > https://changelogs.ubuntu.com/changelogs/pool/main/g/glibc/glibc_2.4=
3-2ubuntu1/changelog:
> >> > ...
> >> > glibc (2.42-7) unstable; urgency=3Dmedium
> >> >
> >> >   [ Aurelien Jarno ]
> >> >   * debian/control.in/libc, debian/rules.d/debhelper.mk: drop libcry=
pt-dev
> >> >     dependency from libc6-dev. Thanks to Helmut Grohne for proposing=
 that,
> >> >     doing an archive rebuild and filling the bug reports.
> >> >   * debian/control.in/main, debian/sysdeps/linux.mk: enable SystemTa=
p static
> >> >     probes.
> >> >   * debian/debhelper.in/libc-dev.NEWS: add a NEWS entry about the re=
moval of
> >> >     the obsolete termio interface.  Closes: #1124068.
> >> >   * debian/rules.d/debhelper.mk: ensure that linker scripts work eve=
n when
> >> >     /usr is unmerged.  Closes: #1120508
> >> >   * debian/debhelper.in/libc-dev{,-alt}.lintian-overrides,
> >> >     source/lintian-overrides, rules.d/debhelper.mk, salsa-ci.yml: dr=
op
> >> >     unpack-message-for-{orig,source} overrides, fixed in lintian 2.1=
28.0.
> >> >   * debian/control.in/main: drop Rules-Requires-Root: no, this is no=
w the
> >> >     default.
> >> >   * debian/libc6.symbols.i386, debian/libc6-i386.symbols.{amd64,x32}=
: remove
> >> >     the workaround for GLIBC_ABI_GNU_TLS.  Closes: #1122038.
> >> >   * debian/control.in/{libc,i386}: ensure that libdpkg-perl is fixed=
 wrt
> >> >     GLIBC_ABI_GNU_TLS.
> >> >
> >> >  -- Aurelien Jarno <aurel32@debian.org>  Sun, 04 Jan 2026 10:07:24 +=
0100
> >> > ...
> >>
> >> Hello,
> >>
> >> In that case, shouldn't we remove "virtual/crypt-native" from ASSUME_P=
ROVIDED?
> >> https://git.openembedded.org/openembedded-core/tree/meta/conf/bitbake.=
conf#n232
> >>
> >> I've tried it but then libxcrypt-native fails to build with:
> >> | ../sources/libxcrypt-4.4.38/lib/crypt-gost-yescrypt.c: In function =
=E2=80=98_crypt_crypt_gost_yescrypt_rn=E2=80=99:
> >> | ../sources/libxcrypt-4.4.38/lib/crypt-gost-yescrypt.c:134:16: error:=
 initialization discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Werror=3Ddiscarded-qualifiers]
> >> |   134 |   char *hptr =3D strchr ((const char *) intbuf->retval + 3, =
'$');
> >> |       |                ^~~~~~
> >> | cc1: all warnings being treated as errors
> >>
> >> It looks like the fixes for that are on master but the patches don't
> >> apply.
> >>
> >> Can you send an update series with those fixes?
> >
> >
> > Patches for building libxcrypt-native? I still see
> > virtual/crypt-native in ASSUME_PROVIDED in master, that's why I've
> > added libcrypt-dev into the ubuntu-26.04 image at least until the same
> > is resolved in wrynose/master. The same issue is in current master.
>
> (Sorry, our mails crossed)
>
> I discussed that with Paul. He suggested to add libcrypt-dev as a host
> dependency instead (ie. what you describe). I agree (sorry about the
> sudden change of heart).
>
> Can you send the yocto-docs patch to do this?

Yes, done:
https://lists.yoctoproject.org/g/docs/message/9213

