Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 439C8C54798
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 10:52:00 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web11.9486.1709031114045318137
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 02:51:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jCXLv0Ql;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2d27fef509eso35791161fa.3
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 02:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709031112; x=1709635912; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aiBm00Seyvv5j7rjtCFGlTOkizN4ZzRubovOpnGk1PM=;
        b=jCXLv0Ql5KfI48kGjbwOxs3A0tx6vZPM6k99dfQTOo/pnClZQj4QJEX8/jsH8zG2LQ
         EyBbk/mkM89fIZyXqqkbjdMERTmVgTzx54DNEuzoh4xpjZsYEtDlQ7iTiFCxCOsOCThP
         JDlZIBCbDFg1L9mEJnbkUSFpLgs3XKkAh1MgEDIy1tUj6IGuw6S1dyYgtSfHq2koy8tE
         xH6rpdcLqe0ZKRe6/BL9FC7AcZkHFxiU7ZOApoWnwu6NwjYCXp4rWYEs1idbgPxPVVEm
         T04gkWk5sn6hKxMTDe3jA7hlSujKYIZda+kOrv5I6yDswWxEbBmDwvi3UHBy3fToe7WT
         S7Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709031112; x=1709635912;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aiBm00Seyvv5j7rjtCFGlTOkizN4ZzRubovOpnGk1PM=;
        b=qMmFA5dEzE0fBtzj/GpLkiBwl4skbPJDHpF1zQM2Pe3blbDupJLFI3N4TzkcWr39EE
         cYhsoYiJ6mFnsIqXLFWXo46s7nKxjXB/hlG++NYTwJsZj7EyWF+NgJIU090vAbaSTJ+m
         65jm59cdUtHdJG8oGXZOIeYbmYNkXqMHSs0B6bBf6N0tDSUKaBaITeBXStGlCQwJDfxi
         zTPOZ9B2lgdJ3Sd02MwXdX7q0VmjLBl85tZbjpenZABsAL/vO4MZ5KfX3nIJJhpVuzlx
         /VndY4dkzBim+hGX8DIRuXxVqOMNdUEPqRoi8aErA4lD7fvYKr6r6RE0QkhBqxc0GzVJ
         rtQQ==
X-Gm-Message-State: AOJu0Yy8VWYnTDXEYEI3xlIr+MIbIyIyaFtD2eNZRi1+ZBGkrxpG9+UI
	SQS4IbfrNk0tVIJcwQ31YHGe/6TNv/sS4ABXOvPY0gr0k9sJafsTVCrj7C8YCVCdjZx1ruHPhk7
	2IzJqkXuYzZW33WlqHhXs1xmbnpfRCEqD0Uw=
X-Google-Smtp-Source: AGHT+IFRCJeP2DWRWtA/nDCkYHLwikzmvnY0D+/w+dnNFw2d9SJKeG4KlByptvcsYa+3emAx0IkMM4ndv9YUkmzcGJs=
X-Received: by 2002:a2e:9e4b:0:b0:2d2:642c:62d8 with SMTP id
 g11-20020a2e9e4b000000b002d2642c62d8mr5824254ljk.5.1709031111846; Tue, 27 Feb
 2024 02:51:51 -0800 (PST)
MIME-Version: 1.0
References: <20240227100709.1154-1-jose.quaresma@foundries.io>
 <17B7B05748A57C25.14830@lists.openembedded.org> <CANPvuRkPCgyBY43BH7S=azRCKum51NVk2ikQ4jwU9V6ezUQWGg@mail.gmail.com>
In-Reply-To: <CANPvuRkPCgyBY43BH7S=azRCKum51NVk2ikQ4jwU9V6ezUQWGg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 27 Feb 2024 11:51:40 +0100
Message-ID: <CANNYZj99yBvrCE+4U8d6V-n6Ex5Lh=SmNDx-aDM6p-FveHvH7Q@mail.gmail.com>
Subject: Re: [OE-core] [RFC OE-core][PATCH 3/3] goarch: disable dynamic
 linking globally
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 10:52:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196257

I was going to do that, but RP beat me to it:
https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6613

Alex

On Tue, 27 Feb 2024 at 11:13, Jose Quaresma <quaresma.jose@gmail.com> wrote=
:
>
> Hi,
>
> I would like to ask if this patchset could be exercised in the autobuilde=
r?
> I only got it working yesterday and today I'm going to do a more exhausti=
ve test.
> This is still missing the update to 1.22, which I'll do later, but testin=
g this would be a good help.
>
> Jose
>
> Jose Quaresma via lists.openembedded.org <quaresma.jose=3Dgmail.com@lists=
.openembedded.org> escreveu (ter=C3=A7a, 27/02/2024 =C3=A0(s) 10:07):
>>
>> With go-1.21 dynamic linking cause a runtime panic:
>>
>> | root@qemux86-64:~# go-helloworld
>> | panic: runtime error: index out of range [0] with length 0
>> |
>> | goroutine 1 [running]:
>> | flag.init()
>> |         /usr/lib/go/src/flag/flag.go:1199 +0xf9
>>
>> In my opinion, this would be a good trade-off so that we can update and
>> leave the version 1.20 for the next LTS 5.0 since we are already quite
>> behind on the version available upstream which already has the 1.22 avai=
lable.
>>
>> Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
>> ---
>>  meta/classes-recipe/goarch.bbclass | 14 +++++++-------
>>  1 file changed, 7 insertions(+), 7 deletions(-)
>>
>> diff --git a/meta/classes-recipe/goarch.bbclass b/meta/classes-recipe/go=
arch.bbclass
>> index 1ebe03864f..6899ec28e4 100644
>> --- a/meta/classes-recipe/goarch.bbclass
>> +++ b/meta/classes-recipe/goarch.bbclass
>> @@ -38,13 +38,13 @@ BASE_GOARM:armv5 =3D '5'
>>  # Go supports dynamic linking on a limited set of architectures.
>>  # See the supportsDynlink function in go/src/cmd/compile/internal/gc/ma=
in.go
>>  GO_DYNLINK =3D ""
>> -GO_DYNLINK:arm ?=3D "1"
>> -GO_DYNLINK:aarch64 ?=3D "1"
>> -GO_DYNLINK:x86 ?=3D "1"
>> -GO_DYNLINK:x86-64 ?=3D "1"
>> -GO_DYNLINK:powerpc64 ?=3D "1"
>> -GO_DYNLINK:powerpc64le ?=3D "1"
>> -GO_DYNLINK:class-native ?=3D ""
>> +GO_DYNLINK:arm =3D ""
>> +GO_DYNLINK:aarch64 =3D ""
>> +GO_DYNLINK:x86 =3D ""
>> +GO_DYNLINK:x86-64 =3D ""
>> +GO_DYNLINK:powerpc64 =3D ""
>> +GO_DYNLINK:powerpc64le =3D ""
>> +GO_DYNLINK:class-native =3D ""
>>  GO_DYNLINK:class-nativesdk =3D ""
>>
>>  # define here because everybody inherits this class
>> --
>> 2.44.0
>>
>>
>>
>>
>
>
> --
> Best regards,
>
> Jos=C3=A9 Quaresma
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196253): https://lists.openembedded.org/g/openembedde=
d-core/message/196253
> Mute This Topic: https://lists.openembedded.org/mt/104600118/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

