Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 01BD1780A3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jun 2017 14:19:56 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga105.fm.intel.com with ESMTP; 12 Jun 2017 07:19:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,333,1493708400"; d="scan'208";a="1140411703"
Received: from stritsch-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.63.199])
	by orsmga001.jf.intel.com with ESMTP; 12 Jun 2017 07:19:54 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: leonardo.sandoval.gonzalez@linux.intel.com
Date: Mon, 12 Jun 2017 16:19:53 +0200
Message-ID: <3141634.Z718jrWpIV@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
In-Reply-To: <fcb8ce082d06472414385f997f332f5f08581bd1.1496423434.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1495747168.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<cover.1496423434.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<fcb8ce082d06472414385f997f332f5f08581bd1.1496423434.git.leonardo.sandoval.gonzalez@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 3/3] import: new plugin to import the devtool workspace
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
X-List-Received-Date: Mon, 12 Jun 2017 14:19:58 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Leo,

A few comments below.


On Friday, 2 June 2017 7:13:01 PM CEST leonardo.sandoval.gonzalez@linux.intel.com wrote:
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
>  scripts/lib/devtool/import.py | 130 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 130 insertions(+)
>  create mode 100644 scripts/lib/devtool/import.py
> 
> diff --git a/scripts/lib/devtool/import.py b/scripts/lib/devtool/import.py
> new file mode 100644
> index 0000000000..5b85571669
> --- /dev/null
> +++ b/scripts/lib/devtool/import.py
> @@ -0,0 +1,130 @@
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
> +from devtool import standard, setup_tinfoil
> +from devtool import export
> +
> +import oeqa.utils.ftools as ftools

So, this is importing something from oeqa to use outside of the QA scripts.
Aside from that structural oddity, I have to be honest and say I'd rather we
did it the replacement in specific code here rather than creating and using
a generic function (especially seeing as we don't already have one) - then
we avoid the need to open the file and process all lines multiple times.


> +import json
> +
> +logger = logging.getLogger('devtool')
> +
> +def devimport(args, config, basepath, workspace):
> +    """Entry point for the devtool 'import' subcommand"""
> +
> +    def get_pn(name):
> +        dirpath, recipe = os.path.split(name)
> +        pn = ""
> +        for sep in "_ .".split():
> +            if sep in recipe:
> +                pn = recipe.split(sep)[0]
> +                break
> +        return pn

This function is a little worrying. Recipe names can legally have dots
in the PN part of the name. See below for a recommended alternative.

> +    
> +    # match exported workspace folders
> +    prog = re.compile('recipes|appends|sources')
> +
> +    if not os.path.exists(args.file):
> +        logger.error('Tar archive %s does not exist. Export your workspace using "devtool export"')
> +        return 1
> +
> +    # get current recipes
> +    current_recipes = []
> +    try:
> +        tinfoil = setup_tinfoil(config_only=False, basepath=basepath)

The setup_tinfoil() here should be outside of the try...finally or if it fails
to start it will still try to shut it down.


> +        current_recipes = [recipe[1] for recipe in tinfoil.cooker.recipecaches[''].pkg_fn.items()]
> +    finally:
> +        tinfoil.shutdown()
> +
> +    imported = []
> +    with tarfile.open(args.file) as tar:
> +
> +        # get exported metadata so values containing paths can be automatically replaced it
> +        export_workspace_path = export_workspace = None
> +        try:
> +            metadata = tar.getmember(export.metadata)
> +            tar.extract(metadata)
> +            with open(metadata.name) as fdm:
> +                export_workspace_path, export_workspace = json.load(fdm)
> +            os.unlink(metadata.name)
> +        except KeyError as ke:
> +            logger.warn('The export metadata file created by "devtool export" was not found')
> +            logger.warn('Manual editing is needed to correct paths on imported recipes/appends')

We should just fail if the metadata file isn't there - we don't need to
support users importing any random tarball; if the metadata file
isn't there we can safely assume that it wasn't exported with
devtool export.

> +
> +        members = [member for member in tar.getmembers() if member.name != export.metadata]
> +        for member in members:
> +            # make sure imported bbappend has its corresponding recipe (bb)
> +            if member.name.startswith('appends'):
> +                bbappend = get_pn(member.name)
> +                if bbappend:
> +                    if bbappend not in current_recipes:
> +                        # check that the recipe is not in the tar archive being imported
> +                        if bbappend not in export_workspace:
> +                            logger.warn('No recipe to append %s, skipping' % bbappend)
> +                            continue
> +                else:
> +                    logger.warn('bbappend name %s could not be detected' % member.name)
> +                    continue

This isn't the right way to check this - PN isn't guaranteed to be the same
as the name part of the filename, for one. It's much safer to iterate over
tinfoil.cooker.recipecaches[''].pkg_fn (keys, i.e. filenames, not PN values)
and see if the bbappend matches the item, breaking out on first match.
Remember that a bbappend might be the exact same name as the bb file or
it might use a % wildcard. (You could cheat and replace this % with a * and
then use fnmatch.fnmatch() to make this a bit easier). 

Given the moderate expense of computing this we should probably do it
once as part of the initial check and store it in a dict so we can use it later
(I see get_pn() is called again later on).

> +            # extract file from tar
> +            path = os.path.join(config.workspace_path, member.name)
> +            if os.path.exists(path):
> +                if args.overwrite:
> +                    try:
> +                        tar.extract(member, path=config.workspace_path)
> +                    except PermissionError as pe:
> +                        logger.warn(pe)

If a recipe is already in someone's workspace, is this going to leave the
user with a mix of files extracted from the tarball and whatever happens to
already be in the source tree? If so, that could be problematic. I think I
would first check if the recipe's source tree exists at all and if so, either
skip it with a warning or overwrite it entirely dependent on whether -o
has been specified.


> +                else:
> +                    logger.warn('File already present. Use --overwrite/-o to overwrite it: %s' % member.name)
> +            else:
> +                tar.extract(member, path=config.workspace_path)
> +
> +            if member.name.startswith('appends'):
> +                recipe = get_pn(member.name)
> +
> +                # Update EXTERNARLSRC

Typo - EXTERNALSRC.

> +                if export_workspace_path:
> +                    # appends created by 'devtool modify' just need to update the workspace
> +                    ftools.replace_from_file(path, export_workspace_path, config.workspace_path)
> +
> +                    # appends created by 'devtool add' need replacement of exported source tree
> +                    exported_srctree = export_workspace[recipe]['srctree']
> +                    if exported_srctree:
> +                        ftools.replace_from_file(path, exported_srctree, os.path.join(config.workspace_path, 'sources', recipe))
> +
> +                # update .devtool_md5 file
> +                standard._add_md5(config, recipe, path)
> +                if recipe not in imported:
> +                    imported.append(recipe)
> +
> +    logger.info('Imported recipes into workspace %s: %s' % (config.workspace_path, ' '.join(imported)))
> +    return 0
> +
> +def register_commands(subparsers, context):
> +    """Register devtool import subcommands"""
> +    parser = subparsers.add_parser('import',
> +                                   help='Import tar archive into workspace',
> +                                   description='Import previously created tar archive into the workspace',

We should be specific - 'Import exported tar archive into workspace' and
'Import tar archive previously created by "devtool export" into workspace'.

> +                                   group='advanced')
> +    parser.add_argument('file', metavar='FILE', help='Name of the tar archive to import')
> +    parser.add_argument('--overwrite', '-o', action="store_true", help='Overwrite previous export tar archive')

We're not writing out a tar archive so this should be "Overwrite files when
extracting" or similar.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

