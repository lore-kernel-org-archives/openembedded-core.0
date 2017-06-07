Return-Path: <peter.marko@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id 9074B78199
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jun 2017 06:05:38 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id v5765d9a030813
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 7 Jun 2017 08:05:39 +0200
Received: from dev.sbt.siemens.com ([163.242.44.98])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id v5765d0U016457;
	Wed, 7 Jun 2017 08:05:39 +0200
Received: from dev.sbt.siemens.com (localhost [127.0.0.1])
	by dev.sbt.siemens.com (Postfix) with ESMTP id 3371A1CB951;
	Wed,  7 Jun 2017 08:05:39 +0200 (CEST)
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Jun 2017 08:04:31 +0200
Message-Id: <1496815471-23075-5-git-send-email-peter.marko@siemens.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1496815471-23075-1-git-send-email-peter.marko@siemens.com>
References: <1496815471-23075-1-git-send-email-peter.marko@siemens.com>
In-Reply-To: <1496647273-9693-1-git-send-email-peter.marko@siemens.com>
References: <1496647273-9693-1-git-send-email-peter.marko@siemens.com>
Subject: [PATCH v2 4/4] cve-check-tool: fix crash on exceptions
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
X-List-Received-Date: Wed, 07 Jun 2017 06:05:39 -0000

This fixes cve-check-tool crashes on exceptions.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../cve-check-tool/cve-check-tool_5.6.4.bb         |  1 +
 ...01-Fix-freeing-memory-allocated-by-sqlite.patch | 50 ++++++++++++++++++++++
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-devtools/cve-check-tool/files/0001-Fix-freeing-memory-allocated-by-sqlite.patch

diff --git a/meta/recipes-devtools/cve-check-tool/cve-check-tool_5.6.4.bb b/meta/recipes-devtools/cve-check-tool/cve-check-tool_5.6.4.bb
index 1f906ee..4829b11 100644
--- a/meta/recipes-devtools/cve-check-tool/cve-check-tool_5.6.4.bb
+++ b/meta/recipes-devtools/cve-check-tool/cve-check-tool_5.6.4.bb
@@ -11,6 +11,7 @@ SRC_URI = "https://github.com/ikeydoherty/${BPN}/releases/download/v${PV}/${BP}.
            file://0001-print-progress-in-percent-when-downloading-CVE-db.patch \
            file://0001-curl-allow-overriding-default-CA-certificate-file.patch \
            file://0001-update-Compare-computed-vs-expected-sha256-digit-str.patch \
+           file://0001-Fix-freeing-memory-allocated-by-sqlite.patch \
           "
 
 SRC_URI[md5sum] = "c5f4247140fc9be3bf41491d31a34155"
diff --git a/meta/recipes-devtools/cve-check-tool/files/0001-Fix-freeing-memory-allocated-by-sqlite.patch b/meta/recipes-devtools/cve-check-tool/files/0001-Fix-freeing-memory-allocated-by-sqlite.patch
new file mode 100644
index 0000000..4a82cf2
--- /dev/null
+++ b/meta/recipes-devtools/cve-check-tool/files/0001-Fix-freeing-memory-allocated-by-sqlite.patch
@@ -0,0 +1,50 @@
+From a3353429652f83bb8b0316500faa88fa2555542d Mon Sep 17 00:00:00 2001
+From: Peter Marko <peter.marko@siemens.com>
+Date: Thu, 13 Apr 2017 23:09:52 +0200
+Subject: [PATCH] Fix freeing memory allocated by sqlite
+
+Upstream-Status: Backport
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/core.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/src/core.c b/src/core.c
+index 6263031..6788f16 100644
+--- a/src/core.c
++++ b/src/core.c
+@@ -82,7 +82,7 @@ static bool ensure_table(CveDB *self)
+         rc = sqlite3_exec(self->db, query, NULL, NULL, &err);
+         if (rc != SQLITE_OK) {
+                 fprintf(stderr, "ensure_table(): %s\n", err);
+-                free(err);
++                sqlite3_free(err);
+                 return false;
+         }
+         
+@@ -91,7 +91,7 @@ static bool ensure_table(CveDB *self)
+         rc = sqlite3_exec(self->db, query, NULL, NULL, &err);
+         if (rc != SQLITE_OK) {
+                 fprintf(stderr, "ensure_table(): %s\n", err);
+-                free(err);
++                sqlite3_free(err);
+                 return false;
+         }
+ 
+@@ -99,11 +99,11 @@ static bool ensure_table(CveDB *self)
+         rc = sqlite3_exec(self->db, query, NULL, NULL, &err);
+         if (rc != SQLITE_OK) {
+                 fprintf(stderr, "ensure_table(): %s\n", err);
+-                free(err);
++                sqlite3_free(err);
+                 return false;
+         }
+         if (err) {
+-                free(err);
++                sqlite3_free(err);
+         }
+ 
+         return true;
+-- 
+2.1.4
+
-- 
2.1.4


