Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1S8VZv-0001jX-Bp
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 12:44:15 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 16 Mar 2012 04:35:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="129716078"
Received: from unknown (HELO helios.localnet) ([10.252.123.171])
	by fmsmga001.fm.intel.com with ESMTP; 16 Mar 2012 04:35:26 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: James Limbouris <james@digitalmatter.com.au>
Date: Fri, 16 Mar 2012 11:35:23 +0000
Message-ID: <1798766.ZRL8z9Exog@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-16-generic-pae; KDE/4.8.1; i686; ; )
In-Reply-To: <840A81C1B782724A8EB52725BD519EFF33809F54@MBX20.4emm.local>
References: <840A81C1B782724A8EB52725BD519EFF33809F54@MBX20.4emm.local>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: race condition... in cp?
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
X-List-Received-Date: Fri, 16 Mar 2012 11:44:15 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 16 March 2012 06:58:40 James Limbouris wrote:
> Hi,
> 
> I got a strange error when bitbaking two images after removing some files in
> the deploy/images folder. It looks a whole lot like the cp's from the
> individual tasks were racing... I didn't know this sort of thing could
> happen.
> 
> bitbake rica-dev-image rica-release-example-image
> <...>
> NOTE: Resolving any missing task queue dependencies
> NOTE: multiple providers are available for runtime libssl
> (openssl-nativesdk, openssl) NOTE: consider defining a PREFERRED_PROVIDER
> entry to match libssl NOTE: Preparing runqueue
> NOTE: Executing SetScene Tasks
> NOTE: Executing RunQueue Tasks
> NOTE: Running task 3673 of 3692 (ID: 23,
> /home/james/oe/meta-rica5/recipes/images/rica-release-example-image.bb,
> do_rootfs) NOTE: Running task 3685 of 3692 (ID: 8,
> /home/james/oe/meta-rica5/recipes/images/rica-dev-image.bb, do_rootfs)
> NOTE: package rica-release-example-image-1.0-r0: task do_rootfs: Started
> NOTE: package rica-dev-image-1.0-r0: task do_rootfs: Started
> ERROR: Function failed: do_rootfs (see
> /home/james/oe/build/tmp-eglibc/work/rica5-rica-linux-gnueabi/rica-dev-imag
> e-1.0-r0/temp/log.do_rootfs.4011 for further information) ERROR: Logfile of
> failure stored in:
> /home/james/oe/build/tmp-eglibc/work/rica5-rica-linux-gnueabi/rica-dev-imag
> e-1.0-r0/temp/log.do_rootfs.4011
> Log data follows:
> | ERROR: Function failed: do_rootfs (see
> | /home/james/oe/build/tmp-eglibc/work/rica5-rica-linux-gnueabi/rica-dev-im
> | age-1.0-r0/temp/log.do_rootfs.4011 for further information) cp: cannot
> | create regular file
> | `/home/james/oe/build/tmp-eglibc/deploy/images/rica5/README_-_DO_NOT_DELE
> | TE_FILES_IN_THIS_DIRECTORY.txt': File exists
> NOTE: package rica-dev-image-1.0-r0: task do_rootfs: Failed
> ERROR: Task 8 (/home/james/oe/meta-rica5/recipes/images/rica-dev-image.bb,
> do_rootfs) failed with exit code '1' Waiting for 1 active tasks to finish:
> 0: rica-release-example-image-1.0-r0 do_rootfs (pid 4008)
> NOTE: package rica-release-example-image-1.0-r0: task do_rootfs: Succeeded
> NOTE: Tasks Summary: Attempted 3685 tasks of which 3683 didn't need to be
> rerun and 1 failed. pseudo: You must set the PSEUDO_PREFIX environment
> variable to run pseudo. pseudo: You must set the PSEUDO_PREFIX environment
> variable to run pseudo.
> 
> Summary: 1 task failed:
>   /home/james/oe/meta-rica5/recipes/images/rica-dev-image.bb, do_rootfs
> Summary: There was 1 ERROR message shown, returning a non-zero exit code.
> 
> Perhaps we should be using cp -f, or discarding the result?

I tried to use -n originally, but apparently that's not a standard option we 
can expect to be available everywhere so it had to be removed. I think in this 
case the easiest thing to do is just ignore the failure since if it's genuine 
it's not catastrophic and also it's highly unlikely you won't get a subsequent 
failure elsewhere. I'll prepare a fix.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


