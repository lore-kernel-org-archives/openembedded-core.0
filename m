Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2460A6C334
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Nov 2018 21:08:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id A582B182A0
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Nov 2018 22:08:23 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 9kZIl7zeOliI
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Nov 2018 22:08:22 +0100 (CET)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id E9D93185C8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Nov 2018 22:08:22 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CCF4F1E079
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Nov 2018 22:08:22 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C148B1E064
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Nov 2018 22:08:22 +0100 (CET)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Nov 2018 22:08:22 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id B48B1DEE
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Nov 2018 22:08:22 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id wA9L8MdV029959
	for <openembedded-core@lists.openembedded.org>;
	Fri, 9 Nov 2018 22:08:22 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id wA9L8MRk029958
	for openembedded-core@lists.openembedded.org;
	Fri, 9 Nov 2018 22:08:22 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Nov 2018 22:08:17 +0100
Message-Id: <20181109210817.29914-1-pkj@axis.com>
X-Mailer: git-send-email 2.12.0
X-TM-AS-GCONF: 00
Subject: [PATCH] libaio: Extend to native
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
X-List-Received-Date: Fri, 09 Nov 2018 21:08:23 -0000

lvm2 currently requires libaio. So building lvm2-native will result in
the following error.

  ERROR: Required build target 'lvm2-native' has no buildable providers.
  Missing or unbuildable dependency chain was: ['lvm2-native', 'libaio-native']

Extend libaio to native to fix this issue.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

This complements commit 5f56ce58, which added the corresponding support
for nativesdk.

 meta/recipes-extended/libaio/libaio_0.3.111.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/libaio/libaio_0.3.111.bb b/meta/recipes-extended/libaio/libaio_0.3.111.bb
index 04b50b61ec..8e1cd349a0 100644
--- a/meta/recipes-extended/libaio/libaio_0.3.111.bb
+++ b/meta/recipes-extended/libaio/libaio_0.3.111.bb
@@ -20,4 +20,4 @@ do_install () {
     oe_runmake install DESTDIR=${D}
 }
 
-BBCLASSEXTEND = "nativesdk"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.12.0


