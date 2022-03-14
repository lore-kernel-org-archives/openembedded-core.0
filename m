Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9927C433F5
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 14:54:04 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web11.27215.1647269643205862357
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 07:54:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=8EoL/+ZW;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.42,
 mailfrom: steve@sakoman.com)
Received: by mail-ed1-f42.google.com with SMTP id h13so20285610ede.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 07:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=jCTAU/tmwCnaj6b3ZNAKnxYZ9vOloow/CPui+WmwtDA=;
        b=8EoL/+ZWpcrjEVudTSZ4TFBpzJmQ5RTZVbsKVirFe1qTXBzr1JrKHo4V5JFfbeJ7UQ
         9GItmswMuiAIRGLjICoZ1ivRyG0lclWidzKWlQmXxRflNjqZxF27GV3a5hAdPwATLFqO
         H5x3gavi4F5ycdQeWqYwIuW3z8JtZRA2fFWeqL7grH2NwHUi8odG5j1VKyU2KLuCSNab
         sQD4CNUo6fYeuEUdXlWjs0l95Rgyv/4cfr0/lR++XkRy4xYxpuQ0Z88UfRrM3iY+BxGD
         +zDWIK7Psad/fpOmBp0sRIYBzRR7oHeEBeo8nvpE7OBq5VxjmRgug5kohLCvEu7el13V
         bLaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=jCTAU/tmwCnaj6b3ZNAKnxYZ9vOloow/CPui+WmwtDA=;
        b=QlC23ZFYsFGgXpCfCyyaqopr33/aHMxSCs+tmI/xWymqfaB0hMItulXolwUS9b/0+3
         xR+yUkghPCtkplLexb9WRa2hwFrUB6pNTkon52S3h+NX3onhorW5DQloY0HjKtfdABp7
         Co13bWapih3yrjXPxwa1YJWiNXC2GqMQYNsLdHZe6nGxWqyQVkTdL1YDvjKiCNogKY+c
         i37Td4OgTU9DDb2JQv/t5jT+Us+bajIDfH/d9yDPUAbk+qUhnJPuMo97fiVuPkvxrEMY
         XBlbSJ5AwEF/6d16gNaQHHJtL34hwAmd77cjbtD65qnYq3Mz76WsgC9+TcDOzjOdvnuD
         ctxA==
X-Gm-Message-State: AOAM531XFroL66o/87Ys7lyP09vOqBhZm+VyvSpph/xJ8pLvG3uEKe8Z
	EojgX7VGH8yPSH8FNeDk7YrNeJ7etTAoiGc4cL/TbA==
X-Google-Smtp-Source: 
 ABdhPJxzk9Pl5sgmh3DsV4JGgBI0mKKuyhiRYKMcMdBUxOQNkyqsxbIz4EV0HaVGHKF/hgxMlixy1NRWISuvhNSwmK0=
X-Received: by 2002:a05:6402:42c6:b0:416:541:4be1 with SMTP id
 i6-20020a05640242c600b0041605414be1mr21078955edc.238.1647269641379; Mon, 14
 Mar 2022 07:54:01 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CAOSpxdZXurirkTARsX9pA7nS-euk06jRfiXkFqoDA5wfi6oGaQ@mail.gmail.com>
 <8902.1647268537771385521@lists.openembedded.org>
In-Reply-To: <8902.1647268537771385521@lists.openembedded.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 14 Mar 2022 04:53:50 -1000
Message-ID: 
 <CAOSpxdZAGZ6HDFC3eoYxnPeAPVuX6tsaAsiAFJu6VrCdVjVn6g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] re2c: backport of partial fix for
 CVE-2018-21232
To: Davide Gardenal <davidegarde2000@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Mar 2022 14:54:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163152

On Mon, Mar 14, 2022 at 4:35 AM Davide Gardenal
<davidegarde2000@gmail.com> wrote:
>
> The official CVE description (https://nvd.nist.gov/vuln/detail/CVE-2018-2=
1232) only highlights a stack consumption in "find_fixed_tags" (and this is=
 actually fixed and is one of the included patches) but as stated in the gi=
thub issue (https://github.com/skvadrik/re2c/issues/219 that is still open)=
 there are also other recursion with the same problem and not all have been=
 fixed by upstream. So we could say the CVE is "officially" fixed.
> Tell me if I can remove the "partially" and add the CVE in the descriptio=
n, thanks.

If the issue outlined in the CVE is fixed by this patch then we should
add the CVE tag and remove the "partial"

If there are further issues remaining then there should be new CVEs
opened for those issues.

Thanks!

Steve

> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#163149): https://lists.openembedded.org/g/openembedde=
d-core/message/163149
> Mute This Topic: https://lists.openembedded.org/mt/89771178/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

