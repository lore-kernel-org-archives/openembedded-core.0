Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 087687CB9B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 04:39:02 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Feb 2019 20:39:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,398,1544515200"; d="scan'208";a="135437744"
Received: from boonguan-mobl1.gar.corp.intel.com (HELO localhost.localdomain)
	([10.255.148.245])
	by FMSMGA003.fm.intel.com with ESMTP; 21 Feb 2019 20:39:01 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Feb 2019 17:38:59 +1300
Message-ID: <20680669.ZRBGvceoEQ@localhost.localdomain>
Organization: Intel Corporation
In-Reply-To: <20190221131045.20591-1-o.mandel@menlosystems.com>
References: <20190221131045.20591-1-o.mandel@menlosystems.com>
MIME-Version: 1.0
Cc: Olaf Mandel <o.mandel@menlosystems.com>
Subject: Re: [PATCH] devtool: deploy-target: allow use of alternate ssh
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
X-List-Received-Date: Fri, 22 Feb 2019 04:39:03 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Looks good to me.

Acked-by: Paul Eggleton <paul.eggleton@linux.intel.com>

On Friday, 22 February 2019 2:10:45 AM NZDT Olaf Mandel wrote:
> Allow the use of an alternate SSH executable for deploy-target and
> undeploy-target. The command can be specified with -e / --ssh-exec.
> 
> Signed-off-by: Olaf Mandel <o.mandel@menlosystems.com>
> ---
>  scripts/lib/devtool/deploy.py | 20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/scripts/lib/devtool/deploy.py b/scripts/lib/devtool/deploy.py
> index 886004b5d0..f345f31b7b 100644
> --- a/scripts/lib/devtool/deploy.py
> +++ b/scripts/lib/devtool/deploy.py
> @@ -211,6 +211,11 @@ def deploy(args, config, basepath, workspace):
>          if not args.show_status:
>              extraoptions += ' -q'
>  
> +        scp_sshexec = ''
> +        ssh_sshexec = 'ssh'
> +        if args.ssh_exec:
> +            scp_sshexec = "-S %s" % args.ssh_exec
> +            ssh_sshexec = args.ssh_exec
>          scp_port = ''
>          ssh_port = ''
>          if args.port:
> @@ -238,7 +243,7 @@ def deploy(args, config, basepath, workspace):
>                  for fpath, fsize in filelist:
>                      f.write('%s %d\n' % (fpath, fsize))
>              # Copy them to the target
> -            ret = subprocess.call("scp %s %s %s/* %s:%s" % (scp_port, extraoptions, tmpdir, args.target, os.path.dirname(tmpscript)), shell=True)
> +            ret = subprocess.call("scp %s %s %s %s/* %s:%s" % (scp_sshexec, scp_port, extraoptions, tmpdir, args.target, os.path.dirname(tmpscript)), shell=True)
>              if ret != 0:
>                  raise DevtoolError('Failed to copy script to %s - rerun with -s to '
>                                  'get a complete error message' % args.target)
> @@ -246,7 +251,7 @@ def deploy(args, config, basepath, workspace):
>              shutil.rmtree(tmpdir)
>  
>          # Now run the script
> -        ret = exec_fakeroot(rd, 'tar cf - . | ssh  %s %s %s \'sh %s %s %s %s\'' % (ssh_port, extraoptions, args.target, tmpscript, args.recipename, destdir, tmpfilelist), cwd=recipe_outdir, shell=True)
> +        ret = exec_fakeroot(rd, 'tar cf - . | %s  %s %s %s \'sh %s %s %s %s\'' % (ssh_sshexec, ssh_port, extraoptions, args.target, tmpscript, args.recipename, destdir, tmpfilelist), cwd=recipe_outdir, shell=True)
>          if ret != 0:
>              raise DevtoolError('Deploy failed - rerun with -s to get a complete '
>                              'error message')
> @@ -276,6 +281,11 @@ def undeploy(args, config, basepath, workspace):
>      if not args.show_status:
>          extraoptions += ' -q'
>  
> +    scp_sshexec = ''
> +    ssh_sshexec = 'ssh'
> +    if args.ssh_exec:
> +        scp_sshexec = "-S %s" % args.ssh_exec
> +        ssh_sshexec = args.ssh_exec
>      scp_port = ''
>      ssh_port = ''
>      if args.port:
> @@ -292,7 +302,7 @@ def undeploy(args, config, basepath, workspace):
>          with open(os.path.join(tmpdir, os.path.basename(tmpscript)), 'w') as f:
>              f.write(shellscript)
>          # Copy it to the target
> -        ret = subprocess.call("scp %s %s %s/* %s:%s" % (scp_port, extraoptions, tmpdir, args.target, os.path.dirname(tmpscript)), shell=True)
> +        ret = subprocess.call("scp %s %s %s %s/* %s:%s" % (scp_sshexec, scp_port, extraoptions, tmpdir, args.target, os.path.dirname(tmpscript)), shell=True)
>          if ret != 0:
>              raise DevtoolError('Failed to copy script to %s - rerun with -s to '
>                                  'get a complete error message' % args.target)
> @@ -300,7 +310,7 @@ def undeploy(args, config, basepath, workspace):
>          shutil.rmtree(tmpdir)
>  
>      # Now run the script
> -    ret = subprocess.call('ssh %s %s %s \'sh %s %s\'' % (ssh_port, extraoptions, args.target, tmpscript, args.recipename), shell=True)
> +    ret = subprocess.call('%s %s %s %s \'sh %s %s\'' % (ssh_sshexec, ssh_port, extraoptions, args.target, tmpscript, args.recipename), shell=True)
>      if ret != 0:
>          raise DevtoolError('Undeploy failed - rerun with -s to get a complete '
>                             'error message')
> @@ -324,6 +334,7 @@ def register_commands(subparsers, context):
>      parser_deploy.add_argument('-n', '--dry-run', help='List files to be deployed only', action='store_true')
>      parser_deploy.add_argument('-p', '--no-preserve', help='Do not preserve existing files', action='store_true')
>      parser_deploy.add_argument('--no-check-space', help='Do not check for available space before deploying', action='store_true')
> +    parser_deploy.add_argument('-e', '--ssh-exec', help='Executable to use in place of ssh')
>      parser_deploy.add_argument('-P', '--port', help='Specify port to use for connection to the target')
>  
>      strip_opts = parser_deploy.add_mutually_exclusive_group(required=False)
> @@ -346,5 +357,6 @@ def register_commands(subparsers, context):
>      parser_undeploy.add_argument('-s', '--show-status', help='Show progress/status output', action='store_true')
>      parser_undeploy.add_argument('-a', '--all', help='Undeploy all recipes deployed on the target', action='store_true')
>      parser_undeploy.add_argument('-n', '--dry-run', help='List files to be undeployed only', action='store_true')
> +    parser_undeploy.add_argument('-e', '--ssh-exec', help='Executable to use in place of ssh')
>      parser_undeploy.add_argument('-P', '--port', help='Specify port to use for connection to the target')
>      parser_undeploy.set_defaults(func=undeploy)
> 


-- 

Paul Eggleton
Intel Open Source Technology Centre



