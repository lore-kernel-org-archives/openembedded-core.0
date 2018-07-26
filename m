Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id AEA0060234
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 14:17:57 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id y9-v6so2203466wma.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 07:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=jFykRIDrLFxTDHJCRlOCAMeG1KVp/Eo+d89LD/bVFd8=;
	b=a/vpCfjBjy/m0EOpW63Q1eYUaaBuhFvlUuCLrkVy9eFHZmWJJZJXAX+0j8t9tZ/MST
	S+Q5eqIYdnJvX/g4lfQJPLbEshl12JRM6TaH+6fdN2GGr8CAillNrrHqccsKqPUq/nwX
	Vr/GRtu333pRB9NjywpRlMBz9X6CmxGgwtl7I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=jFykRIDrLFxTDHJCRlOCAMeG1KVp/Eo+d89LD/bVFd8=;
	b=LzNdA+Q4jE6rGxcrikXjRrnqMZlFOXpv1mmpWsqHaBvDn9mLihN4e5bvWcDfGM2uH7
	ExkQ9M2NNDNGwQRikWt6lcoAQiFKZ+unZOMg1KOZdZ+S4kVVHPClpQ+GgqwHDDPYFKun
	OuVyY/helrKYrSHNgTRKywto8aV+2BCaS5BJBpuPpBWrs+jYTO7E1Y2SZ6rNpdngZ+MH
	aM3wPvimIll8Vz0jAcNl2dF46WZbY+ES9/d2VwWlHCV2aaaxxdFhXEKYf+uXsUfOM0c3
	O+Ad0lQ4q/IslJ+qaxfHYsPo2+FeIdqLMDsAHl1Ct1nutvj/ygbmso5MaI8mJ1R7eRMG
	5UMQ==
X-Gm-Message-State: AOUpUlHkumiad33jcWytfo9BzP4Gmu2tuNLnhpZjKx1+4qmLAKPKOsUT
	HnbIxqLwWxBk3in47uo60CcmsA==
X-Google-Smtp-Source: AAOMgpfhn+TFsakii7cjTSCHtZgNnU548uz7nb8szm5qFIoaviGqkdWqeZjzKAxbl6bJaj4TubAkKQ==
X-Received: by 2002:a1c:6d1c:: with SMTP id
	i28-v6mr1799954wmc.97.1532614678394; 
	Thu, 26 Jul 2018 07:17:58 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	r8-v6sm1102215wmh.37.2018.07.26.07.17.57
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 26 Jul 2018 07:17:57 -0700 (PDT)
Message-ID: <4bdbc774f6b6fe04fc4301980729c890a0502c8d.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Thu, 26 Jul 2018 15:17:56 +0100
In-Reply-To: <1cc72609-d849-f8a3-6524-1f7d9ad214c3@windriver.com>
References: <1531151586-30557-1-git-send-email-bruce.ashfield@windriver.com>
	<8e3f9ec13333061ecb0125e153df668abe8da1b9.camel@linuxfoundation.org>
	<1cc72609-d849-f8a3-6524-1f7d9ad214c3@windriver.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] kernel-devsrc: restructure for out of tree (and on target) module builds
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
X-List-Received-Date: Thu, 26 Jul 2018 14:17:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-07-26 at 10:04 -0400, Bruce Ashfield wrote:
> On 2018-07-10 6:21 AM, Richard Purdie wrote:
> > and also a failure in one of the multilib builds, probably from
> > different dependencies pulled in by kernel-devsrc:
> > 
> > https://autobuilder.yocto.io/builders/nightly-multilib/builds/1139/
> > steps/BuildImages_4/logs/stdio
> > 
> > Error: Transaction check error:
> >    file /usr/bin/libtool from install of libtool-2.4.6-r0.0.i586
> > conflicts with file from package lib64-libtool-2.4.6-r0.0.x86_64
> >    file /usr/bin/libtoolize from install of libtool-2.4.6-r0.0.i586 
> > conflicts with file from package lib64-libtool-2.4.6-r0.0.x86_64
> > 
> 
> And that leaves this error.
> 
> I've not been able to reproduce it, and I've been looking at the
> elfutils RDEPENDS that is part of kernel devsrc, since that is what
> pulls in libtool as a DEPENDS.
> 
> I'm not seeing any difference in the way that it is pulled in, versus
> the other uses.
> 
> In particular, perf also has elfutils as a REDEPENDS, but yet it
> builds
> in the same configuration. Can you spot the difference in how it is
> used ?
> 
> elfutils is potentially required at tools build time, hence why it is
> a RDEPENDS in devsrc, but a DEPENDS in the main linux-yocto recipes.
> If there's another way to express this, let me know and I can switch
> to that.
> 
> And finally, I did build the old reproducing configuration for
> multlib that you mentioned before .. can you point me at this config,
> so I can try again ?

This is a timely reminder that I've been meaning to look at this. I
think the config is:
t
MACHINE=qemux86
require conf/multilib.conf 
MULTILIBS = "multilib:lib64" 
DEFAULTTUNE_virtclass-multilib-lib64 = "x86-64" 

then bitbake lib64-core-image-sato-sdk

which seems like an odd mix of 64bit with a 32 bit kernel but is
nonetheless what it appears to be building. I suspect it will fail the
same way with the x86-64 machine too though.

I have a build running now to check if I can replicate and perhaps dig
into it further.

Cheers,

Richard


