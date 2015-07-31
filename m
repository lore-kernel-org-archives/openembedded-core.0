Return-Path: <anibal.limon@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 055CE7653B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jul 2015 14:54:15 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 31 Jul 2015 07:54:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,585,1432623600"; d="scan'208";a="739598058"
Received: from alimon-thinkpad-w540.zpn.intel.com (HELO [10.219.5.54])
	([10.219.5.54])
	by orsmga001.jf.intel.com with ESMTP; 31 Jul 2015 07:54:13 -0700
Message-ID: <55BB8C1B.2020104@linux.intel.com>
Date: Fri, 31 Jul 2015 09:54:19 -0500
From: =?windows-1252?Q?An=EDbal_Lim=F3n?= <anibal.limon@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>, 
	openembedded-core@lists.openembedded.org
References: <cover.1438262915.git.alexander.kanavin@linux.intel.com>
	<3bfd35fc6c4860c569683b9e8943fecfe20a228f.1438262915.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <3bfd35fc6c4860c569683b9e8943fecfe20a228f.1438262915.git.alexander.kanavin@linux.intel.com>
Subject: Re: [PATCH 25/26] distrodata.bbclass: do not use get_recipe_pv_without_srcpv() before comparing versions in checkpkg
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
X-List-Received-Date: Fri, 31 Jul 2015 14:54:17 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hi Alexander,

I added get_recipe_pv_without_srcpv for compare git versions because 
vercmp_string
don't take into account git versioning (git, gitAUTOINC) causing wrong 
comparisons.

We need to review if removal don't affect the current upstream detection.

Regards,
     alimon

On 30/07/15 08:31, Alexander Kanavin wrote:
> That function is intended for use with git sources and contains some restrictive regexes
> that don't work correctly when there are alphabetic characters in the version string.
> We can simply compare the versions directly.
>
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>   meta/classes/distrodata.bbclass | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/meta/classes/distrodata.bbclass b/meta/classes/distrodata.bbclass
> index af3af33..d33187b 100644
> --- a/meta/classes/distrodata.bbclass
> +++ b/meta/classes/distrodata.bbclass
> @@ -341,10 +341,7 @@ python do_checkpkg() {
>           if not pupver:
>               pupver = "N/A"
>           else:
> -            pv, _, _ = oe.recipeutils.get_recipe_pv_without_srcpv(pversion, uri_type)
> -            upv, _, _ = oe.recipeutils.get_recipe_pv_without_srcpv(pupver, uri_type)
> -
> -            cmp = vercmp_string(pv, upv)
> +            cmp = vercmp_string(pversion, pupver)
>               if cmp == -1:
>                   pstatus = "UPDATE"
>               elif cmp == 0:


