Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 58E2D7533A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Apr 2018 18:27:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 690C318532
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Apr 2018 20:27:10 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id y_HAOM9fZaBH
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Apr 2018 20:27:08 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 9D8BB18524
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Apr 2018 20:27:08 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8B77F1E072
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Apr 2018 20:27:08 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8003A1E070
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Apr 2018 20:27:08 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Apr 2018 20:27:08 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 73E8A2963
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Apr 2018 20:27:08 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id w36IR3qp017631
	for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Apr 2018 20:27:03 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id w36IR3Rc017629
	for openembedded-core@lists.openembedded.org;
	Fri, 6 Apr 2018 20:27:03 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Apr 2018 20:26:56 +0200
Message-Id: <0d2ca78716319f11899d43d143258b57f6dd3d0d.1523039141.git.pkj@axis.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1523039141.git.pkj@axis.com>
References: <cover.1523039141.git.pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [PATCH 2/3] sstate.bbclass: Add ${PACKAGE_EXTRA_ARCHS} to SSTATE_ARCHS
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
X-List-Received-Date: Fri, 06 Apr 2018 18:27:10 -0000

This makes sure files provided by packages that use any of the extra
architectures defined using ${PACKAGE_EXTRA_ARCHS} are cleaned from
tmp/sysroot-components when sstate_eventhandler2() executes.

Without this, changing a package from using one of the extra
architectures to another architecture would lead to files being
leftover in tmp/sysroot-components, which could later be picked up
when creating the RSS for another package rather than the files that
belonged to the updated package.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/sstate.bbclass | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 68089421f5..0b28850140 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -48,7 +48,8 @@ SSTATE_ARCHS = " \
     ${SDK_ARCH}_${PACKAGE_ARCH} \
     allarch \
     ${PACKAGE_ARCH} \
-    ${MACHINE}"
+    ${PACKAGE_EXTRA_ARCHS} \
+    ${MACHINE_ARCH}"
 
 SSTATE_MANMACH ?= "${SSTATE_PKGARCH}"
 
@@ -1026,7 +1027,7 @@ python sstate_eventhandler2() {
         with open(preservestampfile, 'r') as f:
             preservestamps = f.readlines()
     seen = []
-    for a in d.getVar("SSTATE_ARCHS").split():
+    for a in sorted(list(set(d.getVar("SSTATE_ARCHS").split()))):
         toremove = []
         i = d.expand("${SSTATE_MANIFESTS}/index-" + a)
         if not os.path.exists(i):
-- 
2.12.0


