Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 4B8946FF84
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Apr 2017 18:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1491849532; x=1523385532;
	h=date:from:to:subject:message-id:reply-to:mime-version;
	bh=c8oLlMIUaoQsB569NhXgttwck/qZAmF6zsE1aCYXvXk=;
	b=ZY9GdISUkVI7KLNdUVRrV06/yDFZDeU51q5BP316YFM/uoA80QACihy9
	29vmY8CKWMlJd5F89vh3u9r60PaNng==;
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Apr 2017 11:38:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,182,1488873600"; d="scan'208";a="1153977433"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 10 Apr 2017 11:38:51 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 6786A6A4080
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Apr 2017 11:38:41 -0700 (PDT)
Date: Mon, 10 Apr 2017 21:26:23 +0300
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Message-ID: <20170410182623.GA24948@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: [PATCH 6/6] runqemu: do not rely on grepping images
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
X-List-Received-Date: Mon, 10 Apr 2017 18:38:50 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

This patch breaks wic test_qemu test case. The reason is that it runs qemu with
-drive if=none command line option. Changing it to -drive if=virtio should fix the issue.

stty: standard input: Inappropriate ioctl for device
runqemu - INFO - Running /bin/ip link...
runqemu - INFO - Acquiring lockfile /tmp/qemu-tap-locks/tap0.lock...
runqemu - INFO - Using preconfigured tap device tap0
runqemu - INFO - If this is not intended, touch
/tmp/qemu-tap-locks/tap0.skip to make runqemu skip tap0.
runqemu - INFO - Network configuration:
192.168.7.2::192.168.7.1:255.255.255.0
runqemu - INFO - Using scsi drive
runqemu - INFO - Running ldd
/home/ed/git/yocto/poky/build/tmp/work/qemux86_64-poky-linux/wic-image-minimal/1.0-r0/recipe-sysroot-native/usr/bin/qemu-system-x86_64...
runqemu - INFO - Running
/home/ed/git/yocto/poky/build/tmp/work/qemux86_64-poky-linux/wic-image-minimal/1.0-r0/recipe-sysroot-native/usr/bin/qemu-system-x86_64
-device virtio-net-pci,netdev=net0,mac=52:54:00:12:34:02 -netdev
tap,id=net0,ifname=tap0,script=no,downscript=no -drive
if=none,id=hd,file=/home/ed/git/yocto/poky/build/tmp/deploy/images/qemux86-64/wic-image-minimal-qemux86-64.wic,format=raw
-device virtio-scsi-pci,id=scsi -device scsi-hd,drive=hd -no-reboot -vga
vmware -show-cursor -usb -usbdevice tablet -device virtio-rng-pci
-nographic -serial tcp:127.0.0.1:38144  -cpu core2duo -m 256 -serial
tcp:127.0.0.1:33992 -snapshot 
QEMU 2.8.0 monitor - type 'help' for more information
(qemu) 
Waiting at most 1000 seconds for login banner
Connection from 127.0.0.1:51177
Reached login banner
Logged as root in serial console
Stopping logging thread
Stop event received
Tearing down logging thread
Sending SIGTERM to runqemu
FAIL

======================================================================
FAIL: test_qemu (oeqa.selftest.wic.Wic)
Test wic-image-minimal under qemu
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/ed/git/yocto/poky/meta/lib/oeqa/utils/decorators.py", line
109, in wrapped_f
    return func(*args, **kwargs)
  File "/home/ed/git/yocto/poky/meta/lib/oeqa/selftest/wic.py", line 57,
in wrapped_f
    return func(*args, **kwargs)
  File "/home/ed/git/yocto/poky/meta/lib/oeqa/selftest/wic.py", line
613, in test_qemu
    self.assertEqual(output, '/dev/root /\r\n/dev/vda3 /mnt')
AssertionError: '/dev/root /' != '/dev/root /\r\n/dev/vda3 /mnt'
- /dev/root /
+ /dev/root /
/dev/vda3 /mnt


----------------------------------------------------------------------
Ran 1 test in 179.193s

--
Regards,
Ed

