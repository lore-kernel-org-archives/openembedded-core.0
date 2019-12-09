Return-Path: <quentin.schulz@streamunlimited.com>
Received: from bsmtp2.bon.at (bsmtp2.bon.at [213.33.87.16])
	by mail.openembedded.org (Postfix) with ESMTP id 03B607FC10
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Dec 2019 09:40:33 +0000 (UTC)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp2.bon.at (Postfix) with ESMTPSA id 47WdTs6pHBz5tlF;
	Mon,  9 Dec 2019 10:40:32 +0100 (CET)
Date: Mon, 9 Dec 2019 10:40:30 +0100
From: Quentin Schulz <quentin.schulz@streamunlimited.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Message-ID: <20191209094030.pvfalrwhipafpnp4@qschulz>
References: <20191207053815.1757-1-pkj@axis.com>
MIME-Version: 1.0
In-Reply-To: <20191207053815.1757-1-pkj@axis.com>
User-Agent: NeoMutt/20180716
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/7] license.bbclass: Introduce AVAILABLE_LICENSES that lists all licenses
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
X-List-Received-Date: Mon, 09 Dec 2019 09:40:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Peter,

On Sat, Dec 07, 2019 at 06:38:09AM +0100, Peter Kjellerstedt wrote:
> Previously, there was SRC_DISTRIBUTE_LICENSES, an undocumented
> variable that contained a static list of licenses. It was used by
> expand_wildcard_licenses() to expand any wildcards used in, e.g.,
> INCOMPATIBLE_LICENSE. However, since this static list of licenses has
> not been kept up-to-date, many licenses were missing, with the result
> that if one tried to use any of those licenses with a wildcard, no
> licenses would be found, effectively ignoring that they should be
> marked as incompatible.
> 
> This introduces a new (documented) variable, AVAILABLE_LICENSES, that
> is automatically updated to contain all licenses found in any
> directories specified by ${COMMON_LICENSE_DIR} and ${LICENSE_PATH},
> and uses it instead of SRC_DISTRIBUTE_LICENSES when expanding
> wildcards.
> 

Great addition, thanks!

> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  meta/classes/license.bbclass                  | 27 ++++++++++++++++---
>  meta/conf/documentation.conf                  |  1 +
>  .../oeqa/selftest/cases/incompatible_lic.py   |  6 ++---
>  3 files changed, 27 insertions(+), 7 deletions(-)
> 
> diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
> index 648a4d7892..20af6d34b6 100644
> --- a/meta/classes/license.bbclass
> +++ b/meta/classes/license.bbclass
> @@ -252,7 +252,7 @@ def canonical_license(d, license):
>      """
>      Return the canonical (SPDX) form of the license if available (so GPLv3
>      becomes GPL-3.0), for the license named 'X+', return canonical form of
> -    'X' if availabel and the tailing '+' (so GPLv3+ becomes GPL-3.0+), 
> +    'X' if availabel and the tailing '+' (so GPLv3+ becomes GPL-3.0+),

Might not be fully awake yet but looks like it's a spurious change here.
Though, there's actually a typo in availabel that could be fixed :)

[...]
>  
>      # Verify that a package with a non-SPDX license (neither in
> -    # SRC_DISTRIBUTE_LICENSES nor in SPDXLICENSEMAP) cannot be built when
> +    # AVAILABLE_LICENSES nor in SPDXLICENSEMAP) cannot be built when
>      # INCOMPATIBLE_LICENSE contains this license
>      def test_incompatible_nonspdx_license(self):
>          self.lic_test('incompatible-nonspdx-license', 'FooLicense', 'FooLicense')
> -- 

I think it could be great to have a new test in that selftest file to check that
INCOMPATIBLE_LICENSE works with wildcards for licenses not in
SRC_DISTRIBUTE_LICENSES.

Thanks,
Quentin

