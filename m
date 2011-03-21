Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Q1iwf-0005qz-4N for openembedded-core@lists.openembedded.org;
	Mon, 21 Mar 2011 18:31:09 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2LHTBtm025750;
	Mon, 21 Mar 2011 17:29:11 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 25546-04; Mon, 21 Mar 2011 17:29:07 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2LHT449025744
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 21 Mar 2011 17:29:05 GMT
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4D81E52E.7030808@mlbassoc.com>
References: <bf5f59e00a2ee59636426fabe2d4ae935fe2c4a5.1300295087.git.dvhart@linux.intel.com>
	<13FB91B0-A9A3-41A8-BD13-7F9FB8B2F2CD@beagleboard.org>
	<4D810ED4.6020107@linux.intel.com>  <4D81E52E.7030808@mlbassoc.com>
Date: Mon, 21 Mar 2011 17:28:39 +0000
Message-ID: <1300728519.30423.3935.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Darren Hart <dvhart@linux.intel.com>, Koen Kooi <koen@beagleboard.org>
Subject: Re: [PATCH V2] [RFC] kernel: rework kernel and module classes to allow for building out-of-tree modules
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
X-List-Received-Date: Mon, 21 Mar 2011 17:31:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-03-17 at 04:40 -0600, Gary Thomas wrote:
> On 03/16/2011 01:26 PM, Darren Hart wrote:
> > On 03/16/2011 10:54 AM, Koen Kooi wrote:
> >>
> >> Op 16 mrt 2011, om 18:04 heeft Darren Hart het volgende geschreven:
> >>
> >>> NOT FOR INCLUSION
> >>>
> >>> Before we include something like this, it needs review from folks like Koen and
> >>> Gary to confirm it works in their environment as well.
> >>>
> >>> The existing infrastructure uses an external build tree which references the
> >>> kernel source in the work dir. If run with rm work, building external modules
> >>> will fail.
> >>>
> >>> This patch places a configured source tree in sysroots. Striking a balance
> >>> between minimal size and minimal maintenance is difficult. A fully configured
> >>> tree is about 500MB after a clean. This version leans on the side of caution and
> >>> removes only the obviously unecessary parts of the source tree to conserve
> >>> space, resulting in about 170MB. The arch directories would be some additional
> >>> pruning we could do. Given examples from the devel package from distributions, I
> >>> suspect this size could be reduced to 75MB or so, but at the cost of a much more
> >>> complex recipe which is likely to require a great deal more maintenance to keep
> >>> current with kernel releases.
> >>>
> >>> Care is also taken to clean the hostprogs in scripts, and the modules are
> >>> responsible for building them as needed. Although it is unclear to me if this is
> >>> really necessary, especially considering that modules put these bits back as
> >>> soon as they compile. If we are not generating an sstate package, I suspect we
> >>> can ignore these.
> >>>
> >>> Please try this with your modules and let me know how it does. I tried to take
> >>> non linux-yocto kernel recipes into account, but I have only tested with
> >>> linux-yocto and the hello-mod recipe so far.
> >>>
> >>> V2: o Address 000 perm quilt files (don't copy .pc dir)
> >>> o Clear linux-yocto meta dir from sysroots
> >>>
> >>> Signed-off-by: Darren Hart<dvhart@linux.intel.com>
> >>
> >> This one works beautifully, so:
> >>
> >> Acked-by: Koen Kooi<koen@dominion.thruhere.net>
> >
> > Thanks Koen.
> >
> > Gary, can you give this version a spin?
> >
> > If it works, I'm going to suggest we take this as is and carefully prune away bits we don't need over time so we can get adequate testing across multiple archs, platforms, and
> > modules. Same for the hostprogs cleaning bits.
> >
> 
> It also worked for me.  Thanks - you can add
> 
> Acked-by: Gary Thomas <gary@mlbassoc.com>

Thanks all, I'm going to merge this to master.

Cheers,

Richard




