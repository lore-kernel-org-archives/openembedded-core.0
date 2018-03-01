Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 717667822B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Mar 2018 10:28:16 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Mar 2018 02:28:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,408,1515484800"; d="scan'208";a="204692747"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga005.jf.intel.com with ESMTP; 01 Mar 2018 02:28:17 -0800
To: Yeoh Ee Peng <ee.peng.yeoh@intel.com>,
	openembedded-core@lists.openembedded.org
References: <1519870266-63347-1-git-send-email-ee.peng.yeoh@intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <372da1c4-0897-86fe-7db8-5b4f0991e279@linux.intel.com>
Date: Thu, 1 Mar 2018 12:22:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1519870266-63347-1-git-send-email-ee.peng.yeoh@intel.com>
Subject: Re: [PATCH] oeqa/runtime/dpkg.py: add runtime test for dpkg
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
X-List-Received-Date: Thu, 01 Mar 2018 10:28:17 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 03/01/2018 04:11 AM, Yeoh Ee Peng wrote:
> Add runtime test for dpkg to test that it can install deb
> package from remote source.
> 
> Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
> ---
>   meta/lib/oeqa/runtime/cases/dpkg.py | 47 +++++++++++++++++++++++++++++++++++++
>   1 file changed, 47 insertions(+)
>   create mode 100644 meta/lib/oeqa/runtime/cases/dpkg.py
> 
> diff --git a/meta/lib/oeqa/runtime/cases/dpkg.py b/meta/lib/oeqa/runtime/cases/dpkg.py
> new file mode 100644
> index 0000000..adf5195
> --- /dev/null
> +++ b/meta/lib/oeqa/runtime/cases/dpkg.py
> @@ -0,0 +1,47 @@
> +import os
> +from oeqa.utils.httpserver import HTTPService
> +from oeqa.runtime.case import OERuntimeTestCase
> +from oeqa.core.decorator.data import skipIfNotDataVar, skipIfNotFeature
> +from oeqa.runtime.decorator.package import OEHasPackage
> +
> +class DpkgTest(OERuntimeTestCase):
> +
> +    def pkg(self, command, expected = 0):
> +        command = 'apt-get %s' % command
> +        status, output = self.target.run(command, 1500)
> +        message = os.linesep.join([command, output])
> +        self.assertEqual(status, expected, message)
> +        return output

This is testing apt, not dpkg. So the file name and the testcases/class 
names should be renamed accoridngly.


> +    def test_dpkg_install_from_repo(self):
> +        self.setup_source_config_for_package_install()
> +        self.pkg('update')
> +        self.pkg('remove --yes run-postinsts-dev')
> +        self.pkg('install --yes --allow-unauthenticated run-postinsts-dev')
> +        self.cleanup_source_config_for_package_install()

That's a good start, but apt can do more, right? Play with its various 
utilities (apt-get, apt-cache, etc.) on the command line. What kind of 
features it has? Can those be tested automatically? Should they be tested?

Also, before you do advanced package installation/removal, it's good to 
run a few sanity checks. Check that apt is able to print a help message 
without crashing, that it can list installed and available packages and 
so on. You can look at dnf test cases for examples.

And same applies to opkg test cases as well.

Regards,
Alex

