Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 5BB6771AC6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 May 2017 22:39:29 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga104.jf.intel.com with ESMTP; 29 May 2017 15:39:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,415,1491289200"; d="scan'208";a="1135991998"
Received: from iho2-mobl6.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.160.82])
	by orsmga001.jf.intel.com with ESMTP; 29 May 2017 15:39:29 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 May 2017 10:39:27 +1200
Message-ID: <4112856.L6cQ6Ng9MU@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
In-Reply-To: <74570ed1b829c9c416cffa5547b673ea6e3ef262.1495747168.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1495747168.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<74570ed1b829c9c416cffa5547b673ea6e3ef262.1495747168.git.leonardo.sandoval.gonzalez@linux.intel.com>
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] import: new plugin to import the devtool workspace
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
X-List-Received-Date: Mon, 29 May 2017 22:39:31 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday, 26 May 2017 9:31:48 AM NZST leonardo.sandoval.gonzalez@linux.intel.com wrote:
> From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
> 
> Takes a tar archive created by 'devtool export' and export it (untar) to
> workspace. By default, the whole tar archive is imported, thus there is no
> way to limit what is imported.
> 
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=10510
> 
> [YOCTO #10510]
> 
> Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
> ---
>  scripts/lib/devtool/import.py | 99 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 99 insertions(+)
>  create mode 100644 scripts/lib/devtool/import.py
> 
> diff --git a/scripts/lib/devtool/import.py b/scripts/lib/devtool/import.py
> new file mode 100644
> index 00000000000..ff770c321f4
> --- /dev/null
> +++ b/scripts/lib/devtool/import.py
> @@ -0,0 +1,99 @@
> +# Development tool - import command plugin
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
> +"""Devtool import plugin"""
> +
> +import os
> +import tarfile
> +import logging
> +import re
> +from devtool import standard
> +
> +logger = logging.getLogger('devtool')
> +
> +def devimport(args, config, basepath, workspace):
> +    """Entry point for the devtool 'import' subcommand"""
> +    if not os.path.exists(args.name):
> +        logger.error('Tar archive %s does not exist. The expected archive should be created with "devtool export"')
> +        return 1
> +
> +    # match exported workspace folders
> +    prog = re.compile('recipes|appends|sources')
> +
> +    def get_prefix(name):
> +        """Prefix the workspace path or $HOME to the member name"""
> +        _prefix = ""
> +        if prog.match(name):
> +            _prefix = config.workspace_path + '/'
> +        else:
> +            if not name.startswith('/'):
> +                _prefix = os.environ['HOME'] + '/'
> +
> +        return _prefix, _prefix + name
> +
> +    # include the default archiver filename if missing
> +    name = args.name
> +    if os.path.isdir(name):
> +        if name[-1] != '/':
> +            name = name + '/'
> +        name = name + default_arcname

If the date is in the export we can't use this default - see below.

> +
> +    if not os.path.exists(name):
> +        logger.error('Tar archive %s does not exists. Export your workspace using "devtool export"')

"exists" -> "exist". We should also drop the "export your workspace" bit.

> +        return 1
> +
> +    included = []
> +    with tarfile.open(name) as tar:
> +        for member in tar.getmembers():
> +            prefix, path = get_prefix(member.name)
> +            if os.path.exists(path):
> +                if args.force:
> +                    try:
> +                        tar.extract(member, path=prefix)
> +                    except PermissionError as pe:
> +                        logger.warn(pe)
> +                else:
> +                    logger.warn('File already present, add -f to overwrite: %s' % member.name)
> +            else:
> +                tar.extract(member, path=prefix)
> +
> +            # md5 creation just for recipes or appends
> +            if member.name.startswith('recipes') or member.name.startswith('appends'):
> +                dirpath, recipe = os.path.split(member.name)
> +                recipename = ""
> +                for sep in "_ .".split():
> +                    if sep in recipe:
> +                        recipename = recipe.split(sep)[0]
> +                        break
> +                if not recipename:
> +                    logger.warn('Recipe name could not be extracted from %s' % member.name)
> +                    recipename = recipe
> +
> +                standard._add_md5(config, recipename, path)
> +                if recipename not in included:
> +                    included.append(recipename)
> +
> +    logger.info('Imported recipes into workspace %s: %s' % (config.workspace_path, included))
> +
> +def register_commands(subparsers, context):
> +    """Register devtool import subcommands"""
> +    parser = subparsers.add_parser('import',
> +                                   help='Import tar archive into workspace',
> +                                   description='Import previously created tar archive into the workspace',
> +                                   group='advanced')
> +    parser.add_argument('--name', '-n', default='workspace.tar', help='Name of the tar archive to import')

Remove the default here - actually I suspect we should just make this a
mandatory positional argument.

> +    parser.add_argument('--force', '-f', action="store_true", help='Overwrite previous files')

As per export this should be "overwrite" rather than "force".

There are a couple of things missing from this:

1) You noted that it doesn't check if there are recipes to match the
bbappends - we do need to do this as part of the initial version.
tinfoil.cooker.recipecaches[''].pkg_fn.items() should give you a list of all
recipe files that you can use to verify this.

2) The bbappends contain absolute paths that will need to be updated e.g.
EXTERNALSRC / EXTERNALSRC_BUILD - these will almost certainly be different
between the export and import machine if this functionality is used to send
workspace content between different users.

Cheers,
Paul


-- 

Paul Eggleton
Intel Open Source Technology Centre

