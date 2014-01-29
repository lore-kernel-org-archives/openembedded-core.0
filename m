Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id C923E6E2D8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jan 2014 11:52:53 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 29 Jan 2014 03:52:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,741,1384329600"; d="scan'208";a="446383647"
Received: from garethcl-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.74])
	by orsmga001.jf.intel.com with ESMTP; 29 Jan 2014 03:52:45 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Steffen Sledz <sledz@dresearch-fe.de>
Date: Wed, 29 Jan 2014 11:52:44 +0000
Message-ID: <3453178.7rjKagprWh@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.11.5 (Linux/3.12.8-300.fc20.x86_64; KDE/4.11.5; x86_64; ; )
In-Reply-To: <52E8EA6A.2020803@dresearch-fe.de>
References: <1390833588.17424.254.camel@ted> <1390993195.24655.56.camel@ted>
	<52E8EA6A.2020803@dresearch-fe.de>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] local.conf.sample: Add automatic defaults for BB_NUMBER_THREADS and PARALLEL_MAKE
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
X-List-Received-Date: Wed, 29 Jan 2014 11:52:53 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 29 January 2014 12:47:54 Steffen Sledz wrote:
> On 29.01.2014 11:59, Richard Purdie wrote:
> > On Wed, 2014-01-29 at 11:14 +0100, Steffen Sledz wrote:
> >> On 27.01.2014 15:39, Richard Purdie wrote:
> >>> Its rather sad that people don't appear to read local.conf and then
> >>> complain about slow builds when they're just using a single thread.
> >>> Most systems have more than one core now so we might as well use a more
> >>> automatic default for these values. This may lead to better experiences
> >>> for new users.
> >>> 
> >>> [YOCTO #2528]
> >>> 
> >>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> >>> ---
> >>> diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
> >>> index 71856b8..36d33e1 100644
> >>> --- a/meta/conf/local.conf.sample
> >>> +++ b/meta/conf/local.conf.sample
> >>> @@ -18,12 +18,18 @@
> >>> 
> >>>  # option determines how many tasks bitbake should run in parallel:
> >>>  #
> >>>  #BB_NUMBER_THREADS ?= "4"
> >>> 
> >>> +#
> >>> +# Default to setting automatically based on cpu count
> >>> +BB_NUMBER_THREADS ?= "${@oe.utils.cpu_count()}"
> >>> 
> >>>  #
> >>>  # The second option controls how many processes make should run in
> >>>  parallel when # running compile tasks:
> >>>  #
> >>>  #PARALLEL_MAKE ?= "-j 4"
> >>>  #
> >>> 
> >>> +# Default to setting automatically based on cpu count
> >>> +PARALLEL_MAKE ?= "-j ${@oe.utils.cpu_count()}"
> >>> +#
> >>> 
> >>>  # For a quad-core machine, BB_NUMBER_THREADS = "4", PARALLEL_MAKE = "-j
> >>>  4" would # be appropriate for example.
> >> 
> >> On our Fedora-18 build host this change leads to the following exception.
> >> :(> 
> > Do you have:
> > 
> > http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=721773072da08cf0f5e12
> > 06961ada3083b6722b4
> No.
> 
> But now it becomes really interesting. As mentioned before it works well on
> our openSUSE-13.1 build host (without this commit)???

Are you sure you're not overriding BB_NUMBER_THREADS / PARALLEL_MAKE on the 
machine where it's "working"? You can use bitbake -e | less (variable history) 
to be sure.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

