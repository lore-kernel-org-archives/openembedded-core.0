Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 8607E77016
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Sep 2015 14:35:55 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 04 Sep 2015 07:35:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,469,1437462000"; d="scan'208";a="797809378"
Received: from maholain-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.13.141])
	by orsmga002.jf.intel.com with ESMTP; 04 Sep 2015 07:35:55 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: brendan.le.foll@intel.com
Date: Fri, 04 Sep 2015 15:35:52 +0100
Message-ID: <3825765.7SQCRtHUUU@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.1.5-100.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <1441318170-2356-1-git-send-email-brendan.le.foll@intel.com>
References: <1441318170-2356-1-git-send-email-brendan.le.foll@intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3] devtool: add package plugin that lets you create package via devtool
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
X-List-Received-Date: Fri, 04 Sep 2015 14:35:58 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 03 September 2015 23:09:30 brendan.le.foll@intel.com wrote:
> From: Brendan Le Foll <brendan.le.foll@intel.com>
> 
> Signed-off-by: Brendan Le Foll <brendan.le.foll@intel.com>
> ---
>  scripts/lib/devtool/package.py | 61
> ++++++++++++++++++++++++++++++++++++++++++ 1 file changed, 61 insertions(+)
>  create mode 100644 scripts/lib/devtool/package.py
> 
> diff --git a/scripts/lib/devtool/package.py b/scripts/lib/devtool/package.py
> new file mode 100644
> index 0000000..e9d4240
> --- /dev/null
> +++ b/scripts/lib/devtool/package.py
> @@ -0,0 +1,61 @@
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
> +from bb.process import ExecutionError
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
> +    if not args.recipename in workspace:
> +        raise DevtoolError("no recipe named %s in your workspace" %
> +                           args.recipename)
> +
> +    try:
> +        image_pkgtype = config.get('image_pkgtype', None)

This isn't quite right - to be fair though I think you may have copy-pasted 
something I sent you privately which wasn't correct. The first parameter is the 
section, second the value name, third the default. If you specify a default 
you won't need to put it in try/except, just "if not image_pkgtype:'.

Don't worry about fixing this though, I'm currently rolling up devtool patches 
into a series and I will fix it as part of that.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

