Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DAA3C3ABC3
	for <webhook@archiver.kernel.org>; Sat, 10 May 2025 21:29:51 +0000 (UTC)
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
 by mx.groups.io with SMTP id smtpd.web10.18939.1746912581730167222
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 May 2025 14:29:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EvCt5BRW;
 spf=pass (domain: gmail.com, ip: 209.85.161.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-604ad0347f5so774538eaf.2
        for <openembedded-core@lists.openembedded.org>; Sat, 10 May 2025 14:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746912581; x=1747517381; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1WD5VFU6ywdT0M/yryAtaMS6OWDFxSuy5tUrgIT2NxM=;
        b=EvCt5BRWewxfhXrOmie2aRM/PaTMrPMZFBNyGsGHYiTeecZVj9fmyQFe7WPzqZKBlp
         q9Dn+Wa0SDcZuEWos8ZRCFmgyou3JZ9BedHsbqTMmR1RDp7sCXL97iNcZrmwhIuKMgDT
         PrsZhMeg0MESpc8AQrV2ykYTRrj5ycsmB4XWnV1Bi0S1ktJklYnhsWwxFK0JmuxilcC3
         bmjua4HPhC4kL20erker+GfNnLfw8Tqk9sJSiyxOWW7ugwBgB+YElYsYJQiqCqqvQzQM
         0R/7w8DQJDv4UMEXoWN/8nFt9dMekiedLqUJ5PDNjVIcUKvFNmeZImYTaeBTnfU478bT
         AvQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746912581; x=1747517381;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1WD5VFU6ywdT0M/yryAtaMS6OWDFxSuy5tUrgIT2NxM=;
        b=ISOmFchquNRzk0pCwO2NloeubQIgDYJkZpSKhLRWeMXBIoY0ZYYAQ4Qy0e/UGCoYTc
         Jw7PUNLQceZFOWIztggidQmlt7/5eFRYU4pHRk/8KWduKMdjHVDyTSgRC12sbRpLGNBu
         42ZiLjk3fj0h3IT4JwOQ0GM+1aTpsUpZfBlcMb5UYc+Z4am8c9RQwfPK+mlIW7M9CdOr
         kmdX8KIyxqks1x701JMEBlJL9hsGFr9elkQG80Tuga9NWdMFMK/eq6lXwjAKrEaS95cc
         LEYBfGraLaKZsJRjq/4rltOaaad19ZT7O1eMletcOlzX+LSsnqM1fWgC2+k7NlkNngn0
         yCKQ==
X-Gm-Message-State: AOJu0YyP8RuPtbPETLe3N5+amn+mlwbg2IlowogkxEJgYk17Vw+fhfO/
	N1eOINUBlcOwl5z4XR0y3h0gZUUc86bGj+D0h3w2eRx8w3uG/JCGG12MlE8DMsP/K8oUFuPd+/p
	DdNF4A9bguzhXbXsqYkgWMt7mGIviD08s
X-Gm-Gg: ASbGncvnpGhrLmUzLCTmOFd53wJY2NFAKBpit1IGB11+ibiE0n1pbeYBoONtpx0iczM
	tY+S//JSOm7FjKkmGmBYiCxF0tO5sfs7JmztrR1pqLzOO3S3+Px5HqWdgjDoox6nHXND3xn3EuT
	ItqR3xQV+j2E3Tv/z5NW9QvvaLk6b0mlo=
X-Google-Smtp-Source: AGHT+IG5zCq49Rx/MPJLTSAn9TPckoYPvCt3gwgeak+JcgBKXdQ4bJ1vMyKL5u5Xd3xeO2Ct8UKeIOtxrOsPEf4zAOc=
X-Received: by 2002:a05:6808:2110:b0:403:31b5:7eb1 with SMTP id
 5614622812f47-403800ec049mr4413463b6e.36.1746912580427; Sat, 10 May 2025
 14:29:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1spkq=LkQf7qHmBB_DPD+4s73iXiCe54-kA+qfdnwFiT0A@mail.gmail.com>
 <29977.1746888734129629150@lists.openembedded.org> <CAMKF1sqHqP9O5po2Z7Egr18rjuksWJ3dv0oQgkDYN9w9VLCvbg@mail.gmail.com>
In-Reply-To: <CAMKF1sqHqP9O5po2Z7Egr18rjuksWJ3dv0oQgkDYN9w9VLCvbg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 10 May 2025 14:29:14 -0700
X-Gm-Features: AX0GCFuSnqY_RnRvT63iW7yy4pKNICzBKTLCrt256B7zZyclTyv5ugt7B68QdlQ
Message-ID: <CAMKF1spoD=skyc4MG5XAMVBub9ZMQiMVLL61=hCvsSMsNOWcEQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] compiler-rt-sanitizers, compiler-rt: skip for armv5
To: hongxu.jia@eng.windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 10 May 2025 21:29:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216277

I have a couple of patches to fix the compiler-rt builds for < armv6
which are under test, I will send that later today.

On Sat, May 10, 2025 at 7:59=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote=
:
>
>
>
> On Sat, May 10, 2025 at 7:52=E2=80=AFAM hongxu via lists.openembedded.org=
 <hongxu.jia=3Deng.windriver.com@lists.openembedded.org> wrote:
>>
>> Hi Khem,
>>
>> I followed your suggestions to apply the following change on compiler-rt=
 recipe and build it for qemuarmv5, the failure remains
>
>
> Right I think the issue is that it also needs arch value set to armv5te f=
rom toolchain triple and we use arm-poky-Linux-gnueabi and that confuses co=
mpiler-rt cmake as well I think it needs to be fixed as well along with hos=
t arch
>
>>
>> --- a/meta/recipes-devtools/clang/compiler-rt-sanitizers_git.bb
>> +++ b/meta/recipes-devtools/clang/compiler-rt-sanitizers_git.bb
>> @@ -74,6 +74,7 @@ EXTRA_OECMAKE:append:class-target =3D "\
>>                 -DCMAKE_AR=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX=
}llvm-ar \
>>                 -DCMAKE_NM=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX=
}llvm-nm \
>>                 -DCMAKE_C_COMPILER_TARGET=3D${HOST_ARCH}${HOST_VENDOR}-$=
{HOST_OS} \
>> +               -DCOMPILER_RT_DEFAULT_TARGET_ARCH=3D${@bb.utils.contains=
('TUNE_FEATURES', 'armv5 thumb dsp', 'armv5te', '${HOST_ARCH}', d)} \
>>                 -DCOMPILER_RT_DEFAULT_TARGET_ONLY=3DON \
>>                 -DCMAKE_POSITION_INDEPENDENT_CODE=3DON \
>>  "
>> diff --git a/meta/recipes-devtools/clang/compiler-rt_git.bb b/meta/recip=
es-devtools/clang/compiler-rt_git.bb
>> index 93928541273..8073bc139eb 100644
>> --- a/meta/recipes-devtools/clang/compiler-rt_git.bb
>> +++ b/meta/recipes-devtools/clang/compiler-rt_git.bb
>> @@ -80,6 +80,7 @@ EXTRA_OECMAKE:append:class-target =3D "\
>>                 -DCMAKE_AR=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX=
}llvm-ar \
>>                 -DCMAKE_NM=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX=
}llvm-nm \
>>                 -DCMAKE_C_COMPILER_TARGET=3D${HOST_ARCH}${HOST_VENDOR}-$=
{HOST_OS}${HF} \
>> +               -DCOMPILER_RT_DEFAULT_TARGET_ARCH=3D${@bb.utils.contains=
('TUNE_FEATURES', 'armv5 thumb dsp', 'armv5te', '${HOST_ARCH}', d)} \
>>                 -DCMAKE_POSITION_INDEPENDENT_CODE=3DON \
>>  "
>>
>> $ echo 'MACHINE =3D "qemuarmv5"' >> conf/local.conf
>> $ bitbake compiler-rt
>> ...
>> /buildarea5/hjia/poky/build/tmp/work-shared/llvm-project-source-20.1.3-r=
0/llvm-project-20.1.3.src/compiler-rt/lib/builtins/arm/sync-ops.h:22:2: err=
or: #error DMB is only supported on ARMv6+
>>    22 | #error DMB is only supported on ARMv6+
>>       |  ^~~~~
>> ...
>>
>> //Hongxu
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#216273): https://lists.openembedded.org/g/openembedd=
ed-core/message/216273
>> Mute This Topic: https://lists.openembedded.org/mt/112897300/1997914
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [r=
aj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

