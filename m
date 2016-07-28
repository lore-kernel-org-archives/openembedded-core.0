Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7CD116072C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jul 2016 20:03:29 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 28 Jul 2016 13:03:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,434,1464678000"; d="scan'208";a="1015763658"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga001.fm.intel.com with ESMTP; 28 Jul 2016 13:03:30 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.68])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 88D176A4080;
	Thu, 28 Jul 2016 13:03:16 -0700 (PDT)
Date: Thu, 28 Jul 2016 22:26:59 +0300
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: =?iso-8859-1?Q?An=EDbal_Lim=F3n?= <anibal.limon@linux.intel.com>
Message-ID: <20160728192659.GA31569@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <1469620052.23580.115.camel@linuxfoundation.org>
	<20160727122801.GA7061@linux.intel.com>
	<5798B1E4.2090508@windriver.com>
	<20160727131844.GA31757@linux.intel.com>
	<5798C5A5.5050909@windriver.com>
	<48F3FC2919BF894DA92986D5D64EA12801AC99C8@ORSMSX103.amr.corp.intel.com>
	<57992068.702@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <57992068.702@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Ashfield,
	Bruce \(Wind River\)" <bruce.ashfield@windriver.com>
Subject: Re: 2.7% build time regression caused by enabling debug/printk.scc KERNEL_FEATURE]
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
X-List-Received-Date: Thu, 28 Jul 2016 20:03:31 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Jul 27, 2016 at 03:58:16PM -0500, Aníbal Limón wrote:
> 
> 
> On 07/27/2016 03:06 PM, Sullivan, California L wrote:
> > Adding the debug-kernel fragment to the printk fragment was probably a
> > mistake on my part. I don't see anything that requires it.
> > 
> > I'm also seeing another issue: TTY_PRINTK depends on EXPERT, which is
> > only enabled on the developer kernel by default, so you currently won't
> > be getting that option. From there, if we were to enable EXPERT,
> > DEBUG_KERNEL then gets selected automatically and we essentially end up
> > where we started and have the build time regression.
> > 
> > Stuff to think about on my end I suppose. In the mean time I +1 removing
> > the debug-kernel include from printk.scc.
> 
> I agree,
> 
> 	alimon

The fix has been merged to yocto-4.4 branch of yocto-kernel-cache:
https://git.yoctoproject.org/cgit/cgit.cgi/yocto-kernel-cache/commit/?h=yocto-4.4&id=d3cc76c3cb20247b16c16b2367decf08b5fb90fa
And included into last kernel update:
http://lists.openembedded.org/pipermail/openembedded-core/2016-July/124466.html

With the fix applied kernel build time decreased by 22.84%:

Build Configuration:
BB_VERSION        = "1.31.0"
BUILD_SYS         = "x86_64-linux"
NATIVELSBSTRING   = "openSUSE-13.2"
TARGET_SYS        = "i586-poky-linux"
MACHINE           = "qemux86"
DISTRO            = "poky"
DISTRO_VERSION    = "2.1+snapshot-20160728"
TUNE_FEATURES     = "m32 i586"
TARGET_FPU        = ""
meta
meta-poky
meta-yocto-bsp    = "master:039f47ad197a9a53109c9f3deadd9c35e62c056d"

before the fix:
	Command being timed: "bitbake virtual/kernel"
	User time (seconds): 1367.06
	System time (seconds): 162.06
	Percent of CPU this job got: 372%
	Elapsed (wall clock) time (h:mm:ss or m:ss): 6:50.56
	Average shared text size (kbytes): 0
	Average unshared data size (kbytes): 0
	Average stack size (kbytes): 0
	Average total size (kbytes): 0
	Maximum resident set size (kbytes): 627120
	Average resident set size (kbytes): 0
	Major (requiring I/O) page faults: 1292
	Minor (reclaiming a frame) page faults: 61097551
	Voluntary context switches: 885976
	Involuntary context switches: 715312
	Swaps: 0
	File system inputs: 1024568
	File system outputs: 13316088
	Socket messages sent: 0
	Socket messages received: 0
	Signals delivered: 0
	Page size (bytes): 4096
	Exit status: 0

after the fix:
	Command being timed: "bitbake virtual/kernel"
	User time (seconds): 1050.97
	System time (seconds): 128.84
	Percent of CPU this job got: 434%
	Elapsed (wall clock) time (h:mm:ss or m:ss): 4:31.35
	Average shared text size (kbytes): 0
	Average unshared data size (kbytes): 0
	Average stack size (kbytes): 0
	Average total size (kbytes): 0
	Maximum resident set size (kbytes): 387148
	Average resident set size (kbytes): 0
	Major (requiring I/O) page faults: 1264
	Minor (reclaiming a frame) page faults: 52467379
	Voluntary context switches: 589830
	Involuntary context switches: 457987
	Swaps: 0
	File system inputs: 1107424
	File system outputs: 3363464
	Socket messages sent: 0
	Socket messages received: 0
	Signals delivered: 0
	Page size (bytes): 4096
	Exit status: 0


And consumed disk space decreased by 89.62%:

before the fix:
$ du -sh tmp/work/qemux86-poky-linux/linux-yocto/4.4.14+gitAUTOINC+4800a400d5_8361321fec-r0/deploy-linux-yocto/
106M

after the fix:
$ du -sh tmp/work/qemux86-poky-linux/linux-yocto/4.4.14+gitAUTOINC+86bf91f444_8361321fec-r0/deploy-linux-yocto/
11M

--
Regards,
Ed

