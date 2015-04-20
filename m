Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with SMTP id 76A946AC24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Apr 2015 12:31:06 +0000 (UTC)
Received: (qmail 10626 invoked by uid 1003); 20 Apr 2015 12:31:07 -0000
Received: from unknown (HELO ?192.168.11.115?)
	(philip@opensdr.com@71.171.14.122)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	20 Apr 2015 12:31:06 -0000
Message-ID: <5534F189.3010901@balister.org>
Date: Mon, 20 Apr 2015 08:31:05 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: openembedded-core <openembedded-core@lists.openembedded.org>
References: <55311968.50404@balister.org>
In-Reply-To: <55311968.50404@balister.org>
X-Forwarded-Message-Id: <55311968.50404@balister.org>
Subject: Re: [wic][PATCH] wic: try to find bitbake using find_executable API
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
X-List-Received-Date: Mon, 20 Apr 2015 12:31:08 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

I forgot to cc the list. Unfortunately, this led to the commit going in
with the reference to oe-classic.

Please people, get your terminology correct. The word soup in the wold
is insane.

Philip


-------- Forwarded Message --------
Subject: Re: [OE-core] [wic][PATCH] wic: try to find bitbake using
find_executable API
Date: Fri, 17 Apr 2015 10:32:08 -0400
From: Philip Balister <philip@balister.org>
To: Ed Bartosh <ed.bartosh@linux.intel.com>



On 04/17/2015 09:19 AM, Ed Bartosh wrote:
> From: Ed Bartosh <eduard.bartosh@intel.com>
> 
> Current wic code was assuming that bitbake directory is on the
> same level as scripts, which is not the case for oe classic.

oe classic is the ancient meta-data.

I think you mean the assumption for people who do not install bitbake
inside an openembedded-core checkout.

Philip

> 
> Using find_executable bitbake location should be determined better
> as this API uss $PATH to search for executables.
> 
> Fixes [YOCTO #7621]
> 
> Signed-off-by: Ed Bartosh <eduard.bartosh@intel.com>
> Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
> ---
>  scripts/wic | 20 +++++++++++++++-----
>  1 file changed, 15 insertions(+), 5 deletions(-)
> 
> diff --git a/scripts/wic b/scripts/wic
> index 5bedd90..7d388c9 100755
> --- a/scripts/wic
> +++ b/scripts/wic
> @@ -36,19 +36,25 @@ import os
>  import sys
>  import optparse
>  import logging
> +from distutils import spawn
>  
>  # External modules
>  scripts_path = os.path.abspath(os.path.dirname(__file__))
>  lib_path = scripts_path + '/lib'
> -bitbake_path = os.path.join(scripts_path, '../bitbake/lib')
> -sys.path = sys.path + [lib_path, bitbake_path]
> +sys.path.append(lib_path)
> +
> +bitbake_exe = spawn.find_executable('bitbake')
> +if bitbake_exe:
> +    bitbake_path = os.path.join(os.path.dirname(bitbake_exe), '../lib')
> +    sys.path.append(bitbake_path)
> +    from bb import cookerdata
> +    from bb.main import bitbake_main, BitBakeConfigParameters
> +else:
> +    bitbake_main = None
>  
>  from image.help import *
>  from image.engine import *
>  
> -from bb import cookerdata
> -from bb.main import bitbake_main, BitBakeConfigParameters
> -
>  def rootfs_dir_to_args(krootfs_dir):
>      """
>      Get a rootfs_dir dict and serialize to string
> @@ -109,6 +115,10 @@ def wic_create_subcommand(args, usage_str):
>          parser.print_help()
>          sys.exit(1)
>  
> +    if options.build_rootfs and not bitbake_main:
> +        logging.error("Can't build roofs as bitbake is not in the $PATH")
> +        sys.exit(1)
> +
>      if not options.image_name and not (options.rootfs_dir and
>                                         options.bootimg_dir and
>                                         options.kernel_dir and
> 



