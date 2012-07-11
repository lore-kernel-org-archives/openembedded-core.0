Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Sp11E-0003HW-Ba for openembedded-core@lists.openembedded.org;
	Wed, 11 Jul 2012 19:48:08 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6BHaub4011357;
	Wed, 11 Jul 2012 18:36:57 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 10889-03; Wed, 11 Jul 2012 18:36:52 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6BHanSk011351
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 11 Jul 2012 18:36:50 +0100
Message-ID: <1342028210.11939.35.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Seebach <peter.seebach@windriver.com>
Date: Wed, 11 Jul 2012 18:36:50 +0100
In-Reply-To: <20120711113333.76632780@wrlaptop>
References: <cover.1342022120.git.peter.seebach@windriver.com>
	<22e5e5adc39fb855badc6d1260fbd4b30d966530.1342022120.git.peter.seebach@windriver.com>
	<1342023149.11939.22.camel@ted> <20120711113333.76632780@wrlaptop>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] package.bbclass: Allow overriding of debugedit starting path
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
X-List-Received-Date: Wed, 11 Jul 2012 17:48:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-07-11 at 11:33 -0500, Peter Seebach wrote:
> On Wed, 11 Jul 2012 17:12:29 +0100
> Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
> 
> > I think I at least would find this slightly less confusing as:
> > 
> > workparentdir = d.getVar("DEBUGSRC_OVERRIDE_PATH", True) or
> > os.path.dirname(workdir)
> 
> Wait, LESS confusing?
> 
> I appear to have tragically misunderstood the design goals of
> package.bbclass.  :P

Well, we are trying over time... :)

> But yes, that's a good improvement. Applied locally.
> 
> Speaking of confusing: If purely hypothetically I wanted to
> submit a patch which standardized the indentation in package.bbclass,
> would anyone be interested in that?  I ask only because while I can
> accept either 8-space or 4-space indentation, I find it comforting when
> any given file full of Python source uses one or the other.

It should all use 4 space for python functions. There is however a twist
which is due to the way we handle _prepend and _append. Those prepends
and appends have whitespace too and I seem to remember issues with
whitespace matching.

Yes, this is horrible. This is why that file hasn't been touched for
whitespace though.

> And while there's currently only a couple of blocks of 4-space
> indentation in the file, we *normally* use 4-space, that's the
> quasi-official Python community norm, and a LOT of the "too long" lines
> in that file would be much more readable at 4 spaces.
> 
> (This would be a totally separate patch, and I'm not super happy about
> the idea of a patch which updates half or more of the lines in the
> file, but it's not as though it'll be less painful to fix later.)

I'd be interested to see how much breakage we get from changing it. In
fact I just tried it, the result:

http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/t14&id=3db917bfb2455715a3a3a542ea831d05ca1cf9f7

the particularly nasty bit:

python populate_packages () {
	# Whitespace is deliberately a tab here due to the number of packages which
	# prepend this fuction :(
	populate_packages_core(d)
}

other than that it does seem to be working as long as I tweaked the
busybox recipe and update-alternatives too. We could go through and
change all the populate_packages_prepend functions but its the ones
outside OE-Core I worry about. I also worry there are some _append
functions now silently failing though :(.

Cheers,

Richard



