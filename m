Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1T2VyU-0003SU-Cr
	for openembedded-core@lists.openembedded.org;
	Sat, 18 Aug 2012 01:29:06 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 17 Aug 2012 16:17:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,789,1336374000"; d="scan'208";a="182404874"
Received: from unknown (HELO envy.home) ([10.255.13.26])
	by azsmga001.ch.intel.com with ESMTP; 17 Aug 2012 16:17:05 -0700
Message-ID: <502ED07A.8000208@linux.intel.com>
Date: Fri, 17 Aug 2012 16:15:06 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: "Bodke, Kishore K" <kishore.k.bodke@intel.com>
References: <D956029D25CF204F948EA0FB515E1EE20AD5D9F3@ORSMSX105.amr.corp.intel.com>
	<502D8980.7030107@linux.intel.com>
	<D956029D25CF204F948EA0FB515E1EE20AD5EE74@ORSMSX105.amr.corp.intel.com>
	<502EAC8E.1090707@linux.intel.com>
	<D956029D25CF204F948EA0FB515E1EE20AD5EF9B@ORSMSX105.amr.corp.intel.com>
In-Reply-To: <D956029D25CF204F948EA0FB515E1EE20AD5EF9B@ORSMSX105.amr.corp.intel.com>
X-Enigmail-Version: 1.4.3
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Build Kernel module on target
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
X-List-Received-Date: Fri, 17 Aug 2012 23:29:06 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 08/17/2012 04:07 PM, Bodke, Kishore K wrote:
> 
> 
>> -----Original Message-----
>> From: Darren Hart [mailto:dvhart@linux.intel.com]
>> Sent: Friday, August 17, 2012 1:42 PM
>> To: Bodke, Kishore K
>> Cc: linux-yocto@yoctoproject.org
>> Subject: Re: Build Kernel module on target
>>
>>
>>
>> On 08/17/2012 11:11 AM, Bodke, Kishore K wrote:
>>>
>>>
>>>> -----Original Message-----
>>>> From: Darren Hart [mailto:dvhart@linux.intel.com]
>>>> Sent: Thursday, August 16, 2012 5:00 PM
>>>> To: Bodke, Kishore K
>>>> Cc: linux-yocto@yoctoproject.org
>>>> Subject: Re: Build Kernel module on target
>>>>
>>>>
>>>>
>>>> On 08/16/2012 04:31 PM, Bodke, Kishore K wrote:
>>>>> Hi Darren,
>>>>
>>>> Hi Kishore,
>>>>
>>>>> I am trying to build the Kernel Module on the target with sdk image.
>>>>> I get the below error for all the kernel modules I am building.
>>>>>
>>>>> == Build lib/librte_eal/linuxapp/igb_uio
>>>>>
>>>>> make: *** /lib/modules/3.4.6-yocto-standard/build: No such file or
>>>>> directory.  Stop.
>>>>>
>>>>> make[7]: *** [igb_uio.ko] Error 2
>>>>>
>>>>> Makefile has the kernel source directory  set like below.
>>>>>
>>>>> RTE_KERNELDIR = /lib/modules/$(shell uname -r)/build
>>>>>
>>>>> And I see there is no build directory there in
>>>>> /lib/modules/3.4.6-yocto-standard .
>>>>>
>>>>> I changed the RTE_KERNELDIR to
>>>>>
>>>>> RTE_KERNELDIR =/usr/src/kernel
>>>>
>>>> Correct.
>>>
>>> Why Yocto does not have /lib/modules/$(shell uname -r)/build?
>>> Generally /lib/modules/$(shell uname -r)/build is where EVERY kernel
>> module goes to look for kernel headers to build against.
>>
>> No reason. That would be a good addition. Please send a patch or open a
>> bug with
>> the request.
>>
>>>
>>>>
>>>>> This time it went further to build the kernel module but failed for the
>>>>>
>>>>> /usr/src/kernel/scripts/recordmcount: No such file or directory
>>>>>
>>>>> I saw the ${STAGING_KERNEL_DIR} for the recordmcount.  There is no
>> such
>>>> file
>>>>> I think we need  scripts/recordmcount to be a part of the final image?
>>>>
>>>> This is an unfortunate result of the kernel building those "scripts" for
>>>> the host, which we can't deploy to the target. We intentionally remove
>>>> them. To build on the target, you must first build the "scripts":
>>>>
>>>> $ cd /usr/src/kernel
>>>> $ make scripts
>>>>
>>>> Then try to build your modules.
>>>
>>> If I had to build the same module using recipe via bitbake, I get the same
>>> error.
>>
>> You shouldn't. If you do, it's a bug either in the module building
>> mechanism of oe-core or with your module recipe.
>>
>>> Unfortunately I cannot inherit module in my recipe.
>>
>> You really need to.
> 
> Moving the discussion to [open embedded core list]
> 
> Either I do inherit module or I don't, I need to have the kernel source directory to
> point  to  ${STAGING_KERNEL_DIR} in my recipe, since the Makefile has /lib/modules/$(shell uname -r)/build 
> for the kernel source, which If I don't override, it will build kernel module for the local host.

I would suggest updating the Makefile (possibly with a patch in the
SRC_URI of the recipe) to use KERNEL_SRC instead of a hard-coded path.
The module.bbclass with make that variable available at build time (see
module_do_compile() in module.bbclass).

> 
> Also the Makefile does not have rule for module install, can we have the install rule inside a recipe to make the module 
> in to the final image?

Your Makefile should have a modules_install target. If it does not, see
the meta-skeleton/hello-mod/files/Makefile for an example of how to add one.

> Something like 
> FILES_${PN}+=  ${base_libdir}/modules/${KERNEL_VERSION}/kernel/drivers"
> install -m 640 ${B}/kmod/igb_uio.ko     ${MODULE_DIR} (This being defined in a recipe)

You would be better off updating your Makefile to use standard Linux
kernel installation mechanisms.

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Technical Lead - Linux Kernel


