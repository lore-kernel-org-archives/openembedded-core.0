Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 5679565C8A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Sep 2015 10:27:50 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 08 Sep 2015 03:27:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,489,1437462000"; d="scan'208";a="784916671"
Received: from jdkarpin-mobl4.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.5.153])
	by fmsmga001.fm.intel.com with ESMTP; 08 Sep 2015 03:27:50 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Tue, 08 Sep 2015 11:27:49 +0100
Message-ID: <4075484.OxUd8CpdCA@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.1.5-100.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <1441702411.24871.278.camel@linuxfoundation.org>
References: <1441702411.24871.278.camel@linuxfoundation.org>
MIME-Version: 1.0
Subject: Re: Illustration of good and bad QA test output
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
X-List-Received-Date: Tue, 08 Sep 2015 10:27:54 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 08 September 2015 09:53:31 Richard Purdie wrote:
> A while back, I asked for a review of test output when things fail as it
> was causing problems. I suspect some people don't really understand why
> this is a big deal. I'd therefore like to illustrate this with a new
> example:
> 
> https://autobuilder.yoctoproject.org/main/builders/nightly-oe-selftest/build
> s/180/steps/Running%20oe-selftest/logs/stdio
> 
> This is a failure we encountered on the autobuilder. It basically tells
> me that "1 is not 0".  I did see this failure in master-next but I had
> no what to know what was causing it, whether it was a patch in -next or
> whether it came from somewhere else. I therefore had to move things
> forward and merged -next.
> 
> Locally, I added this change:
> 
> http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/t222&id=
> c8134250f72d5102f96137265ae71cf8f2eff5a9
> 
> In amongst the build output this shows when the test fails, I see:
> 
> WARNING: Failed to fetch URL
> file://d1/sstate:m4::1.4.17:r0::3:d1c56d6fa574f1093f4be30cb90ac127_populate
> _lic.tgz.sig, attempting MIRRORS if available ERROR: Fetcher failure: Unable
> to find file
> file://d1/sstate:m4::1.4.17:r0::3:d1c56d6fa574f1093f4be30cb90ac127_populate
> _lic.tgz.sig anywhere. The paths that were searched were:
> /media/build1/poky/build/temp_sstate_20150907190612
>     /media/build1/poky/build/temp_sstate_20150907190612
> NOTE: recipe m4-1.4.17-r0: task do_populate_lic_setscene: Succeeded
> 
> and from that error and my knowledge of what was in -next, I can be
> pretty sure this comes from:
> 
> http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=e3feac122b6baa67a6e75a9
> 9da6e8834f0f2a7b0
> 
> and I now know who to blame (sorry Ross!). The issue is that this is now
> in master and we have the error in a much more serious place. If the QA
> code was showing better information in the case of failure, this would
> never have made it into master.
> 
> I mention this since I'm hoping a practical example of how the test
> failures influence decisions and make a difference to the project might
> encourage people to pay more attention to these details.

This is a good thing to note; being able to tell why the test has failed helps 
a lot if you're trying to figure out why the test failed and whether it's the 
test or the code that needs fixing.

One addendum though, this is not necessary if you are using runCmd() or 
bitbake() without passing ignore_status=True - it will fail the test and print 
the output for you if the command fails. Generally I only use 
ignore_status=True when I need to test a command that is expected to fail (any 
needed cleanup can generally be handled through add_command_to_tearDown() and 
track_for_cleanup()).

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

