Return-Path: <Zhe.He@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7506A7E76E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2019 11:13:29 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x5CBD55H009378
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2019 04:13:20 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Wed, 12 Jun 2019 04:12:49 -0700
From: <zhe.he@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 12 Jun 2019 19:12:47 +0800
Message-ID: <1560337967-208223-1-git-send-email-zhe.he@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH v3] lttng-modules: Add git based recipe
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
X-List-Received-Date: Wed, 12 Jun 2019 11:13:29 -0000
Content-Type: text/plain

From: He Zhe <zhe.he@windriver.com>

The git based recipe is for those who want to build lttng-modules with bleeding
edge kernel, to avoid regularly backporting patches from upstream.

Note that PREFERRED_VERSION needs to be set to select the git recipe instead of
the tar ball one.

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
v2: Correct a typo in SOB in 0001
v3: Use devupstream to make it more clean and clear

 meta/recipes-kernel/lttng/lttng-modules_2.10.9.bb | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.10.9.bb b/meta/recipes-kernel/lttng/lttng-modules_2.10.9.bb
index 70a6843..dfd166a 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.10.9.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.10.9.bb
@@ -11,7 +11,6 @@ inherit module
 
 COMPATIBLE_HOST = '(x86_64|i.86|powerpc|aarch64|mips|nios2|arm|riscv).*-linux'
 
-#https://lttng.org/files/lttng-modules/lttng-modules-2.10.7.tar.bz2
 SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch \
            file://BUILD_RUNTIME_BUG_ON-vs-gcc7.patch \
@@ -34,3 +33,13 @@ python do_package_prepend() {
         bb.warn("%s: no modules were created; this may be due to CONFIG_TRACEPOINTS not being enabled in your kernel." % d.getVar('PN'))
 }
 
+BBCLASSEXTEND = "devupstream:target"
+LIC_FILES_CHKSUM_class-devupstream = "file://LICENSE;md5=3f882d431dc0f32f1f44c0707aa41128"
+DEFAULT_PREFERENCE_class-devupstream = "-1"
+SRC_URI_class-devupstream = "git://git.lttng.org/lttng-modules;branch=master \
+           file://Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch \
+           file://BUILD_RUNTIME_BUG_ON-vs-gcc7.patch \
+           "
+SRCREV_class-devupstream = "${AUTOREV}"
+PV_class-devupstream = "2.11.0-rc+git${SRCPV}"
+S_class-devupstream = "${WORKDIR}/git"
-- 
2.7.4


