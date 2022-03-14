Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 546B1C433EF
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 16:02:05 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web12.28007.1647273724333655330
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 09:02:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=nH4g9Usp;
 spf=pass (domain: burtonini.com, ip: 209.85.221.52,
 mailfrom: ross@burtonini.com)
Received: by mail-wr1-f52.google.com with SMTP id e24so24705627wrc.10
        for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 09:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VbA+sxtlDEgpMUO9bTczbvM8iKgMqP9jjI3XsFP68mE=;
        b=nH4g9Usp2k1LG+gx2llGr3+5oUjXipN7vvdK+qd6bteik7K9L+j5aWxZ1g5r0Jo8X3
         THdmIx5AKiI7Ix3z4zWa+cT2sex8v/nJ1t6nLCHtNGNE3Ma9Gf5SO1tmWTL2rtkVirSP
         UUh2CwOt5ipnwBWNolE/7PgqbhTJhF0EGmMxKY1etpfHgLFMB/SKJe+lDp3gFlEdsS11
         RDZaO5XsXw8Y5a97MYSSV01i3dgTQR1sZCIJ/Lz0c766U5wT75EyoVVkIGJvDaXk5A3O
         xw+AWck12hgEfyGoZR6LCv2cviCuh9q1JS2a+smdrR9DEJA0sM682kYwQC16EthN2s9Q
         7a2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VbA+sxtlDEgpMUO9bTczbvM8iKgMqP9jjI3XsFP68mE=;
        b=QQ5rQcxh6TQQPlQl3mrY9y1ffx4AskQw5xwcNEQfTEN6IDLyMPC4cZ5WXaLh2zx+NZ
         H6zz4rUZ6+lMIAAX3JkeeGaOiI+Dw4ahUVAJ7JFevm+d5mQ/e2N9PABoQpDF/blxeOG+
         NGf7t5bGfchZsF6MxLnCQzGM/p5zUiggdVgfBgz+JmEWgyZOMrTuEpo/Z9rD/sw25xwP
         QLLFpQ33pC3gmqr+qU1a7pBrtrqAqF4ehdCu3U53h9oYDbEgp1yQ29+9Xy8V/H5zlh04
         LcXqfK/5GHsKW/xPOD6C00CodFPTZ0PQvdpIhA24KwEZaRgplLNwSTGRfoe1rwF7NH8X
         c9ZA==
X-Gm-Message-State: AOAM53155KN+Y1XAySHYkwEpJMbEIMP7FZPevOCSYbP7lfIab8M23a58
	0FfWgBWkOIoLxKyXeOOtPQXi8Ik3LJMiKUenPb9DCQ==
X-Google-Smtp-Source: 
 ABdhPJwEu1k0Vgl6nk4rabHFTgFB+k6M8JZ868Nr8wxjKI246LaMjRoYTQgqxGuJz/7LY6TNVpiUKfU0zqb27oLtZ2M=
X-Received: by 2002:a5d:6506:0:b0:1f1:da5e:e077 with SMTP id
 x6-20020a5d6506000000b001f1da5ee077mr17117596wru.405.1647273722808; Mon, 14
 Mar 2022 09:02:02 -0700 (PDT)
MIME-Version: 1.0
References: <1fcdfa7197764e3ebeeb5ace0b99a550@axis.com>
In-Reply-To: <1fcdfa7197764e3ebeeb5ace0b99a550@axis.com>
From: Ross Burton <ross@burtonini.com>
Date: Mon, 14 Mar 2022 16:01:51 +0000
Message-ID: 
 <CAAnfSTuXkAQyGW_KoQYMJQHM=hFte_wU6rKuAcof2bddUHAB6Q@mail.gmail.com>
Subject: Re: [OE-core] Building python3 without readline fails for Kirkstone
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
 Alexander Kanavin <alex.kanavin@gmail.com>
Cc: "OE Core (openembedded-core@lists.openembedded.org)"
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Mar 2022 16:02:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163156

On Mon, 14 Mar 2022 at 13:39, Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> We have readline support disabled for python3 for target. It works
> fine for Hardknott and Honister, but fails for Kirkstone with the
> following error:
>
>   The necessary bits to build these optional modules were not found:
>   _curses               _curses_panel
>
> The problem can be recreated by adding the following to local.conf:
>
> PACKAGECONFIG:remove:pn-python3:class-target = "readline"
>
> and then building python3.

The sanity check code has support for modules which have been disabled
(see MODDISABLED_NAMES in
meta/recipes-devtools/python/python3/0017-setup.py-do-not-report-missing-dependencies-for-disa.patch)
but that variable doesn't appear to be connected to the PACKAGECONFIG
settings.

Adding AlexK to the CC list as he wrote this in the first place.

Ross

