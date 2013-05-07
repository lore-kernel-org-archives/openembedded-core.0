Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1UZkw9-00069S-4q
	for openembedded-core@lists.openembedded.org;
	Tue, 07 May 2013 18:40:22 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 07 May 2013 09:21:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,629,1363158000"; d="scan'208";a="309690319"
Received: from envy2.jf.intel.com (HELO envy2.home) ([10.7.199.54])
	by orsmga001.jf.intel.com with ESMTP; 07 May 2013 09:21:44 -0700
Message-ID: <51892A18.4020508@linux.intel.com>
Date: Tue, 07 May 2013 09:21:44 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130110 Thunderbird/17.0.2
MIME-Version: 1.0
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <1367941787-8508-1-git-send-email-ross.burton@intel.com>
	<CADkTA4Oq_2OuhPVjBuowpkyoLMrwnPZyKmGxAwTLABQo7wzfiw@mail.gmail.com>
In-Reply-To: <CADkTA4Oq_2OuhPVjBuowpkyoLMrwnPZyKmGxAwTLABQo7wzfiw@mail.gmail.com>
X-Enigmail-Version: 1.5.1
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qemux86: disable paravirt guest, causes test failures
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
X-List-Received-Date: Tue, 07 May 2013 16:40:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 05/07/2013 09:04 AM, Bruce Ashfield wrote:
> On Tue, May 7, 2013 at 11:49 AM, Ross Burton <ross.burton@intel.com> wrote:
>> The shutdown sanity test that we previously saw on qemux86-64 in 2.6.37 have
>> started to re-appear reproducably on qemux86 in 3.4 in the Danny series.  Until
>> this can be root-caused and fixed in the kernel, disable paravirtualisation
>> across all kernels and all qemu machines.
> 
> Make sure to cc me on linux-yocto patches, I noticed this by chance.
> 
>>
>> [ YOCTO #4196 ]
>>
>> Signed-off-by: Ross Burton <ross.burton@intel.com>
>> ---
>>  meta/recipes-kernel/linux/linux-yocto-dev.bb    |    1 -
>>  meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb |    2 +-
>>  meta/recipes-kernel/linux/linux-yocto_3.4.bb    |    1 -
>>  meta/recipes-kernel/linux/linux-yocto_3.8.bb    |    2 +-
>>  4 files changed, 2 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
>> index fdea085..fcf37cc 100644
>> --- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
>> +++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
>> @@ -44,5 +44,4 @@ COMPATIBLE_MACHINE = "(qemuarm|qemux86|qemuppc|qemumips|qemux86-64)"
>>  KERNEL_FEATURES_append = " features/netfilter/netfilter.scc"
>>  KERNEL_FEATURES_append_qemux86=" cfg/sound.scc"
>>  KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc"
>> -KERNEL_FEATURES_append_qemux86=" cfg/paravirt_kvm.scc"
> 
> I'd rather keep this on for the -dev kernel, it is development for a reason and
> we should leave this on as a leading edge feature.

Agreed

> 
> Bruce
> 
>>  KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
>> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb
>> index 980229c..38e35db 100644
>> --- a/meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb
>> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb
>> @@ -25,6 +25,6 @@ COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuarm)"
>>  # Functionality flags
>>  KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc features/taskstats/taskstats.scc"
>>  KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
>> -KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
>> +KERNEL_FEATURES_append_qemux86=" cfg/sound.scc"
>>  KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc"
>>  KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
>> diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
>> index b81b9ac..18d665a 100644
>> --- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
>> +++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
>> @@ -26,5 +26,4 @@ COMPATIBLE_MACHINE = "qemuarm|qemux86|qemuppc|qemumips|qemux86-64"
>>  KERNEL_FEATURES_append = " features/netfilter/netfilter.scc"
>>  KERNEL_FEATURES_append_qemux86=" cfg/sound.scc"
>>  KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc"
>> -KERNEL_FEATURES_append_qemux86=" cfg/paravirt_kvm.scc"
>>  KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
>> diff --git a/meta/recipes-kernel/linux/linux-yocto_3.8.bb b/meta/recipes-kernel/linux/linux-yocto_3.8.bb
>> index 4bf6bf4..75e2dbb 100644
>> --- a/meta/recipes-kernel/linux/linux-yocto_3.8.bb
>> +++ b/meta/recipes-kernel/linux/linux-yocto_3.8.bb
>> @@ -25,6 +25,6 @@ COMPATIBLE_MACHINE = "qemuarm|qemux86|qemuppc|qemumips|qemux86-64"
>>  # Functionality flags
>>  KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
>>  KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
>> -KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
>> +KERNEL_FEATURES_append_qemux86=" cfg/sound.scc"


Have we seen the failure on 3.8? Or only on 3.4?


-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Technical Lead - Linux Kernel


