Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id D129073DAF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Apr 2015 14:51:50 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 27 Apr 2015 07:51:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,657,1422950400"; d="scan'208";a="562498818"
Received: from dmoore26-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.4.219])
	by orsmga003.jf.intel.com with ESMTP; 27 Apr 2015 07:51:51 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: jackie.huang@windriver.com
Date: Mon, 27 Apr 2015 15:51:50 +0100
Message-ID: <4123755.9MUpYuNdTt@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.4 (Linux/3.18.9-200.fc21.x86_64; KDE/4.14.6; x86_64; ; )
In-Reply-To: <92ce281f37748218692be482b3393e81b4b817ec.1429781137.git.jackie.huang@windriver.com>
References: <cover.1429781137.git.jackie.huang@windriver.com>
	<92ce281f37748218692be482b3393e81b4b817ec.1429781137.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] license.bbclass: allow copying license not in common licenses
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
X-List-Received-Date: Mon, 27 Apr 2015 14:51:55 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Jackie,

A couple of comments in-line below.

On Thursday 23 April 2015 17:38:15 jackie.huang@windriver.com wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
> 
> Some package like linux-firmware has many licenses that aren't in any
> way common, and new ones will be added from time to time, in order to
> avoid adding bunch of such common license files that are only applicable
> to a specific package, NO_GENERIC_LIC is added to allow copying license
> not in common licenses, it should be used in the recipe as:
> 
> NO_GENERIC_LIC[<license_name>] = "<license file in fetched source>"
> 
> e.g.
> NO_GENERIC_LIC[Firmware-Abilis] = "LICENCE.Abilis.txt"

Can we rename this to NO_GENERIC_LICENSE?

 
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  meta/classes/license.bbclass | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
> index 73a0e97..990f704 100644
> --- a/meta/classes/license.bbclass
> +++ b/meta/classes/license.bbclass
> @@ -222,7 +222,9 @@ def find_license_files(d):
>              pass
>          spdx_generic = None
>          license_source = None
> -        # If the generic does not exist we need to check to see if there is
> an SPDX mapping to it 
> +        # If the generic does not exist we need to
> check to see if there is an SPDX mapping to it, 
> +        # unless NO_GENERIC_LIC is set.
> +
>          for lic_dir in license_source_dirs:
>              if not os.path.isfile(os.path.join(lic_dir, license_type)):
>                  if d.getVarFlag('SPDXLICENSEMAP', license_type) != None:
> @@ -241,6 +243,14 @@ def find_license_files(d):
>              # audit up. This should be fixed in emit_pkgdata (or, we
> actually got and fix all the recipes)
> 
>              lic_files_paths.append(("generic_" 
>              + license_type, os.path.join(license_source, spdx_generic))) 
> +
> +        elif d.getVarFlag('NO_GENERIC_LIC', license_type):
> +            # if NO_GENERIC_LIC is set, we copy the license files from the
> fetched source +            # of the package rather than the
> license_source_dirs. +            for (basename, path) in lic_files_paths:
> +                if d.getVarFlag('NO_GENERIC_LIC', license_type) ==
> basename: 
> +                    lic_files_paths.append(("generic_" +
> license_type, path)) 
> +                    break
>          else:
>              # And here is where we warn people that their licenses are
> lousy 
>              bb.warn("%s: No generic license file exists for: %s in any
>              provider" % (pn, license_type))

Should we detect and warn when the user is attempting to override a common 
license with this mechanism (which shouldn't be allowed)?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

