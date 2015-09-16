Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 0EFF060053
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Sep 2015 15:21:16 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 16 Sep 2015 08:21:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,540,1437462000"; d="scan'208";a="646028439"
Received: from prcullet-mobl3.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.3.81])
	by orsmga003.jf.intel.com with ESMTP; 16 Sep 2015 08:21:15 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Christopher Larson <kergoth@gmail.com>
Date: Wed, 16 Sep 2015 16:21:12 +0100
Message-ID: <1473703.IaEkCir4YU@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.1.6-100.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <1442375866-1848-1-git-send-email-kergoth@gmail.com>
References: <1442375866-1848-1-git-send-email-kergoth@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] recipetool: add 'newappend' sub-command
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
X-List-Received-Date: Wed, 16 Sep 2015 15:21:19 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Chris,

On Tuesday 15 September 2015 20:57:46 Christopher Larson wrote:
> This sub-command creates a bbappend for the specified target and prints the
> path to the bbappend. The -w argument, as with some of the other recipetool
> commands, will make a version-independent bbappend.
> 
> Example usage: recipetool newappend meta-mylayer virtual/kernel
> 
> [YOCTO #7964]
> 
> Signed-off-by: Christopher Larson <kergoth@gmail.com>
> ---
>  scripts/lib/recipetool/newappend.py | 126
> ++++++++++++++++++++++++++++++++++++ 1 file changed, 126 insertions(+)
>  create mode 100644 scripts/lib/recipetool/newappend.py
> 
> diff --git a/scripts/lib/recipetool/newappend.py
> b/scripts/lib/recipetool/newappend.py new file mode 100644
> index 0000000..be9077c
> --- /dev/null
> +++ b/scripts/lib/recipetool/newappend.py
> @@ -0,0 +1,126 @@
> +# Recipe creation tool - newappend plugin
> +#
> +# This sub-command creates a bbappend for the specified target and prints
> the +# path to the bbappend.
> +#
> +# Example: recipetool newappend meta-mylayer busybox
> +#
> +# Copyright (C) 2015 Christopher Larson <kergoth@gmail.com>
> +#
> +# This program is free software; you can redistribute it and/or modify
> +# it under the terms of the GNU General Public License version 2 as
> +# published by the Free Software Foundation.
> +#
> +# This program is distributed in the hope that it will be useful,
> +# but WITHOUT ANY WARRANTY; without even the implied warranty of
> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> +# GNU General Public License for more details.
> +#
> +# You should have received a copy of the GNU General Public License along
> +# with this program; if not, write to the Free Software Foundation, Inc.,
> +# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
> +
> +import argparse
> +import errno
> +import logging
> +import os
> +import re
> +
> +
> +logger = logging.getLogger('recipetool')
> +tinfoil = None
> +
> +
> +def plugin_init(pluginlist):
> +    # Don't need to do anything here right now, but plugins must have this
> function defined +    pass
> +
> +
> +def tinfoil_init(instance):
> +    global tinfoil
> +    tinfoil = instance
> +
> +
> +def _provide_to_pn(cooker, provide):
> +    """Get the name of the preferred recipe for the specified provide."""
> +    import bb.providers
> +    filenames = cooker.recipecache.providers[provide]
> +    eligible, foundUnique = bb.providers.filterProviders(filenames,
> provide, cooker.expanded_data, cooker.recipecache) +    filename =
> eligible[0]
> +    pn = cooker.recipecache.pkg_fn[filename]
> +    return pn
> +
> +
> +def _get_recipe_file(cooker, pn):
> +    import oe.recipeutils
> +    recipefile = oe.recipeutils.pn_to_recipe(cooker, pn)
> +    if not recipefile:
> +        skipreasons = oe.recipeutils.get_unavailable_reasons(cooker, pn)
> +        if skipreasons:
> +            logger.error('\n'.join(skipreasons))
> +        else:
> +            logger.error("Unable to find any recipe file matching %s" % pn)
> +    return recipefile
> +
> +
> +def layer(layerpath):
> +    if not os.path.exists(os.path.join(layerpath, 'conf', 'layer.conf')):
> +        raise argparse.ArgumentTypeError('{0!r} must be a path to a valid
> layer'.format(layerpath)) +    return layerpath
> +
> +
> +def newappend(args):
> +    pn = _provide_to_pn(tinfoil.cooker, args.target)
> +    recipe_path = _get_recipe_file(tinfoil.cooker, pn)
> +
> +    # Map recipe path to the layer it's in
> +    for layerpath in tinfoil.config_data.getVar('BBLAYERS', True).split():
> +        layerconf = os.path.join(layerpath, 'conf', 'layer.conf')
> +        l = bb.data.init()
> +        l.setVar('LAYERDIR', layerpath)
> +        l = bb.parse.handle(layerconf, l)
> +        l.expandVarref('LAYERDIR')
> +
> +        for layername in l.getVar('BBFILE_COLLECTIONS', True).split():
> +            pattern = l.getVar('BBFILE_PATTERN_' + layername, True)
> +            if pattern and re.match(pattern, recipe_path):
> +                recipe_layer_path = layerpath
> +                break
> +        else:
> +            continue
> +        break
> +    else:
> +        recipe_layer_path =
> os.path.dirname(os.path.dirname(os.path.dirname(recipe_path))) +
> +    recipe_relpath = os.path.relpath(recipe_path, recipe_layer_path)
> +    append_relpath = recipe_relpath + 'append'
> +    append_path = os.path.join(args.destlayer, append_relpath)
> +
> +    if args.wildcard_version and '_' in os.path.basename(append_path):
> +        base, _ = os.path.splitext(append_path)
> +        base, _ = base.rsplit('_', 1)
> +        append_path = base + '_%.bbappend'
> +
> +    if not os.path.exists(append_path):
> +        try:
> +            os.makedirs(os.path.dirname(append_path))
> +        except OSError as exc:
> +            if exc.errno != errno.EEXIST:
> +                raise
> +
> +        try:
> +            open(append_path, 'a')
> +        except (OSError, IOError) as exc:
> +            logger.critical(str(exc))
> +            return 1
> +
> +    print(append_path)
> +
> +
> +def register_command(subparsers):
> +    parser = subparsers.add_parser('newappend',
> +                                   help='Create a bbappend for the
> specified target in the specified layer') +    parser.add_argument('-w',
> '--wildcard-version', help='Use wildcard to make the bbappend apply to any
> recipe version', action='store_true') +    parser.add_argument('destlayer',
> help='Base directory of the destination layer to write the bbappend to',
> type=layer) +    parser.add_argument('target', help='Target recipe/provide
> to append') +    parser.set_defaults(func=newappend, parserecipes=True)

So the first thing that springs to mind here is that there's a bunch of code to 
do the major part of this in recipeutils (e.g. finding the correct name and 
location for a bbappend file is done by get_bbappend_path()) - shouldn't we be 
using that here?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

