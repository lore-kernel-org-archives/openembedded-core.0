Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 95D6D607BF
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 May 2014 19:59:31 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s42JxPiG021334; Fri, 2 May 2014 20:59:25 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Ita8tO-wqS5A; Fri,  2 May 2014 20:59:25 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s42JxKc4021324
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Fri, 2 May 2014 20:59:21 +0100
Message-ID: <1399060754.12731.71.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 02 May 2014 20:59:14 +0100
In-Reply-To: <9A664150-4DD2-4197-A3D6-49C96EF5A6BC@dominion.thruhere.net>
References: <1398963761.12731.1.camel@ted>
	<9A664150-4DD2-4197-A3D6-49C96EF5A6BC@dominion.thruhere.net>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: My thoughts on the future of OE?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 02 May 2014 19:59:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2014-05-02 at 21:16 +0200, Koen Kooi wrote:
> Op 1 mei 2014, om 19:02 heeft Richard Purdie <richard.purdie@linuxfoundation.org> het volgende geschreven:
> 
> > I was asked what I thought were things that needed discussion at OEDAM.
> > Sadly I won't be there but I thought it might help to write down my
> > thoughts in a few areas.
> > 
> > Developer Workflow
> > ------------------
> > 
> > Firstly, I think the big piece we need to address as a project is
> > "developer workflow" as this is where people are struggling using it.
> > 
> > Unfortunately "developer workflow" means different things to different
> > people? Which one do I mean then? I actually mean all of them. As some
> > examples:
> 
> [snip use cases]
>
> I notice none of the use case mention distro developers, but the
> paragraph above is vague enough to be interpreted as "we rock at
> distro stuff, we suck at app/product development". To clear up my
> confusion, could you say something about distro development? Something
> like "bitbake-prserv-tool import won't be glacially slow in the
> future" :)

Is there an open bug for that?

I didn't really think too much about distro developers since I believe
they are comparatively well covered and they know where/how to shout if
they're having problems.

Some of the other use cases are massively under represented amongst the
regular contributors to the project which is more why I was focusing on
them. That doesn't mean the distro development cases aren't important, I
just think they can look after themselves to an extend :).

> After 5 OE-core based angstrom releases I can say that the 'Core OS'
> quality has improved a lot and I've made peace with the version update
> policy, but the overall experience for a downstream distro is painful.
> A lot of small, stupid and preventable mistakes combined are tedious
> to deal with. The most recent example I hit was xinput-calibrator
> losing XDG autolaunch support in the move to OE-core without
> mentioning it in the commit log. It took me a week (admittingly a
> spare time week, so maybe a single workday) to track it down and come
> up with a patch.

I hope that kind of thing doesn't happen often. When/where it does,
we'll figure it out and warn the people who let the issue through so it
doesn't happen again. Are there other examples of the kind of
preventable issues we could look for? I do my best to screen the
incoming commits and we have seen more people helping with review
recently but its a tough job. If I know what to look for...

> And there's a *big* stupid and preventable issue that is not really
> OE-cores fault, but more the yocto-projects fault: BSPs using
> linux-yocto.bbappend and doing:
> 
> 	SRCREV = "githash"
> 	LINUX_VERSION = "3.12"
> 
> BSP maintainers assume only their BSP will be affected, but it affects
> *all* BSPs using linux-yocto.bbappends. This applied to all bbappends,
> but I've seen all meta-handheld machines jump up and down in PV due to
> other BSPs setting global vars.

Hmm, not good. Perhaps we should try and detect this?

We could do:

LINUXYOCTO_VERSION = "x"
LINUX_VERSION = "${LINUXYOCTO_VERSION}"

and then check in anonymous python if d.getVar("LINUX_VERSION", False)
is still what we think it should be?

I'm open to ways of improving this if its a major problem.

>  Ross deserves a big thank you for obsoleting mesa bbappends, that
> issues prevented angstrom from having a working GL version for >1 ARM
> silicon vendor.

Yes, that is nice to see. In general I'd like to significantly reduce
the number of bbappends we need. I'd also like to introduce sstate
checksum checks on layers and maybe tie that to Yocto Project
Compatible. If you add a layer and it changes core checksums, and its
not a policy/distro layer, its not compatible. Nice and easy to check
programmatically.

> 
> > So my first ask is that we actually try and write down all these
> > different cases which is no small task in itself. I've a start of a list
> > above, we should probably put this into the wiki and have people add
> > their own use cases (or use cases of those around them in their company
> > etc.). The trouble is there are some many different variants!
> > 
> > Once we have some idea of the cases, we can start to put together some
> > kind of plan about how we intend to help the given use cases and to try
> > and prioritise them. Perhaps we should put some kind of weighting
> > against them in the wiki and people can increase the numbers of say
> > their top three desires.
> > 
> > Whilst this looks like an impossible problem, the good news is that I
> > believe we can solve it and we actually already have a rather powerful
> > toolbox to help work on it. I have a rough idea of a roadmap that can
> > move us forward:
> > 
> > a) locked sstate - I know its not in master yet but I believe this is
> > key to allowing some of the use cases where you want to change some
> > number of things but keep the rest of the system the same.
> 
> This is something I would very much like to see happening. I've
> noticed at least 3 patches in the 'dora' stable branch that triggered
> pretty much a complete rebuild due to sstate+prserv. And when I apply
> a buildfix for recent host distros to e.g. gcc to
> meta-linaro-toolchain I trigger a complete rebuild as well. It would
> be a lot less churn in the package feeds if I could lock down
> everything in console-image. That way the 'core OS' packages won't
> have as much spurious updates as they have now.

Agreed. I think this will take a little bit of bedding in as we find the
right use cases and the right configuration but its something I want to
spend time on in 1.7 and get working well...

Cheers,

Richard


