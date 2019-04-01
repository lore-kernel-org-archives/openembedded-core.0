Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 7E6A37D1F7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Apr 2019 22:53:56 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Apr 2019 15:53:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,298,1549958400"; d="scan'208";a="130603413"
Received: from nshahrol-mobl.gar.corp.intel.com (HELO localhost.localdomain)
	([10.255.144.90])
	by orsmga008.jf.intel.com with ESMTP; 01 Apr 2019 15:53:53 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	Taras Kondratiuk <takondra@cisco.com>
Date: Tue, 02 Apr 2019 11:53:51 +1300
Message-ID: <38856798.7au5rjGKmf@localhost.localdomain>
Organization: Intel Corporation
In-Reply-To: <1553216219-16681-1-git-send-email-takondra@cisco.com>
References: <7654089.vcRqMmA28I@localhost.localdomain>
	<1553216219-16681-1-git-send-email-takondra@cisco.com>
MIME-Version: 1.0
Cc: xe-linux-external@cisco.com
Subject: Re: [PATCH v2] devtool: prevent starting git gc in background
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
X-List-Received-Date: Mon, 01 Apr 2019 22:53:56 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Acked-by: Paul Eggleton <paul.eggleton@linux.intel.com>

On Friday, 22 March 2019 1:56:59 PM NZDT Taras Kondratiuk via Openembedded-core wrote:
> Devtool creates a git repository for extracted sources in a temporary
> directory and then moves it to a final destination after patching is
> done. Unfortunately devtool is not aware that some of its git operations
> may have caused git garbage collector to start in background. If timing
> is just right a repository move fails because GC is removing git objects
> while they are being moved.
> 
> The issue was hit on Krogoth release, but the code that moves created
> git repository is still the same.
> 
> Disable gc.autodetach to make GC run synchronously and block git until
> it is done.
> 
> Traceback (most recent call last):
>   File "<snip>/openembedded-core/scripts/devtool", line 342, in <module>
>     ret = main()
>   File "<snip>/openembedded-core/scripts/devtool", line 329, in main
>     ret = args.func(args, config, basepath, workspace)
>   File "<snip>/openembedded-core/scripts/lib/devtool/standard.py", line 352, in extract
>     initial_rev = _extract_source(srctree, args.keep_temp, args.branch, False, rd)
>   File "<snip>/openembedded-core/scripts/lib/devtool/standard.py", line 644, in _extract_source
>     shutil.move(srcsubdir, srctree)
>   File "/usr/lib/python2.7/shutil.py", line 299, in move
>     copytree(src, real_dst, symlinks=True)
>   File "/usr/lib/python2.7/shutil.py", line 208, in copytree
>     raise Error, errors
> Error: [('/tmp/devtool5RXkuX/workdir/grpc-1.2.5/.git/objects/5e', '<snip>/build/grpc/grpc_src/.git/objects/5e', "[Errno 2] No such file or directory: '/tmp/devtool5RXkuX/workdir/grpc-1.2.5/.git/objects/5e'"), ('/tmp/devtool5RXkuX/workdir/grpc-1.2.5/.git/objects/57', '<snip>/build/grpc/grpc_src/.git/objects/57', "[Errno 2] No such file or directory: '/tmp/devtool5RXkuX/workdir/grpc-1.2.5/.git/objects/57'"), many git objects ... ]
> 
> Signed-off-by: Taras Kondratiuk <takondra@cisco.com>
> ---
> v2: Added "--local".
> 
>  scripts/lib/devtool/__init__.py | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/scripts/lib/devtool/__init__.py b/scripts/lib/devtool/__init__.py
> index 89f098a912a6..8fc7fffcd672 100644
> --- a/scripts/lib/devtool/__init__.py
> +++ b/scripts/lib/devtool/__init__.py
> @@ -205,6 +205,7 @@ def setup_git_repo(repodir, version, devbranch, basetag='devtool-base', d=None):
>      import oe.patch
>      if not os.path.exists(os.path.join(repodir, '.git')):
>          bb.process.run('git init', cwd=repodir)
> +        bb.process.run('git config --local gc.autodetach 0', cwd=repodir)
>          bb.process.run('git add .', cwd=repodir)
>          commit_cmd = ['git']
>          oe.patch.GitApplyTree.gitCommandUserOptions(commit_cmd, d=d)
> 


-- 

Paul Eggleton
Intel Open Source Technology Centre



