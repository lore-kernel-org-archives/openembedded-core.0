Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0487A776BD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Mar 2017 08:45:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v2E8k1Ze006651
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Mar 2017 01:46:01 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 14 Mar 2017 01:46:01 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 14 Mar 2017 01:45:45 -0700
Message-ID: <fd8160b8f9a19f067986dbc4787d1bcb20ad424e.1489481108.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.11.0.rc2.dirty
In-Reply-To: <cover.1489481108.git.liezhi.yang@windriver.com>
References: <cover.1489481108.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 8/8] oe/path.py: fix for "Argument list too long"
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
X-List-Received-Date: Tue, 14 Mar 2017 08:46:00 -0000
Content-Type: text/plain

Issue: LIN9-1648

Fixed when len(TMPDIR) = 410:
$ bitbake core-image-sato-sdk
[snip]
Subprocess output:
/bin/sh: /bin/cp: Argument list too long

ERROR: core-image-sato-sdk-1.0-r0 do_rootfs: Function failed: do_rootfs
[snip]

This is because "copyhardlinktree(src, dst)" does "cp -afl src/* dst",
while src/* is expanded to "src/file1 src/file2, src/file3..." which
causes the "Argument list too long", use ./* as src and change cwd in
subprocess.check_output() to fix the problem.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/lib/oe/path.py | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oe/path.py b/meta/lib/oe/path.py
index a2a50c5b39..448a2b944e 100644
--- a/meta/lib/oe/path.py
+++ b/meta/lib/oe/path.py
@@ -103,12 +103,14 @@ def copyhardlinktree(src, dst):
         source = ''
         if os.path.isdir(src):
             if len(glob.glob('%s/.??*' % src)) > 0:
-                source = '%s/.??* ' % src
-            source = source + '%s/*' % src
+                source = './.??* '
+            source += './*'
+            s_dir = src
         else:
             source = src
-        cmd = 'cp -afl --preserve=xattr %s %s' % (source, dst)
-        subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT)
+            s_dir = os.getcwd()
+        cmd = 'cp -afl --preserve=xattr %s %s' % (source, os.path.realpath(dst))
+        subprocess.check_output(cmd, shell=True, cwd=s_dir, stderr=subprocess.STDOUT)
     else:
         copytree(src, dst)
 
-- 
2.11.0.rc2.dirty


