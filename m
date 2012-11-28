Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TdaNk-0006KM-QL for openembedded-core@lists.openembedded.org;
	Wed, 28 Nov 2012 06:40:26 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qAS5QAaY010410;
	Wed, 28 Nov 2012 05:26:10 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 09454-03; Wed, 28 Nov 2012 05:26:04 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qAS5Q1np010404
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Wed, 28 Nov 2012 05:26:03 GMT
Message-ID: <1354080360.21863.111.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mark Hatle <mark.hatle@windriver.com>
Date: Wed, 28 Nov 2012 05:26:00 +0000
In-Reply-To: <50B52B94.6020700@windriver.com>
References: <20121127154129.GC3692@jama.jama.net>
	<1354047102.21863.105.camel@ted> <20121127202356.GJ3692@jama.jama.net>
	<50B52B94.6020700@windriver.com>
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
X-List-Received-Date: Wed, 28 Nov 2012 05:40:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-11-27 at 15:07 -0600, Mark Hatle wrote:
> On 11/27/12 2:23 PM, Martin Jansa wrote:
> >> Bitbake doesn't know which modules this package will produce since its
> >> using PACKAGES_DYNAMIC. It does its best effort to try and find DEPENDS
> >> but it can't take the regexps and come up with
> >> "pulseaudio-module-console-kit", hence it doesn't see the RDEPENDS.
> >> There isn't any generic way we can teach it to do that either. If it
> >> did, it would simply always build consolekit which you say you don't
> >> want so its not relevant anyway.
> >>
> >> So basically, you need to decide whether you want consolekit enabled or
> >> not and build accordingly, there is nothing you can do within bitbake to
> >> "mind read" what the image is going to want...
> 
> For the resolver, it has to use the RPROVIDES, PACKAGES and PACKAGES_DYNAMIC...

and it does to the limits that are reasonable...

> > No, you know that you will need pulseaudio-module-console-kit because
> > pulseaudio-server RDEPENDs on it (not on any pulseaudio-module-* but
> > pulseaudio-module-console-kit exactly). So it's not really mind reading.
> 
> But after the recipe has been built, the required item from PACKAGES_DYNAMIC 
> should now be in PACKAGES... and if it doesn't end up in the PACKAGES list, it 
> would be a good idea to at a minimum trigger a warning...  The catch is, is 
> there any way to tell if something from PACKAGES_DYNAMIC was used..

"After it is built" is no good to bitbake. It has to know what its doing
without building things.

All Bitbake can see is that there is some regexp in PACKAGES_DYNAMIC.

Yes, Bitbake could take all the keys in the datastore, expand each one
(since it could be constructed using another variable name) and find the
ones starting with RDEPENDS, then apply the rexexp to each key and see
if it matches. We one tried something like this and it is extremely
slow, parsing would take a massive speed hit.

The rule is therefore in corner cases like this (which are rather
unusual), you add something to DEPENDS and be done with it.

It is not a reasonable expectation for bitbake to figure this kind of
thing out.

I agree that if it builds things and discovers some kind of missing
dependency, that would be good to tell the user about.

Cheers,

Richard





