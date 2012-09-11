Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TBT3M-0001xf-96 for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 18:11:08 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8BFwAvv011153;
	Tue, 11 Sep 2012 16:58:10 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 10146-09; Tue, 11 Sep 2012 16:58:06 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8BFvxdc011147
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Tue, 11 Sep 2012 16:58:00 +0100
Message-ID: <1347379081.2122.48.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Saul Wold <saul.wold@intel.com>
Date: Tue, 11 Sep 2012 16:58:01 +0100
In-Reply-To: <504F5B9A.7070501@intel.com>
References: <cover.1347376358.git.bruce.ashfield@windriver.com>
	<ea700a4897d82d27177a0583f01b6432ac7ec379.1347376358.git.bruce.ashfield@windriver.com>
	<504F59B1.60308@intel.com> <504F5B17.5070500@windriver.com>
	<504F5B9A.7070501@intel.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] linux-yocto/3.4: add x32 configuration fragment and tuning hook
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
X-List-Received-Date: Tue, 11 Sep 2012 16:11:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-09-11 at 08:41 -0700, Saul Wold wrote:
> On 09/11/2012 08:39 AM, Bruce Ashfield wrote:
> > On 12-09-11 11:33 AM, Saul Wold wrote:
> >> On 09/11/2012 08:17 AM, Bruce Ashfield wrote:
> >>> When x32 is the tuning for a x86 MACHINE, the kernel should also have
> >>> CONFIG_X86_X32=y.
> >>>
> >>> This can be accomplished by adding the x32 configuraion fragment to the
> >>> KERNEL_FEATURES when x32 is the tuning for a given machine.
> >>>
> >>> cc: Saul Wold <sgw@linux.intel.com>
> >>> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> >>> ---
> >>> meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb | 3 ++-
> >>> meta/recipes-kernel/linux/linux-yocto_3.4.bb | 3 ++-
> >>> 2 files changed, 4 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
> >>> b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
> >>> index 4fd3845..156fb93 100644
> >>> --- a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
> >>> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
> >>> @@ -10,7 +10,7 @@ KMETA = "meta"
> >>>
> >>> SRCREV_machine ?= "a35693b1287c0e50cdca33a1b95af0ff48b43cd0"
> >>> SRCREV_machine_qemuppc ?= "85a1190530cb5749f5f831670976b163438dc301"
> >>> -SRCREV_meta ?= "d9d5fc63d8b38705036e946ea77d971d95de11ad"
> >>> +SRCREV_meta ?= "e0374ce012e7e6fc8e5bb8b957addb0478950898"
> >>>
> >>> PR = "${INC_PR}.0"
> >>> PV = "${LINUX_VERSION}+git${SRCPV}"
> >>> @@ -27,3 +27,4 @@ KERNEL_FEATURES_append = " features/netfilter"
> >>> KERNEL_FEATURES_append = " features/taskstats"
> >>> KERNEL_FEATURES_append_qemux86 = " cfg/sound"
> >>> KERNEL_FEATURES_append_qemux86-64 = " cfg/sound"
> >>> +KERNEL_FEATURES_append_x32 = " cfg/x32"
> >>
> >> Scratch this bit and below, as I think I will use the other mechanism
> >> you talked about to go from a .conf file.
> >
> > Works for me. The meta change is staged and pushed out, I'll update this
> > patch to not have the KERNEL_FEATURES portion.
> >
> Thanks, see my other email to RP, since x32 is a feature that any x86-64 
> machine might want to enable based on the DEFAULTTUNE it makes more 
> sense to be in the machine config includes.

No, it doesn't.

What we need here is:

-KERNEL_FEATURES_append = " features/taskstats"
+KERNEL_FEATURES_append = " features/taskstats ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32", "" ,d)}"

which is simple, effective and to the point. If we start needing lots of
these, we can look at an x32 override but right now I don't see the
need.

Cheers,

Richard



