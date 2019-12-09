Return-Path: <quentin.schulz@streamunlimited.com>
Received: from bsmtp2.bon.at (bsmtp2.bon.at [213.33.87.16])
	by mail.openembedded.org (Postfix) with ESMTP id 394147FC03
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Dec 2019 10:20:19 +0000 (UTC)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp2.bon.at (Postfix) with ESMTPSA id 47WfMm4p1fz5tlK;
	Mon,  9 Dec 2019 11:20:20 +0100 (CET)
Date: Mon, 9 Dec 2019 11:20:19 +0100
From: Quentin Schulz <quentin.schulz@streamunlimited.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Message-ID: <20191209102019.cgtzabidya2omoy6@qschulz>
References: <20191207053815.1757-1-pkj@axis.com>
	<20191207053815.1757-5-pkj@axis.com>
MIME-Version: 1.0
In-Reply-To: <20191207053815.1757-5-pkj@axis.com>
User-Agent: NeoMutt/20180716
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 5/7] base.bbclass: Report only the licenses that are incompatible for a package
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
X-List-Received-Date: Mon, 09 Dec 2019 10:20:20 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Peter,

On Sat, Dec 07, 2019 at 06:38:13AM +0100, Peter Kjellerstedt wrote:
> Instead of reporting ${LICENSE} when a package is identified as using
> an incompatible license, report the license(s) that are actually
> incompatible.
> 
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
[...]
> diff --git a/meta/lib/oeqa/selftest/cases/incompatible_lic.py b/meta/lib/oeqa/selftest/cases/incompatible_lic.py
> index ad878571b5..9d1e801117 100644
> --- a/meta/lib/oeqa/selftest/cases/incompatible_lic.py
> +++ b/meta/lib/oeqa/selftest/cases/incompatible_lic.py
> @@ -4,7 +4,7 @@ from oeqa.utils.commands import bitbake
>  class IncompatibleLicenseTests(OESelftestTestCase):
>  
>      def lic_test(self, pn, pn_lic, lic):
> -        error_msg = 'ERROR: Nothing PROVIDES \'%s\'\n%s was skipped: it has an incompatible license: %s' % (pn, pn, pn_lic)
> +        error_msg = 'ERROR: Nothing PROVIDES \'%s\'\n%s was skipped: it has incompatible license(s): %s' % (pn, pn, pn_lic)
>  
>          self.write_config("INCOMPATIBLE_LICENSE += \"%s\"" % (lic))
>  
> @@ -27,12 +27,12 @@ class IncompatibleLicenseTests(OESelftestTestCase):
>      # license cannot be built when INCOMPATIBLE_LICENSE contains this SPDX
>      # license
>      def test_incompatible_spdx_license_alias(self):
> -        self.lic_test('incompatible-license-alias', 'GPLv3', 'GPL-3.0')
> +        self.lic_test('incompatible-license-alias', 'GPL-3.0', 'GPL-3.0')
>  
>      # Verify that a package with an alias (from SPDXLICENSEMAP) to an SPDX
>      # license cannot be built when INCOMPATIBLE_LICENSE contains this alias
>      def test_incompatible_alias_spdx_license_alias(self):
> -        self.lic_test('incompatible-license-alias', 'GPLv3', 'GPLv3')
> +        self.lic_test('incompatible-license-alias', 'GPL-3.0', 'GPLv3')
>  

We currently have 4 tests:
 - GPL-3.0 in LICENSE field in recipe and GPL-3.0 in INCOMPATIBLE_LICENSE
 - GPL-3.0 in LICENSE field in recipe and GPLv3 in INCOMPATIBLE_LICENSE
 - GPLv3 in LICENSE field in recipe and GPL-3.0 in INCOMPATIBLE_LICENSE
 - GPLv3 in LICENSE field in recipe and GPLv3 in INCOMPATIBLE_LICENSE

They test that the alias system (SPXLICENSEMAP) still works, which is
rather important since we never enforced the use of licenses from
SRC_DISTRIBUTE_LICENSES in LICENSE in recipes and allowed the use of
aliases (hence SPXLICENSEMAP).

If I'm not mistaken this change induces the following 4 tests:
 - GPL-3.0 in LICENSE field in recipe and GPL-3.0 in INCOMPATIBLE_LICENSE
 - GPL-3.0 in LICENSE field in recipe and GPLv3 in INCOMPATIBLE_LICENSE
 - GPL-3.0 in LICENSE field in recipe and GPL-3.0 in INCOMPATIBLE_LICENSE
 - GPL-3.0 in LICENSE field in recipe and GPLv3 in INCOMPATIBLE_LICENSE

which duplicates two tests.

The questions are: which error warranted this code change?

Are SPDXLICENSEMAP aliases still working? Can it still be checked?

If the original tests are indeed not needed anymore, we need to explicit
why (and we can actually just remove them).

I'm still advocating for new tests with wildcards :)

Thanks,
Quentin

