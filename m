Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 52E4C6C4CF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Dec 2018 09:43:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wBB9h79a026806
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 11 Dec 2018 01:43:27 -0800
Received: from [128.224.163.141] (128.224.163.141) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Tue, 11 Dec 2018 01:43:13 -0800
To: Ross Burton <ross.burton@intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <20181210171141.10722-1-ross.burton@intel.com>
	<20181210171141.10722-4-ross.burton@intel.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <2c6649dd-c527-e71c-135c-15177787c71c@windriver.com>
Date: Tue, 11 Dec 2018 17:50:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20181210171141.10722-4-ross.burton@intel.com>
X-Originating-IP: [128.224.163.141]
Subject: Re: [PATCH 4/4] oeqa/sdk: rewrite lzip test
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
X-List-Received-Date: Tue, 11 Dec 2018 09:43:57 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

There's a failure related to this patch.
https://autobuilder.yoctoproject.org/typhoon/#/builders/48/builds/80/steps/7/logs/step1c

Best Regards,
Chen Qi

On 12/11/2018 01:11 AM, Ross Burton wrote:
> Don't use the helper class as it gets in the way more than it helps, exercise
> the out-of-tree paths, and verify the installed files match the expected
> architecture.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   meta/lib/oeqa/sdk/cases/buildlzip.py | 46 +++++++++++++-----------------------
>   1 file changed, 16 insertions(+), 30 deletions(-)
>
> diff --git a/meta/lib/oeqa/sdk/cases/buildlzip.py b/meta/lib/oeqa/sdk/cases/buildlzip.py
> index b57fbbece7f..d98e10fc37f 100644
> --- a/meta/lib/oeqa/sdk/cases/buildlzip.py
> +++ b/meta/lib/oeqa/sdk/cases/buildlzip.py
> @@ -1,39 +1,25 @@
> -import unittest
> +import os, tempfile, subprocess, unittest
>   from oeqa.sdk.case import OESDKTestCase
> -from oeqa.sdk.utils.sdkbuildproject import SDKBuildProject
> -
>   from oeqa.utils.subprocesstweak import errors_have_output
>   errors_have_output()
>   
>   class BuildLzipTest(OESDKTestCase):
> -    td_vars = ['DATETIME']
> -
> -    @classmethod
> -    def setUpClass(self):
> -        dl_dir = self.td.get('DL_DIR', None)
> -
> -        self.project = SDKBuildProject(self.tc.sdk_dir + "/lzip/", self.tc.sdk_env,
> -                        "http://downloads.yoctoproject.org/mirror/sources/lzip-1.19.tar.gz",
> -                        self.tc.sdk_dir, self.td['DATETIME'], dl_dir=dl_dir)
> -        self.project.download_archive()
> -
> -    def setUp(self):
> -        machine = self.td.get("MACHINE")
> -
> -        if not (self.tc.hasHostPackage("packagegroup-cross-canadian-%s" % machine) or
> -                self.tc.hasHostPackage("^gcc-", regex=True)):
> -            raise unittest.SkipTest("SDK doesn't contain a cross-canadian toolchain")
> -
>       def test_lzip(self):
> -        self.assertEqual(self.project.run_configure(), 0,
> -                        msg="Running configure failed")
> +        with tempfile.TemporaryDirectory(prefix="lzip", dir=self.tc.sdk_dir) as testdir:
> +            dl_dir = self.td.get('DL_DIR', None)
> +            tarball = self.fetch(testdir, dl_dir, "http://downloads.yoctoproject.org/mirror/sources/lzip-1.19.tar.gz")
> +
> +            dirs = {}
> +            dirs["source"] = os.path.join(testdir, "lzip-1.19")
> +            dirs["build"] = os.path.join(testdir, "build")
> +            dirs["install"] = os.path.join(testdir, "install")
>   
> -        self.assertEqual(self.project.run_make(), 0,
> -                        msg="Running make failed")
> +            subprocess.check_output(["tar", "xf", tarball, "-C", testdir])
> +            self.assertTrue(os.path.isdir(dirs["source"]))
> +            os.makedirs(dirs["build"])
>   
> -        self.assertEqual(self.project.run_install(), 0,
> -                        msg="Running make install failed")
> +            self._run("cd {build} && {source}/configure --srcdir {source} $CONFIGURE_FLAGS".format(**dirs))
> +            self._run("cd {build} && make -j".format(**dirs))
> +            self._run("cd {build} && make install DESTDIR={install}".format(**dirs))
>   
> -    @classmethod
> -    def tearDownClass(self):
> -        self.project.clean()
> +            self.check_elf(os.path.join(dirs["install"], "usr", "local", "bin", "lzip"))



