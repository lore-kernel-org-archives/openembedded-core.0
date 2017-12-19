Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id EED757826C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Dec 2017 11:50:09 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Dec 2017 03:50:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,426,1508828400"; 
   d="scan'208";a="3918867"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga007.jf.intel.com with ESMTP; 19 Dec 2017 03:50:10 -0800
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id 610DD580329;
	Tue, 19 Dec 2017 03:50:09 -0800 (PST)
Date: Tue, 19 Dec 2017 12:35:28 +0200
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: anelliot <amber.n.elliot@intel.com>
Message-ID: <20171219103527.osi2fyo5jvbaxn7k@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <cover.1512998169.git.amber.n.elliot@intel.com>
	<c6a6c554db99af9ad15d2ae796c759114b6f57dc.1512998169.git.amber.n.elliot@intel.com>
MIME-Version: 1.0
In-Reply-To: <c6a6c554db99af9ad15d2ae796c759114b6f57dc.1512998169.git.amber.n.elliot@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: NeoMutt/20170421 (1.8.2)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] wic: argparse now used for help functionality.
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
X-List-Received-Date: Tue, 19 Dec 2017 11:50:10 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Dec 12, 2017 at 03:54:04AM -0800, anelliot wrote:
> The wic help output formally consisted of manually created strings mixed with argparse,
> which wasunformatted and unusable. This fix cleans up the help messages, rewrites help
> functionality to use argparse, and adds functionality to show information for
> plugins (similar to canned images).
> 
> Fixes [YOCTO #12205]
> 

Thank you for the patch!

Can you rebase it on top of recent master? It looks like it conflicts
with the latest changes.

It would be great to cover this functionality with the tests. There are
some related test cases in meta/lib/oeqa/selftest/cases/wic.py. Please,
make sure they pass and add new cases if needed.


> Signed-off-by: anelliot <amber.n.elliot@intel.com>
> ---
>  scripts/lib/wic/engine.py |   87 +++-
>  scripts/lib/wic/help.py   | 1072 +++++----------------------------------------
>  scripts/wic               |  169 +++----
>  3 files changed, 243 insertions(+), 1085 deletions(-)
> 
> diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
> index edcfab3..5d1e1d8 100644
> --- a/scripts/lib/wic/engine.py
> +++ b/scripts/lib/wic/engine.py
> @@ -58,6 +58,8 @@ def verify_build_env():
>  
>  CANNED_IMAGE_DIR = "lib/wic/canned-wks" # relative to scripts
>  SCRIPTS_CANNED_IMAGE_DIR = "scripts/" + CANNED_IMAGE_DIR
> +SOURCE_PLUGIN_DIR = "lib/wic/plugins/source"
> +SCRIPTS_SOURCE_PLUGIN_DIR = "scripts/" + SOURCE_PLUGIN_DIR
>  WIC_DIR = "wic"
>  
>  def build_canned_image_list(path):
> @@ -76,6 +78,23 @@ def build_canned_image_list(path):
>  
>      return canned_wks_layer_dirs
>  
> +def build_source_plugin_list(path):
> +    layers_path = get_bitbake_var("BBLAYERS")
> +    canned_wks_layer_dirs = []
> +
> +    if layers_path is not None:
> +        for layer_path in layers_path.split():
> +            for wks_path in (WIC_DIR, SCRIPTS_SOURCE_PLUGIN_DIR):
> +                cpath = os.path.join(layer_path, wks_path)
> +                if os.path.isdir(cpath):
> +                    canned_wks_layer_dirs.append(cpath)
> +
> +    cpath = os.path.join(path, SOURCE_PLUGIN_DIR)
> +    canned_wks_layer_dirs.append(cpath)
> +
> +    return canned_wks_layer_dirs
> +
> +
>  def find_canned_image(scripts_path, wks_file):
>      """
>      Find a .wks file with the given name in the canned files dir.
> @@ -95,6 +114,24 @@ def find_canned_image(scripts_path, wks_file):
>      return None
>  
>  
> +def find_source_plugin(scripts_path, plugin_file):
> +    """
> +    Find a .py file with the given name in the source plugin dir.
> +
> +    Return False if not found
> +    """
> +    layers_source_plugin_dir = build_source_plugin_list(scripts_path)
> +
> +    for source_plugin_dir in layers_source_plugin_dir:
> +        for root, dirs, files in os.walk(source_plugin_dir):
> +            for fname in files:
> +                if fname.endswith("~") or fname.endswith("#"):
> +                    continue
> +                if fname.endswith(".py") and plugin_file + ".py" == fname:
> +                    fullpath = os.path.join(source_plugin_dir, fname)
> +                    return fullpath
> +    return None
> +
>  def list_canned_images(scripts_path):
>      """
>      List the .wks files in the canned image dir, minus the extension.
> @@ -119,7 +156,7 @@ def list_canned_images(scripts_path):
>                      print("  %s\t\t%s" % (basename.ljust(30), desc))
>  
>  
> -def list_canned_image_help(scripts_path, fullpath):
> +def list_canned_image_help(fullpath):
>      """
>      List the help and params in the specified canned image.
>      """
> @@ -139,6 +176,7 @@ def list_canned_image_help(scripts_path, fullpath):
>              if idx != -1:
>                  print(line[idx + len("#:"):].rstrip())
>              else:
> +                print()
>                  break
>  
>  
> @@ -152,6 +190,29 @@ def list_source_plugins():
>          print("  %s" % plugin)
>  
>  
> +def list_source_plugins_help(fullpath):
> +    """
> +    List the help and params in the specified canned image.
> +    """
> +    found = False
> +    with open(fullpath) as plugin:
> +        for line in plugin:
> +            if not found:
> +                idx = line.find("DESCRIPTION")
> +                if idx != -1:
> +                    print(line[idx + len("DESCRIPTION"):].strip())
> +                    found = True
> +                continue
> +            if not line.strip():
> +                break
> +            idx = line.find("#")
> +            auth = line.find("AUTHORS")
> +            if idx != -1 and auth == -1:
> +                print(line[idx + len("#:"):].rstrip())
> +            else:
> +                break
> +
> +
>  def wic_create(wks_file, rootfs_dir, bootimg_dir, kernel_dir,
>                 native_sysroot, options):
>      """
> @@ -204,7 +265,7 @@ def wic_create(wks_file, rootfs_dir, bootimg_dir, kernel_dir,
>      logger.info("The image(s) were created using OE kickstart file:\n  %s", wks_file)
>  
>  
> -def wic_list(args, scripts_path):
> +def wic_list(scripts_path, args):
>      """
>      Print the list of images or source plugins.
>      """
> @@ -218,16 +279,20 @@ def wic_list(args, scripts_path):
>      elif args.list_type == "source-plugins":
>          list_source_plugins()
>          return True
> -    elif len(args.help_for) == 1 and args.help_for[0] == 'help':
> -        wks_file = args.list_type
> -        fullpath = find_canned_image(scripts_path, wks_file)
> +    elif len(args.info_for) == 1 and args.info_for[0] == 'info':
> +        input_file = args.list_type
> +        fullpath = find_canned_image(scripts_path, input_file)
>          if not fullpath:
> -            raise WicError("No image named %s found, exiting. "
> -                           "(Use 'wic list images' to list available images, "
> -                           "or specify a fully-qualified OE kickstart (.wks) "
> -                           "filename)" % wks_file)
> -
> -        list_canned_image_help(scripts_path, fullpath)
> +            fullpath = find_source_plugin(scripts_path, input_file)
> +            if not fullpath:
> +                raise WicError("No image named %s found, exiting. "
> +                               "(Use 'wic list images' to list available images, "
> +                               "or specify a fully-qualified OE kickstart (.wks) "
> +                               "filename)" % input_file)
> +            else:
> +                list_source_plugins_help(fullpath)
> +        else:
> +            list_canned_image_help(fullpath)
>          return True
>  
>      return False
> diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
> index 2ac45e0..8230395 100644
> --- a/scripts/lib/wic/help.py
> +++ b/scripts/lib/wic/help.py
> @@ -30,1014 +30,166 @@ import logging
>  
>  from wic.pluginbase import PluginMgr, PLUGIN_TYPES
>  
> -logger = logging.getLogger('wic')
> -
> -def subcommand_error(args):
> -    logger.info("invalid subcommand %s", args[0])
> -
> -
> -def display_help(subcommand, subcommands):
> -    """
> -    Display help for subcommand.
> -    """
> -    if subcommand not in subcommands:
> -        return False
> -
> -    hlp = subcommands.get(subcommand, subcommand_error)[2]
> -    if callable(hlp):
> -        hlp = hlp()
> -    pager = subprocess.Popen('less', stdin=subprocess.PIPE)
> -    pager.communicate(hlp.encode('utf-8'))
> -
> -    return True
> -
> -
> -def wic_help(args, usage_str, subcommands):
> -    """
> -    Subcommand help dispatcher.
> -    """
> -    if args.help_topic == None or not display_help(args.help_topic, subcommands):
> -        print(usage_str)
> -
> -
> -def get_wic_plugins_help():
> -    """
> -    Combine wic_plugins_help with the help for every known
> -    source plugin.
> -    """
> -    result = wic_plugins_help
> -    for plugin_type in PLUGIN_TYPES:
> -        result += '\n\n%s PLUGINS\n\n' % plugin_type.upper()
> -        for name, plugin in PluginMgr.get_plugins(plugin_type).items():
> -            result += "\n %s plugin:\n" % name
> -            if plugin.__doc__:
> -                result += plugin.__doc__
> -            else:
> -                result += "\n    %s is missing docstring\n" % plugin
> -    return result
> -
> -
> -def invoke_subcommand(args, parser, main_command_usage, subcommands):
> -    """
> -    Dispatch to subcommand handler borrowed from combo-layer.
> -    Should use argparse, but has to work in 2.6.
> -    """
> -    if not args.command:
> -        logger.error("No subcommand specified, exiting")
> -        parser.print_help()
> -        return 1
> -    elif args.command == "help":
> -        wic_help(args, main_command_usage, subcommands)
> -    elif args.command not in subcommands:
> -        logger.error("Unsupported subcommand %s, exiting\n", args.command)
> -        parser.print_help()
> -        return 1
> -    else:
> -        subcmd = subcommands.get(args.command, subcommand_error)
> -        usage = subcmd[1]
> -        subcmd[0](args, usage)
> -
> -
> -##
> +# ##
>  # wic help and usage strings
>  ##
>  
> -wic_usage = """
> -
> - Create a customized OpenEmbedded image
> -
> - usage: wic [--version] | [--help] | [COMMAND [ARGS]]
> -
> - Current 'wic' commands are:
> -    help              Show help for command or one of the topics (see below)
> -    create            Create a new OpenEmbedded image
> -    list              List available canned images and source plugins
> -
> - Help topics:
> -    overview          wic overview - General overview of wic
> -    plugins           wic plugins - Overview and API
> -    kickstart         wic kickstart - wic kickstart reference
> -"""
> -
> -wic_help_usage = """
> -
> - usage: wic help <subcommand>
> -
> - This command displays detailed help for the specified subcommand.
> -"""
> -
> -wic_create_usage = """
> -
> - Create a new OpenEmbedded image
> -
> - usage: wic create <wks file or image name> [-o <DIRNAME> | --outdir <DIRNAME>]
> -            [-e | --image-name] [-s, --skip-build-check] [-D, --debug]
> -            [-r, --rootfs-dir] [-b, --bootimg-dir]
> -            [-k, --kernel-dir] [-n, --native-sysroot] [-f, --build-rootfs]
> -            [-c, --compress-with] [-m, --bmap]
> -
> - This command creates an OpenEmbedded image based on the 'OE kickstart
> - commands' found in the <wks file>.
> -
> - The -o option can be used to place the image in a directory with a
> - different name and location.
> -
> - See 'wic help create' for more detailed instructions.
> -"""
> -
> -wic_create_help = """
> -
> -NAME
> -    wic create - Create a new OpenEmbedded image
> -
> -SYNOPSIS
> -    wic create <wks file or image name> [-o <DIRNAME> | --outdir <DIRNAME>]
> -        [-e | --image-name] [-s, --skip-build-check] [-D, --debug]
> -        [-r, --rootfs-dir] [-b, --bootimg-dir]
> -        [-k, --kernel-dir] [-n, --native-sysroot] [-f, --build-rootfs]
> -        [-c, --compress-with] [-m, --bmap] [--no-fstab-update]
> -
> -DESCRIPTION
> -    This command creates an OpenEmbedded image based on the 'OE
> -    kickstart commands' found in the <wks file>.
> -
> -    In order to do this, wic needs to know the locations of the
> -    various build artifacts required to build the image.
> -
> -    Users can explicitly specify the build artifact locations using
> -    the -r, -b, -k, and -n options.  See below for details on where
> -    the corresponding artifacts are typically found in a normal
> -    OpenEmbedded build.
> -
> -    Alternatively, users can use the -e option to have 'wic' determine
> -    those locations for a given image.  If the -e option is used, the
> -    user needs to have set the appropriate MACHINE variable in
> -    local.conf, and have sourced the build environment.
> -
> -    The -e option is used to specify the name of the image to use the
> -    artifacts from e.g. core-image-sato.
> -
> -    The -r option is used to specify the path to the /rootfs dir to
> -    use as the .wks rootfs source.
> -
> -    The -b option is used to specify the path to the dir containing
> -    the boot artifacts (e.g. /EFI or /syslinux dirs) to use as the
> -    .wks bootimg source.
> -
> -    The -k option is used to specify the path to the dir containing
> -    the kernel to use in the .wks bootimg.
> -
> -    The -n option is used to specify the path to the native sysroot
> -    containing the tools to use to build the image.
> -
> -    The -f option is used to build rootfs by running "bitbake <image>"
> -
> -    The -s option is used to skip the build check.  The build check is
> -    a simple sanity check used to determine whether the user has
> -    sourced the build environment so that the -e option can operate
> -    correctly.  If the user has specified the build artifact locations
> -    explicitly, 'wic' assumes the user knows what he or she is doing
> -    and skips the build check.
> -
> -    The -D option is used to display debug information detailing
> -    exactly what happens behind the scenes when a create request is
> -    fulfilled (or not, as the case may be).  It enumerates and
> -    displays the command sequence used, and should be included in any
> -    bug report describing unexpected results.
> -
> -    When 'wic -e' is used, the locations for the build artifacts
> -    values are determined by 'wic -e' from the output of the 'bitbake
> -    -e' command given an image name e.g. 'core-image-minimal' and a
> -    given machine set in local.conf.  In that case, the image is
> -    created as if the following 'bitbake -e' variables were used:
> -
> -    -r:        IMAGE_ROOTFS
> -    -k:        STAGING_KERNEL_DIR
> -    -n:        STAGING_DIR_NATIVE
> -    -b:        empty (plugin-specific handlers must determine this)
> -
> -    If 'wic -e' is not used, the user needs to select the appropriate
> -    value for -b (as well as -r, -k, and -n).
> -
> -    The -o option can be used to place the image in a directory with a
> -    different name and location.
> -
> -    The -c option is used to specify compressor utility to compress
> -    an image. gzip, bzip2 and xz compressors are supported.
> -
> -    The -m option is used to produce .bmap file for the image. This file
> -    can be used to flash image using bmaptool utility.
> -
> -    The --no-fstab-update option is used to doesn't change fstab file. When
> -    using this option the final fstab file will be same that in rootfs and
> -    wic doesn't update file, e.g adding a new mount point. User can control
> -    the fstab file content in base-files recipe.
> -"""
> -
> -wic_list_usage = """
> -
> - List available OpenEmbedded images and source plugins
> -
> - usage: wic list images
> -        wic list <image> help
> -        wic list source-plugins
> -
> - This command enumerates the set of available canned images as well as
> - help for those images.  It also can be used to list of available source
> - plugins.
> -
> - The first form enumerates all the available 'canned' images.
> -
> - The second form lists the detailed help information for a specific
> - 'canned' image.
> -
> - The third form enumerates all the available --sources (source
> - plugins).
> -
> - See 'wic help list' for more details.
> +wic_create_short_description = """
> +Create a new OpenEmbedded image.
>  """
>  
> -wic_list_help = """
> -
> -NAME
> -    wic list - List available OpenEmbedded images and source plugins
> -
> -SYNOPSIS
> -    wic list images
> -    wic list <image> help
> -    wic list source-plugins
> -
> -DESCRIPTION
> -    This command enumerates the set of available canned images as well
> -    as help for those images.  It also can be used to list available
> -    source plugins.
> -
> -    The first form enumerates all the available 'canned' images.
> -    These are actually just the set of .wks files that have been moved
> -    into the /scripts/lib/wic/canned-wks directory).
> -
> -    The second form lists the detailed help information for a specific
> -    'canned' image.
> -
> -    The third form enumerates all the available --sources (source
> -    plugins).  The contents of a given partition are driven by code
> -    defined in 'source plugins'.  Users specify a specific plugin via
> -    the --source parameter of the partition .wks command.  Normally
> -    this is the 'rootfs' plugin but can be any of the more specialized
> -    sources listed by the 'list source-plugins' command.  Users can
> -    also add their own source plugins - see 'wic help plugins' for
> -    details.
> +wic_rm_short_description = """
> +Remove files or directories from the vfat or ext* partitions.
>  """
>  
> -wic_ls_usage = """
> -
> - List content of a partitioned image
> -
> - usage: wic ls <image>[:<partition>[<path>]] [--native-sysroot <path>]
> -
> - This command  outputs either list of image partitions or directory contents
> - of vfat and ext* partitions.
> -
> - See 'wic help ls' for more detailed instructions.
> -
> +wic_write_short_description = """
> +Write an image to a device.
>  """
>  
> -wic_ls_help = """
> -
> -NAME
> -    wic ls - List contents of partitioned image or partition
> -
> -SYNOPSIS
> -    wic ls <image>
> -    wic ls <image>:<vfat or ext* partition>
> -    wic ls <image>:<vfat or ext* partition><path>
> -    wic ls <image>:<vfat or ext* partition><path> --native-sysroot <path>
> -
> -DESCRIPTION
> -    This command lists either partitions of the image or directory contents
> -    of vfat or ext* partitions.
> -
> -    The first form it lists partitions of the image.
> -    For example:
> -        $ wic ls tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.wic
> -        Num     Start        End          Size      Fstype
> -        1        1048576     24438783     23390208  fat16
> -        2       25165824     50315263     25149440  ext4
> -
> -    Second and third form list directory content of the partition:
> -        $ wic ls tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.wic:1
> -        Volume in drive : is boot
> -         Volume Serial Number is 2DF2-5F02
> -        Directory for ::/
> -
> -        efi          <DIR>     2017-05-11  10:54
> -        startup  nsh        26 2017-05-11  10:54
> -        vmlinuz        6922288 2017-05-11  10:54
> -                3 files           6 922 314 bytes
> -                                 15 818 752 bytes free
> -
> -
> -        $ wic ls tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.wic:1/EFI/boot/
> -        Volume in drive : is boot
> -         Volume Serial Number is 2DF2-5F02
> -        Directory for ::/EFI/boot
> -
> -        .            <DIR>     2017-05-11  10:54
> -        ..           <DIR>     2017-05-11  10:54
> -        grub     cfg       679 2017-05-11  10:54
> -        bootx64  efi    571392 2017-05-11  10:54
> -                4 files             572 071 bytes
> -                                 15 818 752 bytes free
> -
> -    The -n option is used to specify the path to the native sysroot
> -    containing the tools(parted and mtools) to use.
> -
> -"""
> -
> -wic_cp_usage = """
> -
> - Copy files and directories to the vfat or ext* partition
> -
> - usage: wic cp <src> <image>:<partition>[<path>] [--native-sysroot <path>]
> -
> - This command  copies local files or directories to the vfat or ext* partitions
> -of partitioned  image.
> -
> - See 'wic help cp' for more detailed instructions.
> -
> +wic_cp_short_description = """
> +Copy files and directories to the vfat or ext* partitions.
>  """
>  
> -wic_cp_help = """
> -
> -NAME
> -    wic cp - copy files and directories to the vfat or ext* partitions
> -
> -SYNOPSIS
> -    wic cp <src> <image>:<partition>
> -    wic cp <src> <image>:<partition><path>
> -    wic cp <src> <image>:<partition><path> --native-sysroot <path>
> -
> -DESCRIPTION
> -    This command copies files and directories to the vfat or ext* partition of
> -    the partitioned image.
> -
> -    The first form of it copies file or directory to the root directory of
> -    the partition:
> -        $ wic cp test.wks tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.wic:1
> -        $ wic ls tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.wic:1
> -        Volume in drive : is boot
> -         Volume Serial Number is DB4C-FD4C
> -        Directory for ::/
> -
> -        efi          <DIR>     2017-05-24  18:15
> -        loader       <DIR>     2017-05-24  18:15
> -        startup  nsh        26 2017-05-24  18:15
> -        vmlinuz        6926384 2017-05-24  18:15
> -        test     wks       628 2017-05-24  21:22
> -                5 files           6 927 038 bytes
> -                                 15 677 440 bytes free
> -
> -    The second form of the command copies file or directory to the specified directory
> -    on the partition:
> -       $ wic cp test tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.wic:1/efi/
> -       $ wic ls tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.wic:1/efi/
> -       Volume in drive : is boot
> -        Volume Serial Number is DB4C-FD4C
> -       Directory for ::/efi
> -
> -       .            <DIR>     2017-05-24  18:15
> -       ..           <DIR>     2017-05-24  18:15
> -       boot         <DIR>     2017-05-24  18:15
> -       test         <DIR>     2017-05-24  21:27
> -               4 files                   0 bytes
> -                                15 675 392 bytes free
> -
> -    The -n option is used to specify the path to the native sysroot
> -    containing the tools(parted and mtools) to use.
> +wic_ls_short_description = """
> +Lists either partitions of the image or directory contents
> +of vfat or ext* partitions."""
> +wic_help_short_description = """
> +sss
>  """
> -
> -wic_rm_usage = """
> -
> - Remove files or directories from the vfat or ext* partitions
> -
> - usage: wic rm <image>:<partition><path> [--native-sysroot <path>]
> -
> - This command  removes files or directories from the vfat or ext* partitions of
> - the partitioned image.
> -
> - See 'wic help rm' for more detailed instructions.
> -
> +wic_list_short_description = """
> +List available canned images and source plugins
>  """
>  
> -wic_rm_help = """
> +wic_create_description = """
> +This command creates an OpenEmbedded image based on the 'OE
> +kickstart commands' found in the <wks file>.
>  
> -NAME
> -    wic rm - remove files or directories from the vfat or ext* partitions
> +In order to do this, wic needs to know the locations of the
> +various build artifacts required to build the image.
>  
> -SYNOPSIS
> -    wic rm <src> <image>:<partition><path>
> -    wic rm <src> <image>:<partition><path> --native-sysroot <path>
> +Users can explicitly specify the build artifact locations using
> +the -r, -b, -k, and -n options.  See below for details on where
> +the corresponding artifacts are typically found in a normal
> +OpenEmbedded build.
>  
> -DESCRIPTION
> -    This command removes files or directories from the vfat or ext* partition of the
> -    partitioned image:
> +Alternatively, users can use the -e option to have 'wic' determine
> +those locations for a given image.  If the -e option is used, the
> +user needs to have set the appropriate MACHINE variable in
> +local.conf, and have sourced the build environment.
>  
> -        $ wic ls ./tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.wic:1
> -        Volume in drive : is boot
> -         Volume Serial Number is 11D0-DE21
> -        Directory for ::/
> +The -s option is used to skip the build check.  The build check is
> +a simple sanity check used to determine whether the user has
> +sourced the build environment so that the -e option can operate
> +correctly.  If the user has specified the build artifact locations
> +explicitly, 'wic' assumes the user knows what he or she is doing
> +and skips the build check.
>  
> -        libcom32 c32    186500 2017-06-02  15:15
> -        libutil  c32     24148 2017-06-02  15:15
> -        syslinux cfg       209 2017-06-02  15:15
> -        vesamenu c32     27104 2017-06-02  15:15
> -        vmlinuz        6926384 2017-06-02  15:15
> -                5 files           7 164 345 bytes
> -                                 16 582 656 bytes free
> +When 'wic -e' is used, the locations for the build artifacts
> +values are determined by 'wic -e' from the output of the 'bitbake
> +-e' command given an image name e.g. 'core-image-minimal' and a
> +given machine set in local.conf.  In that case, the image is
> +created as if the following 'bitbake -e' variables were used:
>  
> -        $ wic rm ./tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.wic:1/libutil.c32
> +-r:        IMAGE_ROOTFS
> +-k:        STAGING_KERNEL_DIR
> +-n:        STAGING_DIR_NATIVE
> +-b:        empty (plugin-specific handlers must determine this)
>  
> -        $ wic ls ./tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.wic:1
> -        Volume in drive : is boot
> -         Volume Serial Number is 11D0-DE21
> -        Directory for ::/
> +If 'wic -e' is not used, the user needs to select the appropriate
> +value for -b (as well as -r, -k, and -n).
>  
> -        libcom32 c32    186500 2017-06-02  15:15
> -        syslinux cfg       209 2017-06-02  15:15
> -        vesamenu c32     27104 2017-06-02  15:15
> -        vmlinuz        6926384 2017-06-02  15:15
> -                4 files           7 140 197 bytes
> -                                 16 607 232 bytes free
> +Here's an example that doesn't take the easy way out and manually
> +specifies each build artifact, along with a non-canned .wks file,
> +and also uses the -o option to have wic create the output
> +somewhere other than the default /var/tmp/wic:
>  
> -    The -n option is used to specify the path to the native sysroot
> -    containing the tools(parted and mtools) to use.
> +  $ wic create ./test.wks -o ./out --rootfs-dir
> +  tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/rootfs
> +  --bootimg-dir tmp/sysroots/qemux86-64/usr/share
> +  --kernel-dir tmp/deploy/images/qemux86-64
> +  --native-sysroot tmp/sysroots/x86_64-linux
>  """
>  
> -wic_write_usage = """
>  
> - Write image to a device
> +wic_list_description = """
> +This command enumerates the set of available canned images as well
> +as help for those images.  It also can be used to list available
> +source plugins.
>  
> - usage: wic write <image> <target device> [--expand [rules]] [--native-sysroot <path>]
> +The first form enumerates all the available 'canned' images.
> +These are actually just the set of .wks files that have been moved
> +into the /scripts/lib/wic/canned-wks directory).
>  
> - This command writes partitioned image to a target device (USB stick, SD card etc).
> -
> - See 'wic help write' for more detailed instructions.
> +The second form lists the detailed help information for a specific
> +'canned' image.
>  
> +The third form enumerates all the available --sources (source
> +plugins).  The contents of a given partition are driven by code
> +defined in 'source plugins'.  Users specify a specific plugin via
> +the --source parameter of the partition .wks command.  Normally
> +this is the 'rootfs' plugin but can be any of the more specialized
> +sources listed by the 'list source-plugins' command.  Users can
> +also add their own source plugins - see 'wic help plugins' for
> +details.
>  """
>  
> -wic_write_help = """
>  
> -NAME
> -    wic write - write an image to a device
> +wic_ls_description = """
> +This command lists either partitions of the image or directory contents
> +of vfat or ext* partitions.
>  
> -SYNOPSIS
> -    wic write <image> <target>
> -    wic write <image> <target> --expand auto
> -    wic write <image> <target> --expand 1:100M-2:300M
> -    wic write <image> <target> --native-sysroot <path>
> +The first form lists partitions of the image.
> +For example:
> +    $ wic ls tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.wic
> +    Num     Start        End          Size      Fstype
> +    1        1048576     24438783     23390208  fat16
> +    2       25165824     50315263     25149440  ext4
>  
> -DESCRIPTION
> -    This command writes an image to a target device (USB stick, SD card etc)
> +The second form lists directory contents of the first partition:
>  
> -        $ wic write ./tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.wic /dev/sdb
> +    $ wic ls tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.wic:1/EFI/boot/
> +    Volume in drive : is boot
> +     Volume Serial Number is 2DF2-5F02
> +    Directory for ::/EFI/boot
>  
> -    The --expand option is used to resize image partitions.
> -    --expand auto expands partitions to occupy all free space available on the target device.
> -    It's also possible to specify expansion rules in a format
> -    <partition>:<size>[-<partition>:<size>...] for one or more partitions.
> -    Specifying size 0 will keep partition unmodified.
> -    Note: Resizing boot partition can result in non-bootable image for non-EFI images. It is
> -    recommended to use size 0 for boot partition to keep image bootable.
> +    .            <DIR>     2017-05-11  10:54
> +    ..           <DIR>     2017-05-11  10:54
> +    grub     cfg       679 2017-05-11  10:54
> +    bootx64  efi    571392 2017-05-11  10:54
> +            4 files             572 071 bytes
> +                             15 818 752 bytes free
>  
> -    The --native-sysroot option is used to specify the path to the native sysroot
> -    containing the tools(parted, resize2fs) to use.
>  """
>  
> -wic_plugins_help = """
> -
> -NAME
> -    wic plugins - Overview and API
> -
> -DESCRIPTION
> -    plugins allow wic functionality to be extended and specialized by
> -    users.  This section documents the plugin interface, which is
> -    currently restricted to 'source' plugins.
> -
> -    'Source' plugins provide a mechanism to customize various aspects
> -    of the image generation process in wic, mainly the contents of
> -    partitions.
> -
> -    Source plugins provide a mechanism for mapping values specified in
> -    .wks files using the --source keyword to a particular plugin
> -    implementation that populates a corresponding partition.
> -
> -    A source plugin is created as a subclass of SourcePlugin (see
> -    scripts/lib/wic/pluginbase.py) and the plugin file containing it
> -    is added to scripts/lib/wic/plugins/source/ to make the plugin
> -    implementation available to the wic implementation.
> -
> -    Source plugins can also be implemented and added by external
> -    layers - any plugins found in a scripts/lib/wic/plugins/source/
> -    directory in an external layer will also be made available.
> -
> -    When the wic implementation needs to invoke a partition-specific
> -    implementation, it looks for the plugin that has the same name as
> -    the --source param given to that partition.  For example, if the
> -    partition is set up like this:
> -
> -      part /boot --source bootimg-pcbios   ...
> -
> -    then the methods defined as class members of the plugin having the
> -    matching bootimg-pcbios .name class member would be used.
> -
> -    To be more concrete, here's the plugin definition that would match
> -    a '--source bootimg-pcbios' usage, along with an example method
> -    that would be called by the wic implementation when it needed to
> -    invoke an implementation-specific partition-preparation function:
> -
> -    class BootimgPcbiosPlugin(SourcePlugin):
> -        name = 'bootimg-pcbios'
> +wic_cp_description = """
> +This command copies files and directories to the vfat or ext* partition of
> +the partitioned image.
>  
> -    @classmethod
> -        def do_prepare_partition(self, part, ...)
> -
> -    If the subclass itself doesn't implement a function, a 'default'
> -    version in a superclass will be located and used, which is why all
> -    plugins must be derived from SourcePlugin.
> -
> -    The SourcePlugin class defines the following methods, which is the
> -    current set of methods that can be implemented/overridden by
> -    --source plugins.  Any methods not implemented by a SourcePlugin
> -    subclass inherit the implementations present in the SourcePlugin
> -    class (see the SourcePlugin source for details):
> -
> -      do_prepare_partition()
> -          Called to do the actual content population for a
> -          partition. In other words, it 'prepares' the final partition
> -          image which will be incorporated into the disk image.
> -
> -      do_configure_partition()
> -          Called before do_prepare_partition(), typically used to
> -          create custom configuration files for a partition, for
> -          example syslinux or grub config files.
> -
> -      do_install_disk()
> -          Called after all partitions have been prepared and assembled
> -          into a disk image.  This provides a hook to allow
> -          finalization of a disk image, for example to write an MBR to
> -          it.
> -
> -      do_stage_partition()
> -          Special content-staging hook called before
> -          do_prepare_partition(), normally empty.
> -
> -          Typically, a partition will just use the passed-in
> -          parameters, for example the unmodified value of bootimg_dir.
> -          In some cases however, things may need to be more tailored.
> -          As an example, certain files may additionally need to be
> -          take from bootimg_dir + /boot.  This hook allows those files
> -          to be staged in a customized fashion.  Note that
> -          get_bitbake_var() allows you to access non-standard
> -          variables that you might want to use for these types of
> -          situations.
> -
> -    This scheme is extensible - adding more hooks is a simple matter
> -    of adding more plugin methods to SourcePlugin and derived classes.
> -    Please see the implementation for details.
> +Copies file or directory to the specified directory
> +on the partition:
> +   $ wic cp test tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.wic:1/efi/
>  """
>  
> -wic_overview_help = """
> -
> -NAME
> -    wic overview - General overview of wic
> -
> -DESCRIPTION
> -    The 'wic' command generates partitioned images from existing
> -    OpenEmbedded build artifacts.  Image generation is driven by
> -    partitioning commands contained in an 'Openembedded kickstart'
> -    (.wks) file (see 'wic help kickstart') specified either directly
> -    on the command-line or as one of a selection of canned .wks files
> -    (see 'wic list images').  When applied to a given set of build
> -    artifacts, the result is an image or set of images that can be
> -    directly written onto media and used on a particular system.
> -
> -    The 'wic' command and the infrastructure it's based on is by
> -    definition incomplete - its purpose is to allow the generation of
> -    customized images, and as such was designed to be completely
> -    extensible via a plugin interface (see 'wic help plugins').
> -
> -  Background and Motivation
> -
> -    wic is meant to be a completely independent standalone utility
> -    that initially provides easier-to-use and more flexible
> -    replacements for a couple bits of existing functionality in
> -    oe-core: directdisk.bbclass and mkefidisk.sh.  The difference
> -    between wic and those examples is that with wic the functionality
> -    of those scripts is implemented by a general-purpose partitioning
> -    'language' based on Redhat kickstart syntax).
> -
> -    The initial motivation and design considerations that lead to the
> -    current tool are described exhaustively in Yocto Bug #3847
> -    (https://bugzilla.yoctoproject.org/show_bug.cgi?id=3847).
> -
> -  Implementation and Examples
> -
> -    wic can be used in two different modes, depending on how much
> -    control the user needs in specifying the Openembedded build
> -    artifacts that will be used in creating the image: 'raw' and
> -    'cooked'.
> -
> -    If used in 'raw' mode, artifacts are explicitly specified via
> -    command-line arguments (see example below).
> -
> -    The more easily usable 'cooked' mode uses the current MACHINE
> -    setting and a specified image name to automatically locate the
> -    artifacts used to create the image.
> -
> -    OE kickstart files (.wks) can of course be specified directly on
> -    the command-line, but the user can also choose from a set of
> -    'canned' .wks files available via the 'wic list images' command
> -    (example below).
> -
> -    In any case, the prerequisite for generating any image is to have
> -    the build artifacts already available.  The below examples assume
> -    the user has already build a 'core-image-minimal' for a specific
> -    machine (future versions won't require this redundant step, but
> -    for now that's typically how build artifacts get generated).
> -
> -    The other prerequisite is to source the build environment:
> -
> -      $ source oe-init-build-env
> -
> -    To start out with, we'll generate an image from one of the canned
> -    .wks files.  The following generates a list of availailable
> -    images:
> -
> -      $ wic list images
> -        mkefidisk             Create an EFI disk image
> -        directdisk            Create a 'pcbios' direct disk image
> -
> -    You can get more information about any of the available images by
> -    typing 'wic list xxx help', where 'xxx' is one of the image names:
> -
> -      $ wic list mkefidisk help
> -
> -    Creates a partitioned EFI disk image that the user can directly dd
> -    to boot media.
> -
> -    At any time, you can get help on the 'wic' command or any
> -    subcommand (currently 'list' and 'create').  For instance, to get
> -    the description of 'wic create' command and its parameters:
> -
> -      $ wic create
> -
> -       Usage:
> -
> -       Create a new OpenEmbedded image
> -
> -       usage: wic create <wks file or image name> [-o <DIRNAME> | ...]
> -            [-i <JSON PROPERTY FILE> | --infile <JSON PROPERTY_FILE>]
> -            [-e | --image-name] [-s, --skip-build-check] [-D, --debug]
> -            [-r, --rootfs-dir] [-b, --bootimg-dir] [-k, --kernel-dir]
> -            [-n, --native-sysroot] [-f, --build-rootfs]
> -
> -       This command creates an OpenEmbedded image based on the 'OE
> -       kickstart commands' found in the <wks file>.
> -
> -       The -o option can be used to place the image in a directory
> -       with a different name and location.
> -
> -       See 'wic help create' for more detailed instructions.
> -       ...
> -
> -    As mentioned in the command, you can get even more detailed
> -    information by adding 'help' to the above:
> -
> -      $ wic help create
> -
> -    So, the easiest way to create an image is to use the -e option
> -    with a canned .wks file.  To use the -e option, you need to
> -    specify the image used to generate the artifacts and you actually
> -    need to have the MACHINE used to build them specified in your
> -    local.conf (these requirements aren't necessary if you aren't
> -    using the -e options.)  Below, we generate a directdisk image,
> -    pointing the process at the core-image-minimal artifacts for the
> -    current MACHINE:
> -
> -      $ wic create directdisk -e core-image-minimal
> -
> -      Checking basic build environment...
> -      Done.
> -
> -      Creating image(s)...
> -
> -      Info: The new image(s) can be found here:
> -      /var/tmp/wic/build/directdisk-201309252350-sda.direct
> -
> -      The following build artifacts were used to create the image(s):
> -
> -      ROOTFS_DIR:      ...
> -      BOOTIMG_DIR:     ...
> -      KERNEL_DIR:      ...
> -      NATIVE_SYSROOT:  ...
> -
> -      The image(s) were created using OE kickstart file:
> -        .../scripts/lib/wic/canned-wks/directdisk.wks
> -
> -    The output shows the name and location of the image created, and
> -    so that you know exactly what was used to generate the image, each
> -    of the artifacts and the kickstart file used.
> -
> -    Similarly, you can create a 'mkefidisk' image in the same way
> -    (notice that this example uses a different machine - because it's
> -    using the -e option, you need to change the MACHINE in your
> -    local.conf):
> -
> -      $ wic create mkefidisk -e core-image-minimal
> -      Checking basic build environment...
> -      Done.
> -
> -      Creating image(s)...
> -
> -      Info: The new image(s) can be found here:
> -         /var/tmp/wic/build/mkefidisk-201309260027-sda.direct
> -
> -      ...
> -
> -    Here's an example that doesn't take the easy way out and manually
> -    specifies each build artifact, along with a non-canned .wks file,
> -    and also uses the -o option to have wic create the output
> -    somewhere other than the default /var/tmp/wic:
> -
> -      $ wic create ./test.wks -o ./out --rootfs-dir
> -      tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/rootfs
> -      --bootimg-dir tmp/sysroots/qemux86-64/usr/share
> -      --kernel-dir tmp/deploy/images/qemux86-64
> -      --native-sysroot tmp/sysroots/x86_64-linux
> -
> -     Creating image(s)...
> -
> -     Info: The new image(s) can be found here:
> -           out/build/test-201507211313-sda.direct
> -
> -     The following build artifacts were used to create the image(s):
> -       ROOTFS_DIR:                   tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/rootfs
> -       BOOTIMG_DIR:                  tmp/sysroots/qemux86-64/usr/share
> -       KERNEL_DIR:                   tmp/deploy/images/qemux86-64
> -       NATIVE_SYSROOT:               tmp/sysroots/x86_64-linux
> -
> -     The image(s) were created using OE kickstart file:
> -     ./test.wks
> -
> -     Here is a content of test.wks:
>  
> -     part /boot --source bootimg-pcbios --ondisk sda --label boot --active --align 1024
> -     part / --source rootfs --ondisk sda --fstype=ext3 --label platform --align 1024
> +wic_rm_description = """
> +This command removes files or directories from the vfat or ext* partition of the
> +partitioned image: wic rm <wic image>:<partition><path> 
>  
> -     bootloader  --timeout=0  --append="rootwait rootfstype=ext3 video=vesafb vga=0x318 console=tty0"
> +$wic rm ./tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.wic:1/libutil.c32 
>  
> -
> -    Finally, here's an example of the actual partition language
> -    commands used to generate the mkefidisk image i.e. these are the
> -    contents of the mkefidisk.wks OE kickstart file:
> -
> -      # short-description: Create an EFI disk image
> -      # long-description: Creates a partitioned EFI disk image that the user
> -      # can directly dd to boot media.
> -
> -      part /boot --source bootimg-efi --ondisk sda --fstype=efi --active
> -
> -      part / --source rootfs --ondisk sda --fstype=ext3 --label platform
> -
> -      part swap --ondisk sda --size 44 --label swap1 --fstype=swap
> -
> -      bootloader  --timeout=10  --append="rootwait console=ttyPCH0,115200"
> -
> -    You can get a complete listing and description of all the
> -    kickstart commands available for use in .wks files from 'wic help
> -    kickstart'.
>  """
>  
> -wic_kickstart_help = """
> -
> -NAME
> -    wic kickstart - wic kickstart reference
> -
> -DESCRIPTION
> -    This section provides the definitive reference to the wic
> -    kickstart language.  It also provides documentation on the list of
> -    --source plugins available for use from the 'part' command (see
> -    the 'Platform-specific Plugins' section below).
> -
> -    The current wic implementation supports only the basic kickstart
> -    partitioning commands: partition (or part for short) and
> -    bootloader.
> -
> -    The following is a listing of the commands, their syntax, and
> -    meanings. The commands are based on the Fedora kickstart
> -    documentation but with modifications to reflect wic capabilities.
> -
> -      http://fedoraproject.org/wiki/Anaconda/Kickstart#part_or_partition
> -      http://fedoraproject.org/wiki/Anaconda/Kickstart#bootloader
> -
> -  Commands
> -
> -    * 'part' or 'partition'
> -
> -       This command creates a partition on the system and uses the
> -       following syntax:
> -
> -         part [<mountpoint>]
> -
> -       The <mountpoint> is where the partition will be mounted and
> -       must take of one of the following forms:
> -
> -         /<path>: For example: /, /usr, or /home
> -
> -         swap: The partition will be used as swap space.
> -
> -       If a <mountpoint> is not specified the partition will be created
> -       but will not be mounted.
> -
> -       Partitions with a <mountpoint> specified will be automatically mounted.
> -       This is achieved by wic adding entries to the fstab during image
> -       generation. In order for a valid fstab to be generated one of the
> -       --ondrive, --ondisk or --use-uuid partition options must be used for
> -       each partition that specifies a mountpoint.
> -
> -
> -       The following are supported 'part' options:
> -
> -         --size: The minimum partition size. Specify an integer value
> -                 such as 500. Multipliers k, M ang G can be used. If
> -                 not specified, the size is in MB.
> -                 You do not need this option if you use --source.
> -
> -         --fixed-size: Exact partition size. Value format is the same
> -                       as for --size option. This option cannot be
> -                       specified along with --size. If partition data
> -                       is larger than --fixed-size and error will be
> -                       raised when assembling disk image.
> -
> -         --source: This option is a wic-specific option that names the
> -                   source of the data that will populate the
> -                   partition.  The most common value for this option
> -                   is 'rootfs', but can be any value which maps to a
> -                   valid 'source plugin' (see 'wic help plugins').
> -
> -                   If '--source rootfs' is used, it tells the wic
> -                   command to create a partition as large as needed
> -                   and to fill it with the contents of the root
> -                   filesystem pointed to by the '-r' wic command-line
> -                   option (or the equivalent rootfs derived from the
> -                   '-e' command-line option).  The filesystem type
> -                   that will be used to create the partition is driven
> -                   by the value of the --fstype option specified for
> -                   the partition (see --fstype below).
> -
> -                   If --source <plugin-name>' is used, it tells the
> -                   wic command to create a partition as large as
> -                   needed and to fill with the contents of the
> -                   partition that will be generated by the specified
> -                   plugin name using the data pointed to by the '-r'
> -                   wic command-line option (or the equivalent rootfs
> -                   derived from the '-e' command-line option).
> -                   Exactly what those contents and filesystem type end
> -                   up being are dependent on the given plugin
> -                   implementation.
> -
> -                   If --source option is not used, the wic command
> -                   will create empty partition. --size parameter has
> -                   to be used to specify size of empty partition.
> +wic_write_description = """
> +This command writes an image to a target device (USB stick, SD card etc)
>  
> -         --ondisk or --ondrive: Forces the partition to be created on
> -                                a particular disk.
> -
> -         --fstype: Sets the file system type for the partition.  These
> -           apply to partitions created using '--source rootfs' (see
> -           --source above).  Valid values are:
> -
> -             vfat
> -             msdos
> -             ext2
> -             ext3
> -             ext4
> -             btrfs
> -             squashfs
> -             swap
> -
> -         --fsoptions: Specifies a free-form string of options to be
> -                      used when mounting the filesystem. This string
> -                      will be copied into the /etc/fstab file of the
> -                      installed system and should be enclosed in
> -                      quotes.  If not specified, the default string is
> -                      "defaults".
> -
> -         --label label: Specifies the label to give to the filesystem
> -                        to be made on the partition. If the given
> -                        label is already in use by another filesystem,
> -                        a new label is created for the partition.
> -
> -         --active: Marks the partition as active.
> -
> -         --align (in KBytes): This option is specific to wic and says
> -                              to start a partition on an x KBytes
> -                              boundary.
> -
> -         --no-table: This option is specific to wic. Space will be
> -                     reserved for the partition and it will be
> -                     populated but it will not be added to the
> -                     partition table. It may be useful for
> -                     bootloaders.
> -
> -         --exclude-path: This option is specific to wic. It excludes the given
> -                         relative path from the resulting image. If the path
> -                         ends with a slash, only the content of the directory
> -                         is omitted, not the directory itself. This option only
> -                         has an effect with the rootfs source plugin.
> -
> -         --extra-space: This option is specific to wic. It adds extra
> -                        space after the space filled by the content
> -                        of the partition. The final size can go
> -                        beyond the size specified by --size.
> -                        By default, 10MB. This option cannot be used
> -                        with --fixed-size option.
> -
> -         --overhead-factor: This option is specific to wic. The
> -                            size of the partition is multiplied by
> -                            this factor. It has to be greater than or
> -                            equal to 1. The default value is 1.3.
> -                            This option cannot be used with --fixed-size
> -                            option.
> -
> -         --part-name: This option is specific to wic. It specifies name for GPT partitions.
> -
> -         --part-type: This option is specific to wic. It specifies partition
> -                      type GUID for GPT partitions.
> -                      List of partition type GUIDS can be found here:
> -                      http://en.wikipedia.org/wiki/GUID_Partition_Table#Partition_type_GUIDs
> -
> -         --use-uuid: This option is specific to wic. It makes wic to generate
> -                     random globally unique identifier (GUID) for the partition
> -                     and use it in bootloader configuration to specify root partition.
> -
> -         --uuid: This option is specific to wic. It specifies partition UUID.
> -                 It's useful if preconfigured partition UUID is added to kernel command line
> -                 in bootloader configuration before running wic. In this case .wks file can
> -                 be generated or modified to set preconfigured parition UUID using this option.
> -
> -         --system-id: This option is specific to wic. It specifies partition system id. It's useful
> -                      for the harware that requires non-default partition system ids. The parameter
> -                      in one byte long hex number either with 0x prefix or without it.
> -
> -         --mkfs-extraopts: This option specifies extra options to pass to mkfs utility.
> -                           NOTE, that wic uses default options for some filesystems, for example
> -                           '-S 512' for mkfs.fat or '-F -i 8192' for mkfs.ext. Those options will
> -                           not take effect when --mkfs-extraopts is used. This should be taken into
> -                           account when using --mkfs-extraopts.
> -
> -    * bootloader
> -
> -      This command allows the user to specify various bootloader
> -      options.  The following are supported 'bootloader' options:
> -
> -        --timeout: Specifies the number of seconds before the
> -                   bootloader times out and boots the default option.
> -
> -        --append: Specifies kernel parameters. These will be added to
> -                  bootloader command-line - for example, the syslinux
> -                  APPEND or grub kernel command line.
> -
> -        --configfile: Specifies a user defined configuration file for
> -                      the bootloader. This file must be located in the
> -                      canned-wks folder or could be the full path to the
> -                      file. Using this option will override any other
> -                      bootloader option.
> -
> -      Note that bootloader functionality and boot partitions are
> -      implemented by the various --source plugins that implement
> -      bootloader functionality; the bootloader command essentially
> -      provides a means of modifying bootloader configuration.
> -
> -    * include
> -
> -      This command allows the user to include the content of .wks file
> -      into original .wks file.
> -
> -      Command uses the following syntax:
> -
> -         include <file>
> -
> -      The <file> is either path to the file or its name. If name is
> -      specified wic will try to find file in the directories with canned
> -      .wks files.
> -
> -"""
> +    $ wic write ./tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.wic /dev/sdb
>  
> -wic_help_help = """
> -NAME
> -    wic help - display a help topic
> +The --expand option is used to resize image partitions.
> +--expand auto expands partitions to occupy all free space available on the target device.
> +It's also possible to specify expansion rules in a format
> +<partition>:<size>[-<partition>:<size>...] for one or more partitions.
> +Specifying size 0 will keep partition unmodified.
> +Note: Resizing boot partition can result in non-bootable image for non-EFI images. It is
> +recommended to use size 0 for boot partition to keep image bootable.
>  
> -DESCRIPTION
> -    Specify a help topic to display it. Topics are shown above.
>  """
> diff --git a/scripts/wic b/scripts/wic
> index 097084a..cb348e3 100755
> --- a/scripts/wic
> +++ b/scripts/wic
> @@ -106,7 +106,7 @@ class RootfsArgAction(argparse.Action):
>          namespace.__dict__['rootfs_dir'][key] = rootfs_dir
>  
>  
> -def wic_create_subcommand(options, usage_str):
> +def wic_create_subcommand(options):
>      """
>      Command-line handling for image creation.  The real work is done
>      by image.engine.wic_create()
> @@ -177,7 +177,7 @@ def wic_create_subcommand(options, usage_str):
>      wks_file = options.wks_file
>  
>      if not wks_file.endswith(".wks"):
> -        wks_file = engine.find_canned_image(scripts_path, wks_file)
> +        wks_file = engine.find_canned_image(wks_file)
>          if not wks_file:
>              raise WicError("No image named %s found, exiting.  (Use 'wic list images' "
>                             "to list available images, or specify a fully-qualified OE "
> @@ -227,91 +227,44 @@ def wic_create_subcommand(options, usage_str):
>                        native_sysroot, options)
>  
>  
> -def wic_list_subcommand(args, usage_str):
> +def wic_list_subcommand(args):
>      """
>      Command-line handling for listing available images.
>      The real work is done by image.engine.wic_list()
>      """
> -    if not engine.wic_list(args, scripts_path):
> +    if not engine.wic_list(scripts_path, args):
>          raise WicError("Bad list arguments, exiting")
>  
>  
> -def wic_ls_subcommand(args, usage_str):
> +def wic_ls_subcommand(args):
>      """
>      Command-line handling for list content of images.
>      The real work is done by engine.wic_ls()
>      """
>      engine.wic_ls(args, args.native_sysroot)
>  
> -def wic_cp_subcommand(args, usage_str):
> +def wic_cp_subcommand(args):
>      """
>      Command-line handling for copying files/dirs to images.
>      The real work is done by engine.wic_cp()
>      """
>      engine.wic_cp(args, args.native_sysroot)
>  
> -def wic_rm_subcommand(args, usage_str):
> +def wic_rm_subcommand(args):
>      """
>      Command-line handling for removing files/dirs from images.
>      The real work is done by engine.wic_rm()
>      """
>      engine.wic_rm(args, args.native_sysroot)
>  
> -def wic_write_subcommand(args, usage_str):
> +def wic_write_subcommand(args):
>      """
>      Command-line handling for writing images.
>      The real work is done by engine.wic_write()
>      """
>      engine.wic_write(args, args.native_sysroot)
>  
> -def wic_help_subcommand(args, usage_str):
> -    """
> -    Command-line handling for help subcommand to keep the current
> -    structure of the function definitions.
> -    """
> -    pass
> -
>  
> -def wic_help_topic_subcommand(usage_str, help_str):
> -    """
> -    Display function for help 'sub-subcommands'.
> -    """
> -    print(help_str)
> -    return
> -
> -
> -wic_help_topic_usage = """
> -"""
> -
> -helptopics = {
> -    "plugins":   [wic_help_topic_subcommand,
> -                  wic_help_topic_usage,
> -                  hlp.wic_plugins_help],
> -    "overview":  [wic_help_topic_subcommand,
> -                  wic_help_topic_usage,
> -                  hlp.wic_overview_help],
> -    "kickstart": [wic_help_topic_subcommand,
> -                  wic_help_topic_usage,
> -                  hlp.wic_kickstart_help],
> -    "create":    [wic_help_topic_subcommand,
> -                  wic_help_topic_usage,
> -                  hlp.wic_create_help],
> -    "ls":        [wic_help_topic_subcommand,
> -                  wic_help_topic_usage,
> -                  hlp.wic_ls_help],
> -    "cp":        [wic_help_topic_subcommand,
> -                  wic_help_topic_usage,
> -                  hlp.wic_cp_help],
> -    "rm":        [wic_help_topic_subcommand,
> -                  wic_help_topic_usage,
> -                  hlp.wic_rm_help],
> -    "write":     [wic_help_topic_subcommand,
> -                  wic_help_topic_usage,
> -                  hlp.wic_write_help],
> -    "list":      [wic_help_topic_subcommand,
> -                  wic_help_topic_usage,
> -                  hlp.wic_list_help]
> -}
>  
>  
>  def wic_init_parser_create(subparser):
> @@ -333,17 +286,15 @@ def wic_init_parser_create(subparser):
>                        help="path to the dir containing the kernel to use "
>                             "in the .wks bootimg")
>      subparser.add_argument("-n", "--native-sysroot", dest="native_sysroot",
> -                      help="path to the native sysroot containing the tools "
> -                           "to use to build the image")
> +                      help="path to the native sysroot containing the tools (parted and mtools) to use.")
>      subparser.add_argument("-s", "--skip-build-check", dest="build_check",
>                        action="store_false", default=True, help="skip the build check")
>      subparser.add_argument("-f", "--build-rootfs", action="store_true", help="build rootfs")
>      subparser.add_argument("-c", "--compress-with", choices=("gzip", "bzip2", "xz"),
>                        dest='compressor',
>                        help="compress image with specified compressor")
> -    subparser.add_argument("-m", "--bmap", action="store_true", help="generate .bmap")
> -    subparser.add_argument("--no-fstab-update" ,action="store_true",
> -                      help="Do not change fstab file.")
> +    subparser.add_argument("-m", "--bmap", action="store_true", help="used to produce .bmap file for the image."
> +                           "This file can be used to flash image using bmaptool utility")
>      subparser.add_argument("-v", "--vars", dest='vars_dir',
>                        help="directory with <image>.env files that store "
>                             "bitbake variables")
> @@ -357,10 +308,10 @@ def wic_init_parser_list(subparser):
>                          help="can be 'images' or 'source-plugins' "
>                               "to obtain a list. "
>                               "If value is a valid .wks image file")
> -    subparser.add_argument("help_for", default=[], nargs='*',
> +    subparser.add_argument("info_for", default=[], nargs='*',
>                          help="If 'list_type' is a valid .wks image file "
> -                             "this value can be 'help' to show the help information "
> -                             "defined inside the .wks file")
> +                             "this value can be 'info' to show the image or plugin information ")
> +
>      return
>  
>  def imgtype(arg):
> @@ -385,9 +336,9 @@ def imgtype(arg):
>  
>  def wic_init_parser_ls(subparser):
>      subparser.add_argument("path", type=imgtype,
> -                        help="image spec: <image>[:<vfat partition>[<path>]]")
> +                        help="image spec: <image>[:<partition>[<path>]]")
>      subparser.add_argument("-n", "--native-sysroot",
> -                        help="path to the native sysroot containing the tools")
> +                        help="path to the native sysroot containing the tools (parted and mtools) to use.")
>  
>  def imgpathtype(arg):
>      img = imgtype(arg)
> @@ -399,15 +350,15 @@ def wic_init_parser_cp(subparser):
>      subparser.add_argument("src",
>                          help="source spec")
>      subparser.add_argument("dest", type=imgpathtype,
> -                        help="image spec: <image>:<vfat partition>[<path>]")
> +                        help="image spec: <image>:<partition>[<path>]")
>      subparser.add_argument("-n", "--native-sysroot",
> -                        help="path to the native sysroot containing the tools")
> +                        help="path to the native sysroot containing the tools (parted and mtools) to use.")
>  
>  def wic_init_parser_rm(subparser):
>      subparser.add_argument("path", type=imgpathtype,
> -                        help="path: <image>:<vfat partition><path>")
> +                        help="image spec: <image>[:<partition>[<path>]")
>      subparser.add_argument("-n", "--native-sysroot",
> -                        help="path to the native sysroot containing the tools")
> +                        help="path to the native sysroot containing the tools (parted and mtools) to use.")
>  
>  def expandtype(rules):
>      """
> @@ -448,59 +399,56 @@ def wic_init_parser_write(subparser):
>      subparser.add_argument("-e", "--expand", type=expandtype,
>                          help="expand rules: auto or <partition>:<size>[,<partition>:<size>]")
>      subparser.add_argument("-n", "--native-sysroot",
> -                        help="path to the native sysroot containing the tools")
> -
> -def wic_init_parser_help(subparser):
> -    helpparsers = subparser.add_subparsers(dest='help_topic', help=hlp.wic_usage)
> -    for helptopic in helptopics:
> -        helpparsers.add_parser(helptopic, help=helptopics[helptopic][2])
> -    return
> +                        help="path to the native sysroot containing the tools (parted and mtools) to use.")
>  
>  
>  subcommands = {
>      "create":    [wic_create_subcommand,
> -                  hlp.wic_create_usage,
> -                  hlp.wic_create_help,
> -                  wic_init_parser_create],
> +                  hlp.wic_create_description,
> +                  wic_init_parser_create,
> +                  hlp.wic_create_short_description],
>      "list":      [wic_list_subcommand,
> -                  hlp.wic_list_usage,
> -                  hlp.wic_list_help,
> -                  wic_init_parser_list],
> +                  hlp.wic_list_description,
> +                  wic_init_parser_list,
> +                  hlp.wic_list_short_description],
>      "ls":        [wic_ls_subcommand,
> -                  hlp.wic_ls_usage,
> -                  hlp.wic_ls_help,
> -                  wic_init_parser_ls],
> +                  hlp.wic_ls_description,
> +                  wic_init_parser_ls,
> +                  hlp.wic_ls_short_description],
>      "cp":        [wic_cp_subcommand,
> -                  hlp.wic_cp_usage,
> -                  hlp.wic_cp_help,
> -                  wic_init_parser_cp],
> +                  hlp.wic_cp_description,
> +                  wic_init_parser_cp,
> +                  hlp.wic_cp_short_description],
>      "rm":        [wic_rm_subcommand,
> -                  hlp.wic_rm_usage,
> -                  hlp.wic_rm_help,
> -                  wic_init_parser_rm],
> +                  hlp.wic_rm_description,
> +                  wic_init_parser_rm,
> +                  hlp.wic_rm_short_description],
>      "write":     [wic_write_subcommand,
> -                  hlp.wic_write_usage,
> -                  hlp.wic_write_help,
> -                  wic_init_parser_write],
> -    "help":      [wic_help_subcommand,
> -                  wic_help_topic_usage,
> -                  hlp.wic_help_help,
> -                  wic_init_parser_help]
> +                  hlp.wic_write_description,
> +                  wic_init_parser_write,
> +                  hlp.wic_write_short_description],
>  }
>  
> +def invoke_subcommand(args, parser, main_command_usage, subcommands):
> +        subcmd = subcommands.get(args.command, subcommand_error)
> +        usage = subcmd[1]
> +        subcmd[0](args, usage)
> +
>  
>  def init_parser(parser):
>      parser.add_argument("--version", action="version",
>          version="%(prog)s {version}".format(version=__version__))
> -    subparsers = parser.add_subparsers(dest='command', help=hlp.wic_usage)
> +    subparsers = parser.add_subparsers(dest='command')
> +    helpparser = subparsers.add_parser("help", help="Display usages")
>      for subcmd in subcommands:
> -        subparser = subparsers.add_parser(subcmd, help=subcommands[subcmd][2])
> -        subcommands[subcmd][3](subparser)
> +        subparser = subparsers.add_parser(subcmd, help=subcommands[subcmd][3], formatter_class=argparse.RawDescriptionHelpFormatter, description=subcommands[subcmd][1])
> +        subcommands[subcmd][2](subparser)
> +
>  
>  
>  def main(argv):
>      parser = argparse.ArgumentParser(
> -        description="wic version %s" % __version__)
> +        description="Create a customized OpenEmbedded image. Wic version %s" % __version__)
>  
>      init_parser(parser)
>  
> @@ -508,22 +456,15 @@ def main(argv):
>  
>      if "command" in vars(args):
>          if args.command == "help":
> -            if args.help_topic is None:
> -                parser.print_help()
> -                print()
> -                print("Please specify a help topic")
> -            elif args.help_topic in helptopics:
> -                hlpt = helptopics[args.help_topic]
> -                hlpt[0](hlpt[1], hlpt[2])
> -            return 0
> -
> -    return hlp.invoke_subcommand(args, parser, hlp.wic_help_usage, subcommands)
> -
> +            parser.print_help()
> +            print()
> +        else:
> +            subcmd = subcommands.get(args.command)
> +            subcmd[0](args)
>  
>  if __name__ == "__main__":
>      try:
>          sys.exit(main(sys.argv[1:]))
>      except WicError as err:
> -        print()
>          logger.error(err)
>          sys.exit(1)
> -- 
> 2.7.4
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

-- 
--
Regards,
Ed

