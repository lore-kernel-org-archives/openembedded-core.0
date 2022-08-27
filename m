Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39BBFECAAD1
	for <webhook@archiver.kernel.org>; Sat, 27 Aug 2022 21:32:45 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web10.53347.1661635961754711175
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Aug 2022 14:32:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fDjX2g9N;
 spf=pass (domain: gmail.com, ip: 209.85.167.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id l8so6315497lfc.12;
        Sat, 27 Aug 2022 14:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=2n1UYNGI0uoXkUCEycjEshJW+Cx6UmJ3IgDmChcHWgw=;
        b=fDjX2g9NNTnJq+h9mhAy0D2KZq0pjLXlblrLHNvTLEVTzKrdroHnfL4RbRxAZ5Gd9i
         bCs396aVR4pQBlhbga3ol3zMo4YNQtTCB4t2Q7syzJbyya/TwqkYfIzbY3ASySdNhWOp
         f36v6z7N7og4i8SVUxtAO0F51dswNRMr61uwpW4F9L9FH2NGquHKaVjwIzSvMLenxhmW
         7GsQkxnQFyRObWQLkeOzVxnJKkY9RYen1t0zHzexpXef8zOZPCe3dcZKvYg54QdiHCRN
         3qB8nK8o7fWN6GRh53aFFgefvOTF6gYm81cu2pEDiWEfS7pYf9LV6MxJmAEsF9ZFQcR6
         RNjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=2n1UYNGI0uoXkUCEycjEshJW+Cx6UmJ3IgDmChcHWgw=;
        b=XZppJmorIK81wtGjyxRdzqtacY74Zv2JDMB8/abfLVPqG77tz97bsDrsf2b8A9V1UL
         HRdWbG6GJw6cNR80DNWPkawjgZ5Fh/8ksHQ628o+e+K+knYYX6qT63P1vhDRk7eHOUzQ
         g2CVREYM7cQw8tWcgtFC65ayTw5l/1ypouGvlG95A2yNGpsPtFZ723yR/rICvAlXdxYG
         Geo5oNHjcoWSSkxLsDiL8wDcUonVGzJVJF5Ev6dZ+V7cphP1Un8gw8cRTGz5QSQdZAps
         MLtA7oM2e5nSsf76Q6pUNEmKIQfTroXgvz+/Ph07P76whBkfKtEQKn7lrGN4QSZgSRL2
         QBHQ==
X-Gm-Message-State: ACgBeo35q5l6pA+AOW/n+j7Ow6owpl8soGf2RNxd14DBqNpYG7JrY1cm
	chqrFrfbIMfQFRFEl46cAZEl45JJqi0sG/sLRxI=
X-Google-Smtp-Source: 
 AA6agR72wJxNSp6NpS4uf3PaSklJ18Vbff10nW3fDJDHVXz80iCaN+TtbHC4NhD8RbR9fc0fgT4K1MZXXilk6241afs=
X-Received: by 2002:a05:6512:2511:b0:493:50c:ec3 with SMTP id
 be17-20020a056512251100b00493050c0ec3mr4096769lfb.665.1661635959917; Sat, 27
 Aug 2022 14:32:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220825203451.2074080-1-alex@linutronix.de>
 <170EEE7825BF9D73.11791@lists.openembedded.org>
 <20220827213209.02c7bba4@booty>
In-Reply-To: <20220827213209.02c7bba4@booty>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 27 Aug 2022 23:32:28 +0200
Message-ID: 
 <CANNYZj_Hn4y1AK7PD8-8pM2VT1eOuEfdX43GBgoDe97hrg+yPA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/5] bitbake-layers: add a command to save the
 active build configuration as a template into a layer
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: "Luca Ceresoli via lists.openembedded.org"
 <luca.ceresoli=bootlin.com@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>, Ross Burton <ross.burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Aug 2022 21:32:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169973

On Sat, 27 Aug 2022 at 21:32, Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
> This series appears to have generated other errors on several qemu
> builds:
>
>   ERROR: core-image-sato-1.0-r0 do_testsdkext: Couldn't install the extensible SDK:
>
> To me the correlation with your code was not immediately obvious, but
> as Ross suggested I removed your patches and the failure disappeared.
>
> Some logs:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/97/builds/5114/steps/16/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/60/builds/5737/steps/15/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/63/builds/5724/steps/16/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/73/builds/5721/steps/16/logs/stdio

Thanks, I've sent a corrected patch for this as well now ( [OE-core]
[PATCH] scripts/oe-setup-builddir: add a check that TEMPLATECONF is
valid ).

Alex

