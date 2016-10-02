Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id E9F7C6FF84
	for <openembedded-core@lists.openembedded.org>;
	Sun,  2 Oct 2016 22:40:08 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 02 Oct 2016 15:40:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,434,1473145200"; d="scan'208";a="1059557094"
Received: from thiyagax-mobl2.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.185.151])
	by orsmga002.jf.intel.com with ESMTP; 02 Oct 2016 15:40:08 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Stephano Cetola <stephano.cetola@linux.intel.com>
Date: Mon, 03 Oct 2016 11:40:04 +1300
Message-ID: <1551142.S3eIX641iV@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.7.5-100.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <20161002205506.124239-1-stephano.cetola@linux.intel.com>
References: <20161002205506.124239-1-stephano.cetola@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] devtool: modify command fails to ignore source files
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
X-List-Received-Date: Sun, 02 Oct 2016 22:40:10 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Stephano,

Thanks for looking into this, a few things:

On Sun, 02 Oct 2016 13:55:06 Stephano Cetola wrote:
> With recent changes to recipeutils, the list of local files returned
> by get_recipe_local_files could possibly include source files. This
> only happens when the recipe contains a SRC_URI using subdir= to put
> files in the source tree. These files should be ignored when
> populating the list of local files for oe-local-files directory.

You should include "Fixes [YOCTO #10326]." here. Also, if a patch fixes a 
regression that we've been able to track down, as part of the commit message I 
like to mention which revision caused it, and in this case it would be 
OE-Core revision 9069fef5dad5a873c8a8f720f7bcbc7625556309.

> Signed-off-by: Stephano Cetola <stephano.cetola@linux.intel.com>
> ---
>  scripts/lib/devtool/standard.py | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/lib/devtool/standard.py
> b/scripts/lib/devtool/standard.py index 8319145..c7a5712 100644
> --- a/scripts/lib/devtool/standard.py
> +++ b/scripts/lib/devtool/standard.py
> @@ -568,8 +568,12 @@ def _extract_source(srctree, keep_temp, devbranch,
> sync, d): recipe_patches = [os.path.basename(patch) for patch in
>                            oe.recipeutils.get_recipe_patches(crd)]
>          local_files = oe.recipeutils.get_recipe_local_files(crd)
> +
> +        # Ignore local files with subdir={BP}
> +        srcdirname = os.path.basename(os.path.normpath(srcsubdir))
>          local_files = [fname for fname in local_files if
> -                       os.path.exists(os.path.join(workdir, fname))]
> +                       os.path.exists(os.path.join(workdir, fname)) and
> +                       srcdirname not in fname]

This seems likely to false-trigger quite easily - you're only looking for the 
basename and whether it appears anywhere in the path rather than at the start. 
I'd suggest getting the absolute path to the source directory and check if it 
starts with that (I think that's how I dealt with that elsewhere).

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

