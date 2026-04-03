Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5066E7E358
	for <webhook@archiver.kernel.org>; Fri,  3 Apr 2026 09:15:17 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7998.1775207714976978176
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Apr 2026 02:15:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=U0+dz0o6;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a12cd0bd79so2047344e87.2
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2026 02:15:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775207713; cv=none;
        d=google.com; s=arc-20240605;
        b=ORe0mQjdD0FoVGq9nozQENWiERYLkyioH40edlmQlQikZYM1PLA5Dkn/n9KIKseqjg
         mag74NMLn2i895f7i2nfsDFLqIjeptMY9mr4tbSfZMgLAejm4irVXkPdKwGxByKQWdW1
         gINqvzCt1tXv3KDihqOmCKIKFuVyFZ2C338hU60ps6UPMBqjWIa52tXxkuVfMnP85OBc
         jslsofEfp1SwMH7ZbK3hdGg6SlPJNMN3oaYx4yUyb2z+Xns7UDzT4NxM0xKFWnPnU1Rg
         vf4nnPVIdY11wdO7fxlBQKGq9q6ECnVT2lSXmZ6dDTeTNyMb/3XnbTLcxlJofTyIWVC8
         aJhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CEL45YET/TWKNKnxAi7cpRSFhEBF8fKkU8tfhU6yazg=;
        fh=qaX2b92Ts57s+meShbZR8MqAOncI107BQAfdp6tG2Lo=;
        b=FhGkflrKzhtHBx9T61pMFREy42e/H4ZblBtWrL/qusfnTd2MukheTjU5tQMmdLlEPP
         tnKOQWpiNj+NHcbggEMTjU+7z+q8xCWKuJY+lDtK/DhnSbiqA/pIAmgEej4y/8rAvhPS
         wgmK4PgB20QAQKf2ME61jFB/hvUqHiUQmRgSSedY1iIZegAlkjjH94iF5wzHqqbZSbiM
         kll023vn4IE3ejUQ/kw/jKDgx2YM1YvDwwkO8k4whEw76gKlnK4Qz5sIarr6aa/gZWj8
         9cPwKx+D41Y75XsIj63TcWq4W8qe6j3ieGchCWupljv0H231hNc0KW15gpuZsW1W9pu0
         6iIQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775207713; x=1775812513; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CEL45YET/TWKNKnxAi7cpRSFhEBF8fKkU8tfhU6yazg=;
        b=U0+dz0o6vtA/q6BegQ+gmdmjiYUQnw78MDxOUgsewVczkYRYuzw1OCH0SsdS/Pi0MJ
         yEaAnSIEzSI0SVV0qcmOMOJYadrUrxtj0bXeLTzuaXfDOBc8PV44Bri2180KboN5WpQ+
         bAN8BM/wyt57Lo5s9AVQMMwrwxIpdaucph/pUtAfP+fBm78evs9pJvIjllZlyZGULzlJ
         AIqoJqTniEaEar1kBto1e+1IDPL83rDXs9lH3t52r+jk/1pqKFzEApDlI4Qw8B0QWTEd
         u06eTO9z8NjVf+03TPk5b7pGxDqVxrECmO2v3fBq8N9Pg5FFfH3nVO35+z+kIzBDtwiw
         Nu8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775207713; x=1775812513;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CEL45YET/TWKNKnxAi7cpRSFhEBF8fKkU8tfhU6yazg=;
        b=E6haRkaC9eMZY2ltgPK7yLoOH1pQFUENdTq04kfLLpfVLINkY2V0x+FUWK17xSJhuA
         A1t0valx+MXgqMhYHKw/4n+MIMabqG0LNhQVueMThkU6JRLupZm5GUbrZYOgAlQjikcx
         5bYryFYQGYvH8Qjb3BYbz75zt97lrMR6cFxKJfpfIPmUQu2smgl7GjOMaCRk9ykE+s65
         WSAhqgS2h1ysCKHOA/3+DAHbgpgP0GfV0DWfcDxIKf5c1hel+2Wy2qUaHqx4bYyVkKto
         muEc2ixLA3O1Bb4kmL1Bgoortshva7udTbvwpwYg53hRmthkEZreUeULmQsUSIyJVN6u
         PvHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXD+uTAiiIVFD/cwVQIPYfZ5YGe2R5P+XqYbPhgkSsRDIKOqVbKBqg0DcK+bPux9Ogea8btEbLuUCAnvvwE5i8pGQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzB5+/Aijt96s0ad3HHNIFueVAclwN9BCvUQXg301zgG3EnG0OH
	xj8r7Uf+uPFHqY8vOh1xxZNPFP8z7RQ6vetpnkUsr2l90zjwyYalwS8Ax7DHxi0JFlAbwxFtO0y
	uMXmBlwODVwEyoyF8Fjybsi1HAmSatOM=
X-Gm-Gg: AeBDieuvPzyf55nhrBNezE2RPSo9lp0F4dY0OnYbuWagQAmlRO941kPgmgj/j1NI935
	ayxjYsxm7glwskAa8ZOyj6/urdvfv9xUMN5JlFB1j2zWKiuFXHxQC4pH7f5lrd+eBqOwdV3MypF
	l9J+qTBxEBdNjD6F3YKNc5yXYUbHcvu+YPCc6S6IzByjNUFFp4Ole43P8HaTP4aDy2M6HH5bSrn
	f8ZtT+BXYN0jD1iOQT9kRH4tORJSxOByb2XMFb9ibhyRrioEARtXPrpMFgmgW0hXSs4O80lLq0R
	Xv1yr2PPKA==
X-Received: by 2002:a05:6512:3b1f:b0:5a2:b43d:ac47 with SMTP id
 2adb3069b0e04-5a33754efb5mr721227e87.5.1775207712558; Fri, 03 Apr 2026
 02:15:12 -0700 (PDT)
MIME-Version: 1.0
References: <DHJDUJSPA7LG.3IKCP2QUJBMRL@smile.fr>
In-Reply-To: <DHJDUJSPA7LG.3IKCP2QUJBMRL@smile.fr>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 3 Apr 2026 11:14:57 +0200
X-Gm-Features: AQROBzC66UuUmUGAr3LMp1zSKBkkoYp-2PN_PUFvQbh0f6HoHfsig70YdyhRgDY
Message-ID: <CA+chaQdp8E_HMyo6Qx6C+PuRrLbrqgbFdQF_WdbZS1ONncxb3w@mail.gmail.com>
Subject: Re: [bitbake-devel] End of whinlatter stable support
To: yoann.congal@smile.fr
Cc: Yocto ML <yocto@lists.yoctoproject.org>, 
	OE-core ML <openembedded-core@lists.openembedded.org>, 
	bitbake ML <bitbake-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2026 09:15:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234574

On Fri, Apr 3, 2026 at 10:46=E2=80=AFAM Yoann Congal via
lists.openembedded.org <yoann.congal=3Dsmile.fr@lists.openembedded.org>
wrote:
>
> Hello everyone,
>
> As you may have noticed, the end-of-life date of whinlatter (2.16 for
> bitbake) is near.
> The last release of whinlatter will be the 5.3.4 and will be built in
> the week of the 20th of april 2026 for a release the week of the 6th of m=
ay.
>
> If you have patches that you want to see merged in this last version,
> please send them before the 10th (next week) so we get enough time for
> review and testing.

I would like to see my glibc-2.43 compatibility changes I've sent last
week merged.

I've tested it on 26.04 in docker, if it doesn't show any issue on
other hosts used by AB, then what's the harm of merging them to
whinlatter and scarthgap?

Even after whinlatter gets EOL someone might use latest ubuntu release
on host and then try to compare his wrynose build (where 26.04 works
fine) with whinlatter build (which fails immediately without these
changes). I often use EOL OE releases when trying to "bisect" what
changed in upstream layers e.g. between scarthgap and wrynose.

Cheers,

