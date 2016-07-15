Return-Path: <clemens.lang@bmw-carit.de>
X-Greylist: delayed 319 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 15 Jul 2016 16:31:59 UTC
Received: from cit-hm8-gw01.bmw-carit.de (cit-hm8-mail01.bmw-carit.de
	[212.118.206.84])
	by mail.openembedded.org (Postfix) with ESMTP id 2FAA3606D0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2016 16:31:59 +0000 (UTC)
Received: from [10.40.100.13] (port=39084 helo=cit-hm8-mail01.bmw-carit.de)
	by cit-hm8-gw01.bmw-carit.de with esmtps (TLSv1.2:AES256-SHA:256)
	(Exim 4.82_1-5b7a7c0-XX) (envelope-from <Clemens.Lang@bmw-carit.de>)
	id 1bO5wj-0007bZ-0W for openembedded-core@lists.openembedded.org;
	Fri, 15 Jul 2016 18:26:37 +0200
Received: from clang-buildbox.bmw-carit.intra (172.20.20.251) by
	CIT-HM8-EX01.bmw-carit.intra (10.40.100.13) with Microsoft SMTP Server
	(TLS) id 15.0.1178.4; Fri, 15 Jul 2016 18:26:36 +0200
X-CTCH-RefID: str=0001.0A0C0208.57890EBD.004B, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0
From: Clemens Lang <clemens.lang@bmw-carit.de>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 15 Jul 2016 18:26:26 +0200
Message-ID: <1468599986-26072-1-git-send-email-clemens.lang@bmw-carit.de>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
X-Originating-IP: [172.20.20.251]
X-ClientProxiedBy: CIT-HM8-EX01.bmw-carit.intra (10.40.100.13) To
	CIT-HM8-EX01.bmw-carit.intra (10.40.100.13)
Subject: [PATCH] lib/oe/path: Fix tar invocation with --no-recursion
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
X-List-Received-Date: Fri, 15 Jul 2016 16:32:00 -0000
Content-Type: text/plain

tar's --no-recursion flag only applies to files mentioned after the
flag, which made it a no-op in this invocation of tar, because it was at
the end of the command line.

This is simple to verify with GNU tar 1.29:

| $ mkdir foo
| $ mkdir foo/dir
| $ touch foo/dir/file
| $ tar -cf - foo --no-recursion | tar t
| foo/
| foo/dir/
| foo/dir/file
| $ tar -cf - --no-recursion foo | tar t
| foo/

Modify the code so that it actually does what the comment says by moving
the flag in front of the --files-from argument.

Signed-off-by: Clemens Lang <clemens.lang@bmw-carit.de>
---
 meta/lib/oe/path.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/path.py b/meta/lib/oe/path.py
index 413ebfb..9e238ea 100644
--- a/meta/lib/oe/path.py
+++ b/meta/lib/oe/path.py
@@ -77,7 +77,7 @@ def copyhardlinktree(src, dst):
     if (os.stat(src).st_dev ==  os.stat(dst).st_dev):
         # Need to copy directories only with tar first since cp will error if two 
         # writers try and create a directory at the same time
-        cmd = 'cd %s; find . -type d -print | tar -cf - -C %s -p --files-from - --no-recursion | tar -xf - -C %s' % (src, src, dst)
+        cmd = 'cd %s; find . -type d -print | tar -cf - -C %s -p --no-recursion --files-from - | tar -xf - -C %s' % (src, src, dst)
         check_output(cmd, shell=True, stderr=subprocess.STDOUT)
         cmd = 'cd %s; find . -print0 | cpio --null -pdlu %s' % (src, dst)
         check_output(cmd, shell=True, stderr=subprocess.STDOUT)
-- 
2.8.1


