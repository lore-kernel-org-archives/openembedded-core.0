Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 6384C7D1E0
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Apr 2019 23:03:32 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Apr 2019 16:03:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,298,1549958400"; d="scan'208";a="127787402"
Received: from nshahrol-mobl.gar.corp.intel.com (HELO localhost.localdomain)
	([10.255.144.90])
	by orsmga007.jf.intel.com with ESMTP; 01 Apr 2019 16:03:30 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
Date: Tue, 02 Apr 2019 12:03:28 +1300
Message-ID: <2108725.gmVYfyJu8H@localhost.localdomain>
Organization: Intel Corporation
In-Reply-To: <1553799321-17585-4-git-send-email-chandana.kalluri@xilinx.com>
References: <1553799321-17585-1-git-send-email-chandana.kalluri@xilinx.com>
	<1553799321-17585-4-git-send-email-chandana.kalluri@xilinx.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [master][PATCH v3 3/3] devtool: provide support for devtool menuconfig command
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
X-List-Received-Date: Mon, 01 Apr 2019 23:03:32 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday, 29 March 2019 7:55:21 AM NZDT Sai Hari Chandana Kalluri wrote:
> +      pn =  rd.getVar('PN', True)
> +      if pn not in workspace:
> +         raise DevtoolError("Run devtool modify before calling menuconfig for %s" %pn)

Did you see my earlier comment re check_workspace_recipe() ?


> +      if not rd.getVarFlag('do_menuconfig','task'):
> +         raise DevtoolError("This package does not support menuconfig option")

package -> recipe


> +      workspace_dir = os.path.join(basepath,'workspace/sources')
> +      kconfigpath = rd.getVar('B')
> +      pn_src = os.path.join(workspace_dir,pn)
> +
> +      #add check to see if oe_local_files exists or not
> +      localfilesdir = os.path.join(pn_src,'oe-local-files') 
> +      if not os.path.exists(localfilesdir):
> +          bb.utils.mkdirhier(localfilesdir)
> +          #Add gitignore to ensure source tree is clean
> +          gitignorefile = os.path.join(localfilesdir,'.gitignore')
> +          with open(gitignorefile, 'w') as f:
> +                  f.write('# Ignore local files, by default. Remove this file if you want to commit the directory to Git\n')
> +                  f.write('*\n')

I didn't reply to your earlier question on this, sorry about that, but I think this is OK.


> +def register_commands(subparsers, context):
> +    """register devtool subcommands from this plugin"""
> +    parser_menuconfig = subparsers.add_parser('menuconfig',help='Alter build-time configuration for a recipe', description='Launches the make menuconfig command(for recipes where do_menuconfig is available), allowing users to make changes to the build-time configuration. Creates a config fragment corresponding to changes made.', group='advanced') 

There's a missing space before the '(' in "command(for recipes".


Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre



