Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RQ4Uv-0002VQ-1T for openembedded-core@lists.openembedded.org;
	Mon, 14 Nov 2011 22:55:25 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAELn4kC016650
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2011 21:49:04 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 16583-01 for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2011 21:49:00 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAELmspi016644
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2011 21:48:55 GMT
Message-ID: <1321307338.26881.83.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 14 Nov 2011 21:48:58 +0000
In-Reply-To: <22478035-0923-402B-8617-45F140D38288@dominion.thruhere.net>
References: <cover.1321296476.git.paul.eggleton@linux.intel.com>
	<2ffb85152b2b9356efeb008891d8ed29f1f35cef.1321296476.git.paul.eggleton@linux.intel.com>
	<E3435B57-20F8-421E-8E1B-966A1B95CC8F@dominion.thruhere.net>
	<1321303197.26881.74.camel@ted>
	<22478035-0923-402B-8617-45F140D38288@dominion.thruhere.net>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 3/4] distcc: make distccmon-gnome optional and default to off
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
X-List-Received-Date: Mon, 14 Nov 2011 21:55:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-11-14 at 21:55 +0100, Koen Kooi wrote:
> Op 14 nov. 2011, om 21:39 heeft Richard Purdie het volgende geschreven:
> > On Mon, 2011-11-14 at 20:17 +0100, Koen Kooi wrote:
> >> I think splitting distccmon-gnome into a seperate recipe is a better idea.
> > 
> > I think that makes sense in some cases but I'd hate for it to become the
> > default approach for issues like this as the duplication of code,
> > parsing and build time etc. grate on me. Do we really need separate
> > recipes?
> 
> I think for this case, yes. And I'll happily trade needing extra
> buildtime for not needing USEFLAGS.
> 
The proposals for alternative recipes for the different combinations got
voted down and PACKAGECONFIG was the preferred solution. I can't say I
personally like everything about the outcome. I do however understand
why we've ended up in that position and don't intend to undermine the
usefulness of it.

> > I'll probably take this patch as it improves the situation IMO (and
> is
> > easy to change the configuration from a distro config if anyone does
> > have an issue with it being disabled).
> 
> This patch changes the default behaviour in a way that distros need to
> update their configs in order to keep the status quo. I know I use
> distccmon-gnome on my boards, but will I remember 2 months from now
> that this patch went in? I asked this before in a different context,
> but I'll ask again: do you expect distro maintainers to vet each and
> every commit that goes into OE-core to find out when default got
> (silently) changed?
> 
> USEFLAGS should be a last resort when having seperate recipes doesn't
> work out, not a default cure. 

The discussion and decision went against this, rightly or wrongly
PACKAGECONFIG is here and we should start to use it. In some cases it
will help you a lot, in others it will cause you a bit more work. Such
is life.

However I do agree the defaults should be backwards compatible so I'm
going to ask Paul to resubmit with a default value that matches the
original recipe, probably something like:

PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)} \
                   ${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}

although we could/should probably have some kind of "HAVEGTK" macro type
variable defined to help avoid some of this ugliness.

Cheers,

Richard



