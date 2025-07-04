Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72AA5C83030
	for <webhook@archiver.kernel.org>; Fri,  4 Jul 2025 09:13:06 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web10.8498.1751620377832439772
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Jul 2025 02:12:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Iw9VgAoC;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6fadd3ad18eso8212856d6.2
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Jul 2025 02:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751620377; x=1752225177; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XpTvgyAcZr7jcQu3yBxzZELEEBsXfQbcyoiEXL1NoQ8=;
        b=Iw9VgAoCvxpXbXVzL87QEMadUDW3xDAGnvCWFNXRoTtn0AumFbz7hMO8GeWEpnA/S2
         Q66xLiYSh9/elBmNqlWLrUXeX9EEDePsVQ+b6gi5AwdejVCQsGavkypwuyGoxpKVUe07
         leYlQflGmb6+w+FxGJV/D4x8gq1Z43djGcG3fW52uuuUH3VWReJGYNgqeJu77BmHiUV3
         S0+oZW+tLmisypKPxFiY/Hozli2vqmKwD6N5qgCUWBj+X2DIqnRFnZdjYITuBSErRIo7
         c0ugEW0s6QFIUJECd6fLcgjjlx2jeMoERx0Y8pPGf2eju8tPnIbGgiB2dw777I9mgblN
         K6OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751620377; x=1752225177;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XpTvgyAcZr7jcQu3yBxzZELEEBsXfQbcyoiEXL1NoQ8=;
        b=VZFb12P8YlBGPchLMIPClx61BmU+Ems42hiuvQ0dPpVRC2KE4JibMUtbDMqLPBZtAS
         7L1N0t9thOfAA4d7xTz5PNKPW+5e0SJ9N58L4z5c0FUMAZ0GgDF01azCYr3WIs4n1BAe
         rhUrXLx7PjzE6vmjm5xN1h3yofcI5RxmPds4yC+X0syCQVRn58nFX8mj4WSdBK/zS+wB
         DG6w7HVccifnj025fdllpGSLwvO6wjlgeEJk4LSO30ySkk1Kz7uB0R9NrOuwNxIOtWKg
         jmukXLTKsHSATCt2hLBtbb6hNbvNbVra+XWFxXweZrnFOl6GcAJsatmlE2dV4nVMiW2v
         fL1w==
X-Gm-Message-State: AOJu0YwNh8dJRgzGiclMA0A1Pd6h3T9ZuWQlzvUoRUjKzfCOWrU44307
	iI/0e9oE/VEiPzUywA2dZ7vV64AJUFAK66Iqf7vgU5KSLfRSU9OLfKZeUH9B+e9FCssEWbuzEpQ
	y6KEEVzcq8SKdhlcgkn41Q7hERZeL4dY=
X-Gm-Gg: ASbGncu1Xg2vcE1AbWS4gy213fV378GoHQslkjgIyvPXigk8kNGibpA/45spPkyDlfe
	JxUSGpN4NmjFy0H02SnK33JE+d2A0+aQ4S12E81XNO706guN4eBKrZwcLkFA21zPv2TSxYbs9I2
	QjlM1UOXv/Z75rStWS4yVbGmsEEJNqL4fVSesS+yuqG7ltGL0HDwGNoE55AiGtrmb083EmIEWpE
	xHCeA==
X-Google-Smtp-Source: AGHT+IFOCZNUySn3GGk5DafU0cGjPuJhvE6+zqMfMovBoWn9wJkhptksFzR4peOLPEvMyEuemOrr4P79a5uKXn2zU/c=
X-Received: by 2002:a05:6214:4109:b0:6fb:66cb:5112 with SMTP id
 6a1803df08f44-702c6dbd1d7mr17085166d6.43.1751620376585; Fri, 04 Jul 2025
 02:12:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250704091015.707-1-wangmy@fujitsu.com>
In-Reply-To: <20250704091015.707-1-wangmy@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 4 Jul 2025 11:12:44 +0200
X-Gm-Features: Ac12FXxctA5G-zGbKWLPKbvCOA3krrpMa9zfANHFZx6S65-H-hba4DLPw01KF1Y
Message-ID: <CANNYZj-0vCMaXjK8z0gg=oDsgMHDqGdLQDED_f38RdcQkqr+5w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] lttng-modules: upgrade 2.13.19 -> 2.14.0
To: wangmy@fujitsu.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Jul 2025 09:13:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219910

On Fri, 4 Jul 2025 at 11:10, wangmy via lists.openembedded.org
<wangmy=fujitsu.com@lists.openembedded.org> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> 0001-lttng-modules-fix-sigaction-build-without-CONFIG_COM.patch
> removed since it's not available in 2.14.0
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=8d0d9f08888046474772a5d745d89d6a"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=018e002dbdda3306682e394ddd65fa32"

This needs to be explained.

Alex

