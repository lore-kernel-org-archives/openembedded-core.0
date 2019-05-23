Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f196.google.com (mail-it1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id 01E427C446
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 12:05:19 +0000 (UTC)
Received: by mail-it1-f196.google.com with SMTP id i10so9225209ite.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 05:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=FpznKXZ0kTmwYPtdwaMUnvgIQQfPQzWY6O4P7K0gEk8=;
	b=UIo6etlG8VSbqQ+W+0gH5HfDEOpfjfNgW09Y4F5u1uCav9wI9QP3lVNbVki6ZQHqhS
	FIZ/pnVbzRM27akZRg4Braj5ZyAyJIdp0JSBR3VMfBhQPqN+n+FqBr84Z4AAbCuY0XqW
	fYdREPuNFcXNGZ+zkUTP9Fck4pQgh9XZDUueIo0xA+YnmhmrO1F8DDlZLjp5aY6bE1to
	8YyE4zWtE85p1SXMkcgGwvboveFR5Gzp4PBBy9ecEgoTIQfOVZtk7dXg/HC2VrTreb8m
	3Rr60hi9UlRDoXe9h+UZw9YvXrwlYBHDpM7kjxodMR0yMLIzoM6vbqH+xvs9xx8A3XWz
	q9Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=FpznKXZ0kTmwYPtdwaMUnvgIQQfPQzWY6O4P7K0gEk8=;
	b=LzONER3KUQ5puipDL4jl97cNji5uDqSW0aRkYn7hkLDOvpffFxPnOJLDWgdZhZEVtj
	XCIIL9lUUHZd4eK1a+hmjR7+7/QnL1VkumKeR/RxJjAouoRvXzh8Muk3JRBA4r4kEdX9
	sS2HWHIWFc8EQyL5IC8Vs9zZC08yha1lGv01nFKLEm9eC9wJF9IONqo3f8p8BOiKYJUn
	Y0ccoVBl3Ft8g64R1901FgG13y/uQX2NB9QvkTF9ML4Gyu2B5jVDk/BNKbI+3hlyoP3I
	sPe/iDf1cfHjmbtUbiOUBFiSFMEIcuwhrIwJdWUDsR+SLvGR4RIYM3LFud/j8QMsX3dP
	94gw==
X-Gm-Message-State: APjAAAXCQBPj3POrTMXaUD0fXgrIVntDu4mrvIk5KD32bXKFfCbfEhPc
	6QGNA7aLYuz6aM1oV3eS8Rwbx+bJflwykI+WOToxWg==
X-Google-Smtp-Source: APXvYqwh6c1dOu8R5G3cg65ALsEOLBI9dhpy8N2b+d88pIu6qEiy9XPsmfQNCe7+rCJjcjwP9FlDJG/jyEg5bi7twuA=
X-Received: by 2002:a24:c204:: with SMTP id i4mr12796944itg.83.1558613120292; 
	Thu, 23 May 2019 05:05:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190523074703.17145-1-nick83ola@gmail.com>
	<7193bf9fbc6d557744214a3dc82ded086f441f0d.camel@andred.net>
	<CABPh3UNdOXZraHAurMyH+x3YSJbnQJif6Ff_oHTU2W+8t=0hDg@mail.gmail.com>
In-Reply-To: <CABPh3UNdOXZraHAurMyH+x3YSJbnQJif6Ff_oHTU2W+8t=0hDg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 23 May 2019 13:05:09 +0100
Message-ID: <CAJTo0LZaL_pGeEx6+hRJr67Y+1rpD3-uVVLqS==cBaVhLvBdnA@mail.gmail.com>
To: nick83ola <nick83ola@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] connman: fix segfault with musl >2.21
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 23 May 2019 12:05:20 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, 23 May 2019 at 12:07, nick83ola <nick83ola@gmail.com> wrote:
> that is why I put it into the musl specific patches.
> But ok I will repost it putting it in the generic SRC_URI.

Rule of thumb is to only apply patches in an override if they break
other cases outside of the override.  In this case, it's just an extra
guard, so nothing else breaks.

Rationale being that when a patch is in an override it doesn't get
tested as much.

Ross

