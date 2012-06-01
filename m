Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SaNDJ-00031V-Uj for openembedded-core@lists.openembedded.org;
	Fri, 01 Jun 2012 10:28:06 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q518HgLW010098;
	Fri, 1 Jun 2012 09:17:42 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 09264-04; Fri,  1 Jun 2012 09:17:37 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q518HVTB010092
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 1 Jun 2012 09:17:33 +0100
Message-ID: <1338538650.20169.261.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 01 Jun 2012 09:17:30 +0100
In-Reply-To: <D16CA58F-8D7A-4910-ACCA-84E01CEE6510@dominion.thruhere.net>
References: <cover.1338434706.git.liezhi.yang@windriver.com>
	<87ca0cf2285b018489bde046b0aa7e17a767c70a.1338434706.git.liezhi.yang@windriver.com>
	<D16CA58F-8D7A-4910-ACCA-84E01CEE6510@dominion.thruhere.net>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH 1/1] opkg 0.1.8: respect to the arch when choose the alternatives
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
X-List-Received-Date: Fri, 01 Jun 2012 08:28:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-05-31 at 17:01 +0200, Koen Kooi wrote:
> Op 31 mei 2012, om 16:13 heeft Robert Yang het volgende geschreven:
> 
> > There is a bug if we:
> > 1) bitbake core-image-sato-sdk MACHINE=qemux86
> > 2) bitbake core-image-sato with MACHINE=crownbay
> > 
> > Then several pkgs in deploy/ipk/i586 would be installed to crownbay's
> > image even if there is one in deploy/ipk/core2 and we have set the
> > core2's priority higher than i586, when the version in deploy/ipk/i586 is
> > higher. This doesn't work for us, for example, what the crownbay need is
> > xserver-xorg-1.9.3, but it installs xserver-xorg-1.11.2.
> 
> And this is working exactly as intended. Don't break opkg because your
> hardware driver situation sucks.
> 
> So: NAK on this patch.

I think we do have a problem here. For example, the system is ignoring a
PREFERRED_VERSION directive here by building one thing and then
installing another. We're also inconsistent between the dpkg/rpm and
opkg backends. There is therefore definitely some kind of user
experience issue at stake here since this behaviour is not obvious,
expected or particularly correct.

The fact the example is hardware related is not particularly relevant,
its the bigger picture I worry about. I know that hardware issue sucks
and many people on this list have experienced pain due to it, we'd all
like it to go away. Using this as a reason not to examine and
potentially fix some problematic package manager behaviour is not right
IMO though. The world isn't perfect, sucky hardware/software exists, we
need to work with it.

So to be honest I'm leaning towards taking the patch. I would be
interested in other people's opinions though...

Cheers,

Richard




