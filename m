Return-Path: <xiao.zhang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E6CE67886A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Mar 2018 09:13:40 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w2C9DgpS017356
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Mar 2018 02:13:42 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 12 Mar 2018 02:13:04 -0700
From: Zhang Xiao <xiao.zhang@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <mark.hatle@windriver.com>
Date: Mon, 12 Mar 2018 02:13:00 -0700
Message-ID: <20180312091303.121887-4-xiao.zhang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180312091303.121887-1-xiao.zhang@windriver.com>
References: <20180312091303.121887-1-xiao.zhang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/7] gobject-introspection: fix file conflict when multilib enabled
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
X-List-Received-Date: Mon, 12 Mar 2018 09:13:41 -0000
Content-Type: text/plain

Script files conflict between 32 and 64 bit packages:
${bindir}/g-ir-annotation-tool
${bindir}/g-ir-compiler-wrapper
${bindir}/g-ir-scanner
${bindir}/g-ir-scanner-lddwrapper
${bindir}/g-ir-scanner-qemuwrapper
${bindir}/g-ir-scanner-wrapper
${datadir}/gir-1.0/GLib-2.0.gir

Use update-alternatives to add base_libdir as suffix to avoid it.

Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
---
 .../gobject-introspection_1.54.1.bb                | 34 +++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.54.1.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.54.1.bb
index 85c8001dea..d9d5825a78 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.54.1.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.54.1.bb
@@ -19,9 +19,41 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/1.54/${BPN}-${PV}.tar.xz \
 SRC_URI[md5sum] = "126c29e4d54adbed2ed4e2b04483de41"
 SRC_URI[sha256sum] = "b88ded5e5f064ab58a93aadecd6d58db2ec9d970648534c63807d4f9a7bb877e"
 
-inherit autotools pkgconfig gtk-doc python3native qemu gobject-introspection-data upstream-version-is-even
+inherit autotools pkgconfig gtk-doc python3native qemu gobject-introspection-data upstream-version-is-even update-alternatives
 BBCLASSEXTEND = "native"
 
+MULTILIB_SUFFIX = "${@d.getVar('base_libdir',1).split('/')[-1]}"
+ALTERNATIVE_${PN} = "annotation-tool compiler-wrapper scanner scanner-lddwrapper scanner-qemuwrapper scanner-wrapper"
+ALTERNATIVE_${PN}-dev = "GLib-2.0.gir"
+ALTERNATIVE_LINK_NAME[annotation-tool] = "${bindir}/g-ir-annotation-tool"
+ALTERNATIVE_TARGET[annotation-tool] = "${bindir}/g-ir-annotation-tool-${MULTILIB_SUFFIX}"
+ALTERNATIVE_LINK_NAME[compiler-wrapper] = "${bindir}/g-ir-compiler-wrapper"
+ALTERNATIVE_TARGET[compiler-wrapper] = "${bindir}/g-ir-compiler-wrapper-${MULTILIB_SUFFIX}"
+ALTERNATIVE_LINK_NAME[scanner] = "${bindir}/g-ir-scanner"
+ALTERNATIVE_TARGET[scanner] = "${bindir}/g-ir-scanner-${MULTILIB_SUFFIX}"
+ALTERNATIVE_LINK_NAME[scanner-lddwrapper] = "${bindir}/g-ir-scanner-lddwrapper"
+ALTERNATIVE_TARGET[scanner-lddwrapper] = "${bindir}/g-ir-scanner-lddwrapper-${MULTILIB_SUFFIX}"
+ALTERNATIVE_LINK_NAME[scanner-qemuwrapper] = "${bindir}/g-ir-scanner-qemuwrapper"
+ALTERNATIVE_TARGET[scanner-qemuwrapper] = "${bindir}/g-ir-scanner-qemuwrapper-${MULTILIB_SUFFIX}"
+ALTERNATIVE_LINK_NAME[scanner-wrapper] = "${bindir}/g-ir-scanner-wrapper"
+ALTERNATIVE_TARGET[scanner-wrapper] = "${bindir}/g-ir-scanner-wrapper-${MULTILIB_SUFFIX}"
+ALTERNATIVE_LINK_NAME[GLib-2.0.gir] = "${datadir}/gir-1.0/GLib-2.0.gir"
+ALTERNATIVE_TARGET[GLib-2.0.gir] = "${datadir}/gir-1.0/GLib-2.0.gir-${MULTILIB_SUFFIX}"
+
+FILES_${PN}-dev += "${datadir}/gir-1.0/GLib-2.0.gir-${MULTILIB_SUFFIX}"
+
+PACKAGE_PREPROCESS_FUNCS += "gobject_alternative_rename"
+
+gobject_alternative_rename() {
+        mv ${PKGD}${bindir}/g-ir-annotation-tool ${PKGD}${bindir}/g-ir-annotation-tool-${MULTILIB_SUFFIX}
+        mv ${PKGD}${bindir}/g-ir-compiler-wrapper ${PKGD}${bindir}/g-ir-compiler-wrapper-${MULTILIB_SUFFIX}
+        mv ${PKGD}${bindir}/g-ir-scanner ${PKGD}${bindir}/g-ir-scanner-${MULTILIB_SUFFIX}
+        mv ${PKGD}${bindir}/g-ir-scanner-lddwrapper ${PKGD}${bindir}/g-ir-scanner-lddwrapper-${MULTILIB_SUFFIX}
+        mv ${PKGD}${bindir}/g-ir-scanner-qemuwrapper ${PKGD}${bindir}/g-ir-scanner-qemuwrapper-${MULTILIB_SUFFIX}
+        mv ${PKGD}${bindir}/g-ir-scanner-wrapper ${PKGD}${bindir}/g-ir-scanner-wrapper-${MULTILIB_SUFFIX}
+        mv ${PKGD}${datadir}/gir-1.0/GLib-2.0.gir ${PKGD}${datadir}/gir-1.0/GLib-2.0.gir-${MULTILIB_SUFFIX}
+}
+
 # needed for writing out the qemu wrapper script
 export STAGING_DIR_HOST
 export B
-- 
2.11.0


