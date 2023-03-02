Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27188C6FA8E
	for <webhook@archiver.kernel.org>; Thu,  2 Mar 2023 11:28:29 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.13067.1677756504139160883
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Mar 2023 03:28:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=PoUi3T6O;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id C141AE000C;
	Thu,  2 Mar 2023 11:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1677756502;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=emhIeIcoS5NSIiTPbHjELN2RdlZBDxvzHXaneXU828M=;
	b=PoUi3T6OQUIVT6SQ0Ygjm5FZyI/O7/ckqeN5BxpPX2BCXI46W1zmMZMR9nmlbaBtbXtsmF
	pdc8YeMowVj7Xksl75hMtaBuZTHjx8ljTCwC1GGpoGKXzjLtpfmglFspJGPF7JkqMqB4Rb
	eU2L47W67Q2NZ4hpHinLPgePuOL7CDHqefW2VOMNoeF8K47XFEfjyPPV7/ArVAGrH8uobA
	EHt75D+aiMAvyUseKs0Pjbu+MXT01Xn2fw94pnck0edoqA+0edB/8ILPE+Jm0s/VXaS6/j
	IsjhlWBMXRhZo77rM5QkaycskUEVNEPDmCiu1Ym25HOW2fqajbFFeUXbNL2fhw==
Date: Thu, 2 Mar 2023 12:28:21 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: =?iso-8859-1?Q?Tom=E1s_Gonz=E1lez?= <tomasagustin.gonzalezorlando@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] bootimg-efi: Use the custom .dtb file's path
 as its final location
Message-ID: <ZACIVXsyg/JqFeP5@mail.local>
References: <20230301124551.159892-1-tomasagustin.gonzalezorlando@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230301124551.159892-1-tomasagustin.gonzalezorlando@arm.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Mar 2023 11:28:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177960

Hello,

This caused failures on the autobuilders:

https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/4867/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/4820/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/127/builds/1038/steps/14/logs/stdio

2023-03-01 23:29:40,420 - oe-selftest - INFO - wic.ModifyTests.test_dtb_efi (subunit.RemotedTestCase)
2023-03-01 23:29:40,421 - oe-selftest - INFO -  ... FAIL
Stderr:
2023-03-01 21:39:12,759 - oe-selftest - INFO - Adding: "include selftest.inc" in /home/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-2963231/conf/local.conf
2023-03-01 21:39:12,760 - oe-selftest - INFO - Adding: "include bblayers.inc" in bblayers.conf
2023-03-01 23:29:40,421 - oe-selftest - INFO - 5: 28/34 407/524 (162.61s) (0 failed) (wic.ModifyTests.test_dtb_efi)
2023-03-01 23:29:40,422 - oe-selftest - INFO - testtools.testresult.real._StringException: Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/oe-selftest-armhost/build/meta/lib/oeqa/selftest/cases/wic.py", line 1532, in test_dtb_efi
    result = runCmd("wic ls %s:1/devicetree" % (image_path))
  File "/home/pokybuild/yocto-worker/oe-selftest-armhost/build/meta/lib/oeqa/utils/commands.py", line 214, in runCmd
    raise AssertionError("Command '%s' returned non-zero exit status %d:\n%s" % (command, result.status, exc_output))
AssertionError: Command 'wic ls /home/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-2963231/tmp/deploy/images/qemuarm64/core-image-minimal-qemuarm64.wic:1/devicetree' returned non-zero exit status 1:
ERROR: Can't find executable 'mdir'

This is a missing dependency on mtools-native.



On 01/03/2023 12:45:51+0000, Tom�s Gonz�lez wrote:
> From: tomasagustin.gonzalezorlando@arm.com
> 
> When specifying a custom .dtb with the --sourceparams="dtb=<path>" parameter,
> the custom file is looked for in ${DEPLOY_DIR_IMAGE}/<path>, and the resulting
> grub config file is set to look for the .dtb under /<path> inside the boot
> partition. However, the file is not currently being copied there.
> 
> Change the behaviour of the --sourceparams="dtb=<path>" parameter so that
> the custom .dtb file is copied under /<path> in the boot partition.
> 
> Include oe-selftest to validate the functionality.
> 
> Signed-off-by: Tom�s Gonz�lez <tomasagustin.gonzalezorlando@arm.com>
> ---
>  .../recipes-test/dtb/devicetree-sample.bb     |  8 +++
>  .../dtb/files/sample-devicetree.dts           | 69 +++++++++++++++++++
>  meta-selftest/wic/test_dtb_efi.wks            |  3 +
>  meta/lib/oeqa/selftest/cases/wic.py           | 16 +++++
>  scripts/lib/wic/plugins/source/bootimg-efi.py |  2 +-
>  5 files changed, 97 insertions(+), 1 deletion(-)
>  create mode 100644 meta-selftest/recipes-test/dtb/devicetree-sample.bb
>  create mode 100644 meta-selftest/recipes-test/dtb/files/sample-devicetree.dts
>  create mode 100644 meta-selftest/wic/test_dtb_efi.wks
> 
> diff --git a/meta-selftest/recipes-test/dtb/devicetree-sample.bb b/meta-selftest/recipes-test/dtb/devicetree-sample.bb
> new file mode 100644
> index 0000000000..8be977a821
> --- /dev/null
> +++ b/meta-selftest/recipes-test/dtb/devicetree-sample.bb
> @@ -0,0 +1,8 @@
> +SUMMARY = "Device tree"
> +DESCRIPTION = "Contains a Device Tree recipe to be used to for testing."
> +
> +inherit devicetree
> +
> +SRC_URI += "file://sample-devicetree.dts"
> +
> +COMPATIBLE_MACHINE = ""
> diff --git a/meta-selftest/recipes-test/dtb/files/sample-devicetree.dts b/meta-selftest/recipes-test/dtb/files/sample-devicetree.dts
> new file mode 100644
> index 0000000000..71af0e117b
> --- /dev/null
> +++ b/meta-selftest/recipes-test/dtb/files/sample-devicetree.dts
> @@ -0,0 +1,69 @@
> +/dts-v1/;
> +/ {
> +	compatible = "opencores,or1ksim";
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +	interrupt-parent = <&pic>;
> +
> +	aliases {
> +		uart0 = &serial0;
> +	};
> +
> +	chosen {
> +		bootargs = "earlycon";
> +		stdout-path = "uart0:115200";
> +	};
> +
> +	memory@0 {
> +		device_type = "memory";
> +		reg = <0x00000000 0x02000000>;
> +	};
> +
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		cpu@0 {
> +			compatible = "opencores,or1200-rtlsvn481";
> +			reg = <0>;
> +			clock-frequency = <20000000>;
> +		};
> +		cpu@1 {
> +			compatible = "opencores,or1200-rtlsvn481";
> +			reg = <1>;
> +			clock-frequency = <20000000>;
> +		};
> +	};
> +
> +	ompic: ompic@98000000 {
> +		compatible = "openrisc,ompic";
> +		reg = <0x98000000 16>;
> +		interrupt-controller;
> +		#interrupt-cells = <0>;
> +		interrupts = <1>;
> +	};
> +
> +	/*
> +	 * OR1K PIC is built into CPU and accessed via special purpose
> +	 * registers.  It is not addressable and, hence, has no 'reg'
> +	 * property.
> +	 */
> +	pic: pic {
> +		compatible = "opencores,or1k-pic-level";
> +		#interrupt-cells = <1>;
> +		interrupt-controller;
> +	};
> +
> +	serial0: serial@90000000 {
> +		compatible = "opencores,uart16550-rtlsvn105", "ns16550a";
> +		reg = <0x90000000 0x100>;
> +		interrupts = <2>;
> +		clock-frequency = <20000000>;
> +	};
> +
> +	enet0: ethoc@92000000 {
> +		compatible = "opencores,ethoc";
> +		reg = <0x92000000 0x800>;
> +		interrupts = <4>;
> +		big-endian;
> +	};
> +};
> diff --git a/meta-selftest/wic/test_dtb_efi.wks b/meta-selftest/wic/test_dtb_efi.wks
> new file mode 100644
> index 0000000000..61a7b1c9b4
> --- /dev/null
> +++ b/meta-selftest/wic/test_dtb_efi.wks
> @@ -0,0 +1,3 @@
> +part /boot --active --source bootimg-efi --sourceparams="loader=grub-efi,dtb=devicetree/sample-devicetree.dtb" --active --align 1024 --use-uuid --part-type EF00
> +part / --source rootfs --fstype=ext4 --align 1024 --use-uuid
> +bootloader --ptable gpt --timeout=1 --append="rootwait rootfstype=ext4 console=ttyS0,115200n8"
> diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
> index 0d664d7c39..d702c57679 100644
> --- a/meta/lib/oeqa/selftest/cases/wic.py
> +++ b/meta/lib/oeqa/selftest/cases/wic.py
> @@ -1512,3 +1512,19 @@ class ModifyTests(WicTestCase):
>          # check if it's removed
>          result = runCmd("wic ls %s:2/ -n %s" % (images[0], sysroot))
>          self.assertTrue('etc' not in [line.split()[-1] for line in result.output.split('\n') if line])
> +
> +    def test_dtb_efi(self):
> +        """Test custom dtb"""
> +        config = 'IMAGE_FSTYPES = "wic"\nWKS_FILE = "test_dtb_efi.wks"\nMACHINE_FEATURES:append = " efi"\n'
> +        config += 'EXTRA_IMAGEDEPENDS = "devicetree-sample"\n'
> +        self.append_config(config)
> +        bitbake('core-image-minimal')
> +
> +        deploy_dir = get_bb_var('DEPLOY_DIR_IMAGE')
> +        machine = self.td['MACHINE']
> +        image_path = os.path.join(deploy_dir, 'core-image-minimal-%s.wic' % machine)
> +
> +        self.assertTrue(os.path.exists(image_path))
> +
> +        result = runCmd("wic ls %s:1/devicetree" % (image_path))
> +        self.assertTrue('sample-devicetree.dtb' in [line.split()[-1] for line in result.output.split('\n') if line])
> diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
> index 4b00913a70..69c427e01d 100644
> --- a/scripts/lib/wic/plugins/source/bootimg-efi.py
> +++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
> @@ -51,7 +51,7 @@ class BootimgEFIPlugin(SourcePlugin):
>          if dtb:
>              if ';' in dtb:
>                  raise WicError("Only one DTB supported, exiting")
> -            cp_cmd = "cp %s/%s %s" % (bootimg_dir, dtb, hdddir)
> +            cp_cmd = "install -D %s/%s %s/%s" % (bootimg_dir, dtb, hdddir, dtb)
>              exec_cmd(cp_cmd, True)
>  
>      @classmethod
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#177885): https://lists.openembedded.org/g/openembedded-core/message/177885
> Mute This Topic: https://lists.openembedded.org/mt/97312887/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

