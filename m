Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32BC3C48286
	for <webhook@archiver.kernel.org>; Sun,  4 Feb 2024 17:59:30 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
 by mx.groups.io with SMTP id smtpd.web10.43849.1707069560636768946
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Feb 2024 09:59:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fjF/UFj9;
 spf=pass (domain: gmail.com, ip: 209.85.160.51, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-20503dc09adso2566502fac.2
        for <openembedded-core@lists.openembedded.org>; Sun, 04 Feb 2024 09:59:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707069560; x=1707674360; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/fn5NWP7SeU5tt+cuUvvLBDN6W4Gi03N9iVOxbH58ts=;
        b=fjF/UFj9png2GmB8oVRthk+8P9elEwh/QjJqHZ5kbyMK+grRoAWlWj10ONlBR/mays
         WrGrsPZpL6QgIFD/l36jfcx50Jl5hYSuBjPKAvsY6o9Mgt8xr/glDbYPqeKMGWzPekHn
         TUYdojf1ykgRxyXUf+mRaaBvRtCgUeuoFtsvmalcLkNldE0S75QYXL5UzlPHkJ6pSxl9
         +jzlKjq59A4bOiyrhmSBzaQ+finWHp7sAUA24SocWHhOo52Ql2WWr07mIMxXJvbN6W8p
         OEVApu264EgKvkszgrqUkZK7HNzsIDKKW+OyFZFdJ0tepsHR5FGdcx1ZDSxnqpp2kQZP
         RyLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707069560; x=1707674360;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/fn5NWP7SeU5tt+cuUvvLBDN6W4Gi03N9iVOxbH58ts=;
        b=wfCBL2hF8jxtWXVS+rnQZwlzLAl+wgT308xEdPcoOJyg0aBEbHo7u6nvFYtI05qGy1
         mjGuGpvGHE3rtULOyOevw4X6YMX+FhSot/WojwsKBnKFbrOF1IgYAqlohx0mWIYMuD3L
         eYP1ldQMDVGtBt60bIqjLwiofnNtMETKEJ5GWz4VyptCZZmdXyKnebMYDgxZoh5Qv7cT
         iHvKtRgJbcFrTDZ4hzXEoh6VOG6XlR0FFbB2zVZtn+3OzqXG+ndCATjKcyOHDUmMjxZG
         WSlULfqh+t7N4hpqGHSJGFXRow/c7GCFg0/taX3sUV5bfqY0pmMR1Jma6Fk2j0h9ZfNJ
         Duaw==
X-Gm-Message-State: AOJu0Yy0NEnCnkFmVYWSCic5SDgoV68m5UQmEZQpfuXGJSAvpt6v504S
	0HYeC+i8d4zch3j3pCewHGeZFrPXwPF7mjf0IlaZdDPaxonQFRPcgexbD1KE/UdHKWk3CKcYVch
	NrVcyPFJHckAht4pZBXOE6HTwPqk=
X-Google-Smtp-Source: AGHT+IGvsRxwBohjxPikbZ8ja/kp77M2RJkN/gx6SO0uxtgUQvoTMLLuixhnCPXArAuuEPgT5oiHo87LW5ff+fIaoQo=
X-Received: by 2002:a05:6870:c081:b0:218:d8e4:cc26 with SMTP id
 c1-20020a056870c08100b00218d8e4cc26mr6426437oad.4.1707069559735; Sun, 04 Feb
 2024 09:59:19 -0800 (PST)
MIME-Version: 1.0
References: <20240105165554.1401517-1-tim.orling@konsulko.com>
 <2024020223125655b936ef@mail.local> <17B031E2E1DE7669.13964@lists.openembedded.org>
 <CANx9H-A1MwJ1crmJLJ51mrxp0oEazc7QXCqEv1VWUUKwPTuSBg@mail.gmail.com>
 <CAMKF1srNM1GMm2D9dYnozm+59vV9oqBHVC7oFfOZEdwwY-rCzw@mail.gmail.com>
 <CAMKF1spLPKYEeHR36oEMCKZA_ZFGKTR9qskm-na-Pe8saS=6nQ@mail.gmail.com>
 <17B0B053E6A96F05.13964@lists.openembedded.org> <CANx9H-B88u0bhpsFUFizxt5TuHywi-_RsK9RhqxxRSSX4ZfRRg@mail.gmail.com>
In-Reply-To: <CANx9H-B88u0bhpsFUFizxt5TuHywi-_RsK9RhqxxRSSX4ZfRRg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 4 Feb 2024 09:58:53 -0800
Message-ID: <CAMKF1sp1259T8sMobhNFi5m8XgHb7ze=4aswTCnUTvc_isCOKg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] openssh: upgrade 9.5p1 -> 9.6p1
To: Tim Orling <ticotimo@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Tim Orling <tim.orling@konsulko.com>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Feb 2024 17:59:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194903

On Sun, Feb 4, 2024 at 8:32=E2=80=AFAM Tim Orling <ticotimo@gmail.com> wrot=
e:
>
>
>
> On Sun, Feb 4, 2024 at 6:48=E2=80=AFAM Tim Orling via lists.openembedded.=
org <ticotimo=3Dgmail.com@lists.openembedded.org> wrote:
>>
>>
>>
>> On Sun, Feb 4, 2024 at 12:14=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wr=
ote:
>>>
>>> On Sat, Feb 3, 2024 at 7:39=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wr=
ote:
>>> >
>>> > On Sat, Feb 3, 2024 at 5:20=E2=80=AFPM Tim Orling <ticotimo@gmail.com=
> wrote:
>>> > >
>>> > > The errors on mips32 are internal compiler errors (ICE):
>>> > > moduli.c:814:1: internal compiler error: in int_mode_for_mode, at s=
tor-layout.cc:407
>>> > > progressmeter.c:238:1: internal compiler error: in int_mode_for_mod=
e, at stor-layout.cc:407
>>> > > clientloop.c:1699:1: internal compiler error: in int_mode_for_mode,=
 at stor-layout.cc:407
>>> > >
>>> > > (There are also a lot of OpenSSL 3.0 deprecation warnings, but I th=
ink the ICE are what is failing the build).
>>> > >
>>> > > Full log.do_compile attached.
>>> > >
>>> > > There are a handful of similar bug reports like:
>>> > > https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D104820
>>> > >
>>> > > Any advice to help report this properly is appreciated. Any ideas t=
o fix it are even better.
>>> >
>>> > Looks like gcc issue but try the patch proposed in this bug
>>> > https://bugzilla.mindrot.org/show_bug.cgi?id=3D3645
>>> >
>>> > This patch - https://bugzilla.mindrot.org/attachment.cgi?id=3D3776&ac=
tion=3Ddiff
>>> >
>>> > See if it helps.
>>>
>>> Its also applied upstream see
>>> https://github.com/openssh/openssh-portable/commit/1036d77b34a5fa15e56f=
516b81b9928006848cbd
>>
>>
>> And that was merged after 9.6p1
>> https://github.com/openssh/openssh-portable/compare/V_9_6_P1...master
>>
> That didn't change the ICE behavior, but for some mysterious reason (adde=
d just per instructions to file a bug with gcc):
> CFLAGS:append:mips =3D " -freport-bug --save-temps"
> made the build successful?

Can you compare the configure logs before and after adding this option ?
its likely that some config option changed

> https://git.yoctoproject.org/poky-contrib/log/?h=3Dtimo/openssh-9.6p1-mip=
s
> (I also tried without the patch above to prove it is the CFLAGS that made=
 it compilable).
> Voodoo.
>
>>>
>>>
>>>
>>> >
>>> > >
>>> > > --Tim
>>> > >
>>> > > On Fri, Feb 2, 2024 at 4:11=E2=80=AFPM Tim Orling via lists.openemb=
edded.org <ticotimo=3Dgmail.com@lists.openembedded.org> wrote:
>>> > >>
>>> > >>
>>> > >>
>>> > >> On Fri, Feb 2, 2024 at 3:12=E2=80=AFPM Alexandre Belloni <alexandr=
e.belloni@bootlin.com> wrote:
>>> > >>>
>>> > >>> https://autobuilder.yoctoproject.org/typhoon/#/builders/102/build=
s/5751/steps/13/logs/stdio
>>> > >>
>>> > >>
>>> > >> Thank you, Alexandre. I=E2=80=99ll try to find a fix for this mips=
 issue. If anyone else stumbles on it first, I=E2=80=99m happy to take guid=
ance.
>>> > >>>
>>> > >>>
>>> > >>> On 05/01/2024 08:55:55-0800, Tim Orling wrote:
>>> > >>> > * Relocate Upstream-Status in 0001-regress-banner.sh-log-input-=
and-output-files-on-erro.patch
>>> > >>> >   so it will not throw an error in AUH
>>> > >>> >
>>> > >>> > https://www.openssh.com/txt/release-9.6
>>> > >>> > https://github.com/openssh/openssh-portable/compare/V_9_5_P1...=
V_9_6_P1
>>> > >>> >
>>> > >>> > https://nvd.nist.gov/vuln/detail/CVE-2023-48795
>>> > >>> > https://nvd.nist.gov/vuln/detail/CVE-2023-51384
>>> > >>> > https://nvd.nist.gov/vuln/detail/CVE-2023-51385
>>> > >>> >
>>> > >>> > CVE: CVE-2023-48795
>>> > >>> > CVE: CVE-2023-51384
>>> > >>> > CVE: CVE-2023-51385
>>> > >>> >
>>> > >>> > Signed-off-by: Tim Orling <tim.orling@konsulko.com>
>>> > >>> > ---
>>> > >>> > All ptests passed on core-image-ptest-openssh on qemux86-64
>>> > >>> >
>>> > >>> >  ...regress-banner.sh-log-input-and-output-files-on-erro.patch =
| 4 ++--
>>> > >>> >  .../openssh/{openssh_9.5p1.bb =3D> openssh_9.6p1.bb}          =
  | 2 +-
>>> > >>> >  2 files changed, 3 insertions(+), 3 deletions(-)
>>> > >>> >  rename meta/recipes-connectivity/openssh/{openssh_9.5p1.bb =3D=
> openssh_9.6p1.bb} (98%)
>>> > >>> >
>>> > >>> > diff --git a/meta/recipes-connectivity/openssh/openssh/0001-reg=
ress-banner.sh-log-input-and-output-files-on-erro.patch b/meta/recipes-conn=
ectivity/openssh/openssh/0001-regress-banner.sh-log-input-and-output-files-=
on-erro.patch
>>> > >>> > index 2c14014fed8..8763f30f4b3 100644
>>> > >>> > --- a/meta/recipes-connectivity/openssh/openssh/0001-regress-ba=
nner.sh-log-input-and-output-files-on-erro.patch
>>> > >>> > +++ b/meta/recipes-connectivity/openssh/openssh/0001-regress-ba=
nner.sh-log-input-and-output-files-on-erro.patch
>>> > >>> > @@ -34,13 +34,13 @@ return value: 1
>>> > >>> >
>>> > >>> >  See: https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15178
>>> > >>> >
>>> > >>> > +Upstream-Status: Denied [https://github.com/openssh/openssh-po=
rtable/pull/437]
>>> > >>> > +
>>> > >>> >  Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
>>> > >>> >  ---
>>> > >>> >   regress/banner.sh | 4 +++-
>>> > >>> >   1 file changed, 3 insertions(+), 1 deletion(-)
>>> > >>> >
>>> > >>> > -Upstream-Status: Denied [https://github.com/openssh/openssh-po=
rtable/pull/437]
>>> > >>> > -
>>> > >>> >  diff --git a/regress/banner.sh b/regress/banner.sh
>>> > >>> >  index a84feb5a..de84957a 100644
>>> > >>> >  --- a/regress/banner.sh
>>> > >>> > diff --git a/meta/recipes-connectivity/openssh/openssh_9.5p1.bb=
 b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
>>> > >>> > similarity index 98%
>>> > >>> > rename from meta/recipes-connectivity/openssh/openssh_9.5p1.bb
>>> > >>> > rename to meta/recipes-connectivity/openssh/openssh_9.6p1.bb
>>> > >>> > index bbb8fb091ad..fa44eb0bd4e 100644
>>> > >>> > --- a/meta/recipes-connectivity/openssh/openssh_9.5p1.bb
>>> > >>> > +++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
>>> > >>> > @@ -28,7 +28,7 @@ SRC_URI =3D "http://ftp.openbsd.org/pub/OpenB=
SD/OpenSSH/portable/openssh-${PV}.tar
>>> > >>> >             file://0001-regress-banner.sh-log-input-and-output-=
files-on-erro.patch \
>>> > >>> >             file://0001-systemd-Add-optional-support-for-system=
d-sd_notify.patch \
>>> > >>> >             "
>>> > >>> > -SRC_URI[sha256sum] =3D "f026e7b79ba7fb540f75182af96dc8a8f1db39=
5f922bbc9f6ca603672686086b"
>>> > >>> > +SRC_URI[sha256sum] =3D "910211c07255a8c5ad654391b40ee59800710d=
d8119dd5362de09385aa7a777c"
>>> > >>> >
>>> > >>> >  CVE_STATUS[CVE-2007-2768] =3D "not-applicable-config: This CVE=
 is specific to OpenSSH with the pam opie which we don't build/use here."
>>> > >>> >
>>> > >>> > --
>>> > >>> > 2.34.1
>>> > >>> >
>>> > >>>
>>> > >>> >
>>> > >>> >
>>> > >>> >
>>> > >>>
>>> > >>>
>>> > >>> --
>>> > >>> Alexandre Belloni, co-owner and COO, Bootlin
>>> > >>> Embedded Linux and Kernel engineering
>>> > >>> https://bootlin.com
>>> > >>
>>> > >>
>>> > >>
>>> > >>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#194892): https://lists.openembedded.org/g/openembedd=
ed-core/message/194892
>> Mute This Topic: https://lists.openembedded.org/mt/103546397/924729
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [t=
icotimo@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

