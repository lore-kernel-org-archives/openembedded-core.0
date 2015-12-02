Return-Path: <fabrice.coulon@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id A4C1E605FF
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Dec 2015 13:23:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 72EAD18070
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Dec 2015 14:23:01 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id e-0+-ZDwDs6r
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Dec 2015 14:23:00 +0100 (CET)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id CAF5C18082
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Dec 2015 14:23:00 +0100 (CET)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id ADF471501
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Dec 2015 14:23:00 +0100 (CET)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id A2BF2493
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Dec 2015 14:23:00 +0100 (CET)
Received: from lnxfabrice2.se.axis.com (lnxfabrice2.se.axis.com [10.92.161.3])
	by thoth.se.axis.com (Postfix) with ESMTP id A00F83428B;
	Wed,  2 Dec 2015 14:23:00 +0100 (CET)
Received: by lnxfabrice2.se.axis.com (Postfix, from userid 9523)
	id CD26C801E7E; Wed,  2 Dec 2015 14:22:40 +0100 (CET)
From: Fabrice Coulon <fabrice.coulon@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Dec 2015 14:22:36 +0100
Message-Id: <1449062556-13116-1-git-send-email-fabrice.coulon@axis.com>
X-Mailer: git-send-email 1.9.1
Cc: Fabrice Coulon <fabrice@axis.com>
Subject: [PATCH] pseudo: Make it possible to override the append in a bbappend
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
X-List-Received-Date: Wed, 02 Dec 2015 13:23:01 -0000

I need this in order to avoid a conflict when used with
base-passwd-native.

Signed-off-by: Fabrice Coulon <fabrice.coulon@axis.com>
---
 meta/recipes-devtools/pseudo/pseudo_1.7.4.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_1.7.4.bb b/meta/recipes-devtools/pseudo/pseudo_1.7.4.bb
index d68e0af..87e624e 100644
--- a/meta/recipes-devtools/pseudo/pseudo_1.7.4.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_1.7.4.bb
@@ -11,9 +11,13 @@ SRC_URI[sha256sum] = "f33ff84da328f943155f22cfd49030ef4ad85ad35fc2d9419a203521b6
 
 PSEUDO_EXTRA_OPTS ?= "--enable-force-async --without-passwd-fallback"
 
-do_install_append_class-native () {
+append_class_native() {
 	install -d ${D}${sysconfdir}
 	# The fallback files should never be modified
 	install -m 444 ${WORKDIR}/fallback-passwd ${D}${sysconfdir}/passwd
 	install -m 444 ${WORKDIR}/fallback-group ${D}${sysconfdir}/group
 }
+
+do_install_append_class-native () {
+	append_class_native
+}
-- 
1.9.1


