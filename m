Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BA51C54EE9
	for <webhook@archiver.kernel.org>; Fri,  2 Sep 2022 07:41:38 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web09.3921.1662104491331728526
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Sep 2022 00:41:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=N61GqHIN;
 spf=pass (domain: gmail.com, ip: 209.85.167.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id v26so2064588lfd.10
        for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Sep 2022 00:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=MFwEFRyP/gV4KzJux4ZmX0Cu1PWKu8ycYpU4NrXd5XQ=;
        b=N61GqHINrEXTJIWvXxivv++vFnl++xh6Up9/xwRNctlwKHsII6OQXra8oCujBub5I/
         ZEsi/sCDgCKgzgBulxcL1+DessNWSRYWVyZW/4E53LmhrLbcMMpoDjtxcR3+8pEgcdrM
         Kq4jWwi97AYHvFJst8ShXkpjuPUk2L5nzz795aDX1uRspOs10SZ7WKSJ7vIjsELe0eVI
         WTTrp/HiE50FBRkslqYUxqkGiOK5mAGkkdbLQEHA17z0XEC+WVoZEKDfyLHzUAUrKDeE
         v3Irvt3qsd8nfAdsUEKoKJqB4rvBWgE14b0i8VP/Fpl8dzDmlwKZsnafz7FVqwVxssEr
         Evaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=MFwEFRyP/gV4KzJux4ZmX0Cu1PWKu8ycYpU4NrXd5XQ=;
        b=YQismS957SMCkULp139fr1E+T4/quuYs0YYIiqGkwGWQ7edzBbfcjyoHFwuhdqc8PP
         +SRHwt13Fv4XwQSiFCXQVnVk13g3vzZWbxmJJ2nSHHTXnj93jxPByB7+jlxZAWARYkPI
         GB9+9geW7QHbSr+bWiovclZ8OOv2dW9RvIZ4+0qHEQnKtx19Qmdn/+hakWRwSQrQhyxT
         R1A+pbgdFC0BUMkdE/oD97yi20+CeC8/QllGUdgnt8DoIlI6tpnq3xCdaE8+AWdfjfQJ
         Jlfl7VBanH284wyJT4ubnkOE3nJKPd1dI2Xc2X3SFj0l8kXF6FBFKEjUE2G1ahUYKbN/
         U5hg==
X-Gm-Message-State: ACgBeo1oSB9bY2w/obgF5vDo+nvx1CRqMuBYcX9MdxJVAhCQPTPPxe8L
	hzgKMGx/6p6J1VjhcojoZxqkFaO3N9S2yPoDjJM=
X-Google-Smtp-Source: 
 AA6agR6W4ds4eHMF2q6VKm5vnKT0kG40/3s3yIraQyOREou825QiscWVgRzvjSLDw5Vh6onkhMYQ3IUYED//ZHZ9B9E=
X-Received: by 2002:a05:6512:694:b0:494:9a24:3243 with SMTP id
 t20-20020a056512069400b004949a243243mr2461716lfe.673.1662104489243; Fri, 02
 Sep 2022 00:41:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220901142328.268769-1-alex@linutronix.de>
 <d9ec6fa663d94bcc9229066100a140fc@axis.com>
 <1710F0E3F6A43399.12033@lists.openembedded.org>
 <CANNYZj-YxzNONuKM5UVsvW7aS+k+aDTUw4GeK=MkMgGCdygxFg@mail.gmail.com>
 <eca823296bc1d5163f549ab1cbfc9408a2cbcca8.camel@linuxfoundation.org>
In-Reply-To: 
 <eca823296bc1d5163f549ab1cbfc9408a2cbcca8.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 2 Sep 2022 09:41:17 +0200
Message-ID: 
 <CANNYZj8BB6EoUawY16RG1sm_SV430DxRGYjsBQT4EjtgJTMBew@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] scripts/oe-setup-builddir: migrate
 build/conf/templateconf.cfg to new template locations
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Sep 2022 07:41:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170238

On Fri, 2 Sept 2022 at 09:37, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> > > We can however add a hint to check what is in
> > > build/conf/templateconf.cfg if the test fails, as it is not obvious
> > > that TEMPLATECONF obtained from there takes priority over other
> > > sources (which are, in order, TEMPLATECONF passed via environment,
> > > then .templateconf next to oe-init-build-env).
> >
> > Ok, the more I think about this, the more I'm convinced that
> > oe-setup-builddir needs a complete refactor.
>
> That script is meant to be really really simple and push any heavy
> lifting off to bitbake or other tools. Ideally we were never even meant
> to need such a script and the tools would "just work". I'd prefer it
> went away, not rewrite and grow it.

Rewriting it in python will make it twice (or more) shorter, and the
order of templateconfs does need clarity and logic. We can leave the
'config fragments' or anything more advanced out.

Alex

