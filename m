Return-Path: <Dengke.Du@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8C35B772AB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Feb 2016 07:59:09 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u1N7x8MR009895
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Feb 2016 23:59:10 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 22 Feb 2016 23:59:07 -0800
From: Dengke Du <dengke.du@windriver.com>
To: 
CC: <openembedded-core@lists.openembedded.org>
Date: Tue, 23 Feb 2016 02:59:04 -0500
Message-ID: <133afa4c8a5b79a1b6bceb0ef058a12e2b208b6c.1456213720.git.dengke.du@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1456213720.git.dengke.du@windriver.com>
References: <cover.1456213720.git.dengke.du@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] pTest-strace fails fixed
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
X-List-Received-Date: Tue, 23 Feb 2016 07:59:11 -0000
Content-Type: text/plain

When run the strace ptest on the target, the test files located in the "/usr/lib/strace/ptest/tests",
but the run-test script use the path "srcdir = ../../strace-*/tests"to find the necessary files, so it
can't find the necessary files, it fails. So change the variable srcdir, replace the strace-* to ptest
when do the do_install_ptest() function using the following:
	sed -i -e '/^src/s/strace.*[1-9]/ptest/' ${D}/${PTEST_PATH}/${TESTDIR}/Makefile

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 meta/recipes-devtools/strace/strace_4.11.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/strace/strace_4.11.bb b/meta/recipes-devtools/strace/strace_4.11.bb
index 3e542ca..51ec5b5 100644
--- a/meta/recipes-devtools/strace/strace_4.11.bb
+++ b/meta/recipes-devtools/strace/strace_4.11.bb
@@ -41,6 +41,7 @@ do_compile_ptest() {
 
 do_install_ptest() {
 	oe_runmake -C ${TESTDIR} install-ptest BUILDDIR=${B} DESTDIR=${D}${PTEST_PATH} TESTDIR=${TESTDIR}
+	sed -i -e '/^src/s/strace.*[1-9]/ptest/' ${D}/${PTEST_PATH}/${TESTDIR}/Makefile
 }
 
 BBCLASSEXTEND = "native"
-- 
1.9.1


