Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2E2C06FFF7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 17:27:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id F37651811D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 19:27:19 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id nAP46kQtR4Jx
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 19:27:19 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id 16C0E18123
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 19:27:19 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 015FD14B6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 19:27:19 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id 000AF160E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 19:27:19 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id F2C3B1022
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 19:27:18 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id u4BHRIX4028674
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 19:27:18 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id u4BHRIuH028673
	for openembedded-core@lists.openembedded.org;
	Wed, 11 May 2016 19:27:18 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 May 2016 19:27:09 +0200
Message-Id: <a0f5331c2d15b6a12388a5e1eccc37f116e537a3.1462987580.git.pkj@axis.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1462987580.git.pkj@axis.com>
References: <cover.1462987580.git.pkj@axis.com>
In-Reply-To: <cover.1462987580.git.pkj@axis.com>
References: <cover.1462987580.git.pkj@axis.com>
Subject: [PATCH 09/16] signing-keys: Use SYSROOT_DIRS to add dirs to stage in sysroot
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
X-List-Received-Date: Wed, 11 May 2016 17:27:20 -0000

---
 meta/recipes-core/meta/signing-keys.bb | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/meta/signing-keys.bb b/meta/recipes-core/meta/signing-keys.bb
index e843301..ea7400b 100644
--- a/meta/recipes-core/meta/signing-keys.bb
+++ b/meta/recipes-core/meta/signing-keys.bb
@@ -12,6 +12,8 @@ inherit allarch deploy
 EXCLUDE_FROM_WORLD = "1"
 INHIBIT_DEFAULT_DEPS = "1"
 
+SYSROOT_DIRS += "${sysconfdir}/pki"
+
 PACKAGES =+ "${PN}-ipk ${PN}-rpm ${PN}-packagefeed"
 
 FILES_${PN}-rpm = "${sysconfdir}/pki/rpm-gpg"
@@ -54,10 +56,6 @@ do_install () {
     fi
 }
 
-sysroot_stage_all_append () {
-    sysroot_stage_dir ${D}${sysconfdir}/pki ${SYSROOT_DESTDIR}${sysconfdir}/pki
-}
-
 do_deploy () {
     if [ -f "${B}/rpm-key" ]; then
         install -D -m 0644 "${B}/rpm-key" "${DEPLOYDIR}/RPM-GPG-KEY-${DISTRO_VERSION}"
-- 
2.1.0


