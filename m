Return-Path: <california.l.sullivan@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 6457671AD1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jan 2018 20:26:01 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 Jan 2018 12:26:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,413,1511856000"; d="scan'208";a="22347562"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga003.jf.intel.com with ESMTP; 25 Jan 2018 12:26:03 -0800
To: Bruce Ashfield <bruce.ashfield@windriver.com>,
	openembedded-core@lists.openembedded.org
References: <20180125031227.18327-1-california.l.sullivan@intel.com>
	<e66c755a-c1d1-0e73-d18f-f8836139fb85@windriver.com>
From: Cal Sullivan <california.l.sullivan@intel.com>
Message-ID: <79e06ad2-33aa-ce1d-dcc6-75c3e929efa1@intel.com>
Date: Thu, 25 Jan 2018 12:26:03 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <e66c755a-c1d1-0e73-d18f-f8836139fb85@windriver.com>
Subject: Re: [PATCH] kernel.bbclass: set HOSTLDFLAGS in KCONFIG_CONFIG_COMMAND
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
X-List-Received-Date: Thu, 25 Jan 2018 20:26:02 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 01/25/2018 06:21 AM, Bruce Ashfield wrote:
> On 01/24/2018 10:12 PM, California Sullivan wrote:
>> Kernel v4.14 and newer contain the following in their Makefile:
>>
>> HOST_LFS_LDFLAGS := $(shell getconf LFS_LDFLAGS)
>> HOSTLDFLAGS  := $(HOST_LFS_LDFLAGS)
>>
>> This breaks our menuconfig, because it can no longer find ncurses if its
>> not on the host machine. This can be seen in linux-yocto-dev, for
>> example:
>>
>> [clsulliv@clsulliv build]$ bitbake virtual/kernel -c menuconfig
>>
>>    GEN     ./Makefile
>>    HOSTLD  scripts/kconfig/mconf
>> /home/clsulliv/yocto/poky/build/tmp/hosttools/ld: cannot find -lncurses
>> /home/clsulliv/yocto/poky/build/tmp/hosttools/ld: cannot find -ltinfo
>> collect2: error: ld returned 1 exit status
>> make[3]: *** [scripts/Makefile.host:99: scripts/kconfig/mconf] Error 1
>> make[2]: *** 
>> [/home/clsulliv/yocto/poky/build/tmp/work-shared/intel-corei7-64/kernel-source/Makefile:504: 
>> menuconfig] Error 2
>> make[1]: *** [Makefile:146: sub-make] Error 2
>> make: *** [Makefile:24: __sub-make] Error 2
>> Command failed.
>> Press any key to continue...
>
> Does this fix still require a kernel patch ? I was trying to test
> it out here, and may have messed up the steps.
>
> If I remove ncurses-dev from my builder, I'm not able to get a
> working menuconfig no matter what combination of this patch
> applied (or not) or my menuconfig patch applied (or not).
>
> I can say that having this applied didn't break my menuconfig,
> but I wasn't able to fully test.
>
> Should I expect a builder without ncurses-dev + just this patch
> to be able to run menuconfig ?
We still need the patch "menuconfig,check-lxdiaglog.sh: Allow 
specification of ncurses location", as seen here: 
https://git.yoctoproject.org/cgit/cgit.cgi/linux-yocto-dev/commit/?h=standard/base&id=26911f4ada6374ff3f0b7f98364b7a93756a180b

Two separate fixes in the same area unfortunately.

Locally I am doing 'bitbake linux-yocto-dev -c menuconfig' and I am 
getting a working menuconfig with my patch, and no ncurses-dev(el) 
installed on my host machine. If you're not, I worry that there might be 
more host contamination that we haven't discovered.

Could you share the errors you're hitting?

Thanks,
Cal

>
> Bruce
>
>>
>> Fix this by setting HOSTLDFLAGS to ${BUILD_LDFLAGS} in our
>> 'make menuconfig' command.
>>
>> Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
>> ---
>>   meta/classes/kernel.bbclass | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>> index 2f6eca382e9..e4df1531c19 100644
>> --- a/meta/classes/kernel.bbclass
>> +++ b/meta/classes/kernel.bbclass
>> @@ -531,6 +531,8 @@ addtask savedefconfig after do_configure
>>     inherit cml1
>>   +KCONFIG_CONFIG_COMMAND_append = " HOSTLDFLAGS='${BUILD_LDFLAGS}'"
>> +
>>   EXPORT_FUNCTIONS do_compile do_install do_configure
>>     # kernel-base becomes kernel-${KERNEL_VERSION}
>>
>


