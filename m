Return-Path: <Zhe.He@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6ED986086C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2020 04:08:57 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 01H48bkX016975
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2020 20:08:47 -0800
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Sun, 16 Feb 2020 20:08:27 -0800
From: <zhe.he@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 17 Feb 2020 12:08:25 +0800
Message-ID: <1581912505-213892-1-git-send-email-zhe.he@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] lttng-modules: Work around yocto bug 13424
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
X-List-Received-Date: Mon, 17 Feb 2020 04:08:57 -0000
Content-Type: text/plain

From: He Zhe <zhe.he@windriver.com>

Before Yocto bug 13424 is fixed, devupstream cannot work with multilib.
To provide git based lttng-modules recipe for latest source code, let's
just include tarball based recipe and overwrite related variables.

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 meta/recipes-kernel/lttng/lttng-modules_2.11.1.bb | 12 ------------
 meta/recipes-kernel/lttng/lttng-modules_git.bb    | 11 +++++++++++
 2 files changed, 11 insertions(+), 12 deletions(-)
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules_git.bb

diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.11.1.bb b/meta/recipes-kernel/lttng/lttng-modules_2.11.1.bb
index c833ff7..4e75c6e 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.11.1.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.11.1.bb
@@ -29,15 +29,3 @@ python do_package_prepend() {
     if not os.path.exists(os.path.join(d.getVar('D'), d.getVar('nonarch_base_libdir')[1:], 'modules')):
         bb.warn("%s: no modules were created; this may be due to CONFIG_TRACEPOINTS not being enabled in your kernel." % d.getVar('PN'))
 }
-
-BBCLASSEXTEND = "devupstream:target"
-LIC_FILES_CHKSUM_class-devupstream = "file://LICENSE;md5=3f882d431dc0f32f1f44c0707aa41128"
-DEFAULT_PREFERENCE_class-devupstream = "-1"
-SRC_URI_class-devupstream = "git://git.lttng.org/lttng-modules;branch=stable-2.11 \
-           file://Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch \
-           file://BUILD_RUNTIME_BUG_ON-vs-gcc7.patch \
-           "
-SRCREV_class-devupstream = "6ad0e68b43c3e52fcb3d47c4d823a7b84aeb443a"
-PV_class-devupstream = "2.11.1+git${SRCPV}"
-S_class-devupstream = "${WORKDIR}/git"
-SRCREV_FORMAT ?= "lttng_git"
diff --git a/meta/recipes-kernel/lttng/lttng-modules_git.bb b/meta/recipes-kernel/lttng/lttng-modules_git.bb
new file mode 100644
index 0000000..c6d1924
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules_git.bb
@@ -0,0 +1,11 @@
+require lttng-modules_2.11.1.bb
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3f882d431dc0f32f1f44c0707aa41128"
+DEFAULT_PREFERENCE = "-1"
+SRC_URI = "git://git.lttng.org/lttng-modules;branch=stable-2.11 \
+           file://Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch \
+           file://BUILD_RUNTIME_BUG_ON-vs-gcc7.patch \
+           "
+SRCREV = "6ad0e68b43c3e52fcb3d47c4d823a7b84aeb443a"
+PV = "2.11.1+git${SRCPV}"
+S = "${WORKDIR}/git"
-- 
2.7.4


