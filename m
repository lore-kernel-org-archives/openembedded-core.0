Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id D421C78468
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Sep 2017 17:49:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 7A67D1859F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Sep 2017 19:49:32 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id lHOODc2uDuEp
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Sep 2017 19:49:31 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id C6F5A18582
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Sep 2017 19:49:31 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B2F401A080
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Sep 2017 19:49:31 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A82581A040
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Sep 2017 19:49:31 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Sep 2017 19:49:31 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 9C7CE1722
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Sep 2017 19:49:31 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v81HnUgK018211
	for <openembedded-core@lists.openembedded.org>;
	Fri, 1 Sep 2017 19:49:30 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v81HnUwJ018210
	for openembedded-core@lists.openembedded.org;
	Fri, 1 Sep 2017 19:49:30 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Sep 2017 19:49:29 +0200
Message-Id: <20170901174929.18168-1-pkj@axis.com>
X-Mailer: git-send-email 2.12.0
X-TM-AS-GCONF: 00
Subject: [PATCH] alsa-utils: Do not hardcode path to /lib/udev
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
X-List-Received-Date: Fri, 01 Sep 2017 17:49:32 -0000

Use ${nonarch_base_libdir}/udev instead. This avoids problems when
usrmerge is enabled in DISTRO_FEATURES and udev support is disabled.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-multimedia/alsa/alsa-utils_1.1.4.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.1.4.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.1.4.bb
index 54be50ed82..c8f4b861bd 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.1.4.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.1.4.bb
@@ -103,7 +103,7 @@ do_install() {
 
 	if ${@bb.utils.contains('PACKAGECONFIG', 'udev', 'false', 'true', d)}; then
 		# This is where alsa-utils will install its rules if we don't tell it anything else.
-		rm -rf ${D}/lib/udev
-		rmdir --ignore-fail-on-non-empty ${D}/lib
+		rm -rf ${D}${nonarch_base_libdir}/udev
+		rmdir --ignore-fail-on-non-empty ${D}${nonarch_base_libdir}
 	fi
 }
-- 
2.12.0


