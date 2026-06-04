Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92B3DCD6E4A
	for <webhook@archiver.kernel.org>; Thu,  4 Jun 2026 15:59:05 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15185.1780588735318374695
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jun 2026 08:58:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FhStw13E;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490bc6a7958so10089095e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jun 2026 08:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1780588733; x=1781193533; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9S+HhXqB0tbrbkGSSWeoqdVnc/06BLAD4rvbTQXEvXI=;
        b=FhStw13E/z5nIhRygIHLSEa4VFvPF/a46oxHMBEiIuiN51XaxUjPtGFFxfS1wbDQq2
         EEyiHJgDZPqyA6IoIz7vZtvGqqhlsM7ki5qmZAg71knuYJ3jvQElTHj9Aoj7QzfM+zR9
         c7zHt1hAJnjSWX8Cd1/y9Lpz9wTflwrKveC8U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780588733; x=1781193533;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9S+HhXqB0tbrbkGSSWeoqdVnc/06BLAD4rvbTQXEvXI=;
        b=qq5IPBGdnaRPGX/oUSglWJq5wFN02yqSVKN8hXR0E3LgW2hJHi+Y5lbMBmRXALH14d
         EQmPjvJIwu6LH92otmrtM+sDjhyRa6V0Iv07ksK2U8pyOiCGS2jnazKZsK1mBEjXSlIQ
         nX6Teh9b8ReEzI6j50zB8QFpxze6rTV1Ypc/avd9rsG5QhjQmouEFwAjv1Xsn4NS0W/4
         YwH5uF+dTOlw31tPQ0gemGCVXy+oMaUN38gtyCDLX/NGJ0RyRl1TWb1kX00HaXmIi+3w
         VZZYwG5JtpWRjNPfgUX9m4d4PmUV9CuE7rKbL9UBaMl6eP6vuhvaZmtGcHWOtN+5cLa0
         zv6g==
X-Forwarded-Encrypted: i=1; AFNElJ/4ltuo2oVWzQ0CiquC0s1sR+mybjcBMiRzABHYnPZYEgWC4iKhV3urNrla6Fe/wCMYPNgaiZObyxgizcEHlusM5g==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzgWu2RsNoJeI2ro6gTqipi2S6sRl856JWXVOpCgCmBCIpknBWP
	fniXEidRYSL5JGv2K8nmxSZtNPiiwZxdc0Kthq/798VFRYMt6yzcrw3DzHb4YLURBo8=
X-Gm-Gg: Acq92OGqrSa0c6+IU6XkXbx/Ny41sUTWRDyPlg62RPhpuNfMbVN9jpsiY9xP/auZMT/
	119LuGQOnk665q4AVmlB3OCBIx0Z0pLL4MwCFgT3vcGOPPc/I4CL8IsByNtKUPVF7L1aJf9ksxk
	UAos/1FjNvc4JjaTf1meIon8Vao57Z/uyBG7CHVW/UySeI0C6/G5m8c1EV2XzuiQF2cVvlNIJzx
	J2d/o7q8VxYFOxR2VcFHqjNvUbP7yX76gLA9NKdPxYBk1hf7Kthfm/UxA/QKRcVcsmEVUvpkXXZ
	Bd6heMrn/ph+SNKhR3skoDgGWKzA94QUzuOdI+r8EaN9Znqfp23vNLBV+w/gHIiq+xu4BIcRUhI
	qk2iw5Pl/a2MUro7LsAoy4WGeGkSgF26iBMQIdnE/q1gtrcBec7bYSyvdIDJgNojXsedXy8RtUw
	I6Gxq2Y8j7YmYPKdSYgjz4lQiJoZk1jz1OgFq2KgAiK4mT0z2BLavKB4eYtXuUph20lqAj6mYCO
	7A5l5GnAkI3dAm9UeUO3ntS0vvjKV8lg4mMqg==
X-Received: by 2002:a05:600c:34d3:b0:490:b26c:64ad with SMTP id 5b1f17b1804b1-490bc4cf867mr67685335e9.5.1780588733619;
        Thu, 04 Jun 2026 08:58:53 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:eed3:d0ae:8f44:9e49? ([2001:8b0:aba:5f3c:eed3:d0ae:8f44:9e49])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3c15cesm85726385e9.5.2026.06.04.08.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 08:58:53 -0700 (PDT)
Message-ID: <5b6d6856b26582800b18b340924aeefcf1cb40b8.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] qemu: upgrade 10.2.0 -> 11.0.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: alex.kanavin@gmail.com
Cc: Quan.Sun@windriver.com, Ross Burton <Ross.Burton@arm.com>, 
 "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 04 Jun 2026 16:58:52 +0100
In-Reply-To: <CANNYZj_AvPtJPWuDOfegDSdCXBLHwwxa4DZVFUxACobyqDpbmw@mail.gmail.com>
References: <20260528202639.4097815-1-Quan.Sun@windriver.com>
	 <85CB8A63-D069-40E7-A0C4-74D615E6CAAD@arm.com>
	 <867f6a81-8f8e-40e5-8440-31c6694bf5f0@windriver.com>
	 <18B55B33A6799835.3712505@lists.openembedded.org>
	 <CANNYZj_AvPtJPWuDOfegDSdCXBLHwwxa4DZVFUxACobyqDpbmw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jun 2026 15:59:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238132

On Thu, 2026-06-04 at 13:09 +0200, Alexander Kanavin via
lists.openembedded.org wrote:
> On Tue, 2 Jun 2026 at 21:45, Alexander Kanavin via
> lists.openembedded.org
> <alex.kanavin=3Dgmail.com@lists.openembedded.org>
> wrote:
> > Yes, basically split the introduction of separate qemu-qmp recipe
> > (and
> > tweaks to existing qemu recipe to use it) into its own commit, and
> > then do the qemu version update in a second, separate commit on top
> > of
> > that. That makes the changes easier to review and merge.
>=20
> I went ahead and have done the split, and sent the patches.
> Unfortunately the commit author has been reset to me, even though
> you've done almost all the work, but your signed-off-by is kept.

I've added a note to the commit messages saying they were based on a
patch from Quan.

Cheers,

Richard

