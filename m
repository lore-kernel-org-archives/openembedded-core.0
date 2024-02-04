Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2448DC4828D
	for <webhook@archiver.kernel.org>; Sun,  4 Feb 2024 03:40:16 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.web10.32390.1707018009376026948
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Feb 2024 19:40:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RbQK83qs;
 spf=pass (domain: gmail.com, ip: 209.85.160.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-2196dd318feso224393fac.2
        for <openembedded-core@lists.openembedded.org>; Sat, 03 Feb 2024 19:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707018008; x=1707622808; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8QzaEINlwFYDuFg7Lvuy39l6+pkzSiyu+GU2z0SO/PQ=;
        b=RbQK83qsrgvA5x61moXUvlHWEVzNPgFSVtSvoWGC1GQp8DJ82OFgGuyx4SMarluBcq
         7Ql8OTGSbOPBaTfaFBe0BlWg/Fk5lynMXASS12k9EqpITjKZ18tyjO/TEbwsFVmurwSR
         O8t9rwkuUVcQym/X1bjzMZcmB0JIuOu75L9iteotraFJ1pnnetL8R5bB83v2GFBNSNZY
         264voaM+vnpsZwrKwkkayLiddoIhazGRkzHK9FJpHAUUPVJylvhv3k+5op6KmWnahbmM
         SNgk/IKl7DrHxav06PIRSyC387MzDvhn1HpBb/Z2MbK8gE7j1km4lcBCLIhd9eTZlyHp
         fuPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707018008; x=1707622808;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8QzaEINlwFYDuFg7Lvuy39l6+pkzSiyu+GU2z0SO/PQ=;
        b=EEfjz9czCif0VvbEMutiknpSwKUtMEB2DakeyfI5AlOh7bFQcbkT66Li52ZgUTSF6p
         y1Hcfp9zI02HcMvRj3xo95GFPIfUebqGET4AOFGzg0f7pjt5tytZfgvLRU85gZNWUW6E
         bsqtuVs0O11paeOmUG7eWJPyc80nfPXzp4JlXdtipf01KzhZUN3Ay1Yd2woH7msqH+oV
         fBs0q4SrkAH7CHJzk6kJaFk/+FhZmOUdyz1kanci66fwkAIFMNuXQanq44aWetKMhN6O
         5b8+KPbwy18RyZC6Q1NoK+HLO0nM55LIc++E6FhpoF1MnCF7QI+ne6+ViWe9Aiiuk+P6
         WhxQ==
X-Gm-Message-State: AOJu0YxrLT2j036b1PL9MT7rWpI6n0/iMQdhHW4D+SIhfu8ouRo7xNpf
	HKKoUXMPUukuNuG11AevtNOF2LL6+8WETwQZoCvRhi56V9/c7oHleHy1t1i0ZKaYEcHtOb6HEX5
	+pnsn8qtZZRjSVoajyQUUtGcmHiU=
X-Google-Smtp-Source: AGHT+IGxHm1NSGwvHo2dxiHk2tl74iFNltqfz5u+GX0Spg02Llypx+a4vGs4Wq4RTxPLnYy2IFOjqy9HPfjDHX7RapY=
X-Received: by 2002:a05:6871:b06:b0:214:fbb0:8d77 with SMTP id
 fq6-20020a0568710b0600b00214fbb08d77mr4732004oab.4.1707018008523; Sat, 03 Feb
 2024 19:40:08 -0800 (PST)
MIME-Version: 1.0
References: <20240105165554.1401517-1-tim.orling@konsulko.com>
 <2024020223125655b936ef@mail.local> <17B031E2E1DE7669.13964@lists.openembedded.org>
 <CANx9H-A1MwJ1crmJLJ51mrxp0oEazc7QXCqEv1VWUUKwPTuSBg@mail.gmail.com>
In-Reply-To: <CANx9H-A1MwJ1crmJLJ51mrxp0oEazc7QXCqEv1VWUUKwPTuSBg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 3 Feb 2024 19:39:42 -0800
Message-ID: <CAMKF1srNM1GMm2D9dYnozm+59vV9oqBHVC7oFfOZEdwwY-rCzw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] openssh: upgrade 9.5p1 -> 9.6p1
To: Tim Orling <ticotimo@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Tim Orling <tim.orling@konsulko.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Feb 2024 03:40:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194869

On Sat, Feb 3, 2024 at 5:20=E2=80=AFPM Tim Orling <ticotimo@gmail.com> wrot=
e:
>
> The errors on mips32 are internal compiler errors (ICE):
> moduli.c:814:1: internal compiler error: in int_mode_for_mode, at stor-la=
yout.cc:407
> progressmeter.c:238:1: internal compiler error: in int_mode_for_mode, at =
stor-layout.cc:407
> clientloop.c:1699:1: internal compiler error: in int_mode_for_mode, at st=
or-layout.cc:407
>
> (There are also a lot of OpenSSL 3.0 deprecation warnings, but I think th=
e ICE are what is failing the build).
>
> Full log.do_compile attached.
>
> There are a handful of similar bug reports like:
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D104820
>
> Any advice to help report this properly is appreciated. Any ideas to fix =
it are even better.

Looks like gcc issue but try the patch proposed in this bug
https://bugzilla.mindrot.org/show_bug.cgi?id=3D3645

This patch - https://bugzilla.mindrot.org/attachment.cgi?id=3D3776&action=
=3Ddiff

See if it helps.

>
> --Tim
>
> On Fri, Feb 2, 2024 at 4:11=E2=80=AFPM Tim Orling via lists.openembedded.=
org <ticotimo=3Dgmail.com@lists.openembedded.org> wrote:
>>
>>
>>
>> On Fri, Feb 2, 2024 at 3:12=E2=80=AFPM Alexandre Belloni <alexandre.bell=
oni@bootlin.com> wrote:
>>>
>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/102/builds/5751=
/steps/13/logs/stdio
>>
>>
>> Thank you, Alexandre. I=E2=80=99ll try to find a fix for this mips issue=
. If anyone else stumbles on it first, I=E2=80=99m happy to take guidance.
>>>
>>>
>>> On 05/01/2024 08:55:55-0800, Tim Orling wrote:
>>> > * Relocate Upstream-Status in 0001-regress-banner.sh-log-input-and-ou=
tput-files-on-erro.patch
>>> >   so it will not throw an error in AUH
>>> >
>>> > https://www.openssh.com/txt/release-9.6
>>> > https://github.com/openssh/openssh-portable/compare/V_9_5_P1...V_9_6_=
P1
>>> >
>>> > https://nvd.nist.gov/vuln/detail/CVE-2023-48795
>>> > https://nvd.nist.gov/vuln/detail/CVE-2023-51384
>>> > https://nvd.nist.gov/vuln/detail/CVE-2023-51385
>>> >
>>> > CVE: CVE-2023-48795
>>> > CVE: CVE-2023-51384
>>> > CVE: CVE-2023-51385
>>> >
>>> > Signed-off-by: Tim Orling <tim.orling@konsulko.com>
>>> > ---
>>> > All ptests passed on core-image-ptest-openssh on qemux86-64
>>> >
>>> >  ...regress-banner.sh-log-input-and-output-files-on-erro.patch | 4 ++=
--
>>> >  .../openssh/{openssh_9.5p1.bb =3D> openssh_9.6p1.bb}            | 2 =
+-
>>> >  2 files changed, 3 insertions(+), 3 deletions(-)
>>> >  rename meta/recipes-connectivity/openssh/{openssh_9.5p1.bb =3D> open=
ssh_9.6p1.bb} (98%)
>>> >
>>> > diff --git a/meta/recipes-connectivity/openssh/openssh/0001-regress-b=
anner.sh-log-input-and-output-files-on-erro.patch b/meta/recipes-connectivi=
ty/openssh/openssh/0001-regress-banner.sh-log-input-and-output-files-on-err=
o.patch
>>> > index 2c14014fed8..8763f30f4b3 100644
>>> > --- a/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.s=
h-log-input-and-output-files-on-erro.patch
>>> > +++ b/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.s=
h-log-input-and-output-files-on-erro.patch
>>> > @@ -34,13 +34,13 @@ return value: 1
>>> >
>>> >  See: https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15178
>>> >
>>> > +Upstream-Status: Denied [https://github.com/openssh/openssh-portable=
/pull/437]
>>> > +
>>> >  Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
>>> >  ---
>>> >   regress/banner.sh | 4 +++-
>>> >   1 file changed, 3 insertions(+), 1 deletion(-)
>>> >
>>> > -Upstream-Status: Denied [https://github.com/openssh/openssh-portable=
/pull/437]
>>> > -
>>> >  diff --git a/regress/banner.sh b/regress/banner.sh
>>> >  index a84feb5a..de84957a 100644
>>> >  --- a/regress/banner.sh
>>> > diff --git a/meta/recipes-connectivity/openssh/openssh_9.5p1.bb b/met=
a/recipes-connectivity/openssh/openssh_9.6p1.bb
>>> > similarity index 98%
>>> > rename from meta/recipes-connectivity/openssh/openssh_9.5p1.bb
>>> > rename to meta/recipes-connectivity/openssh/openssh_9.6p1.bb
>>> > index bbb8fb091ad..fa44eb0bd4e 100644
>>> > --- a/meta/recipes-connectivity/openssh/openssh_9.5p1.bb
>>> > +++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
>>> > @@ -28,7 +28,7 @@ SRC_URI =3D "http://ftp.openbsd.org/pub/OpenBSD/Ope=
nSSH/portable/openssh-${PV}.tar
>>> >             file://0001-regress-banner.sh-log-input-and-output-files-=
on-erro.patch \
>>> >             file://0001-systemd-Add-optional-support-for-systemd-sd_n=
otify.patch \
>>> >             "
>>> > -SRC_URI[sha256sum] =3D "f026e7b79ba7fb540f75182af96dc8a8f1db395f922b=
bc9f6ca603672686086b"
>>> > +SRC_URI[sha256sum] =3D "910211c07255a8c5ad654391b40ee59800710dd8119d=
d5362de09385aa7a777c"
>>> >
>>> >  CVE_STATUS[CVE-2007-2768] =3D "not-applicable-config: This CVE is sp=
ecific to OpenSSH with the pam opie which we don't build/use here."
>>> >
>>> > --
>>> > 2.34.1
>>> >
>>>
>>> >
>>> >
>>> >
>>>
>>>
>>> --
>>> Alexandre Belloni, co-owner and COO, Bootlin
>>> Embedded Linux and Kernel engineering
>>> https://bootlin.com
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#194821): https://lists.openembedded.org/g/openembedd=
ed-core/message/194821
>> Mute This Topic: https://lists.openembedded.org/mt/103546397/924729
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [t=
icotimo@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

