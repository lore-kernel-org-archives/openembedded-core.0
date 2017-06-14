Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 56E1178379
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jun 2017 17:24:46 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Jun 2017 10:24:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,341,1493708400"; d="scan'208";a="99493138"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.119])
	by orsmga002.jf.intel.com with ESMTP; 14 Jun 2017 10:24:46 -0700
Message-ID: <1497461625.29576.8.camel@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: Tobias Hagelborn <tobias.hagelborn@axis.com>
Date: Wed, 14 Jun 2017 12:33:45 -0500
In-Reply-To: <1497421480-21923-1-git-send-email-tobiasha@axis.com>
References: <1497421480-21923-1-git-send-email-tobiasha@axis.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: Tobias Hagelborn <tobiasha@axis.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] devtool: deploy-target: Support stripped libs and execs
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
X-List-Received-Date: Wed, 14 Jun 2017 17:24:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit


>  
>  def register_commands(subparsers, context):
>      """Register devtool subcommands from the deploy plugin"""
> +
>      parser_deploy = subparsers.add_parser('deploy-target',
>                                            help='Deploy recipe output files to live target machine',
>                                            description='Deploys a recipe\'s build output (i.e. the output of the do_install task) to a live target machine over ssh. By default, any existing files will be preserved instead of being overwritten and will be restored if you run devtool undeploy-target. Note: this only deploys the recipe itself and not any runtime dependencies, so it is assumed that those have been installed on the target beforehand.',
> @@ -313,6 +433,12 @@ def register_commands(subparsers, context):
>      parser_deploy.add_argument('-p', '--no-preserve', help='Do not preserve existing files', action='store_true')
>      parser_deploy.add_argument('--no-check-space', help='Do not check for available space before deploying', action='store_true')
>      parser_deploy.add_argument('-P', '--port', default='22', help='Port to use for connection to the target')
> +    parser_deploy.add_argument('-S', '--strip',
> +                               help='Strip executables prior to deploying (default: %(default)s). '
> +                                    'The default value of this option can be controlled by setting the strip option in the [Deploy] section to True or False.',
> +                               default=oe.types.boolean(context.config.get('Deploy', 'strip', default='0')),
> +                               action='store_true')
> +    parser_deploy.add_argument('--no-strip', help='Do not strip executables prior to deploy', dest='strip', action='store_false')
>      parser_deploy.set_defaults(func=deploy)


sounds like these two new parameters mutual exclude, so something like
this may be useful

https://docs.python.org/3/library/argparse.html#mutual-exclusion

>  
>      parser_undeploy = subparsers.add_parser('undeploy-target',
> -- 
> 2.1.4
> 



