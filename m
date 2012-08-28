Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T6G49-0006JU-EB
	for openembedded-core@lists.linuxtogo.org;
	Tue, 28 Aug 2012 09:18:25 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 28 Aug 2012 00:05:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,325,1344236400"; d="scan'208";a="192167854"
Received: from unknown (HELO helios.localnet) ([10.252.121.139])
	by orsmga002.jf.intel.com with ESMTP; 28 Aug 2012 00:05:05 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.linuxtogo.org
Date: Tue, 28 Aug 2012 08:05:03 +0100
Message-ID: <2381126.z6HOKOkkxB@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-29-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <2404459.dJBf5OQotX@helios>
References: <2404459.dJBf5OQotX@helios>
MIME-Version: 1.0
Cc: yocto@yoctoproject.org, openembedded-devel@lists.linuxtogo.org
Subject: Re: RFC: OE-Core task rework
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 28 Aug 2012 07:18:25 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 15 August 2012 10:46:49 Paul Eggleton wrote:
> Hi all,
> 
> There have been a few requests to review the task recipes (i.e. package
> groups) provided by OE-Core, and indeed these have not really been looked at
> seriously since OE-Core was created. Ideally I think we want them to be
> useful to a wide audience and provide useful units of functionality that
> can be added to an image without the person doing the selection having to
> manually select too many individual packages. Imagine presenting the list
> of tasks to someone in a UI for assembling images (such as Hob or
> Narcissus) and you can start to see that we have some work to do in this
> area.
> 
> I know various distros and users of OE-Core have created their own tasks or
> resurrected tasks from OE-Classic, and this is an opportunity to perhaps
> look at bringing some of these (or at least, parts of them) into the core.
> It is true that tasks will often be an expression of distro policy, and we
> also can't have any tasks in OE-Core that refer to packages that don't
> exist in OE- Core; thus distros will always be extending the base tasks or
> adding their own - and that's fine. However, with some thought I believe we
> can come up with a set of tasks that are generally useful to most people
> using OE-Core.
> 
> For reference, I've compiled a list on the wiki of the current tasks in OE-
> Core with links to the recipes and some notes:
> 
>   http://www.openembedded.org/wiki/OE-Core_Task_Rework
> 
> Some of the things I think we ought to consider/address as part of this
> exercise:
> 
> 1) Do we rename "task" to something a little more understandable to the
> uninitiated, such as "package group"? The word "task" is already used in a
> much more natural sense within bitbake as a unit of work. Historically I
> believe we picked up this term from Debian but I'm not aware of significant
> use by other mainstream distributions.
> 
> 2) Look at the existing tasks and:
>  * evaluate their usefulness
>  * remove any that are obsolete
>  * adjust existing contents if needed
>  * look for useful groups of packages that might be added
> 
>  We need to pay particular attention to task-core-boot and task-base as
> these are pulled in by default in any image that inherits from
> core-image.bbclass - if these are not generally working for people that are
> creating their own images, we need to change them such that they are.
> 
> 3) Ensure all task recipes follow reasonable patterns:
>  *  Fix recipe DESCRIPTIONs to make sense (and not contain Poky references)
>  *  Ensure all individual packages have a decent SUMMARY/DESCRIPTION
>  *  Try to make each task have a reasonable name - there are some current
> uses of "core" and "base" that don't actually convey any meaning; LSB
> specific tasks should be named as such, etc.
>  *  Make all tasks inherit task.bbclass so that they get proper dbg/dev
> packages and any other common task functionality
> 
> 4) Consider the usefulness of the existing PACKAGE_GROUP_ structure which
> converts some IMAGE_FEATURES into the addition of tasks to be installed (see
> classes/core-image.bbclass). At the very least we should probably rename
> this if we rename tasks to package groups, and there's a question as to how
> IMAGE_FEATURES scales - should every task be represented in there or only a
> select list? Would we be better off not trying to bring any tasks in via
> IMAGE_FEATURES at all and mostly leave that to control post-processing
> (e.g. package-management, debug-tweaks, etc.)?
> 
> Please reply with your thoughts. Once we've come to a consensus on the
> things we want to do (allowing plenty of time for discussion), I'll look at
> putting together a set of patches that makes the appropriate changes.

So, any further thoughts on this one?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


