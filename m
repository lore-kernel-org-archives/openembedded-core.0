Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kishore.k.bodke@intel.com>) id 1T2VqZ-0003KZ-Ql
	for openembedded-core@lists.openembedded.org;
	Sat, 18 Aug 2012 01:20:56 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 17 Aug 2012 16:07:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,788,1336374000"; d="scan'208";a="187939386"
Received: from orsmsx603.amr.corp.intel.com ([10.22.226.49])
	by orsmga002.jf.intel.com with ESMTP; 17 Aug 2012 16:07:51 -0700
Received: from orsmsx153.amr.corp.intel.com (10.22.226.247) by
	orsmsx603.amr.corp.intel.com (10.22.226.49) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Fri, 17 Aug 2012 16:07:51 -0700
Received: from orsmsx105.amr.corp.intel.com ([169.254.4.178]) by
	ORSMSX153.amr.corp.intel.com ([169.254.13.86]) with mapi id
	14.01.0355.002; Fri, 17 Aug 2012 16:07:51 -0700
From: "Bodke, Kishore K" <kishore.k.bodke@intel.com>
To: Darren Hart <dvhart@linux.intel.com>
Thread-Topic: Build Kernel module on target
Thread-Index: Ac18Bzz1ZKq6S76WQ466O/ayG41IUQAPq38AABb0lDAAFGpHAAAKOCCw
Date: Fri, 17 Aug 2012 23:07:50 +0000
Message-ID: <D956029D25CF204F948EA0FB515E1EE20AD5EF9B@ORSMSX105.amr.corp.intel.com>
References: <D956029D25CF204F948EA0FB515E1EE20AD5D9F3@ORSMSX105.amr.corp.intel.com>
	<502D8980.7030107@linux.intel.com>
	<D956029D25CF204F948EA0FB515E1EE20AD5EE74@ORSMSX105.amr.corp.intel.com>
	<502EAC8E.1090707@linux.intel.com>
In-Reply-To: <502EAC8E.1090707@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.138]
MIME-Version: 1.0
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
X-List-Received-Date: Fri, 17 Aug 2012 23:20:57 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



>-----Original Message-----
>From: Darren Hart [mailto:dvhart@linux.intel.com]
>Sent: Friday, August 17, 2012 1:42 PM
>To: Bodke, Kishore K
>Cc: linux-yocto@yoctoproject.org
>Subject: Re: Build Kernel module on target
>
>
>
>On 08/17/2012 11:11 AM, Bodke, Kishore K wrote:
>>
>>
>>> -----Original Message-----
>>> From: Darren Hart [mailto:dvhart@linux.intel.com]
>>> Sent: Thursday, August 16, 2012 5:00 PM
>>> To: Bodke, Kishore K
>>> Cc: linux-yocto@yoctoproject.org
>>> Subject: Re: Build Kernel module on target
>>>
>>>
>>>
>>> On 08/16/2012 04:31 PM, Bodke, Kishore K wrote:
>>>> Hi Darren,
>>>
>>> Hi Kishore,
>>>
>>>> I am trying to build the Kernel Module on the target with sdk image.
>>>> I get the below error for all the kernel modules I am building.
>>>>
>>>> =3D=3D Build lib/librte_eal/linuxapp/igb_uio
>>>>
>>>> make: *** /lib/modules/3.4.6-yocto-standard/build: No such file or
>>>> directory.  Stop.
>>>>
>>>> make[7]: *** [igb_uio.ko] Error 2
>>>>
>>>> Makefile has the kernel source directory  set like below.
>>>>
>>>> RTE_KERNELDIR =3D /lib/modules/$(shell uname -r)/build
>>>>
>>>> And I see there is no build directory there in
>>>> /lib/modules/3.4.6-yocto-standard .
>>>>
>>>> I changed the RTE_KERNELDIR to
>>>>
>>>> RTE_KERNELDIR =3D/usr/src/kernel
>>>
>>> Correct.
>>
>> Why Yocto does not have /lib/modules/$(shell uname -r)/build?
>> Generally /lib/modules/$(shell uname -r)/build is where EVERY kernel
>module goes to look for kernel headers to build against.
>
>No reason. That would be a good addition. Please send a patch or open a
>bug with
>the request.
>
>>
>>>
>>>> This time it went further to build the kernel module but failed for th=
e
>>>>
>>>> /usr/src/kernel/scripts/recordmcount: No such file or directory
>>>>
>>>> I saw the ${STAGING_KERNEL_DIR} for the recordmcount.  There is no
>such
>>> file
>>>> I think we need  scripts/recordmcount to be a part of the final image?
>>>
>>> This is an unfortunate result of the kernel building those "scripts" fo=
r
>>> the host, which we can't deploy to the target. We intentionally remove
>>> them. To build on the target, you must first build the "scripts":
>>>
>>> $ cd /usr/src/kernel
>>> $ make scripts
>>>
>>> Then try to build your modules.
>>
>> If I had to build the same module using recipe via bitbake, I get the sa=
me
>> error.
>
>You shouldn't. If you do, it's a bug either in the module building
>mechanism of oe-core or with your module recipe.
>
>> Unfortunately I cannot inherit module in my recipe.
>
>You really need to.

Moving the discussion to [open embedded core list]

Either I do inherit module or I don't, I need to have the kernel source dir=
ectory to
point  to  ${STAGING_KERNEL_DIR} in my recipe, since the Makefile has /lib/=
modules/$(shell uname -r)/build=20
for the kernel source, which If I don't override, it will build kernel modu=
le for the local host.

Also the Makefile does not have rule for module install, can we have the in=
stall rule inside a recipe to make the module=20
in to the final image?
Something like=20
FILES_${PN}+=3D  ${base_libdir}/modules/${KERNEL_VERSION}/kernel/drivers"
install -m 640 ${B}/kmod/igb_uio.ko     ${MODULE_DIR} (This being defined i=
n a recipe)

Thanks
Kishore.



