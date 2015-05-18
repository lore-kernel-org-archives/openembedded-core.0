Return-Path: <lucas.dutra.nunes@gmail.com>
Received: from mail-qc0-f172.google.com (mail-qc0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id 20A9960ADD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 20:08:37 +0000 (UTC)
Received: by qctt3 with SMTP id t3so13873482qct.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 13:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=DM93zxKiF4nl+jXYU+/+xi52b71zPdWKMOgLKIE7qsE=;
	b=Q3bVnLiHe6rcAt3l9wVz3IayP9EIh5lZwIeQ7PqYSrn/RldMmFvHKcAk4q2GeXP/t0
	y7HQ6qGS5Hersl+xyuWv9UAUITA+NlWAkiU2TphwfMHvcvedhtUBmgeL2yYSuEtxZ4T2
	ura1On6c9g0/+jay+Oi8abHnTFVG5H4PFYsVJJs7A+vJLOBlgDXs3POz0Kv6Qb4dFpnv
	F76DvCCAXT9wagY2X/l17Q+CAtzqc6Xjb/mtKvaOzjljdb/g7FnXc1eD2H81jT2wpWxK
	TWv9fs8gVjAOMcVFOMbZJ68NLzXu91jQMM8fwS0dCrJI6Ram4Nc5GRCJHUaYjzeeFSeN
	6W2w==
X-Received: by 10.55.25.150 with SMTP id 22mr3199891qkz.105.1431979719007;
	Mon, 18 May 2015 13:08:39 -0700 (PDT)
Received: from ldnunes.lab.ossystems.com.br ([177.100.224.72])
	by mx.google.com with ESMTPSA id 33sm1654018qkq.41.2015.05.18.13.08.36
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 18 May 2015 13:08:37 -0700 (PDT)
Sender: Lucas Nunes <lucas.dutra.nunes@gmail.com>
From: Lucas Dutra Nunes <ldnunes@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 May 2015 17:08:18 -0300
Message-Id: <1431979698-29379-2-git-send-email-ldnunes@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1431979698-29379-1-git-send-email-ldnunes@ossystems.com.br>
References: <1431979698-29379-1-git-send-email-ldnunes@ossystems.com.br>
Subject: [PATCH 2/2] cleanup-workdir: wait for bitbake instances to finish
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
X-List-Received-Date: Mon, 18 May 2015 20:08:43 -0000

bitbake uses a lock file on the build dir, "bitbake.lock", to prevent it
from running before an instance has exited. And sometimes the
cleanup-workdir script can call bibake too many times, too fast, before
the lock has been released.

By simply waiting that the lock has been released solves this problem.

Signed-off-by: Lucas Dutra Nunes <ldnunes@ossystems.com.br>
---
 scripts/cleanup-workdir | 31 +++++++++++++++++++++++++++----
 1 file changed, 27 insertions(+), 4 deletions(-)

diff --git a/scripts/cleanup-workdir b/scripts/cleanup-workdir
index bf37f90..3e1df1f 100755
--- a/scripts/cleanup-workdir
+++ b/scripts/cleanup-workdir
@@ -21,6 +21,8 @@ import optparse
 import re
 import subprocess
 import shutil
+import fcntl
+from contextlib import contextmanager
 
 pkg_cur_dirs = {}
 obsolete_dirs = []
@@ -51,7 +53,7 @@ def get_cur_arch_dirs(workdir, arch_dirs):
     pattern = workdir + '/(.*?)/'
 
     cmd = "bitbake -e | grep ^SDK_ARCH="
-    output = run_command(cmd)
+    output = run_bitbake_command(cmd)
     sdk_arch = output.split('"')[1]
 
     # select thest 5 packages to get the dirs of current arch
@@ -59,7 +61,7 @@ def get_cur_arch_dirs(workdir, arch_dirs):
 
     for pkg in pkgs:
         cmd = "bitbake -e " + pkg + " | grep ^IMAGE_ROOTFS="
-        output = run_command(cmd)
+        output = run_bitbake_command(cmd)
         output = output.split('"')[1]
         m = re.match(pattern, output)
         arch_dirs.append(m.group(1))
@@ -67,6 +69,27 @@ def get_cur_arch_dirs(workdir, arch_dirs):
 def get_build_dir():
     return run_command('echo $BUILDDIR').strip()
 
+@contextmanager
+def wait_for_bitbake():
+    builddir = get_build_dir()
+    bitbake_lock_file = os.path.join(builddir, 'bitbake.lock')
+
+    with open(bitbake_lock_file, 'w+') as f:
+        fd = f.fileno()
+        try:
+            # Lock and unlock the lock file, to be sure that there are no other
+            # instances of bitbake running at the moment:
+            fcntl.flock(fd, fcntl.LOCK_EX)
+            fcntl.flock(fd, fcntl.LOCK_UN)
+            yield
+        finally:
+            # And unlock again, just to be safe:
+            fcntl.flock(fd, fcntl.LOCK_UN)
+
+def run_bitbake_command(cmd):
+    with wait_for_bitbake():
+        return run_command(cmd)
+
 def main():
     global parser
     parser = optparse.OptionParser(
@@ -89,7 +112,7 @@ will be deleted. Be CAUTIOUS.""")
 
     print 'Updating bitbake caches...'
     cmd = "bitbake -s"
-    output = run_command(cmd)
+    output = run_bitbake_command(cmd)
 
     output = output.split('\n')
     index = 0
@@ -111,7 +134,7 @@ will be deleted. Be CAUTIOUS.""")
         pkg_cur_dirs[elems[0]] = version
 
     cmd = "bitbake -e"
-    output = run_command(cmd)
+    output = run_bitbake_command(cmd)
 
     tmpdir = None
     image_rootfs = None
-- 
2.1.4


