Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62163C433EF
	for <webhook@archiver.kernel.org>; Wed,  9 Mar 2022 16:55:34 +0000 (UTC)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com
 [209.85.222.53])
 by mx.groups.io with SMTP id smtpd.web11.262.1646844933464086676
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Mar 2022 08:55:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Z55+H/bD;
 spf=pass (domain: gmail.com, ip: 209.85.222.53,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f53.google.com with SMTP id 34so1248961uao.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Mar 2022 08:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XptrYGT6h/iGoAi3CrU/mAkqCoy8HeHVWz1uaGF2XbY=;
        b=Z55+H/bDmr65P9wsO2Z9iO2NuXbo1Kt8+Gc+HRb5v7p3ezd7WRJqhXamgJT2e/WhVY
         a7y92plSr5jy1GZPUrMSgNxWj3Lg4nouGhl77oLLI22sOL3kwSlImwjWPsEDsmuWeyR5
         4qeqS48cPvTPdZdd6lYoR7UH85ID5tw7V8d/YPbdeaZFohMpE+pe1vDCvgyTT5Pm4zvN
         mgVkkpCGB4+kbOiaJQaZW7ftbQ+K58ihX+jN7YASX+RwqlogHswZsD0vcb4E/mkJEtc9
         GIXSnypOmdiJKvnlcvCEP+R7y2hZCLdhEHktxHnfHp7bWgVpk/DYSG+en22QzHM3hcG9
         FP0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XptrYGT6h/iGoAi3CrU/mAkqCoy8HeHVWz1uaGF2XbY=;
        b=c+5J6SNDpq1F8voR4fAN4JauUXid1wHX9iGUxqxLnRqe/Q+emSKtEh/XYjvv0CG+w9
         d+PTihaiiG6EGmP8VhcVn4A+jDmdtx9HfNES+ugPe2K4gRcXc7/OdhfOReyFW4vglJOW
         6bLDs3LWyxS2VMRm5t8Ujboc2NkfJ57wdUTVWbFC06BNyOXWHzzyPpEeYSeAhdKo17Aw
         WBb70D9/8Is/bBTbFG6clAuSJnrrKQHB/2OpCDthmPf5WpYYuscf3qcPI/9IB4lzPDnE
         x9w+h3ezBLNhqoF/fIScOXm0dVHSJIMcr8lsQP25yrkItUY9hUxl18Yv3RmOtJNzM+Pd
         SpWA==
X-Gm-Message-State: AOAM531hgb28VlMmPzUV6pVzReHfwLyCWs5xFFpF9p11u29GDxs+pQjD
	SsW0Y0qvIxLMylP2U+BvIEaqPxyvX2GVieS6AFs=
X-Google-Smtp-Source: 
 ABdhPJxeNP8/Xp6vota8Gs0WrcKKSVNsJwbg42hG3Xec03+YVMrAA+Tx6EvmRHCxlBv0DGid/dqaPyPM+sQzS6i3RW0=
X-Received: by 2002:ab0:53d0:0:b0:347:d84c:9aa with SMTP id
 l16-20020ab053d0000000b00347d84c09aamr258212uaa.69.1646844932582; Wed, 09 Mar
 2022 08:55:32 -0800 (PST)
MIME-Version: 1.0
References: <20220308093224.3436483-1-alex@linutronix.de>
 <20220308093224.3436483-3-alex@linutronix.de>
 <CAAnfSTupWXPF34RZ4qw+38XfL29CnG2zv8xCcES4dqCPERFZXw@mail.gmail.com>
 <CANNYZj8UnxaMikzLxxQKKirHn-ut=CQ0qTKW928q1Zv6CwYrjQ@mail.gmail.com>
 <1d8f614abcdb7345019934093b13155a5234e788.camel@linuxfoundation.org>
In-Reply-To: 
 <1d8f614abcdb7345019934093b13155a5234e788.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 9 Mar 2022 17:55:21 +0100
Message-ID: 
 <CANNYZj-H_f=T+AApoaLottOS8GHkC9386C_kh+=zprMAAopdGg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 03/16] dbus: update 1.12.22 -> 1.14.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Ross Burton <ross@burtonini.com>,
 OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Mar 2022 16:55:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162977

On Wed, 9 Mar 2022 at 17:39, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> > It's atomic with dbus gaining a glib dependency unfortunately. I don't
> > want to break bisection.
>
> Are you saying that dbus gained a hard glib dependency? That wasn't clear from
> the commit message if so and is an important detail...

Only dbus tests (and they always had it), not dbus itself. I can look
into making it optional subject to enabling tests, and split the tests
rearrangement from the version update.

Alex

