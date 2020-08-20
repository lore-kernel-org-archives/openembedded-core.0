Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.121699.1597962908753123243
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2020 15:35:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E104940C26;
	Thu, 20 Aug 2020 22:35:07 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id npPgxVSGHUz7; Thu, 20 Aug 2020 22:35:07 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9466540AB7;
	Thu, 20 Aug 2020 22:35:04 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id E63BB17446C; Thu, 20 Aug 2020 18:35:03 -0400 (EDT)
Date: Thu, 20 Aug 2020 18:35:03 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, akuster808@gmail.com,
	richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCHv3 1/8] license.bbclass: Introduce AVAILABLE_LICENSES that lists all licenses
Message-ID: <20200820223503.GM17660@denix.org>
References: <20191211164820.26588-1-pkj@axis.com>
MIME-Version: 1.0
In-Reply-To: <20191211164820.26588-1-pkj@axis.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This actually fails yocto-check-layer script for Yocto compliance 
checking, when a layer provides own licenses via LICENSE_PATH 
(in layer.conf - LICENSE_PATH += "${LAYERDIR}/licenses"):

Variable AVAILABLE_LICENSES value changed:
...

Is there a new way to provide additional licenses from a layer or 
should the yocto-check-layer script be modified to accomodate 
(i.e. ignore) this change?

-- 
Denys


On Wed, Dec 11, 2019 at 05:48:13PM +0100, Peter Kjellerstedt wrote:
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
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
> 
> PATCHv2: Correct spelling of 'available'.
> 
>  meta/classes/license.bbclass                  | 27 ++++++++++++++++---
>  meta/conf/documentation.conf                  |  1 +
>  .../oeqa/selftest/cases/incompatible_lic.py   |  6 ++---
>  3 files changed, 27 insertions(+), 7 deletions(-)
> 
> diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
> index 648a4d7892..c388740003 100644
> --- a/meta/classes/license.bbclass
> +++ b/meta/classes/license.bbclass
> @@ -252,7 +252,7 @@ def canonical_license(d, license):
>      """
>      Return the canonical (SPDX) form of the license if available (so GPLv3
>      becomes GPL-3.0), for the license named 'X+', return canonical form of
> -    'X' if availabel and the tailing '+' (so GPLv3+ becomes GPL-3.0+), 
> +    'X' if available and the tailing '+' (so GPLv3+ becomes GPL-3.0+),
>      or the passed license if there is no canonical form.
>      """
>      lic = d.getVarFlag('SPDXLICENSEMAP', license) or ""
> @@ -262,10 +262,29 @@ def canonical_license(d, license):
>              lic += '+'
>      return lic or license
>  
> +def available_licenses(d):
> +    """
> +    Return the available licenses by searching the directories specified by
> +    COMMON_LICENSE_DIR and LICENSE_PATH.
> +    """
> +    lic_dirs = ((d.getVar('COMMON_LICENSE_DIR') or '') + ' ' +
> +                (d.getVar('LICENSE_PATH') or '')).split()
> +
> +    licenses = []
> +    for lic_dir in lic_dirs:
> +        licenses += os.listdir(lic_dir)
> +
> +    licenses = sorted(licenses)
> +    return licenses
> +
> +# Only determine the list of all available licenses once. This assumes that any
> +# additions to LICENSE_PATH have been done before this file is parsed.
> +AVAILABLE_LICENSES := "${@' '.join(available_licenses(d))}"
> +
>  def expand_wildcard_licenses(d, wildcard_licenses):
>      """
> -    Return actual spdx format license names if wildcard used. We expand
> -    wildcards from SPDXLICENSEMAP flags and SRC_DISTRIBUTE_LICENSES values.
> +    Return actual spdx format license names if wildcards are used. We expand
> +    wildcards from SPDXLICENSEMAP flags and AVAILABLE_LICENSES.
>      """
>      import fnmatch
>      licenses = wildcard_licenses[:]
> @@ -274,7 +293,7 @@ def expand_wildcard_licenses(d, wildcard_licenses):
>          spdxflags = fnmatch.filter(spdxmapkeys, wld_lic)
>          licenses += [d.getVarFlag('SPDXLICENSEMAP', flag) for flag in spdxflags]
>  
> -    spdx_lics = (d.getVar('SRC_DISTRIBUTE_LICENSES', False) or '').split()
> +    spdx_lics = d.getVar('AVAILABLE_LICENSES').split()
>      for wld_lic in wildcard_licenses:
>          licenses += fnmatch.filter(spdx_lics, wld_lic)
>  
> diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
> index fca36f3cf6..0b21d1f63e 100644
> --- a/meta/conf/documentation.conf
> +++ b/meta/conf/documentation.conf
> @@ -69,6 +69,7 @@ ASSUME_SHLIBS[doc] = "List of shlib:package[_version] mappings. Useful for lib p
>  AUTHOR[doc] = "Email address used to contact the original author(s) in order to send patches and forward bugs."
>  AUTO_SYSLINUXMENU[doc] = "Enables creating an automatic menu for the syslinux bootloader."
>  AUTOREV[doc] = "When SRCREV is set to the value of this variable, it specifies to use the latest source revision in the repository."
> +AVAILABLE_LICENSES[doc] = "List of licenses found in the directories specified by COMMON_LICENSE_DIR and LICENSE_PATH."
>  
>  #B
>  
> diff --git a/meta/lib/oeqa/selftest/cases/incompatible_lic.py b/meta/lib/oeqa/selftest/cases/incompatible_lic.py
> index 904b5b4094..ad878571b5 100644
> --- a/meta/lib/oeqa/selftest/cases/incompatible_lic.py
> +++ b/meta/lib/oeqa/selftest/cases/incompatible_lic.py
> @@ -12,12 +12,12 @@ class IncompatibleLicenseTests(OESelftestTestCase):
>          if error_msg not in result.output:
>              raise AssertionError(result.output)
>  
> -    # Verify that a package with an SPDX license (from SRC_DISTRIBUTE_LICENSES)
> +    # Verify that a package with an SPDX license (from AVAILABLE_LICENSES)
>      # cannot be built when INCOMPATIBLE_LICENSE contains this SPDX license
>      def test_incompatible_spdx_license(self):
>          self.lic_test('incompatible-license', 'GPL-3.0', 'GPL-3.0')
>  
> -    # Verify that a package with an SPDX license (from SRC_DISTRIBUTE_LICENSES)
> +    # Verify that a package with an SPDX license (from AVAILABLE_LICENSES)
>      # cannot be built when INCOMPATIBLE_LICENSE contains an alias (in
>      # SPDXLICENSEMAP) of this SPDX license
>      def test_incompatible_alias_spdx_license(self):
> @@ -35,7 +35,7 @@ class IncompatibleLicenseTests(OESelftestTestCase):
>          self.lic_test('incompatible-license-alias', 'GPLv3', 'GPLv3')
>  
>      # Verify that a package with a non-SPDX license (neither in
> -    # SRC_DISTRIBUTE_LICENSES nor in SPDXLICENSEMAP) cannot be built when
> +    # AVAILABLE_LICENSES nor in SPDXLICENSEMAP) cannot be built when
>      # INCOMPATIBLE_LICENSE contains this license
>      def test_incompatible_nonspdx_license(self):
>          self.lic_test('incompatible-nonspdx-license', 'FooLicense', 'FooLicense')
> -- 
> 2.21.0
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
