Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D7D6E99076
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 10:10:21 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.153145.1775815807992803795
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Apr 2026 03:10:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=XsX6QEXm;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-59e4989dacdso2851642e87.1
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Apr 2026 03:10:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775815806; cv=none;
        d=google.com; s=arc-20240605;
        b=d9eiBeC8wSgOJJz5mRcXw76ENjLEjy7R5cSFet/HRx8LiwjW7e+dfosA+IaJI0t/I0
         +EDhRZkD9PLcoriLI+VWC8sPMq1Ne7QNXb07fU31WpLkgPMe2ywAICZr95o/UpjcF+A8
         9yUeYGkpq79cjRZniIbuP4uGsB23FVWQV7/f/3LpmhZDtehwMZ1TMsIbGKpUyP0MHHIr
         j9gOceJjmtax9VBVIwPFh1TpBX3PwwIba5fk5q6pBCczJJwgunKxrzXQySblpDqTQ/2W
         ZMjKnPS/R4WU2fmkX5+zaylJnxeu+E9g2oqrK1B+uowJ+1ECGmuOsNlvrY8UqeHrOljn
         DyTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1Y3Puss2grT3NRIchlS3VUvBlHEUIKaERiiDoL5lRx8=;
        fh=ipws0wG+k0OA3kXqbycnQoCJAD8PbitcTEukBC/jmQo=;
        b=dVMAZKV9MQ4HEjzoAv+eW2aUqQfwaJquBnKDdX9C6mHhllCl1MBU9TUJ+m/U9E7JXX
         vKg7sq1kPT0evc6PIysbnMbF5VkLij4BPeXATANp0uOOahkb/A4EP93Lv2tLDXN75dsG
         8J9cUAROVh3zKz4gq5lIsK3lII206zX3r35i6f5JnKQgxqPba07p8Wqds+mhKEBKDV4f
         nZBUhfdfk16Bd0fASBHgV/I0NsSfTbY3B1PLH98lbHQ3t4bEF09NpHetjdT0wiV+qRcy
         YEXCsrVRZD/iwChuE0fvvYirbppxVhRKtklPoRFSqy1GpqR7hdsW7WmLjsY0vBakYMet
         rB6A==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775815806; x=1776420606; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Y3Puss2grT3NRIchlS3VUvBlHEUIKaERiiDoL5lRx8=;
        b=XsX6QEXmX4tWntGnzm9zoSISibfhLia/+cs7VYYJ09JgI832eGrut75XBtD2p+zmhG
         7y0PLUr1hP7djgcFVXNs/8u92J8arn104EgHTZcfISG0xGZXI2CyiX1j610ScVBuwgQy
         KrvCRuOXtHg0++FhO9uOXHgW/AqTPCEqd7ogZcbBzwJbNbjVQg6UdUAAlUVt1M/QUUoH
         ec1lQBSFZdIlFrnzzVe1rcHQ80iy6Vitqpz9oLaQyV/MtW/bHf+EDdJAquAiut1IvXOC
         uXkQrWwJqAGYCvMuRd9IHtkVtPIxfMs0o3nf+/gy8XGgtJgj6ag5nAZxMTyWoRhiHbMT
         fr1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775815806; x=1776420606;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1Y3Puss2grT3NRIchlS3VUvBlHEUIKaERiiDoL5lRx8=;
        b=ez/Pw0UtIKczS73oh3/TNjKikzHn/ijnPpGsUWPbV+DqZ5xVTzOlJlyryrHHQKQwkM
         cuHp2vrDkXIc0Lls2G6AJbN5BCXc7R58CFeEkga6b6ghN78UJUDZm01DkPN6AOOYWIBl
         /rbLki9Y1l1Dm4OL+/7zdgyMfXNOfp8wyPiRu2uuvZ0a+wfNTiCSaMr5F7bUocicUL+W
         FcJj5ATc3P7xL/ZE4oMFg1YuzKVMR7qgLhd7YpkctIzssLgLIoBrICPRXzRxw/Bqlqlt
         4+LfkdHp5WKnHxkabrwGjNtsnnHCARtlsar6MsZdgdbsEgLzZbzFzCEhPyHS0kYB0VZL
         CZfA==
X-Gm-Message-State: AOJu0YxODb+DUhYXn65RxnPsqtrKYZVKDVquH44v9q1WSUOfbaKsHe2q
	Ts5nDvzyrn7E+T4+Hg6V92bSpVGo8M0auSCRu8eYaPc1px2nQCusQVDum7WTxxxbtqLurA+26Nu
	FNQ+d5UC1fboQa7bWpjNkx/AaFwTW6F4=
X-Gm-Gg: AeBDietuZjtoMm2c8nGq1pOeNJWsgOPirdQI04VQKC6s9rekeBDf5gzREGPp+KqU+7p
	8H7ktpSi2xBLnuBX81xhn1cBrge4iea4UvYMP19ydA+bqTtXQ/3G+lIKygqKSNuL/uRYraszxUr
	sFB7b9WM5CiqsBp7JKQSGElRSptIkr41TWi47lZhKfL4QI0ii4BibLrRyoT+0ns3Y3sadGUMvXs
	2iurZy5hHUqdyiSwMmr4u8PPd4zrcJzQianZlpWKWtCXLY5y1MN6Bdws89YKIvQ3xlXbxqp3YZt
	ahtEVAyg+wpeOV/ByVX6JRCPizz3pMwNOxfCT/WVMflbwwZSGq0arFxb8bEvlscOQQ==
X-Received: by 2002:a05:6512:3c82:b0:5a2:bef4:5dfe with SMTP id
 2adb3069b0e04-5a3efb2c6a0mr970804e87.9.1775815805713; Fri, 10 Apr 2026
 03:10:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260409152839.2894434-1-martin.jansa@gmail.com>
 <DHOV6DD1DEG9.2REH24GS0QYC3@smile.fr> <CA+chaQdA95XBr+n+-Zm2dE9sxFiaAjhthSpGvP-g+N60yj=MJQ@mail.gmail.com>
 <DHPB0K1HXR2T.1N8T3183RMIUJ@smile.fr> <CA+chaQcHomAk3+9-aJ5vKgnNE_q8EtacTMSv8v1Ns8n1gA0xPw@mail.gmail.com>
 <DHPDA3LTW9U8.2AC8TDM9LDC0L@smile.fr> <CA+chaQfMPZ3266azx2veSiK4nwXDXMQ_i4RoiKQuKicaU-L0Jw@mail.gmail.com>
 <DHPDMAYQ3JM8.3MDZOUUD9PA02@smile.fr>
In-Reply-To: <DHPDMAYQ3JM8.3MDZOUUD9PA02@smile.fr>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 10 Apr 2026 12:09:51 +0200
X-Gm-Features: AQROBzD9ElL0U_sAz_SSOVnqCmVpkyP0TMH1D9W4Tkw74gVwepD0Isr1LYaSFxI
Message-ID: <CA+chaQebi5i=CQX+p=xXWCDEKfwOt-=ZO+rr4YRcBVXaj5ZX-w@mail.gmail.com>
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
 <openembedded-core@lists.openembedded.org>; Fri, 10 Apr 2026 10:10:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235011

On Fri, Apr 10, 2026 at 11:44=E2=80=AFAM Yoann Congal <yoann.congal@smile.f=
r> wrote:
>
> On Fri Apr 10, 2026 at 11:39 AM CEST, Martin Jansa wrote:
> > On Fri, Apr 10, 2026 at 11:28=E2=80=AFAM Yoann Congal <yoann.congal@smi=
le.fr> wrote:
> >>
> >> On Fri Apr 10, 2026 at 11:09 AM CEST, Martin Jansa wrote:
> >> > On Fri, Apr 10, 2026 at 9:42=E2=80=AFAM Yoann Congal <yoann.congal@s=
mile.fr> wrote:
> >> >>
> >> >> On Thu Apr 9, 2026 at 11:29 PM CEST, Martin Jansa wrote:
> >> >> > On Thu, Apr 9, 2026 at 9:17=E2=80=AFPM Yoann Congal <yoann.congal=
@smile.fr> wrote:
> >> >> >>
> >> >> >> On Thu Apr 9, 2026 at 5:28 PM CEST, Martin Jansa via lists.opene=
mbedded.org wrote:
> >> >> >> > From: Martin Jansa <martin.jansa@gmail.com>
> >> >> >> >
> >> >> >> > glibc-2.43 isn't used in OE builds yet, but this fixes dtc-nat=
ive:
> >> >> >> > https://errors.yoctoproject.org/Errors/Details/903983/
> >> >> >> >
> >> >> >> > ../sources/dtc-1.7.2/libfdt/fdt_overlay.c: In function =E2=80=
=98overlay_fixup_phandle=E2=80=99:
> >> >> >> > ../sources/dtc-1.7.2/libfdt/fdt_overlay.c:424:21: error: assig=
nment discards =E2=80=98const=E2=80=99 qualifier from pointer target type [=
-Werror=3Ddiscarded-qualifiers]
> >> >> >> >   424 |                 sep =3D memchr(fixup_str, ':', fixup_l=
en);
> >> >> >> >       |                     ^
> >> >> >> > ../sources/dtc-1.7.2/libfdt/fdt_overlay.c:434:21: error: assig=
nment discards =E2=80=98const=E2=80=99 qualifier from pointer target type [=
-Werror=3Ddiscarded-qualifiers]
> >> >> >> >   434 |                 sep =3D memchr(name, ':', fixup_len);
> >> >> >> >       |                     ^
> >> >> >> > cc1: all warnings being treated as errors
> >> >> >> >
> >> >> >> > Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> >> >> >> > Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bo=
otlin.com>
> >> >> >> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.=
org>
> >> >> >> > ---
> >> >> >>
> >> >> >> Hello,
> >> >> >>
> >> >> >> I've started a whinlatter bringup build on the new Ubuntu 26.04 =
worker
> >> >> >> with this series applied:
> >> >> >> https://autobuilder.yoctoproject.org/valkyrie/#/builders/96/buil=
ds/23
> >> >> >>
> >> >> >> It got 2 errors (Other errors are most likely consequences of th=
ese ones):
> >> >> >>
> >> >> >> ERROR: shadow-native-4.18.0-r0 do_configure: configure failed:
> >> >> >> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/96/bui=
lds/23/steps/12/logs/stdio line 6269:
> >> >> >> | checking for crypt in -lcrypt... no
> >> >> >> | configure: error: crypt() not found
> >> >> >> | NOTE: The following config.log files may provide further infor=
mation.
> >> >> >> | NOTE: /srv/pokybuild/yocto-worker/bringup/build/build/tmp/work=
/x86_64-linux/shadow-native/4.18.0/build/config.log
> >> >> >> | ERROR: configure failed
> >> >> >> | WARNING: exit code 1 from a shell command.
> >> >> >> NOTE: recipe shadow-native-4.18.0-r0: task do_configure: Failed
> >> >> >
> >> >> > Hello,
> >> >> >
> >> >> > for shadow please read
> >> >> > https://lists.openembedded.org/g/openembedded-core/message/234119=
 the
> >> >> > important part:
> >> >> > "libcrypt-dev is no longer installed as a dependency in my minima=
l docker image"
> >> >> > I guess it's now missing on your ubuntu-26.04 host as well.
> >> >> > It used to be typically installed by build-essential -> libc6-dev=
 ->
> >> >> > libcrypt-dev but not anymore since 2.42-7:
> >> >> >
> >> >> > 25.10 questing with 2.42-0ubuntu3.1:
> >> >> > https://packages.ubuntu.com/questing/libc6-dev
> >> >> > 26.04 resolute with 2.43-2ubuntu1:
> >> >> > https://packages.ubuntu.com/resolute/libc6-dev
> >> >> >
> >> >> > https://changelogs.ubuntu.com/changelogs/pool/main/g/glibc/glibc_=
2.43-2ubuntu1/changelog:
> >> >> > ...
> >> >> > glibc (2.42-7) unstable; urgency=3Dmedium
> >> >> >
> >> >> >   [ Aurelien Jarno ]
> >> >> >   * debian/control.in/libc, debian/rules.d/debhelper.mk: drop lib=
crypt-dev
> >> >> >     dependency from libc6-dev. Thanks to Helmut Grohne for propos=
ing that,
> >> >> >     doing an archive rebuild and filling the bug reports.
> >> >> >   * debian/control.in/main, debian/sysdeps/linux.mk: enable Syste=
mTap static
> >> >> >     probes.
> >> >> >   * debian/debhelper.in/libc-dev.NEWS: add a NEWS entry about the=
 removal of
> >> >> >     the obsolete termio interface.  Closes: #1124068.
> >> >> >   * debian/rules.d/debhelper.mk: ensure that linker scripts work =
even when
> >> >> >     /usr is unmerged.  Closes: #1120508
> >> >> >   * debian/debhelper.in/libc-dev{,-alt}.lintian-overrides,
> >> >> >     source/lintian-overrides, rules.d/debhelper.mk, salsa-ci.yml:=
 drop
> >> >> >     unpack-message-for-{orig,source} overrides, fixed in lintian =
2.128.0.
> >> >> >   * debian/control.in/main: drop Rules-Requires-Root: no, this is=
 now the
> >> >> >     default.
> >> >> >   * debian/libc6.symbols.i386, debian/libc6-i386.symbols.{amd64,x=
32}: remove
> >> >> >     the workaround for GLIBC_ABI_GNU_TLS.  Closes: #1122038.
> >> >> >   * debian/control.in/{libc,i386}: ensure that libdpkg-perl is fi=
xed wrt
> >> >> >     GLIBC_ABI_GNU_TLS.
> >> >> >
> >> >> >  -- Aurelien Jarno <aurel32@debian.org>  Sun, 04 Jan 2026 10:07:2=
4 +0100
> >> >> > ...
> >> >>
> >> >> Hello,
> >> >>
> >> >> In that case, shouldn't we remove "virtual/crypt-native" from ASSUM=
E_PROVIDED?
> >> >> https://git.openembedded.org/openembedded-core/tree/meta/conf/bitba=
ke.conf#n232
> >> >>
> >> >> I've tried it but then libxcrypt-native fails to build with:
> >> >> | ../sources/libxcrypt-4.4.38/lib/crypt-gost-yescrypt.c: In functio=
n =E2=80=98_crypt_crypt_gost_yescrypt_rn=E2=80=99:
> >> >> | ../sources/libxcrypt-4.4.38/lib/crypt-gost-yescrypt.c:134:16: err=
or: initialization discards =E2=80=98const=E2=80=99 qualifier from pointer =
target type [-Werror=3Ddiscarded-qualifiers]
> >> >> |   134 |   char *hptr =3D strchr ((const char *) intbuf->retval + =
3, '$');
> >> >> |       |                ^~~~~~
> >> >> | cc1: all warnings being treated as errors
> >> >>
> >> >> It looks like the fixes for that are on master but the patches don'=
t
> >> >> apply.
> >> >>
> >> >> Can you send an update series with those fixes?
> >> >
> >> >
> >> > Patches for building libxcrypt-native? I still see
> >> > virtual/crypt-native in ASSUME_PROVIDED in master, that's why I've
> >> > added libcrypt-dev into the ubuntu-26.04 image at least until the sa=
me
> >> > is resolved in wrynose/master. The same issue is in current master.
> >>
> >> (Sorry, our mails crossed)
> >>
> >> I discussed that with Paul. He suggested to add libcrypt-dev as a host
> >> dependency instead (ie. what you describe). I agree (sorry about the
> >> sudden change of heart).
> >>
> >> Can you send the yocto-docs patch to do this?
> >
> > Yes, done:
> > https://lists.yoctoproject.org/g/docs/message/9213
>
> Awesome, thanks!
> Next, I will ask helpdesk to install libcrypt-dev on the ubuntu 26.04
> worker and start the build with the added patch
> "virglrenderer: Fix build with glibc 2.43+"

Sounds good, thanks.

I've also sent the libxcrypt-native fixes for whinlatter and scarthgap
(slightly modified cherry-picks from master). It's not needed to build
any of my images, but as you already noticed them failing on 26.04
someone else might need them.

Cheers,

