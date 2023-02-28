Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46AE5C64EC7
	for <webhook@archiver.kernel.org>; Tue, 28 Feb 2023 15:01:29 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.25589.1677596486952901383
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Feb 2023 07:01:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Gy2luWqP;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 8705B24000E;
	Tue, 28 Feb 2023 15:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1677596485;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pNxRIAUU6kUIRIz7mpY1DEr7Oq1o5uDgFpGE713OLy4=;
	b=Gy2luWqPd+GUaD5W59KaJgXBax5uzaxpMxBuB1O9FKnSzGuAPKZ2q8cSLSz7WSvUa9/jKA
	Ue3WH7D+ilCl+wQgnAXcim5d6cuJFo3/9xt+kcH0LiMFjnI1XD8mrzPw56bJOAgz+kI6TW
	FWH3Fh1m0lNlV9i4CLh5WaO60/PL3fW7aiD+c6kvNx4cTzs3N+NqAEOnXc0rvMVppAKVhc
	+AUkLgw3/sZGOM52DZDOxk1byFQnTHPwFIE3Phi73CgpvYdCvbICJuRqk+PkGgiQNCsSlv
	Ja71hcEmCMu/zOnbj6rwIVbnUKzFj2yCiuCp2X2rHiyuD+zPDd00+Mr4YX4ftA==
Date: Tue, 28 Feb 2023 16:01:16 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Kareem Zarka <zarkakareem@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Stefan Schmidt <stefan.schmidt@huawei.com>,
	Kareem Zarka <kareem.zarka@huawei.com>
Subject: Re: [OE-core] [PATCH] meta/lib/oeqa/selftest/cases/wic: Add tests
 for configuring kernel image install into boot partition.
Message-ID: <Y/4XPDScpeIoxmKV@mail.local>
References: <20230228065535.6174-1-kareem.zarka@huawei.com>
 <20230228065535.6174-2-kareem.zarka@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230228065535.6174-2-kareem.zarka@huawei.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Feb 2023 15:01:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177840

Hello,

This caused:

AssertionError: Command 'wic cp /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-1632991/wic-tmp/tmpy7vqghuf-202302281124-sda.direct:1 /tmp/tmp9xlwzw5t' returned non-zero exit status 1:
ERROR: Can't find executable 'mcopy'

so bitbake("mtools-native") was not enough

On 28/02/2023 07:55:35+0100, Kareem Zarka wrote:
> - test_skip_kernel_install: This test verifies that the kernel is not
> installed in the boot partition when the 'install-kernel-into-boot-dir'
> parameter is set to false.
> - test_kernel_install: This test verifies that the kernel is installed
> in the boot partition when the 'install-kernel-into-boot-dir' parameter
> is set to true .
> Both tests use a WKS (Kickstart) file to specify the desired
> configuration, build a disk image using WIC, and extract the disk image
> to a temporary directory to verify the results.
> 
> Signed-off-by: Kareem Zarka <kareem.zarka@huawei.com>
> ---
>  meta/lib/oeqa/selftest/cases/wic.py | 70 +++++++++++++++++++++++++++++
>  1 file changed, 70 insertions(+)
> 
> diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
> index b9430cdb3b..7f5db1dc73 100644
> --- a/meta/lib/oeqa/selftest/cases/wic.py
> +++ b/meta/lib/oeqa/selftest/cases/wic.py
> @@ -16,6 +16,7 @@ import hashlib
>  from glob import glob
>  from shutil import rmtree, copy
>  from tempfile import NamedTemporaryFile
> +from tempfile import TemporaryDirectory
>  
>  from oeqa.selftest.case import OESelftestTestCase
>  from oeqa.core.decorator import OETestTag
> @@ -146,6 +147,75 @@ class CLITests(OESelftestTestCase):
>          self.assertEqual(1, runCmd('wic', ignore_status=True).status)
>  
>  class Wic(WicTestCase):
> +    def test_skip_kernel_install(self):
> +        """Test the functionality of not installing the kernel in the boot directory using the wic plugin"""
> +        # Build the mtools-native package to support FAT filesystem handling
> +        bitbake("mtools-native") 
> +        # create a temporary file for the WKS content
> +        with NamedTemporaryFile("w", suffix=".wks") as wks:
> +            wks.write(
> +                'part --source bootimg-efi '
> +                '--sourceparams="loader=grub-efi,install-kernel-into-boot-dir=false" '
> +                '--label boot --active\n'
> +            )
> +            wks.flush()
> +            # create a temporary directory to extract the disk image to
> +            with TemporaryDirectory() as tmpdir:
> +                img = 'core-image-minimal'
> +                # build the image using the WKS file
> +                cmd = "wic create %s -e %s -o %s" % (
> +                    wks.name, img, self.resultdir)
> +                runCmd(cmd)
> +                wksname = os.path.splitext(os.path.basename(wks.name))[0]
> +                out = glob(os.path.join(
> +                    self.resultdir, "%s-*.direct" % wksname))
> +                self.assertEqual(1, len(out))
> +                # extract the content of the disk image to the temporary directory
> +                cmd = "wic cp %s:1 %s" % (out[0], tmpdir)
> +                runCmd(cmd)
> +                # check if the kernel is installed or not
> +                kimgtype = get_bb_var('KERNEL_IMAGETYPE', img)
> +                for file in os.listdir(tmpdir):
> +                    if file == kimgtype:
> +                        raise AssertionError(
> +                            "The kernel image '{}' was found in the partition".format(kimgtype)
> +                        )
> +
> +    def test_kernel_install(self):
> +        """Test the installation of the kernel to the boot directory in the wic plugin"""
> +        # Build the mtools-native package to support FAT filesystem handling
> +        bitbake("mtools-native") 
> +        # create a temporary file for the WKS content
> +        with NamedTemporaryFile("w", suffix=".wks") as wks:
> +            wks.write(
> +                'part --source bootimg-efi '
> +                '--sourceparams="loader=grub-efi,install-kernel-into-boot-dir=true" '
> +                '--label boot --active\n'
> +            )
> +            wks.flush()
> +            # create a temporary directory to extract the disk image to
> +            with TemporaryDirectory() as tmpdir:
> +                img = 'core-image-minimal'
> +                # build the image using the WKS file
> +                cmd = "wic create %s -e %s -o %s" % (wks.name, img, self.resultdir)
> +                runCmd(cmd)
> +                wksname = os.path.splitext(os.path.basename(wks.name))[0]
> +                out = glob(os.path.join(self.resultdir, "%s-*.direct" % wksname))
> +                self.assertEqual(1, len(out))
> +                # extract the content of the disk image to the temporary directory
> +                cmd = "wic cp %s:1 %s" % (out[0], tmpdir)
> +                runCmd(cmd)
> +                # check if the kernel is installed or not
> +                kimgtype = get_bb_var('KERNEL_IMAGETYPE', img)
> +                found = False
> +                for file in os.listdir(tmpdir):
> +                    if file == kimgtype:
> +                        found = True
> +                        break
> +                self.assertTrue(
> +                    found, "The kernel image '{}' was not found in the boot partition".format(kimgtype)
> +                )
> +
>      def test_build_image_name(self):
>          """Test wic create wictestdisk --image-name=core-image-minimal"""
>          cmd = "wic create wictestdisk --image-name=core-image-minimal -o %s" % self.resultdir
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#177821): https://lists.openembedded.org/g/openembedded-core/message/177821
> Mute This Topic: https://lists.openembedded.org/mt/97285464/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

