Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9BD26788CC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2018 20:30:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w2FKUsOC006768
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 15 Mar 2018 13:30:54 -0700
Received: from [172.25.44.10] (172.25.44.10) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 15 Mar 2018 13:30:53 -0700
To: Cal Sullivan <california.l.sullivan@intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <20180125031227.18327-1-california.l.sullivan@intel.com>
	<3dab59e8-c09c-622e-148b-4c8d1ffe2fc9@intel.com>
	<ab561ae4-0667-348d-fe7c-2b9df4470006@intel.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <e2eba80b-88ff-1d6c-3d30-29542f58be38@windriver.com>
Date: Thu, 15 Mar 2018 16:30:52 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <ab561ae4-0667-348d-fe7c-2b9df4470006@intel.com>
X-Originating-IP: [172.25.44.10]
Cc: bruce.ashfield@windriver.com
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
X-List-Received-Date: Thu, 15 Mar 2018 20:30:53 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

On 2018-03-15 03:53 PM, Cal Sullivan wrote:
> Woops, +Ross to CC.
Maybe you used BCC? Anyway +Ross to CC for reals now. :)
../Randy
> 
> ---
> Cal
> 
> On 03/15/2018 12:42 PM, Cal Sullivan wrote:
>> Ping. This is still an issue and it looks like this patch fell through 
>> the cracks!
>>
>> Thanks,
>> Cal
>>
>> On 01/24/2018 07:12 PM, California Sullivan wrote:
>>> Kernel v4.14 and newer contain the following in their Makefile:
>>>
>>> HOST_LFS_LDFLAGS := $(shell getconf LFS_LDFLAGS)
>>> HOSTLDFLAGS  := $(HOST_LFS_LDFLAGS)
>>>
>>> This breaks our menuconfig, because it can no longer find ncurses if its
>>> not on the host machine. This can be seen in linux-yocto-dev, for
>>> example:
>>>
>>> [clsulliv@clsulliv build]$ bitbake virtual/kernel -c menuconfig
>>>
>>>    GEN     ./Makefile
>>>    HOSTLD  scripts/kconfig/mconf
>>> /home/clsulliv/yocto/poky/build/tmp/hosttools/ld: cannot find -lncurses
>>> /home/clsulliv/yocto/poky/build/tmp/hosttools/ld: cannot find -ltinfo
>>> collect2: error: ld returned 1 exit status
>>> make[3]: *** [scripts/Makefile.host:99: scripts/kconfig/mconf] Error 1
>>> make[2]: *** 
>>> [/home/clsulliv/yocto/poky/build/tmp/work-shared/intel-corei7-64/kernel-source/Makefile:504: 
>>> menuconfig] Error 2
>>> make[1]: *** [Makefile:146: sub-make] Error 2
>>> make: *** [Makefile:24: __sub-make] Error 2
>>> Command failed.
>>> Press any key to continue...
>>>
>>> Fix this by setting HOSTLDFLAGS to ${BUILD_LDFLAGS} in our
>>> 'make menuconfig' command.
>>>
>>> Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
>>> ---
>>>   meta/classes/kernel.bbclass | 2 ++
>>>   1 file changed, 2 insertions(+)
>>>
>>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>>> index 2f6eca382e9..e4df1531c19 100644
>>> --- a/meta/classes/kernel.bbclass
>>> +++ b/meta/classes/kernel.bbclass
>>> @@ -531,6 +531,8 @@ addtask savedefconfig after do_configure
>>>     inherit cml1
>>>   +KCONFIG_CONFIG_COMMAND_append = " HOSTLDFLAGS='${BUILD_LDFLAGS}'"
>>> +
>>>   EXPORT_FUNCTIONS do_compile do_install do_configure
>>>     # kernel-base becomes kernel-${KERNEL_VERSION}
>>
> 


-- 
# Randy MacLeod.  WR Linux
# Wind River an Intel Company

