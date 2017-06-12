Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 2BA49780A8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jun 2017 13:43:27 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Jun 2017 06:43:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,333,1493708400"; d="scan'208";a="98448288"
Received: from stritsch-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.63.199])
	by orsmga002.jf.intel.com with ESMTP; 12 Jun 2017 06:43:27 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: leonardo.sandoval.gonzalez@linux.intel.com
Date: Mon, 12 Jun 2017 15:43:26 +0200
Message-ID: <3871616.NMVemBk3WT@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
In-Reply-To: <278df1a63621364835b29b777d86d54696a70a27.1496423434.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1495747168.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<cover.1496423434.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<278df1a63621364835b29b777d86d54696a70a27.1496423434.git.leonardo.sandoval.gonzalez@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 1/3] export: new plugin to export the devtool workspace
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
X-List-Received-Date: Mon, 12 Jun 2017 13:43:28 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Leo,

This looks OK. However I just noticed - the output tarfile isn't compressed. Can we enable gzip compression? In practice that means mode should be 'w:gz' when writing out and also .tar.gz instead of .tar extension.

A couple of minor message notes below as well.


On Friday, 2 June 2017 7:12:59 PM CEST leonardo.sandoval.gonzalez@linux.intel.com wrote:
> From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
> 
> By default, exports the whole workspace (all recipes) including the source code.
> User can also limit what is exported with --included/--excluded flags. As
> a result of this operation, a tar archive containing only workspace metadata
> and its corresponding source code is created, which can be properly imported
> with 'devtool import'.
> 
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=10510
> 
> [YOCTO #10510]
> 
> Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
> ---
>  scripts/lib/devtool/export.py | 120 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 120 insertions(+)
>  create mode 100644 scripts/lib/devtool/export.py
> 
> diff --git a/scripts/lib/devtool/export.py b/scripts/lib/devtool/export.py
> new file mode 100644
> index 0000000000..64ac85162b
> --- /dev/null
> +++ b/scripts/lib/devtool/export.py
> @@ -0,0 +1,120 @@
> +# Development tool - export command plugin
> +#
> +# Copyright (C) 2014-2017 Intel Corporation
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
> +"""Devtool export plugin"""
> +
> +import os
> +import argparse
> +import tarfile
> +import logging
> +import datetime
> +import json
> +
> +logger = logging.getLogger('devtool')
> +
> +# output files
> +default_arcname_prefix = "workspace-export"
> +default_arcname_link = default_arcname_prefix + '.tar'
> +metadata = '.export_metadata'
> +
> +def export(args, config, basepath, workspace):
> +    """Entry point for the devtool 'export' subcommand"""
> +
> +    def add_metadata(tar):
> +        """Archive the workspace object"""
> +        # finally store the workspace metadata
> +        with open(metadata, 'w') as fd:
> +            fd.write(json.dumps((config.workspace_path, workspace)))
> +        tar.add(metadata)
> +        os.unlink(metadata)
> +
> +    def add_recipe(tar, recipe, data):
> +        """Archive recipe with proper arcname"""
> +        # Create a map of name/arcnames
> +        arcnames = []
> +        for key, name in data.items():
> +            if name:
> +                if key == 'srctree':
> +                    # all sources, no matter where are located, goes into the sources directory
> +                    arcname = 'sources/%s' % recipe
> +                else:
> +                    arcname = name.replace(config.workspace_path, '')
> +                arcnames.append((name, arcname))
> +
> +        for name, arcname in arcnames:
> +            tar.add(name, arcname=arcname)
> +
> +
> +    # Make sure workspace is non-empty and possible listed include/excluded recipes are in workspace
> +    if not workspace:
> +        logger.info('Workspace has not recipes, nothing to export')

"Workspace has not recipes" -> "Workspace contains no recipes"


> +        return 0
> +    else:
> +        for param, recipes in {'include':args.include,'exclude':args.exclude}.items():
> +            for recipe in recipes:
> +                if recipe not in workspace:
> +                    logger.error('Recipe (%s) on %s argument not in the current workspace' % (recipe, param))
> +                    return 1
> +
> +    name = args.file
> +
> +    default_name = "%s-%s.tar" % (default_arcname_prefix, datetime.datetime.now().strftime('%Y%m%d%H%M%S'))
> +    if not name:
> +        name = default_name
> +    else:
> +        # if name is a directory, append the default name
> +        if os.path.isdir(name):
> +            name = os.path.join(name, default_name)
> +
> +    if os.path.exists(name) and not args.overwrite:
> +        logger.error('Tar archive %s exists. Use --overwrite/-o to overwrite it')
> +        return 1
> +
> +    # if all workspace is excluded, quit
> +    if not len(set(workspace.keys()).difference(set(args.exclude))):
> +        logger.warn('All recipes in workspace excluded, no tar archive created')

"no tar archive created" -> "nothing to export"


> +        return 0
> +
> +    exported = []
> +    with tarfile.open(name, 'w') as tar:
> +        if args.include:
> +            for recipe in args.include:
> +                add_recipe(tar, recipe, workspace[recipe])
> +                exported.append(recipe)
> +        else:
> +            for recipe, data in workspace.items():
> +                if recipe not in args.exclude:
> +                    add_recipe(tar, recipe, data)
> +                    exported.append(recipe)
> +
> +        add_metadata(tar)
> +
> +    logger.info('Tar archive created at %s with the following recipes: %s' % (name, ' '.join(exported)))

', '.join() makes for a slightly more readable output.

> +    return 0
> +
> +def register_commands(subparsers, context):
> +    """Register devtool export subcommands"""
> +    parser = subparsers.add_parser('export',
> +                                   help='Export workspace into a tar archive',
> +                                   description='Export one or more recipes from current workspace into a tar archive',
> +                                   group='advanced')
> +
> +    parser.add_argument('--file', '-f', help='Use archive file or device')

For the -f help text I think we ought to just say "Output archive file name".

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

