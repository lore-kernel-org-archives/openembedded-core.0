Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AC87C83F2C
	for <webhook@archiver.kernel.org>; Tue,  5 Sep 2023 15:56:43 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web11.25608.1693929399764054350
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Sep 2023 08:56:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=blfZLOOo;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2bd0d135ca3so45151281fa.3
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 08:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693929398; x=1694534198; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GneZIRZNxSp8OPD7ZZehcA/Mayd7hAklLPnuQfNRmis=;
        b=blfZLOOojZYD/kOISj0UNaukCcnEkemDmvP1mzGAp5hTPZbgreYC3VAekDZHA5JKTB
         0gdhS/dncGXAtK8fFdNU0OofAXy/cuLp3kcS83z07/+faJhdL324HQcebLhrjuQ5IRwl
         r+9C4C9jy09Hgyd6X5OBd40mpCojQ6GWiOJtsAqp9t8Jbjv/Ap0gTh6h1uwqDiH5SpT9
         ZYwGsmoIopxEZTXxZyD2fs5DCBi0mJCMt2Ct1Ta+qlMq14aOXGPpcoR1JBP6Xzp6nEM/
         o5N3qCHeVSrppdzLcNvFRr1bN1H5lbbuPKjiR2nSheCCSjxMX0os3sFTo6+vTFSG3RHo
         wXNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693929398; x=1694534198;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GneZIRZNxSp8OPD7ZZehcA/Mayd7hAklLPnuQfNRmis=;
        b=gSWdLbo2sDx5EnUA3+ikklf6QxaqisPI6TNmtO1yRdDTk+k/CEyDFwC3FtBl9FXl0I
         8FR+qQTd4fRgi9+74ZFjaONOAic7PfdYtNlPw3rOBTES/No6Uy4pGXhg6FDimVipMCAl
         +nWlhuM4PcHPYgKajqyj5QME52XLrpI4TR4DehOnITGLI3QKl0c1NonvYBC8zEwkec5w
         boj4bKHch72FndWhbF5cnK5BtMyRF7xu6T98RRCkuWAGC9do6Oosm4ACcydhWmcHoNQh
         BZ5MU7AhloN7u529unmIamD6+vakfInwrMvb1zwE84tiB/BbeG6E0p+2S6eXGr3ypKbx
         expA==
X-Gm-Message-State: AOJu0YxshaWihVLgYE1zi+Hv6TVajsYD8L6c8SS87X0Cabc98nuyCXL6
	HQrPCVvHY6NPXJxGXQgrQNwHyqqIFwebmt7XTwA=
X-Google-Smtp-Source: AGHT+IHr79B716NcfW0sqzwMk6xBZd00r7UCHsKqceNPMAeuZDuse4IH6WDis9ePeS0y+FvftXm1tpd3oIH6dA/wFcQ=
X-Received: by 2002:a19:ca03:0:b0:500:9d4a:89f8 with SMTP id
 a3-20020a19ca03000000b005009d4a89f8mr166742lfg.28.1693929397437; Tue, 05 Sep
 2023 08:56:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230905133545.1286448-1-ross.burton@arm.com>
In-Reply-To: <20230905133545.1286448-1-ross.burton@arm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 5 Sep 2023 17:56:26 +0200
Message-ID: <CANNYZj-bgLaUFpfWCiTKb3yzanj5wOA_eu3OQXR03AWJCyQ=cg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] busybox: remove coreutils dependency in busybox-ptest
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org, nd@arm.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 15:56:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187229

On Tue, 5 Sept 2023 at 15:35, Ross Burton <ross.burton@arm.com> wrote:
> +++ b/meta/recipes-core/busybox/busybox/start-stop-false.patch
> @@ -0,0 +1,31 @@
> +Upstream-Status: Pending
> +Signed-off-by: Ross Burton <ross.burton@arm.com>

Please submit upstream at the same time.

Alex

