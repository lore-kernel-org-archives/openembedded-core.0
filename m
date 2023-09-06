Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A88AEEB8FAF
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 05:46:09 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web10.2268.1693979166465622711
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Sep 2023 22:46:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=YtNo8lni;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-4ff09632194so5640239e87.2
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 22:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693979164; x=1694583964; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LmDPoz0uJzOS/z9DWdaAQNVEysbImSHeYRCvFw7zTs0=;
        b=YtNo8lniLfOTLWazp4oy1+/14SYv28OCYiLYUS/OejKC9mIgaGX9NSV/D5/iuSPTAO
         8InQQjknw2e73hP+rf7nctOSNVWoJ/6HatH37TLuGrAc9YfRdqPjURcOPm7husHYln2W
         VZgwrj9qxOoYNoeuTilOZqjJTaQNxBxezhYj1TrBNfXc//HBDTQl/VZDQYJQiJ3AsO4U
         6xZmTpX3FndJXLHP/56hqi08aJJwkt8BcTtY/8TDTva0fflw9QfCTiMz90ly7/BMT0cB
         f5SD7f3eWfnIDB4+wGM3KJJGt2+Q0/URJwpOoZzSE7vjOiEwscaiDMxA7sHg84TMwXW0
         12pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693979164; x=1694583964;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LmDPoz0uJzOS/z9DWdaAQNVEysbImSHeYRCvFw7zTs0=;
        b=RQMm0CYCdiX8WJWuYpyvCarGb+Y6PB72hS3H2k5yrVH5ir+7LiI9jqReVehSystYHn
         e+r6wtzxtuc11Eep39mnc8hCGm7uKsyxzxkY49dTGztaMcWAvjiv3cZ3KWP17A3Hk7C1
         lK6HQAgL5Zq7PRdmldLzdTK3o3rYiafA5+5qDNz3ZGqz8eUfkXhq/JiInEFkdaqUq2Xw
         tR9Y8FsOdgRdd6nuGafSGTKXuGEe+A/5ZBAt3nua8WDnyRAjkUE46p8w8iEvLS1bR0Y5
         dFW4d1JnW0HL/zmSNpBtNmZyEJaRBRSsThzbv4kfI8p6zhQgIicEDxn95+jtwWnv35bq
         igzg==
X-Gm-Message-State: AOJu0YzaTGpwsSBbuja9Vk67hxKYVSro+b7bQI/OPasFPxotuvUPx5sO
	BMqQhciyY7wMKa5TyPpI/R5S1YjdQDYtYvrGupCZMI5L
X-Google-Smtp-Source: AGHT+IFLmak8GWjl4arcROQLhlfXaVTIjpOfhLD5neMELpXcl/ONL7Dy3sv7fujCpvAo9ior+XgfitdbrjqZn80vAos=
X-Received: by 2002:a05:6512:312a:b0:4f8:74b5:b4ec with SMTP id
 p10-20020a056512312a00b004f874b5b4ecmr1420087lfd.41.1693979164421; Tue, 05
 Sep 2023 22:46:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230906040939.1386757-1-raj.khem@gmail.com>
In-Reply-To: <20230906040939.1386757-1-raj.khem@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 6 Sep 2023 07:45:53 +0200
Message-ID: <CANNYZj-5VDNO4R1+0G4nb3D8B5SfJPHsBk2Uh5q0n=SJHpgGtw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] apr: Fix ptests on musl
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 05:46:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187276

On Wed, 6 Sept 2023 at 06:09, Khem Raj <raj.khem@gmail.com> wrote:
> +Subject: [PATCH] testdso: Do not test dlclone on musl
> +
> +Upstream-Status: Inappropriate [Musl specific]

Let's try to avoid adding more invasive patches that need to be
rebased forever. This certainly can be offered upstream, please do so.

Alex

