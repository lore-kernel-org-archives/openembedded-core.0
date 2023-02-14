Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CD1FC05027
	for <webhook@archiver.kernel.org>; Tue, 14 Feb 2023 09:00:13 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.2487.1676365202507848690
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Feb 2023 01:00:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=WAxV63qZ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 13174240007;
	Tue, 14 Feb 2023 08:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1676365200;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MWzm4gneewkTSdDqLXjzSTMuEKq7AiJ56X1m8++0BL4=;
	b=WAxV63qZgkeQo4FRPhggV/Ke8sCWYVUNtTgkW3KqsZhTLCHqZKng2+1noKJHgBZiYCKl1a
	Bph/vuGNUVh/AK7GXCvpDn3E0TTxr3CBZYDLYVcKzkffVj6zSaGPtCzRGGubQeCHnuuJG3
	FdZvqco/uKvJeNl96a858S61fAePcT8FQ5U+Ogf9SbaMV8DS8/HMO4nRITfnQJrHJv8cDW
	wnWe9R/zSdLsbeYNvaFMD7CPeOWR4sd5Pov+Cj5MukRlWp2YOj7nf1bZrGoEAXKehzcm93
	FdJhBrUBmBUy5cgUEZ9UnLLFQCQRZe70Rzn7LSBWKmriIpu6oIpZh/76HZ/Qhg==
Date: Tue, 14 Feb 2023 09:59:59 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Kareem Zarka <zarkakareem@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Stefan Schmidt <stefan.schmidt@huawei.com>,
	Kareem Zarka <kareem.zarka@huawei.com>
Subject: Re: [OE-core] [PATCH] meta/lib/oeqa/selftest/cases/wic: Add tests
 for configuring kernel image install into boot partition.
Message-ID: <Y+tNj+IieC3W4QN1@mail.local>
References: <20230210102337.1527237-1-kareem.zarka@huawei.com>
 <20230210102337.1527237-2-kareem.zarka@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230210102337.1527237-2-kareem.zarka@huawei.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 09:00:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177132

Hello,

This fails on the autobuilders:

2023-02-14 02:00:37,111 - oe-selftest - INFO - 6: 47/60 496/512 (18.80s) (0 failed) (wic.Wic.test_kernel_install)
2023-02-14 02:00:37,111 - oe-selftest - INFO - testtools.testresult.real._StringException: Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/meta/lib/oeqa/selftest/cases/wic.py", line 203, in test_kernel_install
    runCmd(cmd)
  File "/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/meta/lib/oeqa/utils/commands.py", line 214, in runCmd
    raise AssertionError("Command '%s' returned non-zero exit status %d:\n%s" % (command, result.status, exc_output))
AssertionError: Command 'wic cp /home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-3404782/wic-tmp/tmp4b6cj2n7-202302140200-sda.direct:1 /tmp/tmpru5302n7' returned non-zero exit status 1:
ERROR: Can't find executable 'mcopy'

I guess you are missing a dependency.

On 10/02/2023 11:23:37+0100, Kareem Zarka wrote:
> - test_skip_kernel_install: This test verifies that the kernel is not
> installed in the boot partition when the 'install-kernel-into-boot-dir'
> parameter is set to false.
> 
> - test_kernel_install: This test verifies that the kernel is installed
> in the boot partition when the 'install-kernel-into-boot-dir' parameter
> is set to true .
> 
> Both tests use a WKS (Kickstart) file to specify the desired
> configuration, build a disk image using WIC, and extract the disk image
> to a temporary directory to verify the results.
> 
> Signed-off-by: Kareem Zarka <kareem.zarka@huawei.com>
> ---
>  meta/lib/oeqa/selftest/cases/wic.py | 66 +++++++++++++++++++++++++++++
>  1 file changed, 66 insertions(+)
> 
> diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
> index ca1abb970a..b46dccc144 100644
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
> @@ -146,6 +147,71 @@ class CLITests(OESelftestTestCase):
>          self.assertEqual(1, runCmd('wic', ignore_status=True).status)
>  
>  class Wic(WicTestCase):
> +    def test_skip_kernel_install(self):
> +        """Test the functionality of not installing the kernel in the boot directory using the wic plugin"""
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
> View/Reply Online (#176990): https://lists.openembedded.org/g/openembedded-core/message/176990
> Mute This Topic: https://lists.openembedded.org/mt/96873814/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

