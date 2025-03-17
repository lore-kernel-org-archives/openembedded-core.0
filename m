Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 614ADC28B30
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 14:24:30 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web11.53910.1742221466206640274
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Mar 2025 07:24:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NfGGV9bx;
 spf=pass (domain: gmail.com, ip: 209.85.222.173, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7c55500d08cso383747485a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 07:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742221465; x=1742826265; darn=lists.openembedded.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hCTtk4KA81y9bFEGCzsFVf10E0/brMBNn200gCUFBBI=;
        b=NfGGV9bxN593KavCcf8/1+bVZVG+tzAE1F+8IwsjQq73kf0scapqHenh/eYjfSd9aX
         IEFfeEYjPpdElE8K5szGOX4Nhn6m5ohJMpRPOEyg4Di20H8XA32a9VstXOAu3ONYlzU5
         iXJpEXBJxKXYGw/7xc0zpFPEwX1gAsftqu9aPX0Z9B1ZG3O8JloIdGNvJPXgiIlnF4Wa
         SPuXt7L5kWs3+KdYAca6zAwnqcjUUPqzGOiFifRqPzDLFIw8hlsWES25KZBxjZyrtmrV
         dMh+uX5oBl+7LKQumWslYS46Pp3edTldXYiZNjs87mXGQRhFrjkj0nFiLbEF7dfQDuDK
         Jq2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742221465; x=1742826265;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hCTtk4KA81y9bFEGCzsFVf10E0/brMBNn200gCUFBBI=;
        b=IpjCJ6qk+EArDc/1P3w9SmEU3RUNOwGLUfcfRuxmwIO0+3UY3FHv1jjOXBQqY2JwOZ
         rDeLVikS+ckzQ+oSFyOSCKf3Yg1pfwX/8IQp4XvQ4nt+0xGe1YeN8d3/eD/+TInrXl1F
         3JC+BuFxJLe4nO0/+wi/E3au7DiEk0UsNbST6cGCI78JJnv4KdUNF8abDmOXtraDXABE
         30iMgq1PFzWCY0xhTjmGmwA+VoKGjsetT/ddExg2YpRa4Zmai5Ry/f1skgoPOR5O9stl
         aBx6zC0L/G+75xP3Y3pFbqiWl2MmY/WR1RIIadWOeau9GTq31pX11NySkX8GL/g2wSjk
         8eUw==
X-Gm-Message-State: AOJu0YxoYseGY5bDiDZBARXL3ECCagC/kn3ZduS+MV+Iy6sJLfx3gmIV
	fTPeFXHhunu9w4Sk7JM5SMNKzDJtCZnDwpPVrsZpWzUsATIeNe4/
X-Gm-Gg: ASbGncvvtoI05pbrqk91AZ8UY+UqvdGTDrZj9XcA99pT9TrvN9FTUwl7r8Lk0MNZeia
	aDfbfjDEU6rk0xj+LOGRoKXpQom1eSTlwSzgfFQ/Kr41a70DI3xMYk1Dg10EralQTBZP5u3A3Ia
	qtOrLz6tID2yz8szaHGrBv/9UzfgOmfd9GzwPevGFdlK4fA+e/qKmXDNIzDVKsRA1WjPjXsgIff
	vPp2v45BIK22xHRuMZgpi9QnfRqWp2KN2TjL6S9WSYhvB/Qa+1JCwpPBrwsT577KmK4LdpWXcxV
	Y8C2ZBC8heaFMSwmxcsBySNM1xMN+fD5X2iwafOar34E9XhRa7alh4S/xE8ipy2kG3S6P1Vu
X-Google-Smtp-Source: AGHT+IFWqF2y6pLHpIHZxs9VYhCTZblbT91lcuGQqt/VvRpuEuo2+IxKZnXl+xvxDjj8AztxcWU/8A==
X-Received: by 2002:a05:620a:29c9:b0:7c5:5cd6:5cf2 with SMTP id af79cd13be357-7c57c7d29afmr1637057685a.17.1742221465200;
        Mon, 17 Mar 2025 07:24:25 -0700 (PDT)
Received: from localhost (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c573d8ab26sm591113085a.110.2025.03.17.07.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 07:24:24 -0700 (PDT)
Date: Mon, 17 Mar 2025 10:24:22 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: dixitparmar19@gmail.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] kernel-module-split: fix conf file generation
 when KERNEL_SPLIT_MODULES=0
Message-ID: <20250317142422.GA20712@localhost>
References: <Z8IIVTwVir8JCsxE@gmail.com>
 <4168.1742113007457227336@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4168.1742113007457227336@lists.openembedded.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 14:24:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213104

On Sun 2025-03-16 @ 01:16:47 AM, Dixit Parmar via lists.openembedded.org wrote:
> Can you show the conf files for the same kernel configuration
> with and without the kernel_split_modules enabled ? That way
> we know there's no change in existing behaviour.
> > I have confirmed that in my testing. Can you suggest how I can
> share that information here?

What data are you expecting to find, and where are you expecting to find
it, that prompted this fix? I assume that in one case there will be
information/files populated in the image's /etc/modprobe.d and in the other
case (the buggy case) that isn't happening? Or is there something else?

Can you provide complete instructions and/or your configuration demonstrating
the problem occurring before your fix, and the problem being solved by your
fix? Simply enabling KERNEL_SPLIT_MODULES by itself won't show anything unless
the user is trying to enable some module(s) too.

I found that I had to go read the bugzilla report to better understand the
issue and potentially how to show it occurring. Keep the reference to the
bugzilla, but ideally the commit message would have all the necessary
information to understand and reproduce the issue.

> We also should make a test for this in the OE selftests. We
> are adding conditional code paths, so they should be tested
> to ensure no regressions in either in the future.
> > Never done that before. May be I can do it given some direction
> as separate patch.
> I'm curious about the above line. It is unclear to me why we'd
> only have this postinst be relevant if none was previously set.
> > Reverted.
> Is there really a scenario where the directory won't exist ? Isn't
> this just running in our own install phase ? So all prerequisites
> and directories should be in place.
> > Ideally no, we kept it for safer side, I have added log warning.
> The walking and sorting seems quite heavy.  Isn't this called from do_split_packages indirectly ?
> Do we really need to walk and gather the information ? Is this mainly for the case of no-split
> on the kernel modules ? If that is the case, isn't there a way to short circuit the processing
> on the split-package case ?
> > Litterally I could not think of anything else here and not sure of there
> are any short-circuit options. I have limited knowledge in this. I am open to suggestions
> if this is not the best solution at the moment.

It is customary that quoted text have the start-of-line ">" symbols (the more
symbols, the further back in history the comment) and that replies not have
any start-of-line character, as I'm doing here. Your email program should have
an option to do this automatically.

