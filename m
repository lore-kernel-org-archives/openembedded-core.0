Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2BCE3761E5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 06:58:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t6T6wf4C013379
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 28 Jul 2015 23:58:41 -0700 (PDT)
Received: from [128.224.162.211] (128.224.162.211) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.235.1;
	Tue, 28 Jul 2015 23:58:23 -0700
Message-ID: <55B8799D.3050600@windriver.com>
Date: Wed, 29 Jul 2015 14:58:37 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Christopher Larson <kergoth@gmail.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1436889188.git.chris_larson@mentor.com>
	<34337e7400db6002b7d708a32609e2731d908a1f.1436889188.git.chris_larson@mentor.com>
In-Reply-To: <34337e7400db6002b7d708a32609e2731d908a1f.1436889188.git.chris_larson@mentor.com>
X-Originating-IP: [128.224.162.211]
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Christopher Larson <chris_larson@mentor.com>
Subject: Re: [PATCH 4/6] devtool: also load plugins from BBPATH
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
X-List-Received-Date: Wed, 29 Jul 2015 06:58:43 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Christopher,

I suspect this patch is causing failure for 'populate_sdk_ext' task.
Could you please take a look at it?

See error message below.

Best Regards,
Chen Qi

=======================

ERROR: Error executing a python function in 
/buildarea2/chenqi/poky/meta/recipes-core/images/core-image-minimal.bb:

The stack trace of python calls that resulted in this exception/failure was:
File: 'copy_buildsystem', lineno: 127, function: <module>
      0123:    with open(baseoutpath + '/conf/work-config.inc', 'w') as f:
      0124:        pass
      0125:
      0126:
  *** 0127:copy_buildsystem(d)
      0128:
File: 'copy_buildsystem', lineno: 53, function: copy_buildsystem
      0049:    with open(os.path.join(baseoutpath, 'conf', 
'devtool.conf'), 'w') as f:
      0050:        config.write(f)
      0051:
      0052:    # Create a layer for new recipes / appends
  *** 0053:    bb.process.run("devtool --basepath %s create-workspace 
--create-only %s" % (baseoutpath, os.path.join(baseoutpath, 'workspace')))
      0054:
      0055:    # Create bblayers.conf
      0056:    bb.utils.mkdirhier(baseoutpath + '/conf')
      0057:    with open(baseoutpath + '/conf/bblayers.conf', 'w') as f:
File: '/buildarea2/chenqi/poky/bitbake/lib/bb/process.py', lineno: 152, 
function: run
      0148:    else:
      0149:        stdout, stderr = pipe.communicate(input)
      0150:
      0151:    if pipe.returncode != 0:
  *** 0152:        raise ExecutionError(cmd, pipe.returncode, stdout, 
stderr)
      0153:    return stdout, stderr
Exception: ExecutionError: Execution of 'devtool --basepath 
/buildarea2/chenqi/poky/build-systemd/tmp-2/work/qemuarm-poky-linux-gnueabi/core-image-minimal/1.0-r0/sdk-ext/image//opt/poky/1.8+snapshot 
create-workspace --create-only 
/buildarea2/chenqi/poky/build-systemd/tmp-2/work/qemuarm-poky-linux-gnueabi/core-image-minimal/1.0-r0/sdk-ext/image//opt/poky/1.8+snapshot/workspace' 
failed with exit code 1:
ERROR: Only one copy of bitbake should be run against a build directory
Traceback (most recent call last):
   File "/buildarea2/chenqi/poky/scripts/devtool", line 281, in <module>
     ret = main()
   File "/buildarea2/chenqi/poky/scripts/devtool", line 242, in main
     tinfoil = setup_tinfoil(config_only=True)
   File "/buildarea2/chenqi/poky/scripts/lib/devtool/__init__.py", line 
108, in setup_tinfoil
     tinfoil = bb.tinfoil.Tinfoil()
   File 
"/buildarea2/chenqi/poky/build-systemd/tmp-2/work/qemuarm-poky-linux-gnueabi/core-image-minimal/1.0-r0/sdk-ext/image//opt/poky/1.8+snapshot/layers/poky/bitbake/lib/bb/tinfoil.py", 
line 54, in __init__
     self.cooker = BBCooker(self.config, features)
   File 
"/buildarea2/chenqi/poky/build-systemd/tmp-2/work/qemuarm-poky-linux-gnueabi/core-image-minimal/1.0-r0/sdk-ext/image//opt/poky/1.8+snapshot/layers/poky/bitbake/lib/bb/cooker.py", 
line 155, in __init__
     bb.fatal("Only one copy of bitbake should be run against a build 
directory")
BBHandledException


ERROR: Function failed: copy_buildsystem
ERROR: Logfile of failure stored in: 
/buildarea2/chenqi/poky/build-systemd/tmp-2/work/qemuarm-poky-linux-gnueabi/core-image-minimal/1.0-r0/temp/log.do_populate_sdk_ext.3616
ERROR: Task 12 
(/buildarea2/chenqi/poky/meta/recipes-core/images/core-image-minimal.bb, 
do_populate_sdk_ext) failed with exit code '1'




On 07/14/2015 11:57 PM, Christopher Larson wrote:
> From: Christopher Larson <chris_larson@mentor.com>
>
> This makes it easier to extend, as a layer can add its own sub-commands.
>
> tinfoil is now passed into the commands, as we needed to parse the
> configuration metadata to get BBPATH, and we don't want to construct tinfoil
> more than once, otherwise we have to deal with startup and shutdown of cooker.
>
> [YOCTO #7625]
>
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> ---
>   scripts/devtool                 | 57 +++++++++++++++++++++++++----------------
>   scripts/lib/devtool/__init__.py |  4 +--
>   scripts/lib/devtool/deploy.py   |  6 ++---
>   scripts/lib/devtool/standard.py | 15 +++++------
>   4 files changed, 46 insertions(+), 36 deletions(-)
>
> diff --git a/scripts/devtool b/scripts/devtool
> index fa799f6..01bb412 100755
> --- a/scripts/devtool
> +++ b/scripts/devtool
> @@ -35,7 +35,7 @@ context = None
>   scripts_path = os.path.dirname(os.path.realpath(__file__))
>   lib_path = scripts_path + '/lib'
>   sys.path = sys.path + [lib_path]
> -from devtool import DevtoolError
> +from devtool import DevtoolError, setup_tinfoil
>   import scriptutils
>   logger = scriptutils.logger_create('devtool')
>   
> @@ -186,37 +186,28 @@ def main():
>           pth = os.path.dirname(pth)
>   
>       parser = argparse.ArgumentParser(description="OpenEmbedded development tool",
> +                                     add_help=False,
>                                        epilog="Use %(prog)s <subcommand> --help to get help on a specific command")
>       parser.add_argument('--basepath', help='Base directory of SDK / build directory')
>       parser.add_argument('-d', '--debug', help='Enable debug output', action='store_true')
>       parser.add_argument('-q', '--quiet', help='Print only errors', action='store_true')
>       parser.add_argument('--color', choices=['auto', 'always', 'never'], default='auto', help='Colorize output (where %(metavar)s is %(choices)s)', metavar='COLOR')
>   
> -    subparsers = parser.add_subparsers(dest="subparser_name", title='subcommands', metavar='<subcommand>')
> +    initial_args, unparsed_args = parser.parse_known_args()
>   
> -    if not context.fixed_setup:
> -        parser_create_workspace = subparsers.add_parser('create-workspace',
> -                                                        help='Set up a workspace',
> -                                                        description='Sets up a new workspace. NOTE: other devtool subcommands will create a workspace automatically as needed, so you only need to use %(prog)s if you want to specify where the workspace should be located.')
> -        parser_create_workspace.add_argument('layerpath', nargs='?', help='Path in which the workspace layer should be created')
> -        parser_create_workspace.add_argument('--create-only', action="store_true", help='Only create the workspace layer, do not alter configuration')
> -        parser_create_workspace.set_defaults(func=create_workspace)
> +    # Help is added here rather than via add_help=True, as we don't want it to
> +    # be handled by parse_known_args()
> +    parser.add_argument('-h', '--help', action='help', default=argparse.SUPPRESS,
> +                        help='show this help message and exit')
>   
> -    scriptutils.load_plugins(logger, plugins, os.path.join(scripts_path, 'lib', 'devtool'))
> -    for plugin in plugins:
> -        if hasattr(plugin, 'register_commands'):
> -            plugin.register_commands(subparsers, context)
> -
> -    args = parser.parse_args()
> -
> -    if args.debug:
> +    if initial_args.debug:
>           logger.setLevel(logging.DEBUG)
> -    elif args.quiet:
> +    elif initial_args.quiet:
>           logger.setLevel(logging.ERROR)
>   
> -    if args.basepath:
> +    if initial_args.basepath:
>           # Override
> -        basepath = args.basepath
> +        basepath = initial_args.basepath
>       elif not context.fixed_setup:
>           basepath = os.environ.get('BUILDDIR')
>           if not basepath:
> @@ -246,13 +237,35 @@ def main():
>           logger.debug('Using standard bitbake path %s' % bitbakepath)
>           scriptpath.add_oe_lib_path()
>   
> -    scriptutils.logger_setup_color(logger, args.color)
> +    scriptutils.logger_setup_color(logger, initial_args.color)
> +
> +    tinfoil = setup_tinfoil(config_only=True)
> +    for path in ([scripts_path] +
> +                 tinfoil.config_data.getVar('BBPATH', True).split(':')):
> +        pluginpath = os.path.join(path, 'lib', 'devtool')
> +        scriptutils.load_plugins(logger, plugins, pluginpath)
> +
> +    subparsers = parser.add_subparsers(dest="subparser_name", title='subcommands', metavar='<subcommand>')
> +
> +    if not context.fixed_setup:
> +        parser_create_workspace = subparsers.add_parser('create-workspace',
> +                                                        help='Set up a workspace',
> +                                                        description='Sets up a new workspace. NOTE: other devtool subcommands will create a workspace automatically as needed, so you only need to use %(prog)s if you want to specify where the workspace should be located.')
> +        parser_create_workspace.add_argument('layerpath', nargs='?', help='Path in which the workspace layer should be created')
> +        parser_create_workspace.add_argument('--create-only', action="store_true", help='Only create the workspace layer, do not alter configuration')
> +        parser_create_workspace.set_defaults(func=create_workspace)
> +
> +    for plugin in plugins:
> +        if hasattr(plugin, 'register_commands'):
> +            plugin.register_commands(subparsers, context)
> +
> +    args = parser.parse_args(unparsed_args, namespace=initial_args)
>   
>       if args.subparser_name != 'create-workspace':
>           read_workspace()
>   
>       try:
> -        ret = args.func(args, config, basepath, workspace)
> +        ret = args.func(args, config, basepath, workspace, tinfoil)
>       except DevtoolError as err:
>           if str(err):
>               logger.error(str(err))
> diff --git a/scripts/lib/devtool/__init__.py b/scripts/lib/devtool/__init__.py
> index 61b810c..b54ddf5 100644
> --- a/scripts/lib/devtool/__init__.py
> +++ b/scripts/lib/devtool/__init__.py
> @@ -96,7 +96,7 @@ def exec_fakeroot(d, cmd, **kwargs):
>               newenv[splitval[0]] = splitval[1]
>       return subprocess.call("%s %s" % (fakerootcmd, cmd), env=newenv, **kwargs)
>   
> -def setup_tinfoil():
> +def setup_tinfoil(config_only=False):
>       """Initialize tinfoil api from bitbake"""
>       import scriptpath
>       bitbakepath = scriptpath.add_bitbake_lib_path()
> @@ -106,7 +106,7 @@ def setup_tinfoil():
>   
>       import bb.tinfoil
>       tinfoil = bb.tinfoil.Tinfoil()
> -    tinfoil.prepare(False)
> +    tinfoil.prepare(config_only)
>       tinfoil.logger.setLevel(logger.getEffectiveLevel())
>       return tinfoil
>   
> diff --git a/scripts/lib/devtool/deploy.py b/scripts/lib/devtool/deploy.py
> index 448db96..3bc59de 100644
> --- a/scripts/lib/devtool/deploy.py
> +++ b/scripts/lib/devtool/deploy.py
> @@ -28,7 +28,7 @@ def plugin_init(pluginlist):
>       pass
>   
>   
> -def deploy(args, config, basepath, workspace):
> +def deploy(args, config, basepath, workspace, tinfoil):
>       """Entry point for the devtool 'deploy' subcommand"""
>       import re
>       import oe.recipeutils
> @@ -46,7 +46,7 @@ def deploy(args, config, basepath, workspace):
>       deploy_dir = os.path.join(basepath, 'target_deploy', args.target)
>       deploy_file = os.path.join(deploy_dir, args.recipename + '.list')
>   
> -    tinfoil = setup_tinfoil()
> +    tinfoil.parseRecipes()
>       try:
>           rd = oe.recipeutils.parse_recipe_simple(tinfoil.cooker, args.recipename, tinfoil.config_data)
>       except Exception as e:
> @@ -100,7 +100,7 @@ def deploy(args, config, basepath, workspace):
>   
>       return 0
>   
> -def undeploy(args, config, basepath, workspace):
> +def undeploy(args, config, basepath, workspace, tinfoil):
>       """Entry point for the devtool 'undeploy' subcommand"""
>       deploy_file = os.path.join(basepath, 'target_deploy', args.target, args.recipename + '.list')
>       if not os.path.exists(deploy_file):
> diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
> index ea21877..8fe32b7 100644
> --- a/scripts/lib/devtool/standard.py
> +++ b/scripts/lib/devtool/standard.py
> @@ -193,12 +193,11 @@ def _ls_tree(directory):
>       return ret
>   
>   
> -def extract(args, config, basepath, workspace):
> +def extract(args, config, basepath, workspace, tinfoil):
>       """Entry point for the devtool 'extract' subcommand"""
>       import bb
>   
> -    tinfoil = setup_tinfoil()
> -
> +    tinfoil.parseRecipes()
>       rd = _parse_recipe(config, tinfoil, args.recipename, True)
>       if not rd:
>           return 1
> @@ -409,7 +408,7 @@ def _check_preserve(config, recipename):
>                       tf.write(line)
>       os.rename(newfile, origfile)
>   
> -def modify(args, config, basepath, workspace):
> +def modify(args, config, basepath, workspace, tinfoil):
>       """Entry point for the devtool 'modify' subcommand"""
>       import bb
>       import oe.recipeutils
> @@ -423,8 +422,7 @@ def modify(args, config, basepath, workspace):
>                              "(specify -x to extract source from recipe)" %
>                              args.srctree)
>   
> -    tinfoil = setup_tinfoil()
> -
> +    tinfoil.parseRecipes()
>       rd = _parse_recipe(config, tinfoil, args.recipename, True)
>       if not rd:
>           return 1
> @@ -747,7 +745,7 @@ def _update_recipe_patch(args, config, srctree, rd, config_data):
>   
>       _remove_patch_files(args, removepatches, destpath)
>   
> -def update_recipe(args, config, basepath, workspace):
> +def update_recipe(args, config, basepath, workspace, tinfoil):
>       """Entry point for the devtool 'update-recipe' subcommand"""
>       if not args.recipename in workspace:
>           raise DevtoolError("no recipe named %s in your workspace" %
> @@ -761,8 +759,7 @@ def update_recipe(args, config, basepath, workspace):
>               raise DevtoolError('conf/layer.conf not found in bbappend '
>                                  'destination layer "%s"' % args.append)
>   
> -    tinfoil = setup_tinfoil()
> -
> +    tinfoil.parseRecipes()
>       rd = _parse_recipe(config, tinfoil, args.recipename, True)
>       if not rd:
>           return 1


