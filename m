Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id DE1DA65C9C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 13:05:46 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 18 May 2015 06:05:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,453,1427785200"; d="scan'208";a="731125162"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga002.jf.intel.com with ESMTP; 18 May 2015 06:05:40 -0700
Message-ID: <1431954339.9508.30.camel@linux.intel.com>
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Mon, 18 May 2015 16:05:39 +0300
In-Reply-To: <4904789.A7T5g0hHDe@peggleto-mobl.ger.corp.intel.com>
References: <1431350231-29495-1-git-send-email-markus.lehtonen@linux.intel.com>
	<1431350231-29495-12-git-send-email-markus.lehtonen@linux.intel.com>
	<4904789.A7T5g0hHDe@peggleto-mobl.ger.corp.intel.com>
X-Mailer: Evolution 3.12.11 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 11/11] devtool: deploy plugin: wrap long lines in code
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
X-List-Received-Date: Mon, 18 May 2015 13:05:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi,

On Tue, 2015-05-12 at 16:20 +0100, Paul Eggleton wrote:
> On Monday 11 May 2015 16:17:11 Markus Lehtonen wrote:
> > Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
> > ---
> >  scripts/lib/devtool/deploy.py | 99
> > +++++++++++++++++++++++++++++++------------ 1 file changed, 72
> > insertions(+), 27 deletions(-)
> > 
> > diff --git a/scripts/lib/devtool/deploy.py b/scripts/lib/devtool/deploy.py
> > index 078c74b..f6ae433 100644
> > --- a/scripts/lib/devtool/deploy.py
> > +++ b/scripts/lib/devtool/deploy.py
> > @@ -45,17 +45,23 @@ def deploy(args, config, basepath, workspace):
> >      deploy_dir = os.path.join(basepath, 'target_deploy', args.target)
> >      deploy_file = os.path.join(deploy_dir, args.recipename + '.list')
> > 
> > -    stdout, _ = exec_build_env_command(config.init_path, basepath, 'bitbake
> > -e %s' % args.recipename, shell=True) +    stdout, _ =
> > exec_build_env_command(config.init_path, basepath, +                       
> >                'bitbake -e %s' % args.recipename, +                        
> >               shell=True)
> >      recipe_outdir = re.search(r'^D="(.*)"', stdout, re.MULTILINE).group(1)
> >      if not os.path.exists(recipe_outdir) or not os.listdir(recipe_outdir):
> > -        logger.error('No files to deploy - have you built the %s recipe? If
> > so, the install step has not installed any files.' % args.recipename) +    
> >    logger.error('No files to deploy - have you built the %s recipe? If ' + 
> >                    'so, the install step has not installed any files.' % + 
> >                    args.recipename)
> >          return -1
> > 
> >      if args.dry_run:
> > -        print('Files to be deployed for %s on target %s:' %
> > (args.recipename, args.target)) +        print('Files to be deployed for %s
> > on target %s:' %
> > +              (args.recipename, args.target))
> >          for root, _, files in os.walk(recipe_outdir):
> >              for fn in files:
> > -                print('  %s' % os.path.join(destdir, os.path.relpath(root,
> > recipe_outdir), fn)) +                print('  %s' % os.path.join(
> > +                        destdir, os.path.relpath(root, recipe_outdir), fn))
> > return 0
> > 
> >      if os.path.exists(deploy_file):
> > @@ -65,12 +71,16 @@ def deploy(args, config, basepath, workspace):
> > 
> >      extraoptions = ''
> >      if args.no_host_check:
> > -        extraoptions += '-o UserKnownHostsFile=/dev/null -o
> > StrictHostKeyChecking=no' +        extraoptions += '-o
> > UserKnownHostsFile=/dev/null'
> > +        extraoptions += ' -o StrictHostKeyChecking=no'
> >      if not args.show_status:
> >          extraoptions += ' -q'
> > -    ret = subprocess.call('scp -r %s %s/* %s:%s' % (extraoptions,
> > recipe_outdir, args.target, destdir), shell=True) +    ret =
> > subprocess.call('scp -r %s %s/* %s:%s' %
> > +                          (extraoptions, recipe_outdir, args.target,
> > destdir), +                          shell=True)
> >      if ret != 0:
> > -        logger.error('Deploy failed - rerun with -s to get a complete error
> > message') +        logger.error('Deploy failed - rerun with -s to get a
> > complete error ' +                     'message')
> >          return ret
> > 
> >      logger.info('Successfully deployed %s' % recipe_outdir)
> > @@ -81,7 +91,8 @@ def deploy(args, config, basepath, workspace):
> >      files_list = []
> >      for root, _, files in os.walk(recipe_outdir):
> >          for filename in files:
> > -            filename = os.path.relpath(os.path.join(root, filename),
> > recipe_outdir) +            filename = os.path.relpath(os.path.join(root,
> > filename), +                                       recipe_outdir)
> >              files_list.append(os.path.join(destdir, filename))
> > 
> >      with open(deploy_file, 'w') as fobj:
> > @@ -91,13 +102,15 @@ def deploy(args, config, basepath, workspace):
> > 
> >  def undeploy(args, config, basepath, workspace):
> >      """Entry point for the devtool 'undeploy' subcommand"""
> > -    deploy_file = os.path.join(basepath, 'target_deploy', args.target,
> > args.recipename + '.list') +    deploy_file = os.path.join(basepath,
> > 'target_deploy', args.target, +                              
> > args.recipename + '.list')
> >      if not os.path.exists(deploy_file):
> >          logger.error('%s has not been deployed' % args.recipename)
> >          return -1
> > 
> >      if args.dry_run:
> > -        print('Previously deployed files to be un-deployed for %s on target
> > %s:' % (args.recipename, args.target)) +        print('Previously deployed
> > files to be un-deployed for %s on target ' +              '%s:' %
> > (args.recipename, args.target))
> >          with open(deploy_file, 'r') as f:
> >              for line in f:
> >                  print('  %s' % line.rstrip())
> > @@ -105,39 +118,71 @@ def undeploy(args, config, basepath, workspace):
> > 
> >      extraoptions = ''
> >      if args.no_host_check:
> > -        extraoptions += '-o UserKnownHostsFile=/dev/null -o
> > StrictHostKeyChecking=no' +        extraoptions += '-o
> > UserKnownHostsFile=/dev/null '
> > +        extraoptions += ' -o StrictHostKeyChecking=no'
> >      if not args.show_status:
> >          extraoptions += ' -q'
> > 
> > -    ret = subprocess.call("scp %s %s %s:/tmp" % (extraoptions, deploy_file,
> > args.target), shell=True) +    ret = subprocess.call("scp %s %s %s:/tmp" %
> > +                          (extraoptions, deploy_file, args.target),
> > shell=True) if ret != 0:
> > -        logger.error('Failed to copy file list to %s - rerun with -s to get
> > a complete error message' % args.target) +        logger.error('Failed to
> > copy file list to %s - rerun with -s to get a ' +                    
> > 'complete error message' % args.target)
> >          return -1
> > 
> > -    ret = subprocess.call("ssh %s %s 'xargs -n1 rm -f </tmp/%s'" %
> > (extraoptions, args.target, os.path.basename(deploy_file)), shell=True) +  
> >  ret = subprocess.call(
> > +            "ssh %s %s 'xargs -n1 rm -f </tmp/%s'" %
> > +            (extraoptions, args.target, os.path.basename(deploy_file)),
> > +            shell=True)
> >      if ret == 0:
> >          logger.info('Successfully undeployed %s' % args.recipename)
> >          os.remove(deploy_file)
> >      else:
> > -        logger.error('Undeploy failed - rerun with -s to get a complete
> > error message') +        logger.error('Undeploy failed - rerun with -s to
> > get a complete error ' +                     'message')
> > 
> >      return ret
> > 
> > 
> >  def register_commands(subparsers, context):
> >      """Register devtool subcommands from the deploy plugin"""
> > -    parser_deploy = subparsers.add_parser('deploy-target', help='Deploy
> > recipe output files to live target machine') -   
> > parser_deploy.add_argument('recipename', help='Recipe to deploy') -   
> > parser_deploy.add_argument('target', help='Live target machine running an
> > ssh server: user@hostname[:destdir]') -    parser_deploy.add_argument('-c',
> > '--no-host-check', help='Disable ssh host key checking',
> > action='store_true') -    parser_deploy.add_argument('-s', '--show-status',
> > help='Show progress/status output', action='store_true') -   
> > parser_deploy.add_argument('-n', '--dry-run', help='List files to be
> > deployed only', action='store_true') +    parser_deploy =
> > subparsers.add_parser(
> > +            'deploy-target',
> > +            help='Deploy recipe output files to live target machine')
> > +    parser_deploy.add_argument(
> > +            'recipename',
> > +            help='Recipe to deploy')
> > +    parser_deploy.add_argument(
> > +            'target',
> > +            help='Live target machine running an ssh server: '
> > +                 'user@hostname[:destdir]')
> > +    parser_deploy.add_argument(
> > +            '-c', '--no-host-check',
> > +            help='Disable ssh host key checking', action='store_true')
> > +    parser_deploy.add_argument(
> > +            '-s', '--show-status',
> > +            help='Show progress/status output', action='store_true')
> > +    parser_deploy.add_argument(
> > +            '-n', '--dry-run',
> > +            help='List files to be deployed only', action='store_true')
> >      parser_deploy.set_defaults(func=deploy)
> > 
> > -    parser_undeploy = subparsers.add_parser('undeploy-target',
> > help='Undeploy recipe output files in live target machine') -   
> > parser_undeploy.add_argument('recipename', help='Recipe to undeploy') -   
> > parser_undeploy.add_argument('target', help='Live target machine running an
> > ssh server: user@hostname') -    parser_undeploy.add_argument('-c',
> > '--no-host-check', help='Disable ssh host key checking',
> > action='store_true') -    parser_undeploy.add_argument('-s',
> > '--show-status', help='Show progress/status output', action='store_true') -
> >    parser_undeploy.add_argument('-n', '--dry-run', help='List files to be
> > undeployed only', action='store_true') +    parser_undeploy =
> > subparsers.add_parser(
> > +            'undeploy-target',
> > +            help='Undeploy recipe output files in live target machine')
> > +    parser_undeploy.add_argument(
> > +            'recipename',
> > +            help='Recipe to undeploy')
> > +    parser_undeploy.add_argument(
> > +            'target',
> > +            help='Live target machine running an ssh server:
> > user@hostname') +    parser_undeploy.add_argument(
> > +            '-c', '--no-host-check',
> > +            help='Disable ssh host key checking', action='store_true')
> > +    parser_undeploy.add_argument(
> > +            '-s', '--show-status',
> > +            help='Show progress/status output', action='store_true')
> > +    parser_undeploy.add_argument(
> > +            '-n', '--dry-run',
> > +            help='List files to be undeployed only', action='store_true')
> >      parser_undeploy.set_defaults(func=undeploy)
> 
> I have to be honest and say I don't find that all of these line wrapping 
> changes improve readability. Maybe I am biased because I use a fairly large 
> editing window - what's your editing setup?

On my laptop I usually have quite narrow windows (I guess around 100 or
so). This also has to do with PEP8 (the Python style guide):
https://www.python.org/dev/peps/pep-0008/#id14


Thanks,
  Markus


