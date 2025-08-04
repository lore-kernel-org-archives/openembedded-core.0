Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87401C87FCF
	for <webhook@archiver.kernel.org>; Mon,  4 Aug 2025 10:43:04 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web11.14965.1754304179558862304
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Aug 2025 03:42:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ghCaD8IF;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-7074bad053aso42990716d6.3
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Aug 2025 03:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754304178; x=1754908978; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IQnay2wJD39e0lqQW72WgVfoXx43JcA/0j1PKqIbh5o=;
        b=ghCaD8IFV6FPqAYZ9xPGEFr56H6u8stwPCKsFI9W9werc3bD0QcaYmGf+vxc2bRN0W
         QaMvAsLS45jj6coLieTEeBk/DInwKyA0Kbpg4nRZ4cI9Xkcs6FLcqZ3qmIJMnWPTSn4i
         XF5OpuZAkPO3+SRwN8Jzo/6V7EAMoCzxBAwdr+SfM5UEHeHTOAwrjMuWBT2rvRRma9T6
         zsS1+JV9P8GuPTAVuNDAz60DtwhC6LxQrPkRHXFYm0lFB1SEk3Fz3xxCEHbtW7by5tGg
         yXRCJieGbJ4XUezSvKtUjGLkmgNjMJk09/5DfPggfE086gEG/KV7wFkuLHXkbKyYXthv
         7/fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754304178; x=1754908978;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IQnay2wJD39e0lqQW72WgVfoXx43JcA/0j1PKqIbh5o=;
        b=KO/wvy4pMTeQsT0g9dDyYRvAmJJcLdHKOm5VTH2+PfsKfq9+k8Ydh9/udecDW9Zp3I
         W20IzOoeOC39bnBf86h6GcvsqHYgCRF+Wn2c50BLIO3Mx3RlgBg2TJveDpQANtUSuQv5
         aLxIvS/WHeor1fHtosIiArWbsgvvge5My94SbG4Rch/6THAel3HN8CR1E8KBGRCi0g5G
         FEu81LJeqHx+Z3Tm1KyCLCOrSrGj/2azCocvFbtLMIaOBmgkTOUuHs4rNhsGpOvSPPi+
         Gn6MtkuZf4sPRFmZP5ZgcjJFcjOoNTZXmtYLtsdfPiR8trRAxLkxC8G/NIFhGng0Dosb
         dU+Q==
X-Gm-Message-State: AOJu0YyF5+QABrwK3a1tzZues4RUhwmSg3gNDTpRD981kGFUug/NNZRu
	gJHouDUg0buCv+Rk+jhSB6erxdYAOXDmqNbGuJZ6UTca9WOyTCifqibrCak8hb/eD2XYzTX+u9+
	Asj2c2BRb6rxeK1C79dGLb6bfs9LOotQ=
X-Gm-Gg: ASbGncv05r/8ds/I0UpFdfh1lBc1B3XrBC+EFa0v0/iYOUkjrPvIqI3AfEZLT37P68c
	TTxWnpwvGmTa/XVV3F0+3giq1lIsdXZULSiKkmJXH8qf1YV0g5Ctqv5qAtmuw6NdyMICZQm/HTH
	xBgAFZUKAuHiUtIDPcUTS62v4/DaFgUmwUMtAuo5V5jZEn4ChMS7sPOqLXqQ0zYkTg26QLpqoFD
	yHtBAfHxd5QfeTvuAkdGIEAenXp4SwTMBZkLtLoS2bC/tiI8z9b
X-Google-Smtp-Source: AGHT+IG4anHTop6ZdJ46pIc+jP+U/ebRdZ2xVyV/ROPgqUAD+sok0Lwr7pkHHjhMTt46nKfY7Dp4IuHC4XjZ8plBZIE=
X-Received: by 2002:a05:6214:dab:b0:707:55d2:693f with SMTP id
 6a1803df08f44-70935ea9379mr131069286d6.3.1754304178389; Mon, 04 Aug 2025
 03:42:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250803010422.21838-2-anakin@childerhose.ca> <20250803010422.21838-3-anakin@childerhose.ca>
In-Reply-To: <20250803010422.21838-3-anakin@childerhose.ca>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 4 Aug 2025 12:42:47 +0200
X-Gm-Features: Ac12FXzU5T78Z0rCviu3s4Xr1SKlq75Vzskwb1A_lODJ9LHOm6GYVqIBm5WIAsc
Message-ID: <CANNYZj9fC5=jD_-UAmrGdv+rSrF_L968jaHK3_xwZ6o=Xbu9vw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] clangd: add compile_commands.bbclass
To: anakin@childerhose.ca
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Aug 2025 10:43:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221424

On Sun, 3 Aug 2025 at 03:04, Anakin Childerhose via
lists.openembedded.org <anakin=childerhose.ca@lists.openembedded.org>
wrote:
> Add a class to link the ${B}/compile_commands.json file to
> ${S}/compile_commands.json to automatically configure the clangd
> language server for build systems that generate a compile_commands.json
> file.

I don't understand this description. What does this json file do, what
does clangd language server do, why can't it find the original file in
${S} and should that be fixed instead? Having different directories
for source and build artefacts is common, and we shouldn't be fixing
it up for others.

Alex

