Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 37452782DE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 17:55:19 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id c69so568259qke.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 10:55:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=e+HXzNUJHPR4nuGG8oA8nfXa4lEMdEcSHQbT+nUF17g=;
	b=kO+ZziMaqWkQorHu4JQ1ylS6WAfcaFXCrUL/G0s2HhWkdTKWpiEyFxu9YuA17UjTq2
	7qPYS/y4ptT2R6oVs/Pj/tYeY6h3kJWNr/mFiJyAUqExmmjZAu94WfaBErhf1Bmbb8ky
	xOBssYsud2ySc2e3L+9lgtBYGROp7X5U+eQxE0BqwriKMWVPWXSdQnkZXy8DLxGrDvO4
	Po5hJecgvVZZ4YQaT6XPu+EPmxmD53yO6bCevKh370aLIquwLPO1Ev3mHRNt60PfTs9j
	bUwvLaVwgBDre4WkqABGG+R31O7Sr30WAQ4k7gpQ09FtlxEIUTFvzvVP16hrMZ3lKX8j
	RB2g==
X-Gm-Message-State: AHPjjUiDgZwqCGQ/rHAvQGCohYi29tpWJFenhflAc2K1tYhvUNMyaWoW
	qwmConatafLFrDvS
X-Google-Smtp-Source: AOwi7QCncPXJTN2QqA87SRZwnLA5mue9cI9sr4xA+3fIdpHCATclWh5/LCK/3f2y6GyIObZ4Ovl8Dw==
X-Received: by 10.55.59.136 with SMTP id i130mr23909121qka.99.1505325320353;
	Wed, 13 Sep 2017 10:55:20 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	a91sm10478566qka.90.2017.09.13.10.55.16
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 13 Sep 2017 10:55:19 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Wed, 13 Sep 2017 14:55:13 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed, 13 Sep 2017 14:54:08 -0300
Message-Id: <20170913175410.23041-8-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170913175410.23041-1-otavio@ossystems.com.br>
References: <20170913175410.23041-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Will Newton <willn@resin.io>, Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v8 7/9] go.bbclass: Add ptest support
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
X-List-Received-Date: Wed, 13 Sep 2017 17:55:19 -0000

This adds ptest support for Go packages so its unittest content is
packaged and integrated onto the test framework.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v9:
- new patch

 meta/classes/go.bbclass | 62 +++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 60 insertions(+), 2 deletions(-)

diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index 4af148e302..33502bf722 100644
--- a/meta/classes/go.bbclass
+++ b/meta/classes/go.bbclass
@@ -1,4 +1,4 @@
-inherit goarch
+inherit goarch ptest
 
 def get_go_parallel_make(d):
     pm = (d.getVar('PARALLEL_MAKE') or '').split()
@@ -39,6 +39,8 @@ GO_RPATH_LINK_class-native = "${@'-Wl,-rpath-link=${STAGING_LIBDIR_NATIVE}/go/pk
 GO_EXTLDFLAGS ?= "${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS} ${GO_RPATH_LINK} ${LDFLAGS}"
 GO_LDFLAGS ?= '-ldflags="${GO_RPATH} -extldflags '${GO_EXTLDFLAGS}'"'
 export GOBUILDFLAGS ?= "-v ${GO_LDFLAGS}"
+export GOPTESTBUILDFLAGS ?= "${GOBUILDFLAGS} -c"
+export GOPTESTFLAGS ?= "-test.v"
 GOBUILDFLAGS_prepend_task-compile = "${GO_PARALLEL_BUILD} "
 
 export GO = "${HOST_PREFIX}go"
@@ -81,6 +83,13 @@ go_list_packages() {
 		egrep -v '${GO_INSTALL_FILTEROUT}'
 }
 
+go_list_package_tests() {
+    ${GO} list -f '{{.ImportPath}} {{.TestGoFiles}}' ${GOBUILDFLAGS} ${GO_INSTALL} | \
+		grep -v '\[\]$' | \
+		egrep -v '${GO_INSTALL_FILTEROUT}' | \
+		awk '{ print $1 }'
+}
+
 go_do_configure() {
 	ln -snf ${S}/src ${B}/
 }
@@ -93,9 +102,19 @@ go_do_compile() {
 }
 do_compile[cleandirs] = "${B}/bin ${B}/pkg"
 
+do_compile_ptest() {
+    rm -f ${B}/.go_compiled_tests.list
+	go_list_package_tests | while read pkg; do
+		cd ${B}/src/$pkg
+		${GO} test ${GOPTESTBUILDFLAGS} $pkg
+		find . -mindepth 1 -maxdepth 1 -type f -name '*.test' -exec echo $pkg/{} \; | \
+			sed -e's,/\./,/,'>> ${B}/.go_compiled_tests.list
+	done
+}
+
 go_do_install() {
 	install -d ${D}${libdir}/go/src/${GO_IMPORT}
-	tar -C ${S}/src/${GO_IMPORT} -cf - --exclude-vcs . | \
+	tar -C ${S}/src/${GO_IMPORT} -cf - --exclude-vcs --exclude '*.test' . | \
 		tar -C ${D}${libdir}/go/src/${GO_IMPORT} --no-same-owner -xf -
 	tar -C ${B} -cf - pkg | tar -C ${D}${libdir}/go --no-same-owner -xf -
 
@@ -105,9 +124,48 @@ go_do_install() {
 	fi
 }
 
+do_install_ptest_base() {
+set -x
+    test -f "${B}/.go_compiled_tests.list" || exit 0
+    tests=""
+    while read test; do
+        tests="$tests${tests:+ }${test%.test}"
+        testdir=`dirname $test`
+        install -d ${D}${PTEST_PATH}/$testdir
+        install -m 0755 ${B}/src/$test ${D}${PTEST_PATH}/$test
+        if [ -d "${B}/src/$testdir/testdata" ]; then
+            cp --preserve=mode,timestamps -R "${B}/src/$testdir/testdata" ${D}${PTEST_PATH}/$testdir
+        fi
+    done < ${B}/.go_compiled_tests.list
+    if [ -n "$tests" ]; then
+        install -d ${D}${PTEST_PATH}
+        cat >${D}${PTEST_PATH}/run-ptest <<EOF
+#!/bin/sh
+ANYFAILED=0
+for t in $tests; do
+    testdir=\`dirname \$t.test\`
+    if ( cd "${PTEST_PATH}/\$testdir"; "${PTEST_PATH}/\$t.test" ${GOPTESTFLAGS} | tee /dev/fd/9 | grep -q "^FAIL" ) 9>&1; then
+        ANYFAILED=1
+    fi
+done
+if [ \$ANYFAILED -ne 0 ]; then
+    echo "FAIL: ${PN}"
+    exit 1
+fi
+echo "PASS: ${PN}"
+exit 0
+EOF
+        chmod +x ${D}${PTEST_PATH}/run-ptest
+    else
+        rm -rf ${D}${PTEST_PATH}
+    fi
+set +x
+}
+
 EXPORT_FUNCTIONS do_unpack do_configure do_compile do_install
 
 FILES_${PN}-dev = "${libdir}/go/src"
 FILES_${PN}-staticdev = "${libdir}/go/pkg"
 
 INSANE_SKIP_${PN} += "ldflags"
+INSANE_SKIP_${PN}-ptest += "ldflags"
-- 
2.14.1


