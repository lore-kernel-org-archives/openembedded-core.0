Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id CF07B6E672
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2018 17:07:27 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w6CH7OtL011354
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 12 Jul 2018 10:07:24 -0700
Received: from server.local (128.224.23.195) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.399.0;
	Thu, 12 Jul 2018 10:07:23 -0700
To: Khem Raj <raj.khem@gmail.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
References: <1531151586-30557-1-git-send-email-bruce.ashfield@windriver.com>
	<8e3f9ec13333061ecb0125e153df668abe8da1b9.camel@linuxfoundation.org>
	<47b99eac-867c-9cca-ac43-4d5a06760ed3@windriver.com>
	<c0baf80e5943135f4f65a93d849ee68419065c45.camel@linuxfoundation.org>
	<dee40069-d36a-2b70-56f6-5b52f3c1e7c4@windriver.com>
	<f7a60084dfdcbe937ad60021adb1fa6bec88eeff.camel@linuxfoundation.org>
	<d56fb567-09bd-2c35-28c0-00807a4a2f2d@windriver.com>
	<a443bc36-036f-89d2-be6b-b0a5d2d31d98@gmail.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <bb435abc-76fe-a4f7-6b1a-75b1d41549ed@windriver.com>
Date: Thu, 12 Jul 2018 13:07:22 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
	Gecko/20100101 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <a443bc36-036f-89d2-be6b-b0a5d2d31d98@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] kernel-devsrc: restructure for out of tree (and on target) module builds
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
X-List-Received-Date: Thu, 12 Jul 2018 17:07:27 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 2018-07-12 1:02 PM, Khem Raj wrote:
> On 7/12/18 7:55 AM, Bruce Ashfield wrote:
>> On 2018-07-12 9:53 AM, Richard Purdie wrote:
>>> On Thu, 2018-07-12 at 09:49 -0400, Bruce Ashfield wrote:
>>>> On 2018-07-10 5:41 PM, Richard Purdie wrote:
>>>>> On Tue, 2018-07-10 at 12:38 -0400, Bruce Ashfield wrote:
>>>>>> On 07/10/2018 06:21 AM, Richard Purdie wrote:
>>>>>>> On Mon, 2018-07-09 at 11:53 -0400, Bruce Ashfield wrote:
>>>>>>
>>>>>> I'll try the other configs, but clearly I have something
>>>>>> different in
>>>>>> my x86-64 build.
>>>>>>
>>>>>> I can't run the self tests directly, but am copying the files
>>>>>> onto my
>>>>>> qemu session and running things myself:
>>>>>>
>>>>>> root@qemux86-64:/lib/modules/4.14.48-yocto-standard/build# make
>>>>>> ARCH=x86
>>>>>> scripts prepare
>>>>>> Makefile:950: "Cannot use CONFIG_STACK_VALIDATION=y, please
>>>>>> install
>>>>>> libelf-dev, libelf-devel or elfutils-libelf-devel"
>>>>>>       CHK     scripts/mod/devicetable-offsets.h
>>>>>>       SYSTBL  arch/x86/include/generated/asm/syscalls_32.h
>>>>>>       SYSHDR  arch/x86/include/generated/asm/unistd_32_ia32.h
>>>>>>       SYSHDR  arch/x86/include/generated/asm/unistd_64_x32.h
>>>>>>       SYSTBL  arch/x86/include/generated/asm/syscalls_64.h
>>>>>>       SYSHDR  arch/x86/include/generated/uapi/asm/unistd_32.h
>>>>>>       SYSHDR  arch/x86/include/generated/uapi/asm/unistd_64.h
>>>>>>       SYSHDR  arch/x86/include/generated/uapi/asm/unistd_x32.h
>>>>>>       HOSTCC  arch/x86/tools/relocs_32.o
>>>>>>       HOSTCC  arch/x86/tools/relocs_64.o
>>>>>>       HOSTCC  arch/x86/tools/relocs_common.o
>>>>>>       HOSTLD  arch/x86/tools/relocs
>>>>>>       CHK     include/config/kernel.release
>>>>>>       CHK     include/generated/uapi/linux/version.h
>>>>>>       CHK     include/generated/utsrelease.h
>>>>>> Makefile:950: "Cannot use CONFIG_STACK_VALIDATION=y, please
>>>>>> install
>>>>>> libelf-dev, libelf-devel or elfutils-libelf-devel"
>>>>>>
>>>>>> root@qemux86-64:/tmp# make
>>>>>> make -C /usr/src/kernel M=/tmp modules
>>>>>> make[1]: Entering directory '/lib/modules/4.14.48-yocto-
>>>>>> standard/build'
>>>>>> Makefile:950: "Cannot use CONFIG_STACK_VALIDATION=y, please
>>>>>> install
>>>>>> libelf-dev, libelf-devel or elfutils-libelf-devel"
>>>>>>       Building modules, stage 2.
>>>>>>       MODPOST 1 modules
>>>>>> make[1]: Leaving directory '/lib/modules/4.14.48-yocto-
>>>>>> standard/build'
>>>>>> root@qemux86-64:/tmp# insmod hellomod.ko
>>>>>> [  419.211616] hellomod: loading out-of-tree module taints
>>>>>> kernel.
>>>>>> [  419.212586] Hello world!
>>>>>>
>>>>>> This is on the core-image-kernel-dev image, which is the one that
>>>>>> I created to test all this.
>>>>>>
>>>>>> What image is that using ? some sato sdk one ?
>>>>>
>>>>> We really need to find you a way to run these. The problem is the
>>>>> qemu
>>>>> graphics piece? You can't have a dummy vncserver or something to
>>>>> direct
>>>>> them at?
>>>>>
>>>>> The image is a core-image-sato-sdk...
>>>>
>>>> I was able to trigger the objtool issue with this image, looking at
>>>> fixing it and the other arches now.
>>>
>>> Since its image related, is it a missing package dependency? Just
>>> curious why its happening with some images but not your test ones...
>>
>> It is. I have extra toolchain elements being installed in
>> core-image-kernel-dev
>> that hold things together (i.e. the kernel's objtool doesn't need to
>> be built).
>>
>> The obvious fix is to just add an RDEPENDS, but I'm being stubborn
>> and trying to make it build on target, since the build of objtool from
>> the kernel source is showing me some sort of include path issue that
>> I'd like to sort out:
>>
>>    CC /lib/modules/4.14.48-yocto-standard/build/tools/objtool/exec-cmd.o
>> exec-cmd.c: In function 'get_pwd_cwd':
>> exec-cmd.c:49:4: error: implicit declaration of function 'strlcpy'; did
>> you mean 'strncpy'? [-Werror=implicit-function-declaration]
>>      strlcpy(cwd, pwd, PATH_MAX);
>>      ^~~~~~~
>>      strncpy
>> exec-cmd.c:49:4: error: nested extern declaration of 'strlcpy'
>> [-Werror=nested-externs]
>> cc1: all warnings being treated as errors
>>
> 
> Kernel has this function defined in tools/include/linux/string.h so
>

Well yes, a grep locates that :D


> however it has it like this
> 
> #if defined(__GLIBC__) && !defined(__UCLIBC__)
> extern size_t strlcpy(char *dest, const char *src, size_t size);
> #endif
> 
> Which means it will not work for musl and we need to ensure that we
> use -D_GNU_SOURCE for it to be included from standard musl headers

I've never built or supported musl, and since this is using the
in kernel Makefiles, etc, it isn't something I can patch or fix
outside of linux-yocto.

I'm just worried about the glibc cases, we can do follow up patches
later.

Bruce

> 
> 
>> Cheers,
>>
>> Bruce
>>
>>>
>>> Cheers,
>>>
>>> Richard
>>>
>>
> 
> 


