Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E517C4332F
	for <webhook@archiver.kernel.org>; Fri,  9 Dec 2022 13:07:03 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web10.438.1670591219100222413
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Dec 2022 05:06:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ktV4VQYC;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id BB353100010;
	Fri,  9 Dec 2022 13:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1670591217;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=62+k5v/3HL7ItW6M85HZALmMDXMsePkfULi08iCqj4A=;
	b=ktV4VQYCSXMfvJr7b5Mj/ypG/LEqV0wAxleEXNzi3WvTd0/HNRQbxUO16dbAY4h1iC1UWt
	iN+LE/kW3h552lBKM/vzcFr15dZCAfETnhgsg9BscsIiFzw6m6wEVdvi3ZIyYw3eK3oZx5
	pRT7tSlobHSu+2VSRBDCBDkxHf/9uURCS817RD33CiEH2kIJrHMeoXJM6Ee70hd36AY+xp
	69Wtqj937YfbcWiHUuAaFF2wcFUD4T3Q5Gr2q33hbjEtX1HkyKlQvtjJvk6lqjbEKf7IwW
	a+haOPzUwwqLFa6zMHU1aaOO9DFOB1PRaE5jyqUx5QtYOun1di/6Tp04JOcHrw==
Date: Fri, 9 Dec 2022 14:06:56 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Ola x Nilsson <ola.x.nilsson@axis.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH RFC 3/3] time64.conf: Include to enable 64 bit
 time flags
Message-ID: <Y5My8D/hO5KU9mjs@mail.local>
References: <20221208071136.1967696-1-olani@axis.com>
 <20221208071136.1967696-4-olani@axis.com>
 <CANNYZj_NFOejE6Xe2xHTTWkuMVY2TmPGpXTZYT=3+5V1Y2u3Xg@mail.gmail.com>
 <jwqwn70c168.fsf@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <jwqwn70c168.fsf@axis.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Dec 2022 13:07:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174449

On 09/12/2022 11:36:03+0100, Ola x Nilsson wrote:
> 
> On Thu, Dec 08 2022, Alexander Kanavin wrote:
> 
> > On Thu, 8 Dec 2022 at 08:11, Ola x Nilsson <olani@axis.com> wrote:
> >> +GLIBC_64BIT_TIME_FLAGS:pn-glibc = ""
> >> +GLIBC_64BIT_TIME_FLAGS:pn-glibc-tests = ""
> >> +# pipewire-v4l2 explicitly sets _FILE_OFFSET_BITS=32 to get access to
> >> +# both 32 and 64 bit file APIs.  But it does not handle the time side?
> >> +# Needs further investigation
> >> +GLIBC_64BIT_TIME_FLAGS:pn-pipewire = ""
> >> +GLIBC_64BIT_TIME_FLAGS:pn-gcc-sanitizers = ""
> >> +
> >> +INSANE_SKIP:libstd-rs[_usr_lib_rustlib_armv7-poky-linux-gnueabihf_lib_libstd.so]
> >> = "clock_gettime gettime fcntl fstat64 fstatat64 getsockopt ioctl
> >> lstat64 nanosleep prctl recvmsg sendmsg setsockopt stat64"
> >> +INSANE_SKIP:librsvg[_usr_bin_rsvg-convert] = "fcntl fstat64 prctl stat64 clock_gettime"
> >> +INSANE_SKIP:librsvg[_usr_lib_librsvg-2.so.2.48.0] = "fcntl lstat64
> >> setsockopt sendmsg fstat64 getsockopt ioctl nanosleep timegm
> >> fstatat64 prctl mktime gmtime_r recvmsg stat64 clock_gettime
> >> localtime_r"
> >> +
> >> +# libpulsedsp.so is a preload-library that hooks libc functions
> >> +INSANE_SKIP:pulseaudio[_usr_lib_pulseaudio_libpulsedsp.so] = "setsockopt fcntl"
> >
> > Some of these perhaps need a ticket in bugzilla, and there should be a
> > meta-ticket for Y2038 that tracks individual issues (by depending on
> > them). Can you arrange that please?
> 
> I can file tickets if that's the way we want to go.  I'm not really at
> that point yet, these are just for the packages that were included in
> our products.  I've just done one plain poky build to make sure this
> stuff worked so far.

I know there is pulseaudio that will fail too. I'll do a build including
time64.conf over the week end and I can file bugs where necessary.

>

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

