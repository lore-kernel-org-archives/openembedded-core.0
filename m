Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id EF1987706E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Feb 2016 16:18:48 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 22 Feb 2016 08:18:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,485,1449561600"; d="scan'208";a="918550010"
Received: from bitbang.jf.intel.com (HELO [10.7.199.163]) ([10.7.199.163])
	by orsmga002.jf.intel.com with ESMTP; 22 Feb 2016 08:18:49 -0800
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>,
	openembedded-core@lists.openembedded.org
References: <cover.1456153260.git.anibal.limon@linux.intel.com>
	<64384d8bd09f15c666f133893c3beb96e66af51d.1456153260.git.anibal.limon@linux.intel.com>
From: Randy Witt <randy.e.witt@linux.intel.com>
Message-ID: <56CB34E8.6060203@linux.intel.com>
Date: Mon, 22 Feb 2016 08:18:48 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.0
MIME-Version: 1.0
In-Reply-To: <64384d8bd09f15c666f133893c3beb96e66af51d.1456153260.git.anibal.limon@linux.intel.com>
Cc: paul.eggleton@linux.intel.com,
	=?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <limon.anibal@gmail.com>
Subject: Re: [PATCH 4/4] oeqa/sdkext: Add sdk_update.SDKUpdateTest class.
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
X-List-Received-Date: Mon, 22 Feb 2016 16:18:49 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 02/22/2016 07:03 AM, Aníbal Limón wrote:
> From: Aníbal Limón <limon.anibal@gmail.com>
>
> The SDKUpdateTest class test devtool sdk-update mechanism inside
> eSDK.
>
> The SDKUpdateTest class search for new sdk if not found uses
> the main one then it publish the eSDK into known folder
> inside work and it starts a web server for serve the eSDK.
>
> Finally it executes sdk-update over http, the local test is
> commented due to bug [1].
>
> [1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=9043
>
> [YOCTO #9089]
>
> Signed-off-by: Aníbal Limón <limon.anibal@gmail.com>
> ---
>   meta/lib/oeqa/sdkext/sdk_update.py | 39 ++++++++++++++++++++++++++++++++++++++
>   1 file changed, 39 insertions(+)
>   create mode 100644 meta/lib/oeqa/sdkext/sdk_update.py
>
> diff --git a/meta/lib/oeqa/sdkext/sdk_update.py b/meta/lib/oeqa/sdkext/sdk_update.py
> new file mode 100644
> index 0000000..16f5b10
> --- /dev/null
> +++ b/meta/lib/oeqa/sdkext/sdk_update.py
> @@ -0,0 +1,39 @@
> +import os
> +import shutil
> +import subprocess
> +
> +from oeqa.oetest import oeSDKExtTest
> +from oeqa.utils.httpserver import HTTPService
> +
> +class SdkUpdateTest(oeSDKExtTest):
> +
> +    @classmethod
> +    def setUpClass(self):
> +        self.publish_dir = os.path.join(self.tc.sdktestdir, 'esdk_publish')
> +        if os.path.exists(self.publish_dir):
> +            shutil.rmtree(self.publish_dir)
> +        os.mkdir(self.publish_dir)
> +
> +        tcname_new = self.tc.d.expand(
> +            "${SDK_DEPLOY}/${TOOLCHAINEXT_OUTPUTNAME}-new.sh")
> +        if not os.path.exists(tcname_new):
> +            tcname_new = self.tc.tcname
> +
> +        cmd = 'oe-publish-sdk %s %s' % (tcname_new, self.publish_dir)
> +        subprocess.check_output(cmd, shell=True)
> +
> +        self.http_service = HTTPService(self.publish_dir)
> +        self.http_service.start()

I think Paul and I briefly mentioned it, but SimpleHTTPServer fails as an sstate 
mirror if enough fetchers run. We think it was because of a limit on the number 
of simultaneous connections. So I would expect this to fail for instance if all 
packages were updated.

But really we shouldn't care too much about the sstate updating part, and more 
about the layer updating etc. Ideally this test would check to make sure the 
local sdk now matches the remote.

> +        self.http_url = "http://127.0.0.1:%d" % self.http_service.port
> +
> +    def test_sdk_update_http(self):
> +        output = self._run("devtool sdk-update \"%s\"" % self.http_url)
> +
> +#    def test_sdk_update_local(self):
> +#        output = self._run("devtool sdk-update \"%s\"" % self.publish_dir)
> +
> +    @classmethod
> +    def tearDownClass(self):
> +        self.http_service.stop()
> +        shutil.rmtree(self.publish_dir)
>


