Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 595C778976
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jan 2018 09:33:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w089XCK1017262
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 8 Jan 2018 01:33:13 -0800
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Mon, 8 Jan 2018 01:33:12 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 8 Jan 2018 17:33:07 +0800
Message-ID: <52715e2d358efeb1c7eda5ae1fa5a2429220606a.1515403603.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1515403603.git.liezhi.yang@windriver.com>
References: <cover.1515403603.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 10/12] toolchain-scripts.bbclass: only install all MULTILIB_VARIANTS for image
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
X-List-Received-Date: Mon, 08 Jan 2018 09:33:11 -0000
Content-Type: text/plain

Install all MULTILIB_VARIANTS to sysroot and pack them only makes sense to
image recipe, so limit it to image recipe only, and it can fix:
MACHINE = "qemux86-64"
require conf/multilib.conf
MULTILIBS = "multilib:lib32"
DEFAULTTUNE_virtclass-multilib-lib32 = "core2-32"

$ bitbake lib32-meta-ide-support
WARNING: lib32-meta-ide-support-1.0-r3 do_configure: Manifest for ncurses not found, searched manifests:
/workspace2/lyang1/test_mlwarn/tmp-glibc/sstate-control/manifest-qemux86_64-ncurses.populate_sysroot
/workspace2/lyang1/test_mlwarn/tmp-glibc/sstate-control/manifest-core2-32-ncurses.populate_sysroot
/workspace2/lyang1/test_mlwarn/tmp-glibc/sstate-control/manifest-i586-ncurses.populate_sysroot
/workspace2/lyang1/test_mlwarn/tmp-glibc/sstate-control/manifest-x86-ncurses.populate_sysroot
/workspace2/lyang1/test_mlwarn/tmp-glibc/sstate-control/manifest-allarch-ncurses.populate_sysroot

This is because core2-64 is not in lib32-meta-ide-support's
PACKAGE_ARCHS which doesn't like image recipe (lib32-image recipe's
DEFAULTTUNE is not overridded)

[YOCTO #12298]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/toolchain-scripts.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index 9bcfe70..1721884 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -151,6 +151,12 @@ toolchain_create_sdk_siteconfig[vardepsexclude] = "TOOLCHAIN_CONFIGSITE_SYSROOTC
 
 python __anonymous () {
     import oe.classextend
+
+    # Install all MULTILIB_VARIANTS to sysroot and pack them only makes sense to
+    # image recipe.
+    if not bb.data.inherits_class('image', d):
+        return
+
     deps = ""
     for dep in (d.getVar('TOOLCHAIN_NEED_CONFIGSITE_CACHE') or "").split():
         deps += " %s:do_populate_sysroot" % dep
-- 
2.7.4


