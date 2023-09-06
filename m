Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A2D5EE14D3
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 19:28:19 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web10.91.1694028496328818179
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Sep 2023 12:28:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=e6U50VFG;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-50079d148aeso201739e87.3
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 12:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694028494; x=1694633294; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xbuIh4814QX/1SIb1jH+w/VWPgZYX8J9Qq/bARmtQkQ=;
        b=e6U50VFG+7JXq8CsCd+mOVWSRIgnjzoszMHx5Xw+aIGFUFD/erKUEhcpxWazHvSE41
         r09UJADxBQFZeCrIEVWhDB6w29CiD842Lf7WiN+9FQXx7j5riMUICQzgQBR0di8Rh4vR
         QJ9YmThpTrTq5UxV5lkOQIQpmEaelceZ/Rc5tlCPaoQpvkQPxenpRt3RUAJRDUSifri0
         QvEsA7jtNTPWmanPtsKI5BpHWsFSu9FFfClDREimkXhTEIOgvEICB2fl7ae19j+Ps3sr
         HiMZ2YIg2twP9X/wVkwT3+ZFsO8Og6BOLyBsSBUMARSDj4yPhayFqb91/En2B5UoMyzu
         1dZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694028494; x=1694633294;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xbuIh4814QX/1SIb1jH+w/VWPgZYX8J9Qq/bARmtQkQ=;
        b=BBj0mascdLNme0QnubYvMfwXroCEFWad7F+NpZs6NFfct0+ovaFD2oBTMj5R85no0m
         xMvaP0TlZKBS7IBT2XiHaX/+NFukBqbr7ZzevpqbpE0tBra8RzsIOk6bz6AE64/YwG/1
         ikfaODLcgUuRG9Xvuhaip3KB58Q3Ecu5iaOLXjSVPTvJyawfGw/pCUsM1eo2VBcjXiWG
         fj5OXgRJyeuc1Pn9+QVOUqHspd3Bf18wT+mVeB9CkeK8DRuxP+D1dMaQXrU2YJzUX/7Q
         g23ShSDKp60ekWnjoiV4GcJNIXg5TL6Q8obCn6S/EXA/Vy9/Vj/z2TcDyJxO+TF+24kr
         4rIw==
X-Gm-Message-State: AOJu0Yy8qVCVAbGBbTHMfFcaKCUVNZxs0KQKuvOPe7lO+bQC7VpXWmQw
	6nF36fccEdqatAPR2KdqGXLY9/p0scCdRAqQd+U=
X-Google-Smtp-Source: AGHT+IHiD8plasJToETOoV9l8daj+eTmrc/q3ga+4PzSRZoHFX72mG5tTfAmiiftWeVgoZGRtQktWkZIyMqH7Re2ZAg=
X-Received: by 2002:a19:e044:0:b0:501:bd6f:7c1e with SMTP id
 g4-20020a19e044000000b00501bd6f7c1emr2777498lfj.33.1694028494019; Wed, 06 Sep
 2023 12:28:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230906165633.2382629-1-alex@linutronix.de> <20230906165633.2382629-16-alex@linutronix.de>
 <18264a59f21e43aed1138bc58ffdf2471c5ccc05.camel@linuxfoundation.org>
In-Reply-To: <18264a59f21e43aed1138bc58ffdf2471c5ccc05.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 6 Sep 2023 21:28:02 +0200
Message-ID: <CANNYZj_ptnLNvwPGDcAciok0bsE7Ctzww4WkAJmamgkCyB19CQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 16/17] build-sysroots.bb: run tasks one after
 the other
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 19:28:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187351

On Wed, 6 Sept 2023 at 21:23, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:

> >  do_clean[cleandirs] += "${STANDALONE_SYSROOT} ${STANDALONE_SYSROOT_NATIVE}"
>
> This doesn't just force ordering but means target will always now
> trigger the native sysroot as a dependency. We don't want to do that...

But I think we do. Target is using executables from native sysroot
such as user management utilities from shadow-native, and they won't
be otherwise present there.

Alex

