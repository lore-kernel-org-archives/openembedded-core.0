Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QOfOB-0007pO-3N
	for openembedded-core@lists.openembedded.org;
	Tue, 24 May 2011 02:22:23 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 23 May 2011 17:19:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,259,1304319600"; 
   d="scan'208";a="6483379"
Received: from unknown (HELO [10.255.12.150]) ([10.255.12.150])
	by fmsmga002.fm.intel.com with ESMTP; 23 May 2011 17:19:11 -0700
Message-ID: <4DDAF97F.30107@linux.intel.com>
Date: Mon, 23 May 2011 17:19:11 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <201105090016.46391.leitl@fim.uni-passau.de>	<4DC8543F.3090501@linux.intel.com>	<201105100340.04862.leitl@fim.uni-passau.de>
	<201105100356.05227.leitl@fim.uni-passau.de>
	<4DDAEFA8.2090304@linux.intel.com>
In-Reply-To: <4DDAEFA8.2090304@linux.intel.com>
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
X-List-Received-Date: Tue, 24 May 2011 00:22:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 05/23/2011 04:37 PM, Darren Hart wrote:
> 
> 
> On 05/09/2011 06:56 PM, Franz Leitl wrote:
>> Hi,
>>
>> Am Dienstag 10 Mai 2011, 03:40:04 schrieb Franz Leitl:
>>> Am Montag 09 Mai 2011, 22:53:19 schrieben Sie:
>>>> The kernel should not remove bounds.h, that is documented in the
>>>> Makefile. If it does, it's a bug.
>>>
>>> After executing "bitbake -f -c compile virtual/kernel"  I get bounds.h in
>>> "${S}/includes/generated/".
>>> Seems as if both
>>>     oe_runmake -C $kerneldir CC="${KERNEL_CC}" LD="${KERNEL_LD}" clean
>>> and
>>>     make -C $kerneldir _mrproper_scripts
>>> in kernel.bbclass are to blame for removing bounds.h from
>>> "$kerneldir/includes/generated/".
>>> I tested it twice. Only in case both lines are commented out bounds.h stays
>>> in "$kerneldir/includes/generated/"
>> I still would like to know, what to do next.
>>
>>> What to do with module.bbclass not setting KERNEL_PATH in
>>> module_do_install? My Makefile relies on it, if KERNEL_PATH is not set it
>>> will use
>>> "/lib/modules/$(shell uname -r)/build" instead. But uname returns the
>>> host's kernel version.
>>> Is there any reason why oe_runmake in module_do_compile sets
>>> "KERNEL_PATH=${STAGING_KERNEL_DIR}" while in module_do_install it doesn't?
>>> Should I overwrite the do_install in my recipe or should module.bbclass be
>>> fixed?
>> Ok, I just remembered the hint to recipes-kernel/hello-mod/files/Makefile. Works 
>> as KERNEL_SRC is also set to ${STAGING_KERNEL_DIR}. But it does not explain what 
>> the real difference between KERNEL_SRC and KERNEL_PATH is, as both are set to 
>> the same value and why does module_do_install not set KERNEL_PATH but 
>> module_do_compile does?
> 
> I took a look at the poky.git meta classes (oe-core) and the history of
> the oe.git version of module.bbclass from which this was derived several
> years back. The current OE version sets both KERNEL_SRC and KERNEL_PATH.
> I don't know of any need for KERNEL_PATH - or more specifically, I don't
> see a need for both. In my experience KERNEL_SRC is more commonly used.
> It is a more explicit name than the _PATH variation as it is clear it
> points to the sources.
> 
> I'll have a look at how OE and oe-core have diverged, but unless I find
> something unexpected, I would like to remove KERNEL_PATH from the
> compile step as well.
> 


After reviewing the changes that have gone in to oe since the version I
see in oe-core, I think I need to change my thinking on this. There is
precedent for adding commonly used KERNEL_SRC variants to the
module.bbclass. It appears that a refresh of the module infrastructure
is required. Adding to my todo list:

http://bugzilla.yoctoproject.org/show_bug.cgi?id=1094


> --
> Darren
> 
>>
>>
>> Regards,
>> Franz
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> 

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


