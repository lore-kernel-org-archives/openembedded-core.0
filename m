Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1T3Z2F-00068R-4K
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Aug 2012 22:57:19 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q7KKjExQ011609
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 20 Aug 2012 13:45:15 -0700 (PDT)
Received: from msp-dhcp10.wrs.com (172.25.34.10) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Mon, 20 Aug 2012 13:45:15 -0700
Message-ID: <5032A1D3.8090600@windriver.com>
Date: Mon, 20 Aug 2012 15:45:07 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
MIME-Version: 1.0
To: <yocto@yoctoproject.org>, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	<openembedded-devel@lists.openembedded.org>
References: <2404459.dJBf5OQotX@helios>
In-Reply-To: <2404459.dJBf5OQotX@helios>
Subject: Re: [yocto] RFC: OE-Core task rework
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
X-List-Received-Date: Mon, 20 Aug 2012 20:57:19 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

[resend, I had the original mail rejected by the oe list serves as being 
undeliverable.]

On 8/15/12 4:46 AM, Paul Eggleton wrote:
> Hi all,
>
> There have been a few requests to review the task recipes (i.e. package
> groups) provided by OE-Core, and indeed these have not really been looked at
> seriously since OE-Core was created. Ideally I think we want them to be useful
> to a wide audience and provide useful units of functionality that can be added
> to an image without the person doing the selection having to manually select
> too many individual packages. Imagine presenting the list of tasks to someone
> in a UI for assembling images (such as Hob or Narcissus) and you can start to
> see that we have some work to do in this area.
>
> I know various distros and users of OE-Core have created their own tasks or
> resurrected tasks from OE-Classic, and this is an opportunity to perhaps look
> at bringing some of these (or at least, parts of them) into the core. It is
> true that tasks will often be an expression of distro policy, and we also
> can't have any tasks in OE-Core that refer to packages that don't exist in OE-
> Core; thus distros will always be extending the base tasks or adding their own
> - and that's fine. However, with some thought I believe we can come up with a
> set of tasks that are generally useful to most people using OE-Core.
>
> For reference, I've compiled a list on the wiki of the current tasks in OE-
> Core with links to the recipes and some notes:
>
>    http://www.openembedded.org/wiki/OE-Core_Task_Rework
>
> Some of the things I think we ought to consider/address as part of this
> exercise:
>
> 1) Do we rename "task" to something a little more understandable to the
> uninitiated, such as "package group"? The word "task" is already used in a
> much more natural sense within bitbake as a unit of work. Historically I
> believe we picked up this term from Debian but I'm not aware of significant use
> by other mainstream distributions.

"group" or "packagegroup" or "package-group" is my suggestion for the existing 
'task' recipes.  From what I've seen, it should be a rename opportunity -- we 
can even provide/rprovide the old names....

> 2) Look at the existing tasks and:
>   * evaluate their usefulness
>   * remove any that are obsolete
>   * adjust existing contents if needed
>   * look for useful groups of packages that might be added
>
>   We need to pay particular attention to task-core-boot and task-base as these
> are pulled in by default in any image that inherits from core-image.bbclass -
> if these are not generally working for people that are creating their own
> images, we need to change them such that they are.

During the pre-oe-core Yocto Project development, a design was generated to 
roughly group the packages into functional areas.  For the most part, this 
design (as well as legacy elements) still exist.

I think the boot, base and others need to be evaluated for usefulness... but my 
feeling is most of them are close to being correct.

The original design attempted to group things into functionality, so that OE 
could be an "additive" distribution.  I.e., you don't start with a big blob of 
packages and remove them as necessary, but instead you start with small 
functional blocks and put them together to construct a system.  The tasks seemed 
to be the logical blocks, and the contents of these blocks were based on the 
early design.

Very roughly speaking the early design was:

filesystem
|        \
libc    libstdcxx
|           \
small cli    \
(busybox)     \
|              \
basic commands  python -- perl
|                 |         |
initscripts       |         |
multiuser         |         |
system services --+---------+
|
LSB functionality

(Lines indicate implicit dependencies)

The goal was that if you include a specific group, such as "multiuser" support, 
you would get all of the recipes necessary to enable multiuser support on the 
system.  I think this is a reasonable theory to consider when evaluating the 
existing groupings.

> 3) Ensure all task recipes follow reasonable patterns:
>   *  Fix recipe DESCRIPTIONs to make sense (and not contain Poky references)
>   *  Ensure all individual packages have a decent SUMMARY/DESCRIPTION
>   *  Try to make each task have a reasonable name - there are some current uses
> of "core" and "base" that don't actually convey any meaning; LSB specific tasks
> should be named as such, etc.

Yup, there is a logical grouping for the lsb specific tasks, as for others.  The 
naming needs to be made clear as to why it's there, and what it represents. Same 
with the summary and descriptions -- they should list the functionality provided 
by this group of components.

>   *  Make all tasks inherit task.bbclass so that they get proper dbg/dev
> packages and any other common task functionality
>
> 4) Consider the usefulness of the existing PACKAGE_GROUP_ structure which
> converts some IMAGE_FEATURES into the addition of tasks to be installed (see
> classes/core-image.bbclass). At the very least we should probably rename this
> if we rename tasks to package groups, and there's a question as to how
> IMAGE_FEATURES scales - should every task be represented in there or only a
> select list? Would we be better off not trying to bring any tasks in via
> IMAGE_FEATURES at all and mostly leave that to control post-processing (e.g.
> package-management, debug-tweaks, etc.)?

I'd certainly prefer that images were limited to selecting software from task 
(group) recipes only, and not providing their own.  An image should be able to 
change the selection based on an "image feature" or similar configuration, but 
the underlying tasks/groups, recipes, etc should all be 'generic' to a given 
distribution configuration.

I think if you go through the images today, a lot of that stuff is either old, 
or could be simplified by creating appropriate tasks/groups.

--Mark

> Please reply with your thoughts. Once we've come to a consensus on the things
> we want to do (allowing plenty of time for discussion), I'll look at putting
> together a set of patches that makes the appropriate changes.
>
> Thanks,
> Paul
>



