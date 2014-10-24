Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CD22E65D3C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Oct 2014 06:28:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9O6S5DI011534
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Oct 2014 23:28:05 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Thu, 23 Oct 2014 23:28:05 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 24 Oct 2014 14:25:16 +0800
Message-ID: <a7d924a83ec81fcff71ba17281c892f1f3778495.1414131798.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1414131798.git.Chong.Lu@windriver.com>
References: <cover.1414131798.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 1/1] kmod: fix debuginfo is missing in shared library
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
X-List-Received-Date: Fri, 24 Oct 2014 06:28:09 -0000
Content-Type: text/plain

INHIBIT_PACKAGE_STRIP variable will make debuginfo lose in shared library.
Pack kernel modules in test cases to avoid strip command failed.

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta/recipes-kernel/kmod/kmod/run-ptest | 1 +
 meta/recipes-kernel/kmod/kmod_git.bb    | 9 ++++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/kmod/kmod/run-ptest b/meta/recipes-kernel/kmod/kmod/run-ptest
index 37adec3..4ed8715 100755
--- a/meta/recipes-kernel/kmod/kmod/run-ptest
+++ b/meta/recipes-kernel/kmod/kmod/run-ptest
@@ -1,3 +1,4 @@
 #!/bin/sh
 touch testsuite/stamp-rootfs
+tar xf testmodule.tar
 make -k runtest-TESTS 2>/dev/null| grep -e ^PASS -e ^FAIL
diff --git a/meta/recipes-kernel/kmod/kmod_git.bb b/meta/recipes-kernel/kmod/kmod_git.bb
index d4c21a4..8a23ac4 100644
--- a/meta/recipes-kernel/kmod/kmod_git.bb
+++ b/meta/recipes-kernel/kmod/kmod_git.bb
@@ -34,6 +34,10 @@ do_install_append () {
         # install depmod.d file for search/ dir
         install -Dm644 "${WORKDIR}/depmod-search.conf" "${D}${base_libdir}/depmod.d/search.conf"
 
+        if ${@base_contains('DISTRO_FEATURES', 'ptest', 'true', 'false', d)}; then
+                find testsuite -name \*.ko -exec tar rf testmodule.tar {} \;
+                find testsuite -name \*.ko -exec rm -f {} \;
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


