Received: from bsmtp.bon.at (bsmtp.bon.at [213.33.87.14])
 by mx.groups.io with SMTP id smtpd.web12.2541.1588582531023675964
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 May 2020 01:55:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.14, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp.bon.at (Postfix) with ESMTPSA id 49FxX02z4Nz5tlG;
	Mon,  4 May 2020 10:55:27 +0200 (CEST)
Date: Mon, 4 May 2020 10:55:26 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: openembedded-core@lists.openembedded.org
Cc: bluelightning@bluelightning.org, richard.purdie@linuxfoundation.org
Subject: Re: [OE-core] [PATCH v2] classes: base|insane: check pkgs lics are subset of recipe lics only once
Message-ID: <20200504085526.s7dtrhybc7rseq4f@qschulz>
References: <1607A04B2CF7553C.19761@lists.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <1607A04B2CF7553C.19761@lists.openembedded.org>
User-Agent: NeoMutt/20180716
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Gentle ping. Don't forget the doc patch (I messed up and send it in its
own "patchseries").

Thanks,
Quentin

On Mon, Apr 20, 2020 at 10:13:29PM +0200, Quentin Schulz wrote:
> Yocto bug: https://bugzilla.yoctoproject.org/show_bug.cgi?id=10130
> 
> Move logic checking that all packages licenses are only a subset of
> recipe licenses from base.bbclass to the insane.bbclass so that it's
> evaluated only once, during do_package_qa.
> 
> As explained in the linked bugzilla entry, if a package license is not
> part of the recipe license, the warning message gets shown an
> unreasonable amount of time because it's evaluated every time a recipe
> is parsed.
> 
> This also makes it possible to silence this error with INSANE_SKIP.
> 
> Signed-off-by: Quentin Schulz <quentin.schulz@streamunlimited.com>
> ---
> 
> v2:
>  - move code from package class to insane class
> 
>  meta/classes/base.bbclass   | 13 -------------
>  meta/classes/insane.bbclass | 21 ++++++++++++++++++++-
>  2 files changed, 20 insertions(+), 14 deletions(-)
> 
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index 45f9435fd8..7aa2e144eb 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -584,19 +584,6 @@ python () {
>                          bb.debug(1, "Skipping recipe %s because of incompatible license(s): %s" % (pn, ' '.join(incompatible_lic)))
>                          raise bb.parse.SkipRecipe("it has incompatible license(s): %s" % ' '.join(incompatible_lic))
>  
> -        # Try to verify per-package (LICENSE_<pkg>) values. LICENSE should be a
> -        # superset of all per-package licenses. We do not do advanced (pattern)
> -        # matching of license expressions - just check that all license strings
> -        # in LICENSE_<pkg> are found in LICENSE.
> -        license_set = oe.license.list_licenses(license)
> -        for pkg in d.getVar('PACKAGES').split():
> -            pkg_license = d.getVar('LICENSE_' + pkg)
> -            if pkg_license:
> -                unlisted = oe.license.list_licenses(pkg_license) - license_set
> -                if unlisted:
> -                    bb.warn("LICENSE_%s includes licenses (%s) that are not "
> -                            "listed in LICENSE" % (pkg, ' '.join(unlisted)))
> -
>      needsrcrev = False
>      srcuri = d.getVar('SRC_URI')
>      for uri in srcuri.split():
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index 478240fa57..47c51081db 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -28,7 +28,7 @@ WARN_QA ?= "ldflags useless-rpaths rpaths staticdev libdir xorg-driver-abi \
>              pn-overrides infodir build-deps src-uri-bad \
>              unknown-configure-option symlink-to-sysroot multilib \
>              invalid-packageconfig host-user-contaminated uppercase-pn patch-fuzz \
> -            mime mime-xdg \
> +            mime mime-xdg unlisted-pkg-lics \
>              "
>  ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
>              perms dep-cmp pkgvarcheck perm-config perm-line perm-link \
> @@ -874,6 +874,25 @@ def package_qa_check_expanded_d(package, d, messages):
>                  sane = False
>      return sane
>  
> +QAPKGTEST[unlisted-pkg-lics] = "package_qa_check_unlisted_pkg_lics"
> +def package_qa_check_unlisted_pkg_lics(package, d, messages):
> +    """
> +    Check that all licenses for a package are among the licenses for the recipe.
> +    """
> +    pkg_lics = d.getVar('LICENSE_' + package)
> +    if not pkg_lics:
> +        return True
> +
> +    recipe_lics_set = oe.license.list_licenses(d.getVar('LICENSE'))
> +    unlisted = oe.license.list_licenses(pkg_lics) - recipe_lics_set
> +    if not unlisted:
> +        return True
> +
> +    package_qa_add_message(messages, "unlisted-pkg-lics",
> +                           "LICENSE_%s includes licenses (%s) that are not "
> +                           "listed in LICENSE" % (package, ' '.join(unlisted)))
> +    return False
> +
>  def package_qa_check_encoding(keys, encode, d):
>      def check_encoding(key, enc):
>          sane = True
> -- 
> 2.17.1
> 
