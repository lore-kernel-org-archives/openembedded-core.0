Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TbsAW-0000MP-6K for openembedded-core@lists.openembedded.org;
	Fri, 23 Nov 2012 13:15:40 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qANC1UiW001685;
	Fri, 23 Nov 2012 12:01:30 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 31141-01; Fri, 23 Nov 2012 12:01:25 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qANC1GMc001678
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Fri, 23 Nov 2012 12:01:19 GMT
Message-ID: <1353672077.1361.4.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Phil Blundell <philb@gnu.org>
Date: Fri, 23 Nov 2012 12:01:17 +0000
In-Reply-To: <1353665804.13864.713.camel@phil-desktop>
References: <1353620179.10459.59.camel@ted>
	<1353621014.2000.16.camel@x121e.pbcl.net>
	<1353621779.10459.67.camel@ted>
	<1353665804.13864.713.camel@phil-desktop>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-cross: Explicitly depend on linux-libc-headers
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Nov 2012 12:15:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-11-23 at 10:16 +0000, Phil Blundell wrote:
> On Thu, 2012-11-22 at 22:02 +0000, Richard Purdie wrote:
> > On Thu, 2012-11-22 at 21:50 +0000, Phil Blundell wrote:
> > > On Thu, 2012-11-22 at 21:36 +0000, Richard Purdie wrote:
> > > > -DEPENDS = "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}libc-for-gcc ${NATIVEDEPS}"
> > > > +DEPENDS = "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}libc-for-gcc linux-libc-headers ${NATIVEDEPS}"
> > > 
> > > gcc-cross isn't particularly specific to linux targets and ideally we
> > > don't want to be adding more linuxisms to the recipe.  It is,
> > > admittedly, not entirely obvious how we could conveniently get that
> > > dependency added only for linux targets (since I don't think there's any
> > > existing OVERRIDE that's helpful here) but perhaps we should find a way
> > > to address that problem rather than just sticking it in unconditionally.
> > 
> > virtual/${TARGET_OS}-headers with a suitable provider entry?
> 
> I think a better approach would be to use a python fragment which
> appends linux-libc-headers if ${TARGET_OS} starts with "linux".  Your
> suggestion would work as well but it seems a bit ugly, and would still
> be slightly annoying for targets where no such headers are required.
>
> > I was assuming someone who cares about non-linux wouldn't find this
> > particularly hard to deal with...
> 
> Well, indeed, but equally it doesn't seem especially polite to introduce
> gratuitous target-specific bits into core recipes on the assumption that
> someone else will run around after you cleaning them up.  If I was to
> start sending patches for gcc which worked for my employer's favourite
> target but broke everything else then you would presumably reject them,
> and rightly so.

I'm not sure "gratuitous" is entirely fair, the metadata as it stands
today is fairly linux centric. I will however change this to use
anonymous python despite the performance and readability downsides since
I appear to have hit some nerve.

Cheers,

Richard



