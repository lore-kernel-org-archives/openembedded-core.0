Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web12.5264.1585254419715459353
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2020 13:27:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=jxHINTs5;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=rbqv=5l=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48pGjm4gf5z3Q;
	Thu, 26 Mar 2020 21:26:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1585254414;
	bh=AmQXCv4ncmGO1xH7s8+1QO+cJAiAS9ArhE1bReZdZpM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jxHINTs5WhfVYDJfOudwmXTCPPat38XsFH6XfuzP0p7aXo2dhN9Efr/b6bKhAMCX8
	 U21WWpKEViVGDa7vYZ15gEarhW91tsucuSuVlcrBtElDPtxcjoe1+NRqE04uE5Uiu6
	 /h0FhB0wtyMswBaJm0qEj7x0N40j+B6FnDO24X4Om1BZIC3zbxpGQos6Ty6gJH65ou
	 dTyRfuFRjbNTDvSNL4wgu7vPo6C+/kOQqhz4TEXDt2yIT18RD5HNtxuauf6rKML86w
	 TrZEgBsE4rrVpsf11lZXlgwzg7FrgS01mNhs1Zhy/jTMrOqkT4MRv9L08+YV8Lvdsz
	 2tuv826aTQP+zz/6vHOkvTTP9g5PjqlpvXQQXBqwkZE/hNlb/P3rmHmUIvS7RHAUrC
	 c8syMR7nRMdH/05K4QDtRAlkiVPbaFdnvT0X/l9T4xPOfQxDMTwm0pafTS+HcYdiEg
	 HcQGQpMZ1kKMlyLbwLgm7Wh1LdPS+5XyOpcYEFVAietkQgx+9fU7kueLXndsDPOner
	 SIBPGce4n4489p0KMKECas0YW5ZuIGMMhLjFlFBeXQTwZasGSFa7azpL8o6pmgf4p7
	 eQjoKLhiIAItnpH2PDdOJtOPN5xjqHM2o940pPYwqHBTFusD0nApuSlbzcnKax+pdB
	 UMpVQN5k16Q4FubV4fqvKF+M=
Date: Thu, 26 Mar 2020 22:26:50 +0200
From: "Adrian Bunk" <bunk@stusta.de>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Stefan Ghinea <stefan.ghinea@windriver.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] pulseaudio: fix for ARM thumb + frame pointers compilation error
Message-ID: <20200326202650.GA14127@localhost>
References: <20200326152629.29272-1-stefan.ghinea@windriver.com>
 <20200326191628.GC5401@localhost>
 <CAJ86T=WJ4+8Ly59gxj6maeLQC5NAcZiM-G+uKqhTTi3u9C_FtQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ86T=WJ4+8Ly59gxj6maeLQC5NAcZiM-G+uKqhTTi3u9C_FtQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Mar 26, 2020 at 12:53:08PM -0700, Andre McCurdy wrote:
> On Thu, Mar 26, 2020 at 12:16 PM Adrian Bunk <bunk@stusta.de> wrote:
> >
> > On Thu, Mar 26, 2020 at 05:26:29PM +0200, Stefan Ghinea wrote:
> > >...
> > > When compiling for Thumb or Thumb2, frame pointers _must_ be disabled
> > > since the Thumb frame pointer in r7
> > >...
> >
> > How are you reproducing the problem in pulseaudio?
> >
> > This sounds like a workaround for a bug in musl that was fixed 2 years ago.
> 
> The problem can show up anywhere that inline asm is trying to use r7.
> In this case it looks like:
> 
>   https://github.com/pulseaudio/pulseaudio/blob/master/src/pulsecore/remap_neon.c#L50
>...

After looking at the pulseaudio code I suspected the patch description 
claiming pulseaudio syscall code would be the problem was rubbish, and 
that this NEON code was the problem.

But when I tried to reproduce the problem it built for me with both 
glibc and musl in master (the patch didn't mention that this was a
musl-only problem).

Then I saw that this was fixed in musl upstream 2 years ago:
https://git.musl-libc.org/cgit/musl/commit/?id=e3c682ab5257aaa6739ef242a9676d897370e78e

cu
Adrian
