Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 534FC7827F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jan 2018 14:47:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w0QEl20n028833
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 26 Jan 2018 06:47:02 -0800 (PST)
Received: from server.local (128.224.22.154) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 26 Jan 2018 06:47:02 -0800
To: Cal Sullivan <california.l.sullivan@intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <20180125031227.18327-1-california.l.sullivan@intel.com>
	<e66c755a-c1d1-0e73-d18f-f8836139fb85@windriver.com>
	<79e06ad2-33aa-ce1d-dcc6-75c3e929efa1@intel.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <adfa5678-0b2f-0504-df9b-47da5f89cad3@windriver.com>
Date: Fri, 26 Jan 2018 09:47:01 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
	Gecko/20100101 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <79e06ad2-33aa-ce1d-dcc6-75c3e929efa1@intel.com>
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
X-List-Received-Date: Fri, 26 Jan 2018 14:47:02 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 2018-01-25 3:26 PM, Cal Sullivan wrote:
> 
> 
> On 01/25/2018 06:21 AM, Bruce Ashfield wrote:
>> On 01/24/2018 10:12 PM, California Sullivan wrote:
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
>>
>> Does this fix still require a kernel patch ? I was trying to test
>> it out here, and may have messed up the steps.
>>
>> If I remove ncurses-dev from my builder, I'm not able to get a
>> working menuconfig no matter what combination of this patch
>> applied (or not) or my menuconfig patch applied (or not).
>>
>> I can say that having this applied didn't break my menuconfig,
>> but I wasn't able to fully test.
>>
>> Should I expect a builder without ncurses-dev + just this patch
>> to be able to run menuconfig ?
> We still need the patch "menuconfig,check-lxdiaglog.sh: Allow 
> specification of ncurses location", as seen here: 
> https://git.yoctoproject.org/cgit/cgit.cgi/linux-yocto-dev/commit/?h=standard/base&id=26911f4ada6374ff3f0b7f98364b7a93756a180b 
> 
> 
> Two separate fixes in the same area unfortunately.
> 
> Locally I am doing 'bitbake linux-yocto-dev -c menuconfig' and I am 
> getting a working menuconfig with my patch, and no ncurses-dev(el) 
> installed on my host machine. If you're not, I worry that there might be 
> more host contamination that we haven't discovered.
> 
> Could you share the errors you're hitting?

I retested this morning, since I was doing a lot of different things
yesterday .. and I wanted to be sure that I had things right.

During my new tests, I can get menuconfig to launch with ncurses-dev
removed on my builder, if I have your patch + the one I carry in
linux-yocto.

It was my revert of the kernel patch that was getting me into the
"never able to build menuconfig" loop.

So no issues with this change, it doesn't break anything and definitely
lets me launch menuconfig when ncurses-dev isn't present on the builder.

I'll resend that kernel patch upstream.

Bruce

> 
> Thanks,
> Cal
> 
>>
>> Bruce
>>
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
>>>
>>
> 


