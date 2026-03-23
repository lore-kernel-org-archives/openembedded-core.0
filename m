Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FA7BF4613F
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 22:15:33 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7240.1774304132561601934
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Mar 2026 15:15:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fQIVA/vI;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-486fe655187so42850545e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 15:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1774304131; x=1774908931; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=h3jtbAkADWNep8eoevqdjHNQfc+WW833AEUomgShhjA=;
        b=fQIVA/vILl1CXmIPT9Kk/uRGQMiNaQyP9iqAjdN5qbqwQkkydPJ19SKIXvd+sY8oKT
         rQ0DS7YVdCOBvS6ej8qjxk9xG0SPIKDe4VvBZDdePDxQHQxfyWIwts2TOQ13D0wla8Mb
         +LE7Gpcg2JUU7mPqEAy4GOhqHAb8efMzkbKSI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774304131; x=1774908931;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h3jtbAkADWNep8eoevqdjHNQfc+WW833AEUomgShhjA=;
        b=Qq8QUX1/o0NE9UQxRT29LJsK4GzqDf5IuSQXAKX3ID3dgkc800hpvF/cq0xWb41KQJ
         Bl0qAD0K89E6Hm4n271mRgrGaAzjTHQoPeqKHM/1dFdU3ccTjXX2J0svGqdnzGgh9CXj
         yoD3lel+3zra0FWAdeZNi3l6T6vFf3oPKqn/dwOdlMcv4CkH6zBLpVzFRsOrKD4Q1QaF
         l4Nz2q5k7odvgOXWyiOTGzlOYWf38Pcpoj6Icu8wU8VxUAlo+4o7TZ9QzJlitt8ES6EE
         aV7yyoQBIBvxk3X/8n5zKqlgjz5KXz1ULyQv+yY6jz5AeGqwMIquGVhgzlnegMIJTVdA
         VI0Q==
X-Gm-Message-State: AOJu0YyvrZfKz4hvfzT8KVN3wX/LijWfKq4oxfrzgpBqWrwNABu550Yj
	+9A8ccWryHl7izFtMfsXmea2c4jCcuPHbc9XL2z2YE/JH7RfZl6ny/pFmcZ1/qTJ/3g=
X-Gm-Gg: ATEYQzwghLFqTentKWr2fx/JxxaSiXKb13BtXX3yFtbLXn+8xbYqhda+I/CmBdIgTHi
	nOMgg2M79IjCdJkGQbKkp4o+SIzrt2ZtClAZrz6d0fWGk1fd/isPDKgksUxzeC1ok/p0uWXoUjR
	PYHpkwcw5/9wTaI21HV4AHuPoGxYvGv02b0weccRrMf3Nh4hKUIKiDw6T72sNPMYzj+P3u+MJt4
	W0gRf3bAb0Xz5eCTmP8N9FHUox1WHV2Yw4WBbwFLrtuU8J/wW2ZDhPNLLdcvTII1czUaP226ieR
	qgXmK52RQKsymQaSSnm97cWad5cs/E89Bck8gTVQhcl2nFhRaAnmi3GFOuZdT62blegPU/2dDCi
	BcLjdnqzhjwNFjyDg+0WgzOCrkdIj6aAICS4icIgT/x5g7gq9I4DJXyNYRWBwX4083ZS2FQfZKW
	IASn2N6GxNTxNlNUU59A4mlVk4w18prF6FX14GizaJNY4Qsih7Mw0fI3/VfbMwHEnDkiHADxXLK
	sedcbK/vMSumUNp
X-Received: by 2002:a05:6000:2889:b0:43b:4f97:9608 with SMTP id ffacd0b85a97d-43b6423a2d0mr23386799f8f.14.1774304130666;
        Mon, 23 Mar 2026 15:15:30 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:748f:54e2:b3ac:833f? ([2001:8b0:aba:5f3c:748f:54e2:b3ac:833f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b6470380asm31776484f8f.24.2026.03.23.15.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 15:15:28 -0700 (PDT)
Message-ID: <b0ecbbaf6756c64d6581102e7c6fce1725c40273.camel@linuxfoundation.org>
Subject: Re: [meta][PATCH 08/11] linux-yocto/6.18: update to v6.18.19
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: bruce.ashfield@gmail.com
Cc: openembedded-core@lists.openembedded.org
Date: Mon, 23 Mar 2026 22:15:27 +0000
In-Reply-To: <20260323135057.1605923-9-bruce.ashfield@gmail.com>
References: <20260323135057.1605923-1-bruce.ashfield@gmail.com>
	 <20260323135057.1605923-9-bruce.ashfield@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 22:15:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233768

On Mon, 2026-03-23 at 09:50 -0400, bruce.ashfield@gmail.com wrote:
> -SRCREV_machine ?=3D "d8bda5bce522d27c0e71c9190ca1d6fe4ce8c580"
> -SRCREV_meta ?=3D "1ee48237bcd76936b5fb21bcd3b9202faa25e18b"
> +SRCREV_machine ?=3D "1fa8fa91abea837d76ab91c972e8387aae78157e"
> +SRCREV_meta ?=3D "899d5e6d3dd929b52ec2acc5b81e317444279f19"

I'm not sure 6.18.19 was pushed to yocto-kerne-cache? 899d5e6 doesn't
seem to be there.

We're seeing missing revisions in testing:

e.g.
https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3492/ste=
ps/20/logs/errors
from
https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3492

Cheers,

Richard

