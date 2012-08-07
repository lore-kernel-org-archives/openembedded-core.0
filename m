Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Sym5p-0006nC-5I for openembedded-core@lists.openembedded.org;
	Tue, 07 Aug 2012 17:53:13 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q77FfPwd012759;
	Tue, 7 Aug 2012 16:41:25 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 12367-04; Tue,  7 Aug 2012 16:41:21 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q77FfIxY012753
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 7 Aug 2012 16:41:19 +0100
Message-ID: <1344354080.9756.274.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Tue, 07 Aug 2012 16:41:20 +0100
In-Reply-To: <502133A9.1080707@windriver.com>
References: <1344008589-3660-1-git-send-email-liang.li@windriver.com>
	<1344348160.9756.255.camel@ted> <50212122.50109@windriver.com>
	<1344349336.9756.259.camel@ted> <50212648.8030204@windriver.com>
	<1344350670.9756.269.camel@ted> <502133A9.1080707@windriver.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: darren.hart@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] perf: pass STAGING_INCDIR(sysroot) to perf
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
X-List-Received-Date: Tue, 07 Aug 2012 15:53:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-08-07 at 11:26 -0400, Bruce Ashfield wrote:
> I wasn't clear, I'm building the tree (and tools) standalone using
> both a hand generated cross toolchain and the native toolchain. Neither
> uses a sysroot, so if I merged that patch into the tree, then they
> wouldn't find slang and the build breaks.

I'm not sure you want that hand generated cross toolchain finding slang
in that location, but anyhow... :)

> > It would be nice to not have to guess at what the problem is though...
> 
> Sorry about that, 400 unread email have me moving quickly this morning
> and not taking enough time to put all the detail into what I am
> writing. I added that above. And yes, it is some older RHEL/Suse boxes
> and other ones that are derived from non debian systems that give me
> pain.

Ok, I understand the problem now.

> > We had the autobuilder showing read for 5 days with radio silence and
> > admittedly some confusion over a patch status. What am I meant to do
> > given I'd really like to take the vacation I have planned this week?
> 
> Sorry, I thought when Liang sent the patch the issue was resolved :(
> We at least did. That's how it goes sometimes.

Right, some of it is misunderstanding and bad timing etc. but I needed
to do something. I agree its suboptimal but its a better position for
OE-Core than we were in and we can recover from it.

> > Anyhow, lets see if we can resolve this. Can you answer my previous
> > question about whether changing this to -I=/usr/include/slang would
> > work?
> 
> It should, but there's a distinct lack of precedent for sysroot style
> include paths in the kernel tools (behind the times), but in the end,
> if it fixes the oe-core case, and doesn't break standalone builds
> (the toolchain just has to no error on the syntax), it should be fine.
> 
> I've already asked that a full kernel fix be generated, but I don't think
> it will make the deadline for your vacation, or M3, so merging a sysroot
> based include is probably the reasonable middle ground that I'll end
> on.

Lets try the sysroot prefix (=) approach then. The kernel is sparse on
these since it never actually has to deal with sysroots (or userspace)
often and is still learning in that area. I suspect this should be the
fix upstream might take.

Cheers,

Richard



