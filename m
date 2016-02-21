Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id A920C77227
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Feb 2016 20:40:41 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 21 Feb 2016 12:40:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,482,1449561600"; d="scan'208";a="920759723"
Received: from jngau-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.137.140])
	by fmsmga002.fm.intel.com with ESMTP; 21 Feb 2016 12:40:40 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Costin Constantin <costin.c.constantin@intel.com>
Date: Mon, 22 Feb 2016 09:40:37 +1300
Message-ID: <5437205.k9xUkGe2xD@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.3.5-300.fc23.x86_64; KDE/4.14.16; x86_64; ;
	)
In-Reply-To: <1456047951-28027-1-git-send-email-costin.c.constantin@intel.com>
References: <1456047951-28027-1-git-send-email-costin.c.constantin@intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] oeqa/selftest/kernel.py: Add new file destined for kernel related tests [YP#7202]: Test for linux-dummy The new kernel.py file is intended for kernel related test cases. The test for linux-dummy will ensure it is in good shape and can be used as a kernel replacement at build time. To do this, the test will first clean sstate for linux-dummy target, ensuring no file is present in the stamps directory. After, core-image-minimal is built, ensuring linux-dummy can be used as a kernel substitute.
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
X-List-Received-Date: Sun, 21 Feb 2016 20:40:42 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Costin,

On Sun, 21 Feb 2016 11:45:51 Costin Constantin wrote:
> Signed-off-by: Costin Constantin <costin.c.constantin@intel.com>

Commit messages should start with a "shortlog" (one line description of the 
change) and then the commit message should be separated from that by a blank 
line so that it's not all crammed into the subject.

> ---
>  meta/lib/oeqa/selftest/kernel.py | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 meta/lib/oeqa/selftest/kernel.py
> 
> diff --git a/meta/lib/oeqa/selftest/kernel.py
> b/meta/lib/oeqa/selftest/kernel.py new file mode 100644
> index 0000000..3fe3517
> --- /dev/null
> +++ b/meta/lib/oeqa/selftest/kernel.py
> @@ -0,0 +1,29 @@
> +import os
> +import oeqa.utils.ftools as ftools
> +from oeqa.selftest.base import oeSelfTest
> +from oeqa.utils.commands import runCmd, bitbake, get_bb_var
> +from oeqa.utils.decorators import testcase
> +
> +class KernelTests(oeSelfTest):
> +    def  test_dummy_kernel(self):
> +        """
> +        [YP#7202]
> +        - test that linux-dummy target can be used as kernel provider for
> an image +        - check no "multiple providers are available for" message
> is received while building the image +        """
> +        config_param = 'PREFERRED_PROVIDER_virtual/kernel = "linux-dummy"'
> +        self.append_config(config_param)

Having set this, I would suggest verifying that it's actually taken effect, 
since it's common for this to be set within the distro/machine configuration.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

