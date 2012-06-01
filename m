Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SaOqz-0005cj-KM for openembedded-core@lists.openembedded.org;
	Fri, 01 Jun 2012 12:13:09 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q51A2nK8010909
	for <openembedded-core@lists.openembedded.org>;
	Fri, 1 Jun 2012 11:02:49 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 09264-08 for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jun 2012 11:02:45 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q51A2fS2010902
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 1 Jun 2012 11:02:43 +0100
Message-ID: <1338544960.20169.267.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 01 Jun 2012 11:02:40 +0100
In-Reply-To: <D2B2A161-3B9C-49F3-B124-DE6CC9B1FFE0@dominion.thruhere.net>
References: <cover.1338434706.git.liezhi.yang@windriver.com>
	<87ca0cf2285b018489bde046b0aa7e17a767c70a.1338434706.git.liezhi.yang@windriver.com>
	<D16CA58F-8D7A-4910-ACCA-84E01CEE6510@dominion.thruhere.net>
	<1338538650.20169.261.camel@ted>
	<D2B2A161-3B9C-49F3-B124-DE6CC9B1FFE0@dominion.thruhere.net>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
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
X-List-Received-Date: Fri, 01 Jun 2012 10:13:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-06-01 at 11:04 +0200, Koen Kooi wrote:
> Op 1 jun. 2012, om 10:17 heeft Richard Purdie het volgende geschreven:
> 
> > On Thu, 2012-05-31 at 17:01 +0200, Koen Kooi wrote:
> >> Op 31 mei 2012, om 16:13 heeft Robert Yang het volgende geschreven:
> >> 
> >>> There is a bug if we:
> >>> 1) bitbake core-image-sato-sdk MACHINE=qemux86
> >>> 2) bitbake core-image-sato with MACHINE=crownbay
> >>> 
> >>> Then several pkgs in deploy/ipk/i586 would be installed to crownbay's
> >>> image even if there is one in deploy/ipk/core2 and we have set the
> >>> core2's priority higher than i586, when the version in deploy/ipk/i586 is
> >>> higher. This doesn't work for us, for example, what the crownbay need is
> >>> xserver-xorg-1.9.3, but it installs xserver-xorg-1.11.2.
> >> 
> >> And this is working exactly as intended. Don't break opkg because your
> >> hardware driver situation sucks.
> >> 
> >> So: NAK on this patch.
> > 
> > I think we do have a problem here. For example, the system is ignoring a
> > PREFERRED_VERSION directive here
> 
> A PREFERRED_VERSION set in a machine.conf, which is the wrong place.

Its strongly not recommended. You can do it and if things are setup
correctly, we do support machine specific alterations however...

>  Let's change the above build sequence to this:
> 
> 1) MACHINE=qemux86 bitbake xserver-xorg
> 2) MACHINE=othercore2machine bitbake xserver-xorg
> 3) MACHINE=crownbay bitbake xserver-xorg
> 
> Oh look, I get 1.11.2 on crownbay regardless of this patch.

I've been assuming this xserver is marked as machine specific. If its
not, that is a bug and we can fix that.

> > by building one thing and then
> > installing another. We're also inconsistent between the dpkg/rpm and
> > opkg backends. There is therefore definitely some kind of user
> > experience issue at stake here since this behaviour is not obvious,
> > expected or particularly correct.
> > 
> > The fact the example is hardware related is not particularly relevant,
> > its the bigger picture I worry about
> 
> I also worry about the bigger picture, especially about what Martin
> said about this breaking feeds.

As far as I understood Martin's comments, this actually helps avoid some
of the issues he's been experiencing with feeds?

Martin has a problem where machines are ending up with unoptimised
versions of code on them and it would be good to fix opkg behaviour to
do what people expect...

Cheers,

Richard





