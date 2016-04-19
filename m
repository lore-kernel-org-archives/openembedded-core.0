Return-Path: <Dengke.Du@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 82D116E681
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 06:29:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u3J6TKVa025195
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2016 23:29:20 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 18 Apr 2016 23:29:19 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 19 Apr 2016 02:29:16 -0400
Message-ID: <ff13545dfd18ed0fe582e568f23eaf90ecdf9f87.1461047220.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1461047220.git.dengke.du@windriver.com>
References: <cover.1461047220.git.dengke.du@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] bash: fixed run-builtins fail
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
X-List-Received-Date: Tue, 19 Apr 2016 06:29:20 -0000
Content-Type: text/plain

1.The ptest run-builtins of bash fail, because the script:
        (exec -l -a specialname {THIS_SH} -c 'echo $0')
in the builtins.tests, it has option "-l", as the bash source
code shell.c said when a shell run startup file if:
	argv[0][0] == '-'
it is a login shell, it would read the file /etc/profile. The
file /etc/profile contain the following:
	if [ -x /usr/bin/resize ];then
  		/usr/bin/resize >/dev/null
	fi
The above codes that was added by Ting Liu whose commit is
	73c481d2cbc3e7c7ef9f594126aec581ec75b689
It run the command /usr/bin/resize which is produced by busybox,
in the busybox source code resize.c, when you invoke it, it would
output an escape sequence "^[7^[[r^[[999;999H^[[6n" to the stderr.
So in the run-builtins scripts, it output a temp file /tmp/xx:
	${THIS_SH} ./builtins.tests > /tmp/xx 2>&1
the file /tmp/xx contain the above escape sequence, in the next step
we diff the /tmp/xx and builtins.right:
	diff /tmp/xx builtins.right && rm-f /tmp/xx
the run-builtins test fail. Because the escape sequence was output to
the stderr, so we need to filter the escape sequence to /dev/null to
solve the problem:
	(exec -l -a specialname {THIS_SH} -c 'echo $0') 2> /dev/null
in the file builtins.tests.

2.In the file tests/source5.sub, it contain:
	LC_ALL=en_US.UTF-8
So when we run the run-builtins test,we should ensure the system include
the locales "en_US.UTF-8", such as we add the following to the local.conf:
	IMAGE_LINGUAS_append = " en-us"

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 .../bash/bash/fix-run-builtins.patch               | 25 ++++++++++++++++++++++
 meta/recipes-extended/bash/bash_4.3.30.bb          |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 meta/recipes-extended/bash/bash/fix-run-builtins.patch

diff --git a/meta/recipes-extended/bash/bash/fix-run-builtins.patch b/meta/recipes-extended/bash/bash/fix-run-builtins.patch
new file mode 100644
index 0000000..73e1c35
--- /dev/null
+++ b/meta/recipes-extended/bash/bash/fix-run-builtins.patch
@@ -0,0 +1,25 @@
+From 8598e884c291912c6526a64ec5f978bcba38acf1 Mon Sep 17 00:00:00 2001
+From: Dengke Du <dengke.du@windriver.com>
+Date: Tue, 19 Apr 2016 01:54:46 -0400
+Subject: [PATCH] Fixed the run-builtins test fail
+
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


