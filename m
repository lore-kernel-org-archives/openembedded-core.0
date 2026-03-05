Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4935DF30928
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 09:35:42 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40592.1772703332819778728
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Mar 2026 01:35:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Ay3fzJSN;
 spf=pass (domain: smile.fr, ip: 209.85.218.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b8fa449e618so1125161866b.0
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 01:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1772703331; x=1773308131; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j670qmlXdCZGnp6+RkobyyEoI6x88/MPkBAiOnvv1rw=;
        b=Ay3fzJSNo9Rmrv421XiiNVt3A88lHuIJQnRoaLAhP070ViAa1rqhTgpVRIj9y78TUw
         QVUb2ZQhZZGMwwBpLnDM0LBgDjkZe8v2tmThczgO9meDxiFbSUstxxSY5OLKiZfTFqiw
         KOYS6b8aIe4kAU/9s3GVJjg58vl0yySrOf+JE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772703331; x=1773308131;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j670qmlXdCZGnp6+RkobyyEoI6x88/MPkBAiOnvv1rw=;
        b=OB4aMEn39nTHmRUBZ2hsAoFSUB/RA6LI1x/kWQWVKW12iJFnbFZ9VokMSXgFfNfxys
         a6JO8jKrL2qyhulhTU36/98ygTKOSdMmwGcVkqp+vvUE6PzF0xcxX40zP9HqeHePdEto
         /PcrAC0bW2WuJUNSItr+ZQlnz2KO6Q3ANHNfwM1SgSd/Jum910QeHCeSksi9tvim9x9O
         ntTH2InIpOyI2E8NIUNMJAi4V6R1JXOoVD5QuNuMB/ULLq457uLs1KO3P0/J+064aiYV
         RijaAZw/VcoQReAUhmw0yMmNYPdrzTHdbil61oHNqpvosGM7QSQOcjHAzbF0pe0ZOID8
         Q4Ew==
X-Forwarded-Encrypted: i=1; AJvYcCV0gPanh39IAOIiNzN0MbsgVPgGwym/ivpRqVv6tWVXul7BreCzJJLA+3k6QjWjItf3HZaA4oObPXCh8uCJKaU7bQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzrhY7hifrNx6sEOgS57g/BbdPMKYUr38K6Qu5HsXsN+04m2Akw
	hDBLhUpXkI4wrR5FWcvQ5mFZAhWQx20eB7DTqld3qdZ7heofNMQEKA5TY4Uv6qDMR98=
X-Gm-Gg: ATEYQzy5hy+ypHcU64ITAIx63YHskqkbBJGU3K/hXF58QmwYLvl+MlyVggl7BTk3OkX
	zevC7mzEmRgBca2bxRtOOZV65ptr4JC/Eyct08YPne4evOqhdRci40MVb2yxuhwRVqpzYt8w8G5
	7csn7kix3n5cSHg1K41D23bK10cX9A/8+5oCC/TYnM3o/2OJaYa0P2GDW5PxTKFk9Xe+H+NUkyV
	VMH/PyHRJtoLMs/sYlPV1O2kBYNRCPK9+XG3/ZfPuMYfJOWcrKn5j3JGjVD985rtzHERMjzyl2W
	ZJju1m7LGSMWD39qGj8dEN9c3mokoiCa/mGoOzf2N6DL9tde8GUwo0ydICbrHYrgzdxO8Wee+Dv
	kg23iyPRC1FXJRZllbA8y9sIiQ+zZegTDseunJiWGh/WVYJYTFED7ZJ4lTQ/NkGsQAHPyWlNjOI
	7tycyO8r2o4nlCG7YO3oaf6DBKdPKathRTQHI351cDQ3KNOrcLEQDNi4Lfb3I6ITNpQerhmbgXw
	7+KfL2GNSQXSLBG
X-Received: by 2002:a17:907:3f07:b0:b8f:b32e:e196 with SMTP id a640c23a62f3a-b93f13f0dc6mr310962466b.30.1772703330992;
        Thu, 05 Mar 2026 01:35:30 -0800 (PST)
Received: from localhost (2a01cb001331aa00675b4cbd8c1678f5.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:675b:4cbd:8c16:78f5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9411ee04easm43502466b.63.2026.03.05.01.35.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 01:35:30 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Mar 2026 10:35:30 +0100
Message-Id: <DGUQVVEMFLF8.35QYS5F0MJVQT@smile.fr>
Subject: Re: [OE-core][whinlatter 00/12] Patch review
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Yoann Congal" <yoann.congal@smile.fr>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <cover.1772700454.git.yoann.congal@smile.fr>
 <DGUQKJKLZTVJ.Y3Q751XS5KRZ@smile.fr>
In-Reply-To: <DGUQKJKLZTVJ.Y3Q751XS5KRZ@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 09:35:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232474

On Thu Mar 5, 2026 at 10:20 AM CET, Yoann Congal wrote:
> On Thu Mar 5, 2026 at 9:54 AM CET, Yoann Congal wrote:
>> Please review this set of changes for whinlatter and have comments back
>> by end of day Monday, March 9.
>>
>> Passed a-full on autobuilder with warnings:
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3334
>> The sub-build qemux86-64-ptest had a ptest failure
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/3207=
=20
>> It is a known AB-INT bug: 15718 =E2=80=93 AB-INT: gstreamer ptest never =
ending (Bitbake still alive)
>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15718
>> This is not related to this series.
>>
>> The following changes since commit 45cba1329d541fdc5857d6df2624b34c91133=
f7a:
>>
>>   build-appliance-image: Update to whinlatter head revisions (2026-02-27=
 17:46:44 +0000)
>>
>> are available in the Git repository at:
>>
>>   https://git.openembedded.org/openembedded-core-contrib stable/whinlatt=
er-nut
>>   https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dstable=
/whinlatter-nut
>
> I plan to also add this patch to the branch:
> [whinlatter][PATCH] create-pull-request: Keep commit hash to be pulled in=
 cover email
> https://lore.kernel.org/openembedded-core/20260305085838.1176663-2-yoann.=
congal@smile.fr/T/#u

And also:
[whinlatter][PATCH 1/2] avahi: Remove a reference to the rejected CVE-2021-=
36217 - Yoann Congal
https://lore.kernel.org/openembedded-core/20260305093127.1179651-1-yoann.co=
ngal@smile.fr/
[whinlatter][PATCH 2/2] lz4: Remove a reference to the rejected CVE-2025-62=
813 - Yoann Congal
https://lore.kernel.org/openembedded-core/20260305093127.1179651-2-yoann.co=
ngal@smile.fr/

>> Adarsh Jagadish Kamini (1):
>>   python3-pip: Backport fix CVE-2026-1703
>>
>> Ankur Tyagi (1):
>>   wireless-regdb: upgrade 2025.10.07 -> 2026.02.04
>>
>> Antonin Godard (1):
>>   python3: skip flaky test_default_timeout test
>>
>> Hugo SIMELIERE (2):
>>   zlib: Fix CVE-2026-27171
>>   harfbuzz: Fix CVE-2026-22693
>>
>> Peter Marko (3):
>>   linux-yocto: apply cve-exclusions also to rt and tiny recipe variants
>>   cve-exclusions: set status for 5 CVEs
>>   ffmpeg: set status for CVE-2025-12343
>>
>> Shaik Moin (1):
>>   gdk-pixbuf: Fix CVE-2025-6199
>>
>> Vijay Anusuri (1):
>>   gnutls: Fix CVE-2025-14831
>>
>> Yoann Congal (2):
>>   README: Add whinlatter subject-prefix to git-send-email suggestion
>>   b4-config: add send-prefixes for whinlatter
>>
>>  .b4-config                                    |   1 +
>>  README.OE-Core.md                             |   2 +-
>>  .../zlib/zlib/CVE-2026-27171.patch            |  63 +++
>>  meta/recipes-core/zlib/zlib_1.3.1.bb          |   1 +
>>  .../python/python3-pip/CVE-2026-1703.patch    |  41 ++
>>  .../python/python3-pip_25.2.bb                |   4 +-
>>  ...kip-flaky-test_default_timeout-tests.patch |  49 ++
>>  .../python/python3_3.13.11.bb                 |   1 +
>>  .../gdk-pixbuf/gdk-pixbuf/CVE-2025-6199.patch |  36 ++
>>  .../gdk-pixbuf/gdk-pixbuf_2.42.12.bb          |   1 +
>>  .../harfbuzz/files/CVE-2026-22693.patch       |  33 ++
>>  .../harfbuzz/harfbuzz_11.4.5.bb               |   4 +-
>>  meta/recipes-kernel/linux/cve-exclusion.inc   |  16 +
>>  .../linux/linux-yocto-rt_6.12.bb              |   1 +
>>  .../linux/linux-yocto-rt_6.16.bb              |   1 +
>>  .../linux/linux-yocto-tiny_6.12.bb            |   1 +
>>  .../linux/linux-yocto-tiny_6.16.bb            |   1 +
>>  ....10.07.bb =3D> wireless-regdb_2026.02.04.bb} |   2 +-
>>  meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.bb  |   1 +
>>  .../gnutls/gnutls/CVE-2025-14831-1.patch      | 119 +++++
>>  .../gnutls/gnutls/CVE-2025-14831-10.patch     | 424 +++++++++++++++
>>  .../gnutls/gnutls/CVE-2025-14831-2.patch      |  66 +++
>>  .../gnutls/gnutls/CVE-2025-14831-3.patch      |  30 ++
>>  .../gnutls/gnutls/CVE-2025-14831-4.patch      |  45 ++
>>  .../gnutls/gnutls/CVE-2025-14831-5.patch      | 205 +++++++
>>  .../gnutls/gnutls/CVE-2025-14831-6.patch      | 505 ++++++++++++++++++
>>  .../gnutls/gnutls/CVE-2025-14831-7.patch      | 124 +++++
>>  .../gnutls/gnutls/CVE-2025-14831-8.patch      | 155 ++++++
>>  .../gnutls/gnutls/CVE-2025-14831-9.patch      | 110 ++++
>>  meta/recipes-support/gnutls/gnutls_3.8.10.bb  |  10 +
>>  30 files changed, 2048 insertions(+), 4 deletions(-)
>>  create mode 100644 meta/recipes-core/zlib/zlib/CVE-2026-27171.patch
>>  create mode 100644 meta/recipes-devtools/python/python3-pip/CVE-2026-17=
03.patch
>>  create mode 100644 meta/recipes-devtools/python/python3/0001-Skip-flaky=
-test_default_timeout-tests.patch
>>  create mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2025-61=
99.patch
>>  create mode 100644 meta/recipes-graphics/harfbuzz/files/CVE-2026-22693.=
patch
>>  rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2025.10.07.bb=
 =3D> wireless-regdb_2026.02.04.bb} (94%)
>>  create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-14831-1.=
patch
>>  create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-14831-10=
.patch
>>  create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-14831-2.=
patch
>>  create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-14831-3.=
patch
>>  create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-14831-4.=
patch
>>  create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-14831-5.=
patch
>>  create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-14831-6.=
patch
>>  create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-14831-7.=
patch
>>  create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-14831-8.=
patch
>>  create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-14831-9.=
patch


--=20
Yoann Congal
Smile ECS


