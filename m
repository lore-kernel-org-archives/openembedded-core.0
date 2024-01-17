Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0231C47422
	for <webhook@archiver.kernel.org>; Wed, 17 Jan 2024 03:47:47 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web11.1378.1705463264967757633
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jan 2024 19:47:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=j6BkBHQN;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-2107b078e3dso576240fac.1
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 19:47:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705463264; x=1706068064; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N02GRChogn0VZpSO+Jd5YcSIEsA5iy8yRz/f97ESJLM=;
        b=j6BkBHQNMAOZuK8oi7P63cQR/1s9bHd+uvUk7P2V0iytIs9ifiL81DSFUzxv1P0fmW
         13FQqvjPFaoCtOYwJhQVqxSxSOQgagOF+dkPPckIaytwcriD2+g98d7H6kSBBWKQ90t8
         iWB0ivvmxrQdXUyfO9d+zZJtov3XSNL8X0m1jO/uWDiyGwiG33YUeC8Bt+tffVzPguv6
         wGPZ5RBIjcharDhVHlhaBvjf87lesNJJkREAYeZs57V98rB6zg/ChYYsaipLVz8T0Ayf
         6B4dEzAjmGJ6QDf0x59ts5eLqcyGwb2U2hiUB8G5/nHHpcnnZFDZE7GRvr89Neb7ExPl
         hmUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705463264; x=1706068064;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N02GRChogn0VZpSO+Jd5YcSIEsA5iy8yRz/f97ESJLM=;
        b=mf0+peh8D1bToTHUwcG5Bi7alxQ1z3UkRxrRIOOWiqg3g7hCq4LJUmZQkhSJBQy1P2
         rnn8hmzjOxifj4NSutgAfZZ1PB+d3oM0fbEgj2FHjh1PW7vlO2wJ4/8O4wOvD5xRO6nq
         HBMKJSXA868bQ39rOZUeBQP5MJ8TkNYHnnFTZp0GUBTmKXHaa+KijJoL8pPpL2BJiWHe
         gwKUEI9+J8L1yJl/t3hs+CFiwEmaAJWcUPN62nb2PsrQX3iZkIj8W2S9gN1ceZFzN1EH
         isR6Qo/bDZxo8cfxOTg7Ris7bqM1zfB0bsUdes6szvaBGQDXWN2OFVmb3yMvAUE4EC2/
         oyLA==
X-Gm-Message-State: AOJu0Yz4bRbj+dqWNSaD/RqQy/v+IE10/WV8I7w502W7XNcQkR2IiRAK
	JhYRpRv48MUHVaWDjAknFdtu1Ou+yNWxJE/bKY4=
X-Google-Smtp-Source: AGHT+IGpun25KGwjrEzIG/Q2T3tTz/tYrfwnauoR3vvWYc/wtHwDTlGAnRN9fkdXpP6+YXqX0Pih30NiS4fvEIIC02s=
X-Received: by 2002:a05:6871:b0b:b0:206:d211:c890 with SMTP id
 fq11-20020a0568710b0b00b00206d211c890mr6793811oab.75.1705463263989; Tue, 16
 Jan 2024 19:47:43 -0800 (PST)
MIME-Version: 1.0
References: <20240116204558.7726-1-simone.p.weiss@posteo.com> <CANNYZj8SgneHR-6yT4XG5=_W4sY5V_jjsTEO8eN8SMNiAS6+TA@mail.gmail.com>
In-Reply-To: <CANNYZj8SgneHR-6yT4XG5=_W4sY5V_jjsTEO8eN8SMNiAS6+TA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 16 Jan 2024 19:47:17 -0800
Message-ID: <CAMKF1sqW7LsJZ2HGrX3N9TAEZ9WqX72RNBkmeSztByF3jUNeDg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] tune-core2: Update qemu cpu to supported model
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: =?UTF-8?B?U2ltb25lIFdlacOf?= <simone.p.weiss@posteo.com>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 03:47:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193887

On Tue, Jan 16, 2024 at 7:37=E2=80=AFPM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Please provide a link to the documentation in the commit message, and not=
 just the claim.
>

Perhaps add this link to commit msg
https://qemu-project.gitlab.io/qemu/system/qemu-cpu-models.html#other-non-r=
ecommended-x86-cpus

> Alex
>
> On Tue 16. Jan 2024 at 21.46, Simone Wei=C3=9F <simone.p.weiss@posteo.com=
> wrote:
>>
>> From: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
>>
>> Fixes [YOCTO #12388]
>>
>> QEMUs documentation does recommend to not use n270 and core2duo as
>> an argument to -cpu anymore. Update therefore the QEMU cpu option for
>> the core2duo tune to Nehalam. Tested it locally with QEMU and KVM.
>>
>> Signed-off-by: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
>> ---
>>  meta/conf/machine/include/x86/tune-core2.inc | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/conf/machine/include/x86/tune-core2.inc b/meta/conf/ma=
chine/include/x86/tune-core2.inc
>> index 97b7c1b188..082fd4efc3 100644
>> --- a/meta/conf/machine/include/x86/tune-core2.inc
>> +++ b/meta/conf/machine/include/x86/tune-core2.inc
>> @@ -21,18 +21,18 @@ TUNE_FEATURES:tune-core2-32 =3D "${TUNE_FEATURES:tun=
e-x86} core2"
>>  BASE_LIB:tune-core2-32 =3D "lib"
>>  TUNE_PKGARCH:tune-core2-32 =3D "core2-32"
>>  PACKAGE_EXTRA_ARCHS:tune-core2-32 =3D "${PACKAGE_EXTRA_ARCHS:tune-i686}=
 core2-32"
>> -QEMU_EXTRAOPTIONS_core2-32 =3D " -cpu n270"
>> +QEMU_EXTRAOPTIONS_core2-32 =3D " -cpu Nehalem,check=3Dfalse"
>>
>>  AVAILTUNES +=3D "core2-64"
>>  TUNE_FEATURES:tune-core2-64 =3D "${TUNE_FEATURES:tune-x86-64} core2"
>>  BASE_LIB:tune-core2-64 =3D "lib64"
>>  TUNE_PKGARCH:tune-core2-64 =3D "core2-64"
>>  PACKAGE_EXTRA_ARCHS:tune-core2-64 =3D "${PACKAGE_EXTRA_ARCHS:tune-x86-6=
4} core2-64"
>> -QEMU_EXTRAOPTIONS_core2-64 =3D " -cpu core2duo"
>> +QEMU_EXTRAOPTIONS_core2-64 =3D " -cpu Nehalem,check=3Dfalse"
>>
>>  AVAILTUNES +=3D "core2-64-x32"
>>  TUNE_FEATURES:tune-core2-64-x32 =3D "${TUNE_FEATURES:tune-x86-64-x32} c=
ore2"
>>  BASE_LIB:tune-core2-64-x32 =3D "libx32"
>>  TUNE_PKGARCH:tune-core2-64-x32 =3D "core2-64-x32"
>>  PACKAGE_EXTRA_ARCHS:tune-core2-64-x32 =3D "${PACKAGE_EXTRA_ARCHS:tune-x=
86-64-x32} core2-64-x32"
>> -QEMU_EXTRAOPTIONS_core2-64-x32 =3D " -cpu core2duo"
>> +QEMU_EXTRAOPTIONS_core2-64-x32 =3D " -cpu Nehalem,check=3Dfalse"
>> --
>> 2.39.2
>>
>>
>>
>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#193886): https://lists.openembedded.org/g/openembedde=
d-core/message/193886
> Mute This Topic: https://lists.openembedded.org/mt/103771791/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

