Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0D7DCD128A
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 02:52:48 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web11.29672.1711939966914818312
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Mar 2024 19:52:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=c5/rewk/;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.171, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-614555c384eso19932307b3.1
        for <openembedded-core@lists.openembedded.org>; Sun, 31 Mar 2024 19:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1711939966; x=1712544766; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IM04GjR9SUdh3bhmHGKaA1bA03rRhsMbpV8S8vc+az0=;
        b=c5/rewk/jm+HaZKV4GB+ZBJq1FF5IRL9FP60mjEuaAGgT6zHS60AzLeWwGYrbX7zdz
         +5S4p2tGr1XtJXTdF31wiuhZ4OjpYF2ssjQhu6I9NxvcxmdwsncrSN2ah9IHSTbUZ04l
         V7eQwBobqb5fC3rbe7A2kknxja/IimktyWNdJTVUjzpIiZp5OURJGBWEC746BJwbaskN
         VgZZYgUNkNmrSg9PWh/URABIW/lezj0kDkXCo1ddN85u/M+fk/9Ssij4ZFfwX2Vc9jVF
         yqa5p/6F86giGNXPO10IF65Ck13mt+svdtbxGH+KsWxgF/R6u+B2sy0r3tys6bnWBPo6
         9r2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711939966; x=1712544766;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IM04GjR9SUdh3bhmHGKaA1bA03rRhsMbpV8S8vc+az0=;
        b=TopXBVqoX4DZ/LLooSGJUfLbnlMMyrsTVs88SNVaPyZGL3TV0P5fkkXSHoHT91JBJj
         nPvKWeCcwdE8wDOFNfzV935no1zn4ll6dgTMrSgtW6nV6YOzFGIB2qYJ0k+/YDkrPeGQ
         2nbc2+sv2i/2Rd5j9E5AGwsaVcs0P870SMrTRueYoswYUerp7oO788JdI5SzWI13yBN3
         4whDOjiNhQ9sIQnBeF2kmMyjTfktCKBbooGGUFVJBOfVVd7YefMAzU3uCImVtrXb36hN
         Ayr0Z1Y+G+ZlXj3mfStdVJAp2XfWnS/Xg6XpHFhkLyrk58c9JYaQhFVwzWU0+XVl3y9F
         1Afg==
X-Forwarded-Encrypted: i=1; AJvYcCWsPsZ2MVwzU4yyVD2Cd361qTsNAfOwqk1BJUcGp2zfTS/TuZpfEuXVvUTA2KNSTPuHQe15SUMogj72LC2G6CMyQ0a6m5bfV6HPeTF0kevnJVC7jj8fjxnp
X-Gm-Message-State: AOJu0Yy8HEhX3Er0lYDGljalIYiPxE8A4RAC7ZenaqY77BW4RNppvNHR
	96FiQ9bt5etEDxk5IEM5g66iD9Fh24LA28/eypvbUYVXEAn7LPpQe/2zN98s3yaUUmSF6RRUp0Z
	FYqFfLeKXakoLa5+O9NaPgaUCLIGKrkDHof78sA==
X-Google-Smtp-Source: AGHT+IHetuqw6ICgltiQTdZOiGFeTABXFZ4vNGp/h4O0OC7WG+epqNd4vCURVWdORxB/aaAVRU0KIsZIdc13ATQy0KQ=
X-Received: by 2002:a0d:d493:0:b0:611:681f:8cd5 with SMTP id
 w141-20020a0dd493000000b00611681f8cd5mr7180271ywd.44.1711939965976; Sun, 31
 Mar 2024 19:52:45 -0700 (PDT)
MIME-Version: 1.0
References: <17C137F27040B581.32709@lists.openembedded.org>
 <CANQUz1_hPjw4kCpAG90Xc2O61p2EQgzWQH_DZ_DA2jq=UWpuOg@mail.gmail.com>
 <CAK6=ix7ifFeR+RXdR1mAzLQHoZL8ze84=QBn3-n8NWN3hDtHwQ@mail.gmail.com> <CANQUz19hBO63Edk+4wMCXF2RTF-UARs5LVa0Ud7oGZjD03SmOA@mail.gmail.com>
In-Reply-To: <CANQUz19hBO63Edk+4wMCXF2RTF-UARs5LVa0Ud7oGZjD03SmOA@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Sun, 31 Mar 2024 16:52:34 -1000
Message-ID: <CAOSpxdbA6wM9LR2CRwp4Qf96j9+Kd9fu6UNsLMJBh36p7yykug@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH] util-linux: Fix for CVE-2024-28085
To: Vijay Anusuri <vanusuri@mvista.com>
Cc: Randy MacLeod <rwmacleod@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 02:52:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197672

On Sun, Mar 31, 2024 at 3:50=E2=80=AFPM Vijay Anusuri <vanusuri@mvista.com>=
 wrote:
>
> Sure Randy.
>
> Issue introduced last year in util-linux v2.39.
>
> The offending commits are:
>
> * https://github.com/util-linux/util-linux/commit/8a7b8456d1dc0e7c
>    ("write: correctly handle wide characters")
> * https://github.com/util-linux/util-linux/commit/aa13246a1bf1be9e
>    ("wall: use fputs_careful()")
>
> I have added offending commits as dependency patches. As vulnerable code =
is not present, it's not affected. So, I want it to be ignored.

Ok, ignored it is :-)

Steve

>
> Thanks & Regards,
> Vijay
>
>
> On Sun, Mar 31, 2024 at 5:54=E2=80=AFAM Randy MacLeod <rwmacleod@gmail.co=
m> wrote:
>>
>>
>>
>> On Fri, Mar 29, 2024, 11:52 Vijay Anusuri via lists.openembedded.org <va=
nusuri=3Dmvista.com@lists.openembedded.org> wrote:
>>>
>>> Hi Steve,
>>>
>>> Please ignore this patch.
>>>
>>> Thanks & Regards,
>>> Vijay
>>
>>
>>
>> Hi Vijay,
>>
>> I expect that's fine with Steve but in the future, it would be good if, =
when you ask for a patch to be ignored, you briefly explain why you'd like =
it to be ignored.
>>
>> Randy
>>
>>

