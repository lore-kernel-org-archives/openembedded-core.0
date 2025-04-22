Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82140C369D3
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 15:56:07 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web10.43749.1745337366305633955
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Apr 2025 08:56:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=a3J4/7Dt;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6e8f06e13a4so60376d6.0
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 08:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745337365; x=1745942165; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1+yDtNiEnbjPW+TtrZEDHOx8AqpP7PETZjoD93HNO5M=;
        b=a3J4/7Dtk+Q+/JWoRDCgFykR1mvixMRYXfq9EMZs+1Ypr3XYPz2vqJOk7INOn8a8BL
         gV2fzMcWq5i1UR4zZlBSsTOZIS1ZlLF+WowBjCLf2HMy71ODMrSmNFq5kP+8A6vX9vVU
         Fb3BRWEPj8ef1ky++MVAex2pajyjBcuW+FJ7BZHYhUIl/NWnSmE03Ym++mij7MWBLrZM
         6NAABluiqksJvwEy4sskh0oBpbObq/fXmkxJuKdantQYvgwl4iEbhOnrNKFCJ5wW9SaZ
         bXl6DL36cldcRc17qwE03W+OIeGUGF7j+AQavAqwGgKJdxErD5ARV8vVdrmUAhRJWRqx
         ac4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745337365; x=1745942165;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1+yDtNiEnbjPW+TtrZEDHOx8AqpP7PETZjoD93HNO5M=;
        b=BoxeqIozoWzceAF8nk7aWy8fo+IQvCPxbHQaE4gEfCsEdhPurQqJ4HxI1Yek1O9Qt2
         u2cds9vJQXlbtGbwYATenY0SBc2WW9fK9djmWkyv8v6Tj5RUtZD8P3ltyAc1RA7ItF3B
         5tq8d4VJdqMEd7H3aKvQG1PbTH+AX4wQ6+Pm1fKHCoLt1Kr5WN+F43YW4u9Iin8jhAhz
         a69y95F1BE1jOh/j/gMefTJ9o+4ecUNQFykR8XJAhXeGnSPb1UK8Ed5wNzHtvA3AI0oy
         iQc10h2Tmy1XAR2zjAdsa5A7/ZHMeytLF81yYxwf38cQrp8qeRd2c0YYGL1/JPHzQi6s
         yDFA==
X-Gm-Message-State: AOJu0YwsxvnVWJzfKiZUSIRwwYAA+i3cre5Y8Hl6rnOFVFkb1m/W9G2N
	vrxS81cEh462IXd2LddWU5wKxsUzRdsaHCpVLLN9yJubT7WOzxh8Aa7Y71LivXN74nmk5ZIr8oq
	0zrfJL+VhIW+lq5F8DnOxzgqEdvI=
X-Gm-Gg: ASbGncsAyfRV6EGz3L6SIuP5r42CiC4nXuMCLMAW4yzuwuhGZyIQ/kUDd743nu/ByY2
	kIGHOzkHPfp8sr9TeC4HFBwpbjtcftUEi0JsWhiSKlfUSOksDV3Aa394dTWkv6n4SPYAZEmDTR/
	GU3ZzvXNJbmDefM0xJKrOlW0JYjTqSco1wZ03Jok26/eAkp6RmRC3bu2AP
X-Google-Smtp-Source: AGHT+IGPIQpAr249mAuTA6A3+42XM8GWFsbyCHHvQV57ke1qon5vkSgzOxInTYYe49yV4Va3UF8/2s0BkbGlk8N1stw=
X-Received: by 2002:a05:6214:21cb:b0:6d4:287d:b8d9 with SMTP id
 6a1803df08f44-6f2c4d6a40emr254892506d6.2.1745337365365; Tue, 22 Apr 2025
 08:56:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250422-mesa-demos-git-v1-0-87eac5e3af26@cherry.de> <20250422-mesa-demos-git-v1-1-87eac5e3af26@cherry.de>
In-Reply-To: <20250422-mesa-demos-git-v1-1-87eac5e3af26@cherry.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 22 Apr 2025 17:55:54 +0200
X-Gm-Features: ATxdqUER64lsrFw7mp_DCTxJIJDIZs7pJV7rlIhXgC82SxA8aTe-iwcpgMNQwN0
Message-ID: <CANNYZj-NskJ-5Vs_h6intyW5R=q6kF7kPHU5tWBpmSv80CP_rg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] mesa-demos: use latest git version
To: foss@0leil.net
Cc: openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>, 
	Quentin Schulz <quentin.schulz@cherry.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 15:56:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215237

On Tue, 22 Apr 2025 at 16:28, Quentin Schulz via
lists.openembedded.org <foss=0leil.net@lists.openembedded.org> wrote:
> When trying to use vkgears on RK3588 with PanVK, version 9.0.0 (released
> two years ago) currently crashes due to a Segfault. Considering there's
> been quite a few commits since that version, let's use the latest commit
> in the master branch instead of trying to figure out which patch(es)
> exactly fix that issue.

Please no. We do not take random development commits just to fix a
crash on a particular target, and I don't agree to making an exception
here. You can figure out which commit fixes the issue, it just takes
more time to bisect to that.

Alex

