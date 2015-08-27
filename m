Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 885DC73E11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Aug 2015 14:19:16 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 27 Aug 2015 07:19:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,422,1437462000"; d="scan'208";a="792034458"
Received: from djcarton-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.20.50])
	by orsmga002.jf.intel.com with ESMTP; 27 Aug 2015 07:19:02 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: brendan.le.foll@intel.com
Date: Thu, 27 Aug 2015 15:19:01 +0100
Message-ID: <2387622.aXAosN14aV@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.1.5-100.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <1440002007-9895-1-git-send-email-brendan.le.foll@intel.com>
References: <1440002007-9895-1-git-send-email-brendan.le.foll@intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] devtool: add package plugin that lets you create package via devtool
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
X-List-Received-Date: Thu, 27 Aug 2015 14:19:17 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Brendan,

On Wednesday 19 August 2015 17:33:27 brendan.le.foll@intel.com wrote:
> From: Brendan Le Foll <brendan.le.foll@intel.com>
> 
> Signed-off-by: Brendan Le Foll <brendan.le.foll@intel.com>
> ---
>  scripts/lib/devtool/package.py | 63
> ++++++++++++++++++++++++++++++++++++++++++ 1 file changed, 63 insertions(+)
>  create mode 100644 scripts/lib/devtool/package.py
> 
> diff --git a/scripts/lib/devtool/package.py b/scripts/lib/devtool/package.py
> new file mode 100644
> index 0000000..18b9eb0
> --- /dev/null
> +++ b/scripts/lib/devtool/package.py
> @@ -0,0 +1,63 @@
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
> +    import bb
> +    if not args.recipename in workspace:
> +        raise DevtoolError("no recipe named %s in your workspace" %
> +                           args.recipename)
> +
> +    try:
> +        image_pkgtype = exec_build_env_command(config.init_path, basepath,
> 'bitbake -e %s | grep IMAGE_PKGTYPE' % (args.recipename), watch=False) +   
> except bb.process.ExecutionError as e:
> +        logger.error('Unable to get IMAGE_PKGTYPE for image')
> +        return e.exitcode
> +
> +    image_pkgtype = str(image_pkgtype).split('=', 1)[1].split('"', 2)[1]
> +    if image_pkgtype not in ("rpm", "ipk", "tar", "deb"):
> +        logger.error('Invalid package format (%s) found' % image_pkgtype)
> +        return 1

Instead of this, how about:

    tinfoil = setup_tinfoil()
    try:
        tinfoil.prepare(config_only=True)
        image_pkgtype = tinfoil.config_data.getVar('IMAGE_PKGTYPE', True)
    finally:
        tinfoil.shutdown()

> +    package_task = config.get('Package', 'package_task', 'package_write_%s'
> % image_pkgtype) 

Hmm, shouldn't the config be for image_pkgtype rather than this? (Since even if 
this is set we'd still be using the IMAGE_PKGTYPE value for the directory path 
in the message later on).

> +    try:
> +        exec_build_env_command(config.init_path, basepath, 'bitbake -c %s
> %s' % (package_task, args.recipename), watch=True) 
> +    except
> bb.process.ExecutionError as e:
> +        # We've already seen the output since watch=True, so just ensure we
> return something to the user
> +        return e.exitcode
> +    logger.info('Your packages are in %s/tmp/deploy/%s' % (basepath,
> image_pkgtype))
> +
> +    return 0
> +
> +def register_commands(subparsers, context):
> +    """Register devtool subcommands from the package plugin"""
> +    parser_package = subparsers.add_parser('package', help='Package a
> recipe output files')

I would suggest:

help='Create packages for a recipe',
description='Creates packages for a recipe\'s output files'

> +    parser_package.add_argument('recipename',> help='Recipe to package') 
> +    parser_package.set_defaults(func=package)

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

