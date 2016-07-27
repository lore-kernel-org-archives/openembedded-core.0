Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 90DCC606BF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 13:06:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u6RD6jk0002976
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 27 Jul 2016 06:06:45 -0700
Received: from [128.224.56.48] (128.224.56.48) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 27 Jul 2016 06:06:45 -0700
To: <ed.bartosh@linux.intel.com>, <openembedded-core@lists.openembedded.org>
References: <1469620052.23580.115.camel@linuxfoundation.org>
	<20160727122801.GA7061@linux.intel.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <5798B1E4.2090508@windriver.com>
Date: Wed, 27 Jul 2016 09:06:44 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <20160727122801.GA7061@linux.intel.com>
Subject: Re: 2.7% build time regression caused by enabling debug/printk.scc KERNEL_FEATURE]
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
X-List-Received-Date: Wed, 27 Jul 2016 13:06:48 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-07-27 08:28 AM, Ed Bartosh wrote:
> Hi Bruce,
>
> Thank you for your suggestion to experiment with configuration options!
>
>> On 2016-07-26 10:32 AM, Ed Bartosh wrote:
>>> Hi all,
>>>
>>> We've noticed quite big increase of core-image-minimal build time caused by commit
>>> d55b7650d305ffad953dd36595ee6b9aa8df5a72 linux-yocto: Enablei debug/printk.scc KERNEL_FEATURE on qemuall machines.
>>>
>>
>> That commit only enables the following options:
>>
>> CONFIG_PRINTK=y
>> CONFIG_PRINTK_TIME=y
>>
>> CONFIG_EARLY_PRINTK=y
>>
>> CONFIG_EARLY_PRINTK_DBGP=y
>> CONFIG_EARLY_PRINTK_EFI=y
>> CONFIG_TTY_PRINTK=y
>>
>> And yes, that will add some size to the kernel, but I'm not seeing
>> similar size increases here.
>>
>> If you take a look through the kernel source and build, there are
>> relatively few additions to the actual kernel build that change
>> based on those options, and most of them are runtime changes versus
>> build-time changes.
>>
>
> The actuall difference in configuration is bigger as far as I can see:
> $ diff -u ../build-kernel/tmp/work/qemux86_64-poky-linux/linux-yocto/4.4.14+gitAUTOINC+4800a400d5_8361321fec-r0/image/boot/config-4.4.14-yocto-standard
> tmp/work/qemux86_64-poky-linux/linux-yocto/4.4.14+gitAUTOINC+4800a400d5_8361321fec-r0/image/boot/config-4.4.14-yocto-standard | grep '^+C'
> +CONFIG_CONSOLE_POLL=y
> +CONFIG_PRINTK_TIME=y
> +CONFIG_DEBUG_INFO=y
> +CONFIG_DEBUG_KERNEL=y
> +CONFIG_SCHED_DEBUG=y
> +CONFIG_DEBUG_PREEMPT=y
> +CONFIG_KGDB=y
> +CONFIG_KGDB_SERIAL_CONSOLE=y
> +CONFIG_KGDB_LOW_LEVEL_TRAP=y
> +CONFIG_KGDB_KDB=y
> +CONFIG_KDB_DEFAULT_ENABLE=0x1
> +CONFIG_KDB_KEYBOARD=y
> +CONFIG_KDB_CONTINUE_CATASTROPHIC=0
> +CONFIG_EARLY_PRINTK_DBGP=y
> +CONFIG_EARLY_PRINTK_EFI=y
> +CONFIG_DEBUG_RODATA=y
> +CONFIG_DEBUG_RODATA_TEST=y
> +CONFIG_X86_DEBUG_FPU=y
>
> I guess the reason of this is that printk.scc includes debug-kernel.scc,
> which brings more config options:
> CONFIG_DEBUG_KERNEL=y
> CONFIG_DEBUG_INFO=y
> CONFIG_DEBUG_PREEMPT=y
>
> That probably explains the difference in kernel size and compile time.
>

Yup.

> After removing 'include debug-kernel.scc' the difference in
> configuration became more reasonable:
> +CONFIG_PRINTK_TIME=y
> +CONFIG_EARLY_PRINTK_DBGP=y
> +CONFIG_EARLY_PRINTK_EFI=y
>
> And the size of kernel and modules became almost the same as before
> enabling printk feature.
>
> Considering that the rest of the options from printk.scc don't appear in
> the result configuration even if debug-kernel.scc is included I hope
> it should be ok to remove 'include debug-kernel.scc' from printk.scc.
>
> Does it make sense for you?

It does to me. Since we actually have a "developer" kernel type that
is intended for this purpose. Anything that we add to the standard
kernel type should be more surgical.

Bruce

>
>>> Here are results of /usr/bin/time -v bitbake core-image-minimal for this
>>> and previous commits:
>>>
>>> linux-yocto: Enable debug/printk.scc KERNEL_FEATURE on qemuall machines: d55b7650d305ffad953dd36595ee6b9aa8df5a72
>>>          Command being timed: "bitbake core-image-minimal"
>>>          User time (seconds): 14966.24
>>>          System time (seconds): 3829.23
>>>          Percent of CPU this job got: 1212%
>>>          Elapsed (wall clock) time (h:mm:ss or m:ss): 25:50.52
>>>          Average shared text size (kbytes): 0
>>>          Average unshared data size (kbytes): 0
>>>          Average stack size (kbytes): 0
>>>          Average total size (kbytes): 0
>>>          Maximum resident set size (kbytes): 917592
>>>          Average resident set size (kbytes): 0
>>>          Major (requiring I/O) page faults: 8105
>>>          Minor (reclaiming a frame) page faults: 628476540
>>>          Voluntary context switches: 26886617
>>>          Involuntary context switches: 2033535
>>>          Swaps: 0
>>>          File system inputs: 3160048
>>>          File system outputs: 78417720
>>>          Socket messages sent: 0
>>>          Socket messages received: 0
>>>          Signals delivered: 0
>>>          Page size (bytes): 4096
>>>          Exit status: 0
>>>
>>> commit: nativesdk-packagegroup-sdk-host: Add wayland-scanner to the SDK native toolchain: e833508075bcb8f2d1ccddcf46f579aea7a2ab1d
>>>          Command being timed: "bitbake core-image-minimal"
>>>          User time (seconds): 14526.89
>>>          System time (seconds): 3770.74
>>>          Percent of CPU this job got: 1193%
>>>          Elapsed (wall clock) time (h:mm:ss or m:ss): 25:33.44
>>>          Average shared text size (kbytes): 0
>>>          Average unshared data size (kbytes): 0
>>>          Average stack size (kbytes): 0
>>>          Average total size (kbytes): 0
>>>          Maximum resident set size (kbytes): 917792
>>>          Average resident set size (kbytes): 0
>>>          Major (requiring I/O) page faults: 8058
>>>          Minor (reclaiming a frame) page faults: 618283939
>>>          Voluntary context switches: 26538183
>>>          Involuntary context switches: 1859365
>>>          Swaps: 0
>>>          File system inputs: 3191584
>>>          File system outputs: 66411592
>>>          Socket messages sent: 0
>>>          Socket messages received: 0
>>>          Signals delivered: 0
>>>          Page size (bytes): 4096
>>>          Exit status: 0
>>>
>>> The total time (user time + system time) incresed by 2.72% which seems quite a lot.
>>>
>>> diff of tasks utime shows biggest difference in do_package* tasks. This is probably
>>> due to increased size of packages:
>>>
>>> do_bundle_initramfs:utime: 21         |   do_bundle_initramfs:utime: 32
>>> do_compile:utime: 47                  |   do_compile:utime: 51
>>> do_compile_kernelmodules:utime: 39    |   do_compile_kernelmodules:utime: 42
>>> do_configure:utime: 20                |   do_configure:utime: 24
>>> do_deploy:utime: 38                   |   do_deploy:utime: 35
>>> do_fetch:utime: 25                    |   do_fetch:utime: 28
>>> do_install:utime: 26                  |   do_install:utime: 22
>>> do_kernel_checkout:utime: 21          |   do_kernel_checkout:utime: 24
>>> do_kernel_configcheck:utime: 21       |   do_kernel_configcheck:utime: 21
>>> do_kernel_configme:utime: 23          |   do_kernel_configme:utime: 23
>>> do_kernel_link_images:utime: 24       |   do_kernel_link_images:utime: 22
>>> do_kernel_metadata:utime: 25          |   do_kernel_metadata:utime: 23
>>> do_package:utime: 396                 |   do_package:utime: 378
>>> do_packagedata:utime: 35              |   do_packagedata:utime: 34
>>> do_package_qa:utime: 460              |   do_package_qa:utime: 492
>>> do_package_write_rpm:utime: 431       |   do_package_write_rpm:utime: 399
>>> do_patch:utime: 25                    |   do_patch:utime: 25
>>> do_populate_lic:utime: 30             |   do_populate_lic:utime: 29
>>> do_populate_sysroot:utime: 33         |   do_populate_sysroot:utime: 30
>>> do_shared_workdir:utime: 24           |   do_shared_workdir:utime: 25
>>> do_sizecheck:utime: 23                |   do_sizecheck:utime: 21
>>> do_strip:utime: 23                    |   do_strip:utime: 23
>>> do_uboot_mkimage:utime: 25            |   do_uboot_mkimage:utime: 24
>>> do_unpack:utime: 21                   |   do_unpack:utime: 22
>>> do_validate_branches:utime: 23        |   do_validate_branches:utime: 24
>>>
>>> There is also quite big increase in consumed disk space by the kernel
>>> and modules:
>>> $ ls -lh ./tmp.bad/work/qemux86-poky-linux/linux-yocto/4.4.14+gitAUTOINC+4800a400d5_8361321fec-r0/image/boot/vmlinux-4.4.14-yocto-standard
>>> -rw-r--r-- 1 ed ed 261M Jul 25 12:39 ./tmp.bad/work/qemux86-poky-linux/linux-yocto/4.4.14+gitAUTOINC+4800a400d5_8361321fec-r0/image/boot/vmlinux-4.4.14-yocto-standard
>>> $ ls -lh ./tmp.prev/work/qemux86-poky-linux/linux-yocto/4.4.14+gitAUTOINC+4800a400d5_8361321fec-r0/image/boot/vmlinux-4.4.14-yocto-standard
>>> -rw-r--r-- 1 ed ed 19M Jul 25 17:34 ./tmp.prev/work/qemux86-poky-linux/linux-yocto/4.4.14+gitAUTOINC+4800a400d5_8361321fec-r0/image/boot/vmlinux-4.4.14-yocto-standard
>>>
>>> $ ls -lh tmp.bad/deploy/images/qemux86/modules--4.4.14+git0+4800a400d5_8361321fec-r0-qemux86-20160725092744.tgz
>>> -rw-rw-r-- 2 ed ed 99M Jul 25 12:39 tmp.bad/deploy/images/qemux86/modules--4.4.14+git0+4800a400d5_8361321fec-r0-qemux86-20160725092744.tgz
>>> $ ls -lh tmp.prev/deploy/images/qemux86/modules--4.4.14+git0+4800a400d5_8361321fec-r0-qemux86-20160725105810.tgz
>>> -rw-rw-r-- 1 ed ed 4.3M Jul 25 17:34 tmp.prev/deploy/images/qemux86/modules--4.4.14+git0+4800a400d5_8361321fec-r0-qemux86-20160725105810.tgz
>>>
>>> Any thoughts on this? Is it normal or it should be tested further and fixed?
>>
>> I'm not sure that this is related to the debug printk build, but
>> anything that that could be increasing footprint and build time
>> like that should be looked into.
>>
>> Without messing with the oe-core commit that enabled the feature, has
>> someone done a build, gone into the kernel .config, disabled the options
>> and then rebuilt ? I'd start there to rule out that the option is
>> actually doing something that significant to the build itself.
>>
>> .. but I can't say much more than that, since as you can see by the
>> commit, I'm not on the sign-off list, so I don't have all the background.
>>
>> Bruce
>>
>>>
>>> --
>>> Regards,
>>> Ed
>>>
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>


