Return-Path: <geoffrey.giry@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90F8AC74A5B
	for <webhook@archiver.kernel.org>; Wed, 29 Mar 2023 13:31:15 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web10.24580.1680096672735491229
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Mar 2023 06:31:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20210112.gappssmtp.com header.s=20210112 header.b=RXXn9Yva;
 spf=pass (domain: smile.fr, ip: 209.85.208.41, mailfrom: geoffrey.giry@smile.fr)
Received: by mail-ed1-f41.google.com with SMTP id b20so63388636edd.1
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Mar 2023 06:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20210112.gappssmtp.com; s=20210112; t=1680096671;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gO+fkga2+vrhd1S7wNVg/Rmayq6zjrT3cGiLCn3NB3U=;
        b=RXXn9Yvaqx56rXyT5LlB/tsM6SVUkRMjQhKfSOZ0phqoPKqXuTGsbjXpklUTyUCSk3
         ZHmJvMgGEMHnWj5xEI8Os8ycB74zgoi5k6QW15+1Y2JkBTVuQHrylc3X6cRsFO0D1dp7
         gXeFIeTCuJwVIAwRGV/64mt8dBXeNZJf/5bnome7ihiYMOzq1StFNf2ay6Uh8UYdKds9
         ciU4a1Q5hIXh/CXQ34/K/fFaZYpfbCkIb3W6gS1GK//+Ek10wRA5di35+PSOkaroRJNL
         7NqvXxB8F02atdhXpzQTNBwTuiL40lj4oY6FzNVKnZFKcWc6An03gAiHJzAEMYZzuzRd
         NNIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680096671;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gO+fkga2+vrhd1S7wNVg/Rmayq6zjrT3cGiLCn3NB3U=;
        b=KUCySy3v7MSJo1Uxm7o9LmEFNMe2w9zaS3l8IkkjWmonhqeeJQ0PfFswTuB638iLIl
         NnPnTdsFCtmQATVh+6tnx2zJyBTB5QoFy0Czy3i3hGqqoiq1hrVGjrbipTwrFM3PZHC1
         gC1WP8LKHWjJRb+/Jg8YHjsUO1H5f1pbe1UZg1LN/YrtSR71dNXDBlF2h04eTm+Y8Cay
         pHSbKwyf4gGEdfEqWx+ik6iJX5/PfAMmT8SLNHtUYmDZMwjhXU4e5NuXBRhsi6Sa7vNl
         c6WAD0MpdweMkzFPYgOGMe4XtMVZedgRvC4IDrdTj3YSYMuqJEVfSX0eZgUbLBUUB1Wx
         rqNA==
X-Gm-Message-State: AAQBX9ctuRlT4pUvubjGGfwyxw4b095n8urv6OnMSJY1bFvDWMePC/9B
	fsWc6mLe4KLaaXTvWlcyZubdqmELI5RTpvTHfpQO4A==
X-Google-Smtp-Source: AKy350aVzQxW9Rs/ND+GhhxI+tTE9vdiQEZJ9tRlF7Z/QVl4Av3I4hK8x8+HL6rI5rkGcMEhXHBUcuWlAdSCCQo0jP0=
X-Received: by 2002:a17:907:3e8b:b0:931:ce20:db6e with SMTP id
 hs11-20020a1709073e8b00b00931ce20db6emr10827514ejc.2.1680096670886; Wed, 29
 Mar 2023 06:31:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230328102349.57990-1-geoffrey.giry@smile.fr> <CAApg2=TD8PtdUxmLT7wOqRG-7O9zEaEKt0n47mRuRX_yvr1T=A@mail.gmail.com>
In-Reply-To: <CAApg2=TD8PtdUxmLT7wOqRG-7O9zEaEKt0n47mRuRX_yvr1T=A@mail.gmail.com>
From: Geoffrey GIRY <geoffrey.giry@smile.fr>
Date: Wed, 29 Mar 2023 15:30:58 +0200
Message-ID: <CAGwXbzZN_FXowS4QvFKxEW-a3_voTT3J6HZDjjg1P=ZEASFKkw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] Fix cve-check false negative
To: Marta Rybczynska <rybczynska@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Yoann CONGAL <yoann.congal@smile.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Mar 2023 13:31:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179279

Hello Marta,

We only tested core-image-minimal and some recipes that use the update
and release candidate formats (pX and -rcX)

Geoffrey GIRY
SMILE ECS - R&D Engineer

Le mer. 29 mars 2023 =C3=A0 06:45, Marta Rybczynska <rybczynska@gmail.com> =
a =C3=A9crit :
>
> On Tue, Mar 28, 2023 at 12:24=E2=80=AFPM Geoffrey GIRY <geoffrey.giry@smi=
le.fr> wrote:
>>
>> Fixes [YOCTO #14127]
>>
>> NVD DB store version and update in the same value, separated by '_'.
>> The proposed patch check if the version from NVD DB contains a "_",
>> ie 9.2.0_p1 is convert to 9.2.0p1 before version comparison.
>>
>
> Thank you for the patch. Which layers (and world builds) have you verifie=
d it with?
> I'm asking because versioning is always a complicated problems with frequ=
ent exceptions to all "rules".
>
> Kind regards,
> Marta

