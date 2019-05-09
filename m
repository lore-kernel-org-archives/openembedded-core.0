Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 8A2567DFA2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 May 2019 07:50:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45059V64nwz2s;
	Thu,  9 May 2019 09:50:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1557388223;
	bh=KOXgH33LpeEEFpSq2GdFTVI59dE/ifT+u+2iv9Rk4o8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kG2SamOjJeRRyIC/HfZ2hsjDHPry7238gnVztuD+we1POAaUYIqfDd3DcU6VoCZ6J
	mnADJaVc8XtdNBI3AV6UtDpEuy+dAj3TGpH8AXBtsOnHEbX0Lq367juepJ6UXcXVOc
	WEeT5iIRFuhdYH2N+QBCpoyyfjhedKiLUO9aBPm7VSCAznlD4ldNAw2C2fXyXugcrs
	vSEnj5h3XcrzUOtedbBvtoLjz4XvJw1qR+KqqIz5ZSgRoR5bab2mTIOqsk1glG75Gk
	viGIWXVUuNSAd6joX1m1cKG0NTcvt88Nz/BRHGS7pMHiMtHCt8Kbb6V3kM0Raok4mi
	pRqvIExZu10m6zqPRXHl+g6t7vV3KV2MSUm8nQPA3mgr1hbEQjOJInJr5P3n4IPt08
	7ueNNKMf21Fe/HF/J2WlaeEq93/cNCxmy8wMWEqTCB7XUOKKxL0aJowC3zfMehwmi4
	iW+Tr+GlpcQRbh+lRrB7eH8lpiiyHbLBWOJjFHEhpW/79L2VTFhCgwwaT3HT9sJ62v
	Dl0HfTecwZRaBJkF8i5GgzO3SZ9SsG1voA9d8ut/IJe8OS2LJdaG+seN3N6g4t4Vjq
	Lq2tzqO3IIRRsgFWkzgwS/xktvJjcm03jqumfu7C8joUsUi2vx5Xjlz1wfEFiSumFR
	aJvEQgGNw1GN/x/Bnc1e3BeY=
Date: Thu, 9 May 2019 10:50:19 +0300
From: Adrian Bunk <bunk@stusta.de>
To: "Mittal, Anuj" <anuj.mittal@intel.com>
Message-ID: <20190509075019.GA27775@localhost>
References: <20190508200134.28907-2-bunk@stusta.de>
	<1ab1997fb1983851d5173408f1e16c60f9a53d05.camel@intel.com>
MIME-Version: 1.0
In-Reply-To: <1ab1997fb1983851d5173408f1e16c60f9a53d05.camel@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] ofono: upgrade 1.25 -> 1.29
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
X-List-Received-Date: Thu, 09 May 2019 07:50:23 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, May 09, 2019 at 06:48:38AM +0000, Mittal, Anuj wrote:
> This is failing with error:
> 
> | In file included from ../ofono-1.29/ell/random.c:34:
> | ../ofono-1.29/ell/missing.h:59:20: error: static declaration of
> 'explicit_bzero' follows non-static declaration
> |  static inline void explicit_bzero(void *s, size_t n)
> |                     ^~~~~~~~~~~~~~
> | In file included from ../ofono-1.29/ell/util.h:26,
> |                  from ../ofono-1.29/ell/private.h:26,
> |                  from ../ofono-1.29/ell/random.c:33:
> | /home/pokybuild/yocto-worker/musl-qemux86-
> 64/build/build/tmp/work/core2-64-poky-linux-musl/ofono/1.29-r0/recipe-
> sysroot/usr/include/string.h:85:6: note: previous declaration of
> 'explicit_bzero' was here
> |  void explicit_bzero (void *, size_t);
> |       ^~~~~~~~~~~~~~
> | make[1]: *** [ell/random.lo] Error 1
> | make[1]: *** Waiting for unfinished jobs....
> 
> Logs here:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/578/steps/7/logs/step1b

Thanks, got a fix for that one now.

The next problem is that musl does not currently provide 
TEMP_FAILURE_RETRY, and the correct fix for that will be
that I'll try to get this fixed in musl instead of creating
yet another copy of the glibc macro.

I'll come back to ofono after that.

> Thanks,
> 
> Anuj

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


