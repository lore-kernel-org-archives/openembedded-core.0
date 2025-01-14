Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A8D7E77188
	for <webhook@archiver.kernel.org>; Tue, 14 Jan 2025 15:57:16 +0000 (UTC)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
 by mx.groups.io with SMTP id smtpd.web10.48752.1736870228589835112
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jan 2025 07:57:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=XA9DCM/n;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.181, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e549dd7201cso10206621276.0
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Jan 2025 07:57:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1736870228; x=1737475028; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l30tzmQq3mltbu02dOh/FAPL80W0+jhIoe4pcDp7qvA=;
        b=XA9DCM/nx2ibZeeL1mUIIrJTHpCJdErXWPYd/gJi82l3fy9zcNZDPp58gui/S91akB
         sxUcDE5tbrkSa+vQdlsCxWIdivxIBFQphUX27HHTPKSP+VpbXSbwLeGhYcanbZNW3+hc
         g3y8KbydweUeM2CoL0LZM1bpDOJjpZLP7DbCQV3VU9SYRIhVdvMLWGjE+H27+bR4QuPW
         WGaSzi8hSobjK1YtTCuOPWDNAFDzTeDy41L3L3PJDoAccuVH1+xfWYB4C2azTlQZGEtr
         hUSJNxJJb8+1acvafRHLS9wuVudLwOyABxhX3A0pDY7tgVKvcqFk6uSZdNHG5BS1Xtfm
         uRvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736870228; x=1737475028;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l30tzmQq3mltbu02dOh/FAPL80W0+jhIoe4pcDp7qvA=;
        b=YM5zqKWmvovk2b/2l7g1f2eg7PjYwZNAASdwkpXKh7RUHtufNn8LOfWftZjMO94D8f
         yy6rE3PfjgUZl8gz7KLD4341giKtd18ZpP23C2yhWiL7KCHvR9syKniPdynCm7ZE+YWw
         KYDHYHHAhRAyjmb3OW1PCV1NPkqruCZr41LlsqoOYfp2YG2VNapb1XfRywDNMNRwsoks
         7Na3oo/dE9j2qSTwg3Et5+YqYLs5D6a/dgW3aj+Gs8BJU8C0sUDJpfV8mj7Yh1IC1z9i
         2SQX6n6FiF+Tqpf4ygGDZFoixvN3B9ex9kYZh4pF2CnJxYhWMmC68y8JuRLJmLpRy0r6
         shdQ==
X-Gm-Message-State: AOJu0YzzPTg2G6bMK5vK5xERlAsstJISz36uyhQznbXRz+ucbRBNRqbK
	Nacd33PFp8z5gCuO8xO4SEdktaR58BehIH8AmLlDn6cS8ySGYvQaUpsQfqcoqd2pGt6fxqHGXfN
	1e75vpoqRFIbzTlo06Dki71LsBnOMWHd7qeJMLg==
X-Gm-Gg: ASbGnctgPO3YytqPoMPHLqhXQnWLQrwrP01PoN8Ziw9wEU7b04Rn1ELtAnONkyhnxAT
	PQmv1nQNvGIIFlV2IU5oTxNsvywzcQDPsdEmlRw==
X-Google-Smtp-Source: AGHT+IHHOJX9H6+yaXvY0OI4PFj4fwi4fIiLoHurCp3JhAiaryUZ9Q3b8yixfnXU63pvoq6Lj34I8VZZWs5WAOT1A1E=
X-Received: by 2002:a05:6902:2749:b0:e49:3f82:59be with SMTP id
 3f1490d57ef6-e54ee171a37mr19249357276.28.1736870227736; Tue, 14 Jan 2025
 07:57:07 -0800 (PST)
MIME-Version: 1.0
References: <cover.1736801113.git.steve@sakoman.com> <27315.1736807544501527525@lists.openembedded.org>
In-Reply-To: <27315.1736807544501527525@lists.openembedded.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 14 Jan 2025 07:56:56 -0800
X-Gm-Features: AbW1kva-JJbPT_WuGx84RyDOvSXcD3gBByy4Am7mtOGtlas06X37fKz2sh00tUY
Message-ID: <CAOSpxdaY3X4xrcS6gbcBGL6E+=ejXay3HebikWXb1YLK5HgUgA@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap 00/15] Patch review
To: adrian.freihofer@siemens.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jan 2025 15:57:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209808

Hi Adrian,

Will these changes break any existing workflows or require
documentation changes?

Thanks,

Steve

On Mon, Jan 13, 2025 at 2:32=E2=80=AFPM Adrian Freihofer via
lists.openembedded.org
<adrian.freihofer=3Dsiemens.com@lists.openembedded.org> wrote:
>
> Hi Steve
>
> Would it be possible to cherry-pick also these poky commits:
>
> a3c51794144 oe-selftest: devtool ide-sdk use modify debug-build
> 92a4abac54a devtool: ide-sdk recommend DEBUG_BUILD
> 71acb3b781d devtool: ide-sdk sort cmake preset
> 1f7eb26c947 devtool: modify support debug-builds
>
> respectively these OE-core commits:
>
> fc17808799d2b667afbe4ea9837b66af70d47007
> b886c26bf893878ba8eb6bee80dd0507e5cb0d2d
> 65950eb601c6c8aac0e4bc8683e544305346229d
> a3c5179414410ba8ccf40c7ec168ffbbf73a9096
>
> These patches fix some bugs. They also restore compatibility with the lat=
est version 2.8.0 of https://marketplace.visualstudio.com/items/yocto-proje=
ct.yocto-bitbake/changelog. Without these patches, the user has to configur=
e the bitbake.disableDevtoolDebugBuild setting, which is not intuitive at a=
ll.
>
> Thank you anyway.
> Adrian
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#209765): https://lists.openembedded.org/g/openembedde=
d-core/message/209765
> Mute This Topic: https://lists.openembedded.org/mt/110595467/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

