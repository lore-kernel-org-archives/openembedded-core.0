Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1B9DC4167B
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 15:28:13 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web11.75063.1701358085809574409
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Nov 2023 07:28:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Nf9evNVS;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.47, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-54c11430624so1110066a12.1
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 07:28:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1701358084; x=1701962884; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gLbIHlCWhRPBVvfbYsVh0Z9ARHXr0xsAdKyRfQR4PSY=;
        b=Nf9evNVSkW/qImGfFzBDTThdAwzKha8NVQQTLgpHPWgBMbWSpTH41G8beNsaLDfK66
         Skhj7ORvu78+SzRz3FuMgqI/kGDp/UFgeIskYSXfP0zKXCvIY75hPmzN7XSAPJal+yCl
         /G7d81hhVvMB6WS/j12SAIn3/55CK5CKVt0b0ws8RzS+DDmaH2+EmPPafx2qtGDvIRG9
         zBLeO8jbW9MfMIds+FX0xM6CX+PlfW1FB5dGV0KqxDN0BEpTcoYTa3L0nQWa2Mue4WAH
         4mHJclCUM6bl9FuScjSA+dXASSe+IDdBBH8PKSHKlpHWGp0p2Z3cqwW6PzkvJmbCufRk
         NXqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701358084; x=1701962884;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gLbIHlCWhRPBVvfbYsVh0Z9ARHXr0xsAdKyRfQR4PSY=;
        b=od/uALiWxZ7QayYRZWLk0sUB04EDXEh1HLZMUrNg/l8BdHEpNzu3A5gsUP0vJFbTgp
         XEPKsZn1DGgCpHzsgoTqpRKgTUvWtY8pTpY0gNWs5h7baM7iKHZtmPfbWIjSekR7pLEU
         XEuqeZciC/Z5e8UnCKlIq9fPDGy9u/xxNWStn9aNKB3wpjUXeGOYKxBotFci+H2vfPdq
         W/9hkcexgaxRe94KhwsCHUiqq5YQWOu7shESuKpPSfC62/7vmwBTrjnWb0J2j6txr0y+
         OxFUvBjfI6REzX9mSHL70/I2qh+MLQHV7sMTo8TczvGZA6IeIQLnbWcypzhNdGpruw1X
         C4Xg==
X-Gm-Message-State: AOJu0YyNGVYElKAgceBKb0nci4ibl5EVNyom97qXRxCczVqhru2V15Kt
	nJP1/NNJlrL0SaNvRnhNarck5zdLJWth9WLiWlxzVw==
X-Google-Smtp-Source: AGHT+IHTHcFHkmEnYh9Iy0nPjT/7mi4i5Lms5oxTF6omqTifOhu8LeYEYEa8cmNTI8cUNpiKZLSeP+SY8NQEQnslSpg=
X-Received: by 2002:a17:906:b810:b0:a04:eac3:2812 with SMTP id
 dv16-20020a170906b81000b00a04eac32812mr22411928ejb.26.1701358083717; Thu, 30
 Nov 2023 07:28:03 -0800 (PST)
MIME-Version: 1.0
References: <CCD6EA53-BA66-4547-AA4A-2CAC0387D934@arm.com> <5820.1701278764780793764@lists.openembedded.org>
In-Reply-To: <5820.1701278764780793764@lists.openembedded.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 30 Nov 2023 05:27:52 -1000
Message-ID: <CAOSpxdYyDGRD_w4=uokdLZ6MyM23TrnSD_J6zSGM_aeq1cFEaw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] image-live: Add support for building
 EFI-bootable ISO images for non-x86-based archs
To: Andrey Popov <andrey.popov@yadro.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 15:28:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191510

On Wed, Nov 29, 2023 at 7:26=E2=80=AFAM Andrey Popov <andrey.popov@yadro.co=
m> wrote:
>
> Hello, Ross!
>
> Since it's no longer possible to use xorriso in recent versions, I would =
like to ask if it's possible to apply an updated version of this patch to t=
he kirkstone branch.
> If so, I will send the new version matching that branch.

Since this adds a new feature it isn't something that I can take for kirkst=
one.

Steve

>
> Best regards, Andrey.
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#191459): https://lists.openembedded.org/g/openembedde=
d-core/message/191459
> Mute This Topic: https://lists.openembedded.org/mt/102444305/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

