Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79067CCF9E5
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 12:32:14 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web10.31494.1761568333416623009
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Oct 2025 05:32:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hCJFLuAQ;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: festevam@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-378e8d10494so33707871fa.2
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Oct 2025 05:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761568331; x=1762173131; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D60tubWImNzVX/x2ogftzvEtXDpG/9g3nEbVTUBkDjE=;
        b=hCJFLuAQDI897PktYLy9ZRx4ojhG9L6mH39hTzZJgn9FJNSjOBSii2Z4+N7K7zh5Ey
         L/Eh6W0LHlgkH5Qt4N9XBTxd+J3FI93GkcaMTsPpo+Hk94P3nwmUn35E55AKNl8BKo/K
         R/uXhKoPc1k95gXGvw+2mZzUofRhUl1PSR0rprmIsodLdwUkmFqGPOzfYGus84un3x40
         uzUMBrFXRxAfCxHt6i3oOiJFnioJFHjAVszoCYCH4LvurZ/V73M0mNcuIVEmd/SYG8CQ
         6gDir4ck7RaBnZ7Ys/epeqsg6Dj43jIfOOX1KXbrch1Q1Mr1znQWGnsQXQuWwu6kWSis
         AK8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761568331; x=1762173131;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D60tubWImNzVX/x2ogftzvEtXDpG/9g3nEbVTUBkDjE=;
        b=RSCOvP4NHY2zYjmHo5riu5Lb4elmM4KEnxSjGualmgITEk81VlrPtEsMnfk6EswPyL
         z/hyAJD6Sx0vElH2hvMdzLwtJD78BPjNQ1X8cnnCj34VZJ6qW7KIbNrpgqIGYVUwW6XI
         cUYe0NSgDAjVETBF8S6hwrSPU5hkaJb82WrFocVaqDl4Er45FcP5aYW4TDE09T0KJuG5
         XuaFdLCYc7q0B+CZe65SqvO/Dgsl0WWZjhQQ0+liuMGHs63UovpQnP1agFbnsFeVza0Y
         w5g+C3ZYZOIt5JVQsU0yFVYI2edngNcDDbyZnjOfrfiUWDuM0dxsfEnP2V9cBsYZL22b
         LvjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfFkKV8+MNjdI11lpg8qVpR8auy4LEHC8cr3bww4CoyOttSX6qnN6LUvA/ZaaenijstMqkjtW2OcxNKMGIgnglXg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxDu9/fk7fvgvtj/o0bzjMqma5nyRKD46CSy5cdyimKcVApr4ne
	1IjmdxmL4GYlg9hSr+JGeN9ghSyQDhv/kpZcZOg+XDc2SLlfi61doa2vpOzYkh5Mwo4hy6AFo9q
	cyEi5d8Ypk+1vWgrWnbfMRtaONx6TFQE=
X-Gm-Gg: ASbGncuvjq+RsVS8Zck1GGxpwioJuGW9hmBhdn2eSwRcrKH6zVf/P0EFUK56gvVSrWk
	dj3ajlUYKHQ4hNFjtvGQpSoce2DppeD6rD19kWeJ2RZMrEkmysNYKCGroL16Dp3qJNu/ahpnAjF
	kinQsSQUdLP8lWHpH8aboQ56TJaUBZbCOvU6bunTphmBXkCRa5wA/OqLpheZGw4HkKsqx0JXI8a
	zEMDnVPEX8DFNShduXhjuFse9CDUU1FyFJ8RzNBWHfb/PmLVPVRpACUZHjRO71XeDriK+LeYcg/
	mOwSLNCuWVmmnABP
X-Google-Smtp-Source: AGHT+IHszjNB+0ENQQLeCkPIKY1JHcniJCOP1UQElxSrgUB1MpO23J72SRzJBlL9qpmf1Vvj8OcFfclqmBfi1i/uQJ4=
X-Received: by 2002:a2e:bc22:0:b0:375:ff2b:14ee with SMTP id
 38308e7fff4ca-378e43914d1mr31777201fa.29.1761568331240; Mon, 27 Oct 2025
 05:32:11 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1761360245.git.bruce.ashfield@gmail.com>
 <65b6f4cb57e6738e48560539cf2c0485e0469b65.1761360245.git.bruce.ashfield@gmail.com>
 <DDSZYF5TWBO9.2Z5Y4SR4SE5D8@bootlin.com> <CADkTA4M90CB7qmkO=dxr1KUkfxbotH_trwL3mgpo4abj8=Mbrw@mail.gmail.com>
In-Reply-To: <CADkTA4M90CB7qmkO=dxr1KUkfxbotH_trwL3mgpo4abj8=Mbrw@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 27 Oct 2025 09:31:58 -0300
X-Gm-Features: AWmQ_bmTDSie8r_BbVHzfLYJd13nz8QIH66zY4wLNo131clgRIN7i8-ipwV8ehk
Message-ID: <CAOMZO5BXLizaBKmOQFKreoCr1OkzBUZMUfD5CrRg6g_JAgib0Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] linux-yocto: introduce 6.17 reference kernels
To: bruce.ashfield@gmail.com
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, richard.purdie@linuxfoundation.org, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Oct 2025 12:32:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225332

On Mon, Oct 27, 2025 at 9:17=E2=80=AFAM Bruce Ashfield via
lists.openembedded.org
<bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:

> It boots locally, so I don't have any great ideas.

Shouldn't "check access for rdinit=3D/init failed: -2, ignoring" be
added to meta/lib/oeqa/runtime/cases/parselogs-ignores-common.txt?

