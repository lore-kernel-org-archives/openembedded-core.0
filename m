Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T2Mpe-0006NO-Fu
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 15:43:22 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 17 Aug 2012 06:31:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,784,1336374000"; d="scan'208";a="182217838"
Received: from unknown (HELO helios.localnet) ([10.252.121.90])
	by azsmga001.ch.intel.com with ESMTP; 17 Aug 2012 06:31:21 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: ml@communistcode.co.uk
Date: Fri, 17 Aug 2012 14:31:21 +0100
Message-ID: <4413337.0EdOH8CKvX@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-29-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <502E22BF.4050809@communistcode.co.uk>
References: <1345049073-27898-1-git-send-email-paul.eggleton@linux.intel.com>
	<20120817102638.GD17007@mi.fu-berlin.de>
	<502E22BF.4050809@communistcode.co.uk>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] classes/chrpath: trigger an error if chrpath fails
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
X-List-Received-Date: Fri, 17 Aug 2012 13:43:22 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 17 August 2012 11:53:51 Jack Mitchell wrote:
> On 17/08/12 11:26, Henning Heinold wrote:
> > On Fri, Aug 17, 2012 at 11:05:43AM +0100, Jack Mitchell wrote:
> >> any provider
> >> WARNING: Failed to fetch URL
> >> http://kernel.org/pub/linux/kernel/people/jsipek/guilt/guilt-0.33.tar.gz
> >> , attempting MIRRORS if available
> >> *ERROR: chrpath command failed with exit code 7
> >> ERROR: chrpath command failed with exit code 7*
> > 
> > Hi,
> > 
> > you can grep the logfiles in the work-dir for chrpath call and you will
> > find the package. I saw it on some perl modules, but not now.
> > 
> > Bye Henning
> 
> Ok, here we go:
> 
>    
> x86_64-linux/perl-native-5.14.2-r1/temp/log.do_populate_sysroot.30355:ERROR
> : chrpath command failed with exit code 7
>    
> x86_64-linux/perl-native-5.14.2-r1/temp/log.do_populate_sysroot.30355:ERROR
> : chrpath command failed with exit code 7
> 
> This is on kraj/toolchain-rework, I don't know how synced with master it
> is so apologies if it has already been fixed.

I can confirm this; with the patch I have just sent to improve the error
handling, on top of master I now get:

---------- snip -----------
ERROR: perl-native: chrpath command failed with exit code 7:
/home/paul/poky/poky/build/tmp/work/i686-linux/perl-native-5.14.2-r1/sysroot-destdir/home/paul/poky/poky/build/tmp/sysroots/i686-linux/usr/lib/perl-native/perl/5.14.2/auto/Time/HiRes/HiRes.so: RPATH=/lib/i386-linux-gnu
new rpath '$ORIGIN/../../../../../../../../../..' too large; maximum length 19

ERROR: Function failed
ERROR: Logfile of failure stored in: /home/paul/poky/poky/build/tmp/work/i686-linux/perl-native-5.14.2-r1/temp/log.do_populate_sysroot.17120
ERROR: Task 3 (/home/paul/poky/poky/meta/recipes-devtools/perl/perl-native_5.14.2.bb, do_populate_sysroot) failed with exit code '1'
---------- snip -----------

This is with a from-scratch build of perl-native; TMPDIR in my case is
"/home/paul/poky/poky/build/tmp" as you can probably tell from the above.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


