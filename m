Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 607DC606BF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2016 15:09:24 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 26 Jul 2016 08:09:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,425,1464678000"; d="scan'208";a="739993687"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 26 Jul 2016 08:09:17 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.68])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 2CF886A4080;
	Tue, 26 Jul 2016 08:09:01 -0700 (PDT)
Date: Tue, 26 Jul 2016 17:32:44 +0300
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20160726143244.GA9326@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>
Subject: 2.7% build time regression caused by enabling debug/printk.scc KERNEL_FEATURE
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
X-List-Received-Date: Tue, 26 Jul 2016 15:09:25 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

We've noticed quite big increase of core-image-minimal build time caused by commit
d55b7650d305ffad953dd36595ee6b9aa8df5a72 linux-yocto: Enablei debug/printk.scc KERNEL_FEATURE on qemuall machines.

Here are results of /usr/bin/time -v bitbake core-image-minimal for this
and previous commits:

linux-yocto: Enable debug/printk.scc KERNEL_FEATURE on qemuall machines: d55b7650d305ffad953dd36595ee6b9aa8df5a72
        Command being timed: "bitbake core-image-minimal"
        User time (seconds): 14966.24
        System time (seconds): 3829.23
        Percent of CPU this job got: 1212%
        Elapsed (wall clock) time (h:mm:ss or m:ss): 25:50.52
        Average shared text size (kbytes): 0
        Average unshared data size (kbytes): 0
        Average stack size (kbytes): 0
        Average total size (kbytes): 0
        Maximum resident set size (kbytes): 917592
        Average resident set size (kbytes): 0
        Major (requiring I/O) page faults: 8105
        Minor (reclaiming a frame) page faults: 628476540
        Voluntary context switches: 26886617
        Involuntary context switches: 2033535
        Swaps: 0
        File system inputs: 3160048
        File system outputs: 78417720
        Socket messages sent: 0
        Socket messages received: 0
        Signals delivered: 0
        Page size (bytes): 4096
        Exit status: 0

commit: nativesdk-packagegroup-sdk-host: Add wayland-scanner to the SDK native toolchain: e833508075bcb8f2d1ccddcf46f579aea7a2ab1d
        Command being timed: "bitbake core-image-minimal"
        User time (seconds): 14526.89
        System time (seconds): 3770.74
        Percent of CPU this job got: 1193%
        Elapsed (wall clock) time (h:mm:ss or m:ss): 25:33.44
        Average shared text size (kbytes): 0
        Average unshared data size (kbytes): 0
        Average stack size (kbytes): 0
        Average total size (kbytes): 0
        Maximum resident set size (kbytes): 917792
        Average resident set size (kbytes): 0
        Major (requiring I/O) page faults: 8058
        Minor (reclaiming a frame) page faults: 618283939
        Voluntary context switches: 26538183
        Involuntary context switches: 1859365
        Swaps: 0
        File system inputs: 3191584
        File system outputs: 66411592
        Socket messages sent: 0
        Socket messages received: 0
        Signals delivered: 0
        Page size (bytes): 4096
        Exit status: 0

The total time (user time + system time) incresed by 2.72% which seems quite a lot.

diff of tasks utime shows biggest difference in do_package* tasks. This is probably
due to increased size of packages:

do_bundle_initramfs:utime: 21         |   do_bundle_initramfs:utime: 32
do_compile:utime: 47                  |   do_compile:utime: 51
do_compile_kernelmodules:utime: 39    |   do_compile_kernelmodules:utime: 42
do_configure:utime: 20                |   do_configure:utime: 24
do_deploy:utime: 38                   |   do_deploy:utime: 35
do_fetch:utime: 25                    |   do_fetch:utime: 28
do_install:utime: 26                  |   do_install:utime: 22
do_kernel_checkout:utime: 21          |   do_kernel_checkout:utime: 24
do_kernel_configcheck:utime: 21       |   do_kernel_configcheck:utime: 21
do_kernel_configme:utime: 23          |   do_kernel_configme:utime: 23
do_kernel_link_images:utime: 24       |   do_kernel_link_images:utime: 22
do_kernel_metadata:utime: 25          |   do_kernel_metadata:utime: 23
do_package:utime: 396                 |   do_package:utime: 378
do_packagedata:utime: 35              |   do_packagedata:utime: 34
do_package_qa:utime: 460              |   do_package_qa:utime: 492
do_package_write_rpm:utime: 431       |   do_package_write_rpm:utime: 399
do_patch:utime: 25                    |   do_patch:utime: 25
do_populate_lic:utime: 30             |   do_populate_lic:utime: 29
do_populate_sysroot:utime: 33         |   do_populate_sysroot:utime: 30
do_shared_workdir:utime: 24           |   do_shared_workdir:utime: 25
do_sizecheck:utime: 23                |   do_sizecheck:utime: 21
do_strip:utime: 23                    |   do_strip:utime: 23
do_uboot_mkimage:utime: 25            |   do_uboot_mkimage:utime: 24
do_unpack:utime: 21                   |   do_unpack:utime: 22
do_validate_branches:utime: 23        |   do_validate_branches:utime: 24

There is also quite big increase in consumed disk space by the kernel
and modules:
$ ls -lh ./tmp.bad/work/qemux86-poky-linux/linux-yocto/4.4.14+gitAUTOINC+4800a400d5_8361321fec-r0/image/boot/vmlinux-4.4.14-yocto-standard
-rw-r--r-- 1 ed ed 261M Jul 25 12:39 ./tmp.bad/work/qemux86-poky-linux/linux-yocto/4.4.14+gitAUTOINC+4800a400d5_8361321fec-r0/image/boot/vmlinux-4.4.14-yocto-standard
$ ls -lh ./tmp.prev/work/qemux86-poky-linux/linux-yocto/4.4.14+gitAUTOINC+4800a400d5_8361321fec-r0/image/boot/vmlinux-4.4.14-yocto-standard
-rw-r--r-- 1 ed ed 19M Jul 25 17:34 ./tmp.prev/work/qemux86-poky-linux/linux-yocto/4.4.14+gitAUTOINC+4800a400d5_8361321fec-r0/image/boot/vmlinux-4.4.14-yocto-standard

$ ls -lh tmp.bad/deploy/images/qemux86/modules--4.4.14+git0+4800a400d5_8361321fec-r0-qemux86-20160725092744.tgz
-rw-rw-r-- 2 ed ed 99M Jul 25 12:39 tmp.bad/deploy/images/qemux86/modules--4.4.14+git0+4800a400d5_8361321fec-r0-qemux86-20160725092744.tgz
$ ls -lh tmp.prev/deploy/images/qemux86/modules--4.4.14+git0+4800a400d5_8361321fec-r0-qemux86-20160725105810.tgz
-rw-rw-r-- 1 ed ed 4.3M Jul 25 17:34 tmp.prev/deploy/images/qemux86/modules--4.4.14+git0+4800a400d5_8361321fec-r0-qemux86-20160725105810.tgz

Any thoughts on this? Is it normal or it should be tested further and fixed?

--
Regards,
Ed

