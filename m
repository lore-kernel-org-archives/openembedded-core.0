Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5A5BF610F8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Sep 2013 18:52:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r8QIqfaL008974
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Sep 2013 11:52:41 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Thu, 26 Sep 2013 11:52:40 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 26 Sep 2013 11:52:39 -0700
Message-ID: <1380221559-25585-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [v2][PATCH 1/1] vala.bbclass: add dependency on vala
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
X-List-Received-Date: Thu, 26 Sep 2013 18:52:40 -0000
Content-Type: text/plain

This class points the inheritor, if it is a target,
to directories in the target sysroot, so we want to
be sure the .vapi files are there.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 meta/classes/vala.bbclass |    8 +++++---
 1 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/classes/vala.bbclass b/meta/classes/vala.bbclass
index c7db08c..3b70a04 100644
--- a/meta/classes/vala.bbclass
+++ b/meta/classes/vala.bbclass
@@ -1,9 +1,11 @@
 # Vala has problems with multiple concurrent invocations
 PARALLEL_MAKE = ""
 
-# Vala needs vala-native
-DEPENDS += "vala-native"
-DEPENDS_virtclass-native += "vala-native"
+# Everyone needs vala-native and targets need vala, too,
+# because that is where target builds look for .vapi files.
+#
+VALADEPENDS_class-target = "vala"
+DEPENDS_append = " vala-native ${VALADEPENDS}"
 
 # Our patched version of Vala looks in STAGING_DATADIR for .vapi files
 export STAGING_DATADIR
-- 
1.7.3.4


