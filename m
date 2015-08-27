Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 6D79260043
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Aug 2015 14:07:40 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 27 Aug 2015 07:07:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,422,1437462000"; d="scan'208";a="756520255"
Received: from djcarton-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.20.50])
	by orsmga001.jf.intel.com with ESMTP; 27 Aug 2015 07:07:38 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Date: Thu, 27 Aug 2015 15:07:37 +0100
Message-ID: <1660246.aMBvaTP1ud@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.1.5-100.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <8135f1072d47196f517a9c0e776e2e4a01bae2ec.1440401351.git.ed.bartosh@linux.intel.com>
References: <833fcc1026046c895ab51fdeb58ec9b24a7516ca.1440401351.git.ed.bartosh@linux.intel.com>
	<8135f1072d47196f517a9c0e776e2e4a01bae2ec.1440401351.git.ed.bartosh@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] devtool: implement build-image plugin
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
X-List-Received-Date: Thu, 27 Aug 2015 14:07:41 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Ed,

On Monday 24 August 2015 10:33:31 Ed Bartosh wrote:
> Implemented new plugin to build image from workspace packages.
> 
> Plugin creates <image>.bbappend file, adds
> all workspace packages to the image using IMAGE_INSTALL_append
> variable in bbappend file. After that it runs 'bitbake <image>'.
> 
> Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
> ---
>  scripts/lib/devtool/build-image.py | 56
> ++++++++++++++++++++++++++++++++++++++ 1 file changed, 56 insertions(+)
>  create mode 100644 scripts/lib/devtool/build-image.py
> 
> diff --git a/scripts/lib/devtool/build-image.py
> b/scripts/lib/devtool/build-image.py new file mode 100644
> index 0000000..d8e7b12
> --- /dev/null
> +++ b/scripts/lib/devtool/build-image.py
> @@ -0,0 +1,56 @@
> +# Development tool - build-image plugin
> +#
> +# Copyright (C) 2015 Intel Corporation
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
> +"""Devtool plugin containing the build-image subcommand."""
> +
> +import os
> +import logging
> +
> +from bb.process import ExecutionError
> +from devtool import exec_build_env_command, add_md5
> +
> +LOG = logging.getLogger('devtool')

I recall you mentioning pylint had a problem with "logger" - we're using that 
throughout the devtool code (and elsewhere). "LOG" just looks a bit weird. 
What is it complaining about specifically?

> +def plugin_init(pluginlist):
> +    """Plugin initialization"""
> +    pass
> +
> +def build_image(args, config, basepath, workspace):
> +    """Entry point for the devtool 'build-image' subcommand."""
> +    image = args.recipe
> +    appendfile = os.path.join(config.workspace_path, 'appends',
> +                              '%s.bbappend' % image)
> +    with open(appendfile, 'w') as afile:
> +        afile.write('IMAGE_INSTALL_append = " %s"\n' % \
> +                    ' '.join(workspace.keys()))

Some notes here:

1) Recipes that aren't for the target somehow need to be filtered out (e.g. 
native recipes). I'd imagine the way to do that would be to parse each one and 
check if "class-target" is in d.getVar('OVERRIDES', True).split(':').

2) We're making a direct mapping between recipe name and main package for the 
recipe. That'll work for most recipes but there will be some where that's not 
valid. I'm tempted to say that since we're parsing the recipe anyway, for now 
we should do a quick check of PACKAGES to ensure we're not adding something 
that'll cause the build to fail.

3) It would be nice to add an option to add all the packages in PACKAGES for 
each recipe to the image; and a separate option to just add the non-dev/-dbg/-
staticdev packages. Perhaps we should leave this as a future enhancement 
though.

4) If there's no target recipes in the workspace then print something like "No 
recipes in workspace, building image <image> unmodified". On the other hand if  
there are we should report "Building image <image> with the following 
additional packages: <packagelist>'

5) If there are recipes can you add the following so that the build system 
prints something every time the image recipe gets built:

do_rootfs[prefuncs] += "devtool_warn_image_extended"
python devtool_warn_image_extended() {
    bb.plain('NOTE: %s: building with additional packages due to "devtool 
build-image", delete /path/to/bbappend to clear this' % d.getVar('PN', True))
}

> +    add_md5(config, image, appendfile)

This isn't actually doing much if we can't use "devtool reset" is it? (Since 
the recipe isn't officially in the workspace; we could make it so, but then we'd 
need to ensure the other commands either behave themselves or error out as 
appropriate if called with an image recipe that's in the workspace.)

> +    try:
> +        exec_build_env_command(config.init_path, basepath,
> +                               'bitbake %s' % image, watch=True)
> +    except ExecutionError as err:
> +        return err.exitcode
> +
> +    LOG.info('Successfully built %s', image)
> +
> +def register_commands(subparsers, context):
> +    """Register devtool subcommands from the build-image plugin"""
> +    parser_package = subparsers.add_parser('build-image', help='Build
> image') 
> +    parser_package.add_argument('recipe', help='Image recipe to
> build') 
> +    parser_package.set_defaults(func=build_image)
> +

Can you please change help for the command to 'Build image including workspace 
recipe packages' and add description='Builds an image, extending it to include 
packages from recipes in the workspace'.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

