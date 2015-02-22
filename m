Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 653E7606E8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Feb 2015 13:04:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t1MD4RbV028800; Sun, 22 Feb 2015 13:04:27 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id HE7g6m3lDfUl; Sun, 22 Feb 2015 13:04:27 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t1MD4C9w028797
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sun, 22 Feb 2015 13:04:23 GMT
Message-ID: <1424610251.11836.74.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sun, 22 Feb 2015 13:04:11 +0000
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Cc: "Hart, Darren" <darren.hart@intel.com>
Subject: linux-yocto task performance numbers
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
X-List-Received-Date: Sun, 22 Feb 2015 13:04:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

As people know, I've been looking at performance a little, one of the
benchmarks is how long the kernel takes to build. I dumped out the task
performance data from buildstats for a linux-yocto build (nothing else
running): 

do_fetch:                 Elapsed time: 0.04 seconds 
do_unpack:                Elapsed time: 1.61 seconds 
do_kernel_checkout:       Elapsed time: 4.39 seconds 
do_validate_branches:     Elapsed time: 0.47 seconds 
do_patch:                 Elapsed time: 57.77 seconds 
do_kernel_configme:       Elapsed time: 44.92 seconds 
do_kernel_configcheck:    Elapsed time: 8.94 seconds 
do_configure:             Elapsed time: 0.60 seconds 
do_compile:               Elapsed time: 72.95 seconds 
do_compile_kernelmodules: Elapsed time: 34.84 seconds 
do_populate_lic:          Elapsed time: 0.14 seconds 
do_strip:                 Elapsed time: 0.03 seconds 
do_uboot_mkimage:         Elapsed time: 0.03 seconds 
do_install:               Elapsed time: 1.87 seconds 
do_populate_sysroot:      Elapsed time: 0.16 seconds 
do_shared_workdir:        Elapsed time: 0.05 seconds 
do_sizecheck:             Elapsed time: 0.03 seconds 
do_bundle_initramfs:      Elapsed time: 0.03 seconds 
do_kernel_link_vmlinux:   Elapsed time: 0.03 seconds 
do_deploy:                Elapsed time: 13.17 seconds 
do_package:               Elapsed time: 31.54 seconds 
do_packagedata:           Elapsed time: 0.59 seconds 
do_package_qa:            Elapsed time: 5.30 seconds 
do_package_write_ipk:     Elapsed time: 83.24 seconds 
do_package_write_rpm:     Elapsed time: 44.58 seconds 

The "core" was getting blamed for a lot of the build time. As can be
seen, the "core" isn't taking that much time now, apart from the fact
that ipk packaging seems to be taking twice the time of rpm which needs
looking into.

Some tasks like the compile tasks are understandable and likely
minimised by upstream work already.

The other tasks which as consuming a disproportionate amount of time are
kernel_configme and patch, I believe we need to look into those a little
further too. To put it into context, should the kernel compile be at the
same order of magnitude as the patch and configure?

Cheers,

Richard


