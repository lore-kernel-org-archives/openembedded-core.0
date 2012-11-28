Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TdaWq-0006WC-1r for openembedded-core@lists.openembedded.org;
	Wed, 28 Nov 2012 06:49:54 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qAS5ZXIr010453;
	Wed, 28 Nov 2012 05:35:33 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 09001-05; Wed, 28 Nov 2012 05:35:27 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qAS5ZLsW010447
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Wed, 28 Nov 2012 05:35:22 GMT
Message-ID: <1354080920.21863.119.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 28 Nov 2012 05:35:20 +0000
In-Reply-To: <20121127202356.GJ3692@jama.jama.net>
References: <20121127154129.GC3692@jama.jama.net>
	<1354047102.21863.105.camel@ted> <20121127202356.GJ3692@jama.jama.net>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: RDEPENDS of packages created by PACKAGES_DYNAMIC not built before image rootfs
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
X-List-Received-Date: Wed, 28 Nov 2012 05:49:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-11-27 at 21:23 +0100, Martin Jansa wrote:
> On Tue, Nov 27, 2012 at 08:11:42PM +0000, Richard Purdie wrote:
> > On Tue, 2012-11-27 at 16:41 +0100, Martin Jansa wrote:
> > So basically, you need to decide whether you want consolekit enabled or
> > not and build accordingly, there is nothing you can do within bitbake to
> > "mind read" what the image is going to want...
> 
> No, you know that you will need pulseaudio-module-console-kit because
> pulseaudio-server RDEPENDs on it (not on any pulseaudio-module-* but
> pulseaudio-module-console-kit exactly). So it's not really mind reading.

Bitbake sees "pulseaudio-module-console-kit" and is has to ask "Which
recipe provides this". To answer that question, it looks first at
PACKAGES and then at PACKAGES_DYNAMIC. In this case it will find a match
for PACKAGES_DYNAMIC but bitbake considers this a fuzzy match.

We only match dynamic packages right at the end of processing and they
are "fuzzy". Basically, they are just a sanity check in bitbake to
ensure there is some chance of the thing getting built.

I can see in this case that a dependency exists that BitBake could use
to enhance its knowledge, the trouble is that is would have to first
decide which provider is providing PACKAGES_DYNAMIC, and then search
that package for extra RDEPENDS. In this case its "easier" since its all
the same package but with our generic providers mechanism, this could
just as easily be split between two recipes which makes the problem at
lot more complex and the code has to be written for the general case.

> If it's not possible with current code-base then we should document it
> and add some work around in pulseaudio (I'm fine with building
> consolekit even when it's not used later).

I suspect we'll just have to add this. I agree it would be possible to
try and figure out this corner case but whether its worth the complexity
and extra parse time I'm not sure. The risk of adding further bugs
trying to add this functionality would worry me, as would the extra
complexity and the time taken to do it...

As such I'd probably mark the bug report "LATER" and suggest working
around this. If we were hitting this on many recipes, fine but we're not
as far as I know.

Cheers,

Richard



