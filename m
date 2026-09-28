Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 849B9CA5FA2
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 15:07:53 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.59761.1790608065912264263
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 08:07:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=eM+OqsuT;
 spf=pass (domain: smile.fr, ip: 74.125.225.141, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6b885ef8so17767175e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 08:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790608064; x=1791212864; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=p+sGoORigVbEC1NoQTGiglLR6N4E6Af3cSnXmQ9oe04=;
        b=eM+OqsuTcTdsYZgAW6WuIoxe25d0R0r/S9j0G6137r7thH4crggyAV0+4V8FOy1lfN
         46n/Awq2v35m87ZdCYey5NAZYxNyvdTb0iukmM7LJAoztVnZVJuPJ8GAZ11YHNKow7ow
         pJR37knDAEXClvolbQF4/XXZSs+swZoiL/ntY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790608064; x=1791212864;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p+sGoORigVbEC1NoQTGiglLR6N4E6Af3cSnXmQ9oe04=;
        b=G1j1jo6pprxRWEPODKfbP9DqRPhibWmXkHnZOzrOHcMtxhlxm5nGSwxPlXjidbh0xA
         WzvAV8mMq+Zoz9H+NO+yEg2wmYGdkUvdTA9ySMyLGtdhX7jpYGhxBessqpHTZlqBVJuR
         yU5QbuHewZZfrnc+G7UUV1c0EeRLa9ZAUvCHDTgtLsfCJV1/eAaL6L+vKbVweg3Kawef
         oX9ZI7szFt/D9AYcG5/LUYXcWDW7Vy0fJhrOI7O2C0tlbKERPW7R/z++wXj5iIIKwMhB
         HtdsV5deSx5VGNvujKRLpBFBt+z1HG9lU3nnk6QqjpsY8qStTyr7Kx+IOiWTcQdEgNRz
         k/nw==
X-Forwarded-Encrypted: i=1; AKwUvBwXqUflmBOklzXhiMbPrjcwEju0lnG9CeFUYhsilX6o0lpn1iVBFat6vGw3EcNeh8tNe2gpHZ8DMZ/tZc29vbC26g==@lists.openembedded.org
X-Gm-Message-State: AFuF++kUk3uwgF0itC4QY7nOsBLc3meaDuCr9fVM2usEjwVuMTZFbbia
	Kv7SeKsANfj3zTzdkHGJpMxVXAu2ZEzMAbbzu4rwcMbZX16CaKGuAlf7Hyzo1wnEU1k=
X-Gm-Gg: AYBFou2INgNoJX8RTyQZgwXlV7ThawLWk5Q2n1bcPvvPVXIXIIwWqcVar/yyux1TnjJ
	jKXtNpxD/QInX5/NS3gztFDQs4VG8PXvpE1YPYjxvAqAWWY0iVnYpqLpOxeHoJOirDWlaHhC3ho
	2I9N/NoRGKBj+eaN5hBcXxaf+s8+VGL28+fyFIt7gncsK9RN6o+5AjQezLozNvfD4Uvvxd2gWdB
	9HrCyc8T6fr7bqtFxv8+L3hnA32+ya2/jQycaIaO5Jpzdgm8yWTA/eA555W7uJ/w+/1GnqNPdXH
	jobrT7HS+rDjK8XerN9Wmk1K+j5HVx1MlZ4TGEsDJ4uO+CETGuJEysf0g4Zk0FUR6aY+6wtxWDf
	ttF/+WtvRtFMpz+oaALtToqGr+39kuUw+AXg8zpaBXhFFEwLW/Qdo7jBJIGEHX0+scfs7wayyXG
	B1IURnRFcT7N8f0SpKx5wqIMi46a3u9Kri6M3pKTVrP3Ow8dhRKlxzq7dUW+WPSZuj7KcduWZ/f
	1Ys4JjblDDyDbByFXCGdlKGmQeQKrHMvNOfIZ1WFuNu/moHRoGJCmcN9aJwwQ==
X-Received: by 2002:a05:600c:314a:b0:49e:6778:c2bd with SMTP id 5b1f17b1804b1-49fe66c86bcmr250538565e9.6.1790608064121;
        Mon, 28 Sep 2026 08:07:44 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00178ff7bsm199773475e9.12.2026.09.28.08.07.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 08:07:43 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 28 Sep 2026 17:07:43 +0200
Message-Id: <DLR1L06VPOY0.X5MWPPDOMG5B@smile.fr>
Subject: Re: [oe-core][scarthgap][PATCH] alsa-lib: Add ptest
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "Sana Kazi" <Kazi.S@bmwtechworks.in>
To: <UpStream_IP-SK@bmwtechworks.in>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260921101012.1107752-1-UpStream_IP-SK@bmwtechworks.in>
In-Reply-To: <20260921101012.1107752-1-UpStream_IP-SK@bmwtechworks.in>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 15:07:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246770

On Mon Sep 21, 2026 at 12:10 PM CEST, Sana Kazi via lists.openembedded.org =
wrote:
> From: Sana Kazi <Kazi.S@bmwtechworks.in>
>
> alsa-lib is a user space library that provides audio and MIDI
> functionality apis for simplifying application programming
> and provide higher level functionality
>
> ptest executes below binaries on target:
> 1.config
> 2.control
> 3.client_event_filter
> 4.midi_event
>
> The following changes are introduced:
>
> - Add the required include path to CFLAGS to resolve:
>
>   fatal error: alsa/asoundlib.h: No such file or directory
>
> - Remove the test suite execution "make" call using sed to avoid
>   executing tests during the build.
>
> - Build the test sources using:
>     oe_runmake check
>
> - Install the generated test binaries through do_install_ptest().
>
> Signed-off-by: Sana Kazi <Kazi.S@bmwtechworks.in>
> ---
>  .../distro/include/ptest-packagelists.inc     |  1 +
>  .../alsa/alsa-lib/run-ptest                   | 14 ++++++++++++
>  .../alsa/alsa-lib_1.2.11.bb                   | 22 ++++++++++++++++++-
>  3 files changed, 36 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-multimedia/alsa/alsa-lib/run-ptest

Hello,

I'm sorry but adding ptests is not allowed under the stable policy.
I have to reject this.

Regards,
--=20
Yoann Congal
Smile ECS


