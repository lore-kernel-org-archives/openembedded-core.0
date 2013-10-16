Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id B0FE960D74
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2013 16:48:50 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 16 Oct 2013 09:48:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,508,1378882800"; d="scan'208";a="412031968"
Received: from unknown (HELO [10.255.15.253]) ([10.255.15.253])
	by fmsmga001.fm.intel.com with ESMTP; 16 Oct 2013 09:48:01 -0700
Message-ID: <525EC341.9080407@linux.intel.com>
Date: Wed, 16 Oct 2013 09:48:01 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130923 Thunderbird/17.0.9
MIME-Version: 1.0
To: Peter Seebach <peter.seebach@windriver.com>
References: <cover.1381435139.git.peter.seebach@windriver.com>
In-Reply-To: <cover.1381435139.git.peter.seebach@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] Use alternatives for all of binutils instead of -symlinks
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
X-List-Received-Date: Wed, 16 Oct 2013 16:48:51 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


During MUT builds, we saw a failure with the toolchain


| Computing transaction...error: Can't install 
binutils-cross-canadian-arm-2.23.2-r4@i686_nativesdk: no package 
provides update-alternatives-cworth
|

Can be seen all architectures.


Sau!



On 10/10/2013 01:06 PM, Peter Seebach wrote:
> The original complaint that got me started on this was that someone
> was using binutils on a target, and didn't have an ld command, so they
> asked for it. We added binutils-symlinks, and that seemed to work, but
> eventually we ran into a problem because "ar" and "strings" weren't
> showing up.
>
> After some asking about as to why ar and strings might be omitted from
> binutils, we concluded that it was probably because they were using
> the alternatives mechanism. In a local branch, we experimented for a while
> with just using that instead of the -symlinks package, and found that
> it was overall better-behaved; in particular, it produces the desireable
> result that you don't have to know about or add a "-symlinks" package
> to use the utilities in the common case where you just install a package
> and expect its binaries to show up. It also eliminates the odd special
> case difference between ar/strings (which can be provided by busybox)
> and the other utilities.
>
> This is implemented as two patches. The first switches to using the
> alternatives mechanism, but leaves the alternatives in the -symlinks
> package rather than in the base package. The second moves them into
> the base package, and adds an RPROVIDES for the -symlinks name in
> case anyone is using it.
>
> One caveat: This can produce warnings because the "embedspu" and "ld.gold"
> binaries don't always exist, but they sometimes exist. I'm not sure whether
> there's a good way to fix that...
>
> The following changes since commit 1149b1fef8912f77d971242dfec151fff5a3aa51:
>
>    build-appliance: Update SRCREV for release (2013-10-08 16:33:25 +0100)
>
> are available in the git repository at:
>    git://git.yoctoproject.org/poky-contrib seebs/binutils-alternatives
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=seebs/binutils-alternatives
>
> Peter Seebach (2):
>    Use alternatives for the binutils-symlinks package.
>    Drop binutils-symlinks
>
>   meta/recipes-devtools/binutils/binutils.inc |   68 ++++++++++++++++-----------
>   1 files changed, 40 insertions(+), 28 deletions(-)
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

