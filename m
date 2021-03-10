Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web08.7005.1615372916067291447
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Mar 2021 02:41:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=bel+PSkb;
 spf=pass (domain: burtonini.com, ip: 209.85.128.46, mailfrom: ross@burtonini.com)
Received: by mail-wm1-f46.google.com with SMTP id j4-20020a05600c4104b029010c62bc1e20so10402935wmi.3
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Mar 2021 02:41:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=n6sqfJ31RZPipE1y7xjN545yQuM58eVPq9/mMxDO3tg=;
        b=bel+PSkbOeaINygb7+5I8IQqARnwsyzcA6SaXqsox8v+CJtyXjN9UODwuTsXBd7qG8
         vi09/7Fpw5IFsdIYaZ7pOTDkyK6Rzhvc138bsYS+bPJELP8E3mdH/ksrHzlVs6ovh6ux
         7Vmg/doNmyjoBh/2EZZVApzgrcdH2fTAwKpgocrUm5LhvUOywWGjLpHqS2GGl3soa/eJ
         jAYRrt6S8QS8ApoanQ4MH3mg3geET0LdRQXtBLy0q+0bYbRynXMQdDU2oFD5TNgLIp8N
         hakg3v2XCh+nZBOqFJcE29YynUoaCm2gficKttup1XGPpjOr0MRF661m+w8TAbCU/b0B
         GKGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=n6sqfJ31RZPipE1y7xjN545yQuM58eVPq9/mMxDO3tg=;
        b=FZcLMjNL3clcGWSFcV/+Yrq7iTrLrdMNDjQUWTMocuk+Z8lsrl+W/Rhhjz8vpfiv3+
         yY6C/rgI3WbDKTBbCD0Nlm7cLkYbJs6F330ciA1tJ6FYZXBMYfiyE3qw0oYSIukE495x
         e4d+pEKvfzCXbF4zr4FzZLeaqODa/8Y5xhHMpFjDFwOT4MxszOdnxbG8jvzX9Jj1KC8Y
         x7fUrWahYYYZGQ9wYf48jG9449CAF/n25rbJSWq27aqv9piotD3bso+IQG3mEKtUuDjQ
         CubXW7BqVYLMUVjC3qTAKrF6LUriCKnYSUorNtVauTh2m90kBoLqz+D2XZL9BwoJIV2h
         lUAw==
X-Gm-Message-State: AOAM530y1Robd0eHKCiuTIj1ZSLsGTVDyxeJmOwKB2kAkL0b7X8ofxCW
	TN4yclryEVfTIqIXMdIwKOFw2CyDZLR7plyo1kyLrQ==
X-Google-Smtp-Source: ABdhPJyR22ViYsuuFeASlOk/lIkYa/gHL803AAg83lySpfjUo6922VKQEj5f42pzLHeIr2ouQrIueaWP5jqFhjxMTXA=
X-Received: by 2002:a1c:2016:: with SMTP id g22mr2715452wmg.137.1615372914375;
 Wed, 10 Mar 2021 02:41:54 -0800 (PST)
MIME-Version: 1.0
References: <20210310070810.20295-1-crg7475@mailbox.org>
In-Reply-To: <20210310070810.20295-1-crg7475@mailbox.org>
From: "Ross Burton" <ross@burtonini.com>
Date: Wed, 10 Mar 2021 10:41:43 +0000
Message-ID: <CAAnfSTs5NuLR0MZcJ--8-bFQZOrpH0aKcE0U713iRenPUNTxFg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] pipewire: add recipe from meta-openembedded and upgrade to 0.3.23
To: crg7475@mailbox.org
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 10 Mar 2021 at 07:09, Carlos Rafael Giani via
lists.openembedded.org <crg7475=mailbox.org@lists.openembedded.org>
wrote:
> +python set_dynamic_metapkg_rdepends () {
> +    import os
> +    import oe.utils
> +
> +    # Go through all generated SPA plugin and PipeWire module packages
> +    # (excluding the main package and the -meta package itself) and
> +    # add them to the -meta package as RDEPENDS.
[ ...]

do_split_packages() returns the packages it generated, so what does
this Python do differently?

I tend to agree with Alex: adding it to oe-core now without a
migration path seems early.  If you were in a series that removed
PulseAudio then that would be a different conversation, but currently
you're just moving a recipe from meta-multimedia to oe-core.

Oh, and I recommend only sending the removal patch when the addition
patch has been merged: too often I've seen the removal merge before
the addition...

Ross
