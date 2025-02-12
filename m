Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDA2FC02198
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 10:37:25 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web11.12654.1739356641435254101
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Feb 2025 02:37:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bSokPYa+;
 spf=pass (domain: gmail.com, ip: 209.85.160.176, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-471a5c6ae77so13274851cf.2
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 02:37:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739356640; x=1739961440; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4BHeWlAsBtMwjX3aEErVeCcVlC+VD8zYn3HERA3zqpg=;
        b=bSokPYa+jyQ8Z7p1m8Z77t2wtDY3/JspfKqdaGYSdmvfssMI8eVWDXxVGtClA5lWmh
         7Cu7/OKO/huj1nt8UPXu9XUu2OG8yZFc2rWjaHu+7HJDUnNBYRSffwfrcyUJkFgPffEX
         mthGe+n/2iuBb6tgnpuj1rvCEPKR0xY1cG/cKAzV9yM1d1+1TnTqosAdoSO7dpDHY+mh
         NiJ/m7F8uIy5lUhbn1Soohn2ZGnF2NSJUPVnpSmU7HL012hPySw4PZi7ZcAOfoICmpbu
         yj+J8BDMzlFzykT3XQu5jI8m+CSHwMbI4RmjxKmRLSfwzaJbo52pG2c2pie4mCqjuv3m
         m7Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739356640; x=1739961440;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4BHeWlAsBtMwjX3aEErVeCcVlC+VD8zYn3HERA3zqpg=;
        b=HQpcZUqd6pghSLXye2S0k8qBeN4g4For4ybH2EnkTcDWrOx3yn3EQ39mEtkWKlofUt
         T1oke5B4NmiLCSivqOgRgeJeiiuMqhlgjoBT26Ojt94FCbmm8IAGChAb9y1cchlta9p2
         D3KVASDzPFPfYcGyRnjlnu4hHWjFCT7KzGC/WCDBjcyNd88GrE7fIJBAu5e0QMIFtnTl
         WlDMsjO16+Tz+IBGxHtTGjLcARiVpwbh3F1HjqHW/Yo7qOAiZHVo/SzfmznkYKpEtln5
         GPdHCpf4eXJs2lhsiYM4NTtMszMjrlnMnF/d+7BhybUzDLjS1ErFHiTMdZVqrl+Ps7Se
         d5sQ==
X-Gm-Message-State: AOJu0YxWudSc9uL/B3iIp2C3Gqg0V+3DIj0XGGCU8LiZAOXJYfJoCoV7
	7GOC/gBI3SMbk1lP8Y/L9AjpXZoSPMef8ALGzBFbgkp+juS1fR7L6yt1tD9XXKI4AKeiqDC1jO3
	cjGxyhl2FVmL5L2x1LRTU17vtzLxYEg==
X-Gm-Gg: ASbGnctB9C5NSXKDBPPGxqSTReoE0RZl77ipgLJEZsFM9mSNAh9DA9hfjjhTv0VLN7H
	x/3VkmddKuQpP8kNTjK1bL7icjWrsz4K/Ry3W7vM7CrcS4X0pS7aTpr/dYmtEdomGXp6sYIbLA7
	1y/VbmPz6j0fUjOoflH3gg+sDtyd29dVY=
X-Google-Smtp-Source: AGHT+IGudn/l4Kfp0hBQbGcVx1/HgEM7fQhswHDPVMv72vtGgiB9TyKAsnlD8Hj+wGWBEifmzAzyHK4b6uj1xJXegQQ=
X-Received: by 2002:ad4:5fcc:0:b0:6d1:9f29:2e3b with SMTP id
 6a1803df08f44-6e46ed8344bmr46251366d6.13.1739356640502; Wed, 12 Feb 2025
 02:37:20 -0800 (PST)
MIME-Version: 1.0
References: <20250211150034.18696-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <20250211150034.18696-14-stefan.herbrechtsmeier-oss@weidmueller.com>
In-Reply-To: <20250211150034.18696-14-stefan.herbrechtsmeier-oss@weidmueller.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 12 Feb 2025 11:37:09 +0100
X-Gm-Features: AWEUYZl5asjqZidIsWPeVdQpyeRfEvAo9A2-dhlUmTV6YfM9YF6lTy5ttClSSro
Message-ID: <CANNYZj_DtLgrV1vY_YfniQhrUct1YHL2JAqdL=xz0QBRi9SZ3w@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 13/30] classes: add nodejs-arch class
To: stefan.herbrechtsmeier-oss@weidmueller.com
Cc: openembedded-core@lists.openembedded.org, 
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 10:37:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211222

On Tue, 11 Feb 2025 at 16:01, Stefan Herbrechtsmeier via
lists.openembedded.org
<stefan.herbrechtsmeier-oss=weidmueller.com@lists.openembedded.org>
wrote:
> diff --git a/meta/classes-recipe/nodejs-arch.bbclass b/meta/classes-recipe/nodejs-arch.bbclass
> new file mode 100644
> index 0000000000..144eaf8409
> --- /dev/null
> +++ b/meta/classes-recipe/nodejs-arch.bbclass
> @@ -0,0 +1,15 @@
> +#
> +# Copyright OpenEmbedded Contributors
> +#
> +# SPDX-License-Identifier: MIT
> +#
> +
> +def map_nodejs_arch(a, d):
> +    import re
> +
> +    if   re.match('i.86$', a): return 'ia32'
> +    elif re.match('x86_64$', a): return 'x64'
> +    elif re.match('aarch64$', a): return 'arm64'
> +    elif re.match('(powerpc64|powerpc64le|ppc64le)$', a): return 'ppc64'
> +    elif re.match('powerpc$', a): return 'ppc'
> +    return a

Why does this need to be in a bbclass, and not in a library function?
Are there multiple users, what are they?

Alex

