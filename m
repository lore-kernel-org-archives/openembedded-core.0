Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34E42C4167B
	for <webhook@archiver.kernel.org>; Sat,  9 Dec 2023 11:29:54 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.7749.1702121392494147723
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 Dec 2023 03:29:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=l/0Uwdmt;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 524241C0003;
	Sat,  9 Dec 2023 11:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702121390;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:  in-reply-to:in-reply-to;
	bh=eQg2FBNHejMBlGavaRm1fIkIPsmOZ4xailwnJXIMuv4=;
	b=l/0UwdmtYRq0kiVE7Et6fuPCuQR8dTw1VVBYnrPb1NbC9fr04rWgQIJ9v8w1ibFodHkwS/
	H3YU/F/OaWNo8Mky4MTh/BOkvgx8bQSb4WTqtnNo6vkJ0Z/h5d6O+/v137fLBTfcYhDRxF
	27gNQeOGJokVNHeNe+sFGOKIMiMBLKZenWallyEZKnXsA9jHr2LZEsqRYAXQ2KCTLvsFX2
	ByoMwqIfmHbIER5Jx+e/NOksb4uliUciXHv2rU1Vca5DsjA69TiYcAdKDTfH7tqiGsXj7N
	ViGyk4Uj4ljuAkKDS6vrWGOvyh5exm5qyHCNC2nHiTcCIH2YqPtQm0l7s3/ufQ==
Date: Sat, 9 Dec 2023 12:29:50 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Tim Orling <ticotimo@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Tim Orling <tim.orling@konsulko.com>
Subject: Re: [OE-core] [PATCH v2 4/6] recipetool: add python_maturin support
Message-ID: <20231209112950eab373e8@mail.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <24841a7636bd1e83411c87ba4332f6f863542c6f.1701989368.git.tim.orling@konsulko.com>
 <ef9e58f253d371c8ae864f7cd89c1fb1dcd3602e.1701989368.git.tim.orling@konsulko.com>
 <20231209020223.1221046-1-tim.orling@konsulko.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 09 Dec 2023 11:29:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192097

Hello,

maturin is not reproducible:

https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20231208-rfbproj4/packages/diff-html/

On 08/12/2023 18:02:24-0800, Tim Orling wrote:
> Add the new python_maturin PEP-517 backend
> 
> Add selftest for 'pydantic-core' pypi package.
> 
> Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> ---
> Changes in v2:
>  - drop all SRC_URI checksums except sha256sum (Peter's change)
>    * requires "[PATCH v2] recipetool: pypi: do not clobber SRC_URI checksums"
>  - drop SRC_URI (Julien's change)
>  - add "inherit pypi" (Julien's change)
> 
>  meta/lib/oeqa/selftest/cases/recipetool.py    | 29 +++++++++++++++++++
>  .../lib/recipetool/create_buildsys_python.py  |  1 +
>  2 files changed, 30 insertions(+)
> 
> diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/selftest/cases/recipetool.py
> index d10d61bc5b0..8d39f639acf 100644
> --- a/meta/lib/oeqa/selftest/cases/recipetool.py
> +++ b/meta/lib/oeqa/selftest/cases/recipetool.py
> @@ -663,6 +663,35 @@ class RecipetoolCreateTests(RecipetoolBase):
>  
>          self._test_recipe_contents(recipefile, checkvars, inherits)
>  
> +    def test_recipetool_create_python3_pep517_maturin(self):
> +        # This test require python 3.11 or above for the tomllib module
> +        # or tomli module to be installed
> +        try:
> +            import tomllib
> +        except ImportError:
> +            try:
> +                import tomli
> +            except ImportError:
> +                self.skipTest('Test requires python 3.11 or above for tomllib module or tomli module')
> +
> +        # Test creating python3 package from tarball (using maturin class)
> +        temprecipe = os.path.join(self.tempdir, 'recipe')
> +        os.makedirs(temprecipe)
> +        pn = 'pydantic-core'
> +        pv = '2.14.5'
> +        recipefile = os.path.join(temprecipe, 'python3-%s_%s.bb' % (pn, pv))
> +        srcuri = 'https://files.pythonhosted.org/packages/64/26/cffb93fe9c6b5a91c497f37fae14a4b073ecbc47fc36a9979c7aa888b245/pydantic_core-%s.tar.gz' % pv
> +        result = runCmd('recipetool create -o %s %s' % (temprecipe, srcuri))
> +        self.assertTrue(os.path.isfile(recipefile))
> +        checkvars = {}
> +        checkvars['HOMEPAGE'] = 'https://github.com/pydantic/pydantic-core'
> +        checkvars['LICENSE'] = set(['MIT'])
> +        checkvars['LIC_FILES_CHKSUM'] = 'file://LICENSE;md5=ab599c188b4a314d2856b3a55030c75c'
> +        checkvars['SRC_URI[sha256sum]'] = '6d30226dfc816dd0fdf120cae611dd2215117e4f9b124af8c60ab9093b6e8e71'
> +        inherits = ['python_maturin', 'pypi']
> +
> +        self._test_recipe_contents(recipefile, checkvars, inherits)
> +
>      def test_recipetool_create_github_tarball(self):
>          # Basic test to ensure github URL mangling doesn't apply to release tarballs
>          temprecipe = os.path.join(self.tempdir, 'recipe')
> diff --git a/scripts/lib/recipetool/create_buildsys_python.py b/scripts/lib/recipetool/create_buildsys_python.py
> index a2af41fdda8..60c59034504 100644
> --- a/scripts/lib/recipetool/create_buildsys_python.py
> +++ b/scripts/lib/recipetool/create_buildsys_python.py
> @@ -735,6 +735,7 @@ class PythonPyprojectTomlRecipeHandler(PythonRecipeHandler):
>          "poetry.core.masonry.api": "python_poetry_core",
>          "flit_core.buildapi": "python_flit_core",
>          "hatchling.build": "python_hatchling",
> +        "maturin": "python_maturin",
>      }
>  
>      # setuptools.build_meta and flit declare project metadata into the "project" section of pyproject.toml
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192096): https://lists.openembedded.org/g/openembedded-core/message/192096
> Mute This Topic: https://lists.openembedded.org/mt/103067787/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


On 07/12/2023 15:13:22-0800, Tim Orling wrote:
> Basic smoke test for maturin to test the 'maturin list-python' case.
> 
> [YOCTO #15312]
> 
> Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> ---
>  meta/lib/oeqa/runtime/cases/maturin.py | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>  create mode 100644 meta/lib/oeqa/runtime/cases/maturin.py
> 
> diff --git a/meta/lib/oeqa/runtime/cases/maturin.py b/meta/lib/oeqa/runtime/cases/maturin.py
> new file mode 100644
> index 00000000000..b9a3b4acbcd
> --- /dev/null
> +++ b/meta/lib/oeqa/runtime/cases/maturin.py
> @@ -0,0 +1,23 @@
> +#
> +# Copyright OpenEmbedded Contributors
> +#
> +# SPDX-License-Identifier: MIT
> +#
> +
> +import os
> +
> +from oeqa.runtime.case import OERuntimeTestCase
> +from oeqa.core.decorator.depends import OETestDepends
> +from oeqa.runtime.decorator.package import OEHasPackage
> +
> +class MaturinTest(OERuntimeTestCase):
> +    @OETestDepends(['ssh.SSHTest.test_ssh', 'python.PythonTest.test_python3'])
> +    @OEHasPackage(['python3-maturin'])
> +    def test_maturin_list_python(self):
> +        status, output = self.target.run("maturin list-python")
> +        self.assertEqual(status, 0)
> +        _, py_major = self.target.run("python3 -c 'import sys; print(sys.version_info.major)'")
> +        _, py_minor = self.target.run("python3 -c 'import sys; print(sys.version_info.minor)'")
> +        python_version = "%s.%s" % (py_major, py_minor)
> +        self.assertEqual(output, "🐍 1 python interpreter found:\n"
> +                                 " - CPython %s at /usr/bin/python%s" % (python_version, python_version))
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#191986): https://lists.openembedded.org/g/openembedded-core/message/191986
> Mute This Topic: https://lists.openembedded.org/mt/103045102/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


On 07/12/2023 15:13:23-0800, Tim Orling wrote:
> We expect 'maturin' will be used in SDKs, so it makes sense to also
> test it in the testsdk environment.
> 
> To run this test case, you can add the following to local.conf:
> TOOLCHAIN_HOST_TASK:append = " nativesdk-python3-maturin"
> 
> And the build and test the SDK:
> bitbake -c populate_sdk core-image-full-cmdline
> bitbake -c testsdk core-image-full-cmdline
> 
> You can substitute a different image recipe for "core-image-full-cmdline"
> 
> [YOCTO #15312]
> 
> Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> ---
>  meta/lib/oeqa/sdk/cases/maturin.py | 33 ++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 meta/lib/oeqa/sdk/cases/maturin.py
> 
> diff --git a/meta/lib/oeqa/sdk/cases/maturin.py b/meta/lib/oeqa/sdk/cases/maturin.py
> new file mode 100644
> index 00000000000..14245bc36e5
> --- /dev/null
> +++ b/meta/lib/oeqa/sdk/cases/maturin.py
> @@ -0,0 +1,33 @@
> +#
> +# Copyright OpenEmbedded Contributors
> +#
> +# SPDX-License-Identifier: MIT
> +#
> +
> +import unittest
> +from oeqa.sdk.case import OESDKTestCase
> +
> +from oeqa.utils.subprocesstweak import errors_have_output
> +
> +errors_have_output()
> +
> +
> +class MaturinTest(OESDKTestCase):
> +    def setUp(self):
> +        if not (
> +            self.tc.hasHostPackage("nativesdk-python3-maturin")
> +            or self.tc.hasHostPackage("python3-maturin-native")
> +        ):
> +            raise unittest.SkipTest("No python3-maturin package in the SDK")
> +
> +    def test_maturin_list_python(self):
> +        py_major = self._run("python3 -c 'import sys; print(sys.version_info.major)'")
> +        py_minor = self._run("python3 -c 'import sys; print(sys.version_info.minor)'")
> +        python_version = "%s.%s" % (py_major.strip(), py_minor.strip())
> +        cmd = "maturin list-python"
> +        output = self._run(cmd)
> +        self.assertRegex(output, r"^🐍 1 python interpreter found:\n")
> +        self.assertRegex(
> +            output,
> +            r" - CPython %s (.+)/usr/bin/python%s$" % (python_version, python_version),
> +        )
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#191987): https://lists.openembedded.org/g/openembedded-core/message/191987
> Mute This Topic: https://lists.openembedded.org/mt/103045103/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 



-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

