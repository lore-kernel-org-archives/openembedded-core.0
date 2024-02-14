Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37BA9C48BEB
	for <webhook@archiver.kernel.org>; Wed, 14 Feb 2024 10:02:11 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web10.38161.1707904921845308797
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Feb 2024 02:02:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OICir93q;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5101cd91017so2553290e87.2
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Feb 2024 02:02:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707904920; x=1708509720; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HVCK7ZDSNLBCr+HQPHPiRUlfrq+UlxqRcdUV5gfpjdw=;
        b=OICir93qS3WNcdKiY+F6TSb9yUwtIaAQdPy1ZhmgLIplOt57pWENEPRrw4eyQkiHo3
         pwhDg9UVrm+epk4on9qePZ74r5AA/TeiwHRRZ/fOQceCZktMsd4ottDistQMBvvBcFAb
         /eaxepElA+S0Qr/rMf5CFr0CyZmeNw3Cv7mn5E4S+LM0jTDFdSxd3pOq4Dpf80Q7o97H
         V2tljqviX47yjrJISAVUYo0PvLKbLsiRIyvlNRDSMGv4aa2+lNzPY807MXg5XzyOiF2s
         6Ocwo1k4cL0ZB+8Fljhoc8aeWq9eh7A0PRJh/itflZfANUCnmnchY0qwaevEcibp/Glh
         WIkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707904920; x=1708509720;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HVCK7ZDSNLBCr+HQPHPiRUlfrq+UlxqRcdUV5gfpjdw=;
        b=E9EDB1Y+sAz8i9eUW9w3/rJ3A1ABcX/kNy7mGCSq/V+dTz4XqVSAChQdgQltPgTK5H
         4XTB3VeZ4T8D+FS44Qt92yKMF1Al8WQc2Galybixgm6RjsqDRYPaK0pdXes8Zchqlr8t
         c2FGhpnYmHcODx1jt4zb5RR6hZWs57vUwvXMa886azroGnvdolr3kkjo8S5I/YSFVDbQ
         EqBoFC26751ol0kjfXxV2SrRiypo0DL0gGix2IQw2pTvkoJElO/wZjk/lxTwTtY0+3sV
         G/2I1mATjmljVZuyNumJlO1reWj3mWSOzhyJH9VIjJuHOuqkNbc6OObf/s10MKcdSMnp
         +33A==
X-Gm-Message-State: AOJu0YyzkwkCv2G5ugcR/hsDH9tipmgpKRqh9v01tsAfvLcUHFD3Wnmd
	uVOZRp1todMQ5X5VK+RbWvAxwfRu3wVLo/d07spjH82u5D6Hn3S9o8HH2dUD9EmpTCfdPRy8ulE
	0Lw+ifl3f0ymYm1hvfx+5Ns7+Am4=
X-Google-Smtp-Source: AGHT+IHK+wuS2Y4+mbTq2XeD4ZxyoD22mOUnpmvhL0AhDlgD8BHj3uhAopzrnzZlfiEqElmxl4btud6QrXjm/HBjRjA=
X-Received: by 2002:a05:6512:482:b0:511:851d:a82e with SMTP id
 v2-20020a056512048200b00511851da82emr1388671lfq.20.1707904919739; Wed, 14 Feb
 2024 02:01:59 -0800 (PST)
MIME-Version: 1.0
References: <20240213221846.109260-1-adrian.freihofer@siemens.com> <20240213221846.109260-4-adrian.freihofer@siemens.com>
In-Reply-To: <20240213221846.109260-4-adrian.freihofer@siemens.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 14 Feb 2024 11:01:47 +0100
Message-ID: <CANNYZj_=BJdma_-NuhAoBEzD+To0XR9LqrrGedGT+ogP-CAXcw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 3/4] oe-init-build-env: generate .vscode from template
To: Adrian Freihofer <adrian.freihofer@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Adrian Freihofer <adrian.freihofer@siemens.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Feb 2024 10:02:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195459

On Tue, 13 Feb 2024 at 23:19, Adrian Freihofer
<adrian.freihofer@gmail.com> wrote:
> +++ b/meta-poky/conf/templates/default/vscode/settings.json.sample
> @@ -0,0 +1,47 @@
> +{
> +    "bitbake.pathToBitbakeFolder": "##OEROOT##/bitbake",
> +    "bitbake.pathToBuildFolder": "##BUILDDIR##",
> +    "bitbake.pathToEnvScript": "##OEINIT##/oe-init-build-env",
> +    "files.exclude": {
> +        "**/.git/**": true,
> +        "**/_build/**": true,
> +        "**/buildhistory/**": true,
> +        "**/cache/**": true,
> +        "**/downloads/**": true,
> +        "**/node_modules/**": true,
> +        "**/oe-logs/**": true,
> +        "**/oe-workdir/**": true,
> +        "**/sstate-cache/**": true,
> +        "**/tmp*/**": true,
> +        "**/workspace/attic/**": true,
> +        "**/workspace/sources/**": true
> +    },
> +    "files.watcherExclude": {
> +        "**/.git/**": true,
> +        "**/_build/**": true,
> +        "**/buildhistory/**": true,
> +        "**/cache/**": true,
> +        "**/downloads/**": true,
> +        "**/node_modules/**": true,
> +        "**/oe-logs/**": true,
> +        "**/oe-workdir/**": true,
> +        "**/sstate-cache/**": true,
> +        "**/tmp*/**": true,
> +        "**/workspace/attic/**": true,
> +        "**/workspace/sources/**": true
> +    },
> +    "python.analysis.exclude": [
> +        "**/_build/**",
> +        "**/.git/**",
> +        "**/buildhistory/**",
> +        "**/cache/**",
> +        "**/downloads/**",
> +        "**/node_modules/**",
> +        "**/oe-logs/**",
> +        "**/oe-workdir/**",
> +        "**/sstate-cache/**",
> +        "**/tmp*/**",
> +        "**/workspace/attic/**",
> +        "**/workspace/sources/**"
> +    ]
> +}

Does every template really need to provide this separately? If they
don't do it, then experience in vscode is going to be poor. On the
other hand I don't think there's anything particular to poky/core
default template in the above, so why not place this somewhere global
like meta/files, and then all templates will gain vscode settings
automatically?

Same should be considered for extensions.json, although there might be
a use case for per-template extensions, not sure.

Alex

