Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QWnCA-000129-Nx for openembedded-core@lists.openembedded.org;
	Wed, 15 Jun 2011 12:19:35 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5FAG9ft025398
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jun 2011 11:16:09 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 25229-04 for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jun 2011 11:16:05 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5FAG23S025392
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jun 2011 11:16:03 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <3E89612B-A102-423A-8499-55E5AC1CDF07@dominion.thruhere.net>
References: <1308086002-16398-1-git-send-email-raj.khem@gmail.com>
	<1308086688.15712.362.camel@rex>
	<CFF0ECE5-F738-4233-8214-9E57A6616C5B@dominion.thruhere.net>
	<BANLkTi=Kk7J-ZAQuPkC5LNAnxZSAzwtvOg@mail.gmail.com>
	<8C2617DC-2693-42A3-810B-C3A516DB7360@dominion.thruhere.net>
	<BANLkTimY-6iNGoKeeZ7Xs0rswKSZUi3xSQ@mail.gmail.com>
	<3E89612B-A102-423A-8499-55E5AC1CDF07@dominion.thruhere.net>
Date: Wed, 15 Jun 2011 11:16:00 +0100
Message-ID: <1308132960.15712.390.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH V2] allarch.bbclass: Set FEED_ARCH to original value of BASE_PACKAGE_ARCH and then set BASE_PACKAGE_ARCH to 'all'
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
X-List-Received-Date: Wed, 15 Jun 2011 10:19:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-06-15 at 09:00 +0200, Koen Kooi wrote:
> Op 15 jun 2011, om 01:12 heeft Khem Raj het volgende geschreven:
> 
> > On Tue, Jun 14, 2011 at 2:44 PM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> >> 
> >> Op 14 jun 2011, om 23:40 heeft Khem Raj het volgende geschreven:
> >> 
> >>> On Tue, Jun 14, 2011 at 2:32 PM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> >>>> 
> >>>> Op 14 jun 2011, om 23:24 heeft Richard Purdie het volgende geschreven:
> >>>> 
> >>>>> On Tue, 2011-06-14 at 14:13 -0700, Khem Raj wrote:
> >>>>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>>>>> ---
> >>>>>> meta/classes/allarch.bbclass |    5 +++--
> >>>>>> 1 files changed, 3 insertions(+), 2 deletions(-)
> >>>>>> 
> >>>>>> diff --git a/meta/classes/allarch.bbclass b/meta/classes/allarch.bbclass
> >>>>>> index e3ac392..b9ba28b 100644
> >>>>>> --- a/meta/classes/allarch.bbclass
> >>>>>> +++ b/meta/classes/allarch.bbclass
> >>>>>> @@ -2,9 +2,10 @@
> >>>>>> # This class is used for architecture independent recipes/data files (usally scripts)
> >>>>>> #
> >>>>>> 
> >>>>>> +# We need to pour the value of BASE_PACKAGE_ARCH into FEED_ARCH
> >>>>>> +# before we reset it
> >>>>>> +FEED_ARCH := ${BASE_PACKAGE_ARCH}
> >>>>>> BASE_PACKAGE_ARCH = "all"
> >>>>>> -PACKAGE_ARCH = "all"
> >>>>>> -
> >>>>>> # No need for virtual/libc or a cross compiler
> >>>>>> INHIBIT_DEFAULT_DEPS = "1"
> >>>>> 
> >>>>> This is a *really* bad idea. An "all" package should have no need to set
> >>>>> architecture specific values into FEED_ARCH.
> >>>>> 
> >>>>> Just for those not following IRC, the problem is Angstrom adds FEED_ARCH
> >>>>> to OVERRIDES. Adding "all" to overrides turns out to do nasty things to
> >>>>> classes like rm_work with "_all" in the function names.
> >>>> 
> >>>> So why don't we just set PACKAGE_ARCH = all in allarch.bbclass and not touch BASE_PACKAGE_ARCH and FEED_ARCH?
> >>>> 
> >>> 
> >>> because there are some machines conf files which use BASE_PACKAGE_ARCH e.g.
> >>> tune-xscale.inc
> >>> 
> >>> BASE_PACKAGE_ARCH = "${@['armv5teb',
> >>> 'armv5te'][bb.data.getVar('SITEINFO_ENDIANESS', d, 1) == 'le']}"
> >>> 
> >>> PACKAGE_EXTRA_ARCHS = "${@['armeb armv4b armv4tb armv5teb', 'arm armv4
> >>> armv4t armv5te'][bb.data.getVar('SITEINFO_ENDIANESS', d, 1) == 'le']}"
> >>> 
> >>> and this does not get evaluated properly then
> >> 
> >> But that wouldn't matter in the scope of allarch, though?
> > 
> > SITEINFO_ENDIANESS  = "${@siteinfo_get_endianess(d)}"
> > 
> > def siteinfo_get_endianess(d):
> >       info = get_siteinfo_list(d)
> >       if 'endian-little' in info:
> >              return "le"
> >       elif 'endian-big' in info:
> >              return "be"
> >       bb.error("Site info could not determine endianess for target")
> > 
> > 
> > and
> > get_siteinfo_list has this
> > 
> >       targetinfo = {\
> >               "allarch-linux":           "",\
> > 
> > hence siteinfo_get_endianess ends up with
> > 
> > bb.error("Site info could not determine endianess for target")
> > 
> > may be we need to differentiate with None return and empty string
> > return along with 'endian-little' and 'endian-big'
> > or may be add another option called 'endian-neutral'
> 
> Or just add a bogus endianness: http://cgit.openembedded.org/cgit.cgi/meta-openembedded/commit/?id=f95ffd6cedb2a0fcad9db1b2d612663a327be87b

This is just papering over cracks. "allarch" packages shouldn't be
querying endianness, it really is that simple.

Cheers,

Richard



