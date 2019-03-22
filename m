Return-Path: <takondra@cisco.com>
Received: from alln-iport-4.cisco.com (alln-iport-4.cisco.com [173.37.142.91])
	by mail.openembedded.org (Postfix) with ESMTP id E87897CFE5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Mar 2019 00:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=2606; q=dns/txt; s=iport;
	t=1553216221; x=1554425821;
	h=from:to:cc:subject:date:message-id:in-reply-to: references;
	bh=kbXiDCS56sIcB+QWt1HmGyk+iBFcki5zB4yngYLoVwk=;
	b=YzdIXXjznciD9l38lwaRsyuhzQoar/E2ThL7rHsdfvey00gkO8pmLNPB
	w0gmxRitzNO6IZ4K3SYtBarDG3RpDflAIWKffmJAUfJhsPecr1sYpG3T2
	BdmqhCPYGXLp7QyW3c/RCby0hMmCYi8nxGCaqo1HJLohza2ozV0x1abcZ A=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0AFAABKMpRc/4MNJK1jGQEBAQEBAQE?=
	=?us-ascii?q?BAQEBAQcBAQEBAQGBUQQBAQEBAQsBghBogQMnjCqWcY50gXsNAQEbhFEChHQ?=
	=?us-ascii?q?iNAkNAQEDAQEJAQMCbRwMhUsGeRBRVxmDIgGBaA2sCYVGhGsUgRsBhmmESBe?=
	=?us-ascii?q?BQD+EYYURhRQDkiySXQmHY4tVAheCXJEYnjkCERWBTTiBVnAVgycJi1SFDh8?=
	=?us-ascii?q?DMItuKoIjAQE?=
X-IronPort-AV: E=Sophos;i="5.60,254,1549929600"; d="scan'208";a="248248457"
Received: from alln-core-1.cisco.com ([173.36.13.131])
	by alln-iport-4.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
	22 Mar 2019 00:57:00 +0000
Received: from takondra-t460s.cisco.com ([10.156.154.76])
	(authenticated bits=0)
	by alln-core-1.cisco.com (8.15.2/8.15.2) with ESMTPSA id x2M0uxcT015419
	(version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=NO);
	Fri, 22 Mar 2019 00:57:00 GMT
From: Taras Kondratiuk <takondra@cisco.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Mar 2019 17:56:59 -0700
Message-Id: <1553216219-16681-1-git-send-email-takondra@cisco.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <7654089.vcRqMmA28I@localhost.localdomain>
References: <7654089.vcRqMmA28I@localhost.localdomain>
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Authenticated-User: takondra@cisco.com
X-Outbound-SMTP-Client: 10.156.154.76, [10.156.154.76]
X-Outbound-Node: alln-core-1.cisco.com
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>, xe-linux-external@cisco.com
Subject: [PATCH v2] devtool: prevent starting git gc in background
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
X-List-Received-Date: Fri, 22 Mar 2019 00:57:00 -0000

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
v2: Added "--local".

 scripts/lib/devtool/__init__.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/lib/devtool/__init__.py b/scripts/lib/devtool/__init__.py
index 89f098a912a6..8fc7fffcd672 100644
--- a/scripts/lib/devtool/__init__.py
+++ b/scripts/lib/devtool/__init__.py
@@ -205,6 +205,7 @@ def setup_git_repo(repodir, version, devbranch, basetag='devtool-base', d=None):
     import oe.patch
     if not os.path.exists(os.path.join(repodir, '.git')):
         bb.process.run('git init', cwd=repodir)
+        bb.process.run('git config --local gc.autodetach 0', cwd=repodir)
         bb.process.run('git add .', cwd=repodir)
         commit_cmd = ['git']
         oe.patch.GitApplyTree.gitCommandUserOptions(commit_cmd, d=d)
-- 
2.7.4


