Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 571E3C4167B
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 10:03:15 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web10.29377.1701165793403073046
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Nov 2023 02:03:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZSusikWL;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2c9b5b774f0so4411851fa.3
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 02:03:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701165791; x=1701770591; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mwUaeJ2/53aR8umlVn+WWN9YIf2mbEQhehAWPoZNUdY=;
        b=ZSusikWL/7/r9hGzPz5Xf+pmOucQqUwo0fcq9TbStF4T75UfL2GUmYWTiZKdqNvN8/
         Kj8bCaeIJbYajqNpX63h8zuyubePJOkzNj/Qv7vva+r3xSbzmvYi+cBu7jEJfPeiB6W/
         uSnhZJ2NJc9HsJzIImCwAGT2GTLetz1Nt7KVP5pVWrXkv5JOAGKigaP1UsIFFzyVBQkp
         P8d1I7DdUGqokdVC6VsT0Q0VwExzEnLLu2DnHOb0s5Q+udaFFkDXGum+iztkziUn2E4W
         2TSnQb4FHnKHOS+QeWst0G08np4cKwQRiPnxg5G28yXgqWFdsEv3ene5nzixI8U2+KVb
         H7bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701165791; x=1701770591;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mwUaeJ2/53aR8umlVn+WWN9YIf2mbEQhehAWPoZNUdY=;
        b=iCMHmznWGGo/klJHGa2bDwpw/hcilBiCzcs2Q+pOT0SPdsT9BNLzzHbl877Ta55ERT
         f8yhAtM63fFCK892d+9xuS1nLUtMrG8DHRBzQWdmY98xO9IYkyVfvimk8F1bxkjfUlIY
         +icCQ3kFtHt2E6Q2oE6w0vDYg32Zk++UDZA1nFbCMuoBacwSObMw6gDhhDGEOL6AVJGr
         5YHbDPnDVTPaVjoCZcqR75qGwF+sh+Bs5OBMVeBTNtGbHa7as7GMfnijBMyC+1Vb1Cqn
         g4Vku2sGl0CCn8ZVxPDrWb7xOQzLHrhV7BOiVIjmeNRdEO5KgtK4/75A7MfoUH+BuBnW
         uktA==
X-Gm-Message-State: AOJu0YxvYA9HLVLP2YFl7/74YepT9McbdckrOIv7C+SY4WthHsLHPP8t
	SPecDlssXe5givqcSOBueErAuGPRjtDVlhzY/sk=
X-Google-Smtp-Source: AGHT+IF9hid3x9ibFmCIBMiITlPPeFBa8gxk3MH2UZEIQ4tQ8VblUFxIePzIPTWPypVTHgmZwFnriwtoISGtYZesIiU=
X-Received: by 2002:a2e:9bc7:0:b0:2c5:1aae:400d with SMTP id
 w7-20020a2e9bc7000000b002c51aae400dmr10553929ljj.22.1701165791209; Tue, 28
 Nov 2023 02:03:11 -0800 (PST)
MIME-Version: 1.0
References: <3cd66d19-6e0c-4b1b-a990-723cd445698f@gmail.com>
 <1be4aa623d61e40f52466e1cc3b65c4543b39b20.camel@linuxfoundation.org>
 <25c15f7d-d1e8-427f-a1ab-6edb854daaa0@gmail.com> <CA+chaQdMrEWZkXfyX=cGDt9uD0JodDFK68cedzGVN2fMDRh+Qg@mail.gmail.com>
 <29c6bdd6-72bf-48f6-9a8a-eb15c1225ba1@gmail.com> <ab819301dbf2bf4a669dfdbd937b21f0c7ec719c.camel@linuxfoundation.org>
In-Reply-To: <ab819301dbf2bf4a669dfdbd937b21f0c7ec719c.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 28 Nov 2023 11:02:59 +0100
Message-ID: <CANNYZj8Avg0H1JJgd-fDp-CCP-3a6Au2yq4_vX+y7c2nRXxAFw@mail.gmail.com>
Subject: Re: [OE-core] bitbake-server does not exit after build ends
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>, 
	Martin Jansa <martin.jansa@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 10:03:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191352

On Tue, 28 Nov 2023 at 11:00, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> I'm not sure that is entirely true/fair. The way bitbake has executed
> processes and handled threads was very carefully written deliberately
> to avoid some of these kinds of issues so it wasn't "pure luck". What I
> don't know is what changed in 3.12 to mean this now is potentially
> breaking.

With my python 3.12 recipe I'm getting a different issue when that
recipe is used to produce python in buildtools, and much sooner:
https://autobuilder.yoctoproject.org/typhoon/#/builders/20/builds/8593/steps/13/logs/stdio

I've reproduced it locally, and looking into it. It seems as though
hash server is not creating the unix socket file, but isn't failing to
start either.

Alex

