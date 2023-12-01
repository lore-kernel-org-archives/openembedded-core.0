Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D679AC4167B
	for <webhook@archiver.kernel.org>; Fri,  1 Dec 2023 22:59:12 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web10.6751.1701471544344768488
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Dec 2023 14:59:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=HJ/SAAGk;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.41, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-54bfd4546fbso3158068a12.1
        for <openembedded-core@lists.openembedded.org>; Fri, 01 Dec 2023 14:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1701471542; x=1702076342; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ReFNysPijVoUGR7q/l2Mh/5Tf/P6HHO+3oK1U7dpu0=;
        b=HJ/SAAGkDHpv3D3EsB9JJVUIW2K9d8tKfj2/9dqK4at5xsxYWgM5QnPsV/NlgJxhgS
         Tu34k7EmxQhRn/LB4g6FpFAcHnpUZ1mfmFW4CL41KqNAKTKI/hA/pigWgTA68Ls4dfmh
         irXxDwSNCbiN9QC2IYIoH+0MwJ3Aw2dsbDIwSUImCMwGEMvFGVG6hGYfiYy0XQcLBOIe
         T0joDG3UDhDctWXf3Vf6ZImGJ0mk9NpIZreSMtNEY5N0d9ilsUV44irj1WpmFknQEYKC
         1Ve93IpyJh1/8PMpzw932S9YPM3qBcQa6+WEVL5ofhu4YBvN1TX+tErkFqbQyllIRkSo
         +YWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701471542; x=1702076342;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2ReFNysPijVoUGR7q/l2Mh/5Tf/P6HHO+3oK1U7dpu0=;
        b=nK09RuV2o2EvMmJZ5SyEpKFeljmoiLGa7uTWDQLCXYm10GzShrtoFq0GuLK3BT+GoS
         qKau15It77kccJm0pkWsqrlKRMsfom1t7rXipDoKokVZWa5YHJ+2qo6vcTUM3IkZxv6w
         aguVaYaumzIoLFZv+TGGq6/CJg3ktVRKxaoAXXxf22ADCBf2q1vI0Bt8CEKPDl/cyJjW
         yzjC0rEw35Mel7KulQLHTyP/gzT70vpNmegoJ+wh8B2z2FLZTFdyxVnOE3Q8sSv9OBd7
         GtF1PwD5hiUdRx52KcxO44FLJyO8tzwGFgb4U8uZKwp9JRi+Ogm0Flyy+/UB/3uroiV9
         KxcA==
X-Gm-Message-State: AOJu0YxJmQdqB2wfTh9LGfaiOXCyXJ/xyD7qdhUFxioG/7kuy9mE8Ig+
	8H/n1ZOQt6SyEouDtPaNjZQz7qXT7Ao6wZVXFvJ77g==
X-Google-Smtp-Source: AGHT+IGtHIc5n8Pv+zoS8Vq45qHeFQhx7vY8z2kh14L5mBPhWMfpXk+j9zXtf24JtiqGjmHKX613ukCHfNOFvJPvbOw=
X-Received: by 2002:a17:906:d975:b0:9e2:c2a6:5c86 with SMTP id
 rp21-20020a170906d97500b009e2c2a65c86mr1310723ejb.35.1701471542536; Fri, 01
 Dec 2023 14:59:02 -0800 (PST)
MIME-Version: 1.0
References: <A7916E6D-62A0-482A-B8D2-036D2A11CE8F@arm.com> <5820.1701361256178996822@lists.openembedded.org>
In-Reply-To: <5820.1701361256178996822@lists.openembedded.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 1 Dec 2023 12:58:51 -1000
Message-ID: <CAOSpxdYnuf0Tu7SrMCoWJzWBmsAtuWPbVQfY6GJr0u5BE9XLuQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] image-live: Add support for building
 EFI-bootable ISO images for non-x86-based archs
To: Andrey Popov <andrey.popov@yadro.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Dec 2023 22:59:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191692

On Thu, Nov 30, 2023 at 6:20=E2=80=AFAM Andrey Popov <andrey.popov@yadro.co=
m> wrote:
>
> Hello, Ross, Steve!
>
> Would it be possible to apply backported patch to kirkstone branch if upd=
ated patch actually lands for master?

Since it is a new feature, no it couldn't be taken for a stable branch.

Steve

> Best regards, Andrey.
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#191514): https://lists.openembedded.org/g/openembedde=
d-core/message/191514
> Mute This Topic: https://lists.openembedded.org/mt/102444305/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

