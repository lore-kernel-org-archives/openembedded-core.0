Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 4772076FFA
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Sep 2015 21:57:41 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 02 Sep 2015 14:57:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,456,1437462000"; d="scan'208";a="554117085"
Received: from lsandov1-mobl-linux.zpn.intel.com (HELO [10.219.5.40])
	([10.219.5.40])
	by FMSMGA003.fm.intel.com with ESMTP; 02 Sep 2015 14:57:41 -0700
Message-ID: <55E7711F.4060902@linux.intel.com>
Date: Wed, 02 Sep 2015 16:58:55 -0500
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: brendan.le.foll@intel.com, openembedded-core@lists.openembedded.org
References: <1441225376-16832-1-git-send-email-brendan.le.foll@intel.com>
In-Reply-To: <1441225376-16832-1-git-send-email-brendan.le.foll@intel.com>
Subject: Re: [PATCH v2] devtool: add package plugin that lets you create package via devtool
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
X-List-Received-Date: Wed, 02 Sep 2015 21:57:43 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 09/02/2015 03:22 PM, brendan.le.foll@intel.com wrote:
> From: Brendan Le Foll <brendan.le.foll@intel.com>
>
> Signed-off-by: Brendan Le Foll <brendan.le.foll@intel.com>
> ---
>   scripts/lib/devtool/package.py | 62 ++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 62 insertions(+)
>   create mode 100644 scripts/lib/devtool/package.py
>
> diff --git a/scripts/lib/devtool/package.py b/scripts/lib/devtool/package.py
> new file mode 100644
> index 0000000..bbc85b7
> --- /dev/null
> +++ b/scripts/lib/devtool/package.py
> @@ -0,0 +1,62 @@
> +# Development tool - package command plugin
> +#
> +# Copyright (C) 2014-2015 Intel Corporation
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
> +"""Devtool plugin containing the package subcommands"""
> +
> +import os
> +import subprocess
> +import logging
> +from devtool import exec_build_env_command, setup_tinfoil, DevtoolError
> +
> +logger = logging.getLogger('devtool')
> +
> +def plugin_init(pluginlist):
> +    """Plugin initialization"""
> +    pass
> +
> +def package(args, config, basepath, workspace):
> +    """Entry point for the devtool 'package' subcommand"""
> +    import re

just some minor details: the regex library is not being used, so it can 
be removed. Also, the import bb can be moved to the file's head, and 
just include what you need from it

from bb.process import ExecutionError

> +    import bb
> +    if not args.recipename in workspace:
> +        raise DevtoolError("no recipe named %s in your workspace" %
> +                           args.recipename)
> +
> +    try:
> +        image_pkgtype = config.get('image_pkgtype', None)
> +    except:
> +        tinfoil = setup_tinfoil()
> +        try:
> +            tinfoil.prepare(config_only=True)
> +            image_pkgtype = tinfoil.config_data.getVar('IMAGE_PKGTYPE', True)
> +        finally:
> +            tinfoil.shutdown()
> +
> +    package_task = config.get('Package', 'package_task', 'package_write_%s' % image_pkgtype)
> +    try:
> +        exec_build_env_command(config.init_path, basepath, 'bitbake -c %s %s' % (package_task, args.recipename), watch=True)
> +    except bb.process.ExecutionError as e:
> +        # We've already seen the output since watch=True, so just ensure we return something to the user
> +        return e.exitcode
> +    logger.info('Your packages are in %s/tmp/deploy/%s' % (basepath, image_pkgtype))
> +
> +    return 0
> +
> +def register_commands(subparsers, context):
> +    """Register devtool subcommands from the package plugin"""
> +    parser_package = subparsers.add_parser('package', help='Create packages for a recipe', description='Creates packages for a recipe\'s output files')
> +    parser_package.add_argument('recipename', help='Recipe to package')
> +    parser_package.set_defaults(func=package)
>

