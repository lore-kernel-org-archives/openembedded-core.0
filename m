Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QJTMi-00033T-5l
	for openembedded-core@lists.openembedded.org;
	Mon, 09 May 2011 18:31:24 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 09 May 2011 09:28:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,341,1301900400"; d="scan'208";a="640158797"
Received: from doubt.jf.intel.com (HELO [10.7.199.57]) ([10.7.199.57])
	by orsmga002.jf.intel.com with ESMTP; 09 May 2011 09:28:06 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <201105090016.46391.leitl@fim.uni-passau.de>
References: <201105090016.46391.leitl@fim.uni-passau.de>
Date: Mon, 09 May 2011 09:28:06 -0700
Message-ID: <1304958486.18625.11.camel@doubt>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: Patch for fixing build issues with external kernel modules.
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
X-List-Received-Date: Mon, 09 May 2011 16:31:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-05-09 at 00:16 +0200, Franz Leitl wrote:
> Hi,
> 
> I've tried to get compcache kernel module building against 2.6.34 from shr-
> core but found some issues with kernel.bbclass and module.bbclass.
> 
> The kernel.bbclass deletes the .c files from scripts directory which are later 
> needed by make prepare to recreate bound.h and other files. Compcache kernel 
> module, for example, depends on bounds.h.

The bounds.h should not need to be recreated. It is created during the
build of the kernel, and since 2.6.26, the makefile knows not to remove
it.

> The module.bbclass finally needs to call "make prepare" and also set 
> KERNEL_PATH in do_install when calling oe_runmake to get everything
> installed correctly.

Since we copy over the source tree after a simple clean, make prepare
should also not be necessary:

  clean		  - Remove most generated files but keep the config and
                    enough build support to build external modules

So I'm curious about your workflow and why you are hitting these two
issues. Can you share your recipes?

>  I also added KERNELDIR as compcache's Makefile is using it and the 
> classes from classic OE had it also set.

I'm not familiar with compcache, but generally speaking we can't get in
the habit of modifying the recipe classes to support whatever variables
random external module Makefile expect. See recipes-kernel/hello-mod for
an example Makefile that builds an external module using the existing
infrastructure. You may just need a patch to the compcache Makefile for
it to work within the existing infrastructure.

> 
> Can someone please review the attached patch?
> 
> 
> Regards,
> Franz
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel



