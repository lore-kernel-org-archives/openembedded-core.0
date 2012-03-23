Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SB3r0-0001Xn-7L for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 13:44:26 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2NCZT77026622;
	Fri, 23 Mar 2012 12:35:29 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26101-06; Fri, 23 Mar 2012 12:35:25 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2NCZJIA026615
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 23 Mar 2012 12:35:20 GMT
Message-ID: <1332506121.9740.404.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Fri, 23 Mar 2012 12:35:21 +0000
In-Reply-To: <4F6B48F2.8000107@windriver.com>
References: <2207E1AD-E06F-40D6-9FD7-1452805A4CF3@dominion.thruhere.net>
	<1332427771.9740.240.camel@ted>
	<7F144BE0-BBF4-4EE0-9A1E-A6842C846E00@dominion.thruhere.net>
	<4F6B48F2.8000107@windriver.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Koen Kooi <koen@dominion.thruhere.net>, Patches,
	the oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: Syscall backporting and linux-libc-headers
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
X-List-Received-Date: Fri, 23 Mar 2012 12:44:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-03-22 at 11:44 -0400, Bruce Ashfield wrote:
> On 12-03-22 11:12 AM, Koen Kooi wrote:
> >
> > Op 22 mrt. 2012, om 15:49 heeft Richard Purdie het volgende geschreven:
> >
> >> On Thu, 2012-03-22 at 13:22 +0100, Koen Kooi wrote:
> >>> In my never ending quest to get consolekit/polkit/etc working properly
> >>> I've found that CONFIG_AUDITSYSCALL is really usefull (it's usefull in
> >>> other contexts as well, but that's outside the oe-core set of
> >>> recipes). It has the following problem:
> >>>
> >>> config AUDITSYSCALL
> >>>         bool "Enable system-call auditing support"
> >>>         depends on AUDIT&&  (X86 || PPC || S390 || IA64 || UML ||
> >>> SPARC64 || SUPERH)
> >>>
> >>> No MIPS or ARM support. There recently was a pull request from Al Viro
> >>> to get at least ARM support into mainline, but I'm not sure what
> >>> happened to that. Anyway, I backported the ARM patch to 3.0 and 3.2,
> >>> but to make it usefull I'd need to patch linux-libc-headers and bump
> >>> PR on virtual/libc.
> >>>
> >>> What's the OE-core position on backporting syscalls to
> >>> linux-libc-headers?
> >>
> >> Why can't we just increase the linux-libc-headers version?
> 
> Sorry for the slow reply, I missed the original and was wrapped
> up in some debugging.
> 
> >
> > In this case that would be perfectly fine. And bump PR in virtual/libc of course :)
> 
> I was just about to do this. Just a day or so ago, I noticed that
> the version had lagged (again) and needed to be bumped. I'm all
> for this as well, as long as there's a graceful fallback of ENOSYS
> there's no real harm to older kernels.
> 
> Richard: an to you on this one .. is it too late to do this for
> the various stabilization points ?

I'm a bit jittery on this. If I have the patch today and it doesn't
break anything it might make it in...

> >> Presumably
> >> someone running a kernel without the patches won't see any issue, the
> >> syscall just won't be present and software will fall back?
> >
> > Exactly
> 
> +1 (I read this after typing my response).
> 
> >
> >> I think the big concern would be deviating from mainline as its not so
> >> much a backport as a divergence at this point (and this is why we can't
> >> just upgrade)?
> >
> > Speaking of divergence, what is the point of having linux-libc-headers-yocto_git.bb ?
> 
> Very little. It was originally used to export exactly the headers
> as were present in the yocto kernel tree, but Richard and I since
> agreed that tgz based libc-headers where faster and good enough.
> 
> We can move it to the yocto layers for use by anyone that really needs
> this 1:1 mapping of kernel tree to headers in the system.
> 
> And a second: .. is it too late to do this for stabilization points ?

No, I'll take that one since its a removal on something that is unused.

Cheers,

Richard



