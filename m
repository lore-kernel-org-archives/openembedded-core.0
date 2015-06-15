Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id CD3B873CF5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jun 2015 15:27:06 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 15 Jun 2015 08:27:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,618,1427785200"; d="scan'208";a="747015314"
Received: from sosalmel-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.29.110])
	by orsmga002.jf.intel.com with ESMTP; 15 Jun 2015 08:27:07 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Jun 2015 16:27:06 +0100
Message-ID: <6055885.RHuLqL3pbe@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.7 (Linux/4.0.4-202.fc21.x86_64; KDE/4.14.7; x86_64; ; )
In-Reply-To: <a28814625cb2316ef4c9b164cde11ee38bb95205.1433853790.git.mariano.lopez@linux.intel.com>
References: <cover.1433853790.git.mariano.lopez@linux.intel.com>
	<a28814625cb2316ef4c9b164cde11ee38bb95205.1433853790.git.mariano.lopez@linux.intel.com>
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] copyleft_filter.bbclass: Allow to filter on name
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
X-List-Received-Date: Mon, 15 Jun 2015 15:27:10 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 09 June 2015 12:46:48 mariano.lopez@linux.intel.com wrote:
> From: Mariano Lopez <mariano.lopez@linux.intel.com>
> 
> The archiver uses a license based filter to provide the source code.
> This patch allows to search on name based on two new variables
> (COPYLEFT_PN_INCLUDE, COPYLEFT_PN_EXCLUDE). Both variables are empty by
> default.
> The filter by name has higher priority than the license filter.
> 
> [YOCTO # 6929]
> 
> Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
> ---
>  meta/classes/archiver.bbclass        | 14 ++++++--------
>  meta/classes/copyleft_filter.bbclass | 25 +++++++++++++++++++++----
>  2 files changed, 27 insertions(+), 12 deletions(-)
> 
> diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
> index b598aa3..7b5274d 100644
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
> +    included, reason = copyleft_should_include(d)
> +    if not included:
> +        bb.debug(1, 'archiver: %s is excluded: %s' % (pn, reason))
> +        return
> +    else:
> +        bb.debug(1, 'archiver: %s is included: %s' % (pn, reason))
> 
>      ar_src = d.getVarFlag('ARCHIVER_MODE', 'src', True)
>      ar_dumpdata = d.getVarFlag('ARCHIVER_MODE', 'dumpdata', True)
> diff --git a/meta/classes/copyleft_filter.bbclass
> b/meta/classes/copyleft_filter.bbclass index 2c1d8f1..46be7f7 100644
> --- a/meta/classes/copyleft_filter.bbclass
> +++ b/meta/classes/copyleft_filter.bbclass
> @@ -25,6 +25,14 @@ COPYLEFT_AVAILABLE_RECIPE_TYPES = 'target native
> nativesdk cross crosssdk cross- COPYLEFT_AVAILABLE_RECIPE_TYPES[type] =
> 'list'
>  COPYLEFT_AVAILABLE_RECIPE_TYPES[doc] = 'Space separated list of available
> recipe types'
> 
> +COPYLEFT_PN_INCLUDE ?= ''
> +COPYLEFT_PN_INCLUDE[type] = 'list'
> +COPYLEFT_PN_INCLUDE[doc] = 'Space separated list of recipe names to
> include' +
> +COPYLEFT_PN_EXCLUDE ?= ''
> +COPYLEFT_PN_EXCLUDE[type] = 'list'
> +COPYLEFT_PN_EXCLUDE[doc] = 'Space separated list of recipe names to
> exclude' +
>  def copyleft_recipe_type(d):
>      for recipe_type in
> oe.data.typed_value('COPYLEFT_AVAILABLE_RECIPE_TYPES', d): if
> oe.utils.inherits(d, recipe_type):
> @@ -39,9 +47,11 @@ def copyleft_should_include(d):
>      import oe.license
>      from fnmatch import fnmatchcase as fnmatch
> 
> +    included, motive = False, 'recipe did not match anything'
> +
>      recipe_type = d.getVar('COPYLEFT_RECIPE_TYPE', True)
>      if recipe_type not in oe.data.typed_value('COPYLEFT_RECIPE_TYPES', d):
> -        return False, 'recipe type "%s" is excluded' % recipe_type
> +        include, motive = False, 'recipe type "%s" is excluded' %
> recipe_type
> 
>      include = oe.data.typed_value('COPYLEFT_LICENSE_INCLUDE', d)
>      exclude = oe.data.typed_value('COPYLEFT_LICENSE_EXCLUDE', d)
> @@ -53,10 +63,17 @@ def copyleft_should_include(d):
>      else:
>          if is_included:
>              if reason:
> -                return True, 'recipe has included licenses: %s' % ',
> '.join(reason) +                included, motive = True, 'recipe has
> included licenses: %s' % ', '.join(reason) else:
> -                return False, 'recipe does not include a copyleft license'
> +                included, motive = False, 'recipe does not include a
> copyleft license' else:
> -            return False, 'recipe has excluded licenses: %s' % ',
> '.join(reason) +            included, motive = False, 'recipe has excluded
> licenses: %s' % ', '.join(reason)
> 
> +    if any(fnmatch(d.getVar('PN', True), name) \
> +            for name in oe.data.typed_value('COPYLEFT_PN_INCLUDE', d)):
> +        included, motive =  True, 'recipe included by name'
> +    if any(fnmatch(d.getVar('PN', True), name) \
> +            for name in oe.data.typed_value('COPYLEFT_PN_EXCLUDE', d)):
> +        included, motive = False, 'recipe excluded by name'
> 
> +    return included, motive

Changes look good.

Acked-by: Paul Eggleton <paul.eggleton@linux.intel.com>

-- 

Paul Eggleton
Intel Open Source Technology Centre

