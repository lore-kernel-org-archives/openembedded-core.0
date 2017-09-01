Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 69E747848F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Sep 2017 05:21:06 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	31 Aug 2017 22:21:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,456,1498546800"; d="scan'208";a="130596068"
Received: from kcheng8-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.71.81])
	by orsmga002.jf.intel.com with ESMTP; 31 Aug 2017 22:21:05 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: juan.m.cruz.alcaraz@linux.intel.com
Date: Fri, 01 Sep 2017 17:21:01 +1200
Message-ID: <2077788.NQF7r6SEhT@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
In-Reply-To: <20170824005109.780-1-juan.m.cruz.alcaraz@linux.intel.com>
References: <20170824005109.780-1-juan.m.cruz.alcaraz@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3] devtool/standard: set a preferred provider when adding a new recipe with devtool
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
X-List-Received-Date: Fri, 01 Sep 2017 05:21:07 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Juan,

On Thursday, 24 August 2017 12:51:09 PM NZST juan.m.cruz.alcaraz@linux.intel.com wrote:
> From: Juan M Cruz Alcaraz <juan.m.cruz.alcaraz@linux.intel.com>
> 
> A recipe added with "devtool add" requires to be able to take precedence on recipes
> previously defined with PREFERRED_PROVIDER.
> 
> By adding the parameter "--provides" to "devtool add" it is possible to specify
> an element to be provided by the recipe. A devtool recipe can override a previous
> PREFERRED_PROVIDER using the layer configuration file in the workspace.
> 
> E.g.
>     devtool add my-libgl git@git://my-libgl-repository --provides virtual/libgl
> 
> [YOCTO #10415]
> 
> Signed-off-by: Juan M Cruz Alcaraz <juan.m.cruz.alcaraz@linux.intel.com>
> ---
>  scripts/lib/devtool/standard.py  | 20 ++++++++++++++++++++
>  scripts/lib/recipetool/create.py |  3 +++
>  2 files changed, 23 insertions(+)
> 
> diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
> index ec192238ed..b3d857bbd9 100644
> --- a/scripts/lib/devtool/standard.py
> +++ b/scripts/lib/devtool/standard.py
> @@ -151,6 +151,8 @@ def add(args, config, basepath, workspace):
>          extracmdopts += ' --fetch-dev'
>      if args.mirrors:
>          extracmdopts += ' --mirrors'
> +    if args.provides:
> +        extracmdopts += ' --provides %s' % args.provides
>  
>      tempdir = tempfile.mkdtemp(prefix='devtool')
>      try:
> @@ -266,6 +268,23 @@ def add(args, config, basepath, workspace):
>                  f.write('    done\n')
>                  f.write('}\n')
>  
> +        # Check if the new layer provides recipes whose priorities have been
> +        # overriden by PREFERRED_PROVIDER.
> +        recipe_name = rd.getVar('PN')
> +        provides = rd.getVar('PROVIDES')
> +        # Search every item defined in PROVIDES
> +        for recipe_provided in provides.split():
> +            preferred_provider = 'PREFERRED_PROVIDER_' + recipe_provided
> +            if rd.getVar(preferred_provider):
> +                if args.fixed_setup:
> +                    #if we are inside the eSDK add the new PREFERRED_PROVIDER in the workspace layer.conf
> +                    layerconf_file = os.path.join(config.workspace_path, "conf", "layer.conf")
> +                    with open(layerconf_file, 'a') as f:
> +                        f.write('%s="%s"\n' % (preferred_provider, recipe_name))
> +                else:
> +                    logger.warn('Set \'%s\' in order to use the recipe' % preferred_provider)
> +                break
> +

I was all set to ack this, and then I realised there are still a few issues:

1) We aren't undoing this change to the workspace layer's layer.conf on
reset/finish. Can you please add that?

2) Could you please add spaces around the = in the line we add to layer.conf
as well.

3) At the moment you just check if the PREFERRED_PROVIDER is set at all,
but we can also skip all of this if it's already set to PN of the recipe
we're working on.

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

