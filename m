Received: from bsmtp.bon.at (bsmtp.bon.at [213.33.87.14])
 by mx.groups.io with SMTP id smtpd.web09.6586.1613729630706236874
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Feb 2021 02:13:51 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.14, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp.bon.at (Postfix) with ESMTPSA id 4DhnV36Nf4z5tlL;
	Fri, 19 Feb 2021 11:13:47 +0100 (CET)
Date: Fri, 19 Feb 2021 11:13:46 +0100
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 05/11] licenses: Update INCOMPATIBLE_LICENSE for 'or-later' handling
Message-ID: <20210219101346.h3aolkvmezpjmyuu@qschulz>
References: <20210218165646.2109894-1-richard.purdie@linuxfoundation.org>
 <20210218165646.2109894-5-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <20210218165646.2109894-5-richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Richard,

On Thu, Feb 18, 2021 at 04:56:40PM +0000, Richard Purdie wrote:
> Where a user adds "GPLv3" to INCOMPATIBLE_LICENSE they almost certainly
> mean both GPLv3-only and GPLv3-or-later. Update the code to handle this
> correctly.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/license.bbclass | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
> index 358c716a801..be8541f20dc 100644
> --- a/meta/classes/license.bbclass
> +++ b/meta/classes/license.bbclass
> @@ -281,6 +281,12 @@ def expand_wildcard_licenses(d, wildcard_licenses):
>      wildcards from SPDXLICENSEMAP flags and AVAILABLE_LICENSES.
>      """
>      import fnmatch
> +
> +    # Assume if we're passed "GPLv3" it means -or-later as well
> +    for lic in wildcard_licenses[:]:
> +        if "*" not in lic and not lic.endswith(("-or-later", "-only")):
> +            wildcard_licenses.append(lic + "-or-later")
> +

This means that "GPLv3" will have a different meaning in recipes than in
INCOMPATIBLE_LICENSE.

Can't we just force users to use an original SPDX (the one which ends
with -or-later or -only) instead for INCOMPATIBLE_LICENSE? This would
probably be as simple as looking if the license is in SPDXLICENSEMAP
varflags keys?

This feels less hacky to me.

Let me know your thoughts on this,
Cheers,
Quentin

>      licenses = wildcard_licenses[:]
>      spdxmapkeys = d.getVarFlags('SPDXLICENSEMAP').keys()
>      for wld_lic in wildcard_licenses:
> -- 
> 2.27.0
