Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id D3D2C731B9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 17:27:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 6F8C82E1BE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 19:27:20 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id HOeZ0scDECqp
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 19:27:19 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bes.se.axis.com (Postfix) with ESMTP id 3AC3B2E1B1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 19:27:19 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 22A9C160B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 19:27:19 +0200 (CEST)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id 2165415E8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 19:27:19 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 1C3EB102A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 19:27:19 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id u4BHRJDV028685
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 19:27:19 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id u4BHRJOn028684
	for openembedded-core@lists.openembedded.org;
	Wed, 11 May 2016 19:27:19 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 May 2016 19:27:11 +0200
Message-Id: <776f88cfe075638b09423e1a0f409eb8f5b1cac6.1462987580.git.pkj@axis.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1462987580.git.pkj@axis.com>
References: <cover.1462987580.git.pkj@axis.com>
In-Reply-To: <cover.1462987580.git.pkj@axis.com>
References: <cover.1462987580.git.pkj@axis.com>
Subject: [PATCH 11/16] gobject-introspection: Use SYSROOT_DIRS to add dirs to stage in sysroot
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
X-List-Received-Date: Wed, 11 May 2016 17:27:23 -0000

---
 .../gobject-introspection/gobject-introspection_1.46.0.bb        | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.46.0.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.46.0.bb
index 47102ca..861af5f 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.46.0.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.46.0.bb
@@ -151,13 +151,12 @@ FILES_${PN}-staticdev += "${libdir}/gobject-introspection/giscanner/*.a"
 
 # we need target versions of introspection tools in sysroot so that they can be run via qemu
 # when building introspection files in other packages
-SYSROOT_PREPROCESS_FUNCS_append_class-target += "gi_binaries_sysroot_preprocess"
+SYSROOT_DIRS_append_class-target = " ${bindir}"
 
+SYSROOT_PREPROCESS_FUNCS_append_class-target = " gi_binaries_sysroot_preprocess"
 gi_binaries_sysroot_preprocess() {
-        sysroot_stage_dir ${D}${bindir} ${SYSROOT_DESTDIR}${bindir}
-
-        # Also, tweak the binary names in introspection pkgconfig file, so that it picks up our 
-        # wrappers which do the cross-compile and qemu magic.
+        # Tweak the binary names in the introspection pkgconfig file, so that it
+        # picks up our wrappers which do the cross-compile and qemu magic.
         sed -i \
            -e "s|g_ir_scanner=.*|g_ir_scanner=${bindir}/g-ir-scanner-wrapper|" \
            -e "s|g_ir_compiler=.*|g_ir_compiler=${bindir}/g-ir-compiler-wrapper|" \
-- 
2.1.0


