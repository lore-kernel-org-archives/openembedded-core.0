Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 5B9BA737F4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 11:50:15 +0000 (UTC)
Received: by iodt126 with SMTP id t126so145441249iod.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 04:50:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:date:organization
	:content-type:mime-version:content-transfer-encoding;
	bh=BJ3N1uMbwOXebjAimukk5stREh8wwAVWL5FmduLcHQQ=;
	b=M3RSveJelxdWnv9sP3nfsNjPxZuedoXZEhOakoMRVybBpxCjlBCT9Ngq1eo2Nullro
	2nFh/kW9xlBmV2mrb1+mNxO1AJPsPgLof93wMOhTkTmzVtqCthwL+Bx0rFpvbytDuzoB
	AjOTPjyd8CpRUBItQCcQNEl4Rp6u+7zJ3rZrHdVqziduFq0hQu7aSEPUmNWje/6O/mcg
	sbG6BGt53K5SwkaEaQU9Pc1SrKqfRhgqf11A8QH0RBpg/hxA3n/gJfeDYety/nlAHDey
	aVHu+jz/F7s/kXpyNHdV4lgAi2216cxhBYVsQKiT/7a2IZJ9nnlAi/qzmKj+B7EEomv/
	dgvg==
X-Gm-Message-State: ALoCoQmwSF5KbpqD5zrFUVtteXCULUPIZT4jDOoeNY3neqa/QymOkDZetdV+LTTSI8xKvWFbhS+7
X-Received: by 10.107.132.91 with SMTP id g88mr21095994iod.182.1440417015547; 
	Mon, 24 Aug 2015 04:50:15 -0700 (PDT)
Received: from pohly-mobl1 (p57A56DBD.dip0.t-ipconnect.de. [87.165.109.189])
	by smtp.gmail.com with ESMTPSA id
	m65sm12911174ioe.1.2015.08.24.04.50.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Aug 2015 04:50:14 -0700 (PDT)
Message-ID: <1440417012.3543.16.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 24 Aug 2015 13:50:12 +0200
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Subject: qemu + initramfs
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
X-List-Received-Date: Mon, 24 Aug 2015 11:50:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hello!

I just tried to boot a custom image under qemu with
core-image-minimal-initramfs included in the kernel. For that, I added
to my local.conf:
        
        INITRAMFS_IMAGE = "core-image-minimal-initramfs"
        INITRAMFS_IMAGE_BUNDLE = "1"

The extended kernel now gets built fine with the normal "bitbake
<image>".

To get runqemu to use the extended kernel, I had to mention it
explicitly:

        runqemu qemux86 <my-custom-image> ext4 serial kvm tmp-glibc/deploy/images/qemux86/bzImage-initramfs-qemux86.bin  'bootparams=systemd.journald.forward_to_console=1'

However, that failed initially with:

        IP-Config: Complete:
             device=eth0, hwaddr=52:54:00:12:34:56, ipaddr=192.168.7.2, mask=255.255.255.0, gw=192.168.7.1
             host=192.168.7.2, domain=, nis-domain=(none)
             bootserver=255.255.255.255, rootserver=255.255.255.255, rootpath=
        ALSA device list:
          No soundcards found.
        Kernel panic - not syncing: /dev/console is missing or not a character device!
        Please ensure your rootfs is properly configured
        
        CPU: 0 PID: 1 Comm: swapper/0 Not tainted 3.19.5-yocto-standard #7
        Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.8.2-0-g33fbe13 by qemu-project.org 04/01/2014
         00000000 00000000 cf89ff28 c18661ca c1cadc1c cf89ff40 c1864655 00000008
         c1cadc1c 00000008 00000166 cf89ff98 c1c0fbf3 c1a80990 00000000 00000000
         00000000 00000000 00000000 00000000 00000000 00000000 c236e380 cf8a0d60
        Call Trace:
         [<c18661ca>] dump_stack+0x4b/0x75
         [<c1864655>] panic+0x81/0x178
         [<c1c0fbf3>] kernel_init_freeable+0x16e/0x1e5
         [<c186b98b>] ? _raw_spin_unlock_irq+0x1b/0x40
         [<c106ae54>] ? finish_task_switch+0x54/0xc0
         [<c1862970>] kernel_init+0x10/0xe0
         [<c186c101>] ret_from_kernel_thread+0x21/0x30
         [<c1862960>] ? rest_init+0x80/0x80
        Kernel Offset: 0x0 from 0xc1000000 (relocation range: 0xc0000000-0xd07dffff)
        ---[ end Kernel panic - not syncing: /dev/console is missing or not a character device!
        Please ensure your rootfs is properly configured

Searching for the kernel panic led me to:
http://stackoverflow.com/questions/10437995/initramfs-built-into-custom-linux-kernel-is-not-running

The hint given there (/dev/console must exist in the initramfs because
the kernel opens it before executing /init) worked for like this:

diff --git a/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb
b/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb
index b54cb61..4066beb 100644
--- a/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb
@@ -11,9 +11,12 @@ S = "${WORKDIR}"
 
 do_install() {
         install -m 0755 ${WORKDIR}/init-live.sh ${D}/init
+        install -d ${D}/dev
+        mknod -m 622 ${D}/dev/console c 5 1
+        mknod -m 622 ${D}/dev/tty0 c 4 0
 }
 
-FILES_${PN} += " /init "
+FILES_${PN} += " /init /dev "
 
 # Due to kernel dependency
 PACKAGE_ARCH = "${MACHINE_ARCH}"

But I am surprised that I had to make such an adjustment. Isn't that
something that also occurs in other build configurations? Do I perhaps
miss something which avoids the issue (some kernel configuration
perhaps)?

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




