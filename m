Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id E5BFC60043
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Aug 2015 12:45:34 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 27 Aug 2015 05:45:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,422,1437462000"; d="scan'208";a="791978966"
Received: from djcarton-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.20.50])
	by orsmga002.jf.intel.com with ESMTP; 27 Aug 2015 05:45:34 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Markus Lehtonen <markus.lehtonen@linux.intel.com>
Date: Thu, 27 Aug 2015 13:45:33 +0100
Message-ID: <1610283.bR69gNP3St@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.1.5-100.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <1440676190-2167-4-git-send-email-markus.lehtonen@linux.intel.com>
References: <1440676190-2167-1-git-send-email-markus.lehtonen@linux.intel.com>
	<1440676190-2167-4-git-send-email-markus.lehtonen@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] devtool: run kernel dependencies
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
X-List-Received-Date: Thu, 27 Aug 2015 12:45:36 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Markus,

On Thursday 27 August 2015 14:49:50 Markus Lehtonen wrote:
> The kernel package needs "kern-tools-native" in order for it's
> do_kernel_metadata. Thus, devtool extract for kernel in a pristine
> environment fails. With the current bb.tinfoil implementation it is not
> possible to run arbitrary bitbake commands - e.g. run
> "bitbake kern-tools-native -c populate_sysroot" in our case. This patch
> implements an ugly workaround for that problem, basically by hardcoding
> this dependency and running the required bitbake task(s) before tinfoil
> is initialized.
> 
> [YOCTO #6658]
> 
> Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
> ---
>  scripts/lib/devtool/standard.py | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/lib/devtool/standard.py
> b/scripts/lib/devtool/standard.py index 3725d87..bf24e32 100644
> --- a/scripts/lib/devtool/standard.py
> +++ b/scripts/lib/devtool/standard.py
> @@ -197,6 +197,8 @@ def extract(args, config, basepath, workspace):
>      """Entry point for the devtool 'extract' subcommand"""
>      import bb
> 
> +    _check_extract_deps(config, basepath, args.recipename)
> +
>      tinfoil = setup_tinfoil()
> 
>      rd = _parse_recipe(config, tinfoil, args.recipename, True)
> @@ -237,6 +239,20 @@ class BbTaskExecutor(object):
>              self.executed.append(func)
> 
> 
> +def _check_extract_deps(config, basepath, recipename):
> +    """HACK: Ugly workaround for making sure that requirements are met when
> +       trying to extract a package"""
> +    tinfoil = setup_tinfoil()
> +    rd = _parse_recipe(config, tinfoil, recipename, True)
> +    if bb.data.inherits_class('kernel-yocto', rd):
> +        tinfoil.shutdown()

Hmm, surely you need to call shutdown() in the non-kernel case as well? 
Otherwise won't the lock still be in place when this function returns and then 
setup_tinfoil() is called a second time?

> +        try:
> +            stdout, _ = exec_build_env_command(config.init_path, basepath,
> +                                               'bitbake kern-tools-native')
> +        except bb.process.ExecutionError as err:
> +            raise DevtoolError("Failed to build kern-tools-native:\n%s" %
> +                               err.stdout)
> +
>  def _extract_source(srctree, keep_temp, devbranch, d):
>      """Extract sources of a recipe"""
>      import bb.event
> @@ -422,7 +438,8 @@ def modify(args, config, basepath, workspace):
>          raise DevtoolError("directory %s does not exist or not a directory
> " "(specify -x to extract source from recipe)" % args.srctree)
> -
> +    if args.extract:
> +        _check_extract_deps(config, basepath, args.recipename)
>      tinfoil = setup_tinfoil()
> 
>      rd = _parse_recipe(config, tinfoil, args.recipename, True)

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

