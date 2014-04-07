Return-Path: <valentin.popa@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id E9E4F62252
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Apr 2014 14:55:08 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 07 Apr 2014 07:54:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,810,1389772800"; d="scan'208";a="515873659"
Received: from vpopa-desktop.rb.intel.com (HELO [10.237.105.76])
	([10.237.105.76])
	by fmsmga002.fm.intel.com with ESMTP; 07 Apr 2014 07:54:50 -0700
Message-ID: <5342BC44.2000708@intel.com>
Date: Mon, 07 Apr 2014 17:55:00 +0300
From: Valentin Popa <valentin.popa@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Robert Yang <liezhi.yang@windriver.com>, 
	Otavio Salvador <otavio@ossystems.com.br>
References: <CAP9ODKoLt=HMhiGQZmQhDUUFm-efPavZRftR7A8Wf7gECw+Amw@mail.gmail.com>
	<533F8B7C.8010409@windriver.com>
In-Reply-To: <533F8B7C.8010409@windriver.com>
Cc: "meta-freescale@yoctoproject.org" <meta-freescale@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [dora][regression] mesa failed to build
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 07 Apr 2014 14:55:11 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


Indeed the build failure was introduced by that patch, which enters a 
logical conflict with the bbappend file for mesa.
To remain compatible with the future releases I suggest to  not 
remove/add flags from/to EXTRA_OECONF explicitly, and make  use of what 
PACKAGECONFIG contains.
The first part of the __anonymous function from the bbappend file can be 
simply replaced with:

PACKAGECONFIG_remove = "egl"

and the second part with:

PROVIDES_remove = "virtual/libgles1 virtual/libgles2 virtual/egl"
and
PROVIDES_remove = "virtual/libgl" if mx6 is in SOC_FAMILY.



On 04/05/2014 07:50 AM, Robert Yang wrote:
>
> Yes, seems related to the following one, add Valentin Popa in the loop:
>
> commit bcfbddd8fa9760f681d7366c8d507fd0bef3a854
> Author: Valentin Popa <valentin.popa@intel.com>
> Date:   Thu Feb 27 11:51:17 2014 +0200
>
>     mesa: build fix for gallium-egl
>
> // Robert
>
> On 04/05/2014 12:38 PM, Otavio Salvador wrote:
>> Hello,
>>
>> In one of our custom BSPs we saw a build failure in mesa:
>>
>> | make[1]: Leaving directory
>> `.../build/tmp/work/cortexa9hf-vfp-neon-mx6-oel-linux-gnueabi/mesa/2_9.1.6-r0/build' 
>>
>> | sed: can't read
>> .../build/tmp/work/cortexa9hf-vfp-neon-mx6-oel-linux-gnueabi/mesa/2_9.1.6-r0/image/usr/include/EGL/eglplatform.h: 
>>
>> No such file or directory
>> | WARNING: exit code 2 from a shell command.
>> | ERROR: Function failed: do_install (log file is located at
>> .../build/tmp/work/cortexa9hf-vfp-neon-mx6-oel-linux-gnueabi/mesa/2_9.1.6-r0/temp/log.do_install.17155) 
>>
>> recipe mesa-2_9.1.6-r0: task do_install: Failed
>> ERROR: Task 2643
>> (.../sources/poky/meta/recipes-graphics/mesa/mesa_9.1.6.bb,
>> do_install) failed with exit code '1'
>> recipe gnutls-2.12.23-r8.4: task do_configure: Succeeded
>>
>> This seems not related to the bbappend we have in meta-fsl-arm[1], in
>> Dora. I think this came in today's changes in the branch.
>>
>> 1. 
>> http://git.yoctoproject.org/cgit/cgit.cgi/meta-fsl-arm/tree/recipes-graphics/mesa/mesa_9.1.6.bbappend?h=dora
>>
>> This builder has PRServer enabled.
>>
>> As I am going to be traveling so won't have time to debug this bug I
>> preferred to report it so someone can debug.
>>


