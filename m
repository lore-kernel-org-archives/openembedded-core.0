Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30B43C83F11
	for <webhook@archiver.kernel.org>; Mon, 28 Aug 2023 15:58:50 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web11.18169.1693238321578121701
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Aug 2023 08:58:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=uqXQZvcR;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.43, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-9a21b6d105cso432291966b.3
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Aug 2023 08:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1693238320; x=1693843120;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SwXU9AfUgODhvyETS3CWFxKgvn//dbwrAwCcVzNW5OY=;
        b=uqXQZvcRIE/nZq1Be5vmSEHKKEYpskuoSWyrFLnsJ11T98tMOkmOOMgmCXkqzwGvwu
         sbMEBTQOfa3Nqk+GDlyqMDv5RPJVt6Y4WqwIz222i9/xmgX5pKrJCcSaRnm9yXT4cxm5
         aH96bcwfZTwbAaPgol/xJCeqvZMWVKv1JLC0VgAIYpEZte8FEWLJQwLnSaWRYBk5Vc0U
         v2XXepVYR2VOUGShgtZkeLoPLkH06+x/dgsGGtZ2B+umkkzEgXFLZVMCxPOhdlYGKIIo
         oSrrOG0zIMD9NuxvpiRse7pGdAQD6iiIjW5hYCFTBkG0qFnGQ34ueUfu88wlJpn6gxlJ
         KPTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693238320; x=1693843120;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SwXU9AfUgODhvyETS3CWFxKgvn//dbwrAwCcVzNW5OY=;
        b=kuQobQHENlGucWY6PYR6bXwQiP3xCdD9wPtJxDzMecq7a19B5cVbIpDx9NlBm1pOgZ
         sOGmYxMHSrY91sk0v+7f5D/B1YjVMd1MUl3WBXR9YHx5BDFXbB/f4U02HQWNhQ6D6h32
         LXSEZI+IJjC+vbuy+ZtnZVuPFFw/kD9sN49IZBtn/GEGXbVjFWQu17c0Td3CM+qUYN9r
         QdV4H+gN9YYK5Oz/XFCEBDtDlM4ICaoQy5GRuwXlJm9Zot8Wq2ho0qj4p5R1Oe3QD8Ob
         pG4k5CrFcNzzkKnt/1s79d5c/8TWRzSM8agYuIqLitzujBJl7P8cW6aCTb8L+4ZAhnJc
         ohbQ==
X-Gm-Message-State: AOJu0YyPXJdMXtec2zFT0Fg0zfD1sDFZADcS9WxIqJ6f8YyUmoh6LXue
	1/abiichLNyj1Sj+Zel7krjiyauKPHOGamxJxU1q/Q==
X-Google-Smtp-Source: AGHT+IFdnKgTJXppOxHVXxI5Rrnpe8vuk6dgt5AEXr3+f2+U2OTmcows1nHwF0PXns9RZyFBi4lHoa58REGov0qe00g=
X-Received: by 2002:a17:906:259:b0:9a4:ea7a:d0b0 with SMTP id
 25-20020a170906025900b009a4ea7ad0b0mr7904992ejl.2.1693238319717; Mon, 28 Aug
 2023 08:58:39 -0700 (PDT)
MIME-Version: 1.0
References: <17770DD987E9D871.7893@lists.openembedded.org> <CA+chaQd5F63Lj9fPVWgh84xOhNjV97nKqk7kwCkt76RUOyhTog@mail.gmail.com>
In-Reply-To: <CA+chaQd5F63Lj9fPVWgh84xOhNjV97nKqk7kwCkt76RUOyhTog@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 28 Aug 2023 05:58:28 -1000
Message-ID: <CAOSpxdaSPwJHqH8=oUvQLaKb3MuRW6A-G0iz7fkDGCuTqh_+SQ@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH] efivar: backport 5 patches to fix
 build with gold
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Aug 2023 15:58:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186835

On Mon, Aug 28, 2023 at 4:38=E2=80=AFAM Martin Jansa <martin.jansa@gmail.co=
m> wrote:
>
> On Mon, Jul 31, 2023 at 10:30=E2=80=AFPM Martin Jansa via lists.openembed=
ded.org <Martin.Jansa=3Dgmail.com@lists.openembedded.org> wrote:
>>
>> * LDFLAGS +=3D "-fuse-ld=3Dbfd" in the recipe doesn't work and
>>   it still fails to build with ld-is-gold in DISTRO_FEATURES
>>
>>   removal of this line sent to master in:
>>   https://lists.openembedded.org/g/openembedded-core/message/185167
>>
>> * the most important ones are the 1st which removes --add-needed
>>   and the last which removes src/include/workarounds.mk completely
>>   while 2-4 patches just update src/include/workarounds.mk for the
>>   last one to apply cleanly
>>
>> * alternatively we can bump SRCREV to latest 38 as master did in:
>>   https://git.openembedded.org/openembedded-core/commit/?id=3D4df808c616=
f847d90203582fd950a49bb8360dd0
>>   which brings 23 commits, but instead of adding 5 more patches
>>   allows to remove 5
>
>
> Steve: this should be OK to backport, unless you want me to send backport=
 of above minor upgrade instead.

Thanks Martin!  I took this patch into my test queue.

Steve

