Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id 51FA87F389
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Oct 2019 02:04:45 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Oct 2019 19:04:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,273,1566889200"; d="scan'208";a="205604328"
Received: from salujahi-mobl.gar.corp.intel.com (HELO linux.fritz.box)
	([10.249.74.106])
	by orsmga002.jf.intel.com with ESMTP; 08 Oct 2019 19:04:43 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
Date: Wed, 09 Oct 2019 15:03:57 +1300
Message-ID: <4911491.AjdURssxYH@linux.fritz.box>
Organization: Intel Corporation
In-Reply-To: <1570473350-6427-1-git-send-email-chandana.kalluri@xilinx.com>
References: <1570473350-6427-1-git-send-email-chandana.kalluri@xilinx.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [master][PATCH] devtool: Add --remove-work option for devtool reset command
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
X-List-Received-Date: Wed, 09 Oct 2019 02:04:45 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Chandana,

On Saturday, 5 October 2019 11:52:29 AM NZDT Sai Hari Chandana Kalluri wrote:
> Enable --remove-work option for devtool reset command that allows user
> to clean up source directory within workspace.
> 
> Currently devtool reset command only removes recipes and user is forced
> to manually remove the sources directory within the workspace before
> running devtool modify again.
> 
> Using devtool reset -r or devtool reset --remove-work option, user can
> cleanup the sources directory along with the recipe instead of manually
> cleaning it.

Thanks for adding this, some comments below.
 
> syntax: devtool reset -r <recipename>
>     Ex: devtool reset -r zip
> 
> 	devtool finish -r <recipename> <layer-name>
>     Ex: devtool finish -r zip meta-yocto-bsp
> 
> Signed-off-by: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
> ---
>  scripts/lib/devtool/standard.py | 26 +++++++++++++++++++-------
>  1 file changed, 19 insertions(+), 7 deletions(-)
> 
> diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
> index 60c9a04..1c0cd8a 100644
> --- a/scripts/lib/devtool/standard.py
> +++ b/scripts/lib/devtool/standard.py
> @@ -1852,7 +1852,7 @@ def status(args, config, basepath, workspace):
>      return 0
>  
>  
> -def _reset(recipes, no_clean, config, basepath, workspace):
> +def _reset(recipes, no_clean, remove_work, config, basepath, workspace):
>      """Reset one or more recipes"""
>      import oe.path
>  
> @@ -1930,10 +1930,15 @@ def _reset(recipes, no_clean, config, basepath, workspace):
>          srctreebase = workspace[pn]['srctreebase']
>          if os.path.isdir(srctreebase):
>              if os.listdir(srctreebase):
> -                # We don't want to risk wiping out any work in progress
> -                logger.info('Leaving source tree %s as-is; if you no '
> -                            'longer need it then please delete it manually'
> -                            % srctreebase)
> +                    if remove_work:
> +                        logger.info('-r argument used on %s, removing source tree.'
> +                                    ' You will lose any unsaved work' %pn)

This may be true, but isn't it a bit harsh given the user can't do anything about it at this point? I would simply say "Removing source tree as requested (-r)" and leave it at that.


> +                        shutil.rmtree(srctreebase)
> +                    else:
> +                        # We don't want to risk wiping out any work in progress
> +                        logger.info('Leaving source tree %s as-is; if you no '
> +                                    'longer need it then please delete it manually'
> +                                    % srctreebase)
>              else:
>                  # This is unlikely, but if it's empty we can just remove it
>                  os.rmdir(srctreebase)
> @@ -1943,6 +1948,10 @@ def _reset(recipes, no_clean, config, basepath, workspace):
>  def reset(args, config, basepath, workspace):
>      """Entry point for the devtool 'reset' subcommand"""
>      import bb
> +    import shutil
> +
> +    recipes = ""
> +
>      if args.recipename:
>          if args.all:
>              raise DevtoolError("Recipe cannot be specified if -a/--all is used")
> @@ -1957,7 +1966,7 @@ def reset(args, config, basepath, workspace):
>      else:
>          recipes = args.recipename
>  
> -    _reset(recipes, args.no_clean, config, basepath, workspace)
> +    _reset(recipes, args.no_clean, args.remove_work, config, basepath, workspace)
>  
>      return 0
>  
> @@ -2009,6 +2018,7 @@ def finish(args, config, basepath, workspace):
>              raise DevtoolError('Source tree is not clean:\n\n%s\nEnsure you have committed your changes or use -f/--force if you are sure there\'s nothing that needs to be committed' % dirty)
>  
>      no_clean = args.no_clean
> +    remove_work=args.remove_work

Please use PEP-8 spacing i.e. 

+    remove_work = args.remove_work

(Only for standalone assignments - named parameters in function calls don't use spaces around the equals)


> +    parser_reset.add_argument('--remove-work', '-r', action="store_true", help='Clean the sources directory along with append')

The help text should be "Also delete the working source tree (NOTE: will delete unsaved work)"

> +    parser_finish.add_argument('--remove-work', '-r', action="store_true", help='Clean the sources directory under workspace')

Similar with the help text: "Also delete the working source tree (NOTE: will delete uncommitted work)"

Also, please add oe-selftest tests for this as mentioned in my earlier reply - given we're deleting things here we need to make sure it doesn't regress in future.

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre



