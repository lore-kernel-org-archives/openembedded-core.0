Return-Path: <douglas.royds@taitradio.com>
Received: from smtp1.taitradio.net (unknown [202.37.96.23])
	by mail.openembedded.org (Postfix) with SMTP id DA7B26D0D0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Nov 2018 21:13:22 +0000 (UTC)
Received: from acheron.taitradio.net (unknown [172.16.169.141])
	by smtp1.taitradio.net (Postfix) with ESMTP id B4C361C0685;
	Thu, 29 Nov 2018 10:13:21 +1300 (NZDT)
From: Douglas Royds <douglas.royds@taitradio.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Nov 2018 10:13:16 +1300
Message-Id: <20181128211319.16648-6-douglas.royds@taitradio.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181128211319.16648-1-douglas.royds@taitradio.com>
References: <20181128045316.24102-1-douglas.royds@taitradio.com>
	<20181128211319.16648-1-douglas.royds@taitradio.com>
Subject: [PATCH v3 5/8] strace: Strip build host tool details from installed ptest Makefile
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
X-List-Received-Date: Wed, 28 Nov 2018 21:13:23 -0000

Adopt new PTEST_BUILD_HOST_PATTERN mechanism.

Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/strace/strace_4.25.bb | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/meta/recipes-devtools/strace/strace_4.25.bb b/meta/recipes-devtools/strace/strace_4.25.bb
index 117ebfbf72..58f6cf6e30 100644
--- a/meta/recipes-devtools/strace/strace_4.25.bb
+++ b/meta/recipes-devtools/strace/strace_4.25.bb
@@ -32,6 +32,7 @@ EXTRA_OECONF += "--enable-mpers=no"
 CFLAGS_append_libc-musl = " -Dsigcontext_struct=sigcontext"
 
 TESTDIR = "tests"
+PTEST_BUILD_HOST_PATTERN = "^(DEB_CHANGELOGTIME|RPM_CHANGELOGTIME|WARN_CFLAGS_FOR_BUILD)"
 
 do_install_append() {
 	# We don't ship strace-graph here because it needs perl
@@ -46,16 +47,6 @@ do_install_ptest() {
 	oe_runmake -C ${TESTDIR} install-ptest BUILDDIR=${B} DESTDIR=${D}${PTEST_PATH} TESTDIR=${TESTDIR}
 	install -m 755 ${S}/test-driver ${D}${PTEST_PATH}
 	install -m 644 ${B}/config.h ${D}${PTEST_PATH}
-	sed -i -e '/^src/s/strace.*[1-9]/ptest/' \
-	    -e 's,--sysroot=${STAGING_DIR_TARGET},,g' \
-	    -e 's|${DEBUG_PREFIX_MAP}||g' \
-	    -e 's:${HOSTTOOLS_DIR}/::g' \
-	    -e 's:${RECIPE_SYSROOT_NATIVE}::g' \
-	    -e 's:${RECIPE_SYSROOT}::g' \
-	    -e 's:${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}::g' \
-	    -e '/^DEB_CHANGELOGTIME/d' \
-	    -e '/^RPM_CHANGELOGTIME/d' \
-	${D}/${PTEST_PATH}/${TESTDIR}/Makefile
 }
 
 RDEPENDS_${PN}-ptest += "make coreutils grep gawk sed"
-- 
2.17.1


