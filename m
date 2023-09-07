Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E706AEE14DE
	for <webhook@archiver.kernel.org>; Thu,  7 Sep 2023 11:06:18 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.10297.1694084769407222410
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Sep 2023 04:06:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=PSZyvEps;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-501be2d45e0so1312353e87.3
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Sep 2023 04:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694084767; x=1694689567; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=S7vy82dJRoBZg8433L9p4Zha1JXMKUrE4GNncCaBKmM=;
        b=PSZyvEpsOud3xcLaOI4aA0J5aOUot/nkr/IvzIEKjhG1HonKTffnprFGbJXwnrh85X
         R3PsJg5Tg5/kJFyyEtYFm9YJrRJoYHEWHLBH7Cm0ttjtbW2xwji4yPNTmZdUliTZQlZu
         rnlZp63Yj9/dq5/DBuh1YgfwrY+RdmrCqHK9Zdarm2J13+USoEP+YELo++4YCD7aV2wV
         6vakdWqosdsY+s4HChrFezBdCJGg8DGrNxMaLi48cJBc3PvmV/fMIKcGotT8qIgXFS3u
         NOUGXYVDnxREsa1eDgF6x4MIQfzFyW1+5xTeFPjg43JeMx9Zkwr1zJLtWuOL8p/pQP+/
         4pXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694084767; x=1694689567;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S7vy82dJRoBZg8433L9p4Zha1JXMKUrE4GNncCaBKmM=;
        b=IXy1IR9gWPE54eaQoG6pl3xfXpoumh+J78amfvRFYE13P4r66Cky0jpEh2LD+xWs3+
         g2oj5/OCVcSkE3mDpjUUMJe7Dwqp3j+qx2CFs9Uv0ZhcnLu/6gZzLCPoPADcWqORqOjM
         BDa9n4Uggvnmdid1/1MV30kITOaMV6cWaFWr9UmKIDA5hqn69GsqrOivdFr+FsuCPCGg
         MTihcALICaL2XzZZdFIT9KgKysIdlCdKDn71a2x7iO4tx3fwAYLAMn5e+Uhv8HwLKnb8
         uA81GJSIK09qnoOpZYCc88LKemo8bASv7D8+nfKzJC+fXbX1uZKaNtjU7r8wAUSexMk7
         vjog==
X-Gm-Message-State: AOJu0Yw3b3vDgs7pv/DvtgvzSZ/JPny8FcI6f7VkTwgH+is4a4PQY4qu
	hPhDo6g6DqLFXPhayc5hKY0bDs1go4tomICIouA=
X-Google-Smtp-Source: AGHT+IHuN1qsxVnII5nb5bQcu0y8hBIy2N2K1rygRTyN+mMe5J3rx5Vch7oSjwuP08y4QW4kam3LC2I1HtpSiq1uF48=
X-Received: by 2002:a05:6512:210d:b0:500:c2e0:64dd with SMTP id
 q13-20020a056512210d00b00500c2e064ddmr3854066lfr.50.1694084767132; Thu, 07
 Sep 2023 04:06:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230906165633.2382629-1-alex@linutronix.de> <20230906165633.2382629-16-alex@linutronix.de>
 <18264a59f21e43aed1138bc58ffdf2471c5ccc05.camel@linuxfoundation.org>
 <CANNYZj_ptnLNvwPGDcAciok0bsE7Ctzww4WkAJmamgkCyB19CQ@mail.gmail.com>
 <781c93976fbd19e146ab2626a6202a0ccb23ab82.camel@linuxfoundation.org>
 <CANNYZj_RfCwHmt_TnUgdHeoTNdqMcX+f7aAzZ7e=MYSx+E-rXg@mail.gmail.com>
 <02407d75fc40487431a84d18b60476552083b1ce.camel@linuxfoundation.org>
 <CANNYZj_HBxGaz9c8X875fZ8rgPGD4MNCjv6mkANAiVZKD4vswg@mail.gmail.com> <ffda1a9441f4d6e947bb6aa383f5a1e2e2e0d39b.camel@linuxfoundation.org>
In-Reply-To: <ffda1a9441f4d6e947bb6aa383f5a1e2e2e0d39b.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 7 Sep 2023 13:05:55 +0200
Message-ID: <CANNYZj8zRk0SYzX-GYdwhSQGQidGrK1PT9mCH7LPeSp4ANERhg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 16/17] build-sysroots.bb: run tasks one after
 the other
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Sep 2023 11:06:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187376

On Wed, 6 Sept 2023 at 23:44, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:

> I know it is really tempting just to add dependencies and ignore the
> deeper issues but some of this really doesn't make sense when you step
> back and think about it.

I sent a different patch that decouples native/target sysroot
population tasks from do_build in the build-sysroots recipe and tweaks
usage to run them explicitly.

I agree that user/group handling at build time needs a redesign:
there's just too many corner cases and special handling all over the
place currently. I would really just rather place a file into
/etc/passwd.d/ and that would amount to 'making' a user. Indexing or
other special processing, if needed, can happen at do_rootfs time.


Alex

