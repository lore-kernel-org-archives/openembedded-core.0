Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web12.19775.1591968210298563819
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jun 2020 06:23:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=ZvdEvrfP;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=uego=7z=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49k1d92L3Rz4N;
	Fri, 12 Jun 2020 15:23:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1591968207;
	bh=a+DODLafHo/g8sL7Fu00dI5RHSNd/T+SyIIdZjEsuiI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZvdEvrfP62KWy5ceF7tWkkuG9LU3v5ue1YUbVtPRvZA8aM+Dp2xXBAbRkV5QAmFMW
	 GDwC9YzAtdJnEKylMixXt2SJFkClC19kCU1cZ5JtykG/TKFg8QwvSglSpJ/oIzrqS7
	 oC/mB/NF2uE5mqgkNsat1Tj1acp55pj8u22BJa6Wr5Wu0keWDErJJFaOxcCQpN1LxQ
	 nqRJV4f96U6EFJwXDwzJxfNY2pHRuUE4cqiOdVLNNYW1iStcG9M2mzhiABlczBmWWE
	 NdvsaNn01dqo+hzrGsktfTH/QxddrDfY1j5BaNBiuQqlWw5KFFg6OgSTMx/XyLHaZp
	 waOZaTinWuE+6MfmP9pzFi1dNIA4KB/34kWSqe7uVOJh9s/WQxU7kI/ZXf725TnW72
	 cy70r6ZcjJU7kT6T2r6Xlkt/yVAsly94J9uVIyQLhO/ppooSXAdmm4ej7Pu5qjXMCb
	 tqKFqHlZQEkZgB37IxAxzzzjac4U60p3cGGaiRHF/emxDMlsGBCJ7+/Soe6wNSxqSB
	 +56lO90yrisKOIuz9MP4QCfQl8brhlFv1y/a4xJoRsVViGC0fpFWxnIvebZ17oljiY
	 PfQ+rRvg8M2Jz76zZjLIq5pHOT5d/FCY3hd0oEcgpXSLgNFy1S+mLrTpUlQgfqFPxv
	 bIdIZ/08Ht+ZmbXrUaVI6xSQ=
Date: Fri, 12 Jun 2020 16:23:23 +0300
From: "Adrian Bunk" <bunk@stusta.de>
To: Ross Burton <ross@burtonini.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] Bootstrapping Go
Message-ID: <20200612132323.GB8039@localhost>
References: <CAAnfSTtEgmjLHG68f+USz3gsxyda=VDdrt6a738jqGQJFbpE9w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAnfSTtEgmjLHG68f+USz3gsxyda=VDdrt6a738jqGQJFbpE9w@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Jun 12, 2020 at 01:41:41PM +0100, Ross Burton wrote:
>...
> With preferred provider set this can be used to build our own Go
> toolchain.  Yes, we're relying on a prebuilt binary but we're still
> building the tools we actually use, so I don't see this as massively
> different to using a host compiler.  Does anyone have a strong
> objection to bootstrapping our own Go by downloading the prebuilt
> tools?

What about using the host Go (or gccgo)?

Go 1.4 was released in 2014.
gcc 5 provides an implementation of Go 1.4.2.

Any host with gcc < 6 (released in 2016) is already required to use
buildtools-extended in master, so adding Go (or gccgo) there should 
be sufficient to support ancient host distributions.

>...
> But looking forward, at this point we're downloading a perfectly good
> Go toolchain to build a Go toolchain.  This observation has already
> led to meta-go-binary (https://github.com/YoeDistro/meta-go-binary), a
> drop-in alternative for the Go recipes that simply use the pre-built
> releases.

It is perfectly good until the next CVE.

> Also modern GCC can also build a Go frontend, so we could
> just enable that in gcc-cross as we're always building a cross
> compiler anyway.
>...

gccgo tends to be worse regarding features and performance.

No objections to allowing users to additionally enable it
(similar to Fortran), but it is not a full replacement.

> Cheers,
> Ross

cu
Adrian
