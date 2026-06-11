Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2A7ACD98CE
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 14:45:10 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47255.1781189101208826711
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 07:45:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=SM3eyZLl;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8ce0f17a69cso58863536d6.0
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 07:45:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781189100; cv=none;
        d=google.com; s=arc-20240605;
        b=fZPv1yghit/g29txA0nUeeQP7rOfBBczcQPfh7bJeXvTqplYCkOouM+UNSeAG61fsd
         ptmg4QieDpB1ezlMggxMUDmbgYFev4j0gRcOax2WLhyES5pbS2Vjqw2wPDN5PriH5J6k
         GeKP1NUyUf9KU37ENVFNyF4sNYOdXubaSkpgjXp12CGEoZkEnifhGwL1ri96jmo8fdLA
         d2sSJiBD8YNdQHZWPtt6rNn28cbliageaE9pdTGj34sgEIZYB5WrwWviI4GzO1y0bZWm
         uOc1il5uxR3YlHCiBfTPq0YWlGYJDv8ejVNQFuDb9N3izogC/ZEaDGLn2kfD51ugIRg7
         93ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vaFnOHMrhfpbN5F7uWMNmfp/QzRhcwZoalWl4szkMx8=;
        fh=Fhcx26/dNcqHy79HMIkM3DOxUORS9NBgNX0vd+b/7UA=;
        b=FAr7u4j/J0TbRVIVsLEJ+RN6JQIWf19/kRZTr7IGDM7wNOdCN/kddOVOPL3J5tCm5w
         G9qV+Cohs61KoCQsTcrgOId3ukhWpQmbSMDNHlzzicJcg66KTVyMq/veg7uN5/6MvB4x
         OfCSIi4g5PPKB+swzPX3hT+TYGcHOG3U9Vzpx7q4LI4Vhv8sGeREolghV6TRBUBazidy
         6sP3VvNwlOHwKi0GgW15uzvFoECUkQV8xejbAcReA+jNAAT+x+jvXieyZzT/WguxBJ49
         jCoCA/3SnWg05g8YZdtLmsH8mYq6U3z4bJekW3QoMUDOVhPTHNKAzc1e0Nlq1eUs3PWq
         EBUQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781189100; x=1781793900; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vaFnOHMrhfpbN5F7uWMNmfp/QzRhcwZoalWl4szkMx8=;
        b=SM3eyZLl1tD3+YpLQFjNNOFPQjhPhrGAEfgi5a4NU1OO/RAUfZ0Gch2Q6yRWzsMf8m
         JNySqEeQv2cQ4TxPMRBPKI2zhnriDXmXTCk4JXvT25Zbi048P4CeFyKTuCE4K3s1/1YA
         lk49YzdNg10ytkvszyogc4J6c0FoqBzcJFddjKXb5JwilFEl+vMWo9ZpleuQxwoalaz4
         K2fYaTIv84s56hDKUsc59XMvuvy96h1IhlT/N6MFGnhsNmUBUBQgdpt7kcUbJClZ9uXn
         QfmBxRzCd+AMOgjzmQcz07FO2/UN5W3ooiuvvKv129gDDNgdvuxC78Eqbc9aHy6Xqqjb
         OFTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781189100; x=1781793900;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vaFnOHMrhfpbN5F7uWMNmfp/QzRhcwZoalWl4szkMx8=;
        b=Ev5YV1P3urykRLCbh/AvbqUsFau9HiSu9JCOlQsB42meKVog9jr2iqUkxjODv5f7Tz
         wc10JIBAA6Ao05/HN7rAGEUEs2tkLVtdvbZcageZatxiBcaWvGSMAAQN1lqzgRK8vU09
         ul5KuK46vTwxiaVDHLasV1vf6dGJsls5wQ65fOPlExG22FgBT+lyMTV8BSQZCzqRtMWf
         VdH12Z78gzfxXyxKl1AgWkV2DdapFIebmiKneNy7WODwqkhGDP0U4vprB7Ts6NI9wykb
         bL8cWj3+nN8bX+JV02+COFe1DG2LbeQDwpz5ZYLl9MBxkSKKAz3p6K+Xs3xL22RNBDHd
         ZWVg==
X-Forwarded-Encrypted: i=1; AFNElJ9hzCBiNjh8fLz5ModtlXTCARQyHGHrgpbBMPfSLeYZ8+yh8oIAzg0/jlQCnWt5ijBEn41TthHlmY826FA1FmDd3w==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyLL5MTpMjGsSr7v4MC55c7x/ZFzVwzNI/+ToNfZnZTB/IIX7iq
	VjcXKoFBDnt2CY6BMkoSZnVJbJ4GoYmqOnz7cXPuc6KD/oiSZQuj/Zz4s2XbkFIV18W+hqD8FYP
	pcfGoCKj94QSVp1ZDGAOVLPPAm30MfTo=
X-Gm-Gg: Acq92OGGKk4deXLE7DX0V4Rcto/rRTT/oB90Yy0qCxT6+frz4OEKHg1uKTq6s07MI7H
	lk4BaBCgEAWpo5aUVdrKcbqgOqcfr4dvvezWvhtWM+nrMgIUHG7YdiChue+kn3iko2Iz//VDkVl
	Mwx7ItaMzAIdn0fKzvQ70HfK1U/hfaz6y3YVEYlIvD9FopMyN9RAhM4gO0BuwB2/SryuWve0DLz
	UotgU151HqPOOlwZO+WuoBwfxtydFSVMnRdet5nHPzYjIajYwnmHMfmrBnCPxdYZJgkbHJbeyyi
	ZqfbO5zToWuzjC5tas5A7dZHu5SnB8dAEa0X4ZFs5KeAbR3MT6SFW1t+IM2TaA==
X-Received: by 2002:a05:6214:f24:b0:8ce:d302:f069 with SMTP id
 6a1803df08f44-8d1d7a78ad9mr48807876d6.3.1781189099996; Thu, 11 Jun 2026
 07:44:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260611-sdl-v1-1-93d4a51684bb@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <20260611-sdl-v1-1-93d4a51684bb@rsg.ci.i.u-tokyo.ac.jp>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 11 Jun 2026 16:44:48 +0200
X-Gm-Features: AVVi8CcWa2YkSwfnUuxblsN3mVrm8ciRI9QycibNWau89urBanhBUimj_n9I5Hc
Message-ID: <CANNYZj_tg=DTXW3mdUGyifCDpeLAE5YWHLCNuuwQV_Y4fUsTpQ@mail.gmail.com>
Subject: Re: [PATCH] ui/sdl2: Explicitly specify EGL platform
To: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Cc: qemu-devel@nongnu.org, =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	=?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@mailo.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	openembedded-core@lists.openembedded.org, Quan.Sun@windriver.com, 
	Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 14:45:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238444

On Thu, 11 Jun 2026 at 13:58, Akihiko Odaki
<odaki@rsg.ci.i.u-tokyo.ac.jp> wrote:
> Resolving the issue described in the GitLab work item also requires:
> https://github.com/libsdl-org/SDL/pull/15806

Thanks! The pull request is only towards SDL2. I believe SDL3 (via
sdl2 compat layer) isn't affected (it sets the platform correctly in
my testing). Is that right?

Alex

