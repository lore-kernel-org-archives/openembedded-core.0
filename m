Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A300D60097
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Oct 2014 05:27:27 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9R5RQ0m003147
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Oct 2014 22:27:28 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Sun, 26 Oct 2014 22:27:27 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 27 Oct 2014 13:24:23 +0800
Message-ID: <ebfd22f5a118f7c9352aebb97b46a9a7f5e39e3d.1414387266.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1414387265.git.Chong.Lu@windriver.com>
References: <cover.1414387265.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V3 1/1] kmod: fix debuginfo is missing in shared library
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
X-List-Received-Date: Mon, 27 Oct 2014 05:27:38 -0000
Content-Type: text/plain

INHIBIT_PACKAGE_STRIP variable will make debuginfo lose in shared library.
The test cases of kmod contain kernel modules for many different architectures,
strip and arch gets confused and throws errors. Pack kernel modules in test
cases to avoid strip command failed.

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta/recipes-kernel/kmod/kmod/run-ptest | 2 ++
 meta/recipes-kernel/kmod/kmod_git.bb    | 9 ++++++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/kmod/kmod/run-ptest b/meta/recipes-kernel/kmod/kmod/run-ptest
index 37adec3..598dd2c 100755
--- a/meta/recipes-kernel/kmod/kmod/run-ptest
+++ b/meta/recipes-kernel/kmod/kmod/run-ptest
@@ -1,3 +1,5 @@
 #!/bin/sh
 touch testsuite/stamp-rootfs
+tar xf testmodule.tar
 make -k runtest-TESTS 2>/dev/null| grep -e ^PASS -e ^FAIL
+find testsuite -name *.ko -exec rm -f {} \;
diff --git a/meta/recipes-kernel/kmod/kmod_git.bb b/meta/recipes-kernel/kmod/kmod_git.bb
index d4c21a4..08dd815 100644
--- a/meta/recipes-kernel/kmod/kmod_git.bb
+++ b/meta/recipes-kernel/kmod/kmod_git.bb
@@ -34,6 +34,10 @@ do_install_append () {
         # install depmod.d file for search/ dir
         install -Dm644 "${WORKDIR}/depmod-search.conf" "${D}${base_libdir}/depmod.d/search.conf"
 
+        if ${@base_contains('DISTRO_FEATURES', 'ptest', 'true', 'false', d)}; then
+                find testsuite -name *.ko -exec tar rf testmodule.tar {} \;
+                find testsuite -name *.ko -exec rm -f {} \;
+        fi
 }
 
 do_compile_prepend() {
@@ -44,7 +48,10 @@ do_compile_ptest () {
         oe_runmake buildtest-TESTS rootfs
 }
 
-INHIBIT_PACKAGE_STRIP = "${@bb.utils.contains("DISTRO_FEATURES", "ptest", "1", "0", d)}"
+do_install_ptest () {
+        install testmodule.tar ${D}${PTEST_PATH}
+}
+
 INSANE_SKIP_${PN}-ptest = "arch"
 
 inherit update-alternatives
-- 
1.9.1


