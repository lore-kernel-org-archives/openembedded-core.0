Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 714727FC59
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Sep 2019 07:25:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id DECEC18393
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Sep 2019 09:25:29 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id TIE1QeBrIblP
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Sep 2019 09:25:29 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 2A76018117
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Sep 2019 09:25:29 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 13F961A0A1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Sep 2019 09:25:29 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 08C471A09E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Sep 2019 09:25:29 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Sep 2019 09:25:28 +0200 (CEST)
Received: from saur.se.axis.com (saur.se.axis.com [10.92.3.10])
	by thoth.se.axis.com (Postfix) with ESMTP id F0EE111DC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Sep 2019 09:25:28 +0200 (CEST)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur.se.axis.com (8.15.2/8.15.2) with ESMTPS id x8K7PS0k031605
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Sep 2019 09:25:28 +0200
Received: (from pkj@localhost)
	by saur.se.axis.com (8.15.2/8.15.2/Submit) id x8K7PSv5031568
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Sep 2019 09:25:28 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Sep 2019 09:25:27 +0200
Message-Id: <20190920072527.30154-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: [PATCH] systemd: Make it build with hwdb disabled
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
X-List-Received-Date: Fri, 20 Sep 2019 07:25:29 -0000
Content-Transfer-Encoding: 8bit

If hwdb is disabled, then systemd-hwdb-update.service does not exists.
Do not try to modify it in this case.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-core/systemd/systemd_243.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_243.bb b/meta/recipes-core/systemd/systemd_243.bb
index f0e8c569b8..d0f9d17dba 100644
--- a/meta/recipes-core/systemd/systemd_243.bb
+++ b/meta/recipes-core/systemd/systemd_243.bb
@@ -299,9 +299,10 @@ do_install() {
 }
 
 do_install_append () {
-       # Mips qemu is extremely slow, allow more time for the hwdb update
-       # This is a workaround until https://github.com/systemd/systemd/issues/13581 is resolved
-       sed -i -e s#TimeoutSec=90s#TimeoutSec=180s# ${D}${systemd_unitdir}/system/systemd-hwdb-update.service
+	# Mips qemu is extremely slow, allow more time for the hwdb update
+	# This is a workaround until https://github.com/systemd/systemd/issues/13581 is resolved
+	[ ! -e ${D}${systemd_unitdir}/system/systemd-hwdb-update.service ] ||
+		sed -i -e s#TimeoutSec=90s#TimeoutSec=180s# ${D}${systemd_unitdir}/system/systemd-hwdb-update.service
 }
 
 python populate_packages_prepend (){
-- 
2.21.0


