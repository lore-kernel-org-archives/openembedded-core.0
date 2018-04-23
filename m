Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1AD9271C1F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Apr 2018 08:06:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w3N86P8S015611
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 23 Apr 2018 01:06:25 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Mon, 23 Apr 2018 01:06:23 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <bruce.ashfield@windriver.com>
Date: Mon, 23 Apr 2018 16:13:58 +0800
Message-ID: <1524471238-4908-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH V2] perf: make a copy of kernel source to perf workdir
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
X-List-Received-Date: Mon, 23 Apr 2018 08:06:25 -0000
Content-Type: text/plain

Since perf modify kernel source which shared by multiple
recipes, it probably caused kernel-devsrc compile failure
at world build.
...
|0 blocks
|cpio: ./tools/perf/arch/arm/util/sedr7ORqk: Cannot stat:
No such file or directory
|0 blocks
...
cpio tried to find a file at ${S}/tools/perf and failed
if the input list is not valid.

Make a copy of kernel shared source directory into a perf workdir
could fix the issue.

Drop `Fix for rebuilding' which is obsolete

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-kernel/perf/perf.bb | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 872b5f0..8b40806 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -61,7 +61,7 @@ export PERL_ARCHLIB = "${STAGING_LIBDIR}${PERL_OWN_DIR}/perl/${@get_perl_version
 
 inherit kernelsrc
 
-B = "${WORKDIR}/${BPN}-${PV}"
+S = "${WORKDIR}/${BP}"
 SPDX_S = "${S}/tools/perf"
 
 # The LDFLAGS is required or some old kernels fails due missing
@@ -119,11 +119,12 @@ do_install() {
 	fi
 }
 
-do_configure_prepend () {
-    # Fix for rebuilding
-    rm -rf ${B}/
-    mkdir -p ${B}/
+do_configure[prefuncs] += "git_clone_kernel_source"
+git_clone_kernel_source () {
+    git clone --single-branch ${STAGING_KERNEL_DIR} ${S}
+}
 
+do_configure_prepend () {
     # If building a multlib based perf, the incorrect library path will be
     # detected by perf, since it triggers via: ifeq ($(ARCH),x86_64). In a 32 bit
     # build, with a 64 bit multilib, the arch won't match and the detection of a 
-- 
2.7.4


