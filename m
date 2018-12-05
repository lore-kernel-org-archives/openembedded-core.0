Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A9F526BCA4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Dec 2018 09:42:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wB59gbVH029323
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Dec 2018 01:42:48 -0800
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Wed, 5 Dec 2018 01:42:27 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 5 Dec 2018 17:42:26 +0800
Message-ID: <1544002946-314875-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] strace: fix ptest fail and strip ptest host references
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
X-List-Received-Date: Wed, 05 Dec 2018 09:42:57 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

1. Add LDFLAGS_FOR_BUILD for strip host reference
2. Revert one previous replace operation for fix ptest fail.
   refer oe commit: 74b5088f1cc1708db43c33ac2dc7f01f4a4db9c1

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-devtools/strace/strace_4.25.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/strace/strace_4.25.bb b/meta/recipes-devtools/strace/strace_4.25.bb
index 58f6cf6..028aa71 100644
--- a/meta/recipes-devtools/strace/strace_4.25.bb
+++ b/meta/recipes-devtools/strace/strace_4.25.bb
@@ -32,7 +32,7 @@ EXTRA_OECONF += "--enable-mpers=no"
 CFLAGS_append_libc-musl = " -Dsigcontext_struct=sigcontext"
 
 TESTDIR = "tests"
-PTEST_BUILD_HOST_PATTERN = "^(DEB_CHANGELOGTIME|RPM_CHANGELOGTIME|WARN_CFLAGS_FOR_BUILD)"
+PTEST_BUILD_HOST_PATTERN = "^(DEB_CHANGELOGTIME|RPM_CHANGELOGTIME|WARN_CFLAGS_FOR_BUILD|LDFLAGS_FOR_BUILD)"
 
 do_install_append() {
 	# We don't ship strace-graph here because it needs perl
@@ -47,6 +47,7 @@ do_install_ptest() {
 	oe_runmake -C ${TESTDIR} install-ptest BUILDDIR=${B} DESTDIR=${D}${PTEST_PATH} TESTDIR=${TESTDIR}
 	install -m 755 ${S}/test-driver ${D}${PTEST_PATH}
 	install -m 644 ${B}/config.h ${D}${PTEST_PATH}
+        sed -i -e '/^src/s/strace.*[1-9]/ptest/' ${D}/${PTEST_PATH}/${TESTDIR}/Makefile
 }
 
 RDEPENDS_${PN}-ptest += "make coreutils grep gawk sed"
-- 
2.7.4


