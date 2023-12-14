Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7991BC4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 22:38:33 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.41993.1702593509194330297
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Dec 2023 14:38:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ANGCVb8T;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 386B51C0005;
	Thu, 14 Dec 2023 22:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702593506;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MvhcUVV7HJEN1WO6vqGT+BK4ac8eqn6r+efC9MzVCu8=;
	b=ANGCVb8T8oRmJx03p5iN4DRcH9n7YXQkHTS+8IXm5i9Edfz4BuMQ49tXIMmliR8Sa/R1Ar
	rA0XJ4KF3GOOezeDdRMpc3shli5Am5LN2za3vlJsCB0bjQGdXNYiNdwvKCYYACry7L/LCl
	IoXEM6NJHU3FfXXuIjffBZLX2W24+nSPJFeLp8GjVl+c6DBQHsgtPpgl2Ozt/aH6lJ8CE2
	yQJsvWzorqU5T13hNCWt28mIpcJJjkr8SsjxjgDYNJXc5FDL6M3dyKPVa1UCqMJZdD7S2x
	4xCMq76EK4NulNSUfaatp/kVZnBWx4bN+dS830VptjT5XxjBxMZudmlH7eQVRg==
Date: Thu, 14 Dec 2023 23:38:25 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: =?iso-8859-1?Q?Eil=EDs_'pidge'_N=ED_Fhlannag=E1in?= <pidge@baylibre.com>
Cc: openembedded-core@lists.openembedded.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [OE-core] [PATCHv3 1/1] login.py: Proof of concept for
 screenshot testcases
Message-ID: <20231214223825b3bec7aa@mail.local>
References: <20231214164651.1107120-1-pidge@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231214164651.1107120-1-pidge@baylibre.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 22:38:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192408

Hello,

Please also fix 2/4 and always resend the whole series, else the burden
to cherry-pick from the multiple version of the series and my memory is
not what it used to be.

On 14/12/2023 16:46:51+0000, Eil�s 'pidge' N� Fhlannag�in wrote:
> This takes the work rburton did on image screenshot testing and
> expands it.
> 
> Right now this only works for qemux86-64. Some standardization
> of screensize/resolution needs to happen with runqemu params for other
> machines. There is an issue in qemux86-64 (and possibly others) where
> the screenswitch/home icon is only half present. This causes the test to
> fail. I'm unsure if this is a QMP/qemu issue but I've certainly seen
> the half-rendered icon, so it's not Imagemagick.
> 
> This test takes a screendump of a qemu image (for now, just
> core-image-sato for qemux86-64), and compares it to an image we
> have on record. Some normalisation of the different qemu configs
> need to happen to be able to support all machines. Example, the
> qemuarm64 screen size is much larger than the qemux86-64.
> 
> The image we have on record contains a blanked out clock. We do
> the same blanking out process for the screenshot, so the images should
> have zero differences. If they do, we fail.
> 
> In order to enable this test, you will need meta-openembedded/meta-oe in
> your bblayers.conf and the following in local.conf:
> 
> IMAGE_CLASSES += "testimage"
> TEST_SUITES = "login"
> TESTIMAGEDEPENDS:append:qemuall = " imagemagick-native:do_populate_sysroot "
> 
> Signed-off-by: Eil�s 'pidge' N� Fhlannag�in <pidge@baylibre.com>
> Co-authored-by: Ross Burton <ross.burton@arm.com>
> Co-authored-by: Eil�s 'pidge' N� Fhlannag�in <pidge@baylibre.com>
> ---
>  .../core-image-sato-qemux86-64.png            | Bin 0 -> 46986 bytes
>  meta/lib/oeqa/runtime/cases/login.py          |  42 ++++++++++++++++++
>  2 files changed, 42 insertions(+)
>  create mode 100644 meta/files/image-tests/core-image-sato-qemux86-64.png
>  create mode 100644 meta/lib/oeqa/runtime/cases/login.py
> 
> diff --git a/meta/files/image-tests/core-image-sato-qemux86-64.png b/meta/files/image-tests/core-image-sato-qemux86-64.png
> new file mode 100644
> index 0000000000000000000000000000000000000000..5a3e46169dca6d118c003d29a59c59588cee7463
> GIT binary patch
> literal 46986
> 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
> 
> literal 0
> HcmV?d00001
> 
> diff --git a/meta/lib/oeqa/runtime/cases/login.py b/meta/lib/oeqa/runtime/cases/login.py
> new file mode 100644
> index 00000000000..30074f71b66
> --- /dev/null
> +++ b/meta/lib/oeqa/runtime/cases/login.py
> @@ -0,0 +1,42 @@
> +#
> +# Copyright OpenEmbedded Contributors
> +#
> +# SPDX-License-Identifier: MIT
> +#
> +
> +import subprocess
> +from oeqa.runtime.case import OERuntimeTestCase
> +import tempfile
> +from oeqa.runtime.decorator.package import OEHasPackage
> +import shutil
> +
> +class LoginTest(OERuntimeTestCase):
> +
> +    def test_screenshot(self):
> +        # Leaving this limited to qemux86-64, until I can get the same resolution
> +        # on all the qemu machines.
> +        if self.td.get('MACHINE') != "qemux86-64":
> +            self.skipTest("")
> +
> +        if bb.utils.which(os.getenv('PATH'), "convert.im7") is not None and bb.utils.which(os.getenv('PATH'), "compare.im7") is not None:
> +            with tempfile.NamedTemporaryFile(prefix="oeqa-screenshot-login", suffix=".png") as t:
> +                ret = self.target.runner.run_monitor("screendump", args={"filename": t.name, "format":"png"})
> +                # Use the meta-oe version of convert, along with it's suffix
> +                cmd = "convert.im7 {0} -fill white -draw 'rectangle 600,10 640,22' {1}".format(t.name, t.name)
> +                subprocess.check_output(cmd.split(), shell=True, stderr=subprocess.PIPE)
> +                
> +                # Uncomment for debugging/capturing other machine images.
> +                # shutil.copy(t.name, os.getenv('HOME')+"/"+self.td.get('MACHINE')+".png")
> +
> +                # Use the meta-oe version of compare, along with it's suffix               
> +                cmd = "compare.im7 -metric MSE {0} {1}/meta/files/image-tests/core-image-sato-{2}.png /dev/null".format(t.name, self.td.get('COREBASE'), self.td.get('MACHINE'))
> +                # We use Popen here because compare outputs the values we care about on stderr. 
> +                proc = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
> +                output, error = proc.communicate()
> +                
> +                # In theory this should be 0, however I've seen some odd things with the Home icon/screen switcher.
> +                # We should as some point, log the diff image for debugging, but for now, just report that it's different.
> +                diff=float(error.decode('utf-8').replace("(", "").replace(")","").split()[1])
> +                self.assertEqual(0, diff, "Screenshot diff is %s." % (str(diff)))
> +        else:
> +            self.skipTest("Could not find imagemagick tools.")
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192394): https://lists.openembedded.org/g/openembedded-core/message/192394
> Mute This Topic: https://lists.openembedded.org/mt/103173636/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

