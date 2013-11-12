Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 7001D6D598
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2013 15:31:58 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rACFVr6X020296 for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2013 15:31:53 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id sF-FMtAkFzT6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2013 15:31:53 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rACFVpYQ020283
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2013 15:31:53 GMT
Message-ID: <1384270308.6460.11.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 12 Nov 2013 15:31:48 +0000
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Subject: Confusing Performance Numbers
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
X-List-Received-Date: Tue, 12 Nov 2013 15:31:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I had some ideas I decided to test out. Specifically:

a) stripping -native binaries before putting them in the sysroot
b) compiling -natives with -march=native
c) using hardlinks for sysroot_stage_dir

I was wondering if any of these could give a speedup to the build and if
so, whether it was a useful one. I ran this through our standard
performance script and the results were:

# Baseline
#./perfscript -c d8baa6c89b2f29e8ccc814c61dfd3b106af4fd65
#dax,(nobranch):d8baa6c89b2f29e8ccc814c61dfd3b106af4fd65,poky-10.0.0.final-391-gd8baa6c,38:41.96,11:01.73,5:02.05,4:34.08,0:11.63,0:08.04,0:01.76,25582020,4853400

# staging: Strip native binaries
#./perfscript -c 3e7cab95423c688d7db7355d86b461c1408381d0
#dax,(nobranch):3e7cab95423c688d7db7355d86b461c1408381d0,poky-10.0.0.final-392-g3e7cab9,39:07.56,11:02.05,4:46.99,4:33.99,0:11.63,0:09.40,0:01.73,25398400,4669464

#bitbake.conf: Add -march=native
#./perfscript -c d30b212c8975ad96a35ee6bace731b9823216570    
#dax,(nobranch):d30b212c8975ad96a35ee6bace731b9823216570,poky-10.0.0.final-393-gd30b212,39:16.88,11:41.67,5:05.63,4:31.88,0:11.61,0:07.94,0:01.70,25401000,4670192

# staging: Experiment with hardlinking for sysroot_stage_dir
#./perfscript -c 2feafbbd6338acd52577074db993da4e6d2de03f
#dax,master2:2feafbbd6338acd52577074db993da4e6d2de03f,poky-10.0.0.final-394-g2feafbb,39:49.88,11:11.63,4:41.16,4:38.85,0:11.40,0:07.90,0:01.73,23438704,4669984

so each time, the overall build time seems to rise slightly (first
number). The time to bitbake the kernel remains roughly the same (second
number), maybe the -march=native makes it take fractionally longer?
Stripping the binaries is worth about 200MB of disk use (with and
without rmwork). The hardlink patch is worth about 2GB disk use
(non-rmwork).

I also totalled the time in each task type, the output is below. The
numbers there are interesting as the strip patch seems to add 100s to
do_populate_sysroot. There doesn't seem to be a big difference in
compile time.

Its very hard to figure out what in these tests might be noise and what
if anything was a real gain (other than the disk usage improvements). I
suspect the hardlinking patch may be worthwhile, the other two are
perhaps not useful.

I often get asked what things we've tried so this should go some way to
documenting that and give people in insight into how we can test
changes.

Cheers,

Richard

baseline (master):
do_compile                 4062.83s
do_compile_kernelmodules   69.14s
do_compile_ptest_base      1.09s
do_configure               5455.18s
do_configure_ptest_base    1.11s
do_deploy                  13.34s
do_fetch                   20.4s
do_generate_toolchain_file 0.09s
do_install                 672.76s
do_install_locale          0.24s
do_install_ptest_base      0.72s
do_kernel_checkout         109.76s
do_kernel_configcheck      4.37s
do_kernel_configme         69.8s
do_kernel_link_vmlinux     0.09s
do_multilib_install        0.0s
do_package                 1136.39s
do_package_write_rpm       964.58s
do_packagedata             132.65s
do_patch                   96.29s
do_populate_lic            160.33s
do_populate_sysroot        490.19s
do_rootfs                  178.94s
do_sizecheck               0.08s
do_strip                   0.08s
do_uboot_mkimage           0.09s
do_unpack                  258.55s
do_validate_branches       18.69s
richard@dax:/media/build1/pokyperf/build-perf-test$ /home/richard/buildstats-tasktotals.py results-3e7cab9-20131112082932/buildstats-test1/core-image-sato-qemux86/201311120837/
do_compile                 4108.84s
do_compile_kernelmodules   69.34s
do_compile_ptest_base      0.99s
do_configure               5419.83s
do_configure_ptest_base    1.02s
do_deploy                  13.88s
do_fetch                   37.07s
do_generate_toolchain_file 0.1s
do_install                 628.89s
do_install_locale          0.53s
do_install_ptest_base      0.85s
do_kernel_checkout         47.62s
do_kernel_configcheck      4.25s
do_kernel_configme         94.91s
do_kernel_link_vmlinux     0.15s
do_multilib_install        0.0s
do_package                 1176.35s
do_package_write_rpm       947.94s
do_packagedata             182.74s
do_patch                   101.38s
do_populate_lic            152.46s
do_populate_sysroot        593.62s
do_rootfs                  180.68s
do_sizecheck               0.09s
do_strip                   0.14s
do_uboot_mkimage           0.08s
do_unpack                  290.88s
do_validate_branches       73.12s
richard@dax:/media/build1/pokyperf/build-perf-test$ /home/richard/buildstats-tasktotals.py results-d30b212-20131112093824/buildstats-test1/core-image-sato-qemux86/201311120946/
do_bundle_initramfs        0.09s
do_compile                 4183.91s
do_compile_kernelmodules   69.55s
do_compile_ptest_base      1.1s
do_configure               5535.51s
do_configure_ptest_base    0.98s
do_deploy                  13.37s
do_evacuate_scripts        4.32s
do_fetch                   47.25s
do_generate_toolchain_file 0.09s
do_install                 667.07s
do_install_locale          0.23s
do_install_ptest_base      0.81s
do_kernel_checkout         39.4s
do_kernel_configcheck      4.39s
do_kernel_configme         11.32s
do_kernel_link_vmlinux     0.09s
do_multilib_install        0.0s
do_package                 1176.05s
do_package_write_rpm       987.45s
do_packagedata             162.89s
do_patch                   97.33s
do_populate_lic            127.9s
do_populate_sysroot        594.76s
do_rootfs                  180.98s
do_sizecheck               0.1s
do_strip                   0.12s
do_uboot_mkimage           0.08s
do_unpack                  319.22s
do_validate_branches       12.08s
:/media/build1/pokyperf/build-perf-test$ /home/richard/buildstats-tasktotals.py results-2feafbb-20131112002904/buildstats-test1/core-image-sato-qemux86/201311120037/
do_bundle_initramfs        0.09s
do_compile                 4195.68s
do_compile_kernelmodules   71.07s
do_compile_ptest_base      1.09s
do_configure               5741.49s
do_configure_ptest_base    1.12s
do_deploy                  13.33s
do_evacuate_scripts        0.18s
do_fetch                   18.1s
do_generate_toolchain_file 0.09s
do_install                 697.21s
do_install_locale          0.38s
do_install_ptest_base      0.84s
do_kernel_checkout         143.08s
do_kernel_configcheck      3.85s
do_kernel_configme         60.15s
do_kernel_link_vmlinux     0.09s
do_multilib_install        0.0s
do_package                 1118.97s
do_package_write_rpm       957.41s
do_packagedata             134.04s
do_patch                   101.13s
do_populate_lic            123.11s
do_populate_sysroot        598.03s
do_rootfs                  182.04s
do_sizecheck               0.11s
do_strip                   0.15s
do_uboot_mkimage           0.1s
do_unpack                  286.99s
do_validate_branches       11.91s



