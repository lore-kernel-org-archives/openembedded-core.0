Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TStFi-0004bf-7H for openembedded-core@lists.openembedded.org;
	Mon, 29 Oct 2012 18:35:54 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9THMJWv006418;
	Mon, 29 Oct 2012 17:22:19 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 05741-08; Mon, 29 Oct 2012 17:22:15 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9THMBTS006412
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Mon, 29 Oct 2012 17:22:12 GMT
Message-ID: <1351531332.2828.26.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Mon, 29 Oct 2012 17:22:12 +0000
In-Reply-To: <lyvcdtgsa6.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <1351523465-26489-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
	<1351527102.2828.19.camel@ted>
	<lyvcdtgsa6.fsf@ensc-virt.intern.sigma-chemnitz.de>
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
X-List-Received-Date: Mon, 29 Oct 2012 17:35:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-10-29 at 17:24 +0100, Enrico Scholz wrote:
> Richard Purdie <richard.purdie@linuxfoundation.org> writes:
> 
> >> When packages are recreated after a 'bitbake -c clean', files will get
> >> wrong date because tar has been invoked with the '-m' option.
> >> 
> >> Correct timestamps are useful for bug hunting and there are better
> >> ways (e.g. using of ntp) than using '-m'.
> >
> > This is a revert of:
> >
> > http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=2d89cff42af2bb0049224bfaaebaa2b21966169f
> >
> > where the option was added deliberately to deal with time mismatch
> > between autobuilders which was causing real world bugs.
> 
> But the real bug is the time mismatch in the autobuilders, isn't it?
> And this can/should be solved by synchronizing time by ntp on them
> instead of applying dirty hacks like resetting file dates.

I have asked that ntp be installed/fixed on the autobuilders to sort the
problem out but it seems that even with ntp running, mismatches can
happen (e.g. misconfigured timezones). Worse, when this does happen the
failures are extremely unpredictable and hard to debug. It causes things
to repeatedly recompile for example, even during do_install.

So no, I don't think this is a dirty hack, its part of ensuring the
builds are deterministic and helping people avoid what can be a very
nasty and hard to debug set of build issues.

I appreciate it hurts some other debugging forensics but I'd rather that
than anyone suffering some of the nasty build failures I debugged.

Cheers,

Richard




