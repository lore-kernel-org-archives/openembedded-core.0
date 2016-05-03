Return-Path: <maxin.john@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 480F27318F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 May 2016 14:49:57 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 03 May 2016 07:49:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,572,1455004800"; d="scan'208";a="957918156"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 03 May 2016 07:49:58 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 8E90E6A4006
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 May 2016 08:37:32 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 May 2016 17:49:46 +0300
Message-Id: <1462286989-22848-8-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1462286989-22848-1-git-send-email-maxin.john@intel.com>
References: <1462286989-22848-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 07/10] orc: upgrade to 0.4.25
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
X-List-Received-Date: Tue, 03 May 2016 14:49:57 -0000

0.4.24 -> 0.4.25

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-devtools/orc/orc_0.4.24.bb | 27 ---------------------------
 meta/recipes-devtools/orc/orc_0.4.25.bb | 27 +++++++++++++++++++++++++++
 2 files changed, 27 insertions(+), 27 deletions(-)
 delete mode 100644 meta/recipes-devtools/orc/orc_0.4.24.bb
 create mode 100644 meta/recipes-devtools/orc/orc_0.4.25.bb

diff --git a/meta/recipes-devtools/orc/orc_0.4.24.bb b/meta/recipes-devtools/orc/orc_0.4.24.bb
deleted file mode 100644
index 520f88d..0000000
--- a/meta/recipes-devtools/orc/orc_0.4.24.bb
+++ /dev/null
@@ -1,27 +0,0 @@
-SUMMARY = "Optimised Inner Loop Runtime Compiler"
-HOMEPAGE = "http://gstreamer.freedesktop.org/modules/orc.html"
-LICENSE = "BSD-2-Clause & BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://COPYING;md5=1400bd9d09e8af56b9ec982b3d85797e"
-
-SRC_URI = "http://gstreamer.freedesktop.org/src/orc/orc-${PV}.tar.xz"
-
-SRC_URI[md5sum] = "9e793ec34c0e20339659dd4bbbf62135"
-SRC_URI[sha256sum] = "338cd493b5247300149821c6312bdf7422a3593ae98691fc75d7e4fe727bd39b"
-
-inherit autotools pkgconfig
-
-BBCLASSEXTEND = "native nativesdk"
-
-PACKAGES =+ "orc-examples"
-PACKAGES_DYNAMIC += "^liborc-.*"
-FILES_orc-examples = "${libdir}/orc/*"
-FILES_${PN} = "${bindir}/*"
-
-python populate_packages_prepend () {
-    libdir = d.expand('${libdir}')
-    do_split_packages(d, libdir, '^lib(.*)\.so\.*', 'lib%s', 'ORC %s library', extra_depends='', allow_links=True)
-}
-
-do_compile_prepend_class-native () {
-    sed -i -e 's#/tmp#.#g' ${S}/orc/orccodemem.c
-}
diff --git a/meta/recipes-devtools/orc/orc_0.4.25.bb b/meta/recipes-devtools/orc/orc_0.4.25.bb
new file mode 100644
index 0000000..f3bde46
--- /dev/null
+++ b/meta/recipes-devtools/orc/orc_0.4.25.bb
@@ -0,0 +1,27 @@
+SUMMARY = "Optimised Inner Loop Runtime Compiler"
+HOMEPAGE = "http://gstreamer.freedesktop.org/modules/orc.html"
+LICENSE = "BSD-2-Clause & BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1400bd9d09e8af56b9ec982b3d85797e"
+
+SRC_URI = "http://gstreamer.freedesktop.org/src/orc/orc-${PV}.tar.xz"
+
+SRC_URI[md5sum] = "8582a28b15f53110c88d8043d9f55bcf"
+SRC_URI[sha256sum] = "c1b1d54a58f26d483f0b3881538984789fe5d5460ab8fab74a1cacbd3d1c53d1"
+
+inherit autotools pkgconfig
+
+BBCLASSEXTEND = "native nativesdk"
+
+PACKAGES =+ "orc-examples"
+PACKAGES_DYNAMIC += "^liborc-.*"
+FILES_orc-examples = "${libdir}/orc/*"
+FILES_${PN} = "${bindir}/*"
+
+python populate_packages_prepend () {
+    libdir = d.expand('${libdir}')
+    do_split_packages(d, libdir, '^lib(.*)\.so\.*', 'lib%s', 'ORC %s library', extra_depends='', allow_links=True)
+}
+
+do_compile_prepend_class-native () {
+    sed -i -e 's#/tmp#.#g' ${S}/orc/orccodemem.c
+}
-- 
2.4.0


