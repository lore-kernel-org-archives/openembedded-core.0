Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web12.282.1589403916212097869
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2020 14:05:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=AD4/Ttdp;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=ce53=63=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49MnHr1W43z4c;
	Wed, 13 May 2020 23:05:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1589403912;
	bh=nughyohtVG5WtEmbX1xGWBtrZivX1iNXLh4ysgAOT78=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AD4/TtdpWPwwkVJ9it0a7eAUW4ZZ3KQoDPAZvaB3eKB/ktEsK00aroSq0w8k7kcD+
	 xuzfwGjz/T/AgtH99gBF34mtLHbnH8pFRsVxGiGTjF8gpj3D17kl6J2Ms2DZ/IAVMA
	 oEFbt7NaKPpvaWNRefzdYeVWXoK8R3tWtE9eqfNMkCoAdyQrDB74bqb9dqVbGbvbCq
	 oTo1cwqHgUzAR7Oj/0fw50auR0vKicI0xUjH3FOS6zqRmCu0RUdZlAhW/03haiJSy1
	 XziwXovx5++sjiy8XQJU2Plk8904rzt718dO2yyro8lCSt4rXvMHD5PiBlhx0HZW7O
	 wQtrVJfySsPgv6b5C+8J8i5BPnikW29wlhVyv1Y4fNRAmjlzdS4gHDZ+TU81BkGJNq
	 nkelvpL/g0ww2QPMYkpaq1Uqo1tEHf5ki6/rRA4ISlHKAMvVzARcz2yHmOFiWc9ZvI
	 zpEQW4z45cve9DDj4KhfsE2TknhgYJucFnPI+gGKssiUoWJkstTxYI4/2uKgwXI8Gr
	 bjFzqXhyPhiInTnhzuMRHja7r+/aCdlY/ca57tlYebk4EvrvuDZgzXqETF03M5461m
	 JFVrepwNq6gsR0gqWIgs36nEUgtyHowysW6RyFtQ1pjWdR6PzsGVofYar4qbgsYtJQ
	 fKHH1yzR1RPVOu5g6D7Y7XLc=
Date: Thu, 14 May 2020 00:05:09 +0300
From: "Adrian Bunk" <bunk@stusta.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH] apt: Remove workarounds for host gcc < 5
Message-ID: <20200513210509.GA30394@localhost>
References: <20200512203748.8779-2-bunk@stusta.de>
 <04996e180d1529bd6600396f20a38f53db2f6ffe.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <04996e180d1529bd6600396f20a38f53db2f6ffe.camel@linuxfoundation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, May 13, 2020 at 05:30:13PM +0100, Richard Purdie wrote:
> On Tue, 2020-05-12 at 23:37 +0300, Adrian Bunk wrote:
> > Signed-off-by: Adrian Bunk <bunk@stusta.de>
> > ---
> >  .../recipes-devtools/apt/apt-native_1.2.31.bb |  4 +-
> >  ...nging-the-global-LC_TIME-for-Release.patch | 80 -------------------
> >  ...caled-std-put_time-instead-rolling-o.patch | 46 -----------
> >  ...ntrib-strutl.cc-Include-array-header.patch | 33 --------
> >  4 files changed, 1 insertion(+), 162 deletions(-)
> >  delete mode 100644 meta/recipes-devtools/apt/apt/gcc_4.x_Revert-avoid-changing-the-global-LC_TIME-for-Release.patch
> >  delete mode 100644 meta/recipes-devtools/apt/apt/gcc_4.x_Revert-use-de-localed-std-put_time-instead-rolling-o.patch
> >  delete mode 100644 meta/recipes-devtools/apt/apt/gcc_4.x_apt-pkg-contrib-strutl.cc-Include-array-header.patch
> > 
> > diff --git a/meta/recipes-devtools/apt/apt-native_1.2.31.bb b/meta/recipes-devtools/apt/apt-native_1.2.31.bb
> > index 5b16b503d5..2952c21017 100644
> > --- a/meta/recipes-devtools/apt/apt-native_1.2.31.bb
> > +++ b/meta/recipes-devtools/apt/apt-native_1.2.31.bb
> > @@ -2,6 +2,4 @@ require apt-native.inc
> >  
> >  SRC_URI += "file://noconfigure.patch \
> >              file://no-curl.patch \
> > -            file://gcc_4.x_apt-pkg-contrib-strutl.cc-Include-array-header.patch \
> > -            file://gcc_4.x_Revert-avoid-changing-the-global-LC_TIME-for-Release.patch \
> > -            file://gcc_4.x_Revert-use-de-localed-std-put_time-instead-rolling-o.patch"
> > +"
> 
> I think part of this is causing:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/50/builds/1892
> 
> ?
>...

I cannot reproduce it, but I can see what is likely causing it.
Patch will come in a few minutes.

> Cheers,
> 
> Richard

cu
Adrian
