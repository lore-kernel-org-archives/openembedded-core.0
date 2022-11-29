Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB45FC4332F
	for <webhook@archiver.kernel.org>; Tue, 29 Nov 2022 18:30:39 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.158912.1669746637131004652
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Nov 2022 10:30:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YxUVUvaZ;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id d6so23379389lfs.10
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Nov 2022 10:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V28yK8a6s3GTXmqZf0rgc4YxGBuPYHKdR0uDOvrXEeY=;
        b=YxUVUvaZkjcC+k4JcXPslFww6f8EauZowNkvCOWQlHOV37T8KbpeppCDTrfsts65cN
         5QAeSdDYtt2PK2fbTIyGXMiX73Ohy3a2XYcuVsiOYSmnURF6iBPuMoOt0w2Osb5AmPYs
         iUmkvAi/QizdGw3XsEctRmzAquF8D47bqslHnJL+F4qKaztREcIvkmY3p4jG+8Bzq+1p
         FB2n168f6z6udJOb0RUCRwoaAIA6Mq4tenH/+55ceOBj8fCCA+W+fDZPMSqS2iT3IQvi
         AjBfwnjHicJFJNG3e9og7emrLSf6R0SPsZ1JppozOnFxOxIhHa6t4hJxaVaFoqsPByX7
         xWyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V28yK8a6s3GTXmqZf0rgc4YxGBuPYHKdR0uDOvrXEeY=;
        b=7UQaw/GqrizM8xJtXW29zwMXkusiOvG8ps9No8Z0B67wKEYp2S2u2wht3uzY78Hjdc
         QqzWACJHrV4/+/DtRx6H5KjQPDEvVRGTsM8n1icjTzmYDqq3+90aVTKytNzLM4+wc+8r
         8xztvXJne6nz+FIoBUT2Q5Opi91uAgLnpGu9Z4nk7pjZ9gsDxEUgDZ1h+t53Svdqt6be
         3H3KabfOsnjk6ClPhHlbtmndqg3rSON7I0XH9R1/xZcIannoTFzuIQWvuMIBQB/OOgJ9
         i3OBWKGqVtS7HAzCpkL+LSdxA56WEeNfU1y2tDNeYPdcZHQIloJw6zt0q9BukbPuHiI7
         BvEw==
X-Gm-Message-State: ANoB5pmwIeD5MpUzHn7tZC60Rnpq+/zaf63TnpHRNCFfkympMU/G0dVN
	q0KzRrUOy1xEhSj76FYylxVQrcvgCdn9I49WLOU=
X-Google-Smtp-Source: AA0mqf7nBC3BSdgeco1XZ7mzV9p0iamYqF550c3ANKYvvXUZNEq4yrZRlRWi3E1KEdiJGPK424NMMn+IZWkNW/5jYco=
X-Received: by 2002:ac2:4a62:0:b0:4aa:323f:e850 with SMTP id
 q2-20020ac24a62000000b004aa323fe850mr19585700lfp.492.1669746635257; Tue, 29
 Nov 2022 10:30:35 -0800 (PST)
MIME-Version: 1.0
References: <20221129132220.6357-1-f_l_k@t-online.de> <20221129132220.6357-2-f_l_k@t-online.de>
 <F7525B10-17D1-43C6-B2AF-DF5BAEE11246@arm.com> <CANNYZj9XvDiuZiUgKmEJcvHX_U7Q4KmH93GFGtH-N8FxqEn=GA@mail.gmail.com>
 <16D4E649-B4FA-4E57-A7F4-853FD7057141@arm.com> <172C1CE774901751.11309@lists.openembedded.org>
In-Reply-To: <172C1CE774901751.11309@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 29 Nov 2022 19:30:23 +0100
Message-ID: <CANNYZj8ox-CCKTgtE0HmOOHcosT3Z-ANVv4SUbV_W1nMTLbZtg@mail.gmail.com>
Subject: Re: [oe-core][PATCHv7 2/2] gcr: add recipe for gcr-4, needed to build
 with gtk4
To: alex.kanavin@gmail.com
Cc: Ross Burton <Ross.Burton@arm.com>, Markus Volk <f_l_k@t-online.de>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Nov 2022 18:30:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173986

I need to add: gtk4 has been in meta-gnome for over a year, and
already has over 20 consumers in there. So it has received plenty of
testing.

Gtk4 has always been intended for core, it's just that epiphany and
webkit are late to the party (and sato will likely never show up).

Alex

On Tue, 29 Nov 2022 at 18:02, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org>
wrote:
>
> It=E2=80=99s going to be tested in world builds against gcr 4.x. For me t=
hat=E2=80=99s good enough.
>
> Alex
>
> On Tue 29. Nov 2022 at 17.55, Ross Burton <Ross.Burton@arm.com> wrote:
>>
>> > On 29 Nov 2022, at 16:01, Alexander Kanavin <alex.kanavin@gmail.com> w=
rote:
>> >
>> > Epiphany has moved to gtk4 in master. This makes us prepared for that.
>> > https://github.com/GNOME/epiphany/blob/master/meson.build
>>
>> I=E2=80=99d say the recipe should sit in meta-gnome until it can be reas=
onably tested as part of oe-core.
>>
>> Adding recipes that don=E2=80=99t get tested in any meaningful sense isn=
=E2=80=99t helpful.
>>
>> Ross
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#173984): https://lists.openembedded.org/g/openembedde=
d-core/message/173984
> Mute This Topic: https://lists.openembedded.org/mt/95333761/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

