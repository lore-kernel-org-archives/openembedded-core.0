Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 787F0C3DA5D
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 10:31:37 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.35048.1721039480371570855
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 03:31:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=KsU3/2Zc;
 spf=pass (domain: linaro.org, ip: 209.85.167.47, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52e9f863c46so4554974e87.1
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 03:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721039478; x=1721644278; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5DL5Bx27AX8a+46IY9n6E8jChxSlmauheA1oyQEbZlw=;
        b=KsU3/2ZcQixmc4PkfJo27tCjwEdxbiKJ68OBPf4BH0U5nVxDSefcKJHPD4/B/sY81z
         REvjSb6n46rxffPMKkzW5aQ12+qghYNE/2O61BiP58Io7Z2bwqVNauVYuyEv9MJ0Ph1y
         IYGqqr/uxPhXnodpGso+XrbsiAGQncRWPP+lhZ/13xCl2vRhjqIhYRIZtjRSkHbNwXbv
         VYrXoi9O0Mcz7PyylX6Fo9+6PhGEydUI1aIrXmceKsKFN2Kukpv74I0pir7UtXM0Vg5n
         V3lb2fwoPdc2FzEmQPWlRhlcOy10iIiG/stsS4NRtgaPPcH5uNMJyYDatk6ixX/7O2F6
         P4DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721039478; x=1721644278;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5DL5Bx27AX8a+46IY9n6E8jChxSlmauheA1oyQEbZlw=;
        b=eUdNDKcAx1R2EYDeKL07rTxnbbHO7ENz0fcitbg1vNkaTvheNXnae1fBnrdEmdgmvx
         NnwyTFXGRHyjgog9hWpa6rb17z85QTfRlLlO1n45llPvB9lNH0Pv6m2rjNnZkv5jFtzZ
         KVnYgE9a3TWVE3daGYA+i1oSmgXBEeKM7369IBpXsSQuHkW5EVnJUoLedmrQ2u0xUinC
         kNdcv2fc2foMXSPy5SVcLuo5F4dEH+0cebnB7X/dun5UhLtmIzNHPfT4CJyzpz+CQMdm
         1oQNe3LMRYxB9LW7juqJ9R/E2ooYJ2OPbz91/E55PrQAj6fa5ig+51A+OAbm6zZnwiUT
         wJYg==
X-Gm-Message-State: AOJu0Yz3fwfi2d88cH2AOi7dmBJ5u2ZC3mEK7q8LF6S/DZteyKzL3bO8
	S0O6IVYvfN9nd7Md2qAYnOBkZCxvQD9dnX6xO8lem3C48kxx1Q6gdx7NDPP1b+I=
X-Google-Smtp-Source: AGHT+IEb51OGRY8W2Jv+wPIjiPbxCg2M7VQ3COlQIoBKXyy6MCuEKlYKG1DS8HtHvcPtxGCtNSyo+Q==
X-Received: by 2002:a05:6512:b8e:b0:52c:8a12:3d3b with SMTP id 2adb3069b0e04-52eb99d4a36mr13725669e87.56.1721039478308;
        Mon, 15 Jul 2024 03:31:18 -0700 (PDT)
Received: from nuoska (85-76-35-27-nat.elisa-mobile.fi. [85.76.35.27])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ed252d859sm809999e87.150.2024.07.15.03.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 03:31:17 -0700 (PDT)
Date: Mon, 15 Jul 2024 13:31:15 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: ross.burton@arm.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] oeqa/sdk: add out-of-tree kernel module
 building test
Message-ID: <ZpT6c4hgYV6xIJsf@nuoska>
References: <20240712184358.3103083-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240712184358.3103083-1-ross.burton@arm.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 10:31:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201910

Hi,

On Fri, Jul 12, 2024 at 07:43:58PM +0100, Ross Burton via lists.openembedded.org wrote:
> Validate that out-of-tree kernel module building using kernel-devsrc
> works as expected.
> 
> This test uses cryptodev-linux as a idiomatic out of tree module. As the
> latest release doesn't actually build with kernel 6.7+, use the same
> commit that our recipe uses.
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/lib/oeqa/sdk/cases/kmod.py | 41 +++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 meta/lib/oeqa/sdk/cases/kmod.py
> 
> diff --git a/meta/lib/oeqa/sdk/cases/kmod.py b/meta/lib/oeqa/sdk/cases/kmod.py
> new file mode 100644
> index 00000000000..9e8fdbcd403
> --- /dev/null
> +++ b/meta/lib/oeqa/sdk/cases/kmod.py
> @@ -0,0 +1,41 @@
> +#
> +# Copyright OpenEmbedded Contributors
> +#
> +# SPDX-License-Identifier: MIT
> +#
> +
> +import os
> +import subprocess
> +import tempfile
> +import unittest
> +
> +from oeqa.sdk.case import OESDKTestCase
> +from oeqa.utils.subprocesstweak import errors_have_output
> +errors_have_output()
> +
> +class KernelModuleTest(OESDKTestCase):
> +    """
> +    Test that out-of-tree kernel modules build.
> +    """
> +
> +    def setUp(self):
> +        if not self.tc.hasTargetPackage("kernel-devsrc"):
> +            raise unittest.SkipTest("KernelModuleTest needs kernel-devsrc")
> +
> +        # These targets need to be built before kernel modules can be built.
> +        self._run("make -j -C $OECORE_TARGET_SYSROOT/usr/src/kernel prepare scripts")
> +
> +
> +    def test_cryptodev(self):
> +        with tempfile.TemporaryDirectory(prefix="cryptodev", dir=self.tc.sdk_dir) as testdir:
> +            git_url = "https://github.com/cryptodev-linux/cryptodev-linux"
> +            # This is a knnown-good commit post-1.13 that builds with kernel 6.7+
> +            git_sha = "bb8bc7cf60d2c0b097c8b3b0e807f805b577a53f"
> +
> +            sourcedir = os.path.join(testdir, "cryptodev-linux")
> +            subprocess.check_output(["git", "clone", git_url, sourcedir], stderr=subprocess.STDOUT)

Is there any way to cache this, e.g. yocto build download cache?

Adding Internet downloads to test steps is a bad design IMO which eventually
causes a lot of failures.

Cheers,

