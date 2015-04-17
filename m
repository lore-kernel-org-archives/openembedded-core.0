Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id D4BFE73D81
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Apr 2015 16:04:31 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 17 Apr 2015 09:04:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,595,1422950400"; d="scan'208";a="715311479"
Received: from pbrao1-mobl5.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.13.156])
	by orsmga002.jf.intel.com with ESMTP; 17 Apr 2015 09:04:30 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Markus Lehtonen <markus.lehtonen@linux.intel.com>
Date: Fri, 17 Apr 2015 17:04:29 +0100
Message-ID: <1706261.ZY9MkiEMBf@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.4 (Linux/3.18.9-200.fc21.x86_64; KDE/4.14.6; x86_64; ; )
In-Reply-To: <1429202277-7215-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1429202277-7215-1-git-send-email-markus.lehtonen@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] devtool: call parse_recipe with correct arguments
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
X-List-Received-Date: Fri, 17 Apr 2015 16:04:32 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 16 April 2015 19:37:57 Markus Lehtonen wrote:
> Give the correct data object ("config data" instead of "recipe data") as
> an argument to oe.recipeutils.patch_recipe()
> 
> Fixes [YOCTO #7595]
> 
> Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
> ---
>  scripts/lib/devtool/standard.py | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/lib/devtool/standard.py
> b/scripts/lib/devtool/standard.py index 54920b2..d5ded2f 100644
> --- a/scripts/lib/devtool/standard.py
> +++ b/scripts/lib/devtool/standard.py
> @@ -482,7 +482,7 @@ def update_recipe(args, config, basepath, workspace):
>                  if remove_patches(srcuri, removepatches):
>                      patchfields['SRC_URI'] = ' '.join(srcuri)
> 
> -        oe.recipeutils.patch_recipe(rd, recipefile, patchfields)
> +        oe.recipeutils.patch_recipe(tinfoil.config_data, recipefile,
> patchfields)
> 
>          if not 'git://' in orig_src_uri:
>              logger.info('You will need to update SRC_URI within the recipe
> to point to a git repository where you have pushed your changes') @@ -564,7
> +564,8 @@ def update_recipe(args, config, basepath, workspace):
> updaterecipe = True
>              if updaterecipe:
>                  logger.info('Updating recipe %s' %
> os.path.basename(recipefile)) -               
> oe.recipeutils.patch_recipe(rd, recipefile, {'SRC_URI': ' '.join(srcuri)})
> +                oe.recipeutils.patch_recipe(tinfoil.config_data,
> +                        recipefile, {'SRC_URI': ' '.join(srcuri)})
>              elif not updatepatches:
>                  # Neither patches nor recipe were updated
>                  logger.info('No patches need updating')

Ah yes, that would explain it!

Acked-by: Paul Eggleton <paul.eggleton@linux.intel.com>

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

