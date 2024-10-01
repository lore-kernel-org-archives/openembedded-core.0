Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DF8BCEACF1
	for <webhook@archiver.kernel.org>; Tue,  1 Oct 2024 18:47:42 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web11.89905.1727808453044338635
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Oct 2024 11:47:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=xxrayMhB;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.175, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7a99fdf2e1aso743700385a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Oct 2024 11:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1727808452; x=1728413252; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tXY94Vc9mCyg8mBBdT0+ponkHAlDcGS5X6XPXY//sME=;
        b=xxrayMhB7v8Z9+/rNR27YbpYJ8CeoJYEECEaIEzXtp96CVr3SHwxGRBLuhN8YTpyih
         MoGPNEJaOGaSRPBGdpMVOMsWV2nA4LibBOl0VQxbwzDQJUFg8L/MsIFpFJT6CGVVaOVL
         z7wz3INtHRRlkJZ9Yb4G6fTToX6YdHo9pQXCW/0mAoDFJpuArI6mBAWrBTZu9VtP0maC
         3aIGI44pqe7+CTdgKwqU17rkA2A34BS7mWZh2RkM3NZz09A+y9OhLJKvzLZsUbJThJtq
         MrKJq545Wm8grxqLNtFbNlcWO4yV+JrUaBFaEe7Lk8/zILXQMMGsF3I3K+vQD4YpoPno
         tovw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727808452; x=1728413252;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tXY94Vc9mCyg8mBBdT0+ponkHAlDcGS5X6XPXY//sME=;
        b=CgnvEaENZ8cb7GNE4PDIMbWYTgPvXdlDtu7+C4TYrdKe++OK7o6RRnjP3F2M308+M9
         IMvOsgLDu041WU4O9+Ua+pm5BVw6HQtcBLODqqYcHARqV+Mli5ss++q5fg34jT3BdEE/
         EYJtkhoOX4v41fnD5y9YY11wt0S6MXmjNdT3k4L9IqYBFdmc7AL7E5UWQc6SCmr2nwuc
         U2JEIEoJOCdPgBopQA0sHqLVemCIpm8U75xVzoxbf7J/9B9rM9t4SIFpyCKDzAHoeGz3
         kCI4WpLB3HdX8nbIi9ELsUfrAxS/C4De05sqBOS53MvMPLgHvKkwaF/sqUIn/EuPf1SK
         58/g==
X-Gm-Message-State: AOJu0YzBJIadcU0k14gMZoFJeLY+RIWU+hd+UfwYOWbm37HnrovGCn8M
	y/g90pX+SB7446l410N7wCtLwg8y8usIMue+dlMAz72zd1lOiU3Ocs/bYKkpFA==
X-Google-Smtp-Source: AGHT+IHuzksuiTGyEkRMZnOSLpB3rFeI/9czYy3Rq4J77YlDgmQhuOvm13tDUFkDBxJEHlyUzmmR5w==
X-Received: by 2002:a05:6214:570d:b0:6c3:5c75:d2bc with SMTP id 6a1803df08f44-6cb81bb7da3mr5758896d6.47.1727808451964;
        Tue, 01 Oct 2024 11:47:31 -0700 (PDT)
Received: from kudzu.us ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b630970sm51910846d6.64.2024.10.01.11.47.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 11:47:31 -0700 (PDT)
Date: Tue, 1 Oct 2024 14:47:29 -0400
From: Jon Mason <jdmason@kudzu.us>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v4] default-distrovars: Have KERNEL_CONSOLE
 reference SERIAL_CONSOLES
Message-ID: <ZvxDwT3fD1tfrs0J@kudzu.us>
References: <20241001134322.1166436-1-jdmason@kudzu.us>
 <7feab7358ed78cb749f95cfa9b104e45b50be88e.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7feab7358ed78cb749f95cfa9b104e45b50be88e.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Oct 2024 18:47:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205178

On Tue, Oct 01, 2024 at 02:56:14PM +0100, Richard Purdie wrote:
> On Tue, 2024-10-01 at 09:43 -0400, Jon Mason via lists.openembedded.org
> wrote:
> > Currently, KERNEL_CONSOLE has a default value of "ttyS0".� However,
> > Arm
> > machines and those using virtio serial prefer to use "ttyAMA0" or
> > "hvc0"
> > (or something else).� These are usually defined by the machine config
> > file as SERIAL_CONSOLES, which has one or more entries.� Take the
> > first
> > one of those instead of ttyS0, but default back to ttyS0 if nothing
> > is
> > set.
> > 
> > Also, use this variable in the efi wic file instead of "ttyS0".
> > Of note, this changes the default speed of the default kernel console
> > from undefined (9600) to 115200.� This allows for users of the
> > mkefidisk.wks to work as before but any users of this variable could
> > see
> > changed behavior and would now need to define this as:
> > KERNEL_CONSOLE ?= "ttyS0,9600"
> > 
> > This includes revisions suggested by Quentin Schulz and Ross Burton.
> > 
> > Signed-off-by: Jon Mason <jdmason@kudzu.us>
> > ---
> > �meta/classes-recipe/image_types_wic.bbclass���� | 1 +
> > �meta/conf/distro/include/default-distrovars.inc | 3 ++-
> > �scripts/lib/wic/canned-wks/mkefidisk.wks������� | 2 +-
> > �3 files changed, 4 insertions(+), 2 deletions(-)
> > 
> > diff --git a/meta/classes-recipe/image_types_wic.bbclass
> > b/meta/classes-recipe/image_types_wic.bbclass
> > index 86f40633ebcb..db598e874ad7 100644
> > --- a/meta/classes-recipe/image_types_wic.bbclass
> > +++ b/meta/classes-recipe/image_types_wic.bbclass
> > @@ -26,6 +26,7 @@ WICVARS ?= "\
> > �	INITRD \
> > �	INITRD_LIVE \
> > �	ISODIR \
> > +������� KERNEL_CONSOLE \
> 
> I'll fix that whitespace rather than ask for a v5...

I changed this version to be tabs, which was a comment Peter Kjellerstedt made on v3.

Thanks,
Jon

> 
> Cheers,
> 
> Richard
> 

