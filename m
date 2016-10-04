Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id C96AC719AE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Oct 2016 01:34:10 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 03 Oct 2016 18:34:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,292,1473145200"; d="scan'208";a="1049116642"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.185.151])
	by fmsmga001.fm.intel.com with ESMTP; 03 Oct 2016 18:34:10 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Stephano Cetola <stephano.cetola@linux.intel.com>
Date: Tue, 04 Oct 2016 14:34:07 +1300
Message-ID: <1617309.fNo2yXclr1@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.7.5-100.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <20161002235824.131044-1-stephano.cetola@linux.intel.com>
References: <20161002235824.131044-1-stephano.cetola@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2] devtool: modify command fails to ignore source files
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
X-List-Received-Date: Tue, 04 Oct 2016 01:34:10 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Sun, 02 Oct 2016 16:58:24 Stephano Cetola wrote:
> With recent changes to recipeutils, the list of local files returned
> by get_recipe_local_files could possibly include source files. This
> only happens when the recipe contains a SRC_URI using subdir= to put
> files in the source tree. These files should be ignored when
> populating the list of local files for oe-local-files directory.
> 
> [YOCTO #10326]
> 
> introduced in
> OE-Core revision 9069fef5dad5a873c8a8f720f7bcbc7625556309
> 
> Signed-off-by: Stephano Cetola <stephano.cetola@linux.intel.com>
> ---
>  scripts/lib/devtool/standard.py | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/lib/devtool/standard.py
> b/scripts/lib/devtool/standard.py index 8319145..b6f9e12 100644
> --- a/scripts/lib/devtool/standard.py
> +++ b/scripts/lib/devtool/standard.py
> @@ -568,8 +568,12 @@ def _extract_source(srctree, keep_temp, devbranch,
> sync, d): recipe_patches = [os.path.basename(patch) for patch in
>                            oe.recipeutils.get_recipe_patches(crd)]
>          local_files = oe.recipeutils.get_recipe_local_files(crd)
> +
> +        # Ignore local files with subdir={BP}
> +        srcabspath = os.path.abspath(srcsubdir)
>          local_files = [fname for fname in local_files if
> -                       os.path.exists(os.path.join(workdir, fname))]
> +                       os.path.exists(os.path.join(workdir, fname)) and
> +                       not os.path.join(workdir,
> fname).startswith(srcabspath)] if local_files:
>              for fname in local_files:
>                  _move_file(os.path.join(workdir, fname),

OK - this looks better. One minor tweak I'd suggest though is to add os.sep on 
the end of srcabspath so we can be sure we're matching that directory and not 
one whose name starts with the same string.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

