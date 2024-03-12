Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 055CBC54E5D
	for <webhook@archiver.kernel.org>; Tue, 12 Mar 2024 17:42:33 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.2963.1710265344945603613
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Mar 2024 10:42:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cYfXEZOr;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-513b1e1724bso77396e87.1
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Mar 2024 10:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710265343; x=1710870143; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RnFr0k8JdCqrQX3r3PsVvvSUl/FlBP83VVWd5c07yNk=;
        b=cYfXEZOrguLRrCZWjoCU/5EfV/0ZrbtK6Zj4wmD1w8jZVh8cNTLncF1r+jkTOTHmwk
         ilLKOMaoHUI1sC3yzCf0dCDQ8kFU+ruVB81V99/0M4BsfOgeBQgRiSHGe3DCMg7Kk2zz
         UXSsu/4lmRKePn9xuo9u5tIZvwRX7Nf1tTAqSvl1hb842xyMms3EBnrIOU6s5N0vGjyb
         f7IQ5hK/KJD1PAyxWBoJwUo395s1Q1GZtgEZigmgembWcJIBWEM4BHDMbgEiT59Dgjz6
         QxB632Skv02TeBI2YQFonnGA/CRAU+/t18/Io/CePu+CTWCayFtaqTwvPHTCDPraS8kB
         MmSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710265343; x=1710870143;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RnFr0k8JdCqrQX3r3PsVvvSUl/FlBP83VVWd5c07yNk=;
        b=vDw7/LHpYax0yHVEFgs9panVM+kFVfgWK9ESohMY1ZdJXUFLn0k8MGyzhsDxxKLHOf
         K3sOxJbX0buTO+U3QTx0GBUH6gI2mbdunN5rJDYYMv6CIof6IbYNB5xql0zXDk+CLvCb
         SGbH3BprufQDlmYpDx/0auuAyF4xVPefR0knqrLenpMEYpV2q7Hw/AmFjszztnezuC1Y
         UbRQ7Bu2FtIo+YZH4nehF7yzC1fGRDsPGwm6TSJEKL0KhFPa2TJX0ErxoS+5UHhKDPzw
         MBa3hfCyNE3LpX9Jj4wibcLiWnOoJeeV64lhP/PHZ6EBUnujXEvumbNZA7H6AXO6h0sT
         CAaw==
X-Forwarded-Encrypted: i=1; AJvYcCXZBM46YrgciRHuXffReCPYWX+mCwkFzpv+l3k2S5eE9K2JUCx6lUu5bIyhZE8r8W8bo7dcd8WTFrmKzcwLzfjmEXnK81mw397I8q7eGmHTE6G9HP20eYvc
X-Gm-Message-State: AOJu0YwrhMGx80LeGhyK5GOVGeeLJ3ujpwAomRxS6+VmJ/rxSwRP0E4w
	+VG2+794gk7juaWZVSGvaFdHC61H6zVOt4j36jMpyXlraWLuIEzHrkN2rvX4sxvHES11hsOEq0T
	MJ1NWbNc05hK+6XA+A0LSTyg19Bg=
X-Google-Smtp-Source: AGHT+IH8CiRM/q8+PCJrGfKL5s8iyzqncngDOIdUqKfQkmFdCRmorsGAkfeeMzn4UfN6C0ssPFisrGhHVnV6Hqhmmtk=
X-Received: by 2002:a05:6512:15a3:b0:513:9cc8:f082 with SMTP id
 bp35-20020a05651215a300b005139cc8f082mr94161lfb.11.1710265342924; Tue, 12 Mar
 2024 10:42:22 -0700 (PDT)
MIME-Version: 1.0
References: <CAK5yBb-rUZzdqbXD4yoHiF5V-L2sOg1DVWMEsDGXWk36F2cexQ@mail.gmail.com>
 <CANNYZj9q5baYcA1AZ6UkqL+E+Z=H+4aJ3iAeD9SuCB7SoktX5g@mail.gmail.com> <2c6b60473e843b212695a2609ab0fa88181fbf6a.camel@linuxfoundation.org>
In-Reply-To: <2c6b60473e843b212695a2609ab0fa88181fbf6a.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 12 Mar 2024 18:42:11 +0100
Message-ID: <CANNYZj9-yshEb3tVXzqFt_5d92qhRCngNK-smzGry9isgxwhqw@mail.gmail.com>
Subject: Re: [OE-core] Yocto Project Status 12 March 2024 (WW11)
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Yocto-mailing-list <yocto@lists.yoctoproject.org>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Mar 2024 17:42:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197000

On Tue, 12 Mar 2024 at 18:29, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> > I'd like to see the issue, as one recent change in devtool tests was
> > in the minicom version update commit.
>
> e.g.
> https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/6519/steps/14/logs/stdio
>
> which looks a race between:
>
> overlayfs.OverlayFSTests.test_correct_image_fstab and
> devtool.DevtoolUpdateTests.test_devtool_update_recipe_local_files
>
> (over makedevs).
>
> but there looked to be more going on there too.

Right, the minicom stuff is probably not the culprit. At first glance,
devtool tests do ensure to make a copy of meta/ and operate on that,
but the failures seem to indicate they modified the original common
meta/ instead :-/

Alex

