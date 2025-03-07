Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD43DC19F32
	for <webhook@archiver.kernel.org>; Fri,  7 Mar 2025 16:49:00 +0000 (UTC)
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
 by mx.groups.io with SMTP id smtpd.web11.15983.1741366135641702762
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Mar 2025 08:48:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZeyrTIZb;
 spf=pass (domain: gmail.com, ip: 209.85.161.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-60047980ffdso713766eaf.1
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Mar 2025 08:48:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741366135; x=1741970935; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NP8Oh/vi15JUUjaPmGRrxh71PZEn4jJmlVCXLO5z898=;
        b=ZeyrTIZbZeVM+QVXozC5Z0Dr76Lri2N9o8WCGInqW9PmpCZ43XP6FATWXLiA8O5lwo
         NV03EzVk/ZRt6/oA0hsbT1GonUa1XK3gDkcV4UWFAZCC6QwZhnnrLiyX4kTghZ0b/sFR
         mozKy21WdbFlviLBZMEIvSsJkc+4F0EXY1No0HdAN2KrNosvAU+ayRqGKejtBlXc79bg
         lf+cmMschSVv0N/STv9h5J0NybmwkSB3ZTqHLEBdRFBgsXtpkn5WfBbG2AGVH72M5iYM
         m32ZdoPTIDHxj6Q1xJC/xS3CigV7QkSRVbFmCWTwRLmDo+1/PxYstRQzF6iOjmXhZ5IF
         OFiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741366135; x=1741970935;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NP8Oh/vi15JUUjaPmGRrxh71PZEn4jJmlVCXLO5z898=;
        b=CftR/2mT0wPvoAxJJdIhhute3goJl7EQspQAYa5SZGIQapJnEwVKcc2CCC0QVA3fWl
         kUwItzbuAUZ3l04jl6GrEgA6G4LU7K8qpNK2wloUvvrYawpVffzfo6B1JVb39pfknzui
         VFoLCGv+xt6NX+UkP1AoWaKnw9wGMyR1tkDfkxooaBul+7N5M9fyEiutHCNwZxSmhMLv
         MMpeoAFzH4qk4CKQ7ZuBXtV0bfiTVJE+xcxVjRg+Cu8ro7QjSrBTrE+HMYKwZtVtZAvA
         EIiGZU7oNQWrZaF+n8rOzxeW9dH/gAcD2f67seuYVKB0Npon0GMyUuZW9C4VJ3ZdCsm8
         7T0w==
X-Gm-Message-State: AOJu0YxH0iAUcDOqHuKqf/bKncA7til9IViyRNpTXYpdZ15Ki5Bd7gzL
	23MlM9PQBpQTNleTpeAP8fXwtDy+9aWniNDZZ4cHOD8pcCVp0r2X0akQNKGG1lftlrYR+mIEwac
	c+tQAkvO/PQWkboQvFWOV8K6rjOc=
X-Gm-Gg: ASbGnctZsvz8OQxnM8TTWTGHfMSBGZ8wOD3qUgECMLEHH98ZxYK5dV63GvkRg9X/VTx
	ZGgEs9gapzKCwpvq/Ac4ZjNBbaazteOz+Oial2zdF4f6mB7I2WRSTeVPtTj0qYV5zfAh+aFIdx+
	fS0I0copWRfKREJ6G6bLH5xpGzcw==
X-Google-Smtp-Source: AGHT+IHBPvZhmwdlfoBl4EL3kPRjH83B5d1kjxCeKqupUHaIg/aPLv3EIhgoFVlAKY7Nxg5VY2WRAJUqKw9wcF0ZvwE=
X-Received: by 2002:a05:6808:14d3:b0:3f3:f89d:3558 with SMTP id
 5614622812f47-3f697b61e93mr2620911b6e.19.1741366134846; Fri, 07 Mar 2025
 08:48:54 -0800 (PST)
MIME-Version: 1.0
References: <20250306185551.1758417-1-Randy.MacLeod@windriver.com>
 <CAMKF1sp=ovCd8xsQ=LLcYpENio=rP7sgecnUBrhjYKc3gRqYCg@mail.gmail.com> <b2c632c7-30ca-486a-ba14-46c0f404f9e6@windriver.com>
In-Reply-To: <b2c632c7-30ca-486a-ba14-46c0f404f9e6@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 7 Mar 2025 08:48:28 -0800
X-Gm-Features: AQ5f1JpTOKSgTqB_3exPH2KIz7En9zTi8AeJVWXBU7oOfxUdmB3eNWkoHzKivCY
Message-ID: <CAMKF1srSJWbHYB9ZvNCLt0PFrHeua6C47Op9tU01Mc8_PZNJOQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] tcmode-default: eliminate needless gdb, qemu defaults
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: openembedded-core@lists.openembedded.org, bruce.ashfield@gmail.com, 
	Mark Hatle <mark.hatle@kernel.crashing.org>, Ross Burton <ross.burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Mar 2025 16:49:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212458

On Thu, Mar 6, 2025 at 5:40=E2=80=AFPM Randy MacLeod
<randy.macleod@windriver.com> wrote:
>
> On 2025-03-06 6:24 p.m., Khem Raj wrote:
>
> Are we sure that we don=E2=80=99t have external toolchains feeding gdb th=
ese days
>
>
> I'm not sure. That's why I cc'ed you.  :-)
>
> How would I check or who would we ask?
>
> Let's start with Mark and Ross.
> It's easy enough to revert if we find that someone, somehow needs this
> but I plan to remove the rust and binutils bits next and if that goes wel=
l,
> drop the rest of the file at the start of 5.3 if not sooner.
>

In general I am ok with this it does make core policies a bit tighter,
and I do not have usecase for external toolchains myself
but we have tried to accommodate other providers of external
toolchains in past but there is
PREFERRED_PROVIDER way of hooking the overriding toolchains as well
e.g. in meta-go-binary layer
this is the way it is used.

> ../Randy
>
>
>
> On Thu, Mar 6, 2025 at 1:55=E2=80=AFPM <Randy.MacLeod@windriver.com> wrot=
e:
>>
>> From: Randy MacLeod <Randy.MacLeod@windriver.com>
>>
>> Manually setting preferred version/provider is not required so remove
>> that for gdb and qemu as a first step of cleaning up this file.
>>
>> This PREFERRED_VERSION list dates back to 2006, which is an era where
>> several versions of a given recipe was a common occurence.
>>
>> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
>> ---
>>  meta/conf/distro/include/tcmode-default.inc | 11 -----------
>>  1 file changed, 11 deletions(-)
>>
>> diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/dis=
tro/include/tcmode-default.inc
>> index 079a7ca3ea..ce0c8235e4 100644
>> --- a/meta/conf/distro/include/tcmode-default.inc
>> +++ b/meta/conf/distro/include/tcmode-default.inc
>> @@ -6,18 +6,14 @@ PREFERRED_PROVIDER_virtual/cross-binutils =3D "${MLPRE=
FIX}binutils-cross-${TARGET_
>>  PREFERRED_PROVIDER_virtual/cross-binutils:class-nativesdk ?=3D "binutil=
s-crosssdk-${SDK_SYS}"
>>  PREFERRED_PROVIDER_virtual/nativesdk-cross-binutils ?=3D "binutils-cros=
ssdk-${SDK_SYS}"
>>
>> -PREFERRED_PROVIDER_gdb =3D "gdb"
>> -
>>  # Default libc config
>>  PREFERRED_PROVIDER_virtual/gettext ??=3D "gettext"
>>
>>  GCCVERSION ?=3D "14.%"
>>  SDKGCCVERSION ?=3D "${GCCVERSION}"
>>  BINUVERSION ?=3D "2.44%"
>> -GDBVERSION ?=3D "16.%"
>>  GLIBCVERSION ?=3D "2.41%"
>>  LINUXLIBCVERSION ?=3D "6.12%"
>> -QEMUVERSION ?=3D "9.2%"
>>  GOVERSION ?=3D "1.24%"
>>  RUSTVERSION ?=3D "1.83%"
>>
>> @@ -40,9 +36,6 @@ PREFERRED_VERSION_binutils-native ?=3D "${BINUVERSION}=
"
>>  PREFERRED_VERSION_binutils-cross-${TARGET_ARCH} ?=3D "${BINUVERSION}"
>>  PREFERRED_VERSION_binutils-crosssdk-${SDK_SYS} ?=3D "${BINUVERSION}"
>>  PREFERRED_VERSION_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} ?=
=3D "${BINUVERSION}"
>> -PREFERRED_VERSION_gdb ?=3D "${GDBVERSION}"
>> -PREFERRED_VERSION_gdb-cross-${TARGET_ARCH} ?=3D "${GDBVERSION}"
>> -PREFERRED_VERSION_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} ?=3D "${=
GDBVERSION}"
>>
>>  PREFERRED_VERSION_linux-libc-headers ?=3D "${LINUXLIBCVERSION}"
>>  PREFERRED_VERSION_nativesdk-linux-libc-headers ?=3D "${LINUXLIBCVERSION=
}"
>> @@ -53,10 +46,6 @@ PREFERRED_VERSION_glibc-scripts            ?=3D "${GL=
IBCVERSION}"
>>  PREFERRED_VERSION_nativesdk-glibc          ?=3D "${GLIBCVERSION}"
>>  PREFERRED_VERSION_cross-localedef-native   ?=3D "${GLIBCVERSION}"
>>
>> -PREFERRED_VERSION_qemu ?=3D "${QEMUVERSION}"
>> -PREFERRED_VERSION_qemu-native ?=3D "${QEMUVERSION}"
>> -PREFERRED_VERSION_nativesdk-qemu ?=3D "${QEMUVERSION}"
>> -
>>  # Bootstrap Go using a binary release from golang.org.  If you want to =
bootstrap
>>  # from source using the C-implemented Go 1.4 (only supports x86-64 host=
s) then use
>>  # go-native.
>> --
>> 2.34.1
>>
>
> --
> # Randy MacLeod
> # Wind River Linux

