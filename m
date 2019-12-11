Return-Path: <quentin.schulz@streamunlimited.com>
Received: from bsmtp2.bon.at (bsmtp2.bon.at [213.33.87.16])
	by mail.openembedded.org (Postfix) with ESMTP id 7EF307ED3D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Dec 2019 09:48:49 +0000 (UTC)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp2.bon.at (Postfix) with ESMTPSA id 47XsZT3sTDz5tlM;
	Wed, 11 Dec 2019 10:48:48 +0100 (CET)
Date: Wed, 11 Dec 2019 10:48:47 +0100
From: Quentin Schulz <quentin.schulz@streamunlimited.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Message-ID: <20191211094847.psxarymfddjjto42@qschulz>
References: <20191211031126.22782-1-pkj@axis.com>
	<20191211031126.22782-8-pkj@axis.com>
MIME-Version: 1.0
In-Reply-To: <20191211031126.22782-8-pkj@axis.com>
User-Agent: NeoMutt/20180716
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv2 8/8] incompatible_lic.py: Add tests for incompatible licenses with wildcards
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
X-List-Received-Date: Wed, 11 Dec 2019 09:48:50 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Peter,

On Wed, Dec 11, 2019 at 04:11:26AM +0100, Peter Kjellerstedt wrote:
> Suggested-by: Quentin Schulz <quentin.schulz@streamunlimited.com>
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
> 
> PATCHv2: New in this patch set.
> 
>  .../oeqa/selftest/cases/incompatible_lic.py   | 42 +++++++++++++++++++
>  1 file changed, 42 insertions(+)
> 
> diff --git a/meta/lib/oeqa/selftest/cases/incompatible_lic.py b/meta/lib/oeqa/selftest/cases/incompatible_lic.py
> index 458a940618..3eabd79097 100644
> --- a/meta/lib/oeqa/selftest/cases/incompatible_lic.py
> +++ b/meta/lib/oeqa/selftest/cases/incompatible_lic.py
> @@ -23,6 +23,18 @@ class IncompatibleLicenseTests(OESelftestTestCase):
>      def test_incompatible_alias_spdx_license(self):
>          self.lic_test('incompatible-license', 'GPL-3.0', 'GPLv3')
>  
> +    # Verify that a package with an SPDX license (from AVAILABLE_LICENSES)
> +    # cannot be built when INCOMPATIBLE_LICENSE contains a wildcarded license
> +    # matching this SPDX license
> +    def test_incompatible_spdx_license_wildcard(self):
> +        self.lic_test('incompatible-license', 'GPL-3.0', '*GPL-3.0')
> +
> +    # Verify that a package with an SPDX license (from AVAILABLE_LICENSES)
> +    # cannot be built when INCOMPATIBLE_LICENSE contains a wildcarded alias
> +    # license matching this SPDX license
> +    def test_incompatible_alias_spdx_license_wildcard(self):
> +        self.lic_test('incompatible-license', 'GPL-3.0', '*GPLv3')
> +
>      # Verify that a package with an alias (from SPDXLICENSEMAP) to an SPDX
>      # license cannot be built when INCOMPATIBLE_LICENSE contains this SPDX
>      # license
> @@ -34,6 +46,36 @@ class IncompatibleLicenseTests(OESelftestTestCase):
>      def test_incompatible_alias_spdx_license_alias(self):
>          self.lic_test('incompatible-license-alias', 'GPL-3.0', 'GPLv3')
>  
> +    # Verify that a package with an alias (from SPDXLICENSEMAP) to an SPDX
> +    # license cannot be built when INCOMPATIBLE_LICENSE contains a wildcarded
> +    # license matching this SPDX license
> +    def test_incompatible_spdx_license_alias_wildcard(self):
> +        self.lic_test('incompatible-license-alias', 'GPL-3.0', '*GPL-3.0')
> +
> +    # Verify that a package with an alias (from SPDXLICENSEMAP) to an SPDX
> +    # license cannot be built when INCOMPATIBLE_LICENSE contains a wildcarded
> +    # alias license matching the SPDX license
> +    def test_incompatible_alias_spdx_license_alias_wildcard(self):
> +        self.lic_test('incompatible-license-alias', 'GPL-3.0', '*GPLv3')
> +
> +    # Verify that a package with multiple SPDX licenses (from
> +    # AVAILABLE_LICENSES) cannot be built when INCOMPATIBLE_LICENSE contains
> +    # some of them
> +    def test_incompatible_spdx_licenses(self):
> +        self.lic_test('incompatible-licenses', 'GPL-3.0 LGPL-3.0', 'GPL-3.0 LGPL-3.0')
> +

I think you forgot to add
meta-selftest/recipes-test/license/incompatible-licenses.bb in your
patch :)

2019-12-11 10:40:13,581 - oe-selftest - INFO - test_incompatible_all_licenses_wildcard (incompatible_lic.IncompatibleLicenseTests)
2019-12-11 10:40:18,658 - oe-selftest - INFO -  ... FAIL
2019-12-11 10:40:18,658 - oe-selftest - INFO - Traceback (most recent call last):
  File "/tmp/poky/meta/lib/oeqa/selftest/cases/incompatible_lic.py", line 77, in test_incompatible_all_licenses_wildcard
    self.lic_test('incompatible-licenses', 'GPL-2.0 GPL-3.0 LGPL-3.0', '*')
  File "/tmp/poky/meta/lib/oeqa/selftest/cases/incompatible_lic.py", line 13, in lic_test
    raise AssertionError(result.output)
AssertionError: Parsing recipes...done.
ERROR: Nothing PROVIDES 'incompatible-licenses'. Close matches:
  incompatible-license
  incompatible-license-alias
  incompatible-nonspdx-license
Parsing of 798 .bb files complete (0 cached, 798 parsed). 1332 targets, 763 skipped, 0 masked, 0 errors.

Summary: There was 1 ERROR message shown, returning a non-zero exit code.

Thanks for the added tests.

Looks good to me otherwise. I don't really know if YP cares about the
Reviewed-by in patches (seems not by quickly looking in the git
history), but for the whole path series:

Reviewed-by: Quentin Schulz <quentin.schulz@streamunlimited.com>

Thanks!
Quentin

