Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id EFF1E60119
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Mar 2016 21:23:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u29LNoS1022760; Wed, 9 Mar 2016 21:23:50 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id oqOcV-dzEXcv; Wed,  9 Mar 2016 21:23:50 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u29LNipG022756
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 9 Mar 2016 21:23:45 GMT
Message-ID: <1457558624.2804.181.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@windriver.com>, Paul Gortmaker
	<paul.gortmaker@windriver.com>
Date: Wed, 09 Mar 2016 21:23:44 +0000
In-Reply-To: <56E07128.2060401@windriver.com>
References: <cover.1455203562.git.bruce.ashfield@windriver.com>
	<2e6d2b75837731be983d888eaa82a9cfcf660e85.1455203562.git.bruce.ashfield@windriver.com>
	<1455287765.16142.321.camel@linuxfoundation.org>
	<1455291157.16142.323.camel@linuxfoundation.org>
	<1455352317.16142.344.camel@linuxfoundation.org>
	<1455383832.16142.365.camel@linuxfoundation.org>
	<20160302014146.GE20979@windriver.com> <56E07128.2060401@windriver.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: "Hart, Darren" <darren.hart@intel.com>, "saul.wold" <saul.wold@intel.com>,
	poky@yoctoproject.org,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [poky] [PATCH 1/1] poky: update qemu* to prefer 4.4 kernel
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
X-List-Received-Date: Wed, 09 Mar 2016 21:23:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2016-03-09 at 13:53 -0500, Bruce Ashfield wrote:
> On 2016-03-01 8:41 PM, Paul Gortmaker wrote:
> > [Re: [poky] [PATCH 1/1] poky: update qemu* to prefer 4.4 kernel] On
> > 13/02/2016 (Sat 17:17) Richard Purdie wrote:
> > 
> > > I'm moving the discussion to OE-Core and pulling in some kernel
> > > people.
> > > I think I understand what is wrong and how to fix it but I could
> > > use
> > > someone who actually knows this code.
> > > 
> > > To summarise the story so far, on qemux86, X doesn't start and
> > > there is
> > > a backtrace in the logs:
> > > 
> > > x86/PAT: Xorg:705 map pfn expected mapping type uncached-minus
> > > for [mem 0xfd000000-0xfdffffff], got write-combining
> > 
> > So Bruce helped me set up a reproducer locally today since he'd
> > already
> > invested the time on that, and then I boiled that down to divorce
> > it
> > from the slower steps of build-deploy-boot to make the bisect
> > something
> > that mortal humans could tolerate.
> > 
> > Amusingly enough that led to:
> > 
> > commit 9cd25aac1f44f269de5ecea11f7d927f37f1d01c
> > Author: Borislav Petkov <bp@suse.de>
> > Date:   Thu Jun 4 18:55:10 2015 +0200
> > 
> >      x86/mm/pat: Emulate PAT when it is disabled
> > 
> > So while some of us were joking on IRC about the validity of
> > forcibly
> > disabling PAT (via cmdline or Kconfig) as a workaround, the one
> > line
> > shortlog above tells us that it wasn't so off the mark after all.
> > 
> > Bruce and I will decide what to do with this tomorrow, but since
> > Richard
> > spent so much time on it, I thought he'd like to know this in the
> > interim.  Good times.   :-/
> 
> As another follow up. The thread can be summarized as "It doesn't
> look like it should have worked before, and qemu's pat emulation
> may be the issue'.
> 
> The suggestion is to run with 'nopat', which is what Richard
> originally
> did.
> 
> So I'm going to prep a patch that drops the kernel patch, and leaves
> nopat enabled on the qemu command line. That should get us put back
> together in a semi-permanent way.

How sure are we this is a bug in QEMU's pat emulation? If that is the
case we should file a bug against qemu and try and fix it rather than
work around it...

Cheers,

Richard

