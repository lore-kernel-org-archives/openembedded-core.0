Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4779076058
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2018 02:34:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w6B2YBsk018701
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 10 Jul 2018 19:34:11 -0700
Received: from server.local (128.224.23.195) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.399.0;
	Tue, 10 Jul 2018 19:34:11 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1531151586-30557-1-git-send-email-bruce.ashfield@windriver.com>
	<8e3f9ec13333061ecb0125e153df668abe8da1b9.camel@linuxfoundation.org>
	<47b99eac-867c-9cca-ac43-4d5a06760ed3@windriver.com>
	<c0baf80e5943135f4f65a93d849ee68419065c45.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <97d70868-7ee5-01a7-7898-2713de76dbcd@windriver.com>
Date: Tue, 10 Jul 2018 22:34:10 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
	Gecko/20100101 Thunderbird/52.9.0
MIME-Version: 1.0
In-Reply-To: <c0baf80e5943135f4f65a93d849ee68419065c45.camel@linuxfoundation.org>
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
X-List-Received-Date: Wed, 11 Jul 2018 02:34:17 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2018-07-10 5:41 PM, Richard Purdie wrote:
> On Tue, 2018-07-10 at 12:38 -0400, Bruce Ashfield wrote:
>> On 07/10/2018 06:21 AM, Richard Purdie wrote:
>>> On Mon, 2018-07-09 at 11:53 -0400, Bruce Ashfield wrote:
>> I'll try the other configs, but clearly I have something different in
>> my x86-64 build.
>>
>> I can't run the self tests directly, but am copying the files onto my
>> qemu session and running things myself:
>>
>> root@qemux86-64:/lib/modules/4.14.48-yocto-standard/build# make
>> ARCH=x86
>> scripts prepare
>> Makefile:950: "Cannot use CONFIG_STACK_VALIDATION=y, please install
>> libelf-dev, libelf-devel or elfutils-libelf-devel"
>>     CHK     scripts/mod/devicetable-offsets.h
>>     SYSTBL  arch/x86/include/generated/asm/syscalls_32.h
>>     SYSHDR  arch/x86/include/generated/asm/unistd_32_ia32.h
>>     SYSHDR  arch/x86/include/generated/asm/unistd_64_x32.h
>>     SYSTBL  arch/x86/include/generated/asm/syscalls_64.h
>>     SYSHDR  arch/x86/include/generated/uapi/asm/unistd_32.h
>>     SYSHDR  arch/x86/include/generated/uapi/asm/unistd_64.h
>>     SYSHDR  arch/x86/include/generated/uapi/asm/unistd_x32.h
>>     HOSTCC  arch/x86/tools/relocs_32.o
>>     HOSTCC  arch/x86/tools/relocs_64.o
>>     HOSTCC  arch/x86/tools/relocs_common.o
>>     HOSTLD  arch/x86/tools/relocs
>>     CHK     include/config/kernel.release
>>     CHK     include/generated/uapi/linux/version.h
>>     CHK     include/generated/utsrelease.h
>> Makefile:950: "Cannot use CONFIG_STACK_VALIDATION=y, please install
>> libelf-dev, libelf-devel or elfutils-libelf-devel"
>>
>> root@qemux86-64:/tmp# make
>> make -C /usr/src/kernel M=/tmp modules
>> make[1]: Entering directory '/lib/modules/4.14.48-yocto-
>> standard/build'
>> Makefile:950: "Cannot use CONFIG_STACK_VALIDATION=y, please install
>> libelf-dev, libelf-devel or elfutils-libelf-devel"
>>     Building modules, stage 2.
>>     MODPOST 1 modules
>> make[1]: Leaving directory '/lib/modules/4.14.48-yocto-
>> standard/build'
>> root@qemux86-64:/tmp# insmod hellomod.ko
>> [  419.211616] hellomod: loading out-of-tree module taints kernel.
>> [  419.212586] Hello world!
>>
>> This is on the core-image-kernel-dev image, which is the one that
>> I created to test all this.
>>
>> What image is that using ? some sato sdk one ?
> 
> We really need to find you a way to run these. The problem is the qemu
> graphics piece? You can't have a dummy vncserver or something to direct
> them at?

My config never seems to build and run the tests that I need, I had
it work once, and then never again. So I prefer to just build, boot
and run tests manually.

Regardless of the automation, I can easily do "make scripts prepare"
on the kernel-devsrc package, so that is extremely odd that it doesn't
work with that image. I'll try and add devsrc to a sato build and see
of objtool goes nuts.

I'm also unable to build lttng-modules for mips at the moment, so at
least mips is untestable for me.

Bruce

> 
> The image is a core-image-sato-sdk...
> 
> Cheers,
> 
> Richard
> 


