Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id AAFEA73042
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Mar 2017 21:10:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2LLAxbR008842; Tue, 21 Mar 2017 21:10:59 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id DRDc8tlttPAE; Tue, 21 Mar 2017 21:10:59 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2LLArlL008797
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 21 Mar 2017 21:10:54 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cqR3N-00008d-Ly; Tue, 21 Mar 2017 21:10:53 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Mar 2017 21:10:51 +0000
Message-Id: <1490130652-492-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/2] externalsrc: Use git add -A for compatibility with all git versions
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
X-List-Received-Date: Tue, 21 Mar 2017 21:11:00 -0000

I've been debugging a selftest failure on Centos7. The problem turns out
to be the elderly git version (1.8.3.1) on those systems. It means that
the system doesn't correctly checksum changed files in the source tree,
which in turn means do_compile fails to run and this leads to the following
selftest failure:

======================================================================
FAIL [141.373s]: test_devtool_buildclean (oeqa.selftest.devtool.DevtoolTests)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/meta/lib/oeqa/selftest/devtool.py", line 530, in test_devtool_buildclean
    assertFile(tempdir_mdadm, 'mdadm')
  File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/meta/lib/oeqa/selftest/devtool.py", line 497, in assertFile
    self.assertTrue(os.path.exists(f), "%r does not exist" % f)
AssertionError: False is not true : '/tmp/devtoolqag88s39z8/mdadm' does not exist

The solution is to use -A on the git add commandline which matches the behaviour
in git 2.0+ versions and resolves the problem.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/externalsrc.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index 39789ea..d64af6a 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -190,7 +190,7 @@ def srctree_hash_files(d, srcdir=None):
             # Update our custom index
             env = os.environ.copy()
             env['GIT_INDEX_FILE'] = tmp_index.name
-            subprocess.check_output(['git', 'add', '.'], cwd=s_dir, env=env)
+            subprocess.check_output(['git', 'add', '-A', '.'], cwd=s_dir, env=env)
             sha1 = subprocess.check_output(['git', 'write-tree'], cwd=s_dir, env=env).decode("utf-8")
         with open(oe_hash_file, 'w') as fobj:
             fobj.write(sha1)
-- 
2.7.4


