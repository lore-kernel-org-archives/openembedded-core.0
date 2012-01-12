Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RlEWW-0007kg-9z
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Jan 2012 07:52:32 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 11 Jan 2012 22:45:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="97326070"
Received: from unknown (HELO [10.255.13.168]) ([10.255.13.168])
	by orsmga002.jf.intel.com with ESMTP; 11 Jan 2012 22:45:00 -0800
Message-ID: <4F0E816B.2080705@linux.intel.com>
Date: Wed, 11 Jan 2012 22:44:59 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1326208678-17244-1-git-send-email-andrei@gherzan.ro>
In-Reply-To: <1326208678-17244-1-git-send-email-andrei@gherzan.ro>
Cc: flocirel@gmail.com, Andrei Gherzan <andrei.gherzan@windriver.com>
Subject: Re: [PATCH] license.bbclass base.bbclass: support for 'or' operand in LICENSE and for SPDX license names
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Jan 2012 06:52:32 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/10/2012 07:17 AM, Andrei Gherzan wrote:
> From: Andrei Gherzan<andrei.gherzan@windriver.com>
>
> A new function was defined in license.bbclass in order to correctly exclude packages where OE-Style licence naming
> is used. In this way licenses as GPL-3, GPLv3, GPLv3.0 etc will be excluded from a non-GPLv3 build. This function
> takes into consideration if 'or' operand is used.
> The function defined in license.bbclass is called in base.bbclass where packages are excluded based on
> INCOMPATIBLE_LICENSE variable.
>
> [YOCTO #1884]
> [YOCTO #1844]
>
> Signed-off-by: Andrei Gherzan<andrei at gherzan.ro>
> ---
>   meta/classes/base.bbclass    |    3 +-
>   meta/classes/license.bbclass |   45 ++++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 46 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index e65a722..f0c358e 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -398,9 +398,8 @@ python () {
>               dont_want_whitelist = (d.getVar('WHITELIST_%s' % dont_want_license, 1) or "").split()
>               if pn not in hosttools_whitelist and pn not in lgplv2_whitelist and pn not in dont_want_whitelist:
>
> -                import re
>                   this_license = d.getVar('LICENSE', 1)
> -                if this_license and re.search(dont_want_license, this_license):
> +                if incompatible_license(d,dont_want_license):
>                       bb.note("SKIPPING %s because it's %s" % (pn, this_license))
>                       raise bb.parse.SkipPackage("incompatible with license %s" % this_license)
>
> diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
> index d351b5a..4b98e29 100644
> --- a/meta/classes/license.bbclass
> +++ b/meta/classes/license.bbclass
> @@ -237,6 +237,51 @@ python do_populate_lic() {
>
>   }
>
> +def incompatible_license(d,dont_want_license):
> +    """
> +    This function checks if a package has only incompatible licenses. It also take into consideration 'or'
> +    operand.
> +    """
> +    import re
> +    import oe.license
> +    from fnmatch import fnmatchcase as fnmatch
> +
> +    dont_want_licenses = []
> +    dont_want_licenses.append(d.getVar('INCOMPATIBLE_LICENSE', 1))
> +    if d.getVarFlag('SPDXLICENSEMAP', dont_want_license):
> +	dont_want_licenses.append(d.getVarFlag('SPDXLICENSEMAP', dont_want_license))
> +
> +    def include_license(license):
> +	if any(fnmatch(license, pattern) for pattern in dont_want_licenses):
> +	    return False
> +	else:
> +	    spdx_license = d.getVarFlag('SPDXLICENSEMAP', license)
> +	    if spdx_license and any(fnmatch(spdx_license, pattern) for pattern in dont_want_licenses):
> +		return False
> +	    else:
> +		return True
> +
> +    def choose_licenses(a, b):
> +        if all(include_license(lic) for lic in a):
> +		return a
> +        else:
> +		return b
> +
> +    """
> +    If you want to exlude license named generically 'X', we surely want to exlude 'X+' as well.
> +    In consequence, we will exclude the '+' character from LICENSE in case INCOMPATIBLE_LICENSE
> +    is not a 'X+' license.
> +    """
> +    if not re.search(r'[+]',dont_want_license):
> +	licenses=oe.license.flattened_licenses(re.sub(r'[+]', '', d.getVar('LICENSE', True)), choose_licenses)
> +    else:
> +	licenses=oe.license.flattened_licenses(d.getVar('LICENSE', True), choose_licenses)
> +
> +    for onelicense in licenses:
> +	if not include_license(onelicense):
> +		return True
> +    return False
> +
>   SSTATETASKS += "do_populate_lic"
>   do_populate_lic[sstate-name] = "populate-lic"
>   do_populate_lic[sstate-inputdirs] = "${LICSSTATEDIR}"

Andrei, thanks for your persistence with this one, there are clearly 
some issues in this area that need work, this is a great start down that 
line.

Merged into OE-Core

Sau!


