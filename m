Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3D6116C42C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 00:49:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id A04A018334
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 01:49:10 +0100 (CET)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id HwEdUgAp2MME
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 01:49:10 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 14EA01830E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 01:49:10 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DF6D91A061
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 01:49:09 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D3FB51A05F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 01:49:09 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 01:49:09 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id C802016D4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 01:49:09 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id x0F0n9sY005308
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 01:49:09 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id x0F0n99m005307
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Jan 2019 01:49:09 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Jan 2019 01:49:06 +0100
Message-Id: <20190115004906.5256-2-pkj@axis.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <20190115004906.5256-1-pkj@axis.com>
References: <20190115004906.5256-1-pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [PATCH 2/2] systemd: Correct a conditional add to SYSTEMD_PACKAGES
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
X-List-Received-Date: Tue, 15 Jan 2019 00:49:10 -0000

The code conditionally adding ${PN}-journal-remote to SYSTEMD_PACKAGE
checked PACKAGECONFIG for an empty string rather than 'microhttpd'...

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-core/systemd/systemd_239.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_239.bb b/meta/recipes-core/systemd/systemd_239.bb
index aa05af3beb..832257992d 100644
--- a/meta/recipes-core/systemd/systemd_239.bb
+++ b/meta/recipes-core/systemd/systemd_239.bb
@@ -338,8 +338,8 @@ DESCRIPTION_${PN}-journal-remote = "systemd-journal-remote is a command to recei
 
 SYSTEMD_PACKAGES = "${@bb.utils.contains('PACKAGECONFIG', 'binfmt', '${PN}-binfmt', '', d)} \
                     ${@bb.utils.contains('PACKAGECONFIG', 'microhttpd', '${PN}-journal-gatewayd', '', d)} \
+                    ${@bb.utils.contains('PACKAGECONFIG', 'microhttpd', '${PN}-journal-remote', '', d)} \
                     ${@bb.utils.contains('PACKAGECONFIG', 'journal-upload', '${PN}-journal-upload', '', d)} \
-                    ${@bb.utils.contains('PACKAGECONFIG', '', '${PN}-journal-remote', '', d)} \
 "
 SYSTEMD_SERVICE_${PN}-binfmt = "systemd-binfmt.service"
 
-- 
2.12.0


