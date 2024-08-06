Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04C87C3DA4A
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 03:24:59 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web11.9148.1722914690848472266
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Aug 2024 20:24:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lNFVqfHs;
 spf=pass (domain: gmail.com, ip: 209.85.160.182, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-44fe9cf83c7so669921cf.0
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Aug 2024 20:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722914690; x=1723519490; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9f8Ih0GKyg1kfzU+JcGmp19PYZUIVn2gVtXZpeXMkDw=;
        b=lNFVqfHs1PXd7D0XBGII4uMcTHCLCLV4QuQux7xFld8eUcTFheNDf/c8K2dxENwimZ
         sxlXCZaL60aoF5NfBw8LY+v8xAPH6L0vPmtMv2iOCzPj2XRY+rbarBJgkwWY2Gl20mMN
         Q4TKFdVOEI2wRPQp1yueJZO1UmRqpM51NfdktzRH36TAAffGHd5sf6JYv4LvKLmRXRMG
         nYjPAfrAluYxg+rQI1U+qzE3dlD6qgqSUaxELGUp1CLp/Mh7IWalAbPauaUR+miZm2QG
         dWQ7ie/coNFB2lO/yXuIJfSwkV4vo1Ff+DNnbw6SX4nM/Lub6loXeHk7ebe+EkZJFYcr
         IWzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722914690; x=1723519490;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9f8Ih0GKyg1kfzU+JcGmp19PYZUIVn2gVtXZpeXMkDw=;
        b=P7F/HXFG7fYceIbmEnjE8N2FinTPHe3fyYr+KE6XoeRt9361UdwsFunjMsm88Aw0KO
         Z1Ny9tGWstW1h87L1dEuVM7WwyJlFqgyOWSW3E5hauDcnFR8yLOdlzOjz7+a2EsfOcjz
         1g9B1KZrX+OxRM6GH6NnEISy5sozDcffCRhWQpupTgP/s4+dY7wF5QrHEFfH/kfbPi5H
         wcQFU52pwrAWRxelhzrbYAk5QQsPs41dbKWanKoWOujavxpWlK5ul3oaOU6sbnct+kdP
         RgGYIvkh0iOQsD7gzwj4tb/LkE/klfAStO8qmsQGZIwvr+OAdVXksXDPtet11gXStGCi
         +p6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUkPLK84dYnskzXEhrMn17zJa8M0s1nJV3jRrUFxC3PWOT2Vz/nBUgqMhaKTRBi2laFXGr68k09vuNSTlwDEUHS6UXseix72OlBSAJiGDkqyTeYWJB8xELC
X-Gm-Message-State: AOJu0Yzt+GKqoh1oG+njZkjfe2EZaRWvbAlmsd4U+hYiBlBINCRCd/w3
	Rl24olSjc6hmDPf3Oyrz+AVJ5Tf5fGRoGIvmyththGH0YcD6Pb6k
X-Google-Smtp-Source: AGHT+IEqnfSm7vNfnfgalrg2E99Lh49LLr+3gN0DVlrZPyYSxJoS1yrg9cYbuDk5KhnYRixTLPpEvw==
X-Received: by 2002:ac8:5816:0:b0:447:dac1:2774 with SMTP id d75a77b69052e-451892c6864mr154230731cf.63.1722914689606;
        Mon, 05 Aug 2024 20:24:49 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4518a6c46d2sm33954301cf.23.2024.08.05.20.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Aug 2024 20:24:49 -0700 (PDT)
Date: Mon, 5 Aug 2024 23:24:47 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Scott Murray <scott.murray@konsulko.com>,
	Jan-Simon =?iso-8859-1?Q?M=F6ller?= <jsmoeller@linuxfoundation.org>,
	Jon Mason <Jon.Mason@arm.com>, Ross Burton <ross.burton@arm.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/10] kernel-yocto: consolidated pull request
Message-ID: <ZrGXf+0O9dcbNMCg@gmail.com>
References: <cover.1722524523.git.bruce.ashfield@gmail.com>
 <8e96d9f2ce3e7f2e35a69ec2d9bec9aa6ea0f2fd.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8e96d9f2ce3e7f2e35a69ec2d9bec9aa6ea0f2fd.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Aug 2024 03:24:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203008

In message: Re: [PATCH 00/10] kernel-yocto: consolidated pull request
on 02/08/2024 Richard Purdie wrote:

> Hi Bruce,
> 
> On Thu, 2024-08-01 at 11:08 -0400, bruce.ashfield@gmail.com wrote:
> > Here's the next batch of kernel updates. Obviously the -stable
> > updates to 6.1 are routine, but the larger changes are the
> > introduction of the 6.10 kernel as a new / validated reference
> > version.
> > 
> > Some notes:
> > 
> > � - I've included the poky/poky-tiny preferred version bumps
> > ��� in this pull request for simplicity. Yes, I know they go
> > ��� to meta-yocto, but it is easier to make this available for
> > ��� AB testing when they are all together.
> > 
> > � - I'm watching the status of 6.10, if for some reason it
> > ��� EOLs before we release, we'll jump to 6.11, which I have
> > ��� under test and will push as linux-yocto-dev shortly.
> > 
> > � - There's one known build issue with 6.10, it is zfs in
> > ��� meta-oe. The upstream hasn't updated to support 6.10 yet,
> > ��� so I'm watching and waiting on that .. but there's no
> > ��� reason to hold this request for more testing on that.
> > 
> > � - I've tested 6.10 for all architectures on core-image-minimal,
> > ��� core-image-sato and core-image-kernel-dev. I've also
> > ��� tested against musl and poky-altconfig (6.1 with the
> > ��� 6.10 headers)
> > 
> > There will surely be AB issues with this, but it is now
> > to the point where I need additional coverage and eyes
> > on the changes.
> 
> Thanks for this, I put it through testing after tweaking it to remove a
> rouge inherit. There were some issues:
> 
> a) genericarm64 version issue:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/166/builds/687
> 
> Warnings since genericarm64 isn't available as 6.10. Everything else
> seemed to miss the preferred_version and build 6.6

Unlike the other hardware references, genericarm64 doesn't set
a preferred version. It isn't something that I typically test,
since it is one of the hardware platform.

Until it is tested against 6.10, I could send an update to set
it explicity to 6.6.

Would that be acceptable to everyone ?

> 
> b) crypto-dev failures:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/9329
> https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/9340
> https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/9313
> https://autobuilder.yoctoproject.org/typhoon/#/builders/52/builds/9161/steps/11/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/5141/steps/12/logs/stdio
> (the latter taking out the reproducibility build so that wasn't tested)

Hopefully your patch addressed it, let me know if I need to
look into it more.

> 
> c) meta-virt xen issues:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/128/builds/3455

I pushed a new .inc to meta-virt

> 
> d) meta-agl kernel config fragment warnings:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/120/builds/4556
> 
> e) meta-arm kernel config fragment warnings:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/113/builds/5810

d/e I'll leave for the layer owners.

> 
> f) qemumips64 parselogs issue:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/74/builds/9240/steps/14/logs/stdio
> "failed when register_sysctl_sz sched_fair_sysctls to kernel"
> "failed when register_sysctl_sz sched_core_sysctls to kernel"
> "pci 0000:00:00.0: [Firmware Bug]: BAR 5: invalid; can't size"
> (and other BARs)

One of the format's changed and the other is harmless, I have
a patch to update and add the other to what we ignore.

> 
> g) qemumips parselogs issue:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/60/builds/9256/steps/15/logs/stdio
> Similar to qemumips64

Same fix.

> 
> h) qemuarmv5 config fragment warning:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/160/builds/989

Fixed.

I'll send v2 later in the day on Tuesday.

Bruce

> 
> I've copied agl/arm people.
> 
> Probably nothing too surprising. I'll drop some of the patches whilst
> we resolve these but see if we can keep the headers upgrade and the
> point release bumps.
> 
> I'll try and test the crypto-dev upgrade on the list as that might help
> that issue.
> 
> Cheers,
> 
> Richard
> 
> 

