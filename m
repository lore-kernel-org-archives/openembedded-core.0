Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qe5RP-0005Kk-L5 for openembedded-core@lists.openembedded.org;
	Tue, 05 Jul 2011 15:13:27 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p65D9bwF031424;
	Tue, 5 Jul 2011 14:09:37 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 31042-07; Tue,  5 Jul 2011 14:09:33 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p65D9Vx8031418
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 5 Jul 2011 14:09:31 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <201107051454.04409.anders@chargestorm.se>
References: <cover.1309867242.git.anders@chargestorm.se>
	<406427a001cfa7c1859f54147b678f0ef647a922.1309867242.git.anders@chargestorm.se>
	<1309869846.2410.3.camel@phil-desktop>
	<201107051454.04409.anders@chargestorm.se>
Date: Tue, 05 Jul 2011 14:09:00 +0100
Message-ID: <1309871340.20015.700.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: "Hart, Darren" <darren.hart@intel.com>
Subject: Re: [PATCH 1/1] kernel.bbclass: make external module compile
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Jul 2011 13:13:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-07-05 at 14:54 +0200, Anders Darander wrote:
> * Phil Blundell Phil Blundell <pb@pbcl.net> [07/05/11 02:44 PM]:
> > On Tue, 2011-07-05 at 14:01 +0200, Anders Darander wrote:
> > > diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> > > index 943252a..26ee416 100644
> > > --- a/meta/classes/kernel.bbclass
> > > +++ b/meta/classes/kernel.bbclass
> > > @@ -149,7 +149,6 @@ kernel_do_install() {
> > 
> >         #
> >         # We don't want to leave host-arch binaries in /sysroots, so
> >         # we clean the scripts dir while leaving the generated config
> > 
> > >  	# and include files.
> > >  	#
> > >  	oe_runmake -C $kerneldir CC="${KERNEL_CC}" LD="${KERNEL_LD}" clean
> > > 
> > > -	make -C $kerneldir _mrproper_scripts
> > > 
> > >  	find $kerneldir -path $kerneldir/scripts -prune -o -name "*.[csS]"
> > >  	-exec rm '{}' \; find $kerneldir/Documentation -name "*.txt" -exec rm
> > >  	'{}' \;
> > 
> > Did you verify that this doesn't introduce any new QA warnings during
> > packaging?  Presumably that line was originally added for a reason and
> > it seems a bit surprising that just deleting it without any replacement
> > is the right thing to do.
> 
> No, I didn't really verify that. Do I need to run with any specific options 
> enabled, or should it be enough to just bitbake my modules recipe? (I can't 
> test for the moment, as the latest pull from oe-core forces a rebuild of gcc 
> etc).
>  
> > Also, if the scripts dir isn't being cleaned anymore, I guess the
> > preceding comment should be adjusted to match the new reality.
> 
> That's true.
> 
> I'll wait to see if someone else has any comments, or if I find some QA 
> warnings before I produce a version 2.

I'm cc'ing Darren as this is one of his favourite subjects :/.

Summary is that this works well in some kernel versions and not in
others. We might have to start doing this conditionally based upon
kernel version I guess...

Cheers,

Richard



