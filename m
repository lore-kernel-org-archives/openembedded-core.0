Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF1D2C77B73
	for <webhook@archiver.kernel.org>; Sun, 30 Apr 2023 05:42:29 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web11.63468.1682833344911826224
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Apr 2023 22:42:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Czo3J1bw;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2a7b02615f1so13090241fa.0
        for <openembedded-core@lists.openembedded.org>; Sat, 29 Apr 2023 22:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682833343; x=1685425343;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vsh/c9rdObse3R9sBo26a6AAVr0GX/Y5s7/7fBJPBNs=;
        b=Czo3J1bwqE5HRnRC2CbUUwYafOcdeCREn7PhyXrIPWgxoAihsBWSxl8ot8Q46OVgzS
         8WTaevfumiQYyXQJ+am0DrlcYUQMUU3YLAV+5qB2DpyF6qiNljoxpJUsWiSiWo1DVHPS
         1UZzfg8oD6QxYX50KAfsy+9WsN70YY+2oALAszhdeoBJ+/gPbXnbuSu97ATiCz8hrGDZ
         +3JDVNIdCUk1rlZ8MZ0cFnChwOkdrWN/yFPGEhjPjWSelVFbIxEqT5+XCO3GRWUViigA
         7pXxck3Bf91GJw+2xl79UeY8T7WRCWHB3vYpX59AIK+XHdCmmchy6CM1rvwCml0B0RNQ
         XKUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682833343; x=1685425343;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vsh/c9rdObse3R9sBo26a6AAVr0GX/Y5s7/7fBJPBNs=;
        b=BRV0vM2M/1VfQzHo+gbF/I9m9gwcWkwiwRpVK0P6pLCuJrjf2XWpnTv81kausk4hc4
         TOD5RNN06JXF+7VTAg6NUJcM5Dt/fzC414aSmcY0o5wl4AfF/urtPdiHZt15iBU462Su
         sXk4uJvgFfJvGGy2eaVCbSCye1t/cN4kFGyEedUQQUrY037IK/hVLfj+FC0gEkeWwzMU
         2sjvW+DdqiS5uFSaPg95DEES4tMq55sKUjjG3cEKVMvhupnwS4AQVRJKEbM/CB5g1k7L
         j3Y+7krkP2LUN4ms4syYEUJn0IMkIV6YxjtuKMh4FVCRU2g/YXj1nFYVHb01bCfEruVe
         lliQ==
X-Gm-Message-State: AC+VfDyvkjWJI6f2PFYQBBphgSQEWDqrG8hOkMYupHd0DBR3di4PDHEK
	M2tR6yfrTsPpIlhgpvRzsRhawrT4LDtQ070NbMc=
X-Google-Smtp-Source: ACHHUZ5t5KefmBtEglG46FUbgz97jUJaIDROjLcJO/cMsxMOToS/a6j1MfyhtvUOKcIV6+pLIg66jLo18ijTVH6k6pc=
X-Received: by 2002:a2e:8017:0:b0:2a8:c82f:2996 with SMTP id
 j23-20020a2e8017000000b002a8c82f2996mr2798062ljg.43.1682833342779; Sat, 29
 Apr 2023 22:42:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230426095036.2632847-1-alex@linutronix.de> <20230426095036.2632847-5-alex@linutronix.de>
 <CAMKF1sqsu_F4JS6f+=TfzJmv_Eq7VKpTFDd5OeBXjzRez76P8w@mail.gmail.com>
 <CANNYZj992xUKdM6pLka6wUGDNyXcc+p5ZaL62E6i_7s_RLPRmw@mail.gmail.com>
 <CAMKF1soV_hmE+f7ed0r=jo+rQcWyJ4SU1vG3T2YGAqZQsgReWw@mail.gmail.com>
 <CANNYZj9X+dTmBN=5WQdA9af5E7m+Ov9vO=bOjR0p=BeBADMEAg@mail.gmail.com> <CAMKF1sq=YOzoqyRzn1bhRwxqWSMV1SnzRKNDutBDiKqw+PjhXw@mail.gmail.com>
In-Reply-To: <CAMKF1sq=YOzoqyRzn1bhRwxqWSMV1SnzRKNDutBDiKqw+PjhXw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 30 Apr 2023 07:42:11 +0200
Message-ID: <CANNYZj8=VVycU8f4ko-fhhO7jb2_h5HoRt49m0R_BkhZO5pnBA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 05/11] bitbake.conf: set minimum required kernel
 to 5.15
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Apr 2023 05:42:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180567

On Sat, 29 Apr 2023 at 21:28, Khem Raj <raj.khem@gmail.com> wrote:
> I wonder if uninative version of glibc should be first built with this
> change if we really want to pursue it.

I'll take a look at the other issues separately, just wanted to
respond here straight away - why would we do that? This change is
intended only for the target builds, and uninative glibc should retain
the broadest possible compatibility with host kernels. It is
controlled via SDK_OLDEST_KERNEL, which is set to 3.2.0 and will
remain so.

Alex

