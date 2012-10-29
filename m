Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TSxWa-0001hd-1A for openembedded-core@lists.openembedded.org;
	Mon, 29 Oct 2012 23:09:36 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9TLu1Q4008110;
	Mon, 29 Oct 2012 21:56:01 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 07976-01; Mon, 29 Oct 2012 21:55:58 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9TLtr61008104
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Mon, 29 Oct 2012 21:55:54 GMT
Message-ID: <1351547753.2828.52.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Mon, 29 Oct 2012 21:55:53 +0000
In-Reply-To: <lybofl0xdv.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <1351523465-26489-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
	<1351527102.2828.19.camel@ted>
	<lyvcdtgsa6.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<1351531332.2828.26.camel@ted>
	<lyr4ohgnw0.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<1351534747.2828.34.camel@ted>
	<lymwz5gl3j.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<lybofl0xdv.fsf@ensc-virt.intern.sigma-chemnitz.de>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] sstate.bbclass: preserve time when unstaging files
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
X-List-Received-Date: Mon, 29 Oct 2012 22:09:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-10-29 at 22:41 +0100, Enrico Scholz wrote:
> Richard Purdie <richard.purdie@linuxfoundation.org> writes:
> 
> >> >> >> But the real bug is the time mismatch in the autobuilders, isn't it?
> >> >> >> And this can/should be solved by synchronizing time by ntp on them
> >> >> >> instead of applying dirty hacks like resetting file dates.
> > ...
> > Imagine system A generates the sysroot headers with a time ahead of
> > system B. These are packaged up into an sstate tarball. System B which
> > has a clock at some time behind system A then downloads and uses them
> > so the sysroot headers become some time in the future.
> 
> This can not happen when both machines are synchronizing their time with
> ntp.  Drift to stratum-1 machine is usually <1ms in local networks and
> <50ms for remote ones (--> see 'ntpq' -> pe output).
> 
> Nothing, which can cause the problem described by you.

I have already agreed that this cannot happen if the machines are in
good sync via ntp, I'm not arguing with that.

> > The alternative is to mandate *every* system that builds are run on
> > use ntp
> 
> Yes; a common timesource is mandatory for so nearly every distributed
> system.  Even windoze enables (s)ntp clients by default (although its
> daily synchronization is just a bad joke) and I remember Fedora/Ubuntu
> enabling it by default too.
> 
> 
> > and add checks to sanity.bbclass to this effect since someone might
> > try using a sstate feed with a bad clock. This would cause no end of
> > problems, not least with corporate filewalls
> 
> Every non-trivial network has local ntp servers which are used by clients
> there.

Most of the time I get email from people who are technically clued up on
decent non-trivial networks (say Intel). The amount of emails I get
where the sender's machine's clock is way out is surprisingly high.

That alone suggests that relying on people to setup ntp is not going to
work.

> > and hurt usability of the project
> 
> How common is the distributed autobuilder setup?  How many of these
> installations do not use ntp?

The local.conf.sample details how a user can use a public sstate feed.
If at the same time they don't ensure their clock is correct, things
will break in unexpected and nasty ways.

The yocto autobuilder infrastructure had some misconfiguration and
failed due to ntp not working properly and the clocks going out of sync.
Having seen the problem there, spent many hours tracking it down and
asked for it to get fixed, the Intel autobuilders then suffered exactly
the same issue for different reasons (effectively firewalls again
though). All the evidence I have says relying on working ntp setups is
not good enough in the real world much as you, I and others wish it were
so.

There is a simple and easy way to avoid this problem with tar -m so I
think we have a good justification for that.

Cheers,

Richard







