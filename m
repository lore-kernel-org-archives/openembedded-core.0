Return-Path: <benjamin.esquivel@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 5546E6067C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2016 14:09:51 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 13 Jul 2016 07:09:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,357,1464678000"; d="scan'208";a="845543095"
Received: from besquive-mobl.amr.corp.intel.com (HELO besquiveMOBL)
	([10.219.24.75])
	by orsmga003.jf.intel.com with ESMTP; 13 Jul 2016 07:09:52 -0700
Reply-To: <benjamin.esquivel@intel.com>
From: "Benjamin Esquivel" <benjamin.esquivel@linux.intel.com>
To: <mariano.lopez@linux.intel.com>, <openembedded-core@lists.openembedded.org>
References: <cover.1468328858.git.mariano.lopez@linux.intel.com>
	<54304422afaa3f1b3c8504f9bf2e8e74b9f15837.1468328858.git.mariano.lopez@linux.intel.com>
In-Reply-To: <54304422afaa3f1b3c8504f9bf2e8e74b9f15837.1468328858.git.mariano.lopez@linux.intel.com>
Date: Wed, 13 Jul 2016 09:09:51 -0500
Organization: Intel Corporation
Message-ID: <008101d1dd10$397e5190$ac7af4b0$@linux.intel.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AQH3XAQ1/78q8eM1KdmnvXd5aDhLVAILRaL8n7sLT/A=
Subject: Re: [PATCH 1/1] selftest/seltest.py: Add test to check imports from other layers
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
X-List-Received-Date: Wed, 13 Jul 2016 14:09:53 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-us

Comments below

The test looks good.

> -----Original Message-----
> From: mariano.lopez@linux.intel.com
> [mailto:mariano.lopez@linux.intel.com]
> Sent: Tuesday, July 12, 2016 8:10 AM
> To: openembedded-core@lists.openembedded.org
> Cc: benjamin.esquivel@linux.intel.com; Mariano Lopez
> <mariano.lopez@linux.intel.com>
> Subject: [PATCH 1/1] selftest/seltest.py: Add test to check imports from
> other layers
> 
> From: Mariano Lopez <mariano.lopez@linux.intel.com>
> 
> This tests adds a check of selftest itself to verify if can add test from
other
> layers.
> 
> [YOCTO #9770]
> 
> Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
> ---
>  meta-selftest/lib/oeqa/selftest/imported.py | 14 ++++++++++++++
>  meta/lib/oeqa/selftest/seltest.py           | 19 +++++++++++++++++++
>  2 files changed, 33 insertions(+)
>  create mode 100644 meta-selftest/lib/oeqa/selftest/imported.py
>  create mode 100644 meta/lib/oeqa/selftest/seltest.py
> 
> diff --git a/meta-selftest/lib/oeqa/selftest/imported.py b/meta-
> selftest/lib/oeqa/selftest/imported.py
> new file mode 100644
> index 0000000..b80150b
> --- /dev/null
> +++ b/meta-selftest/lib/oeqa/selftest/imported.py
> @@ -0,0 +1,14 @@
> +from oeqa.selftest.base import oeSelfTest from oeqa.utils.decorators
> +import testcase
> +
> +class ImportedTests(oeSelfTest):
> +
> +    def test_import_dummy(self):
There is a bug where I am proposing some changes to the naming of the tests.
I'll take this test name as an example:
imported.ImportedTests.test_import_dummy. With my proposal I'd name this
test something more along these lines:
external_layer.ImportedTests.test_inconditional_pass.
> +        """
> +        Summary: Doesn't check anything, used to check import test from
other
> layers.
> +        Expected: 1. Pass unconditionally
> +        Product: oe-core
> +        Author: Mariano Lopez <mariano.lopez@intel.comr
typo at the end of the line
> +        """
> +
> +        self.assertEqual(True, True, msg = "Impossible to fail this
> + test")
> diff --git a/meta/lib/oeqa/selftest/seltest.py
> b/meta/lib/oeqa/selftest/seltest.py
> new file mode 100644
> index 0000000..ea185ec
> --- /dev/null
> +++ b/meta/lib/oeqa/selftest/seltest.py
> @@ -0,0 +1,19 @@
> +from oeqa.selftest.base import oeSelfTest from oeqa.utils.commands
> +import runCmd from oeqa.utils.decorators import testcase
> +
> +class Selftest(oeSelfTest):
> +
> +    def test_import_test_from_layer(self):
Based on the naming guidelines comment above, proposing something like:
selftest.externalLayer.test_list_imported
> +        """
> +        Summary: Checks functionality to import tests from other layers.
> +        Expected: 1. Must show "test_import_dummy" in the test list.
> +        Product: oe-core
> +        Author: Mariano Lopez <mariano.lopez@intel.com>
> +        """
> +
> +        test_name = "imported.ImportedTests.test_import_dummy"
> +        error_msg = "Couldn't find test: %s; Not importing tests from
other
> layers" % test_name
> +        result = runCmd("oe-selftest --list-tests")
> +        success = True if test_name in result.output else False
> +        self.assertEqual(success, True, msg = error_msg)
> --
> 2.6.6



