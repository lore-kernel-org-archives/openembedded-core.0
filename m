Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57207C54798
	for <webhook@archiver.kernel.org>; Thu, 29 Feb 2024 07:30:11 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.19311.1709191808072876587
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Feb 2024 23:30:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=yWiLLu83;
 spf=pass (domain: linaro.org, ip: 209.85.167.46, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-512d19e2cb8so647217e87.0
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 23:30:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709191806; x=1709796606; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XSflte9ob2RWqVLpzIroukwlJwvj4dK3h7NcXLMEjX0=;
        b=yWiLLu83sPC2iQsoF2jQB/5S8aUe4fF3MnM34C9WNwubCfZPLpv7PhTbRRyPb0HnR2
         gL1XvM6+Q59P1HLeAsqNBryjRX+fxoqhMcUVz7tt3MOB8zGP/4qyPXhOcvGnv6wVqxsQ
         uhiUgCjMqq9qM32soGecixcQzY2VFeaT5XrG4bxs63ASrdycC3yHNJc/qdfknnXX8jk6
         F818aK9g0/wyeYhq78fjQzxFcQNB2DEsEvxPYrZJvOBjKgJ9rJ8EMhR1HkzhOpfzPekv
         wkf2iTPEwjQkDsSmU5hsmOttLITxPCGNY+eOF00l7TWt0Xb1p9TcD0GlSIhdwpnNDD76
         jhSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709191806; x=1709796606;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XSflte9ob2RWqVLpzIroukwlJwvj4dK3h7NcXLMEjX0=;
        b=D1o5wkssuZ66jwNVUu70rjFd9n30qILximbIoZt0EoIawpaxJIqW56NlmrJu4FVA5j
         biuriB7Z8E3QTqYhAw4R4jXob6MzLF2Q9PiN3ohTzC2G6060nVUyd9K366lBt/HEQXZe
         FXtx+RND0HLA9DfHtF/3D0ZhutVWjbexmyqJqN21N0D9ya/UThseHppsbIyLh6TbkMm1
         yeVZxiUGVOvG9hzzsTB5AB9QgbUEwvJjjef6lYAVGbgRBuitWCz9wiLxnzLNk4He91/J
         rKOIsrFEgSnpw9VyEH31ScZzUgJh++9k7E0UNsAYc+CU+kH9GY4ij3npj3/6wH2UbKkI
         n1dg==
X-Gm-Message-State: AOJu0YzLKcwji/weHNwmZ1u+TLsTANkwfLIkl/JYl5Q9iZtra/bNh/H7
	YdUize7Al5WujURuVGvMdK+Fgn0TPoIRZUJNqz/5NATtSgE9Ds97Ftd4z1gOqvs=
X-Google-Smtp-Source: AGHT+IGY5ANWdFqEFNbOYV8C4szoimOC/8jBiuRdYeZf17UUueJVwHFPZl/h0XSg5iLhWGFwRv1a/g==
X-Received: by 2002:a05:6512:344d:b0:512:fe1f:d3c1 with SMTP id j13-20020a056512344d00b00512fe1fd3c1mr670303lfr.58.1709191806066;
        Wed, 28 Feb 2024 23:30:06 -0800 (PST)
Received: from nuoska (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id r13-20020a19ac4d000000b00512b0a13124sm150728lfc.140.2024.02.28.23.30.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 23:30:05 -0800 (PST)
Date: Thu, 29 Feb 2024 09:30:03 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [OE-core] [PATCH] wic partition.py: add --apparent-size to du
 calls
Message-ID: <ZeAye3E83R5IoW_n@nuoska>
References: <20240227112357.2455578-1-mikko.rapeli@linaro.org>
 <d7abf62f2c7e7312c93ce6ad066aa16f81f519c9.camel@linuxfoundation.org>
 <Zd3NolrDmgFmAOG5@nuoska>
 <81f85c74599c856e7cadb31352340532dfa26504.camel@linuxfoundation.org>
 <Zd3UXd9ks9FWKH8Q@nuoska>
 <27646d1e2d357dbe208c9950d6a03a433aa01409.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <27646d1e2d357dbe208c9950d6a03a433aa01409.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Feb 2024 07:30:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196417

Hi,

On Tue, Feb 27, 2024 at 12:33:15PM +0000, Richard Purdie wrote:
> On Tue, 2024-02-27 at 14:23 +0200, Mikko Rapeli wrote:
> > On Tue, Feb 27, 2024 at 12:06:41PM +0000, Richard Purdie wrote:
> > > Should we break it for others so it works for you?
> > > 
> > > If I merge this patch and then I get other reports in of issues,
> > > I'm
> > > going to be left to somehow fix those other problems. Since your
> > > case
> > > will work you will object if I revert this but you likely won't
> > > have
> > > time to work on the resulting other issues, or be able to reproduce
> > > them since you're building on zfs.
> > > 
> > > So you can see my dilemma? :/
> > > 
> > > Most people don't build on zfs which is probably what I need to
> > > balance
> > > this on.
> > 
> > What if I make this optional for zfs? If build directory type is zfs,
> > then --apparent-size is added, else not.
> 
> Wouldn't that cause some really interesting bug reports?�

Well, if anyone builds on zfs they will hit bugs like this.
zfs usage can be detected and build can fail nicely or apply
the workaround/fix in wic.

> Asking the user to report their host system filesystem type to debug
> anything isn't going to be great.
> 
> I don't like the idea of the non-determinism that introduces but I
> agree we do already have a determinism issue.
> 
> What we probably need is the absolute files size, plus a number of
> files and a number of directories, then you can round up to the worst
> cases for the block size.
> 
> Currently that size number is just including the block sizes.

FWIW, I tried to move this workaround into image recipe with

IMAGE_CMD:wic:prepend() {
    alias df="df --apparent-size"
}

but wic python code doesn't seem to take this into account. Tried also
changing the du calls to have exec_cmd(..., as_shell=True) but this didn't
help either. Something in wic causes the use of another shell or different default
environment for processes.

So I'm stuck with this change in poky to build on a machine with zfs.

Any hints how to apply this simple workaround are welcome.

Cheers,

-Mikko

