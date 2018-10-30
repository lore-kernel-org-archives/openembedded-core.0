Return-Path: <okaya@kernel.org>
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by mail.openembedded.org (Postfix) with ESMTP id A165878E4C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Oct 2018 23:28:16 +0000 (UTC)
Received: from
	sinanubuntu1604.mkjiurmyylmellclgttazegk5f.bx.internal.cloudapp.net
	(unknown [40.87.6.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id A0E1A2081B;
	Tue, 30 Oct 2018 23:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1540942097;
	bh=b9ks3qYg6fsExgHADRVsjGagdjmFCESkmfKzh9tXWpU=;
	h=From:To:Cc:Subject:Date:From;
	b=OiIHtBtsGIvvy1DD0LfAQ/E0Kx1g/0QXb7kGJ+OS6ALPHQC1sVAF7iUS4ChvFK2Fd
	+VA+EGBlWGHhCWjw/h3x95PFvMCg865YzRwGHnzyKVVRMlrKR0XnXp+8MkXdZEXCgV
	fGajaruORm37yMSxlNCk+UG9OPWnRcdJgn0t3ToA=
From: Sinan Kaya <okaya@kernel.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Oct 2018 23:28:15 +0000
Message-Id: <20181030232815.24575-1-okaya@kernel.org>
X-Mailer: git-send-email 2.19.0
MIME-Version: 1.0
Subject: [sumo] [PATCH v1] strace: fix ptest path not found
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
X-List-Received-Date: Tue, 30 Oct 2018 23:28:16 -0000
Content-Transfer-Encoding: 8bit

Running strace ptest is failing with file not found errors.

../../strace: Process 1990 attached
diff: ../../../ptest0/tests/strace-ff.expected: No such file or directory

Even though file is present in the /usr/lib/strace/ptest/tests
directory.

Issue is caused by sed doing a find and replace causing an incorrect
path to be generated.

Below is the srcdir and top_srcdir in the Makefile:

srcdir = ../../ptest0/tests
top_srcdir = ../../strace-4.20

Replacing this with

srcdir = .
top_srcdir = ..

old results:
===================================================
30 of 373 tests failed
(117 tests were not run)
Please report to strace-devel@lists.sourceforge.net
===================================================

new results:
===================================================
13 of 373 tests failed
(117 tests were not run)
Please report to strace-devel@lists.sourceforge.net
===================================================

Signed-off-by: Sinan Kaya <okaya@kernel.org>
---
 meta/recipes-devtools/strace/strace_4.20.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/strace/strace_4.20.bb b/meta/recipes-devtools/strace/strace_4.20.bb
index 869c12f65a..0b35f5443d 100644
--- a/meta/recipes-devtools/strace/strace_4.20.bb
+++ b/meta/recipes-devtools/strace/strace_4.20.bb
@@ -43,7 +43,8 @@ do_compile_ptest() {
 
 do_install_ptest() {
 	oe_runmake -C ${TESTDIR} install-ptest BUILDDIR=${B} DESTDIR=${D}${PTEST_PATH} TESTDIR=${TESTDIR}
-	sed -i -e '/^src/s/strace.*[1-9]/ptest/' \
+	sed -i -e 's:^srcdir =.*:srcdir = .:g' \
+	    -e 's:^top_srcdir =.*:top_srcdir = ..:g' \
 	    -e 's,--sysroot=${STAGING_DIR_TARGET},,g' \
 	    -e 's|${DEBUG_PREFIX_MAP}||g' \
 	    -e 's:${HOSTTOOLS_DIR}/::g' \
-- 
2.19.0


