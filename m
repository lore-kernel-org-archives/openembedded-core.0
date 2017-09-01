Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 79F5278237
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Sep 2017 14:20:47 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v81EKkov014473
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 1 Sep 2017 15:20:47 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1dnmoQ-0001gH-Ef; Fri, 01 Sep 2017 15:20:46 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Sep 2017 15:20:43 +0100
Message-Id: <1504275645-6421-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Fri, 01 Sep 2017 15:20:47 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH 1/3] lib/oe/package: Improve filedeprunner subprocess handling
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
X-List-Received-Date: Fri, 01 Sep 2017 14:20:49 -0000

Currently the exit code of the spawned program isn't checked so it can
fail and the do_package task will continue merrily upon its way.

Use subprocess.check_output() to ensure we check the exit code and
redirect stderr to stdout so if it fails, we see the error output.

We can then drop the existing exception handling as the subprocess
exception gives a much better error.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oe/package.py | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index fcee389..1e5c3aa 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -176,8 +176,7 @@ def filedeprunner(arg):
 
     def process_deps(pipe, pkg, pkgdest, provides, requires):
         file = None
-        for line in pipe:
-            line = line.decode("utf-8")
+        for line in pipe.split("\n"):
 
             m = file_re.match(line)
             if m:
@@ -226,12 +225,8 @@ def filedeprunner(arg):
 
         return provides, requires
 
-    try:
-        dep_popen = subprocess.Popen(shlex.split(rpmdeps) + pkgfiles, stdout=subprocess.PIPE)
-        provides, requires = process_deps(dep_popen.stdout, pkg, pkgdest, provides, requires)
-    except OSError as e:
-        bb.error("rpmdeps: '%s' command failed, '%s'" % (shlex.split(rpmdeps) + pkgfiles, e))
-        raise e
+    output = subprocess.check_output(shlex.split(rpmdeps) + pkgfiles, stderr=subprocess.STDOUT).decode("utf-8")
+    provides, requires = process_deps(output, pkg, pkgdest, provides, requires)
 
     return (pkg, provides, requires)
 
-- 
2.7.4


