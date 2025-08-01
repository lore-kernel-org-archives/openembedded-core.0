Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA386C87FD2
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 14:43:25 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web11.89466.1754059405260368226
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Aug 2025 07:43:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dIzksmin;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-32b7113ed6bso9054951fa.1
        for <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 07:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754059403; x=1754664203; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lwLlE1Wt8ybPY7SR/rYLJSiNk3VrGsjrz+4l9mSd7f0=;
        b=dIzksminSlWXRlif5E0fShWcmsPjvQQ570wEbkBsircWcdZ1PItLpdK2FqHwYO1DAI
         xJpt/MEH6AoxkuAaaX3UD6xppMwwwd3t7msHFRJZjHvR4CtsCqesymM/z0GB43Wdwsf4
         qJBSlQlzsJ0iSCqwuQANT0rXdwzV11/fGPUSkrXgNMipqM55DDZn2VHlEc46GPzy9zpz
         VpHbVY9CrQywa+5yn98NJHf2UHaP75KoPPQF4yYeArDErNnTl8FDedrmlutL3Mm8kGCj
         9zfZRtfoGFh2z4v71vDK4vh7GL7EAj4IC7aTiEH76SkNbit/fIRV32Z6RDFaV9R1OcE1
         fNWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754059403; x=1754664203;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lwLlE1Wt8ybPY7SR/rYLJSiNk3VrGsjrz+4l9mSd7f0=;
        b=WyULfKK4pMD3ULCen/PYaf1sSG8DiUqDzZIcLjD8umb/xxmOzn0zNofngLCHJiEBPw
         uzzaqmxwT/Kb9kpFECqERrAsW/YNLk1QTASd5XZMctdJc7g6daX3LWG3V+4qY8pcvfmA
         yDGFdWQrXz7YLoohQJR9aPeNP+xh7OgS+fPqVhYTDiESluMKfOkO5wyNkyy9WEeVLZNi
         9T00d9eqJ1tNsuMhvkMz+Ttmn9ci1aenaOasAq47BNYdAj4GHGQHED8sD1CG+uaeoqy7
         7hpNqeMGBBZALKNc/UBq0nEgZlojOCjnsdfwXo3KQApk5j7rKVxxVmFojrz7UbQ65c+/
         1q/g==
X-Gm-Message-State: AOJu0YyJvvuDAzn/G5pl0WuywcepmCasUR50K0l5/NIft9CQLoDCZyyQ
	BBlx0Vq+Oj/CnpKg2QmwKJcoEqE+xUtyEqvbt+q1sk1sU6YNApQHDv02zxW1bVfVb76p5RsxgCZ
	94FNE3NeuO+TlC/jcCXS2cGHLSSHk4LA=
X-Gm-Gg: ASbGnctEStfZlhmB85hBh4yw1YCycYkm/UUzT0hk4TkofhUIYNV912b0cPpR85LaagI
	IzvWj+w6fhAOWrdpauD9tue//rWNjpW07bB160l1LtgMWNB0Su0cNbabUPW46oonuNZeTk0AwRb
	iy624veqB1taTN31PFW0GUCB5ep0rbfVf8CU+xFZLUoiQ4F9R0CG7okwjf8amPplG6ogfuAdCcv
	QK0+ddWug==
X-Google-Smtp-Source: AGHT+IHmUntUW4EEDJ8SxuIA2le7JE189WoR6jHuRpPuif8hiltpXxyvBxn2rWPgl850VliRi708106gQuP7v3IxFR0=
X-Received: by 2002:a05:651c:506:b0:332:4528:c0e0 with SMTP id
 38308e7fff4ca-3324528ccd6mr13615611fa.32.1754059402947; Fri, 01 Aug 2025
 07:43:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250801100708.2925411-1-martin.jansa@gmail.com> <CAOSpxdbjrwU2N-qYdy8+o2K3Q+XH9dn0VquQe0YSyass_PxYcA@mail.gmail.com>
In-Reply-To: <CAOSpxdbjrwU2N-qYdy8+o2K3Q+XH9dn0VquQe0YSyass_PxYcA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 1 Aug 2025 16:43:18 +0200
X-Gm-Features: Ac12FXwF3hZynDkAFZuUJbn_Yumaqxd-osoQpsr00ns5sLrHdlq3Qb_1qeij3aI
Message-ID: <CA+chaQcVit+vwWQny5N-uAsCHD4YFbU1RSrVfNuPqkJW_ii8BA@mail.gmail.com>
Subject: Re: [scarthgap][PATCH] libpam: re-add missing libgen include
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org, hprajapati@mvista.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 14:43:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221362

On Fri, Aug 1, 2025 at 4:42=E2=80=AFPM Steve Sakoman <steve@sakoman.com> wr=
ote:
>
> Thanks Martin!
>
> Any theories on why I didn't see this error on local or autobuilder testi=
ng?

I've seen it in build with clang which is more strict than older gcc
used in scarthgap.

