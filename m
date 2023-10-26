Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E55DDC25B6B
	for <webhook@archiver.kernel.org>; Thu, 26 Oct 2023 10:26:55 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web11.67399.1698316008720768081
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Oct 2023 03:26:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=B8X76zzc;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2c54c8934abso10607571fa.0
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Oct 2023 03:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698316007; x=1698920807; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=H6XKUZ+ShRTBleOAVM5eiEYm4TXgOQhHtNM5PJQu3Dk=;
        b=B8X76zzcryRPK7mYsYTx9/x3cEJzbZfrJaCTTW5j40KASKtEwIXlq6gQ8w4KAd7XgK
         b8CJKt+zIDybKWT6hK6u/5l8rtDyrI+43RgmQXc4dXYm5f74DIzTiDgTnn9suajKNXAM
         pvO0CQOtW/9ZrtE2XE269ZrOoyOSyI4r5KdDMIUnptdS2ElPueTa7ECnXxcikkt6YCKk
         MRqRkjA3utpBwIrnbm2OFuWevw7nr40u33BjjcDh4vELR8MU2QPCdFcPtUkLON1JQSGN
         MZicwfcSRUUlfzCAv7G33EgrIbZ+znfxvSs17PDsM9bkZcufyLHkapqpMS6OGvs9oLpE
         0zxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698316007; x=1698920807;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H6XKUZ+ShRTBleOAVM5eiEYm4TXgOQhHtNM5PJQu3Dk=;
        b=ZXZfEMLtTbl88bq2CG3cChNwiVSyydgTGcAWECdmQ72XPe9hxbb3Qr+uXcTZaec3yO
         TB+f3pOIYkG1v8EGTbDxrYET4jfTeRgJSNLcqWaB+vKktcaHqA8fBoPuJuslEUFA7y5a
         IMuvctnXNOtkVmr0tv1AhyDYKCTSlZTgHJC2my3KIQmcisL3ahG4QIp0NhsDoSRCfDuR
         MtZQ8OXfOnwG6a/NtOi0ViQYoLN4gKl8wu5aeut3YPP06fdqCLYjwMzy5nf3AhOpKK1I
         T1cULJduC3yiJ9000Jd68tfem7f9LPAheWdwtv9XHon5vsUiKc9MRecDcB8PwGAbY7b9
         sBAA==
X-Gm-Message-State: AOJu0YyJ93/VGZXsTzQe7m6FxroD0Q9kjRFsdYblsYCVnOZ50wZw5NLj
	uAaUPyeZqhwoDpPeMZqe5eBpvgvUuhScHex8Hzg=
X-Google-Smtp-Source: AGHT+IFzvLiOk6XCAlvyAq79NRM17y2sqQDmYEoUH0D9u7FtflMDvGUCky5mFbdrUB4uh8kaXei7roqI0cGyWuvKyXg=
X-Received: by 2002:a2e:a543:0:b0:2bc:d5ad:2758 with SMTP id
 e3-20020a2ea543000000b002bcd5ad2758mr14549055ljn.5.1698316006268; Thu, 26 Oct
 2023 03:26:46 -0700 (PDT)
MIME-Version: 1.0
References: <20231023110618.3525311-1-alex@linutronix.de> <20231023110618.3525311-3-alex@linutronix.de>
 <20231024103345.306b9171@booty>
In-Reply-To: <20231024103345.306b9171@booty>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 26 Oct 2023 12:26:34 +0200
Message-ID: <CANNYZj9NJs2jBKZxhDAAARcdCM+sX=d5Ztt+fzYeCh19dH4wFg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/3] selftest/sstatetests: add a test for CDN
 sstate cache
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Oct 2023 10:26:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189705

On Tue, 24 Oct 2023 at 10:33, Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
> This is triggering:
>
> AssertionError: False is not true : Missing objects in the cache:
> weston_12.0.2.bb:do_package_write_ipk
> weston_12.0.2.bb:do_package_write_deb
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6091/steps/23/logs/stdio

This is for qemux86_64 and seems to indicate that world builds (with
multilib enabled) don't match plain builds (which don't build
core-image-weston). I'll resubmit with that removed.

Alex

