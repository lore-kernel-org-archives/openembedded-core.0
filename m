Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id CC02B60616
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2018 12:58:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w2TCwG2m021484
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 29 Mar 2018 05:58:16 -0700
Received: from [128.224.56.93] (128.224.56.93) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 29 Mar 2018 05:58:15 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1522162765.git.bruce.ashfield@windriver.com>
	<CAJTo0Lbv_7wXs1mgoqtBc6zWN_bazjwYpc1FbLzT3-zqUnNUHg@mail.gmail.com>
	<CAJTo0La+oWebhkQXgFvY2yMQdwZzQ=ENbnyx0=5=MuvDiEBqew@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <fb094e1e-1196-0bed-190f-e69bf51bb675@windriver.com>
Date: Thu, 29 Mar 2018 08:58:14 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0La+oWebhkQXgFvY2yMQdwZzQ=ENbnyx0=5=MuvDiEBqew@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/7] linux-yocto: consolidated pull request
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
X-List-Received-Date: Thu, 29 Mar 2018 12:58:16 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

There's the stack validation warning, but I can run the hellomod
test on my qemux86-64 target and the 4.14 kernel.

It is an incremental patch to linux-yocto_4.14 to add the dependencies.

Would you like the entire queue again, or just the new patch sent to
the list ?

Bruce

---------

Makefile:947: "Cannot use CONFIG_STACK_VALIDATION=y, please install 
libelf-dev, libelf-devel or elfutils-libelf-devel"
   CC [M]  /tmp/hellomod.o
   Building modules, stage 2.
   MODPOST 1 modules
   CC      /tmp/hellomod.mod.o
   LD [M]  /tmp/hellomod.ko
make: Leaving directory '/usr/src/kernel'

root@qemux86-64:~# uname -a
Linux qemux86-64 4.14.30-yocto-standard #1 SMP PREEMPT Wed Mar 28 
11:55:44 EDT 2018 x86_64 GNU/Linux



On 03/28/2018 06:33 AM, Burton, Ross wrote:
> Also a non-musl target failed like this:
> 
> | NOTE: FAIL [6.426s]: test_kernel_module (kernelmodule.KernelModuleTest)
> | NOTE: ----------------------------------------------------------------------
> | NOTE: Traceback (most recent call last):
> |   File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-64/build/meta/lib/oeqa/core/decorator/__init__.py",
> line 32, in wrapped_f
> |     return func(*args, **kwargs)
> |   File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-64/build/meta/lib/oeqa/core/decorator/__init__.py",
> line 32, in wrapped_f
> |     return func(*args, **kwargs)
> |   File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-64/build/meta/lib/oeqa/core/decorator/__init__.py",
> line 32, in wrapped_f
> |     return func(*args, **kwargs)
> |   File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-64/build/meta/lib/oeqa/runtime/cases/kernelmodule.py",
> line 40, in test_kernel_module
> |     self.assertEqual(status, 0, msg='\n'.join([cmd, output]))
> | AssertionError: 2 != 0 : cd /tmp && make
> | make -C /usr/src/kernel M=/tmp modules
> | make[1]: Entering directory '/usr/src/kernel'
> | make[2]: *** No rule to make target 'tools/objtool/objtool', needed
> by '/tmp/hellomod.o'.  Stop.
> | make[1]: Leaving directory '/usr/src/kernel'
> | make[1]: *** [Makefile:1519: _module_/tmp] Error 2
> | make: *** [Makefile:5: all] Error 2
> 
> Same error but with glibc instead of musl.
> 
> Ross
> 
> On 28 March 2018 at 11:31, Burton, Ross <ross.burton@intel.com> wrote:
>> I think it was this pull but musl builds are now failing like this in selftest:
>>
>> | NOTE: FAIL: test_kernel_module (kernelmodule.KernelModuleTest)
>> | NOTE: ----------------------------------------------------------------------
>> | NOTE: Traceback (most recent call last):
>> |   File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-musl-x86-64/build/meta/lib/oeqa/core/decorator/__init__.py",
>> line 32, in wrapped_f
>> |     return func(*args, **kwargs)
>> |   File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-musl-x86-64/build/meta/lib/oeqa/core/decorator/__init__.py",
>> line 32, in wrapped_f
>> |     return func(*args, **kwargs)
>> |   File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-musl-x86-64/build/meta/lib/oeqa/core/decorator/__init__.py",
>> line 32, in wrapped_f
>> |     return func(*args, **kwargs)
>> |   File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-musl-x86-64/build/meta/lib/oeqa/runtime/cases/kernelmodule.py",
>> line 40, in test_kernel_module
>> |     self.assertEqual(status, 0, msg='\n'.join([cmd, output]))
>> | AssertionError: 2 != 0 : cd /tmp && make
>> | make -C /usr/src/kernel M=/tmp modules
>> | make[1]: Entering directory '/usr/src/kernel'
>> | getconf: LFS_CFLAGS: unknown variable
>> | getconf: LFS_LDFLAGS: unknown variable
>> | getconf: LFS_LIBS: unknown variable
>> | make[2]: *** No rule to make target 'tools/objtool/objtool', needed
>> by '/tmp/hellomod.o'.  Stop.
>> | make[1]: Leaving directory '/usr/src/kernel'
>> | make[1]: *** [Makefile:1519: _module_/tmp] Error 2
>> | make: *** [Makefile:5: all] Error 2
>>
>> Ross
>>
>> On 27 March 2018 at 16:03, Bruce Ashfield <bruce.ashfield@windriver.com> wrote:
>>> Hi all,
>>>
>>> This pull request is a series of -stable updates (more Spectre/meltdown
>>> included), and some fixes for the fsl_mpc h/w reference board that will
>>> allow us to update the reference to v4.14+.
>>>
>>> We also have a configuration tweak to the wifi fragments, which will
>>> result in more reuse, but won't impact the default configurations.
>>>
>>> Note: I haven't included the re-written kernel-devsrc changes, since
>>> I've never been able to reproduce the multilib issue with the ssl
>>> dependency. The devsrc changes will have to be looked at after the
>>> release.
>>>
>>> Cheers,
>>>
>>> Bruce
>>>
>>> The following changes since commit 80c7ca2c28959d08a59d960d318d8360392bd488:
>>>
>>>    kernel-dev: Clean up of "bsp_name" placeholder. (2018-03-25 09:41:13 +0100)
>>>
>>> are available in the git repository at:
>>>
>>>    git://git.pokylinux.org/poky-contrib zedd/kernel
>>>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel
>>>
>>> Bruce Ashfield (7):
>>>    linux-yocto/4.12: update to v4.12.21
>>>    mpc8315e-rdb: fix broken ethernet
>>>    linux-yocto/4.12: add ssl and utils native dependencies
>>>    linux-yocto/meta: improve wifi driver granularity
>>>    linux-yocto/4.12: intel-socfpga, intel-pmc-core and ish support for
>>>      CoffeeLake board
>>>    linux-yocto/4.14: update to v4.14.30
>>>    linux-yocto/4.15: update to v4.15.13
>>>
>>>   meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb   |  6 +++---
>>>   meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb   |  6 +++---
>>>   meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb   |  6 +++---
>>>   meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb |  6 +++---
>>>   meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb |  6 +++---
>>>   meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb |  6 +++---
>>>   meta/recipes-kernel/linux/linux-yocto_4.12.bb      | 22 ++++++++++++----------
>>>   meta/recipes-kernel/linux/linux-yocto_4.14.bb      | 20 ++++++++++----------
>>>   meta/recipes-kernel/linux/linux-yocto_4.15.bb      | 20 ++++++++++----------
>>>   9 files changed, 50 insertions(+), 48 deletions(-)
>>>
>>> --
>>> 2.5.0
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


