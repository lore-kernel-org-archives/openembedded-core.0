Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EECCCC25B6F
	for <webhook@archiver.kernel.org>; Thu, 26 Oct 2023 10:53:15 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.197323.1698317589814394301
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Oct 2023 03:53:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WuLi7ZrL;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-40907b82ab9so11147725e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Oct 2023 03:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1698317588; x=1698922388; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Tp0mR14vX4tfUQMR8+meJNpEz0stxopkUbDagGiuRuk=;
        b=WuLi7ZrL+mYltrWt5nrqdmnTgJuykLPYRMrmGLyjzKgyzIJfxDl1oR5lNkP8uD9Ylt
         PLWvLRrt2pXR0aOIkbf6xLEH/cVJFkMBtbGV4WCeLABhU7NebBmbxeKbGC/CB/A3uUgg
         LuLSeDUyWafilHne+zgwTVROeyDjrTRQHBzHA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698317588; x=1698922388;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Tp0mR14vX4tfUQMR8+meJNpEz0stxopkUbDagGiuRuk=;
        b=ko8Hx62PoIFfk4vBh3slRkjnX7431cK7hHRyD4JgCntztoRjRMsTb8LIItILfPm8WC
         lGgpouywF/gigSKBQc+4TSGM7cFj10THMFGdL+4quZIljFcvPVeA6nXbnLce7uYM8KHI
         z0eKr2nfrdu5P0894Urt1lVWmBWdN0ikxDS/HgbOUm2E2Nx2/zTjmNmmKJULJykZLRvq
         t2469N+26gyesQZxitYY+g+netv2g47Wr93pB7dmdFaJlYFCJCZF8x/BvwYBsfF9zXYm
         nAPKWy6V1JaVGnwpQ8+z532yQPx93DbenQLuKk9nKfRJeqoe0JPpi9G/4C5Gpxkja7Gu
         kExA==
X-Gm-Message-State: AOJu0YzgOt/Tx3tlryg0jYaFiPeanGCOZ8bkW5tuan15d40LNzOmsrDN
	6L6wWLrCmk2pKndrb7cd3rCghnPGl0hFaUbfO48=
X-Google-Smtp-Source: AGHT+IHB2AO2DmP1mddHddkDoR0q2w7PZXv7cwp4ijtD7/nhDVpFF4jvhhseCZgibd/OkXSmixlihA==
X-Received: by 2002:a05:600c:358c:b0:406:44fc:65c9 with SMTP id p12-20020a05600c358c00b0040644fc65c9mr2755702wmq.8.1698317588091;
        Thu, 26 Oct 2023 03:53:08 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:aeb5:bfd7:dc1c:82a3? ([2001:8b0:aba:5f3c:aeb5:bfd7:dc1c:82a3])
        by smtp.gmail.com with ESMTPSA id p8-20020a05600c358800b004060f0a0fd5sm2265044wmq.13.2023.10.26.03.53.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 03:53:07 -0700 (PDT)
Message-ID: <d1592d8729869060f7226e55171ea7760672aa0d.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 3/3] selftest/sstatetests: add a test for CDN
 sstate cache
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Luca Ceresoli
	 <luca.ceresoli@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, Alexander Kanavin
	 <alex@linutronix.de>
Date: Thu, 26 Oct 2023 11:53:06 +0100
In-Reply-To: <CANNYZj9NJs2jBKZxhDAAARcdCM+sX=d5Ztt+fzYeCh19dH4wFg@mail.gmail.com>
References: <20231023110618.3525311-1-alex@linutronix.de>
	 <20231023110618.3525311-3-alex@linutronix.de>
	 <20231024103345.306b9171@booty>
	 <CANNYZj9NJs2jBKZxhDAAARcdCM+sX=d5Ztt+fzYeCh19dH4wFg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Oct 2023 10:53:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189719

On Thu, 2023-10-26 at 12:26 +0200, Alexander Kanavin wrote:
> On Tue, 24 Oct 2023 at 10:33, Luca Ceresoli <luca.ceresoli@bootlin.com> w=
rote:
> > This is triggering:
> >=20
> > AssertionError: False is not true : Missing objects in the cache:
> > weston_12.0.2.bb:do_package_write_ipk
> > weston_12.0.2.bb:do_package_write_deb
> >=20
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6091/=
steps/23/logs/stdio
>=20
> This is for qemux86_64 and seems to indicate that world builds (with
> multilib enabled) don't match plain builds (which don't build
> core-image-weston). I'll resubmit with that removed.

Can we file a bug to look into that?

I'm also a little puzzled as this does seem to work some of the time as
I managed green builds of this.

Thanks,

Richard

