Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id D841477E84
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Apr 2017 02:40:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 7EAB8182AA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Apr 2017 04:40:22 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id bX-KgrgRHl-x
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Apr 2017 04:40:21 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 391F0183C0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Apr 2017 04:40:21 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1508C1A064
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Apr 2017 04:40:21 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0A5441A061
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Apr 2017 04:40:21 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Apr 2017 04:40:21 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id F1F76335A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Apr 2017 04:40:20 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v3E2eKc0013793
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Apr 2017 04:40:20 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v3E2eKHY013792
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Apr 2017 04:40:20 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Apr 2017 04:39:54 +0200
Message-Id: <459b66d43ed6911e63e0c253c7dfdf1459a481ad.1492135840.git.pkj@axis.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1492135840.git.pkj@axis.com>
References: <cover.1492135840.git.pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [PATCH 2/2] base-passwd: Make the postinst function verbose if BB_VERBOSE_LOGS is set
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
X-List-Received-Date: Fri, 14 Apr 2017 02:40:22 -0000

If BB_VERBOSE_LOGS is enabled, then make the postinst function use
set -x so that its execution is traced. This greatly simplifies
debugging, especially in case of failures as nothing is recorded in
the logs otherwise to indicate what caused the failure.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-core/base-passwd/base-passwd_3.5.29.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb b/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
index c6be1c1d08..0d5deee7d0 100644
--- a/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
+++ b/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
@@ -46,6 +46,8 @@ do_install () {
 basepasswd_sysroot_postinst() {
 #!/bin/sh
 
+${@"set -x" if bb.msg.loggerVerboseLogs else ""}
+
 # Install passwd.master and group.master to sysconfdir
 install -d -m 755 ${STAGING_DIR_TARGET}${sysconfdir}
 for i in passwd group; do
-- 
2.12.0


