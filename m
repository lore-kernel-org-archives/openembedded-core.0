Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EC35ECAAA3
	for <webhook@archiver.kernel.org>; Fri, 26 Aug 2022 10:47:15 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web11.35593.1661510831229842874
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Aug 2022 03:47:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=d550jfTB;
 spf=pass (domain: gmail.com, ip: 209.85.208.174,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id k22so1210069ljg.2
        for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Aug 2022 03:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=FLAJWcNp/605LKCA90NnSKHa83SKoin9btp8/rvdhJw=;
        b=d550jfTBmBiDTguS7cqQYLvnUzU/WMY5YgfVEd05U8mHkZ6JUYL3v/T21UdCMkUTof
         h+S8pRdmAR05Z/NNq0avMPbCvr4vJ8X3d2fK6Hg7h3KbZ63Xyg05vMtbUTWLNyGhiZ9k
         y3phKtTV2rjxELaZneq8x9RlOR/Q3uguQdWBGAhL3qz4Br950gp5uReEuzEqlCZ8+zvX
         nnEwUUcU+XWCyYJR5xhFp0A0oQ1wzTX7sJ+9FJp78AWUJmAl72zLBE85fsQ57lOlvTww
         TE9NtuqnV07teGilkmFOJJZuftncxDw66nxDe7++WqoSytmj75Ppr224pG/wW4ohIPGN
         tfIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=FLAJWcNp/605LKCA90NnSKHa83SKoin9btp8/rvdhJw=;
        b=UYtGtR9gBSZ38ZsCIrvxwt+LKsBwYvWcPMO64+oHa3L+6XhS2fEtTVUr+sEovQkqGZ
         F2k41re8+a5FoO/puJcZpU4KgJ7Uf/K4tE1NwwTdVJCkAae+PX77SkvJvdEWWdHDV3B9
         K4GRcQOl60Fqdni4EL9nip7pJn4nRu55b7AHtU+HcRnr+1ORK3nkpGGHybiRjBanpWqH
         Qg9bfxk0bOSp1OUT6XiHokWeH5ym+ETjY8vtCBw4b1Npx/Q+3arF5V/X0UnRw4sgfMRn
         ha335kI1OnkRTbPFV2dp03wqUqzR2T8b96pGsODy/t+yuVPCOExrOVMhGqMzh4X50SJl
         qgTA==
X-Gm-Message-State: ACgBeo1PdqMBZ3xgKoPHAVO/y7Lyz9MalitpquqHe/sfgcy1XoXARo+o
	XksFLR1Wvh4nVmAcM0E5SSRui9hSsclKwHznKT0=
X-Google-Smtp-Source: 
 AA6agR5DYPKGfgaHXhAksBoBmYHzzCnu+tuTisX3ts/yGMYbVx10cq8Q9ITLSq1BulZr1DWzfU9TNt/QMQW7IXM79Q4=
X-Received: by 2002:a2e:9e50:0:b0:261:e3fd:cdc5 with SMTP id
 g16-20020a2e9e50000000b00261e3fdcdc5mr2187018ljk.56.1661510829531; Fri, 26
 Aug 2022 03:47:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220824124234.3549247-1-alex@linutronix.de>
 <20220825153712.55f446b1@booty>
 <CANNYZj_HRzuszmzkT0vU8rQ7sxvp8m_kLQUfQqPbCMWT_tdFxA@mail.gmail.com>
 <20220826110419.6039ccd4@booty>
 <CANNYZj8yH_ZOVoH7=HRzzdnmcOfcA_RjwhYNSsMbH-+h6COihQ@mail.gmail.com>
 <20220826122742.4c5e2e68@booty>
In-Reply-To: <20220826122742.4c5e2e68@booty>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 26 Aug 2022 12:46:58 +0200
Message-ID: 
 <CANNYZj_mMskniYv8Zp=x+WuAYxg_EKaEG4KHPEq5x-GbamaXuw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] meta/conf: move default configuration
 templates into meta/conf/templates/default
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Aug 2022 10:47:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169912

On Fri, 26 Aug 2022 at 12:27, Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
> Oh, no! I'm not receiving any poky@ emails anymore! The last I got is
> from August 23. On the website my subscription seems OK, and there is
> nothing in my spam folder. And, last but not least, the website does
> not seem to allow downloading an email as an mbox file. :-(
>
> I wrote to the help address.

I sent the patch to you directly.

Perhaps you can first try to unsubscribe/resubscribe and send a test
email to poky@ ?

Alex

