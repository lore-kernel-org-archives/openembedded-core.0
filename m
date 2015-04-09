Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id D521C72D74
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Apr 2015 10:04:31 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 09 Apr 2015 03:04:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,549,1422950400"; d="scan'208";a="478806179"
Received: from kkowalsk-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.23.157])
	by FMSMGA003.fm.intel.com with ESMTP; 09 Apr 2015 03:04:31 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 09 Apr 2015 11:04:27 +0100
Message-ID: <6870420.DLcdg08pEb@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.4 (Linux/3.18.9-200.fc21.x86_64; KDE/4.14.6; x86_64; ; )
In-Reply-To: <1428563457-15238-1-git-send-email-yi.zhao@windriver.com>
References: <1428563457-15238-1-git-send-email-yi.zhao@windriver.com>
MIME-Version: 1.0
Subject: Re: [PATCH] lib/oeqa/selftest/bblayers: improve test for add-layer and remove-layer
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
X-List-Received-Date: Thu, 09 Apr 2015 10:04:33 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 09 April 2015 15:10:57 Yi Zhao wrote:
> Use absolute path instead of relative path for meta-skeleton.
> Otherwise the case would fail if the builddir outside the poky source
> tree.
> 
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>  meta/lib/oeqa/selftest/bblayers.py |    9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/lib/oeqa/selftest/bblayers.py
> b/meta/lib/oeqa/selftest/bblayers.py index 5b046d0..3a18029 100644
> --- a/meta/lib/oeqa/selftest/bblayers.py
> +++ b/meta/lib/oeqa/selftest/bblayers.py
> @@ -6,7 +6,7 @@ import shutil
> 
>  import oeqa.utils.ftools as ftools
>  from oeqa.selftest.base import oeSelfTest
> -from oeqa.utils.commands import runCmd
> +from oeqa.utils.commands import runCmd, get_bb_var
>  from oeqa.utils.decorators import testcase
> 
>  class BitbakeLayers(oeSelfTest):
> @@ -44,15 +44,16 @@ class BitbakeLayers(oeSelfTest):
>          self.assertTrue(find_in_contents)
> 
>      def test_bitbakelayers_add_remove(self):
> +        test_layer = os.path.join(get_bb_var('COREBASE'), 'meta-skeleton')
>          result = runCmd('bitbake-layers show-layers')
>          self.assertNotIn('meta-skeleton', result.output, 'This test cannot
> run with meta-skeleton in bblayers.conf') -        result =
> runCmd('bitbake-layers add-layer ../meta-skeleton') +        result =
> runCmd('bitbake-layers add-layer %s' % test_layer) result =
> runCmd('bitbake-layers show-layers')
>          self.assertIn('meta-skeleton', result.output)
> -        result = runCmd('bitbake-layers remove-layer ../meta-skeleton')
> +        result = runCmd('bitbake-layers remove-layer %s' % test_layer)
>          result = runCmd('bitbake-layers show-layers')
>          self.assertNotIn('meta-skeleton', result.output)
> -        result = runCmd('bitbake-layers add-layer ../meta-skeleton')
> +        result = runCmd('bitbake-layers add-layer %s' % test_layer)
>          result = runCmd('bitbake-layers show-layers')
>          self.assertIn('meta-skeleton', result.output)
>          result = runCmd('bitbake-layers remove-layer */meta-skeleton')

Acked-by: Paul Eggleton <paul.eggleton@linux.intel.com>

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

