Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2993ECAAD8
	for <webhook@archiver.kernel.org>; Fri, 16 Sep 2022 10:57:38 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web12.4491.1663325856740934622
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Sep 2022 03:57:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RN3h8WEI;
 spf=pass (domain: gmail.com, ip: 209.85.208.177,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id r20so13335444ljj.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Sep 2022 03:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=e09BPmDwoQW9nS5kIKVvQMC5rHI+G5U6MB+7ISJc98s=;
        b=RN3h8WEI7PHwhQ6/VmzfskVyGnp8W9EIhbkvy0m8SeeooOB7+1EgdTWDktPKGH9MA8
         lKvnBWRScW0I2dh6NC7d2Uaz1x3b+ieNKmnCSpwmJoHfZhhzKKqHehZXwJ7ZxzcH6Ye7
         6Km0Mx8cEmNyjJUV1Dy1dYfbZstIPR75Ql9TNygCMpAc9MriglMAL3Yp4dx+Txy/EM1J
         QqQQmKy2oHJ/wNuAE2qtdvjSmXpp64SL59SXQYvzCVzJnQKwdiAi6VL+BiRJqq56O3h5
         jtaSx4v9grNBhe8+6eiDq1T0ToxDwwdCP+AGwVUWxCX1lupCbcMxzajIS5RH3w5SZcRy
         cbqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=e09BPmDwoQW9nS5kIKVvQMC5rHI+G5U6MB+7ISJc98s=;
        b=Oe7ysvas2j6chIdh+9zw2o+WBrABmyiC+n6lxHN4A27lTm5awiCQJ4KKCkaXKmJ82n
         ApV2MEjVk00G6bBewja4gvXVupzpMHQt5Q0JcQ2GSckv8GZIhaN4ZFbtWo6nyLkxfMXL
         afsWTTdOlTdM6z7yDdMMCy0WuO9W8D4KY7DiguR5cDGbbEYZ7AxRx0DVdvY1iME2ezDG
         DlZPYNeNAQ6Jb12CFQ8M1v+r0VDeJmv3U2lHFeFFrZpxaCWwAVvckQ7Pw9wHr0UAiE8v
         MUYHWYyX/zh1WfTA7gLQ2IR3kF9+ngNSiw70bGsO993nkQqod3x/eQ2NnZDc2NVPrahR
         z7Iw==
X-Gm-Message-State: ACrzQf20Lnl1HpPoEq2QQcnw5fj/PaNOIeL/KOj5lgdfVFl5TR0y8T1j
	B7JM0P487KnTLYO1VbD3QIzQp4vK7A0ajlrdxgc=
X-Google-Smtp-Source: 
 AMsMyM4utg9XEr1cEb36nthXeBLhUxHWih9UDyMOwhck9ulOHqP7JBdGTwRJC3k2NYw5EEAjmow69WIty7O5bfNIeVY=
X-Received: by 2002:a05:651c:1787:b0:261:c1ff:4407 with SMTP id
 bn7-20020a05651c178700b00261c1ff4407mr1254986ljb.257.1663325854573; Fri, 16
 Sep 2022 03:57:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220831111401.3330342-1-alex@linutronix.de>
 <e73f356f-87dd-2aba-7445-2f93ad6bf145@windriver.com>
 <CANNYZj-fLHiNEOLzp5etSQRwtNb55kHa4k02jzRRm=c3dohULA@mail.gmail.com>
 <6917e065-3b17-a57e-f862-90366717106b@windriver.com>
 <CANNYZj_OqjRgsQQwQditr1iHCM1RkZak-hFG-zEsqPmMfdNd_A@mail.gmail.com>
 <8e5b3cc0-bf66-fb7c-0199-ae6766c76cc8@windriver.com>
 <CANNYZj8owg_f1=g6VWVo-S6Qhq8VOgeYiGwQgNYQ5-GmbP8OTQ@mail.gmail.com>
 <8f083713-d00a-2393-3b74-35491e830bb0@windriver.com>
 <CANNYZj9nK6OXGEb0qHHSUz_UYn8QZt9ZSk5e_i-A76RPqMG8kw@mail.gmail.com>
 <e0a16812e51d41ada44bd388dea8a90b@axis.com>
 <CANNYZj9_wrEF7OvWYFX090ET1cG0cfK4w0J44a8zMHX6DRHYVQ@mail.gmail.com>
 <32f1549da2dd46e98476e2543be0746a@axis.com>
In-Reply-To: <32f1549da2dd46e98476e2543be0746a@axis.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 16 Sep 2022 12:57:24 +0200
Message-ID: 
 <CANNYZj-tPjxFn9-BDDsr4vg4f8WTU4apVJo_=_TqKpuvjf93QA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/7] scripts/oe-setup-builddir: add a check that
 TEMPLATECONF is valid
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: ChenQi <Qi.Chen@windriver.com>,
	OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Sep 2022 10:57:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170786

On Fri, 16 Sept 2022 at 00:59, Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> Since our code is a wrapper around oe-init-build-env, it would have to do
> the exact same calculations as are done in oe-setup-builddir, and if you
> look at that script, you will see that there are actually quite a lot of
> options to determine the name of the build directory.

Line numbers as of current master HEAD please. I am looking at the
script right now and I am not seeing any options: it simply takes
$BUILDDIR var passed in from oe-init-build-env. And oe-init-build-env
sets that to either what was given on the command line, or defaults to
'build'.

Again, to the best of my knowledge this will work in the wrapper, and
you need to show otherwise:

mkdir -p $builddir/conf
write_out $builddir/conf/bblayers.conf
. oe-init-build-env $builddir

Something still doesn't compute here and we need to get to the bottom
of it. Let's focus on this for now, please.

Alex

