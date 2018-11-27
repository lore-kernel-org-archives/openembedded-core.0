Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 618BD6C5C1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Nov 2018 15:24:53 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	wARFOqAP019810
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Nov 2018 15:24:53 GMT
Message-ID: <1ce120dd374a4af1e47cfc6ad6fb0d1be9132d8a.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 27 Nov 2018 15:24:52 +0000
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.2 at dan
X-Virus-Status: Clean
Subject: oe-selftest instability - help needed!
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
X-List-Received-Date: Tue, 27 Nov 2018 15:24:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

We have a problem with oe-selftest in that we're seeing a lot of
instability in the form of "random" failures that sometimes occur but
often don't.

These are a problem as it means the builds go red and someone has to
dig through the logs and figure out what broke. Doing this repeatedly
for builds is quite tedious. The SWAT process isn't even really picking
these up or logging them in bugzilla :(.

This problem has made significantly worse by the recent changes to the
autobuilder where we now run oe-selftest once per distro. This
increases the chances of failure.

I've included summary logs below of the failures only from
master/master-next in the last 24 hours. There are tons more in the
system and there are also many issues for the stable branches :(.

So far I've added some extra logging to -next and have a patch for the
gpg agent deletion/FieNotFound issue. I think the cpio segfault may be
files changing from under it and was thinking about some kind of
inotify watch to try and spot it.

I could really use help from others in trying to root cause some of
these. We're likely going to have to hold up patch merging until we get
to the bottom of the stability problems.

I suspect most of these are race style issues as they tend to occur on
loaded systems and not reproduce on builds which are from sstate.

Cheers,

Richard




debian9-ty-2 master-next
https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/18

2018-11-27 13:58:44,758 - oe-selftest - INFO - ======================================================================
2018-11-27 13:58:44,758 - oe-selftest - INFO - ERROR: runqemu.RunqemuTests.test_boot_deploy_hddimg (subunit.RemotedTestCase)
2018-11-27 13:58:44,758 - oe-selftest - INFO - ----------------------------------------------------------------------
2018-11-27 13:58:44,758 - oe-selftest - INFO - testtools.testresult.real._StringException: Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeqa/utils/commands.py", line 337, in runqemu
    qemu.start(params=qemuparams, ssh=ssh, runqemuparams=runqemuparams, launch_cmd=launch_cmd, discard_writes=discard_writes)
  File "/home/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeqa/targetcontrol.py", line 180, in start
    raise bb.build.FuncFailed("%s - FAILED to start qemu - check the task log and the boot log" % self.pn)
bb.build.FuncFailed: Function failed: core-image-minimal - FAILED to start qemu - check the task log and the boot log

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeqa/core/decorator/__init__.py", line 32, in wrapped_f
    return func(*args, **kwargs)
  File "/home/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeqa/selftest/cases/runqemu.py", line 97, in test_boot_deploy_hddimg
    with runqemu(self.recipe, ssh=False, launch_cmd=cmd) as qemu:
  File "/usr/lib/python3.5/contextlib.py", line 59, in __enter__
    return next(self.gen)
  File "/home/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeqa/utils/commands.py", line 339, in runqemu
    raise Exception('Failed to start QEMU - see the logs in %s' % logdir)
Exception: Failed to start QEMU - see the logs in /home/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-28103/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/testimage

debian9-ty-2 master-next
https://autobuilder.yoctoproject.org/typhoon/#/builders/56/builds/11

2018-11-27 14:03:03,386 - oe-selftest - INFO - ======================================================================
2018-11-27 14:03:03,386 - oe-selftest - INFO - ERROR: runqemu.RunqemuTests.test_boot_deploy_hddimg (subunit.RemotedTestCase)
2018-11-27 14:03:03,386 - oe-selftest - INFO - ----------------------------------------------------------------------
2018-11-27 14:03:03,386 - oe-selftest - INFO - testtools.testresult.real._StringException: Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/oe-selftest/build/meta/lib/oeqa/utils/commands.py", line 337, in runqemu
    qemu.start(params=qemuparams, ssh=ssh, runqemuparams=runqemuparams, launch_cmd=launch_cmd, discard_writes=discard_writes)
  File "/home/pokybuild/yocto-worker/oe-selftest/build/meta/lib/oeqa/targetcontrol.py", line 180, in start
    raise bb.build.FuncFailed("%s - FAILED to start qemu - check the task log and the boot log" % self.pn)
bb.build.FuncFailed: Function failed: core-image-minimal - FAILED to start qemu - check the task log and the boot log

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/oe-selftest/build/meta/lib/oeqa/core/decorator/__init__.py", line 32, in wrapped_f
    return func(*args, **kwargs)
  File "/home/pokybuild/yocto-worker/oe-selftest/build/meta/lib/oeqa/selftest/cases/runqemu.py", line 97, in test_boot_deploy_hddimg
    with runqemu(self.recipe, ssh=False, launch_cmd=cmd) as qemu:
  File "/usr/lib/python3.5/contextlib.py", line 59, in __enter__
    return next(self.gen)
  File "/home/pokybuild/yocto-worker/oe-selftest/build/meta/lib/oeqa/utils/commands.py", line 339, in runqemu
    raise Exception('Failed to start QEMU - see the logs in %s' % logdir)
Exception: Failed to start QEMU - see the logs in /home/pokybuild/yocto-worker/oe-selftest/build/build-st-31366/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/testimage


ubuntu1804-ty-3 master-next
https://autobuilder.yoctoproject.org/typhoon/#/builders/56/builds/12

2018-11-27 13:43:27,665 - oe-selftest - INFO - ======================================================================
2018-11-27 13:43:27,665 - oe-selftest - INFO - FAIL: runqemu.RunqemuTests.test_boot_rootfs (subunit.RemotedTestCase)
2018-11-27 13:43:27,665 - oe-selftest - INFO - ----------------------------------------------------------------------
2018-11-27 13:43:27,665 - oe-selftest - INFO - testtools.testresult.real._StringException: Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/oe-selftest/build/meta/lib/oeqa/core/decorator/__init__.py", line 32, in wrapped_f
    return func(*args, **kwargs)
  File "/home/pokybuild/yocto-worker/oe-selftest/build/meta/lib/oeqa/selftest/cases/runqemu.py", line 137, in test_boot_rootfs
    self.assertTrue(qemu.runner.logged, "Failed: %s" % cmd)
  File "/usr/lib/python3.6/unittest/case.py", line 682, in assertTrue
    raise self.failureException(msg)
AssertionError: False is not true : Failed: runqemu nographic /home/pokybuild/yocto-worker/oe-selftest/build/build-st-1259/tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.ext4

debian8-ty-1 master-next
https://autobuilder.yoctoproject.org/typhoon/#/builders/56/builds/10

2018-11-27 02:16:31,246 - oe-selftest - INFO - ======================================================================
2018-11-27 02:16:31,246 - oe-selftest - INFO - FAIL: wic.Wic.test_rootfs_indirect_recipes (subunit.RemotedTestCase)
2018-11-27 02:16:31,246 - oe-selftest - INFO - ----------------------------------------------------------------------
2018-11-27 02:16:31,246 - oe-selftest - INFO - testtools.testresult.real._StringException: Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/oe-selftest/build/meta/lib/oeqa/core/decorator/__init__.py", line 32, in wrapped_f
    return func(*args, **kwargs)
  File "/home/pokybuild/yocto-worker/oe-selftest/build/meta/lib/oeqa/selftest/cases/wic.py", line 58, in wrapped_f
    return func(*args, **kwargs)
  File "/home/pokybuild/yocto-worker/oe-selftest/build/meta/lib/oeqa/selftest/cases/wic.py", line 381, in test_rootfs_indirect_recipes
    "--outdir %s" % self.resultdir)
  File "/home/pokybuild/yocto-worker/oe-selftest/build/meta/lib/oeqa/utils/commands.py", line 194, in runCmd
    raise AssertionError("Command '%s' returned non-zero exit status %d:\n%s" % (command, result.status, exc_output))
AssertionError: Command 'wic create directdisk-multi-rootfs --image-name=core-image-minimal --rootfs rootfs1=core-image-minimal --rootfs rootfs2=core-image-minimal --outdir /home/pokybuild/yocto-worker/oe-selftest/build/build-st-19661/wic-tmp/' returned non-zero exit status 1:
INFO: Building wic-tools...

ERROR: Unable to start bitbake server

denian9-ty-1 master-next #1
https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/16

2018-11-26 16:52:24,931 - oe-selftest - INFO - ======================================================================
2018-11-26 16:52:24,931 - oe-selftest - INFO - ERROR: signing.Signing.test_signing_packages (subunit.RemotedTestCase)
2018-11-26 16:52:24,931 - oe-selftest - INFO - ----------------------------------------------------------------------
2018-11-26 16:52:24,931 - oe-selftest - INFO - testtools.testresult.real._StringException: Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeqa/core/case.py", line 46, in _oeTearDown
    self.tearDownMethod()
  File "/home/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeqa/selftest/case.py", line 170, in tearDown
    shutil.rmtree(path)
  File "/usr/lib/python3.5/shutil.py", line 480, in rmtree
    _rmtree_safe_fd(fd, path, onerror)
  File "/usr/lib/python3.5/shutil.py", line 438, in _rmtree_safe_fd
    onerror(os.unlink, fullname, sys.exc_info())
  File "/usr/lib/python3.5/shutil.py", line 436, in _rmtree_safe_fd
    os.unlink(name, dir_fd=topfd)
FileNotFoundError: [Errno 2] No such file or directory: 'S.gpg-agent.extra'

denian9-ty-1 master-next #2
https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/16

2018-11-26 16:52:24,931 - oe-selftest - INFO - ======================================================================
2018-11-26 16:52:24,932 - oe-selftest - INFO - ERROR: signing.Signing.test_signing_sstate_archive (subunit.RemotedTestCase)
2018-11-26 16:52:24,932 - oe-selftest - INFO - ----------------------------------------------------------------------
2018-11-26 16:52:24,932 - oe-selftest - INFO - testtools.testresult.real._StringException: Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeqa/core/case.py", line 46, in _oeTearDown
    self.tearDownMethod()
  File "/home/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeqa/selftest/case.py", line 170, in tearDown
    shutil.rmtree(path)
  File "/usr/lib/python3.5/shutil.py", line 480, in rmtree
    _rmtree_safe_fd(fd, path, onerror)
  File "/usr/lib/python3.5/shutil.py", line 438, in _rmtree_safe_fd
    onerror(os.unlink, fullname, sys.exc_info())
  File "/usr/lib/python3.5/shutil.py", line 436, in _rmtree_safe_fd
    os.unlink(name, dir_fd=topfd)
FileNotFoundError: [Errno 2] No such file or directory: 'S.gpg-agent.extra'

opensuse423-ty-1 master-next #1
https://autobuilder.yoctoproject.org/typhoon/#/builders/84/builds/16

2018-11-27 00:18:09,479 - oe-selftest - INFO - ======================================================================
2018-11-27 00:18:09,479 - oe-selftest - INFO - FAIL: imagefeatures.ImageFeatures.test_image_fstypes (subunit.RemotedTestCase)
2018-11-27 00:18:09,479 - oe-selftest - INFO - ----------------------------------------------------------------------
2018-11-27 00:18:09,479 - oe-selftest - INFO - testtools.testresult.real._StringException: Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/oe-selftest-opensuse/build/meta/lib/oeqa/core/decorator/__init__.py", line 32, in wrapped_f
    return func(*args, **kwargs)
  File "/home/pokybuild/yocto-worker/oe-selftest-opensuse/build/meta/lib/oeqa/selftest/cases/imagefeatures.py", line 220, in test_image_fstypes
    bitbake(image_name)
  File "/home/pokybuild/yocto-worker/oe-selftest-opensuse/build/meta/lib/oeqa/utils/commands.py", line 216, in bitbake
    return runCmd(cmd, ignore_status, timeout, output_log=output_log, **options)
  File "/home/pokybuild/yocto-worker/oe-selftest-opensuse/build/meta/lib/oeqa/utils/commands.py", line 194, in runCmd
    raise AssertionError("Command '%s' returned non-zero exit status %d:\n%s" % (command, result.status, exc_output))
AssertionError: Command 'bitbake  core-image-minimal' returned non-zero exit status 1:
Parsing recipes...done.
Parsing of 813 .bb files complete (0 cached, 813 parsed). 1297 targets, 43 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.40.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal-4.8"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "2.6+snapshot-20181126"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "master-next:8399512a132718eff1cbf370eb21eb88cf891426"
meta-selftest        = "master:a54f6e45d91fea3162b84672e1233533dbe61d02"

Initialising tasks...done.
Sstate summary: Wanted 144 Found 139 Missed 5 Current 740 (96% match, 99% complete)
NOTE: Executing SetScene Tasks
NOTE: Running setscene task 763 of 888 (/home/pokybuild/yocto-worker/oe-selftest-opensuse/build/meta/recipes-core/initrdscripts/initramfs-module-install_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 775 of 888 (/home/pokybuild/yocto-worker/oe-selftest-opensuse/build/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 786 of 888 (/home/pokybuild/yocto-worker/oe-selftest-opensuse/build/meta/recipes-devtools/dosfstools/dosfstools_4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 800 of 888 (/home/pokybuild/yocto-worker/oe-selftest-opensuse/build/meta/recipes-extended/parted/parted_3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 815 of 888 (/home/pokybuild/yocto-worker/oe-selftest-opensuse/build/meta/recipes-core/initrdscripts/initramfs-module-setup-live_1.0.bb:do_package_qa_setscene)
NOTE: Running setscene task 816 of 888 (/home/pokybuild/yocto-worker/oe-selftest-opensuse/build/meta/recipes-core/initrdscripts/initramfs-module-setup-live_1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 817 of 888 (/home/pokybuild/yocto-worker/oe-selftest-opensuse/build/meta/recipes-core/initrdscripts/initramfs-module-install-efi_1.0.bb:do_package_qa_setscene)
NOTE: Running setscene task 818 of 888 (/home/pokybuild/yocto-worker/oe-selftest-opensuse/build/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb:do_package_qa_setscene)
NOTE: Running setscene task 819 of 888 (/home/pokybuild/yocto-worker/oe-selftest-opensuse/build/meta/recipes-core/initrdscripts/initramfs-module-install-efi_1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 820 of 888 (/home/pokybuild/yocto-worker/oe-selftest-opensuse/build/meta/recipes-core/initrdscripts/initramfs-module-install_1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 821 of 888 (/home/pokybuild/yocto-worker/oe-selftest-opensuse/build/meta/recipes-core/initrdscripts/initramfs-module-setup-live_1.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 822 of 888 (/home/pokybuild/yocto-worker/oe-selftest-opensuse/build/meta/recipes-core/initrdscripts/initramfs-module-install_1.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 823 of 888 (/home/pokybuild/yocto-worker/oe-selftest-opensuse/build/meta/recipes-devtools/dosfstools/dosfstools_4.1.bb:do_populate_lic_setscene)
NOTE: Running setscene task 824 of 888 (/home/pokybuild/yocto-worker/oe-selftest-opensuse/build/meta/recipes-devtools/dosfstools/dosfstools_4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 825 of 888 (/home/pokybuild/yocto-worker/oe-selftest-opensuse/build/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 826 of 888 (/home/pokybuild/yocto-worker/oe-selftest-opensuse/build/meta/recipes-extended/parted/parted_3.2.bb:do_package_write_rpm_setscene)
NOTE: recipe initramfs-module-install-1.0-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe initramfs-module-install-1.0-r1: task do_package_write_rpm_setscene: Started
NOTE: recipe initramfs-module-install-1.0-r1: task do_populate_lic_setscene: Started
NOTE: recipe initramfs-module-install-1.0-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 827 of 888 (/home/pokybuild/yocto-worker/oe-selftest-opensuse/build/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb:do_populate_lic_setscene)
NOTE: recipe initramfs-module-install-1.0-r1: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 828 of 888 (/home/pokybuild/yocto-worker/oe-selftest-opensuse/build/meta/recipes-extended/parted/parted_3.2.bb:do_package_qa_setscene)
NOTE: recipe initramfs-module-install-1.0-r1: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 830 of 888 (/home/pokybuild/yocto-worker/oe-selftest-opensuse/build/meta/recipes-core/images/core-image-minimal-initramfs.bb:do_populate_lic_setscene)
NOTE: recipe initramfs-module-install-efi-1.0-r4: task do_package_write_rpm_setscene: Started
NOTE: recipe initramfs-module-install-efi-1.0-r4: task do_package_qa_setscene: Started
NOTE: recipe initramfs-module-setup-live-1.0-r4: task do_populate_lic_setscene: Started
NOTE: recipe initramfs-module-setup-live-1.0-r4: task do_package_write_rpm_setscene: Started
NOTE: recipe initramfs-framework-1.0-r4: task do_populate_sysroot_setscene: Started
NOTE: recipe initramfs-framework-1.0-r4: task do_populate_lic_setscene: Started
NOTE: recipe initramfs-module-setup-live-1.0-r4: task do_package_qa_setscene: Started
NOTE: recipe initramfs-framework-1.0-r4: task do_package_write_rpm_setscene: Started
NOTE: recipe initramfs-framework-1.0-r4: task do_package_qa_setscene: Started
NOTE: recipe initramfs-module-install-efi-1.0-r4: task do_package_qa_setscene: Succeeded
NOTE: recipe initramfs-module-install-efi-1.0-r4: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 832 of 888 (/home/pokybuild/yocto-worker/oe-selftest-opensuse/build/meta/recipes-core/initrdscripts/initramfs-module-install-efi_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 835 of 888 (/home/pokybuild/yocto-worker/oe-selftest-opensuse/build/meta/recipes-core/initrdscripts/initramfs-module-install-efi_1.0.bb:do_populate_lic_setscene)
NOTE: recipe dosfstools-4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dosfstools-4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe initramfs-module-install-efi-1.0-r4: task do_populate_lic_setscene: Started
NOTE: recipe dosfstools-4.1-r0: task do_populate_lic_setscene: Started
NOTE: recipe initramfs-framework-1.0-r4: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 839 of 888 (/home/pokybuild/yocto-worker/oe-selftest-opensuse/build/meta/recipes-core/initrdscripts/initramfs-module-install_1.0.bb:do_package_qa_setscene)
NOTE: recipe initramfs-framework-1.0-r4: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe initramfs-framework-1.0-r4: task do_populate_lic_setscene: Succeeded
NOTE: recipe initramfs-framework-1.0-r4: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 840 of 888 (/home/pokybuild/yocto-worker/oe-selftest-opensuse/build/meta/recipes-core/initrdscripts/initramfs-module-install-efi_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 841 of 888 (/home/pokybuild/yocto-worker/oe-selftest-opensuse/build/meta/recipes-extended/parted/parted_3.2.bb:do_populate_lic_setscene)
NOTE: recipe parted-3.2-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe parted-3.2-r1: task do_package_write_rpm_setscene: Started
NOTE: recipe parted-3.2-r1: task do_package_qa_setscene: Started
NOTE: Running setscene task 843 of 888 (/home/pokybuild/yocto-worker/oe-selftest-opensuse/build/meta/recipes-devtools/dosfstools/dosfstools_4.1.bb:do_package_qa_setscene)
NOTE: recipe initramfs-module-install-efi-1.0-r4: task do_packagedata_setscene: Started
NOTE: recipe initramfs-module-install-efi-1.0-r4: task do_populate_lic_setscene: Succeeded
NOTE: recipe core-image-minimal-initramfs-1.0-r0: task do_populate_lic_setscene: Started
NOTE: Running setscene task 866 of 888 (virtual:native:/home/pokybuild/yocto-worker/oe-selftest-opensuse/build/meta/recipes-devtools/mtd/mtd-utils_git.bb:do_populate_lic_setscene)
NOTE: recipe parted-3.2-r1: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 867 of 888 (virtual:native:/home/pokybuild/yocto-worker/oe-selftest-opensuse/build/meta/recipes-devtools/mtd/mtd-utils_git.bb:do_populate_sysroot_setscene)
NOTE: recipe initramfs-module-install-1.0-r1: task do_package_qa_setscene: Started
NOTE: recipe parted-3.2-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 871 of 888 (/home/pokybuild/yocto-worker/oe-selftest-opensuse/build/meta/recipes-core/initrdscripts/initramfs-module-setup-live_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe initramfs-module-install-efi-1.0-r4: task do_populate_sysroot_setscene: Started
NOTE: recipe core-image-minimal-initramfs-1.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe initramfs-module-install-efi-1.0-r4: task do_packagedata_setscene: Succeeded
NOTE: recipe dosfstools-4.1-r0: task do_package_qa_setscene: Started
NOTE: recipe parted-3.2-r1: task do_populate_lic_setscene: Started
NOTE: recipe initramfs-module-install-1.0-r1: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 879 of 888 (/home/pokybuild/yocto-worker/oe-selftest-opensuse/build/meta/recipes-core/initrdscripts/initramfs-module-install_1.0.bb:do_packagedata_setscene)
NOTE: recipe initramfs-module-install-efi-1.0-r4: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dosfstools-4.1-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe dosfstools-4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dosfstools-4.1-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe parted-3.2-r1: task do_populate_lic_setscene: Succeeded
NOTE: recipe dosfstools-4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe parted-3.2-r1: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 880 of 888 (/home/pokybuild/yocto-worker/oe-selftest-opensuse/build/meta/recipes-devtools/dosfstools/dosfstools_4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 881 of 888 (/home/pokybuild/yocto-worker/oe-selftest-opensuse/build/meta/recipes-extended/parted/parted_3.2.bb:do_packagedata_setscene)
NOTE: recipe initramfs-module-install-1.0-r1: task do_packagedata_setscene: Started
NOTE: recipe initramfs-module-setup-live-1.0-r4: task do_populate_sysroot_setscene: Started
NOTE: recipe mtd-utils-native-2.0.2+AUTOINC+bc63d36e39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mtd-utils-native-2.0.2+AUTOINC+bc63d36e39-r0: task do_populate_lic_setscene: Started
NOTE: recipe dosfstools-4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe parted-3.2-r1: task do_packagedata_setscene: Started
NOTE: recipe initramfs-module-install-1.0-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe initramfs-module-setup-live-1.0-r4: task do_package_qa_setscene: Succeeded
NOTE: recipe initramfs-module-setup-live-1.0-r4: task do_populate_lic_setscene: Succeeded
NOTE: recipe initramfs-module-setup-live-1.0-r4: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 883 of 888 (/home/pokybuild/yocto-worker/oe-selftest-opensuse/build/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 884 of 888 (/home/pokybuild/yocto-worker/oe-selftest-opensuse/build/meta/recipes-core/initrdscripts/initramfs-module-setup-live_1.0.bb:do_packagedata_setscene)
NOTE: recipe initramfs-module-setup-live-1.0-r4: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mtd-utils-native-2.0.2+AUTOINC+bc63d36e39-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe dosfstools-4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initramfs-module-setup-live-1.0-r4: task do_packagedata_setscene: Started
NOTE: recipe initramfs-framework-1.0-r4: task do_packagedata_setscene: Started
NOTE: recipe mtd-utils-native-2.0.2+AUTOINC+bc63d36e39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initramfs-module-setup-live-1.0-r4: task do_packagedata_setscene: Succeeded
NOTE: recipe initramfs-framework-1.0-r4: task do_packagedata_setscene: Succeeded
NOTE: recipe parted-3.2-r1: task do_packagedata_setscene: Succeeded
NOTE: Executing RunQueue Tasks
NOTE: Running task 2484 of 2898 (/home/pokybuild/yocto-worker/oe-selftest-opensuse/build/meta/recipes-core/images/core-image-minimal.bb:do_rootfs)
NOTE: Running noexec task 2519 of 2898 (/home/pokybuild/yocto-worker/oe-selftest-opensuse/build/meta/recipes-core/images/core-image-minimal-initramfs.bb:do_fetch)
NOTE: Running task 2525 of 2898 (/home/pokybuild/yocto-worker/oe-selftest-opensuse/build/meta/recipes-core/images/core-image-minimal-initramfs.bb:do_prepare_recipe_sysroot)
NOTE: Running noexec task 2642 of 2898 (/home/pokybuild/yocto-worker/oe-selftest-opensuse/build/meta/recipes-core/initrdscripts/initramfs-module-install_1.0.bb:do_build)
NOTE: Running noexec task 2681 of 2898 (/home/pokybuild/yocto-worker/oe-selftest-opensuse/build/meta/recipes-devtools/dosfstools/dosfstools_4.1.bb:do_build)
NOTE: Running noexec task 2711 of 2898 (/home/pokybuild/yocto-worker/oe-selftest-opensuse/build/meta/recipes-core/initrdscripts/initramfs-module-setup-live_1.0.bb:do_build)
NOTE: Running noexec task 2749 of 2898 (/home/pokybuild/yocto-worker/oe-selftest-opensuse/build/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb:do_build)
NOTE: Running noexec task 2827 of 2898 (/home/pokybuild/yocto-worker/oe-selftest-opensuse/build/meta/recipes-core/initrdscripts/initramfs-module-install-efi_1.0.bb:do_build)
NOTE: Running noexec task 2836 of 2898 (virtual:native:/home/pokybuild/yocto-worker/oe-selftest-opensuse/build/meta/recipes-devtools/mtd/mtd-utils_git.bb:do_build)
NOTE: Running noexec task 2838 of 2898 (/home/pokybuild/yocto-worker/oe-selftest-opensuse/build/meta/recipes-extended/parted/parted_3.2.bb:do_build)
NOTE: recipe core-image-minimal-initramfs-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe core-image-minimal-1.0-r0: task do_rootfs: Started
NOTE: recipe core-image-minimal-initramfs-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2870 of 2898 (/home/pokybuild/yocto-worker/oe-selftest-opensuse/build/meta/recipes-core/images/core-image-minimal-initramfs.bb:do_rootfs)
NOTE: recipe core-image-minimal-initramfs-1.0-r0: task do_rootfs: Started
NOTE: recipe core-image-minimal-1.0-r0: task do_rootfs: Succeeded
NOTE: Running task 2871 of 2898 (/home/pokybuild/yocto-worker/oe-selftest-opensuse/build/meta/recipes-core/images/core-image-minimal.bb:do_write_qemuboot_conf)
NOTE: Running task 2872 of 2898 (/home/pokybuild/yocto-worker/oe-selftest-opensuse/build/meta/recipes-core/images/core-image-minimal.bb:do_image_qa)
NOTE: recipe core-image-minimal-1.0-r0: task do_write_qemuboot_conf: Started
NOTE: recipe core-image-minimal-1.0-r0: task do_write_qemuboot_conf: Succeeded
NOTE: recipe core-image-minimal-1.0-r0: task do_image_qa: Started
NOTE: recipe core-image-minimal-1.0-r0: task do_image_qa: Succeeded
NOTE: Running task 2873 of 2898 (/home/pokybuild/yocto-worker/oe-selftest-opensuse/build/meta/recipes-core/images/core-image-minimal.bb:do_image)
NOTE: recipe core-image-minimal-1.0-r0: task do_image: Started
NOTE: recipe core-image-minimal-1.0-r0: task do_image: Succeeded
NOTE: Running task 2874 of 2898 (/home/pokybuild/yocto-worker/oe-selftest-opensuse/build/meta/recipes-core/images/core-image-minimal.bb:do_image_ext4)
NOTE: Running task 2875 of 2898 (/home/pokybuild/yocto-worker/oe-selftest-opensuse/build/meta/recipes-core/images/core-image-minimal.bb:do_rootfs_wicenv)
NOTE: Running task 2876 of 2898 (/home/pokybuild/yocto-worker/oe-selftest-opensuse/build/meta/recipes-core/images/core-image-minimal.bb:do_image_ubifs)
NOTE: Running task 2877 of 2898 (/home/pokybuild/yocto-worker/oe-selftest-opensuse/build/meta/recipes-core/images/core-image-minimal.bb:do_image_ext2)
NOTE: Running task 2878 of 2898 (/home/pokybuild/yocto-worker/oe-selftest-opensuse/build/meta/recipes-core/images/core-image-minimal.bb:do_image_cpio)
NOTE: Running task 2879 of 2898 (/home/pokybuild/yocto-worker/oe-selftest-opensuse/build/meta/recipes-core/images/core-image-minimal.bb:do_image_squashfs_lz4)
NOTE: recipe core-image-minimal-1.0-r0: task do_rootfs_wicenv: Started
NOTE: recipe core-image-minimal-1.0-r0: task do_rootfs_wicenv: Succeeded
NOTE: Running task 2880 of 2898 (/home/pokybuild/yocto-worker/oe-selftest-opensuse/build/meta/recipes-core/images/core-image-minimal.bb:do_image_wic)
NOTE: recipe core-image-minimal-1.0-r0: task do_image_ext4: Started
NOTE: recipe core-image-minimal-1.0-r0: task do_image_ubifs: Started
NOTE: Running task 2881 of 2898 (/home/pokybuild/yocto-worker/oe-selftest-opensuse/build/meta/recipes-core/images/core-image-minimal.bb:do_image_ubi)
NOTE: recipe core-image-minimal-1.0-r0: task do_image_ext2: Started
NOTE: recipe core-image-minimal-1.0-r0: task do_image_cpio: Started
NOTE: Running task 2882 of 2898 (/home/pokybuild/yocto-worker/oe-selftest-opensuse/build/meta/recipes-core/images/core-image-minimal.bb:do_image_squashfs_lzo)
NOTE: Running task 2883 of 2898 (/home/pokybuild/yocto-worker/oe-selftest-opensuse/build/meta/recipes-core/images/core-image-minimal.bb:do_image_btrfs)
NOTE: Running task 2884 of 2898 (/home/pokybuild/yocto-worker/oe-selftest-opensuse/build/meta/recipes-core/images/core-image-minimal.bb:do_image_cramfs)
NOTE: recipe core-image-minimal-1.0-r0: task do_image_squashfs_lz4: Started
NOTE: Running task 2885 of 2898 (/home/pokybuild/yocto-worker/oe-selftest-opensuse/build/meta/recipes-core/images/core-image-minimal.bb:do_image_tar)
NOTE: recipe core-image-minimal-1.0-r0: task do_image_wic: Started
NOTE: Running task 2886 of 2898 (/home/pokybuild/yocto-worker/oe-selftest-opensuse/build/meta/recipes-core/images/core-image-minimal.bb:do_image_squashfs)
NOTE: Running task 2887 of 2898 (/home/pokybuild/yocto-worker/oe-selftest-opensuse/build/meta/recipes-core/images/core-image-minimal.bb:do_image_squashfs_xz)
ERROR: core-image-minimal-1.0-r0 do_image_cpio: Function failed: do_image_cpio (log file is located at /home/pokybuild/yocto-worker/oe-selftest-opensuse/build/build-st-9429/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/temp/log.do_image_cpio.42412)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/oe-selftest-opensuse/build/build-st-9429/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/temp/log.do_image_cpio.42412
Log data follows:
| DEBUG: Executing python function set_image_size
| DEBUG: 12173.200000 = 9364 * 1.300000
| DEBUG: 12173.200000 = max(12173.200000, 8192)[12173.200000] + 1
| DEBUG: 12174.000000 = int(12173.200000)
| DEBUG: 12174 = aligned(12174)
| DEBUG: returning 12174
| DEBUG: Python function set_image_size finished
| DEBUG: Executing shell function do_image_cpio
| 16023 blocks
| /home/pokybuild/yocto-worker/oe-selftest-opensuse/build/build-st-9429/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/temp/run.do_image_cpio.42412: line 112: 42718 Done                    echo ./init
|      42719 Segmentation fault      (core dumped) | cpio -oA -H newc -F /home/pokybuild/yocto-worker/oe-selftest-opensuse/build/build-st-9429/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/deploy-core-image-minimal-image-complete/core-image-minimal-qemux86-64-20181126235134.rootfs.cpio
| WARNING: /home/pokybuild/yocto-worker/oe-selftest-opensuse/build/build-st-9429/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/temp/run.do_image_cpio.42412:1 exit 1 from 'ln -sf /sbin/init /home/pokybuild/yocto-worker/oe-selftest-opensuse/build/build-st-9429/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/cpio_append/init'
| ERROR: Function failed: do_image_cpio (log file is located at /home/pokybuild/yocto-worker/oe-selftest-opensuse/build/build-st-9429/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/temp/log.do_image_cpio.42412)
NOTE: recipe core-image-minimal-1.0-r0: task do_image_cpio: Failed
ERROR: Task (/home/pokybuild/yocto-worker/oe-selftest-opensuse/build/meta/recipes-core/images/core-image-minimal.bb:do_image_cpio) failed with exit code '1'
NOTE: recipe core-image-minimal-1.0-r0: task do_image_ubi: Started
NOTE: recipe core-image-minimal-1.0-r0: task do_image_squashfs_lzo: Started
NOTE: recipe core-image-minimal-1.0-r0: task do_image_ext4: Succeeded
NOTE: Running task 2888 of 2898 (/home/pokybuild/yocto-worker/oe-selftest-opensuse/build/meta/recipes-core/images/core-image-minimal.bb:do_image_jffs2)
NOTE: recipe core-image-minimal-1.0-r0: task do_image_btrfs: Started
NOTE: recipe core-image-minimal-1.0-r0: task do_image_cramfs: Started
NOTE: recipe core-image-minimal-1.0-r0: task do_image_tar: Started
NOTE: recipe core-image-minimal-1.0-r0: task do_image_squashfs: Started
NOTE: recipe core-image-minimal-1.0-r0: task do_image_squashfs_xz: Started
NOTE: recipe core-image-minimal-1.0-r0: task do_image_jffs2: Started
NOTE: recipe core-image-minimal-1.0-r0: task do_image_squashfs_lz4: Succeeded
NOTE: recipe core-image-minimal-1.0-r0: task do_image_squashfs_lzo: Succeeded
NOTE: recipe core-image-minimal-1.0-r0: task do_image_ubifs: Succeeded
WARNING: core-image-minimal-1.0-r0 do_image_btrfs: Rootfs size is too small for BTRFS. Filesystem will be extended to 16384K
NOTE: recipe core-image-minimal-1.0-r0: task do_image_btrfs: Succeeded
NOTE: recipe core-image-minimal-1.0-r0: task do_image_squashfs: Succeeded
NOTE: recipe core-image-minimal-1.0-r0: task do_image_ubi: Succeeded
NOTE: recipe core-image-minimal-1.0-r0: task do_image_squashfs_xz: Succeeded
NOTE: recipe core-image-minimal-1.0-r0: task do_image_jffs2: Succeeded
NOTE: recipe core-image-minimal-1.0-r0: task do_image_cramfs: Succeeded
NOTE: recipe core-image-minimal-1.0-r0: task do_image_tar: Succeeded
NOTE: recipe core-image-minimal-initramfs-1.0-r0: task do_rootfs: Succeeded
NOTE: recipe core-image-minimal-1.0-r0: task do_image_ext2: Succeeded
NOTE: recipe core-image-minimal-1.0-r0: task do_image_wic: Succeeded
NOTE: Tasks Summary: Attempted 2888 tasks of which 2859 didn't need to be rerun and 1 failed.
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/oe-selftest-opensuse/build/build-st-9429/tmp/log/error-report/error_report_20181126235134.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/oe-selftest-opensuse/build/build-st-9429/tmp/log/error-report/error_report_20181126235134.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/oe-selftest-opensuse/build/meta/recipes-core/images/core-image-minimal.bb:do_image_cpio
Summary: There was 1 WARNING message shown.
Summary: There was 1 ERROR message shown, returning a non-zero exit code.

opensuse423-ty-1 master-next #2
https://autobuilder.yoctoproject.org/typhoon/#/builders/84/builds/16

======================================================================
2018-11-27 00:18:09,479 - oe-selftest - INFO - FAIL: buildoptions.ImageOptionsTests.test_ccache_tool (subunit.RemotedTestCase)
2018-11-27 00:18:09,479 - oe-selftest - INFO - ----------------------------------------------------------------------
2018-11-27 00:18:09,479 - oe-selftest - INFO - testtools.testresult.real._StringException: Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/oe-selftest-opensuse/build/meta/lib/oeqa/core/decorator/__init__.py", line 32, in wrapped_f
    return func(*args, **kwargs)
  File "/home/pokybuild/yocto-worker/oe-selftest-opensuse/build/meta/lib/oeqa/selftest/cases/buildoptions.py", line 44, in test_ccache_tool
    self.assertEqual(0, res.status, msg="No match for ccache in m4 log.do_compile. For further details: %s" % log_compile)
  File "/usr/lib64/python3.4/unittest/case.py", line 800, in assertEqual
    assertion_func(first, second, msg=msg)
  File "/usr/lib64/python3.4/unittest/case.py", line 793, in _baseAssertEqual
    raise self.failureException(msg)
AssertionError: 0 != 1 : No match for ccache in m4 log.do_compile. For further details: /home/pokybuild/yocto-worker/oe-selftest-opensuse/build/build-st-9426/tmp/work/core2-64-poky-linux/m4/1.4.18-r0/temp/log.do_compile



