Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id A26BC71A76
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Mar 2017 14:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1489762483; x=1521298483;
	h=date:from:to:cc:subject:message-id:reply-to:references:
	mime-version:in-reply-to;
	bh=rtRiKG5hIBe89bZIrVTCkDQcf7APy/K3kbHfZBwPnnM=;
	b=rbuITXOqRTgnCAkNBPv1fQf/7gW+B+YthB77E/uuQZti7zkSrf8xqSWN
	ERLecbng/gYatJTZEMM0PZ2EIn1o+g==;
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Mar 2017 07:54:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,177,1486454400"; d="scan'208";a="1109566808"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 17 Mar 2017 07:54:41 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id BA0612C8001;
	Fri, 17 Mar 2017 07:54:35 -0700 (PDT)
Date: Fri, 17 Mar 2017 16:40:27 +0200
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Maciej Borzecki <maciej.borzecki@rndity.com>
Message-ID: <20170317144027.GA22297@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <cover.1489668133.git.maciej.borzecki@rndity.com>
MIME-Version: 1.0
In-Reply-To: <cover.1489668133.git.maciej.borzecki@rndity.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Maciek Borzecki <maciek.borzecki@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3 0/5] wic: selftest: enhancements for non-x86 MACHINE support & fixed-size tests
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
X-List-Received-Date: Fri, 17 Mar 2017 14:54:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Maciej,

Thank you for the patchset!

Can you fix these pylint regressions?

C: 49, 0: Exactly one space required after comma
    def __call__(self,f):
                     ^ (bad-whitespace)
C: 53, 0: No space allowed before :
            if self.archs and arch not in self.archs :
                                                     ^ (bad-whitespace)
C: 40, 0: Missing function docstring (missing-docstring)
C: 44, 0: Invalid class name "onlyForArch" (invalid-name)
C: 44, 0: Missing class docstring (missing-docstring)
C: 49, 4: Invalid argument name "f" (invalid-name)
C: 51, 8: Missing function docstring (missing-docstring)
R: 44, 0: Too few public methods (0/2) (too-few-public-methods)
C:422,12: Missing function docstring (missing-docstring)
C:628,69: Invalid variable name "tf" (invalid-name)
R:623, 4: Method could be a function (no-self-use)
R: 60, 0: Too many public methods (50/20) (too-many-public-methods)


Is it possible to use functools.wraps to make onlyforarc decorator a function?
would be nice to get rid of CamelCase in its name.

Other than this the patchset looks great! Thank you!

On Thu, Mar 16, 2017 at 01:44:31PM +0100, Maciej Borzecki wrote:
> A series with enhancements and new test cases for wic selftest. The
> enhancements allow for running wic selftest for non-x86 MACHINE, such as
> qemuarm (the whole series was verified on qemux86-64 and qemuarm).
> 
> The first patch adds a machine independent kickstart file - wictestdisk.
> Most of test cases build a disk image using one of the kickstart files
> shipped in Poky (mostly directdisk. These are usually x86 oriented due
> to use of syslinux and cannot be used when running with non-x86
> compatible MACHINE. On the other hand, the image built during tests does
> not need to be bootable (with exception of TCs that verify if the image
> is indeed bootable).
> 
> Patch 2 introduces wictestdisk in test cases where its use is possible.
> 
> Patch 3 adds onlyForArch() convenience decorator and applies it to test
> cases where x86 specific image must be used. In the end, only 13 TCs are
> skipped on qemuarm.
> 
> Patch 4 removes some assumptions about kernel image type.
> 
> Patch 5 adds tests for --fixed-size partition flags
> 
> Maciej Borzecki (5):
>   selftest: wictestdisk: machine agnostic WKS for use with selftest
>   selftest: wic: replace directdisk with wictestdisk where possible
>   wic: selftest: avoid COMPATIBLE_HOST issues
>   wic: selftest: do not assume bzImage kernel image
>   wic: selftest: add tests for --fixed-size partition flags
> 
>  meta-selftest/wic/wictestdisk.wks |   7 ++
>  meta/lib/oeqa/selftest/wic.py     | 167 ++++++++++++++++++++++++++++++--------
>  2 files changed, 140 insertions(+), 34 deletions(-)
>  create mode 100644 meta-selftest/wic/wictestdisk.wks
> 
> -- 
> 2.9.3
> 

-- 
--
Regards,
Ed

