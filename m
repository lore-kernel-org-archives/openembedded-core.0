Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 9B5516007A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 May 2017 22:23:03 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 May 2017 15:23:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,415,1491289200"; d="scan'208";a="267805333"
Received: from iho2-mobl6.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.160.82])
	by fmsmga004.fm.intel.com with ESMTP; 29 May 2017 15:23:02 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: leonardo.sandoval.gonzalez@linux.intel.com
Date: Tue, 30 May 2017 10:23:00 +1200
Message-ID: <1992188.j0CeFzR9hl@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
In-Reply-To: <bf82908d95ac7a8c19e606773eb47da8c32b6e70.1495747168.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1495747168.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<bf82908d95ac7a8c19e606773eb47da8c32b6e70.1495747168.git.leonardo.sandoval.gonzalez@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] export: new plugin to export the devtool workspace
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
X-List-Received-Date: Mon, 29 May 2017 22:23:06 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Leo,

A few notes below.

On Friday, 26 May 2017 9:31:47 AM NZST leonardo.sandoval.gonzalez@linux.intel.com wrote:
> From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
> 
> By default, exports the whole workspace (all recipes) including the source
> code.
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
>  scripts/lib/devtool/export.py | 94 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 94 insertions(+)
>  create mode 100644 scripts/lib/devtool/export.py
> 
> diff --git a/scripts/lib/devtool/export.py b/scripts/lib/devtool/export.py
> new file mode 100644
> index 00000000000..8e3ba8ca68b
> --- /dev/null
> +++ b/scripts/lib/devtool/export.py
> @@ -0,0 +1,94 @@
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
> +
> +logger = logging.getLogger('devtool')
> +default_arcname = "workspace.tar"

This should have the date and time in it.  I'd probably structure it
differently but this will work:

import datetime
...
default_arcname = "workspace-export-%s.tar" % datetime.datetime.now().strftime('%Y%m%d%H%M%S'))


> +
> +def export(args, config, basepath, workspace):
> +    """Entry point for the devtool 'export' subcommand"""
> +
> +    def create_arcname(name):
> +        """Create arc name by removing the workspace path or $HOME prefix from name"""
> +        _name = name
> +        if name.startswith(config.workspace_path):
> +            _name = name.replace(config.workspace_path, '')
> +        else:
> +            _name = name.replace(os.environ['HOME'], '')
> +        return (name, _name)

I really don't like this. I'd much rather we explicitly handle each item - we
can assume that the recipe and bbappend will be under the workspace (since
they have to be). For the sources which can potentially be anywhere, we can
just restore these under sources/ on the other side.

> +    def reset(tarinfo):
> +        tarinfo.uname = tarinfo.gname = "nobody"

Why "nobody"? Is there a reason it shouldn't be left as the user that did the
export?

> +        return tarinfo
> +
> +    def add(tar, value):
> +        # Get  arcnames
> +        arcnames = []
> +        for key in ['srctree', 'bbappend', 'recipefile']:
> +            if key in value and value[key]:
> +                arcnames.append(create_arcname(value[key]))
> +
> +        # Archive
> +        for name, arcname in arcnames:
> +            tar.add(name, arcname=arcname, filter=reset)
> +
> +    # include the default archiver filename if missing
> +    name = args.name
> +    if os.path.isdir(name):
> +        if name[-1] != '/':
> +            name = name + '/'
> +        name = name + default_arcname
> +
> +    if os.path.exists(name) and not args.force:
> +        logger.error('Tar archive %s exists. Use -f to force removal')

"to force removal" -> "to overwrite it" (also see below)

> +        return 1
> +
> +    included = []
> +    with tarfile.open(name, "w") as tar:
> +        if args.include:

So here I would much rather we check both args.include and args.exclude
to ensure that they are completely valid and if not then exit with an error.
That reduces the likelihood of users mistyping a name and assuming that
a recipe is in the export when it isn't (or vice versa).

> +            for recipe in args.include:
> +                if recipe in workspace:
> +                    add(tar, workspace[recipe])
> +                    included.append(recipe)
> +                else:
> +                    logger.warn('recipe %s not in workspace, not in archive
> file')
> +        else:
> +            for recipe, value in workspace.items():
> +                if recipe not in args.exclude:
> +                    add(tar, value)
> +                    included.append(recipe)
> +
> +    logger.info('Tar archive create at %s with the following recipes: %s' % (name, included))

s/create/created/

Also replace included with ', '.join(included) for a bit neater presentation.

> +
> +def register_commands(subparsers, context):
> +    """Register devtool export subcommands"""
> +    parser = subparsers.add_parser('export',
> +                                   help='Export workspace into a tar archive',
> +                                   description='Export one or more recipes from current workspace into a tar archive',
> +                                   group='advanced')
> +
> +    parser.add_argument('--name', '-n', default=default_arcname, help='Name of the tar archive')

Can you make this -f / --file to match tar?

> +    parser.add_argument('--force', '-f', action="store_true", help='Overwrite previous export tar archive')

Rather than "force" this should be "overwrite".

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

