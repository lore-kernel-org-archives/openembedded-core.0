Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 52F01744BE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Apr 2018 03:26:15 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w3O3QE38005754
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 23 Apr 2018 20:26:14 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Mon, 23 Apr 2018 20:26:13 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>, <bruce.ashfield@gmail.com>
Date: Tue, 24 Apr 2018 11:33:47 +0800
Message-ID: <1524540827-10204-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH V3] perf: make a copy of kernel source to perf workdir
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
X-List-Received-Date: Tue, 24 Apr 2018 03:26:15 -0000
Content-Type: text/plain

Since perf contaminates linux shared workdir, it probably caused
kernel-devsrc compile failure at world build.
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

[YOCTO #10880]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-kernel/perf/perf.bb | 31 ++++++++++++++++++++++++++-----
 1 file changed, 26 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 872b5f0..fb4e3ac 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -61,7 +61,7 @@ export PERL_ARCHLIB = "${STAGING_LIBDIR}${PERL_OWN_DIR}/perl/${@get_perl_version
 
 inherit kernelsrc
 
-B = "${WORKDIR}/${BPN}-${PV}"
+S = "${WORKDIR}/${BP}"
 SPDX_S = "${S}/tools/perf"
 
 # The LDFLAGS is required or some old kernels fails due missing
@@ -97,6 +97,16 @@ EXTRA_OEMAKE += "\
     'infodir=${@os.path.relpath(infodir, prefix)}' \
 "
 
+PERF_SRC ?= "Makefile \
+             tools/arch \
+             tools/build \
+             tools/include \
+             tools/lib \
+             tools/Makefile \
+             tools/perf \
+             tools/scripts \
+"
+
 PERF_EXTRA_LDFLAGS = ""
 
 # MIPS N32
@@ -119,11 +129,22 @@ do_install() {
 	fi
 }
 
-do_configure_prepend () {
-    # Fix for rebuilding
-    rm -rf ${B}/
-    mkdir -p ${B}/
+do_configure[prefuncs] += "copy_perf_source_from_kernel"
+python copy_perf_source_from_kernel() {
+    sources = (d.getVar("PERF_SRC") or "").split()
+    src_dir = d.getVar("STAGING_KERNEL_DIR")
+    dest_dir = d.getVar("S")
+    bb.utils.mkdirhier(dest_dir)
+    for s in sources:
+        src = oe.path.join(src_dir, s)
+        dest = oe.path.join(dest_dir, s)
+        if os.path.isdir(src):
+            oe.path.copyhardlinktree(src, dest)
+        else:
+            bb.utils.copyfile(src, dest)
+}
 
+do_configure_prepend () {
     # If building a multlib based perf, the incorrect library path will be
     # detected by perf, since it triggers via: ifeq ($(ARCH),x86_64). In a 32 bit
     # build, with a 64 bit multilib, the arch won't match and the detection of a 
-- 
2.7.4


