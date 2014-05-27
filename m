Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (unknown [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 21BB86FA92
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 May 2014 07:02:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s4R72uuB021428
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 May 2014 00:02:57 -0700 (PDT)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Tue, 27 May 2014 00:02:56 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 27 May 2014 15:02:53 +0800
Message-ID: <c1e7421f8317b0dfb0988044e511dc95e5265af1.1401174102.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1401174102.git.Chong.Lu@windriver.com>
References: <cover.1401174102.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] strace: fix ptest execution failure
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
X-List-Received-Date: Tue, 27 May 2014 07:02:59 -0000
Content-Type: text/plain

Modify ptest suite to make it execute successfully.

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta/recipes-devtools/strace/strace-4.8/run-ptest | 2 +-
 meta/recipes-devtools/strace/strace_4.8.bb        | 6 ++++++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/strace/strace-4.8/run-ptest b/meta/recipes-devtools/strace/strace-4.8/run-ptest
index 133cf92..66639fb 100755
--- a/meta/recipes-devtools/strace/strace-4.8/run-ptest
+++ b/meta/recipes-devtools/strace/strace-4.8/run-ptest
@@ -1,2 +1,2 @@
 #!/bin/sh
-make -C tests -k runtest-TESTS
+make -C tests -k check-TESTS
diff --git a/meta/recipes-devtools/strace/strace_4.8.bb b/meta/recipes-devtools/strace/strace_4.8.bb
index 71563d4..9769cd4 100644
--- a/meta/recipes-devtools/strace/strace_4.8.bb
+++ b/meta/recipes-devtools/strace/strace_4.8.bb
@@ -41,6 +41,12 @@ do_compile_ptest() {
 
 do_install_ptest() {
 	oe_runmake -C ${TESTDIR} install-ptest BUILDDIR=${B} DESTDIR=${D}${PTEST_PATH} TESTDIR=${TESTDIR}
+	install ${S}/test-driver ${D}${PTEST_PATH}
+	sed -e 's/bash/sh/' \
+	    -e 's/gawk/awk/' \
+	    -e 's/^top_srcdir = \(.*\)/top_srcdir = ../' \
+	    -e '/^all:/a\\t@:' \
+	    -i ${D}${PTEST_PATH}/${TESTDIR}/Makefile
 }
 
 BBCLASSEXTEND = "native"
-- 
1.8.1.2


