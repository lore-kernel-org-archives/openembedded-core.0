Return-Path: <petr.vorel@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 621B4C4828D
	for <webhook@archiver.kernel.org>; Mon,  5 Feb 2024 10:43:55 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.60368.1707129826711609097
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Feb 2024 02:43:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IcuYsxgb;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: petr.vorel@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5111c7d40deso6976248e87.1
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Feb 2024 02:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707129825; x=1707734625; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WPYNSGAIVg5lWru+0xd+4tJCfsodY/myBptslXjTZac=;
        b=IcuYsxgbLtRLXd9ncISjuWgls68nDhnh7xVgcgpwiNVJ/0D71pHAJ47QVJm+RH0eWx
         O/o7ychCA8GrIuMHOuiBhJCnlwgevVzHmXSTuFJssUIj7yFD9cJ7lntaiXx2zvzwMIN2
         5og8UYcSYFGanoIG99LnhbLqUc1YiMT/Hfbg6l9hM2sFh1fRIYefI9HFAFb8v3ms6mbe
         dYpxLw0axeDcDrPWW9zjgQcS00hNYk8VgzUcLSD9H0p7QLwA0OKYrPdY8Zb7ApJulpol
         IeIzKaURlwpO1+Tuy6QJ84MuZEsYSEQSErcyHJVmRhD3xKMf1IGle4gyaD9MeQTpHFEl
         dgDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707129825; x=1707734625;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WPYNSGAIVg5lWru+0xd+4tJCfsodY/myBptslXjTZac=;
        b=FzSJk2zE+MyWYE2jciRzLSxAykDRwNgq+iY5TkNCZ0UU+a7ojJNPJzgEA7RQqrGi5z
         ZG2uhYxL5JbUBnfbiNKtuvgKZGJ3L28PUWdW4dMSeY++1zZnMm0Lmi1yhnmF9/3N0nx5
         StyDDl6UHLpXZCXvlVH2eM8lYczDBq47d0JLJx6SlQAH7AWFBi0IE7K+BAGUcClVOFoZ
         00fohMlCNX8D57AqZ7gQcN1nZMOi5HfTv//ADSLzsTUWV5LRn2XWVY2Q6aaXagMAA7Je
         v59Cqy3v5TTk1hcSol1vVjDIzv+8pO1BnxyPFnqnMjwa9ZdZoxVbZsTevUHtwbqQQz0m
         qXBw==
X-Gm-Message-State: AOJu0YwSKMvNeBWD28CPjTlQx1twHsqvuO4ls7xvhRwC3sXTfhjHGGwz
	AJ4pEwNTivBZV+GlJMvld3oz4Z1Y75hLzzqtQrHwEnsseAwBMAQ1
X-Google-Smtp-Source: AGHT+IHneKY28akKgeh99hGMgqPeegi0IkCHriXda5ohhgTZXIyUj6soZR3PzKjCsPzIy1N/nVPTLg==
X-Received: by 2002:a2e:8884:0:b0:2d0:a0be:89a3 with SMTP id k4-20020a2e8884000000b002d0a0be89a3mr2806850lji.46.1707129824659;
        Mon, 05 Feb 2024 02:43:44 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXUGjXreYc8x/XVDSYGGtBazxnHEQBTjsFvvN9zwYVXm/HjwpPMb+51DQ+RJIkEyQGXTy7gDLUaPXalGjM/2y9CJP3pW4KKLoN8iANConHpNlPc9A8oRuPhHMdV5XKe0G/eTTFj9gOhGM38kxt8R22MtR5ghfkwGm1X7esVrhtC7+bHtms=
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
        by smtp.gmail.com with ESMTPSA id ck9-20020a0564021c0900b0056007548c9csm2965237edb.48.2024.02.05.02.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 02:43:44 -0800 (PST)
Date: Mon, 5 Feb 2024 11:43:42 +0100
From: Petr Vorel <petr.vorel@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	openembedded-core@lists.openembedded.org,
	Daniel =?iso-8859-2?Q?D=EDaz?= <daniel.diaz@linaro.org>,
	Khem Raj <raj.khem@gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] ltp: Update to 20240129
Message-ID: <20240205104342.GB166229@pevik>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
References: <20240131183243.30223-1-petr.vorel@gmail.com>
 <202402021507535468a87c@mail.local>
 <20240203235247.GA163430@pevik>
 <c6b68e4d96108645ffcfdac875e6081c57bdf7a1.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c6b68e4d96108645ffcfdac875e6081c57bdf7a1.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Feb 2024 10:43:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194925

> Hi Petr,

> On Sun, 2024-02-04 at 00:52 +0100, Petr Vorel wrote:
> > Hi Alexandre, all,

> > > On 31/01/2024 19:32:43+0100, Petr Vorel wrote:
> > > > Removed patch accepted upstream as
> > > > 8c53cc947 ("testcases/kernel/syscalls/fcntl: define _LARGEFILE64_SOURCE")

> > > > Rebase runtest/mm patch.

> > > > Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> > > > ---
> > > > Hi Richard, Daniel, Khem,

> > > > could anybody please test this update if build (it should).

> > > > Also, it'd be good nice to rerun proc01 -m 128 and report me with the
> > > > details, maybe we can fix it. If still problematic, it'd be nice to turn
> > > > disable_hanging_tests.patch into proper git patch (makes rebasing patch
> > > > on new LTP version easier).

> > > This fails on the autobuilders:

> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/95/builds/5957/steps/12/logs/stdio
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/96/builds/5917/steps/12/logs/stdio


> > Thanks for testing this, you probably mean the warning before python stack trace:

> > scp: /opt/ltp/results/connectors: No such file or directory
> > WARNING: core-image-sato-1.0-r0 do_testimage: File could not be copied. Output: scp: /opt/ltp/results/connectors: No such file or directory

> > The problem is not due packaging, but simply runtest/connectors was removed [1],
> > thus your tooling has to be fixed not to expect it (not trying to run it).
> > I'm sorry, we sometimes do cleanup which brings incompatibility issue
> > (here it did not make sense to start SUT just for single test, thus we moved the
> > test to runtest/kernel_misc).

> I did try again with that removed:

> https://autobuilder.yoctoproject.org/typhoon/#/builders/96/builds/5929/steps/12/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/95/builds/5968/steps/12/logs/stdio

> which comes down to:

> scp: /opt/ltp/results/fsx: No such file or directory

> so I'll remove that and try again.

> Are there any additions we should be considering too? This all feels a
> little fragile so I'm wondering if we should be reworking the way we
> handle this?

I forget that also this one was removed in fb2b6a0b3 ("fs: Remove fsx runtest
suite") [1], therefore not a real error.

Kind regards,
Petr

[1] https://github.com/linux-test-project/ltp/commit/fb2b6a0b3c840aa80229acf4360b7bdc3ced5edb

> Cheers,

> Richard

