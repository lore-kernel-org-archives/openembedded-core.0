Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1SgPlo-0005IO-Cb
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Jun 2012 02:24:40 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 17 Jun 2012 17:13:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="157461970"
Received: from unknown (HELO [10.255.12.164]) ([10.255.12.164])
	by azsmga001.ch.intel.com with ESMTP; 17 Jun 2012 17:13:55 -0700
Message-ID: <1339978428.28877.1.camel@trz-ThinkPad-T420>
From: Tom Zanussi <tom.zanussi@intel.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Sun, 17 Jun 2012 19:13:48 -0500
In-Reply-To: <cover.1339791495.git.bruce.ashfield@windriver.com>
References: <cover.1339791495.git.bruce.ashfield@windriver.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org, liang.li@windriver.com,
	saul.wold@intel.com
Subject: Re: [PATCH 0/2] perf: make perf a standlone recipe
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
X-List-Received-Date: Mon, 18 Jun 2012 00:24:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-06-15 at 16:23 -0400, Bruce Ashfield wrote:
> Richard/Saul,
> 
> We've wanted to do this for some time, and now have finally split
> out perf from being a sub-part of the kernel packages into a
> standalone package that is built out of the kernel sources.
> 
> I've built and tested this by adding task-core-tools-profile to
> my IMAGE_INSTALL, and perf behaves just as it did before.  I've
> also tested this on my oe-core checkout/repo, and it works fine
> there as well (but I'm using my easier to access contrib
> branch for now).
> 

Built and worked fine here on real hardware (crownbay) too...

Tested-by: Tom Zanussi <tom.zanussi@intel.com>



Tom

> There's additional work that can be done more easily once this
> is split, so please consider this for inclusion, but I'd like
> to keep this initial version as an exact functional match as
> what was previously in place.
> 
> I've removed the old linux-tools.inc and updated any kernel 
> recipes that I know about that have references to it. If there
> are other dependent recipes, they'll need to be updated.
> 
> From the patch itself:
> 
>   perf has been coupled to the kernel packages via kernel.bbclass.
>   While maintaining the build of perf out of the kernel source tree
>   is desired the package coupling has proved to be awkward in
>   several situations such as:
> 
>      - when a kernel recipe doesn't want to build/provide perf
>      - when licensing of dependencies would prohibit perf and hence
>        the kernel from being built.
> 
>   To solve some of these problems, this recipe is the extraction of
>   the linux-tools.inc provided perf compilation into a standalone
>   perf recipe that builds out of the kernel source, but is otherwise
>   independent.
> 
>   No new functionality is provided above what the linux-tools.inc
>   variant provided, but the separate recipe provides baseline for
>   adding new functionality.
> 
> This addresses [YOCTO #1552]
> 
> cc: Tom Zanussi <tom.zanussi@intel.com>
> cc: Liang Li <liang.li@windriver.com>
> 
> Cheers,
> 
> Bruce
> 
> The following changes since commit 4bb7ef94fca392bcd389ed7069280c238f8fe094:
> 
>   directfb: added missing Upstream-status (2012-06-15 15:44:39 +0100)
> 
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib zedd/perf
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/perf
> 
> Bruce Ashfield (1):
>   recipes-kernel: remove linux-tools.inc
> 
> Liang Li (1):
>   recipes-kernel: make perf a standalone package
> 
>  meta/classes/kernel.bbclass                     |    7 +---
>  meta/recipes-kernel/linux/linux-tools.inc       |   41 ------------------
>  meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb |    2 -
>  meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb |    2 -
>  meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb |    2 -
>  meta/recipes-kernel/linux/linux-yocto_3.0.bb    |    2 -
>  meta/recipes-kernel/linux/linux-yocto_3.2.bb    |    2 -
>  meta/recipes-kernel/linux/linux-yocto_3.4.bb    |    2 -
>  meta/recipes-kernel/perf/perf_3.4.bb            |   52 +++++++++++++++++++++++
>  9 files changed, 53 insertions(+), 59 deletions(-)
>  delete mode 100644 meta/recipes-kernel/linux/linux-tools.inc
>  create mode 100644 meta/recipes-kernel/perf/perf_3.4.bb
> 




