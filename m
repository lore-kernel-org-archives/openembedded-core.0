Return-Path: <tobias.hagelborn@axis.com>
X-Greylist: delayed 419 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 24 Aug 2017 13:22:34 UTC
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 9D73A78227
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Aug 2017 13:22:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id E86D32E1F6;
	Thu, 24 Aug 2017 15:15:34 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id OZOYRnjbGTKb; Thu, 24 Aug 2017 15:15:33 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bes.se.axis.com (Postfix) with ESMTPS id C00B42E39B;
	Thu, 24 Aug 2017 15:15:33 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 726B31E0B8;
	Thu, 24 Aug 2017 15:15:33 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 643C51E0B7;
	Thu, 24 Aug 2017 15:15:33 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Thu, 24 Aug 2017 15:15:33 +0200 (CEST)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by thoth.se.axis.com (Postfix) with ESMTP id 542E41C59;
	Thu, 24 Aug 2017 15:15:33 +0200 (CEST)
Received: from [10.94.62.1] (10.0.5.60) by XBOX02.axis.com (10.0.5.16) with
	Microsoft SMTP Server (TLS) id 15.0.1263.5;
	Thu, 24 Aug 2017 15:15:33 +0200
To: Jussi Kukkonen <jussi.kukkonen@intel.com>, Tobias Hagelborn
	<tobiasha@axis.com>
References: <1497944565-7498-1-git-send-email-tobiasha@axis.com>
	<1497944565-7498-4-git-send-email-tobiasha@axis.com>
	<CAHiDW_HETPL7K_UV6Vc-DqEepBAaxxMM2mVQLTmwfBA-dewdoA@mail.gmail.com>
From: Tobias Hagelborn <tobias.hagelborn@axis.com>
Message-ID: <5e3b75cd-d747-be56-f84b-7b83305369e2@axis.com>
Date: Thu, 24 Aug 2017 15:15:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAHiDW_HETPL7K_UV6Vc-DqEepBAaxxMM2mVQLTmwfBA-dewdoA@mail.gmail.com>
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: XBOX01.axis.com (10.0.5.15) To XBOX02.axis.com (10.0.5.16)
X-TM-AS-GCONF: 00
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 4/4] devtool: deploy-target: Support stripped libs and execs
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
X-List-Received-Date: Thu, 24 Aug 2017 13:22:35 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 06/21/2017 12:09 PM, Jussi Kukkonen wrote:
> 
> 
> On 20 June 2017 at 10:42, Tobias Hagelborn <tobias.hagelborn@axis.com 
> <mailto:tobias.hagelborn@axis.com>> wrote:
>  >
>  > New devtool deploy-target option --strip which enables deploying
>  > stripped binaries, saving some space on target.
>  >
>  > * Copies the files of ${D} into a new directory and strips them in place
>  > * Used oe.package.strip_execs for stripping directory
>  > * Added devtool.conf option "strip" for changing default behavior
>  >
>  > Config example:
>  > [Deploy]
>  > strip = true
>  >
>  > [YOCTO #11227]
>  >
>  > Signed-off-by: Tobias Hagelborn <tobiasha@axis.com 
> <mailto:tobiasha@axis.com>>
>  > ---
>  >  scripts/lib/devtool/deploy.py | 32 ++++++++++++++++++++++++++++----
>  >  1 file changed, 28 insertions(+), 4 deletions(-)
>  >
>  > diff --git a/scripts/lib/devtool/deploy.py 
> b/scripts/lib/devtool/deploy.py
>  > index 04c34cb..96b877e 100644
>  > --- a/scripts/lib/devtool/deploy.py
>  > +++ b/scripts/lib/devtool/deploy.py
>  > @@ -16,12 +16,16 @@
>  >  # 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
>  >  """Devtool plugin containing the deploy subcommands"""
>  >
>  > +import logging
>  >  import os
>  > +import shutil
>  >  import subprocess
>  > -import logging
>  >  import tempfile
>  > -import shutil
>  > +
>  > +import bb.utils
>  >  import argparse_oe
>  > +import oe
>  > +
>  >  from devtool import exec_fakeroot, setup_tinfoil, 
> check_workspace_recipe, DevtoolError
>  >
>  >  logger = logging.getLogger('devtool')
>  > @@ -140,9 +144,9 @@ def _prepare_remote_script(deploy, verbose=False, 
> dryrun=False, undeployall=Fals
>  >      return '\n'.join(lines)
>  >
>  >
>  > +
>  >  def deploy(args, config, basepath, workspace):
>  >      """Entry point for the devtool 'deploy' subcommand"""
>  > -    import re
>  >      import math
>  >      import oe.recipeutils
>  >
>  > @@ -170,6 +174,17 @@ def deploy(args, config, basepath, workspace):
>  >                              'recipe? If so, the install step has not 
> installed '
>  >                              'any files.' % args.recipename)
>  >
>  > +        if args.strip and not args.dry_run:
>  > +            # Fakeroot copy to new destination
>  > +            srcdir = recipe_outdir
>  > +            recipe_outdir = os.path.join(rd.getVar('WORKDIR', True), 
> 'deploy-target-stripped')
>  > +            if os.path.isdir(recipe_outdir):
>  > +                bb.utils.remove(recipe_outdir, True)
>  > +            exec_fakeroot(rd, "cp -af %s %s" % (os.path.join(srcdir, 
> '.'), recipe_outdir), shell=True)
>  > +            os.environ['PATH'] = ':'.join([os.environ['PATH'], 
> rd.getVar('PATH', True) or ''])
>  > +            oe.package.strip_execs(args.recipename, recipe_outdir, 
> rd.getVar('STRIP', True), rd.getVar('libdir', True),
>  > +                        rd.getVar('base_libdir', True))
>  > +
>  >          filelist = []
>  >          ftotalsize = 0
>  >          for root, _, files in os.walk(recipe_outdir):
>  > @@ -189,7 +204,6 @@ def deploy(args, config, basepath, workspace):
>  >                  print('  %s' % item)
>  >              return 0
>  >
>  > -
>  >          extraoptions = ''
>  >          if args.no_host_check:
>  >              extraoptions += '-o UserKnownHostsFile=/dev/null -o 
> StrictHostKeyChecking=no'
>  > @@ -301,6 +315,7 @@ def undeploy(args, config, basepath, workspace):
>  >
>  >  def register_commands(subparsers, context):
>  >      """Register devtool subcommands from the deploy plugin"""
>  > +
>  >      parser_deploy = subparsers.add_parser('deploy-target',
>  >                                            help='Deploy recipe output 
> files to live target machine',
>  >                                            description='Deploys a 
> recipe\'s build output (i.e. the output of the do_install task) to a 
> live target machine over ssh. By default, any existing files will be 
> preserved instead of being overwritten and will be restored if you run 
> devtool undeploy-target. Note: this only deploys the recipe itself and 
> not any runtime dependencies, so it is assumed that those have been 
> installed on the target beforehand.',
>  > @@ -313,6 +328,15 @@ def register_commands(subparsers, context):
>  >      parser_deploy.add_argument('-p', '--no-preserve', help='Do not 
> preserve existing files', action='store_true')
>  >      parser_deploy.add_argument('--no-check-space', help='Do not 
> check for available space before deploying', action='store_true')
>  >      parser_deploy.add_argument('-P', '--port', default='22', 
> help='Port to use for connection to the target')
>  > +
>  > +    strip_opts = 
> parser_deploy.add_mutually_exclusive_group(required=False)
>  > +    strip_opts.add_argument('-S', '--strip',
>  > +                               help='Strip executables prior to 
> deploying (default: %(default)s). '
>  > +                                    'The default value of this 
> option can be controlled by setting the strip option in the [Deploy] 
> section to True or False.',
>  > +                               
> default=oe.types.boolean(context.config.get('Deploy', 'strip', 
> default='0')),
>  > +                               action='store_true')
> 
> Autobuilder is complaining about this:
> 
> Exception: bb.process.ExecutionError: Execution of 'devtool --bbpath 
> /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-64/build/meta-poky:/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-64/build/build:/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-64/build/meta:/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-64/build/meta-yocto-bsp 
> --basepath 
> /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-64/build/build/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/sdk-ext/image//opt/poky/2.3 
> create-workspace --create-only 
> /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-64/build/build/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/sdk-ext/image//opt/poky/2.3/workspace' 
> failed with exit code 1:
> Traceback (most recent call last):
>    File 
> "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-64/build/scripts/devtool", 
> line 351, in <module>
>      ret = main()
>    File 
> "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-64/build/scripts/devtool", 
> line 329, in main
>      plugin.register_commands(subparsers, context)
>    File 
> "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-64/build/scripts/lib/devtool/deploy.py", 
> line 336, in register_commands
>      default=oe.types.boolean(context.config.get('Deploy', 'strip', 
> default='0')),
> AttributeError: module 'oe' has no attribute 'types'
> 
> See 
> https://autobuilder.yocto.io/builders/nightly-x86-64/builds/333/steps/BuildImages_2/logs/stdio 
> for context.
> 
> 
>  > +    strip_opts.add_argument('--no-strip', help='Do not strip 
> executables prior to deploy', dest='strip', action='store_false')
>  > +
>  >      parser_deploy.set_defaults(func=deploy)
>  >
>  >      parser_undeploy = subparsers.add_parser('undeploy-target',
>  > --
>  > 2.1.4
>  >
>  > --
>  > _______________________________________________
>  > Openembedded-core mailing list
>  > Openembedded-core@lists.openembedded.org 
> <mailto:Openembedded-core@lists.openembedded.org>
>  > http://lists.openembedded.org/mailman/listinfo/openembedded-core

Thanks for pointing this out Jussi,

I will send an updated version.

Cheers
Tobias

