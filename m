Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96AECD767D4
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 10:42:18 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14324.1766140933952058531
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Dec 2025 02:42:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IKT5jhAx;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-88a37cb5afdso32016896d6.0
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 02:42:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766140933; x=1766745733; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=k98c+6ViZMSwEA+8lKd84gt+ZjvMmB61Me91j3c583Y=;
        b=IKT5jhAxJ/BMFwdlNG3y+gzj4Mk5kdFWvFX61hX+ZyBmNp9SUB6KmT6hRvs5n7b45j
         hW+mUc2yUsbcYdPxPQ7MfYo4H0HI4el3gNYi8EKmvEilNnPPYYW/n9eY+boSC5kmulFR
         HXjpF7Xjg6qrJsuDFWztF6fg2IfbfwDLuXoWTyLYiaCvZWyAgOrCaI8oDlmat/vb8BH7
         YiZxllCMJuGQ2icHmZpj/zSREIvMmSijRKAbqPvIOdxvIsbVoaRPVcTeA8Hp+VA9ZGd/
         IXnKc1R7i1ionnE97stam2hOccc9OUV8Roq2SfSUr8duGZZyDsDDGTf7oDtyRSK1x3jX
         AKWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766140933; x=1766745733;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k98c+6ViZMSwEA+8lKd84gt+ZjvMmB61Me91j3c583Y=;
        b=c1PGWauJre6iXrobwiEcnADG1HPhSd7CMWpT8077d2BEspe3CBgj3VEC4vGe36yHPH
         ti53hnweG+z3kn0crwrJ3aoG/CdUvgmys7mFalJ0+qh06Lori7mqdtttYhJvejcbQzRh
         rC+WtI3lTtD1uk0SjAvKlzTVOTsv4zcinQhWGID4AcOmsOeq2s2EsRa3nIHDWIuFKZvE
         E/AtkZLmZcB8ABPM0DMDYbk1D6biJWR1z8k8uK8ivSgAEVXt2gin1vFrSYb0zgiW0oKW
         EMimnW/czeaVAh1nZ82pTEbFem+xw66vUQ07dh7/p54IbCXikHAd5dneNuyyEy6wOVjS
         HJMg==
X-Gm-Message-State: AOJu0Yyd9x8/IcpgcYTMr5FDJ98ecBvMPXx3qkWIyUjGMAS1qYPvLQoT
	2V0VnpViNHBOHbrnUjCDs8aADa5MVz0mVBTPudNwEGM3vQyGBFQc5UxiygFcEW3ZZonZY/Cr+NS
	kJYD14dBaimNoLFthnvo+LRwkR8uTj+s=
X-Gm-Gg: AY/fxX4iTSfy8MfL5sSyKPYiC7sG9hRLaQS90DzYqaJLz2DXi0hiri0wgSq8L9vX6Rh
	SshpmP7oMoYudd7HRvqnS0oYlqxfkgrZf4vRmhg1v47WWEjVAWiBXXqGvTZ480UL7iUJ37dY+uO
	dG6JAffvzhlD53VjfmwTd66CtlAmRRQR0AYUJj3T0YIkL9/ZvQD8YGhp2TrHl/qzOZJnG6rljo+
	5CBJtha0c6pYiMcUoZP4SFnXwhTvsQwAHn29hBRkziZCZ2BVseatIHjUj5hXDIujrgVYR6qIgH6
	9oeieB29OvEnhS7tg9oppZhEyYRKNg==
X-Google-Smtp-Source: AGHT+IGdhN2F5cLNFwGtslQAbA9jFBU3u4182puDxmjLlIiqxzExfuMf4UEr2HYyWcN+jo6LS9ew0N0eR/eQJmk5wy4=
X-Received: by 2002:a05:6214:54c5:b0:888:5a84:b5e3 with SMTP id
 6a1803df08f44-88d81963b2fmr34411916d6.8.1766140932829; Fri, 19 Dec 2025
 02:42:12 -0800 (PST)
MIME-Version: 1.0
References: <20251219102956.442714-1-changqing.li@windriver.com>
In-Reply-To: <20251219102956.442714-1-changqing.li@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 19 Dec 2025 11:42:00 +0100
X-Gm-Features: AQt7F2pDi07KbZ0k1DQ_TECl-xLyoPkO89y9pPNdH_xFK3vrmdQAiM1-s02eRjk
Message-ID: <CANNYZj8DGcNEFYWgbVLzv7JA9rDvzE0OopvSNfiYUS0rs5jBKA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] packagegroup-go-sdk-target: remove go from packagegroup
To: changqing.li@windriver.com
Cc: openembedded-core@lists.openembedded.org, raj.khem@gmail.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 10:42:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228209

On Fri, 19 Dec 2025 at 11:30, Changqing Li via lists.openembedded.org
<changqing.li=windriver.com@lists.openembedded.org> wrote:
>  RDEPENDS:${PN} = " \
> -    go \
>      go-runtime \
>      go-runtime-dev \
>  "

These packagegroups are intended to provide the entire toolchain,
including the compiler.

Alex

