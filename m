Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BFB1C47DB3
	for <webhook@archiver.kernel.org>; Mon, 29 Jan 2024 18:17:16 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
 by mx.groups.io with SMTP id smtpd.web11.2224.1706552233065688692
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jan 2024 10:17:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jRq693yi;
 spf=pass (domain: gmail.com, ip: 209.85.160.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-20536d5c5c7so1893440fac.2
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jan 2024 10:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706552232; x=1707157032; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cMVKAHpBQDibwpnBXaiIauSQZdh/tHmLQAINr0ZCvhA=;
        b=jRq693yihBzDhu9Xkf0XuWOJEZhV2qph8roLRk4E0JjYoYBe0hzXmjfSBI0NGLtUe9
         tzP0A2m9cixVAkNkWR8dEAjadDdEPmBMJtm/YlelKS8OJLMZycq39tIKM0ekUmfLXTHb
         0aWBhK0oonrhb+A8x8vQ1O7x+U25/SBqnU8VzXK5CcrhW1o2ISHfoDpgH1ZauA4rZqLR
         d2BLlj7HuH/itqq/txL+FFOMEhHn3JAnjgiaMG/GM7EUeBMrSOU8osA2T3t9mJCsYGr/
         hJf7FE9rYmG3Q+1el1TCjsASE7GAwlarjzlwPKi0uQJWqouOIRz5DRu2m1nXqlXHxtW0
         tVYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706552232; x=1707157032;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cMVKAHpBQDibwpnBXaiIauSQZdh/tHmLQAINr0ZCvhA=;
        b=QKFeXyu9K+jLEURrW1yXl0FxatAaJr4y8Z1GFJc90wx935CapffyrWeLP+d6kJQ1iV
         2se7pI7Qrzc8e4bnH3AEhxNhnZUCi5LzzQkRPGCu1g97M4hWJUw8P5MBUCAcu29VsZdG
         /UL8sCxZx5fTZH9ERhc28GOh+zlljCIFWZVzmKsgdoxOEinE8p381ofC7atZkG4lZlhb
         Vl99YhtF6lnKXdd+kDn59jgX8YMKndiEcYwFZpT81pG8kBl9Pav7fFd+7FDG5/H4DCil
         q4KTKQ/iR6VYbzyAXggvVSRiTbQz7K/KVLtb9TR5QpTewnsnceIShzaQTTstoQfgQYiX
         ngQQ==
X-Gm-Message-State: AOJu0Yzt5jz8ns5wGrJOZh5KPbBZlPDN0lRZHQ2bl8bXniWT78OYZDnP
	/WJ2Q6c7Ejab4X+SgyaZXxkfnpJ0XgCqvY47wXwcwlUYfoLTSj+n3+DQF+Um5XEQai4zm0pH1PB
	kp259GmgM+Vwhp2p8GMU51NpIR+Gn/+B5Kp8=
X-Google-Smtp-Source: AGHT+IFNvWDwkpn68ZbZbr1yIWruCYsshd2sU4exB+P5EPAvGFJ1Go8FOIJpBXby1n21PmKaxyUaQJWZoA/5QKqVGAo=
X-Received: by 2002:a05:6870:8608:b0:214:e3ce:83b6 with SMTP id
 h8-20020a056870860800b00214e3ce83b6mr3511472oal.8.1706552232222; Mon, 29 Jan
 2024 10:17:12 -0800 (PST)
MIME-Version: 1.0
References: <20240129162615.3724802-1-matt@madison.systems>
 <CAMKF1sqfi=O0Bw26Wj3bsx=aUWe2thHw7Jt1_nzsxttD6NwNmQ@mail.gmail.com> <CAGgRHJrfSuW84beU_VgyHLBVydHg_OSxXZ6XvHH6U6FRpA6QxQ@mail.gmail.com>
In-Reply-To: <CAGgRHJrfSuW84beU_VgyHLBVydHg_OSxXZ6XvHH6U6FRpA6QxQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 29 Jan 2024 10:16:46 -0800
Message-ID: <CAMKF1sqys=LvpvLLE2G85LP+GNDDXRA9LiO=DfHELhAu7pHUDw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH][pseudo] ports/linux: add wrapper for statvfs64
To: Matt Madison <matt@madison.systems>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jan 2024 18:17:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194475

On Mon, Jan 29, 2024 at 10:03=E2=80=AFAM Matt Madison <matt@madison.systems=
> wrote:
>
> Should be covered by the same conditional - the guts are in the same dire=
ctory.
>

right seems so. Thanks it looks ok now

> -M
>
> On Mon, Jan 29, 2024 at 8:48=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wro=
te:
>>
>>
>>
>> On Mon, Jan 29, 2024 at 8:26=E2=80=AFAM Matt Madison <matt@madison.syste=
ms> wrote:
>>>
>>> rpm 4.19 now builds with LFS64 support enabled by default,
>>> so it calls statvfs64() to get the space available on the
>>> filesystem it is installing packages into.  Add a wrapper
>>> for this call so the right filesystem is used.
>>>
>>> Signed-off-by: Matt Madison <matt@madison.systems>
>>> ---
>>>  ports/linux/statvfs/guts/statvfs64.c | 15 +++++++++++++++
>>>  ports/linux/statvfs/wrapfuncs.in     |  1 +
>>>  2 files changed, 16 insertions(+)
>>>  create mode 100644 ports/linux/statvfs/guts/statvfs64.c
>>>
>>> diff --git a/ports/linux/statvfs/guts/statvfs64.c b/ports/linux/statvfs=
/guts/statvfs64.c
>>> new file mode 100644
>>> index 0000000..856d3db
>>> --- /dev/null
>>> +++ b/ports/linux/statvfs/guts/statvfs64.c
>>> @@ -0,0 +1,15 @@
>>> +/*
>>> + * Copyright (c) 2018 Wind River Systems; see
>>> + * guts/COPYRIGHT for information.
>>> + *
>>> + * SPDX-License-Identifier: LGPL-2.1-only
>>> + *
>>> + * int statvfs64(const char *path, struct statvfs64 *buf)
>>> + *     int rc =3D -1;
>>> + */
>>> +
>>> +       rc =3D real_statvfs64(path, buf);
>>> +
>>> +/*     return rc;
>>> + * }
>>> + */
>>> diff --git a/ports/linux/statvfs/wrapfuncs.in b/ports/linux/statvfs/wra=
pfuncs.in
>>> index 1afb64d..6a59660 100644
>>> --- a/ports/linux/statvfs/wrapfuncs.in
>>> +++ b/ports/linux/statvfs/wrapfuncs.in
>>> @@ -1 +1,2 @@
>>>  int statvfs(const char *path, struct statvfs *buf);
>>> +int statvfs64(const char *path, struct statvfs64 *buf);
>>
>>
>> Statvfs is under a conditional I wonder if this should be too
>>>
>>>
>>> --
>>> 2.34.1
>>>
>>>
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#194464): https://lists.openembedded.org/g/openembed=
ded-core/message/194464
>>> Mute This Topic: https://lists.openembedded.org/mt/104034596/1997914
>>> Group Owner: openembedded-core+owner@lists.openembedded.org
>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
raj.khem@gmail.com]
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>

