Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7041C43334
	for <webhook@archiver.kernel.org>; Tue,  5 Jul 2022 16:04:49 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web11.85937.1657037079461939718
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jul 2022 09:04:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dVXEWeDR;
 spf=pass (domain: gmail.com, ip: 209.85.167.41,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id e12so21339101lfr.6
        for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jul 2022 09:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ay28FxP+wbYE2hDnP048+1gziIOUnBMyOaQrtaUW3+M=;
        b=dVXEWeDRu9zlYvVk6PHATe4VxBQANhRMbRzxxHwgFvTzsGLPE3o2gnYdzPtzhXEiJq
         SYjgCAfWfeOCfmYUFe0zQs3oY6hWCxbXEhi7VtMthwVeCWag5UzsBuYPGB/LmHogtAw9
         2nGA8Ht9kpmEc4p3jgmOPf2y0vNd6kjpFKFAhCdBYPL0Fy/KscmZygSmoqjngiXxDkYo
         6qSttps5bb5sNrJdhIr9ZGqRdWc8/6kFL72lIsX1SIBbM0REbU2e1U1Wggxqi4fl7m4F
         MK0zxK4ZGs5iUq5Al7PaHYWErjYOy1rbJVMO1U0MnKfgELcrUnbQVdD03gAA7xtrRHo+
         Zpfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ay28FxP+wbYE2hDnP048+1gziIOUnBMyOaQrtaUW3+M=;
        b=BPOkWcu9vJPEa4ukeDhZB/KV7J/hTnhMJIhe3p5nl+QT9RkX5n+mqjx2I01hdaVLkc
         FxeT5bjAw8URkPcnBs1vUkRGZ8meXD73S5T/+9iyu9T6wAiCTyLEg67pk8/b8vqVEmKt
         xV+QQ9B/mcWU8T+/R+RgnRhlPlobIaSj/Zt0movVRA8iXpsSS1sS/s58UiSVcs3EyfXw
         ZnKQH9KS8faGExQrwpAfOOX1hZNJYxGHd0J8nkNaBYtF3rDNOr6i+iSiDrG1DOgxNJJ2
         AazHDAfxI0zknASZKBrswTPWVKIgGViMor6Tq45DXTeOYPWFtzQzQ7Z+A/OcLRpJ7pEs
         HD9A==
X-Gm-Message-State: AJIora+SL8pQ+Uemy3IxYEgyfzzPSUsg1GHxWX4Kv/TjQhJzqnl4SmHJ
	Jg3zwlifgT1cO5UutZ0tZYHaiiBYJdv3FGLnQsU=
X-Google-Smtp-Source: 
 AGRyM1tBjEKCMBh0Z6hMvcq1UsHqtGVndsoJ/V0vt1efsFxQ5Ww4WXB+ueC4+conw6TQDERIJVeJE2GmqACSYSNU8fU=
X-Received: by 2002:a19:ad02:0:b0:483:2adc:a23a with SMTP id
 t2-20020a19ad02000000b004832adca23amr3544291lfc.534.1657037077370; Tue, 05
 Jul 2022 09:04:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220701192449.1358325-1-alex@linutronix.de>
 <329d53233a9966693bc19f821f7f3996a187eced.camel@linuxfoundation.org>
 <CAJ86T=XPx1sVqmaJd+C2q81PV-jgjDK9x=cjrEzqRnGjqEghLw@mail.gmail.com>
 <CANNYZj-+2QvuXUT9Vshdq5T6-uLEV5p92QeAqw+kbajPm+UKyQ@mail.gmail.com>
 <481775663c6c797dde9596268fde594bc567a12d.camel@linuxfoundation.org>
 <CANNYZj9e6dmh1pFZZN5T705s6mtVa5SdWoov3+5vbUT0+VrhQg@mail.gmail.com>
 <CAJdd5Gb=NgheS=4e28-zkjVDveGykFKv+z+2PzzKUZx1Ag5ZLg@mail.gmail.com>
In-Reply-To: 
 <CAJdd5Gb=NgheS=4e28-zkjVDveGykFKv+z+2PzzKUZx1Ag5ZLg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 5 Jul 2022 18:04:25 +0200
Message-ID: 
 <CANNYZj_ng0B4mA1sir3X_pXBKXhdra4ErUhY-YeNKhv3oqjcgQ@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH] bitbake-layers: add layer
 repositories/revisions save and restore tooling (aka 'layer configuration')
To: Joshua Watt <jpewhacker@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Andre McCurdy <armccurdy@gmail.com>,
	Adrian Freihofer <adrian.freihofer@gmail.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Jul 2022 16:04:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167667

On Tue, 5 Jul 2022 at 16:28, Joshua Watt <jpewhacker@gmail.com> wrote:
> In that regard, I'd prefer that the JSON file be what defines a layer
> setup and included in layers. The setup python script is nice (and
> convenient), but I think it would be better as an additional file
> alongside the JSON file (or that someone can download independently if
> the layer doesn't have one). I think a few tweaks would make it
> possible to write the script so it can operate generically on any JSON
> file input without needing templating.

You have that choice when you run the generator: write out the bare
json, write out the script that embeds the json (and is guaranteed to
be compatible with it), or both. Additionally, the script can print
the json inside itself with --print-config. If you prefer to include
just the json into the layer, that's fine, but I don't particularly
want to solve the problem of where to find tools that can do something
with it (without exploding with cryptic compatibility errors), and I
can imagine most people, and especially beginners, would just want to
run the script directly.

Alex

