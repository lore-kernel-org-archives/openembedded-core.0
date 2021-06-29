Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web09.4774.1624949551498739020
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Jun 2021 23:52:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by relay10.mail.gandi.net (Postfix) with ESMTPSA id 795E224000D;
	Tue, 29 Jun 2021 06:52:28 +0000 (UTC)
Date: Tue, 29 Jun 2021 08:52:28 +0200
From: "Alexandre Belloni" <alexandre.belloni@bootlin.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Ross Burton <ross@burtonini.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] util-linux: use the system binaries when running ptest
Message-ID: <YNrDLD4XfP2lPEe/@piout.net>
References: <20210628130119.926307-1-ross.burton@arm.com>
 <9e0cd3d79c36f2b061cf2d751c8b544efffc23b2.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <9e0cd3d79c36f2b061cf2d751c8b544efffc23b2.camel@linuxfoundation.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On 28/06/2021 23:51:13+0100, Richard Purdie wrote:
> On Mon, 2021-06-28 at 14:01 +0100, Ross Burton wrote:
> > Unless told otherwise, the util-linux test suite assumes that it is
> > running in a build tree and looks for binaries to run.
> > 
> > In ptest we're on the target, so it needs to run the system binaries
> > instead.
> > 
> > This reduces ~180 skipped test cases down to tens, and should fix weird
> > behaviour. There are some new failures that were previously skipped
> > which will be investigated shortly.
> > 
> > Also pass --parsable to reduce the amount of noise in the log ouput.
> > 
> > [ YOCTO #14244 ]
> > 
> > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > ---
> >  meta/recipes-core/util-linux/util-linux/run-ptest | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/meta/recipes-core/util-linux/util-linux/run-ptest b/meta/recipes-core/util-linux/util-linux/run-ptest
> > index e135ee583bd..86f9fef24bd 100644
> > --- a/meta/recipes-core/util-linux/util-linux/run-ptest
> > +++ b/meta/recipes-core/util-linux/util-linux/run-ptest
> > @@ -29,7 +29,7 @@ res=0
> >  count=0
> >  for ts in $comps; 
> >  do 
> > -   $ts | sed -u '{        
> > +   $ts --use-system-commands --parsable | sed -u '{
> >        s/^\(.*\):\(.*\) \.\.\. OK$/PASS: \1:\2/                              
> >        s/^\(.*\):\(.*\) \.\.\. FAILED \(.*\)$/FAIL: \1:\2 \3/                
> >        s/^\(.*\):\(.*\) \.\.\. SKIPPED \(.*\)$/SKIP: \1:\2 \3/               
> 
> This is a good fix, thanks. Makes me worry about regression identification.
> FWIW testing showed this on x86 (arm still going):
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/2227
> 

Indeed, this one has the same issue:
https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/2228/steps/12/logs/stdio

> Looks like a build from Alex did have results for arm:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/1942/steps/12/logs/stdio
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
