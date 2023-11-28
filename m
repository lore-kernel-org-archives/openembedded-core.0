Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38023C4167B
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 22:12:57 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web10.5850.1701209571627054029
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Nov 2023 14:12:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=cQAMo2TE;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.173, mailfrom: steve@sakoman.com)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2c4fdf94666so75456881fa.2
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 14:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1701209570; x=1701814370; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kqRWA1eSl6tIedcznxmuSYIc9V8oNLTJ+biy690qjAo=;
        b=cQAMo2TET28Lj5Un/vBHw3eho53BWK0MUHNJWc3Aj8gWv9tzOYGNapRNzahe882PS4
         MXAa9g8NPpc8j4gc01tuGZmFLSJUIvCIkbHm3H0xd41RJcQLwxSfLLOcUmoCsUvpFeoW
         /JjfHAzKDXVsAehanIKHcVWNIavTxV3PwO1vA9Tr/ccXf18Ne7N0R5+Py5tekgPNFAot
         Z0VsWsUBBhE1fDy9D6mriVSPDRDrpvb/flGMeNfoc4HuHcttrxWCpVcdgnT7sfKVLhc3
         mEqQxQbzoL6Y5UeQISg9zflKYeC8M/8cNQEh1CzNd8iISc6m7XYF59lrnr2FXqh1ZBqw
         LRjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701209570; x=1701814370;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kqRWA1eSl6tIedcznxmuSYIc9V8oNLTJ+biy690qjAo=;
        b=LPGsREEwUMOPkWnsD8Whq6Gbo2DDNLMwVu+7XFmVqayrSAqW1LlAI9CTLNbNmRhmYb
         3dFbhF7B2Wbm8luhCNx4T1AZpDE74c2k+3n9fyXuwM2eswPyrY4HLRaY5TwxjdTq+wsv
         l5GtqvBKgegJ0f4opxWgJmAVZoa6wVQvpGyJSmVsnXHh4Tz4Y1zDQV+N6kM3AwNNc6mv
         mO9W7OAugesuJLPrciDvHPTvIo9pSVlgjdSQvSe8EJWZwOE5ahuizyB1sh/gY9jpeHqH
         hO8NAPhTGsXINwXX5SFaXcfMCOYwJ1OaBfqprjG6IlNDEt356u842QU1UfXFJ5ckYYUh
         k0fQ==
X-Gm-Message-State: AOJu0YxWApgehc/SmeSsnArw5M+qdSWL4nzgxcdsE7n29zzhu7s4QhJJ
	9aLLHv0d2yDU0OEfA/+ndTe9T8LrP55MHGtdKU+D4zWqcXXQsX9t5zDkVA==
X-Google-Smtp-Source: AGHT+IGztcZbP9U5Pfh0tnuVQylvz3yMQHMpVUeZc7GaC4L8w9VOHKODBctkaAFx/gvP3PX38CLWBMVNW1F3pQfaaM4=
X-Received: by 2002:a2e:780f:0:b0:2c9:b88c:e3a7 with SMTP id
 t15-20020a2e780f000000b002c9b88ce3a7mr1890337ljc.25.1701209569717; Tue, 28
 Nov 2023 14:12:49 -0800 (PST)
MIME-Version: 1.0
References: <20230330060328.8654-2-badganchipv@gmail.com> <9575.1701068123696259232@lists.openembedded.org>
In-Reply-To: <9575.1701068123696259232@lists.openembedded.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 28 Nov 2023 12:12:38 -1000
Message-ID: <CAOSpxdaAckmwnE_sASYVmMOZN2jb4-JqQ=yKN9mDMo7SiGOfiQ@mail.gmail.com>
Subject: Re: [OE-core] [meta][kirkstone][PATCH 2/2] rsync: Turn on
 -pedantic-errors at the end of 'configure'
To: Pawan Badganchi <badganchipv@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 22:12:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191388

On Sun, Nov 26, 2023 at 8:55=E2=80=AFPM Pawan Badganchi <badganchipv@gmail.=
com> wrote:
>
> Hi,
>
> Could you please take this change.

This also has been in kirkstone since April:

https://git.yoctoproject.org/poky/commit/?h=3Dkirkstone&id=3De628a4494da515=
096cddbd0b65298e3af8cd42ed

Steve

> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#191255): https://lists.openembedded.org/g/openembedde=
d-core/message/191255
> Mute This Topic: https://lists.openembedded.org/mt/97945091/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

