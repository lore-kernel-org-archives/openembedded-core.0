Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D225C71159
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 16:26:22 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.web11.1484.1750091178101378587
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jun 2025 09:26:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=lT86U/f9;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.175, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-70e77831d68so44756897b3.2
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 09:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1750091177; x=1750695977; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0vAE8SiwnW7ZK4RViUF1rkOitMjdLc5q5UiUPRVr4Z8=;
        b=lT86U/f9TJ+js3BExnHh3SVlprpmHCD0+lUQave7Iso7iMOA0ndh0egI6jtCCclUIc
         QJF4VjIxtlksQaz5BbhI1UVKeU+hckfB9TcXCNZPCfSqqKu7cQE/7apcvGFaY+Bz1d6V
         pHrqmAT1Vw119E6nNwT7OfOm3gDR0NQ/0ymP6n3q4K5fyP1u0sAD6cBbLzvv6rWZq0gf
         D0sM3olRn1pH+5O5txU3umGtiktoD6QK6H0njzG01ExjZ/dFfPj7qG5ifxUG6LO2KdNb
         e/Z7DYge8l/uyLAlGssLzq7HxP1Ppm4zBT2l8uKuPfnzpPrtQ9p/JV4RwpR1oDR21Qw/
         lK9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750091177; x=1750695977;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0vAE8SiwnW7ZK4RViUF1rkOitMjdLc5q5UiUPRVr4Z8=;
        b=cVHql0caSl3+OtRaZWmG1vNnEaeMkGbCDq0bE3AOe/PqhpT+UDzc4eE1LJrL8XzjvE
         KgzWKDs2SwqlEObRfMq2qQ/n9zjfrrJ6C69y+IHnc5lj+z8G6hMhBZIr2edZFzcI584P
         piYyEUlnwBdQXfGgfeZ5cSdn3UxfXzJZaqUFy/Xi4vKfjMkPXWmRCq3joM7WD4Cw9DYf
         dLnPgI/DxxI+wV/J5w+Tqb/fxqlFrUWtOmrUb40tr7uvQ10n0ufLCO0QViWgFyNDIuXL
         6WXFrzWLtvLrUXBKoK8hSamBsreE4sOdtGb0zWI+OIjJ7zkil0pS4CxsC5SdjbPssBzC
         3K0w==
X-Forwarded-Encrypted: i=1; AJvYcCVCKGSHKgW/TrrsSY7m220IPvR5RJXTkUhPo+FjD/rzu30wZsvMPeKnuUrmrmFBZqaS5TpjFBnEIRsqGeSzSkmMdQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz1NJfiBiLTS/rMhHme+sH0XMOWotNwZ/fGEsQ5K0cRugpmZd3/
	Tq7LG9hxT0xBFhpt4qNa4Hb9HLMITG+QIcvdu3zzpQ2LgAi9aqyeudgoI7T7AaKgYjXr+rMFxHV
	u0zAKkP2NWodk8DfRXdaTpZdnLpyajsCY8Q/nBKeOTw==
X-Gm-Gg: ASbGncvKFU2a4RpPUnLhqkRhJxu/uWNbwUHQEOTdqtgg0g1M11yFxkEHSKRQrZhCCR/
	R7RDE2bJEL+TH8P6QFNOn4zdKvtTLooi7wpGo6dewGolE0Gn3Z77CAeXRLHJVDQo92ZS/zXqw2Q
	7RI7W/zET4RkySzqc2csTaqlOx59exZ+aj5I3zL4WGUyjh1c1e5tA6HXYwafMILXPhPl8vna8kO
	w==
X-Google-Smtp-Source: AGHT+IFFbgRYOFdMj7GBhLV2eo8bgbRWZoewEoiUHjSrjIW24VcDcRWo9onahjlN7nnFeR7kYchtyticSzAL6BtoiA0=
X-Received: by 2002:a05:690c:3503:b0:70e:1874:b915 with SMTP id
 00721157ae682-7117538e15emr156702687b3.10.1750091177188; Mon, 16 Jun 2025
 09:26:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250613034352.175878-1-changqing.li@windriver.com>
 <CAOSpxdZwOjkN+OaHEzhv6qngpS+aGTx8OcdCWR9ewb9U5PSvfQ@mail.gmail.com>
 <e8d9e1d0-ae8b-4172-bacb-2f9efb42bc71@windriver.com> <CANQUz1_kY1_Fc1dn-imi+m87HCkTfTiX+fQnfsMO3AdWa9s=TA@mail.gmail.com>
In-Reply-To: <CANQUz1_kY1_Fc1dn-imi+m87HCkTfTiX+fQnfsMO3AdWa9s=TA@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 16 Jun 2025 09:26:05 -0700
X-Gm-Features: AX0GCFtqTlmCVoC3e3WEP7sHW3-LwGold6b-kzWS37EppZmbeeLfW07S0fvAZYI
Message-ID: <CAOSpxdaz4DXbO+hH4V=gKv3my0tAKvXmbipiaqUHbGBtGDZhkQ@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH 00/20] *** libsoup/libsoup-2.4: fix
 CVEs ***
To: Vijay Anusuri <vanusuri@mvista.com>
Cc: Changqing Li <changqing.li@windriver.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 16:26:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218843

On Sun, Jun 15, 2025 at 7:38=E2=80=AFPM Vijay Anusuri <vanusuri@mvista.com>=
 wrote:
>
> Hi Changqing,
>
> I'm ok with your idea.
>
> Steve,
>
> Can you take my series of patches?
> Once those patches get merged, Changqing will send another series with ot=
her required patches.

Sounds like a plan!  I will do as you suggest.

Steve

> On Mon, Jun 16, 2025 at 5:49=E2=80=AFAM Changqing Li <changqing.li@windri=
ver.com> wrote:
>>
>>
>> On 6/14/25 00:23, Steve Sakoman wrote:
>>
>> CAUTION: This email comes from a non Wind River email account!
>> Do not click links or open attachments unless you recognize the sender a=
nd know the content is safe.
>>
>> Hi Vijay and Changqing,
>>
>> Seems you sent similar patch series at just about the same time!
>>
>> There is a good deal of overlap, but each contains some that the other l=
acks.
>>
>> Also, Changqing's has a conflict in "libsoup-2.4: fix do_compile
>> failure" with a patch currently in kirkstone: "libsoup-2.4: Backport
>> auth tests for CVE-2025-32910"
>>
>> Could you please work together to decide which I should take and kirksto=
ne-nut
>> submit a new series?
>>
>> Thanks!
>>
>> Steve
>>
>> Hi, Vijay and Steve
>>
>> How about take Vijay's series of patches first,   after is is merged in =
branch kirkstone-nut
>>
>> ,  I can rework my patches bases on branch kirkstone-nut, send a V2 seri=
es with other needed patches.
>>
>> Regards
>>
>> Changqing
>>
>> On Thu, Jun 12, 2025 at 8:43=E2=80=AFPM Changqing Li via
>> lists.openembedded.org
>> <changqing.li=3Dwindriver.com@lists.openembedded.org> wrote:
>>
>> From: Changqing Li <changqing.li@windriver.com>
>>
>> Backport several CVE fixes from branch scarthgap, cherry picked from
>> poky-contrib: stable/scarthgap-nut,  and do some changes accordingly.
>>
>> Ashish Sharma (1):
>>   libsoup: patch CVE-2025-4476
>>
>> Changqing Li (17):
>>   libsoup-2.4: fix CVE-2025-32907
>>   libsoup-2.4: fix CVE-2025-32053
>>   libsoup-2.4: fix CVE-2025-32052
>>   libsoup-2.4: fix CVE-2025-32050
>>   libsoup-2.4: fix CVE-2025-46421
>>   libsoup-2.4: fix CVE-2025-4948
>>   libsoup-2.4: fix CVE-2025-4476
>>   libsoup-2.4: fix CVE-2025-2784
>>   libsoup-2.4: fix do_compile failure
>>   libsoup: fix CVE-2025-32907
>>   libsoup: fix CVE-2025-32053
>>   libsoup: fix CVE-2025-32052
>>   libsoup: fix CVE-2025-32051
>>   libsoup: fix CVE-2025-32050
>>   libsoup: fix CVE-2025-46421
>>   libsoup: fix CVE-2025-4948
>>   libsoup: fix CVE-2025-2784
>>
>> Hitendra Prajapati (2):
>>   libsoup-2.4: Fix CVE-2025-4969
>>   libsoup: Fix CVE-2025-4969
>>
>>  .../libsoup/libsoup-2.4/CVE-2025-2784.patch   |  56 +++++
>>  .../libsoup/libsoup-2.4/CVE-2025-32050.patch  |  29 +++
>>  .../libsoup/libsoup-2.4/CVE-2025-32052.patch  |  32 +++
>>  .../libsoup/libsoup-2.4/CVE-2025-32053.patch  |  39 ++++
>>  .../libsoup/libsoup-2.4/CVE-2025-32907.patch  |  39 ++++
>>  .../libsoup-2.4/CVE-2025-32910-1.patch        |  79 +------
>>  .../libsoup-2.4/CVE-2025-32910-2.patch        |  60 +-----
>>  .../libsoup-2.4/CVE-2025-32912-1.patch        |  20 +-
>>  .../libsoup/libsoup-2.4/CVE-2025-4476.patch   |  38 ++++
>>  .../libsoup/libsoup-2.4/CVE-2025-46421.patch  |  47 ++++
>>  .../libsoup/libsoup-2.4/CVE-2025-4948.patch   |  38 ++++
>>  .../libsoup/libsoup-2.4/CVE-2025-4969.patch   |  76 +++++++
>>  .../libsoup/libsoup-2.4_2.74.2.bb             |   9 +
>>  .../libsoup/libsoup/CVE-2025-2784.patch       | 137 ++++++++++++
>>  .../libsoup/libsoup/CVE-2025-32050.patch      |  29 +++
>>  .../libsoup/libsoup/CVE-2025-32051-1.patch    |  29 +++
>>  .../libsoup/libsoup/CVE-2025-32051-2.patch    |  57 +++++
>>  .../libsoup/libsoup/CVE-2025-32052.patch      |  31 +++
>>  .../libsoup/libsoup/CVE-2025-32053.patch      |  40 ++++
>>  .../libsoup/libsoup/CVE-2025-32907-1.patch    | 200 ++++++++++++++++++
>>  .../libsoup/libsoup/CVE-2025-32907-2.patch    |  68 ++++++
>>  .../libsoup/libsoup/CVE-2025-4476.patch       |  38 ++++
>>  .../libsoup/libsoup/CVE-2025-46421.patch      | 139 ++++++++++++
>>  .../libsoup/libsoup/CVE-2025-4948.patch       |  97 +++++++++
>>  .../libsoup/libsoup/CVE-2025-4969.patch       |  76 +++++++
>>  meta/recipes-support/libsoup/libsoup_3.0.7.bb |  12 ++
>>  26 files changed, 1380 insertions(+), 135 deletions(-)
>>  create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-27=
84.patch
>>  create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32=
050.patch
>>  create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32=
052.patch
>>  create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32=
053.patch
>>  create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32=
907.patch
>>  create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-44=
76.patch
>>  create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-46=
421.patch
>>  create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-49=
48.patch
>>  create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-49=
69.patch
>>  create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-2784.p=
atch
>>  create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32050.=
patch
>>  create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32051-=
1.patch
>>  create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32051-=
2.patch
>>  create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32052.=
patch
>>  create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32053.=
patch
>>  create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32907-=
1.patch
>>  create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32907-=
2.patch
>>  create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-4476.p=
atch
>>  create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-46421.=
patch
>>  create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-4948.p=
atch
>>  create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-4969.p=
atch
>>
>> --
>> 2.34.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#218553): https://lists.openembedded.org/g/openembedd=
ed-core/message/218553
>> Mute This Topic: https://lists.openembedded.org/mt/113619132/3620601
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [s=
teve@sakoman.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

