Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1ULFNR-0004GA-Nj
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Mar 2013 17:09:07 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 28 Mar 2013 08:51:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,927,1355126400"; d="scan'208";a="277223402"
Received: from unknown (HELO [10.255.13.215]) ([10.255.13.215])
	by azsmga001.ch.intel.com with ESMTP; 28 Mar 2013 08:51:28 -0700
Message-ID: <1364485888.30283.63.camel@empanada>
From: Tom Zanussi <tom.zanussi@intel.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Thu, 28 Mar 2013 10:51:28 -0500
In-Reply-To: <51546669.1080700@windriver.com>
References: <cover.1364308617.git.bruce.ashfield@windriver.com>
	<80f242ef3516ce540a614dcb8ba3f6880cff19f2.1364308617.git.bruce.ashfield@windriver.com>
	<1364485215.30283.62.camel@empanada> <51546669.1080700@windriver.com>
X-Mailer: Evolution 3.4.1 (3.4.1-2.fc17) 
Mime-Version: 1.0
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/7] linux-yocto/3.8: introduce v3.8.4-rt1
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
X-List-Received-Date: Thu, 28 Mar 2013 16:09:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-03-28 at 11:48 -0400, Bruce Ashfield wrote:
> On 13-03-28 11:40 AM, Tom Zanussi wrote:
> > On Tue, 2013-03-26 at 07:46 -0700, Bruce Ashfield wrote:
> >> The -rt series has been updated for the 3.8 kernel. Updating the
> >> SRCREVs to reflet its import into the tree.
> >>
> >
> > Hi Bruce,
> >
> > I'm sure you already have -rt2 queued up, but just wanted to mention
> > that I'm getting this with -rt1:
> 
> Yah. Queued here. I'll make sure to push it as soon as possible.
> Thanks for the report.
> 
> If you've picked a patch, that fixes just this error in your build ..
> I can always push just the single patch to keep things moving.
> 

No hurry, I can work around it locally until then..

Thanks,

Tom

> Bruce
> 
> >
> > kernel/built-in.o: In function `register_for_each_vma':
> > linux/kernel/events/uprobes.c:772: undefined reference to
> > `percpu_down_write'
> >
> > which should be fixed by -rt2:
> >
> > http://www.spinics.net/lists/linux-rt-users/msg09617.html
> >
> >    [- per-cpu rwsem fixed for RT (required only by uprobes so far)]
> >
> > Tom
> >
> >> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> >> ---
> >>   meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb |   29 +++++++++++++++++++++++
> >>   1 file changed, 29 insertions(+)
> >>   create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb
> >>
> >> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb
> >> new file mode 100644
> >> index 0000000..97178c7
> >> --- /dev/null
> >> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb
> >> @@ -0,0 +1,29 @@
> >> +require recipes-kernel/linux/linux-yocto.inc
> >> +
> >> +KBRANCH = "standard/preempt-rt/base"
> >> +KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
> >> +
> >> +LINUX_VERSION ?= "3.8.4"
> >> +LINUX_KERNEL_TYPE = "preempt-rt"
> >> +
> >> +KMETA = "meta"
> >> +
> >> +SRCREV_machine ?= "e9b9f72029522ef142ab181e9f7f3ae71535181a"
> >> +SRCREV_machine_qemuppc ?= "7443096f0bdc6522053decd10430fc96a0ef9b94"
> >> +SRCREV_meta ?= "2a6d36e75ca0a121570a389d7bab76ec240cbfda"
> >> +
> >> +PR = "${INC_PR}.0"
> >> +PV = "${LINUX_VERSION}+git${SRCPV}"
> >> +
> >> +SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.8.git;protocol=git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
> >> +
> >> +# Omit broken machines from COMPATIBLE_MACHINE
> >> +#   qemuppc hangs at boot
> >> +#   qemumips panics at boot
> >> +COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuarm)"
> >> +
> >> +# Functionality flags
> >> +KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc features/taskstats/taskstats.scc"
> >> +KERNEL_FEATURES_append_qemux86=" ${KERNEL_EXTRA_FEATURES} cfg/sound.scc cfg/paravirt_kvm.scc"
> >> +KERNEL_FEATURES_append_qemux86-64=" ${KERNEL_EXTRA_FEATURES} cfg/sound.scc"
> >> +KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
> >
> >
> 




