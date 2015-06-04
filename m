Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id B7B7E73BBE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jun 2015 13:46:21 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 04 Jun 2015 06:46:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,552,1427785200"; d="scan'208";a="720730218"
Received: from shtadas-mobl7.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.3.53])
	by fmsmga001.fm.intel.com with ESMTP; 04 Jun 2015 06:46:20 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: mariano.lopez@linux.intel.com
Date: Thu, 04 Jun 2015 14:46:18 +0100
Message-ID: <2043785.FosIoIjuND@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.7 (Linux/3.19.7-200.fc21.x86_64; KDE/4.14.7; x86_64; ; )
In-Reply-To: <1432276165-31516-1-git-send-email-mariano.lopez@linux.intel.com>
References: <1432276165-31516-1-git-send-email-mariano.lopez@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] copyleft_filter.bbclass: Allow to filter on name
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
X-List-Received-Date: Thu, 04 Jun 2015 13:46:22 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Mariano,

On Friday 22 May 2015 06:29:25 mariano.lopez@linux.intel.com wrote:
> From: Mariano Lopez <mariano.lopez@linux.intel.com>
> 
> The archiver uses a license based filter to provide the source code.
> This patch allows to search on name based on two new variables
> (SRC_INCLUDE_NAME, SRC_EXCLUDE_NAME). Both variables are empty by default.
> The filter by name has higher priority than the license filter.
> 
> Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
> ---
>  meta/classes/archiver.bbclass        | 14 ++++++--------
>  meta/classes/copyleft_filter.bbclass | 28 ++++++++++++++++++++++++++++
>  2 files changed, 34 insertions(+), 8 deletions(-)
> 
> diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
> index b598aa3..138c407 100644
> --- a/meta/classes/archiver.bbclass
> +++ b/meta/classes/archiver.bbclass
> @@ -52,14 +52,12 @@ do_ar_original[dirs] = "${ARCHIVER_OUTDIR}
> ${ARCHIVER_WORKDIR}" python () {
>      pn = d.getVar('PN', True)
> 
> -    if d.getVar('COPYLEFT_LICENSE_INCLUDE', True) or \
> -            d.getVar('COPYLEFT_LICENSE_EXCLUDE', True):
> -        included, reason = copyleft_should_include(d)
> -        if not included:
> -            bb.debug(1, 'archiver: %s is excluded: %s' % (pn, reason))
> -            return
> -        else:
> -            bb.debug(1, 'archiver: %s is included: %s' % (pn, reason))
> +    included, reason = should_include_src(d)
> +    if not included:
> +        bb.debug(1, 'archiver: %s is excluded: %s' % (pn, reason))
> +        return
> +    else:
> +        bb.debug(1, 'archiver: %s is included: %s' % (pn, reason))
> 
>      ar_src = d.getVarFlag('ARCHIVER_MODE', 'src', True)
>      ar_dumpdata = d.getVarFlag('ARCHIVER_MODE', 'dumpdata', True)
> diff --git a/meta/classes/copyleft_filter.bbclass
> b/meta/classes/copyleft_filter.bbclass index 2c1d8f1..d5c3b59 100644
> --- a/meta/classes/copyleft_filter.bbclass
> +++ b/meta/classes/copyleft_filter.bbclass
> @@ -25,6 +25,14 @@ COPYLEFT_AVAILABLE_RECIPE_TYPES = 'target native
> nativesdk cross crosssdk cross- COPYLEFT_AVAILABLE_RECIPE_TYPES[type] =
> 'list'
>  COPYLEFT_AVAILABLE_RECIPE_TYPES[doc] = 'Space separated list of available
> recipe types'
> 
> +SRC_INCLUDE_NAME ?= ''
> +SRC_INCLUDE_NAME[type] = 'list'
> +SRC_INCLUDE_NAME[doc] = 'Space separated list of recipe names to include'
> +
> +SRC_EXCLUDE_NAME ?= ''
> +SRC_EXCLUDE_NAME[type] = 'list'
> +SRC_EXCLUDE_NAME[doc] = 'Space separated list of recipe names to exclude'
> +
>  def copyleft_recipe_type(d):
>      for recipe_type in
> oe.data.typed_value('COPYLEFT_AVAILABLE_RECIPE_TYPES', d): if
> oe.utils.inherits(d, recipe_type):
> @@ -59,4 +67,24 @@ def copyleft_should_include(d):
>          else:
>              return False, 'recipe has excluded licenses: %s' % ',
> '.join(reason)
> 
> +def should_include_src(d):
> +    """
> +    Determine if this recipe's source should be deployed
> +    """
> +    from fnmatch import fnmatchcase as fnmatch
> +
> +    if d.getVar('COPYLEFT_LICENSE_INCLUDE', True) or \
> +            d.getVar('COPYLEFT_LICENSE_EXCLUDE', True):
> +        is_included, reason = copyleft_should_include(d)
> +
> +    if any(fnmatch(d.getVar('PN', True), name) \
> +            for name in oe.data.typed_value('SRC_INCLUDE_NAME', d)):
> +        is_included, reason =  True, 'recipe included by name'
> +    if any(fnmatch(d.getVar('PN', True), name) \
> +            for name in oe.data.typed_value('SRC_EXCLUDE_NAME', d)):
> +        is_included, reason = False, 'recipe excluded by name'
> +
> +    if 'reason' not in locals():
> +        is_included, reason = False, 'recipe did not match any condition'
> +    return is_included, reason

I really need to be more active in reviewing things, sorry about the lack of 
reply. A couple of comments:

1) It looks like we already have a function in copyleft_filter.bbclass that we 
should simply be extending i.e. copyleft_should_include() - you would then 
need to change archiver.bbclass so that it always calls that function instead 
of being conditional on whether COPYLEFT_LICENSE_INCLUDE or 
COPYLEFT_LICENSE_EXCLUDE are set.

2) Following on from the above, the new variable ought to be named 
consistently with the other variables used by the class, e.g. 
COPYLEFT_PN_INCLUDE and COPYLEFT_PN_EXCLUDE.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

