Return-Path: <benjamin.esquivel@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id DE5EE6FFCC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Feb 2016 19:47:53 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 15 Feb 2016 11:47:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,452,1449561600"; d="scan'208";a="652537090"
Received: from besquive-mobl2.zpn.intel.com ([10.219.128.114])
	by FMSMGA003.fm.intel.com with ESMTP; 15 Feb 2016 11:47:53 -0800
Message-ID: <1455565689.19294.12.camel@linux.intel.com>
From: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
Reply-To: benjamin.esquivel@linux.intel.com
To: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>, 
	openembedded-core@lists.openembedded.org
In-Reply-To: <1455563442-11586-2-git-send-email-francisco.j.pedraza.gonzalez@intel.com>
References: <1455563442-11586-1-git-send-email-francisco.j.pedraza.gonzalez@intel.com>
	<1455563442-11586-2-git-send-email-francisco.j.pedraza.gonzalez@intel.com>
Organization: Intel Corporation
Date: Mon, 15 Feb 2016 13:48:09 -0600
Mime-Version: 1.0
X-Mailer: Evolution 3.16.5 (3.16.5-3.fc22) 
Subject: Re: [PATCHv2 2/2] oeqa/selftest/prservice: Added new tc: check pr-server stop msg
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
X-List-Received-Date: Mon, 15 Feb 2016 19:47:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Paco, good to see you doing patches.

Please check my comments below.

On Mon, 2016-02-15 at 13:10 -0600, Francisco Pedraza wrote:
> When stopping the prserver using localhost as host, it tries to
> find a file '/tmp/PRServer_127.0.0.1_8585.pid' which is not
> present on the system.
> 
> fix for [YOCTO #8258]
> 
> Signed-off-by: Francisco Pedraza <
> francisco.j.pedraza.gonzalez@intel.com>
> ---
>  meta/lib/oeqa/selftest/prservice.py | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/lib/oeqa/selftest/prservice.py
> b/meta/lib/oeqa/selftest/prservice.py
> index f22288e..fbde5a6 100644
> --- a/meta/lib/oeqa/selftest/prservice.py
> +++ b/meta/lib/oeqa/selftest/prservice.py
> @@ -9,9 +9,9 @@ import oeqa.utils.ftools as ftools
>  from oeqa.selftest.base import oeSelfTest
>  from oeqa.utils.commands import runCmd, bitbake, get_bb_var
>  from oeqa.utils.decorators import testcase
> +from oeqa.utils.network import get_free_port
>  
>  class BitbakePrTests(oeSelfTest):
> -
seems like a line delete slipped here above
>      def get_pr_version(self, package_name):
>          pkgdata_dir = get_bb_var('PKGDATA_DIR')
>          package_data_file = os.path.join(pkgdata_dir, 'runtime',
> package_name)
> @@ -119,3 +119,16 @@ class BitbakePrTests(oeSelfTest):
>      @testcase(936)
>      def test_pr_service_ipk_arch_indep(self):
>          self.run_test_pr_service('xcursor-transparent-theme', 'ipk',
> 'do_package')
> +
> +    @testcase(1419)
> +    def test_stopping_prservice_message(self):
> +        output_msg_passed = 'Waiting for pr-server to exit.'
> +        err_msg = 'pidfile /tmp/PRServer_localhost_8585.pid does not
> exist. Daemon not running?'
while it is good to check for known error conditions, this one seems
very specific and could mutate easily. I.e. if the pidfile has a
different PID, the error message will not be the same as the one you
describe. This is better checked via a search expression.
> +
> +        port = get_free_port()
> +        runCmd('bitbake-prserv --host localhost --port %s -
> -loglevel=DEBUG --start' % port)
> +        ret = runCmd('bitbake-prserv --host localhost --port %s -
> -loglevel=DEBUG --stop' % port)
> +
> +        self.assertNotEqual(ret.output, err_msg)
You're checking the expected message first, that makes this second
check below for the unexpected message to be highly unlikely to happen
at this point.
I believe that checking just for the expected message would account for
the objective of the test.
> +        self.assertEqual(ret.output, output_msg_passed)
> +
> -- 
> 2.5.0
> 

