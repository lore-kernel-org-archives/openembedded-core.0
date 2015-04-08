Return-Path: <joaohf@gmail.com>
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id 5ABB460089
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Apr 2015 22:18:42 +0000 (UTC)
Received: by qkgx75 with SMTP id x75so98860153qkg.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Apr 2015 15:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=lCIGQYxOfT0xp/ERpqK4aqN+fEq7qGC8QeRf/yOY7Cw=;
	b=Fq1MBWUGa4H3w8M+P/p0QnmR/eP++cdfAQMnt5oMUY6eWTkW4gUdgwdqXIwJusIi9N
	y8UQUB77sjvPWCxUb28A8nUQ6a4+sc5wgodZ1FnrwoJiQjbAXUrMOidvu/JH1CSl5XAF
	l4pUPpe4oqLJBK1weeqbIOVE1qJO/ZxSH0MUKsZuOa/JIk5qEstECw44f1omW+Cc3Jld
	Zip1V3L4bEs8iYHN09N1NKDP2e8CCfhKTuFtXogRudX/hXQK826biDoYG45WvhQOXocD
	57UhmQLx79IrRtb4cjff8P2ByojdKE9OBhw2qT3hwpRq+gQqW8SgD+z0DNZPFmqzIVSG
	5uRQ==
X-Received: by 10.55.55.85 with SMTP id e82mr54222292qka.2.1428531524029;
	Wed, 08 Apr 2015 15:18:44 -0700 (PDT)
Received: from [192.168.0.16] ([201.53.207.14])
	by mx.google.com with ESMTPSA id r198sm4625408qha.2.2015.04.08.15.18.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Apr 2015 15:18:43 -0700 (PDT)
Message-ID: <5525A940.5040600@gmail.com>
Date: Wed, 08 Apr 2015 19:18:40 -0300
From: =?windows-1252?Q?Jo=E3o_Henrique_Ferreira_de_Freitas?= <joaohf@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1428400661-19372-1-git-send-email-ed.bartosh@linux.intel.com>
In-Reply-To: <1428400661-19372-1-git-send-email-ed.bartosh@linux.intel.com>
Subject: Re: [wic][PATCH] wic: Implement --build-rootfs command line option
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
X-List-Received-Date: Wed, 08 Apr 2015 22:18:43 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit


Hi Ed,

I liked.

Two points:

- How about if user sets INHERIT = "rm_work"? I mean the image recipe 
will be rm, right? I always put my images in RM_WORK_EXCLUDE so wic can 
use it.

- What will be the behavior if: wic create test-image-4Gb -e test-image 
--rootfs rootfs1=test-image --rootfs rootfs2=bringup-image -f. A 
believed that only 'test-image' will be build. Right?

Thanks.

On 07/04/2015 06:57, Ed Bartosh wrote:
> -f/--build-rootfs option makes wic to run bitbake <image> to
> produce rootfs. This option requires image name to be specified
> with -e/--image-name.
>
> Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
> ---
>   scripts/lib/image/help.py | 10 ++++++----
>   scripts/wic               | 25 ++++++++++++++++++++++---
>   2 files changed, 28 insertions(+), 7 deletions(-)
>
> diff --git a/scripts/lib/image/help.py b/scripts/lib/image/help.py
> index e1eb265..e365a07 100644
> --- a/scripts/lib/image/help.py
> +++ b/scripts/lib/image/help.py
> @@ -111,7 +111,7 @@ wic_create_usage = """
>               [-i <JSON PROPERTY FILE> | --infile <JSON PROPERTY_FILE>]
>               [-e | --image-name] [-s, --skip-build-check] [-D, --debug]
>               [-r, --rootfs-dir] [-b, --bootimg-dir]
> -            [-k, --kernel-dir] [-n, --native-sysroot]
> +            [-k, --kernel-dir] [-n, --native-sysroot] [-f, --build-rootfs]
>   
>    This command creates an OpenEmbedded image based on the 'OE kickstart
>    commands' found in the <wks file>.
> @@ -132,7 +132,7 @@ SYNOPSIS
>           [-i <JSON PROPERTY FILE> | --infile <JSON PROPERTY_FILE>]
>           [-e | --image-name] [-s, --skip-build-check] [-D, --debug]
>           [-r, --rootfs-dir] [-b, --bootimg-dir]
> -        [-k, --kernel-dir] [-n, --native-sysroot]
> +        [-k, --kernel-dir] [-n, --native-sysroot] [-f, --build-rootfs]
>   
>   DESCRIPTION
>       This command creates an OpenEmbedded image based on the 'OE
> @@ -167,6 +167,8 @@ DESCRIPTION
>       The -n option is used to specify the path to the native sysroot
>       containing the tools to use to build the image.
>   
> +    The -f option is used to build rootfs by running "bitbake <image>"
> +
>       The -s option is used to skip the build check.  The build check is
>       a simple sanity check used to determine whether the user has
>       sourced the build environment so that the -e option can operate
> @@ -528,8 +530,8 @@ DESCRIPTION
>          usage: wic create <wks file or image name> [-o <DIRNAME> | ...]
>               [-i <JSON PROPERTY FILE> | --infile <JSON PROPERTY_FILE>]
>               [-e | --image-name] [-s, --skip-build-check] [-D, --debug]
> -            [-r, --rootfs-dir] [-b, --bootimg-dir]
> -            [-k, --kernel-dir] [-n, --native-sysroot]
> +            [-r, --rootfs-dir] [-b, --bootimg-dir] [-k, --kernel-dir]
> +            [-n, --native-sysroot] [-f, --build-rootfs]
>   
>          This command creates an OpenEmbedded image based on the 'OE
>          kickstart commands' found in the <wks file>.
> diff --git a/scripts/wic b/scripts/wic
> index e7df60f..feff302 100755
> --- a/scripts/wic
> +++ b/scripts/wic
> @@ -40,11 +40,15 @@ import logging
>   # External modules
>   scripts_path = os.path.abspath(os.path.dirname(os.path.abspath(sys.argv[0])))
>   lib_path = scripts_path + '/lib'
> -sys.path = sys.path + [lib_path]
> +bitbake_path = os.path.join(scripts_path, '../bitbake/lib')
> +sys.path = sys.path + [lib_path, bitbake_path]
>   
>   from image.help import *
>   from image.engine import *
>   
> +from bb import cookerdata
> +from bb.main import bitbake_main, BitBakeConfigParameters
> +
>   def rootfs_dir_to_args(krootfs_dir):
>       """
>       Get a rootfs_dir dict and serialize to string
> @@ -94,6 +98,7 @@ def wic_create_subcommand(args, usage_str):
>                         action = "store", help = "path to the native sysroot containing the tools to use to build the image")
>       parser.add_option("-p", "--skip-build-check", dest = "build_check",
>                         action = "store_false", default = True, help = "skip the build check")
> +    parser.add_option("-f", "--build-rootfs", action="store_true", help = "build rootfs")
>       parser.add_option("-D", "--debug", dest = "debug", action = "store_true",
>                         default = False, help = "output debug information")
>   
> @@ -123,8 +128,6 @@ def wic_create_subcommand(args, usage_str):
>           else:
>               print "Done.\n"
>   
> -    print "Creating image(s)...\n"
> -
>       bitbake_env_lines = find_bitbake_env_lines(options.image_name)
>       if not bitbake_env_lines:
>           print "Couldn't get bitbake environment, exiting."
> @@ -134,9 +137,24 @@ def wic_create_subcommand(args, usage_str):
>       bootimg_dir = ""
>   
>       if options.image_name:
> +        if options.build_rootfs:
> +            argv = ["bitbake", options.image_name]
> +            if options.debug:
> +                argv.append("--debug")
> +
> +            print "Building rootfs...\n"
> +            if bitbake_main(BitBakeConfigParameters(argv),
> +                            cookerdata.CookerConfiguration()):
> +                sys.exit(1)
> +
>           (rootfs_dir, kernel_dir, bootimg_dir, native_sysroot) \
>               = find_artifacts(options.image_name)
>   
> +    else:
> +        if options.build_rootfs:
> +            print "Image name is not specified, exiting. (Use -e/--image-name to specify it)\n"
> +            sys.exit(1)
> +
>       wks_file = args[0]
>   
>       if not wks_file.endswith(".wks"):
> @@ -194,6 +212,7 @@ def wic_create_subcommand(args, usage_str):
>   
>       rootfs_dir = rootfs_dir_to_args(krootfs_dir)
>   
> +    print "Creating image(s)...\n"
>       wic_create(args, wks_file, rootfs_dir, bootimg_dir, kernel_dir,
>                  native_sysroot, scripts_path, image_output_dir,
>                  options.debug, options.properties_file)


