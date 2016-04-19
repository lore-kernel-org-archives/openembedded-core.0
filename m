Return-Path: <Dengke.Du@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9D0B160762
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 08:55:57 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u3J8tv6a010561
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 01:55:58 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 19 Apr 2016 01:55:56 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 19 Apr 2016 04:55:53 -0400
Message-ID: <efa4eef06732bb5a4143f55e0aa4093c4f81c9ee.1461055627.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1461055627.git.dengke.du@windriver.com>
References: <cover.1461055627.git.dengke.du@windriver.com>
MIME-Version: 1.0
Subject: [PATCHv2 1/1] bash: fixed ptest run-builtins failed
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
X-List-Received-Date: Tue, 19 Apr 2016 08:55:59 -0000
Content-Type: text/plain

1. redirect the stderr output of the command exec with -l option to
   /dev/null.
   Because when we run command exec with -l option in builtins.tests,
   it is a login shell, so it would read the file /etc/profile, that
   file executes the /usr/bin/resize which added by commit:
	 cc6360f4c4d97e0000f9d3545f381224ee99ce7d
   The /usr/bin/resize is produced by busybox that source code resize.c
   contains:
	fprintf(stderr, ESC"7" ESC"[r" ESC"[999;999H" ESC"[6n");
   In the end, it outputs an escape sequence to the stderr, so when we
   compare the test output file /tmp/xx with builtins.right, it failed.
   we need to redirect the stderr output to the /dev/null to solve the
   problem.

2. ensure the target system contains the locales "en_US.UTF-8".
   Because when run the run-builtins, it executes the source5.sub file
   that contain:
	LC_ALL=en_US.UTF-8
   such as add the following to the local.conf:
	IMAGE_LINGUAS_append = " en-us"

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 .../bash/bash/fix-run-builtins.patch               | 33 ++++++++++++++++++++++
 meta/recipes-extended/bash/bash_4.3.30.bb          |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-extended/bash/bash/fix-run-builtins.patch

diff --git a/meta/recipes-extended/bash/bash/fix-run-builtins.patch b/meta/recipes-extended/bash/bash/fix-run-builtins.patch
new file mode 100644
index 0000000..2fa3883
--- /dev/null
+++ b/meta/recipes-extended/bash/bash/fix-run-builtins.patch
@@ -0,0 +1,33 @@
+From 0c4cab9594c96c2dc435a8d9724605824bcbf917 Mon Sep 17 00:00:00 2001
+From: Dengke Du <dengke.du@windriver.com>
+Date: Tue, 19 Apr 2016 02:57:45 -0400
+Subject: [PATCH] fix run-builtins failed
+
+FAIL: run-builtins
+1. redirect the stderr output of command exec with -l option in
+   builtins.tests to /dev/null
+2. ensure the system contain the locales "en_US.UTF-8"
+
+Upstream-Status: Pending
+
+Signed-off-by: Dengke Du <dengke.du@windriver.com>
+---
+ tests/builtins.tests | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tests/builtins.tests b/tests/builtins.tests
+index 9d77520..63f3af8 100644
+--- a/tests/builtins.tests
++++ b/tests/builtins.tests
+@@ -109,7 +109,7 @@ esac
+ 
+ # test options to exec
+ (exec -a specialname ${THIS_SH} -c 'echo $0' )
+-(exec -l -a specialname ${THIS_SH} -c 'echo $0' )
++(exec -l -a specialname ${THIS_SH} -c 'echo $0' ) 2> /dev/null
+ # test `clean' environment.  if /bin/sh is bash, and the script version of
+ # printenv is run, there will be variables in the environment that bash
+ # sets on startup.  Also test code that prefixes argv[0] with a dash.
+-- 
+2.8.1
+
diff --git a/meta/recipes-extended/bash/bash_4.3.30.bb b/meta/recipes-extended/bash/bash_4.3.30.bb
index 4426cf0..95ed392 100644
--- a/meta/recipes-extended/bash/bash_4.3.30.bb
+++ b/meta/recipes-extended/bash/bash_4.3.30.bb
@@ -20,6 +20,7 @@ SRC_URI = "${GNU_MIRROR}/bash/${BP}.tar.gz;name=tarball \
            file://test-output.patch \
            file://fix-run-coproc-run-heredoc-run-execscript-run-test-f.patch \
            file://run-ptest \
+	   file://fix-run-builtins.patch \
            "
 
 SRC_URI[tarball.md5sum] = "a27b3ee9be83bd3ba448c0ff52b28447"
-- 
2.8.1


