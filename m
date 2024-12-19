Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A957E7718A
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 18:05:35 +0000 (UTC)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
 by mx.groups.io with SMTP id smtpd.web11.135226.1734631532414487061
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Dec 2024 10:05:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U5LmOHyr;
 spf=pass (domain: gmail.com, ip: 209.85.161.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-5f32168ddd8so400409eaf.3
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Dec 2024 10:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734631531; x=1735236331; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dp/+PaQdzEWuquq8BVcJvPhdpLQqQOkNFSh+l6vxwR0=;
        b=U5LmOHyrdqnEtScuhpYcG2xWX+BXrtJ81AJzl3yoTrwWRm1Rpa1bP0eLF21byyYaIZ
         nXnMzCGl7RmN7IBApM3rIeT7Pnr3vryKgrK9OGoLOxa1bul5YQdKQKqKx5XYXUgRWRZp
         U71P/h2M3bS/VaL31j/b+z803PguBPCLNJTt9B09BYqh7Coe0pJ2BaeB3GcTs/n+y0CT
         G3yS3aWqaOvS4CUuhdm0wPA3w2DQxXb/gtdKy7Uu6dliZqBWe//MApfS8kgwFUyYF7WE
         3ekhMjTQiLMNLFzhssWgRNZsZdygR0eCUUqaXy56cgtokRTgKliVKOOjFXfpRpWcmRUB
         9pgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734631531; x=1735236331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dp/+PaQdzEWuquq8BVcJvPhdpLQqQOkNFSh+l6vxwR0=;
        b=BuWAZgRQY3H8D98gJTqUFEoi53iGZzKRco1DPWIu+ckeoVHBGvhU8KEQa8aLIW8O2l
         ZK2d8EeJgOntPccnMBzF808s16QMXSlj8RRhgnDZCG15Y9XCeeQhYNOh8FURzCmmg7aa
         fKaVkQAAntWpj6sCWxmj12PHuLMJPc+to8TPOpC52QwR2V9Eg9NVZdW0GR0WHhoPiJJi
         aye7I20rlBJtWJYqg+58S3GrC7r8GTJ6xEmpr+gBj6MpjPU0Yhb9xz+RUo4Zw1/39dGi
         qeewvPg2gpztTOQrevMK6iK4DzoPN0Gek5a77SGeYBAR9xd+HYKGctzsJPL2AwL5LB5w
         8o1g==
X-Forwarded-Encrypted: i=1; AJvYcCXqwym2RiMX5tZZyNmzRDwZDMhqzHC56ro0QH/yIubS3ruWK7e9g72Wk9/fnFw/cD03ou6otmXNSGmf4vGLSMi6Bw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywhf1Zj/EPFTxaw/Ew5WBXzYAJTuz3IenM4bI/qCmTiJYy/0UNF
	Z2b7jeDMuJnBwqcplHziS07t+eC84h1/7yzWerLJetsNaz8NxLfsTtIDwNuf6GAM587TbOKtCIk
	a6iHwtcDCLxOY5ul/NvW6nmC3FX4G+ujK
X-Gm-Gg: ASbGncuZwm9DF5WCZopWIWYDJ7KpTNxT1siNp2op+xpZ0GqNVxdTklKuRsKjcoRMHwg
	5Wm6M8evc8e2+jt5ryuNW3FvYFq1A7T65VRu7
X-Google-Smtp-Source: AGHT+IEd6MPBCSOHRMFxDqhvSMHWIaomCmp219YO4n3sPvt4pvYeFaDBXYpkvi3hY3KqUloH19jWBx44i6kGBb3BQbw=
X-Received: by 2002:a05:6871:529a:b0:29e:491b:96db with SMTP id
 586e51a60fabf-2a7b2fef5c2mr4945041fac.5.1734631531633; Thu, 19 Dec 2024
 10:05:31 -0800 (PST)
MIME-Version: 1.0
References: <1734597713-2663-1-git-send-email-wangmy@fujitsu.com> <CANNYZj8w3j0i7qPob-X6H7D201A9rtOLGg_-ZH_Y=Ydyaix2sQ@mail.gmail.com>
In-Reply-To: <CANNYZj8w3j0i7qPob-X6H7D201A9rtOLGg_-ZH_Y=Ydyaix2sQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 19 Dec 2024 10:05:05 -0800
Message-ID: <CAMKF1sp8p+tfzy8-WDOuY42z5-PiSOYwWwQ1Y29Y9_GZy+rBNw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] nfs-utils: Fix const qualifier error
To: alex.kanavin@gmail.com
Cc: wangmy@fujitsu.com, openembedded-core@lists.openembedded.org, 
	Wang Mingyu <wangmy@cn.fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Dec 2024 18:05:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208927

On Thu, Dec 19, 2024 at 1:01=E2=80=AFAM Alexander Kanavin via
lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org>
wrote:
>
> Please do not add new =E2=80=98Penfing=E2=80=99 patches. They should be s=
ubmitted upstream first or there should be an explanation of what is pendin=
g.

Yeah, i did another patch which is also not correct sadly. Perhaps we
need to address it differently than simply trying
type punning.

>
> Alex
>
> On Thu 19. Dec 2024 at 9.42, wangmy via lists.openembedded.org <wangmy=3D=
fujitsu.com@lists.openembedded.org> wrote:
>>
>> From: Wang Mingyu <wangmy@cn.fujitsu.com>
>>
>> error with clang:
>> file.c:200:8: error: assigning to 'char *' from 'const char *'
>> discards qualifiers
>> [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
>> |   200 |                 base =3D pathname;
>> |       |                      ^ ~~~~~~~~
>>
>> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
>> ---
>>  .../0001-Fix-const-qualifier-error.patch      | 35 +++++++++++++++++++
>>  .../nfs-utils/nfs-utils_2.8.2.bb              |  1 +
>>  2 files changed, 36 insertions(+)
>>  create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-F=
ix-const-qualifier-error.patch
>>
>> diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Fix-cons=
t-qualifier-error.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/000=
1-Fix-const-qualifier-error.patch
>> new file mode 100644
>> index 0000000000..8fc327e7aa
>> --- /dev/null
>> +++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Fix-const-quali=
fier-error.patch
>> @@ -0,0 +1,35 @@
>> +From a21344466e4c315d6d7098920819983f2d15573b Mon Sep 17 00:00:00 2001
>> +From: Wang Mingyu <wangmy@cn.fujitsu.com>
>> +Date: Thu, 19 Dec 2024 06:18:59 +0000
>> +Subject: [PATCH] Fix const qualifier error
>> +
>> +Fixes clang error
>> +file.c:200:8: error: assigning to 'char *' from 'const char *'
>> +discards qualifiers
>> +[-Werror,-Wincompatible-pointer-types-discards-qualifiers]
>> +|   200 |                 base =3D pathname;
>> +|       |                      ^ ~~~~~~~~
>> +
>> +Upstream-Status: Pending
>> +
>> +Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
>> +---
>> + support/nsm/file.c | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/support/nsm/file.c b/support/nsm/file.c
>> +index de122b0..2733210 100644
>> +--- a/support/nsm/file.c
>> ++++ b/support/nsm/file.c
>> +@@ -197,7 +197,7 @@ nsm_make_temp_pathname(const char *pathname)
>> +
>> +       base =3D strrchr(pathname, '/');
>> +       if (base =3D=3D NULL)
>> +-              base =3D pathname;
>> ++              base =3D (char*)(&pathname);
>> +       else
>> +               base++;
>> +
>> +--
>> +2.43.0
>> +
>> diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.2.bb b/me=
ta/recipes-connectivity/nfs-utils/nfs-utils_2.8.2.bb
>> index 543c68f7f5..45821b98e8 100644
>> --- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.2.bb
>> +++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.2.bb
>> @@ -31,6 +31,7 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/nfs-utils=
/${PV}/nfs-utils-${PV}.tar.x
>>             file://0001-Makefile.am-fix-undefined-function-for-libnsm.a.=
patch \
>>             file://clang-warnings.patch \
>>             file://0001-locktest-Makefile.am-Do-not-use-build-flags.patc=
h \
>> +           file://0001-Fix-const-qualifier-error.patch \
>>             "
>>
>>  SRC_URI[sha256sum] =3D "a39bbea76ac0ab9e6e8699caf3c308b6b310c20d458e8fa=
8606196d358e7fb15"
>> --
>> 2.43.0
>>
>>
>>
>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#208899): https://lists.openembedded.org/g/openembedde=
d-core/message/208899
> Mute This Topic: https://lists.openembedded.org/mt/110195053/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

