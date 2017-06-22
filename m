Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 51EB877E58
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jun 2017 08:48:55 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Jun 2017 01:48:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,372,1493708400"; d="scan'208";a="116122346"
Received: from wbosek-mobl3.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.63.90])
	by orsmga005.jf.intel.com with ESMTP; 22 Jun 2017 01:48:56 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: leonardo.sandoval.gonzalez@linux.intel.com
Date: Thu, 22 Jun 2017 10:48:54 +0200
Message-ID: <1695662.NVEXMjv0Bx@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
In-Reply-To: <193c0163d741ae348260bd83f21358066ba41764.1497983224.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1496423434.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<cover.1497983224.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<193c0163d741ae348260bd83f21358066ba41764.1497983224.git.leonardo.sandoval.gonzalez@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3 3/3] import: new plugin to import the devtool workspace
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
X-List-Received-Date: Thu, 22 Jun 2017 08:48:57 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Leo,

On Tuesday, 20 June 2017 8:30:05 PM CEST leonardo.sandoval.gonzalez@linux.intel.com wrote:
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
>  scripts/lib/devtool/import.py | 142 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 142 insertions(+)
>  create mode 100644 scripts/lib/devtool/import.py
> 
> diff --git a/scripts/lib/devtool/import.py b/scripts/lib/devtool/import.py
> new file mode 100644
> index 0000000000..26084ec3b8
> --- /dev/null
> +++ b/scripts/lib/devtool/import.py
> @@ -0,0 +1,142 @@
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
> +import json
> +import fnmatch
> +
> +from devtool import standard, setup_tinfoil, replace_from_file
> +from devtool import export
> +
> +logger = logging.getLogger('devtool')
> +
> +def devimport(args, config, basepath, workspace):
> +    """Entry point for the devtool 'import' subcommand"""
> +
> +    if not os.path.exists(args.file):
> +        logger.error('Tar archive %s does not exist. Export your workspace using "devtool export"')
> +        return 1
> +
> +
> +    tinfoil = setup_tinfoil(config_only=False, basepath=basepath)

So, when I said move this outside of the try...finally, try still needs to
immediately follow it or there is a chance that an error will occur some
time between tinfoil being created and the try...finally block that calls
shutdown(), with the result that tinfoil will not get shut down properly.


> +
> +    imported = []
> +    tar = tarfile.open(args.file)
> +    members = tar.getmembers()
> +
> +    # get exported metadata so values containing paths can be automatically replaced it
> +    export_workspace_path = export_workspace = None
> +    try:
> +        metadata = tar.getmember(export.metadata)
> +        tar.extract(metadata)
> +        with open(metadata.name) as fdm:
> +            export_workspace_path, export_workspace = json.load(fdm)
> +        os.unlink(metadata.name)
> +    except KeyError as ke:
> +        logger.error('The export metadata file created by "devtool export" was not found')
> +        return 1

I neglected to mention in my previous review that as a matter of best
practice the try...except should span only the calls where you expect 
this particular error to occur (I would assume just tar.getmember()?) 
in case KeyError happens for different reasons.

We should also mention in the message that "devtool import can only be used
to import tar archives created by devtool export", since that is the most
likely reason for receiving this error.


> +    try:
> +        recipe_files = [os.path.basename(recipe[0]) for recipe in tinfoil.cooker.recipecaches[''].pkg_fn.items()]
> +    finally:
> +        if tinfoil:
> +            tinfoil.shutdown()

Why would tinfoil not be assigned here?


> +
> +    for member in members:
> +        # do not export the metadata
> +        if member.name == export.metadata:
> +            continue
> +
> +        is_bbappend = False
> +
> +        # check bbappend has its corresponding recipe, if not warn continue with next tar member
> +        if member.name.startswith('appends'):
> +            is_bbappend = True
> +            append_root,_ = os.path.splitext(os.path.basename(member.name))
> +
> +            # check on new recipes introduced by the export
> +            for exported_recipe in export_workspace.keys():
> +                if append_root.startswith(exported_recipe):
> +                    break
> +            else:
> +                # check on current recipes
> +                for recipe_file in recipe_files:
> +                    if fnmatch.fnmatch(recipe_file, append_root.replace('%', '') + '*'):
> +                        break
> +                else:
> +                    logger.warn('No recipe to append %s, skipping' % append_root)
> +                    continue

Could you also please ensure that the other files associated with this
bbappend (recipe + associated files and sources) don't get imported if the
bbappend doesn't apply? I think we should have the information needed for
that in the workspace object retrieved from the exported metadata.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

