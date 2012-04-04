Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SFTcw-0003wf-2D
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Apr 2012 19:04:10 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 04 Apr 2012 09:54:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="125306814"
Received: from unknown (HELO [10.255.12.141]) ([10.255.12.141])
	by orsmga001.jf.intel.com with ESMTP; 04 Apr 2012 09:54:51 -0700
Message-ID: <4F7C7CDB.1070205@linux.intel.com>
Date: Wed, 04 Apr 2012 09:54:51 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1333399030-28619-1-git-send-email-eric@eukrea.com>
In-Reply-To: <1333399030-28619-1-git-send-email-eric@eukrea.com>
Subject: Re: [PATCH 1/2] license.py: fix behaviour of copyleft_compliance
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
X-List-Received-Date: Wed, 04 Apr 2012 17:04:10 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 04/02/2012 01:37 PM, Eric Bénard wrote:
> actually if a package has a license in its LICENSE variable
> which is not in the whitelist nor in the blacklist and even
> if an other license in this variable is in the whitelist,
> the package gets excluded and is not taken in account in the
> copyleft_compliance.
> This patch solves this by excluding a recipe _only_ if the
> LICENSE variable includes a pattern from the blacklist and
> including a recipe only if it includes a variable from the
> whitelist _and_ none from the blacklist.
>
> Example in busybox which has LICENSE="GPLv2&  BSD-4-Clause",
> with the actual behaviour (where he blacklist contains only
> CLOSED Proprietary) we get :
> DEBUG: copyleft: busybox-1.19.4 is excluded: recipe has excluded licenses: BSD-4-Clause
> which is not sane because busybox is covered by a copyleft license
> which is GPLv2 and should match the default whitelist which is
> GPL* LGPL*.
>
> Signed-off-by: Eric Bénard<eric@eukrea.com>
> ---
> v2: updated and tested after Kergoth's review on IRC
>
>   meta/lib/oe/license.py |   11 +++++++----
>   1 files changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/meta/lib/oe/license.py b/meta/lib/oe/license.py
> index 5914506..173e319 100644
> --- a/meta/lib/oe/license.py
> +++ b/meta/lib/oe/license.py
> @@ -86,8 +86,10 @@ def is_included(licensestr, whitelist=None, blacklist=None):
>       """
>
>       def include_license(license):
> -        return (any(fnmatch(license, pattern) for pattern in whitelist) and not
> -                any(fnmatch(license, pattern) for pattern in blacklist))
> +        return any(fnmatch(license, pattern) for pattern in whitelist)
> +
> +    def exclude_license(license):
> +        return any(fnmatch(license, pattern) for pattern in blacklist)
>
>       def choose_licenses(alpha, beta):
>           """Select the option in an OR which is the 'best' (has the most
> @@ -106,8 +108,9 @@ def is_included(licensestr, whitelist=None, blacklist=None):
>           blacklist = []
>
>       licenses = flattened_licenses(licensestr, choose_licenses)
> -    excluded = filter(lambda lic: not include_license(lic), licenses)
> +    excluded = filter(lambda lic: exclude_license(lic), licenses)
> +    included = filter(lambda lic: include_license(lic), licenses)
>       if excluded:
>           return False, excluded
>       else:
> -        return True, None
> +        return True, included

Merged both of these into OE-Core

Thanks
	Sau!


