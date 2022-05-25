Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55F20C433FE
	for <webhook@archiver.kernel.org>; Wed, 25 May 2022 09:42:25 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web12.4842.1653471743926734486
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 02:42:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BLdYEfE3;
 spf=pass (domain: gmail.com, ip: 209.85.215.170,
 mailfrom: rybczynska@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id a38so15607644pgl.9
        for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 02:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=F0J3xRmV3vVnfoACDFDEbCoquS1U/Cx8yuiJMa23ptc=;
        b=BLdYEfE3bNPjPo6Q2CDJfxfSFm45Nr9XKxQ9gACx+yoBQD7dMCWl38lNgcuusGezXY
         cuVJQNE0vwDteRAET08ShVh5smiie+GR9OZOTKUhTF9uKFh/dQPkPx7rq8tzVDLek4I/
         YgUO4HnaWVKWdGEI7L5XFQ290/bpvj2bbE2DGOuco7Yh4RhArFKJU0rtKQc/qWpKKG8c
         GALaXPG1zQ1eYbanrAo7OsTXQqBxmeMjjq5n/IaQ+cVUIUa+jJUYQYmyDCaNXZZfRMiG
         yKNZBF02yiqiu5wSS7Ag6/3kiaprrShP4JdP/b1UIpDEJNOGP+M/jLR0/IRRNG2thObG
         Crsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=F0J3xRmV3vVnfoACDFDEbCoquS1U/Cx8yuiJMa23ptc=;
        b=lJto52nizWmVZ5hfrdNfKc/G6I1Gi3hblOEJ13P3kYagFnxcCJMz+FbNod1N7ottSr
         C6kMIyGJCL7BfKaBLahIbBt858xf0omoOy1oXXs+sR8FD/MYHeM2TBMirzzjBn+MYDbZ
         OyaaVqRcBPmp2wzn2QbHoFt1sImSBXHui7ozm4ho6CX9mE1hJNvTcY4qUXlH7P/BYyJv
         1+rQNDGKKnkRbfdqEAx0sfc9wYRx1WXLGsuL3dss2n+K0E8vIJv+mrOxUht3K5XlWntq
         2ucPysDglaZqjvy8vIOGNXEvb17np4fRk3G5Nw/RIY8lEb25Dr7plGIDyKFOOMC8tRdn
         P+YQ==
X-Gm-Message-State: AOAM532xPhiS9qor9F2Rb4jz13zOTbM4zVRCoOUPzxZzrJ/557sfxQ7F
	25Wa8ADA9W+fvpYzTrDLVBfKma8YqjoH6ttiSX6sXdDP
X-Google-Smtp-Source: 
 ABdhPJzERIPjWCnsLjSKZTjdHEdEHG99eae/GUY+R/9P84b6wi5YgYc676RaR9Lc3NNZ8rx0il9bU17/Kx1/w+nPLrk=
X-Received: by 2002:a65:6b8e:0:b0:39d:6761:300f with SMTP id
 d14-20020a656b8e000000b0039d6761300fmr28634322pgw.42.1653471743479; Wed, 25
 May 2022 02:42:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220524115021.38862-1-ernstp@gmail.com>
 <20220524115021.38862-2-ernstp@gmail.com>
In-Reply-To: <20220524115021.38862-2-ernstp@gmail.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Wed, 25 May 2022 11:42:12 +0200
Message-ID: 
 <CAApg2=SOhYpjtM+cM-QwLfmuHXH=afPHrVABE3K590_nqKdODQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] cve-check: Only include installed packages
 for rootfs manifest
To: =?UTF-8?Q?Ernst_Sj=C3=B6strand?= <ernstp@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 May 2022 09:42:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166111

On Tue, May 24, 2022 at 1:50 PM Ernst Sj=C3=B6strand <ernstp@gmail.com> wro=
te:
>
> Before this the rootfs manifest and the summary were identical.
> We should separate the summary and rootfs manifest more clearly,
> now the summary is for all CVEs and the rootfs manifest is only for
> things in that image. This is even more useful if you build multiple
> images.
>
> Signed-off-by: Ernst Sj=C3=B6strand <ernstp@gmail.com>

> +    for pkg in list(image_list_installed_packages(d)):

Thank you for submitting a new version of this patch. The references
posted on IRC suggested that using this way may cause us to skip
packages that should be included. Or I did misunderstand?

Kind regards,
Marta

