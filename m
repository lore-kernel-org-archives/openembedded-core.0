Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B32BCCA479
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 13:56:35 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.5816.1657202187376599026
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jul 2022 06:56:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GebpfdYJ;
 spf=pass (domain: gmail.com, ip: 209.85.167.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id f39so31271430lfv.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jul 2022 06:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=R11jhcfwcr97NjcLUPGZyBEfbHpF1cigIWO0E+2YFF4=;
        b=GebpfdYJtg5kXOZs0gGbiaw+NHarmJaxO1A8Y84zQvi8yoO3mOA1kQTM57MF7YVBkt
         CefUYl9y/jHYn6rbQNGR9I03Lscxke8eBsk25+hvT7IIE02ldyRE2bbdy4iPukjEu7UO
         Ljd9+c6q9ipdGgxPzXib80H10Y6bFWqmGaf1NZnG/6Fg6iIM5BGe0KXFAG02H1dse5ud
         wpAvzw3DnJyaicmdgeJS+UGwasA+kTWuHnbntJdH+grYwA+3Xiwna8l1vnt13vsSt+Sj
         Xiw66iXcPdY7A6lcluiG1jjEkPkZ64sZrkrqfd2am7lZvGv8Y3F+TeV7wu+Z7dXxPZUB
         giwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=R11jhcfwcr97NjcLUPGZyBEfbHpF1cigIWO0E+2YFF4=;
        b=mkaHVVHivK/xZVUrGsdGItwNmDxa60vu9XsTGPXg4uugjoYkTEMrQ1jtTTNohFSfFl
         Udje6TOFfSKs2frNTgIscLJEjL9rfSKuZs5c5HpF8bf6eyAHZcJwu9nuNPbYUA6YY2k/
         SdBOYxGszqw2nZfdnfxY3MD8Jylndzv3s8Ina+0gADk6gNEe2oxbtzPnn6i0gIT646U1
         oz2rI4jjR/si9QLeMZINxzwylfnJntnI8jrGe3B7iSxoBsarNUycD/bbfTz0Rm/T2YBS
         9WryfYySLChiifrPu4hw9mprvGvcfeROrWTfx3ekH8b2Cg0mEXlIkClEpMufiAPkLl/J
         ltPA==
X-Gm-Message-State: AJIora+5uz1hoYJNo3SFGuJpUxC7lMaY2cbtj4doVL4MmCUzagimStZz
	suEq8fCsRn/NDQsfQcll7lLW4KQMIyyOSNGLHVA=
X-Google-Smtp-Source: 
 AGRyM1tLwjDUM0ZRBXlKaWLK5P/prIIo+ip9TQ/p5OdP4cmTl9q6ube3FKnSzZb4+7ILgkwUiy4zL/Ctu4/04BGxLB0=
X-Received: by 2002:a05:6512:3b21:b0:47f:665a:bf50 with SMTP id
 f33-20020a0565123b2100b0047f665abf50mr30682902lfv.673.1657202185548; Thu, 07
 Jul 2022 06:56:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220706182329.3085564-1-alex@linutronix.de>
 <d04fa3ca7398489a99f8356b17f1174a@axis.com>
 <CANNYZj-Dtx6ETvTTgtJUE6Eizn-S=vm=Oug=cB3zRsQCC7AM=g@mail.gmail.com>
 <4573c371d989428899b884116c47fff3@axis.com>
In-Reply-To: <4573c371d989428899b884116c47fff3@axis.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 7 Jul 2022 15:56:13 +0200
Message-ID: 
 <CANNYZj8pEFcM1g_qOVbP1HDUE05yjQwyxsJpLM_em3NRPnM6kw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] scripts/oe-setup-builddir: copy
 site.conf.sample out of template directories (if it exists)
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Jul 2022 13:56:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167782

On Thu, 7 Jul 2022 at 15:45, Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:

> > Setting up a build directory from standard poky
> > or oe-core templates (which I presume is how you set up builds) does
> > not hold a promise that what is being copied will not change in
> > potentially breaking ways.
>
> While I may be able to fix the environment for builds that use some of
> our layers, setting up pure poky builds will no longer work without
> manual intervention.

Wait. How are you setting up pure poky builds right now, so that your
magic site.conf is correctly inserted into builds?

Alex

