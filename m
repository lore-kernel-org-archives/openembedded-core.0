Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id 176AC7C82B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Mar 2019 23:46:18 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Mar 2019 15:46:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,441,1544515200"; d="scan'208";a="139111965"
Received: from sdhavala-mobl.gar.corp.intel.com (HELO localhost.localdomain)
	([10.249.73.52])
	by orsmga002.jf.intel.com with ESMTP; 04 Mar 2019 15:46:16 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
Date: Tue, 05 Mar 2019 12:46:12 +1300
Message-ID: <1832894.xLyTEtpz5K@localhost.localdomain>
Organization: Intel Corporation
In-Reply-To: <1548445982-25182-4-git-send-email-chandana.kalluri@xilinx.com>
References: <1548445982-25182-1-git-send-email-chandana.kalluri@xilinx.com>
	<1548445982-25182-4-git-send-email-chandana.kalluri@xilinx.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 3/3] devtool: provide support for devtool menuconfig command.
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
X-List-Received-Date: Mon, 04 Mar 2019 23:46:18 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Saturday, 26 January 2019 8:53:02 AM NZDT Sai Hari Chandana Kalluri wrote:
> +def menuconfig(args, config, basepath, workspace):
> +    """Entry point for the devtool 'menuconfig' subcommand"""
> +
> +    rd = "" 
> +    kconfigpath = ""
> +    pn_src = ""
> +    localfilesdir = ""
> +    workspace_dir = ""
> +    tinfoil = setup_tinfoil(basepath=basepath)
> +    try:
> +      rd = parse_recipe(config, tinfoil, args.component, appends=True, filter_workspace=False)
> +      if not rd:
> +         return 1
> +
> +      pn =  rd.getVar('PN', True)
> +      if pn not in workspace:
> +         raise DevtoolError("Run devtool modify before calling menuconfig for %s" %pn)

Strictly speaking we have check_workspace_recipe() for this. It could be that we should extend the message printed by that to be a bit more friendly and suggest devtool add/modify/upgrade first, but I'd like to be consistent.

>...
> +      #add check to see if oe_local_files exists or not
> +      localfilesdir = os.path.join(pn_src,'oe-local-files') 
> +      if not os.path.exists(localfilesdir):
> +          bb.utils.mkdirhier(localfilesdir)
> +          #Add gitignore to ensure source tree is clean
> +          gitignorefile = os.path.join(localfilesdir,'.gitignore')
> +          with open(gitignorefile, 'w') as f:
> +                  f.write('# Ignore local files, by default. Remove this file if you want to commit the directory to Git\n')
> +                  f.write('*\n')

We should already be handling this in devtool-source.bbclass, but I'm guessing the hardlinking you're adding bypasses that, so we likely need to handle that separately during devtool modify rather than here (preferably without duplicating code).

> +    parser_menuconfig = subparsers.add_parser('menuconfig',help='allows altering the system component configuration', description='launches the make menuconfig command, allows user to make changes to configuration. creates a config fragment', group='advanced') 
> +    parser_menuconfig.add_argument('component', help='compenent to alter config')

To be consistent with other subcommands and a bit more readable this should be something like:

    parser_menuconfig = subparsers.add_parser('menuconfig', help='Alter build-time configuration for a recipe', description='Launches the "make menuconfig" command (for recipes where do_menuconfig is available), allowing you to make changes to the build-time configuration. Creates a config fragment corresponding to changes made.', group='advanced') 
    parser_menuconfig.add_argument('recipename', help='Recipe to reconfigure')

Additionally, I would really like to see some oe-selftest tests for this along with the changes.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre



