Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9585B6067C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 17:27:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 1AC401811C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 19:27:22 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id GiQ7r2-qXm7z
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 19:27:20 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id 26EBA18129
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 19:27:19 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 1180515E7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 19:27:19 +0200 (CEST)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id 10A8015E5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 19:27:19 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 0C2A4102A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 19:27:19 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id u4BHRJvm028678
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 19:27:19 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id u4BHRJHn028677
	for openembedded-core@lists.openembedded.org;
	Wed, 11 May 2016 19:27:19 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 May 2016 19:27:10 +0200
Message-Id: <5688ac9522e01351f6bd183c3bf468034249ddc4.1462987580.git.pkj@axis.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1462987580.git.pkj@axis.com>
References: <cover.1462987580.git.pkj@axis.com>
In-Reply-To: <cover.1462987580.git.pkj@axis.com>
References: <cover.1462987580.git.pkj@axis.com>
Subject: [PATCH 10/16] vala.inc: Use SYSROOT_DIRS to add dirs to stage in sysroot
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
X-List-Received-Date: Wed, 11 May 2016 17:27:22 -0000

---
 meta/recipes-devtools/vala/vala.inc | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-devtools/vala/vala.inc b/meta/recipes-devtools/vala/vala.inc
index 2a8875f..37aa38f 100644
--- a/meta/recipes-devtools/vala/vala.inc
+++ b/meta/recipes-devtools/vala/vala.inc
@@ -36,15 +36,14 @@ do_install_append_class-target() {
         install ${B}/vapigen-wrapper ${D}${bindir}/
 }
 
+# Put vapigen wrapper into target sysroot so that it can be used when building
+# vapi files.
+SYSROOT_DIRS_append_class-target = " ${bindir}"
 
-SYSROOT_PREPROCESS_FUNCS_append_class-target += "vapigen_sysroot_preprocess"
-
+SYSROOT_PREPROCESS_FUNCS_append_class-target = " vapigen_sysroot_preprocess"
 vapigen_sysroot_preprocess() {
-        # Put vapigen wrapper into target sysroot so that it can be used when building vapi files.
-        sysroot_stage_dir ${D}${bindir} ${SYSROOT_DESTDIR}${bindir}
-
-        # Also, tweak the vapigen name in vapigen pkgconfig file, so that it picks up our
-        # wrapper.
+        # Tweak the vapigen name in the vapigen pkgconfig file, so that it picks
+        # up our wrapper.
         sed -i \
            -e "s|vapigen=.*|vapigen=${bindir}/vapigen-wrapper|" \
            ${SYSROOT_DESTDIR}${datadir}/pkgconfig/vapigen-${SHRT_VER}.pc
-- 
2.1.0


