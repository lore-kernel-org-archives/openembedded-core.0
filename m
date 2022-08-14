Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A74A0C25B06
	for <webhook@archiver.kernel.org>; Sun, 14 Aug 2022 15:51:55 +0000 (UTC)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com
 [209.85.219.174])
 by mx.groups.io with SMTP id smtpd.web10.6155.1660492305848624164
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Aug 2022 08:51:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bETpq9dn;
 spf=pass (domain: gmail.com, ip: 209.85.219.174,
 mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f174.google.com with SMTP id 64so5900724ybl.9
        for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Aug 2022 08:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=xR5EiygHN7T7Cvnzk7V4X4Ax6UPgVH1E4vr5OstcR2k=;
        b=bETpq9dnbDEOlkc86savEbjROHZSvRdFLf+eD45OJfYKb6xf+I/uSvebuvJrBUk5Py
         fpIh+XrzKd/wkkw+3irTGlMiUal7cClfahS5k0xQPfAct1Vzj0VTVyOJvX4k4N3yZd04
         jKbErp03jykJIePopeENXc5+emMPSAC0oGVEBpT+E/Ja/b6gFYQKPk/E59JCXrwS6FZp
         0stHlSBh86YL2Z9XjTzAf4zqCtRwiTJl+Wh55WAgsAFvYkPpJfc7fJSd/JIL8h1HclMn
         BI10UiMF+VSWYzs5yAQm+mVtQxGhRT526V0CJhOvK9JWu3gi3Tx4OzUL5bDk3GCuWnNP
         4kAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=xR5EiygHN7T7Cvnzk7V4X4Ax6UPgVH1E4vr5OstcR2k=;
        b=NVoev8872GFGn53I2795tVtvNfC28Co0jY+qYiYV88nqzOXzI00njTcUwQTZ3iYuAS
         ZtGoxXlYsq1k84YloZbzaA/eBPJG1MuPymdHLV2qSHNt3hgDVY/LbhLppauJibuQqicA
         xZtsTjime+EUXvtMSM+ALI5pQ7+2NNRGn8YeRHMtJ01Q1goLQt3FP3Hg3soAYQK8gOVA
         3g4nTTWgT2tizy/3BXnwGUI2iONWxPvKCcnJHvAXIiAqZx7SQbVTiKVR1Z0f/dQthAZ8
         vhLfNEwU1BPwuu+82g3HGAzGDHrVJg0CxtzVEG377GfGYJezTdo7NzbXUokOFfa8BkF/
         nkiA==
X-Gm-Message-State: ACgBeo0A3F4LnKXkU6oOizEFRDp3KBvDDiRwm5WQAezCb37s7yK68tow
	HWc21FfDUg8v9IyiLNPKwuonDR3UwDRqbHT9aB0=
X-Google-Smtp-Source: 
 AA6agR63rjGmD1+oror8QCMFKk0tOiuddiQ7P5wYtbPQjjEKJn0QUvICiHWrlq5FxXPScTXzq1peoo1rfp/DghesgSA=
X-Received: by 2002:a25:400e:0:b0:67c:1d1d:480 with SMTP id
 n14-20020a25400e000000b0067c1d1d0480mr9266641yba.620.1660492304625; Sun, 14
 Aug 2022 08:51:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220814151802.9877-1-kai.kang@windriver.com>
 <CANNYZj9rK3fycg6S0yumZrM+L0wNbQgOA1h_2b0bMZehaou=Ww@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9rK3fycg6S0yumZrM+L0wNbQgOA1h_2b0bMZehaou=Ww@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 14 Aug 2022 08:51:17 -0700
Message-ID: 
 <CAMKF1soduHd=iNu-x8fCbir-t_AvWwc-nT9YjKTDqLv9xTAbzw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] packagegroup-self-hosted: update for strace
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: kai <kai.kang@windriver.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Aug 2022 15:51:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169326

On Sun, Aug 14, 2022 at 8:39 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Some information or links about how it is incompatible would be
> appreciated. Can it be made compatible instead?
>

rv32 port is not implemented yet.
there are patches available to add support for rv32, however they. are
not upstream yet e.g.

see
http://svn.exactcode.de/t2/trunk/package/develop/strace/riscv32.patch
http://svn.exactcode.de/t2/trunk/package/develop/strace/riscv32-autoreconf.patch

> Alex
>
> On Sun, 14 Aug 2022 at 17:18, kai <kai.kang@windriver.com> wrote:
> >
> > From: Kai Kang <kai.kang@windriver.com>
> >
> > strace has been set imcompatible with riscv32, so update in
> > packagegroup-self-hosted.bb accordingly.
> >
> > Signed-off-by: Kai Kang <kai.kang@windriver.com>
> > ---
> >  meta/recipes-core/packagegroups/packagegroup-self-hosted.bb | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
> > index 772b86b39a..a1b0ee2883 100644
> > --- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
> > +++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
> > @@ -98,11 +98,14 @@ RDEPENDS:packagegroup-self-hosted-sdk:append:libc-glibc = "\
> >      glibc-utils \
> >      rpcsvc-proto \
> >      "
> > +
> > +STRACE = "strace"
> > +STRACE:riscv32 = ""
> >  RDEPENDS:packagegroup-self-hosted-debug = " \
> >      gdb \
> >      gdbserver \
> >      rsync \
> > -    strace \
> > +    ${STRACE} \
> >      tcf-agent"
> >
> >
> > --
> > 2.17.1
> >
> >
> >
> >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#169325): https://lists.openembedded.org/g/openembedded-core/message/169325
> Mute This Topic: https://lists.openembedded.org/mt/93017686/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

