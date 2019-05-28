Return-Path: <Sakib.Sajal@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 43BF27E064
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 May 2019 14:31:46 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x4SEVQFG011099
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 May 2019 07:31:36 -0700
Received: from ssajal-HP-EliteBook-850-G3.wrs.com (128.224.140.236) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Tue, 28 May 2019 07:31:16 -0700
From: Sakib Sajal <sakib.sajal@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 28 May 2019 10:31:04 -0400
Message-ID: <20190528143104.30168-2-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190528143104.30168-1-sakib.sajal@windriver.com>
References: <20190528143104.30168-1-sakib.sajal@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] Bash: Allow new-exp ptest to pass when run as root.
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
X-List-Received-Date: Tue, 28 May 2019 14:31:46 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The ptest was failing as it was expecting non-root user.
Ptests are only run as root.

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
Signed-off-by: Randy Macleod <randy.macleod@windriver.com>
---
 ...llow-ptest-new-exp-to-be-run-as-root.patch | 45 +++++++++++++++++++
 meta/recipes-extended/bash/bash_5.0.bb        |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-extended/bash/bash/0001-Bash-Allow-ptest-new-exp-to-be-run-as-root.patch

diff --git a/meta/recipes-extended/bash/bash/0001-Bash-Allow-ptest-new-exp-to-be-run-as-root.patch b/meta/recipes-extended/bash/bash/0001-Bash-Allow-ptest-new-exp-to-be-run-as-root.patch
new file mode 100644
index 0000000000..bc0154692e
--- /dev/null
+++ b/meta/recipes-extended/bash/bash/0001-Bash-Allow-ptest-new-exp-to-be-run-as-root.patch
@@ -0,0 +1,45 @@
+From d360a22e7a0b75f1e081f6d7cbf4d55745ecce6b Mon Sep 17 00:00:00 2001
+From: Sakib Sajal <sakib.sajal@windriver.com>
+Date: Mon, 27 May 2019 17:57:04 -0400
+Subject: [PATCH] Bash: Allow ptest, new-exp, to be run as root
+
+Upstream-Status: inappropriate [embedded specific]
+
+The ptest was failing as it was expecting non-root user.
+Ptests are only run as root.
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+Signed-off-by: Randy Macleod <randy.macleod@windriver.com>
+---
+ tests/new-exp.right | 2 +-
+ tests/new-exp.tests | 4 ----
+ 2 files changed, 1 insertion(+), 5 deletions(-)
+
+diff --git a/tests/new-exp.right b/tests/new-exp.right
+index c0f78fbb..9a42ec81 100644
+--- a/tests/new-exp.right
++++ b/tests/new-exp.right
+@@ -624,7 +624,7 @@ c Sub = 0 2 4 8
+ <'ab cd'> 
+ <'4'> <'ab cd'> 
+ <> 
+-argv[1] = <host(2)[5.0]$ >
++argv[1] = <host(2)[5.0]# >
+ < 	
+ >
+ <' \t\n'>
+diff --git a/tests/new-exp.tests b/tests/new-exp.tests
+index 557d6b44..31e15468 100644
+--- a/tests/new-exp.tests
++++ b/tests/new-exp.tests
+@@ -1,7 +1,3 @@
+-if (( $UID == 0 )); then
+-	echo "new-exp.tests: the test suite should not be run as root" >&2
+-fi
+-
+ # must do this because posix mode causes process substitution to be disabled
+ # and flagged as a syntax error, which causes the shell to exit
+ set +o posix
+-- 
+2.20.1
+
diff --git a/meta/recipes-extended/bash/bash_5.0.bb b/meta/recipes-extended/bash/bash_5.0.bb
index e60e5304a5..953f3cb0e1 100644
--- a/meta/recipes-extended/bash/bash_5.0.bb
+++ b/meta/recipes-extended/bash/bash_5.0.bb
@@ -19,6 +19,7 @@ SRC_URI = "${GNU_MIRROR}/bash/${BP}.tar.gz;name=tarball \
            file://fix-run-coproc-run-heredoc-run-execscript-run-test-f.patch \
            file://run-ptest \
            file://fix-run-builtins.patch \
+	   file://0001-Bash-Allow-ptest-new-exp-to-be-run-as-root.patch \
            "
 
 SRC_URI[tarball.md5sum] = "2b44b47b905be16f45709648f671820b"
-- 
2.20.1


