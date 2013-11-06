Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 165686D437
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Nov 2013 22:58:46 +0000 (UTC)
Received: from localhost.localdomain (chello080108009040.14.11.vie.surfer.at
	[80.108.9.40]) by ptmx.org (Postfix) with ESMTPSA id 997B32B378
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Nov 2013 23:58:47 +0100 (CET)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Nov 2013 23:59:43 +0100
Message-Id: <1383778783-22034-1-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 1.8.4.1
Subject: [PATCH] orc: version 0.4.18 migrated from meta-oe
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
X-List-Received-Date: Wed, 06 Nov 2013 22:58:47 -0000

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 meta/recipes-devtools/orc/orc.inc       | 25 +++++++++++++++++++++++++
 meta/recipes-devtools/orc/orc_0.4.18.bb |  6 ++++++
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-devtools/orc/orc.inc
 create mode 100644 meta/recipes-devtools/orc/orc_0.4.18.bb

diff --git a/meta/recipes-devtools/orc/orc.inc b/meta/recipes-devtools/orc/orc.inc
new file mode 100644
index 0000000..6fd66a3
--- /dev/null
+++ b/meta/recipes-devtools/orc/orc.inc
@@ -0,0 +1,25 @@
+DESCRIPTION = "orc - The Oil Runtime Compiler"
+HOMEPAGE = "http://code.entropywave.com/projects/orc/"
+LICENSE = "BSD-2-Clause & BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1400bd9d09e8af56b9ec982b3d85797e"
+
+INC_PR = "r2"
+
+SRC_URI = "http://code.entropywave.com/download/orc/orc-${PV}.tar.gz;name=orc"
+
+inherit autotools pkgconfig
+
+BBCLASSEXTEND = "native nativesdk"
+
+PACKAGES =+ "orc-examples"
+FILES_orc-examples = "${libdir}/orc/*"
+FILES_${PN} = "${bindir}/*"
+
+python populate_packages_prepend () {
+    libdir = d.expand('${libdir}')
+    do_split_packages(d, libdir, '^lib(.*)\.so\.*', 'lib%s', 'ORC %s library', extra_depends='', allow_links=True)
+}
+
+do_compile_prepend_virtclass-native () {
+    sed -i -e 's#/tmp#.#g' ${S}/orc/orccodemem.c
+}
diff --git a/meta/recipes-devtools/orc/orc_0.4.18.bb b/meta/recipes-devtools/orc/orc_0.4.18.bb
new file mode 100644
index 0000000..2375d8c
--- /dev/null
+++ b/meta/recipes-devtools/orc/orc_0.4.18.bb
@@ -0,0 +1,6 @@
+require orc.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI[orc.md5sum] = "1a2552e8d127526c48d644fe6437b377"
+SRC_URI[orc.sha256sum] = "34d3c8a7259f42bed4dcfbc106c5e3d0cc8e17eeaa73128d1c5eaf92883a6a24"
-- 
1.8.4.1


