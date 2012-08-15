Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T1dLP-0005hI-Tw
	for openembedded-core@lists.linuxtogo.org;
	Wed, 15 Aug 2012 15:09:08 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 15 Aug 2012 05:57:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,773,1336374000"; d="scan'208";a="186711058"
Received: from unknown (HELO helios.localnet) ([10.252.121.76])
	by orsmga002.jf.intel.com with ESMTP; 15 Aug 2012 05:57:06 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 15 Aug 2012 13:57:05 +0100
Message-ID: <2939389.t5RQfOqV0u@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-29-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <515C1337-A61A-49A6-837A-9305749FF1DA@dominion.thruhere.net>
References: <2404459.dJBf5OQotX@helios>
	<515C1337-A61A-49A6-837A-9305749FF1DA@dominion.thruhere.net>
MIME-Version: 1.0
Cc: openembedded-core@lists.linuxtogo.org, yocto@yoctoproject.org,
	openembedded-devel@lists.linuxtogo.org
Subject: Re: [yocto] RFC: OE-Core task rework
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
X-List-Received-Date: Wed, 15 Aug 2012 13:09:08 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 15 August 2012 12:54:17 Koen Kooi wrote:
> Op 15 aug. 2012, om 11:46 heeft Paul Eggleton 
<paul.eggleton@linux.intel.com> het volgende geschreven:
> > 2) Look at the existing tasks and:
> > * evaluate their usefulness
> > * remove any that are obsolete
> > * adjust existing contents if needed
> > * look for useful groups of packages that might be added
> > 
> > We need to pay particular attention to task-core-boot and task-base as
> > these are pulled in by default in any image that inherits from
> > core-image.bbclass - if these are not generally working for people that
> > are creating their own images, we need to change them such that they are.
> 
> Have a look at task-boot and task-basic in meta-oe:
> https://github.com/openembedded/meta-oe/tree/master/meta-oe/recipes-core/ta
> sks

OK, I've taken the opportunity to summarise the tasks in meta-oe on the 
following page:

 http://www.openembedded.org/wiki/Meta-oe_tasks

meta-oe's task-basic indeed contains much less than task-base; it provides an 
alternative (and possibly simpler) means of selecting between ssh or dropbear, 
although it prevents it being an image-level decision if that's something 
people care about. I'm not convinced it's appropriate to unconditionally 
install avahi, htop and cpufrequtils though - those look distro-specific to me.

For meta-oe's task-boot, it doesn't seem all that different from task-core-boot 
with the exception that task-core-boot imposes modutils-initscripts (should 
probably be fixed), and that task-boot mandates that the kernel be installed 
which is not always needed depending on how the bootloader works on whatever 
machine is being built for - although kernel.bbclass seems to indicate that 
currently the machine is supposed to influence this by setting RDEPENDS_kernel-
base which seems a little backwards to me.

I'd like to hear from other users of these tasks (Martin?)

> My pet peeve is the bloat oe-core forces onto qemu* builds in the name of
> "our testing team needs it!!!". Why am I forced to build an nfs server and
> distcc when setting MACHINE=qemusomething?

If you're referring to qemu-config (which depends on distcc, task-core-nfs-
server, oprofileui-server, rsync and bash) it's important to note that it only 
gets enabled for qemu* machines by the poky distro config via POKYQEMUDEPS, so 
this is not being used by OE-Core - in fact nothing in OE-Core refers to qemu-
config at all. I still have an open bug to fix this (#1690), and I agree it's 
egregious, but it's a Poky issue, not an OE-Core one. For the record, the 
reason for including them is not "our testing team needs it!!!" - it was the 
assumption made a long time ago that these things would be generally useful 
for development on emulated targets. Whether or not that assumption is still 
correct is another issue.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


