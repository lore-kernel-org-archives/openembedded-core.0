Return-Path: <takondra@cisco.com>
X-Greylist: delayed 424 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 21 Mar 2019 23:15:34 UTC
Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
	by mail.openembedded.org (Postfix) with ESMTP id 1C042601F6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Mar 2019 23:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=2574; q=dns/txt; s=iport;
	t=1553210136; x=1554419736;
	h=from:to:cc:subject:date:message-id;
	bh=XteS9hYhbqkqbYvD38CAa8a66w1+bFJFblwGYTNGIdQ=;
	b=baMq5/LEBQhTcJSXWgzrYugBVEsC6cOhy274wwf59WvT01pY8cej1dT8
	9eMqGUqfzK9Ube0GTah+hhxh9QiWd/OK9lHNr6TS4zFRQRvKXA61CL9iI
	Tgu+sNgS/VwCTClmj0uX0m1uKKcbmjCfIrqeW1+u2BA0yFqJoHwvQnf7q E=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0AFAABwGJRc/40NJK1kGgEBAQEBAgE?=
	=?us-ascii?q?BAQEHAgEBAQGBUQUBAQEBCwGCEGiBAyeMKpZxjnSBew0BARuEUYR2IjQJDQE?=
	=?us-ascii?q?BAwEBCQEDAm0cDIZKgVGDIgGBaA2sFYVGhGsUgRsBhmmESBeBQD+EYYURhRQ?=
	=?us-ascii?q?DkiySWwmHYotVAheCW5EXAZ42AhEVgU04gVZwFYMnCYtUhQ4fAzCLcyqCIwE?=
	=?us-ascii?q?B?=
X-IronPort-AV: E=Sophos;i="5.60,254,1549929600"; d="scan'208";a="249819920"
Received: from alln-core-8.cisco.com ([173.36.13.141])
	by alln-iport-6.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
	21 Mar 2019 23:08:31 +0000
Received: from takondra-t460s.cisco.com ([10.156.154.76])
	(authenticated bits=0)
	by alln-core-8.cisco.com (8.15.2/8.15.2) with ESMTPSA id x2LN8UMo017852
	(version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=NO);
	Thu, 21 Mar 2019 23:08:30 GMT
From: Taras Kondratiuk <takondra@cisco.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Mar 2019 16:08:25 -0700
Message-Id: <1553209705-12220-1-git-send-email-takondra@cisco.com>
X-Mailer: git-send-email 2.7.4
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Authenticated-User: takondra@cisco.com
X-Outbound-SMTP-Client: 10.156.154.76, [10.156.154.76]
X-Outbound-Node: alln-core-8.cisco.com
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>, xe-linux-external@cisco.com
Subject: [PATCH] devtool: prevent starting git gc in background
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
X-List-Received-Date: Thu, 21 Mar 2019 23:15:35 -0000

Devtool creates a git repository for extracted sources in a temporary
directory and then moves it to a final destination after patching is
done. Unfortunately devtool is not aware that some of its git operations
may have caused git garbage collector to start in background. If timing
is just right a repository move fails because GC is removing git objects
while they are being moved.

The issue was hit on Krogoth release, but the code that moves created
git repository is still the same.

Disable gc.autodetach to make GC run synchronously and block git until
it is done.

Traceback (most recent call last):
  File "<snip>/openembedded-core/scripts/devtool", line 342, in <module>
    ret = main()
  File "<snip>/openembedded-core/scripts/devtool", line 329, in main
    ret = args.func(args, config, basepath, workspace)
  File "<snip>/openembedded-core/scripts/lib/devtool/standard.py", line 352, in extract
    initial_rev = _extract_source(srctree, args.keep_temp, args.branch, False, rd)
  File "<snip>/openembedded-core/scripts/lib/devtool/standard.py", line 644, in _extract_source
    shutil.move(srcsubdir, srctree)
  File "/usr/lib/python2.7/shutil.py", line 299, in move
    copytree(src, real_dst, symlinks=True)
  File "/usr/lib/python2.7/shutil.py", line 208, in copytree
    raise Error, errors
Error: [('/tmp/devtool5RXkuX/workdir/grpc-1.2.5/.git/objects/5e', '<snip>/build/grpc/grpc_src/.git/objects/5e', "[Errno 2] No such file or directory: '/tmp/devtool5RXkuX/workdir/grpc-1.2.5/.git/objects/5e'"), ('/tmp/devtool5RXkuX/workdir/grpc-1.2.5/.git/objects/57', '<snip>/build/grpc/grpc_src/.git/objects/57', "[Errno 2] No such file or directory: '/tmp/devtool5RXkuX/workdir/grpc-1.2.5/.git/objects/57'"), many git objects ... ]

Signed-off-by: Taras Kondratiuk <takondra@cisco.com>
---
 scripts/lib/devtool/__init__.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/lib/devtool/__init__.py b/scripts/lib/devtool/__init__.py
index 89f098a912a6..7aff31231a2d 100644
--- a/scripts/lib/devtool/__init__.py
+++ b/scripts/lib/devtool/__init__.py
@@ -205,6 +205,7 @@ def setup_git_repo(repodir, version, devbranch, basetag='devtool-base', d=None):
     import oe.patch
     if not os.path.exists(os.path.join(repodir, '.git')):
         bb.process.run('git init', cwd=repodir)
+        bb.process.run('git config gc.autodetach 0', cwd=repodir)
         bb.process.run('git add .', cwd=repodir)
         commit_cmd = ['git']
         oe.patch.GitApplyTree.gitCommandUserOptions(commit_cmd, d=d)
-- 
2.7.4


