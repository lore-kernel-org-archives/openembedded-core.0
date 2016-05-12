Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id B44A865CBC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 08:38:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id A7BC01815B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 10:38:14 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id T+DjGuJ3W9b3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 10:38:14 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id 90DD918150
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 10:38:13 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 7AAF3176A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 10:38:13 +0200 (CEST)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id 79C601769
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 10:38:13 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 757FB104C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 10:38:13 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id u4C8cDlC002028
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 10:38:13 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id u4C8cDAm002027
	for openembedded-core@lists.openembedded.org;
	Thu, 12 May 2016 10:38:13 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 May 2016 10:37:56 +0200
Message-Id: <a831e47b427d8986a1748e3e67a6bfcf9cb51675.1463042237.git.pkj@axis.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1463042237.git.pkj@axis.com>
References: <cover.1463042237.git.pkj@axis.com>
In-Reply-To: <cover.1463042237.git.pkj@axis.com>
References: <cover.1463042237.git.pkj@axis.com>
Subject: [PATCHv2 09/16] signing-keys: Use SYSROOT_DIRS to add dirs to stage in sysroot
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
X-List-Received-Date: Thu, 12 May 2016 08:38:15 -0000

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


