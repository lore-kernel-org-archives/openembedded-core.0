Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FBDCC0218B
	for <webhook@archiver.kernel.org>; Fri, 24 Jan 2025 10:44:22 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web10.9102.1737715452678941676
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jan 2025 02:44:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WBtOON6A;
 spf=pass (domain: gmail.com, ip: 209.85.160.169, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-46df3fc7176so18736681cf.2
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Jan 2025 02:44:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737715452; x=1738320252; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TMVS4WcGgF0R5V8ICBYYMheYlOscwtT625ANVf+je5I=;
        b=WBtOON6A6NU4Fl4E62s5Dj5+xg2Y1QF8jLO+CyzCCS4V76miNX31rOTezPIODSUG5f
         37awgG6Ih336iMreNBCTX1c6VsVs81C79Es16qO/dFHICZELhhCWBmqLRXJQ/mxcYMeI
         XFqL2PcIGJ8iuhpaptXyqc0nyg3QtrkYMS44i4L9iJloS9+fGmqUT7EzGrhhU3mFSXFB
         AIXAV10dJ4qzSc+t/sXqEAFtoVs9lLr3xadzfCAWmdmZYbunYeTvX9qAGRG4Lak19Atf
         Y2DO92xmI1HL7Inx5Wmloe/ukD1AUD+96wRXxQpGexT5tw15gKtLSrjPfM4jM326I7wv
         QHPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737715452; x=1738320252;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TMVS4WcGgF0R5V8ICBYYMheYlOscwtT625ANVf+je5I=;
        b=O5AjD8EeBHiNqSZZgAvy3trbEMlZBCROXCrtLkm4s5LaZLITyAz2kc5oPLJdSEVmIX
         p8BkMOi2cZmCrZ2EY8tPnJZtRZtwT8QlNSSgWcomJ7UVvWccKaLwdS3bFoZj/bZtMChL
         34IZwtnk2jrYxm6KVFdpUGgHlKCr4luamX4NswwH3FkzML6ouUEeZf/B8u+TADZqit3G
         olzxm4ofC+slZ4p1i4t7LI1rc+wxXGPydr8vz5DcDCoPv5xGV2I6uaaKbSoqJFkEivcU
         RlE1Jiv7iGTdOJG/Z/GSTkghXBKzd5UW7eS6q6NCvj9BMIz8EK1/pZ4z6PWDtvWKyNzj
         Rwlg==
X-Gm-Message-State: AOJu0YznERWiz0oVFUjy3xx6bb0TUV3PBHro8nzR9CP633VTok7hqgkQ
	z/LCma7qXgM0K37qaI2YkxOexrI1hZJ/45sXED1URQ7rN32mPKoBc5ipeUxIeuvCk14Hjdrzovg
	hyW7tYroExFnaL4DAlbrAPQJWlP8=
X-Gm-Gg: ASbGncscxNArQGxH24VMki6LPGX6avaUbDFNEPCH9dR+wh9VPoaLyEqQ6o1p77XtIKK
	OvjEBxL/sjvvfoyVTUKnMqb0DaSZSlXSfVt0ry9eU5vR0W6mux595qTTLLic1
X-Google-Smtp-Source: AGHT+IES12nrQU9SnzZGmOq/ZoLs/za//T8uw1g1p6udH5hD78Hj4FLlsJpNvK2F7TUwLQ0CJUVjqKE30rBYH721xFE=
X-Received: by 2002:a05:622a:8c:b0:467:4395:2ac9 with SMTP id
 d75a77b69052e-46e12a87696mr398355001cf.31.1737715451608; Fri, 24 Jan 2025
 02:44:11 -0800 (PST)
MIME-Version: 1.0
References: <1737676843-10340-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1737676843-10340-1-git-send-email-wangmy@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 24 Jan 2025 11:44:00 +0100
X-Gm-Features: AWEUYZmIyC1WY7gYY2fwAjVnpOsQxOeCLCfw66iCwOGPM5IjWWqlwN4dNH87cMI
Message-ID: <CANNYZj81xXK4zqLhinY119Vhauo1D7rxA5EtEx639KcTh1-AJg@mail.gmail.com>
Subject: Re: [PATCH] [OE-core] [PATCH] ncurses: update to latest version
To: wangmy@fujitsu.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jan 2025 10:44:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210217

On Fri, 24 Jan 2025 at 01:01, wangmy via lists.openembedded.org
<wangmy=fujitsu.com@lists.openembedded.org> wrote:

> --- a/meta/recipes-core/ncurses/ncurses_6.5.bb
> +++ b/meta/recipes-core/ncurses/ncurses_6.5.bb
> @@ -3,10 +3,9 @@ require ncurses.inc
>  SRC_URI += "file://0001-tic-hang.patch \
>             file://0002-configure-reproducible.patch \
>             file://0003-gen-pkgconfig.in-Do-not-include-LDFLAGS-in-generated.patch \
> -           file://exit_prototype.patch \
>             "
>  # commit id corresponds to the revision in package version
> -SRCREV = "1c55d64d9d3e00399a21f04e9cac1e472ab5f70a"
> +SRCREV = "752b540280a58c0ba0cc048e88518667409c1429"

We cannot do this. Version 6.5 means a specific tagged commit, and we
cannot change it to something random in a middle of a development
cycle.

Alex

