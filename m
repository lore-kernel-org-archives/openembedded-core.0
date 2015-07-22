Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id EEB6773CB9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jul 2015 10:55:12 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 22 Jul 2015 03:55:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,523,1432623600"; d="scan'208";a="733336679"
Received: from gwhaley-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.19.55])
	by orsmga001.jf.intel.com with ESMTP; 22 Jul 2015 03:55:11 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Christopher Larson <kergoth@gmail.com>
Date: Wed, 22 Jul 2015 11:55:10 +0100
Message-ID: <13693490.gf1pOGu3uf@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.0.7-200.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <62a5e84af02b4ed03f1e6a9516c718b98be20689.1437430369.git.chris_larson@mentor.com>
References: <c5e5bbd5f85ed4ae437815656889d328da25e75b.1437430369.git.chris_larson@mentor.com>
	<62a5e84af02b4ed03f1e6a9516c718b98be20689.1437430369.git.chris_larson@mentor.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv2 3/6] recipetool: also load plugins from BBPATH
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
X-List-Received-Date: Wed, 22 Jul 2015 10:55:15 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Chris,

On Monday 20 July 2015 15:15:53 Christopher Larson wrote:
> This makes it easier to extend, as a layer can add its own sub-commands.
> 
> [YOCTO #7625]
> 
> Signed-off-by: Christopher Larson <kergoth@gmail.com>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  scripts/recipetool | 52
> ++++++++++++++++++++++++++++++++-------------------- 1 file changed, 32
> insertions(+), 20 deletions(-)
> 
> diff --git a/scripts/recipetool b/scripts/recipetool
> index 3063cf7..6061d7b 100755
> --- a/scripts/recipetool
> +++ b/scripts/recipetool
> @@ -36,11 +36,8 @@ def tinfoil_init(parserecipes):
>      import logging
>      tinfoil = bb.tinfoil.Tinfoil()
>      tinfoil.prepare(not parserecipes)
> -
> -    for plugin in plugins:
> -        if hasattr(plugin, 'tinfoil_init'):
> -            plugin.tinfoil_init(tinfoil)
>      tinfoil.logger.setLevel(logger.getEffectiveLevel())
> +    return tinfoil
> 
>  def main():
> 
> @@ -49,28 +46,22 @@ def main():
>          sys.exit(1)
> 
>      parser = argparse.ArgumentParser(description="OpenEmbedded recipe
> tool", +                                     add_help=False,
>                                       epilog="Use %(prog)s <subcommand>
> --help to get help on a specific command") parser.add_argument('-d',
> '--debug', help='Enable debug output', action='store_true')
> parser.add_argument('-q', '--quiet', help='Print only errors',
> action='store_true') parser.add_argument('--color', choices=['auto',
> 'always', 'never'], default='auto', help='Colorize output (where
> %(metavar)s is %(choices)s)', metavar='COLOR') -    subparsers =
> parser.add_subparsers(title='subcommands', metavar='<subcommand>') -
> -    scriptutils.load_plugins(logger, plugins, os.path.join(scripts_path,
> 'lib', 'recipetool')) -    registered = False
> -    for plugin in plugins:
> -        if hasattr(plugin, 'register_command'):
> -            registered = True
> -            plugin.register_command(subparsers)
> 
> -    if not registered:
> -        logger.error("No commands registered - missing plugins?")
> -        sys.exit(1)
> +    initial_args, unparsed_args = parser.parse_known_args(sys.argv[1:])
> 
> -    args = parser.parse_args()
> +    # Help is added here rather than via add_help=True, as we don't want it
> to +    # be handled by parse_known_args()
> +    parser.add_argument('-h', '--help', action='help',
> default=argparse.SUPPRESS, +                        help='show this help
> message and exit')
> 
> -    if args.debug:
> +    if initial_args.debug:
>          logger.setLevel(logging.DEBUG)
> -    elif args.quiet:
> +    elif initial_args.quiet:
>          logger.setLevel(logging.ERROR)
> 
>      import scriptpath
> @@ -80,10 +71,31 @@ def main():
>          sys.exit(1)
>      logger.debug('Found bitbake path: %s' % bitbakepath)
> 
> -    scriptutils.logger_setup_color(logger, args.color)
> +    scriptutils.logger_setup_color(logger, initial_args.color)
> +
> +    subparsers = parser.add_subparsers(title='subcommands',
> metavar='<subcommand>') +    tinfoil = tinfoil_init(False)
> +    for path in ([scripts_path] +
> +                 tinfoil.config_data.getVar('BBPATH', True).split(':')):
> +        pluginpath = os.path.join(path, 'lib', 'recipetool')
> +        scriptutils.load_plugins(logger, plugins, pluginpath)
> +    registered = False
> +    for plugin in plugins:
> +        if hasattr(plugin, 'register_command'):
> +            registered = True
> +            plugin.register_command(subparsers)
> +        if hasattr(plugin, 'tinfoil_init'):
> +            plugin.tinfoil_init(tinfoil)
> +
> +    if not registered:
> +        logger.error("No commands registered - missing plugins?")
> +        sys.exit(1)
> +
> +    args = parser.parse_args(unparsed_args, namespace=initial_args)
> 
>      try:
> -        tinfoil_init(getattr(args, 'parserecipes', False))
> +        if getattr(args, 'parserecipes', False):
> +            tinfoil.parseRecipes()
>          ret = args.func(args)
>      except bb.BBHandledException:
>          ret = 1

I must admit it wasn't immediately obvious to me why you'd made some of the 
changes here, although after several reads it does make sense - would you be 
able to add a slightly more detailed commit message explaining the changes? 
(same for the equivalent devtool patch).

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

