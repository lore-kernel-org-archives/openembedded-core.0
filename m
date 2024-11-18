Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFBE1D4922F
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 14:56:08 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.43165.1731941766927128914
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 06:56:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=gLl3GHrC;
 spf=pass (domain: linaro.org, ip: 209.85.167.52, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-53da3545908so2292432e87.1
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 06:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731941765; x=1732546565; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=h//xbhgvniJ2sUeyQOGLtFpq1XbQWsfw/2+/AdF7HHA=;
        b=gLl3GHrCCVwPtqRvxLKbJgdDrK9HzHTU74LU70fSssTh+RnwJKwfC83NmO1ESftL0I
         MifOSSMVSIwbpd/0fyiJUFXYxpZH2crkv8e0ZDOEbF5l2wFAZNp1T7W9FQf8Xa2kPejo
         wgDDF9AYdm6Zsxr4EEG8mazi+CLH1ODeojP5wjqeFuvzIr3SGaGYTlZLKPOVnzcDdQsC
         gcR+CgrtMci+t9i4wx98PHuBEAiii81o/bNw3lpIUQAK25/4Xlfssj1wwcRWHMwmPkHf
         3N9OB8LdfvyUiekVtcbiS7k6RoeMQ/jsz7xwVPtwkCjDiy5Uf2mhIXQyQ87hBjZ/H6VH
         AJpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731941765; x=1732546565;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h//xbhgvniJ2sUeyQOGLtFpq1XbQWsfw/2+/AdF7HHA=;
        b=m21IqqqlveL7WkOjJMg6+RrIjZ2OjAM6nNJ4EQW52p3aA0GJ02IEEVtMWe8xu14ru2
         b6N0B9r7+K5Di+pLmDddvlyoqmtFCaxfzG6nJ4KFcZVXX1eCO5TtvB9/zsrn41UqmSGR
         Z8plMONTPjBghEB7TwHn+BokdhutOOmeXm39ZmRn5F+6HRd+57zXlLXRwvyXNBiAQsBF
         Ad/jFLnhZL9GuLYXkjlO1nFhCNINKiKZaFer1xU6WpYLHBtO1HEL+2TYIoaH2g1HpT0o
         rygwAiFIj/PMFfqdqCbUyB1pDPJ+ZbAb0c4CBh+NkZeIV+llf2jOJTbw5xdGazC4Qui8
         1tRQ==
X-Gm-Message-State: AOJu0YyQsEK7l0v4gkhwhMyRRoAxwHp92eud5/65NtUBoTV6GpJ1yqkX
	Gl9zFJytykggBO1yuSOPfblJ2l9ftHgzkV5JRqov6CZIJaMKv8RG8KzusWQoh6w=
X-Google-Smtp-Source: AGHT+IGJryC92D9MOmmftbscmwIjPkLFGQD9JgidqYd/Lo7gcDatP+Lld1vA0ktVoX0UbQ9HWKmyQA==
X-Received: by 2002:a05:6512:3ca0:b0:539:8bc6:694a with SMTP id 2adb3069b0e04-53dab2b97b8mr5925586e87.43.1731941764877;
        Mon, 18 Nov 2024 06:56:04 -0800 (PST)
Received: from nuoska (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53da6549219sm1621847e87.273.2024.11.18.06.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 06:56:03 -0800 (PST)
Date: Mon, 18 Nov 2024 16:55:56 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: m.salvini@koansoftware.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] wic builds an empty rootfs on second image build with
 rm_work enabled
Message-ID: <ZztVfA0BRZjo4SxY@nuoska>
References: <Zyjj-0oflBsZfj1C@nuoska>
 <553b223a0d437044e587b0ddaf0519803ff57f2f.camel@linuxfoundation.org>
 <ZztNMmHa7s21MJXI@nuoska>
 <3c967bf5-9856-4a91-874a-5e40b4b4e7cd@koansoftware.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3c967bf5-9856-4a91-874a-5e40b4b4e7cd@koansoftware.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 14:56:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207218

Hi,

On Mon, Nov 18, 2024 at 03:49:01PM +0100, Mauro via lists.openembedded.org wrote:
> On 18/11/24 15:20, Mikko Rapeli via lists.openembedded.org wrote:
> > Hi,
> > 
> > On Tue, Nov 05, 2024 at 03:53:49PM +0000, Richard Purdie wrote:
> > > On Mon, 2024-11-04 at 17:10 +0200, Mikko Rapeli via lists.openembedded.org wrote:
> > > > Hi,
> > > > 
> > > > After image build completes, rootfs directory is wiped by rm_work_rootfs.
> > > > 
> > > > If the image recipe is built again without clean, for example when
> > > > TESTIMAGE_AUTO is enabled to run tests, then rootfs task will not
> > > > run and thus wic uses an empty rootfs directory to populate the rootfs which
> > > > of course then fails at runtime.
> > > > 
> > > > How to fix this?
> > > > 
> > > > I know RP doesn't like rm_work, but I really need it. I can't leave all
> > > > builds laying around and bitbake IPC setup fails if a lot of IO is wiping
> > > > build/tpm's while recipe parsing is happening (the famous 30 second timeout).
> > > > 
> > > > wic image related tasks could possible depend on do_rootfs instead of
> > > > do_image_complete but seems to break the whole do_image_complete design.
> > > > 
> > > > Should rm_work_rootfs be moved from after do_image_complete to after do_image_wic
> > > > if wic images are used?
> > > > 
> > > > Or should users just remember to "bitbake -c clean image && bitbake image" if things
> > > > fail?
> > > > 
> > > > There are some other issues with testimage.bbclass and leaking cooker processes
> > > > which confused me for a long time but I'll try to send patches for those.
> > > 
> > > Does changing:
> > > 
> > > image_types_wic.bbclass:
> > >          bb.build.addtask('do_image_wic', 'do_image_complete', None, d)
> > > to
> > >          bb.build.addtask('do_image_wic', 'do_image_complete', 'do_rootfs', d)
> > > 
> > > help?
> > 
> > This did not help. I need to dig deeper. Some of my changes may be
> > triggering this. I'm seeing this now on aarch64 and x86_64 build machines.
> > 
> > Cheers,
> > 
> > -Mikko
> > 
> 
> Hi Mikko,
> 
> my two cents: do you have the rm_work enabled? I've seen something similar
> in the past, but with initramfs (the generated cpio.gz file sometimes was
> empty). It seemed that adding and then removing a change to the image
> triggered the problem, as if an older but "corrupted" sstate has been used.
> I've not found the time to dig into that, but I supposed that rm_work could
> be the culprit.
> 
> Hope it could help and not add more confusion.

Yes, I'm using rm_work so it's part of the root cause. There are
some other issues too, for example wic happily uses an empty rootfs
directory when creating images and doesn't fail when it IMO should.
I need to dig deeper into this.

Cheers,

-Mikko

