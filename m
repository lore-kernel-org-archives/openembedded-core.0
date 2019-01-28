Return-Path: <marcus.cooper@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 37F447C464
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 11:17:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 1D7FC18432
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 12:17:38 +0100 (CET)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id TQ-ATPFO0kOO
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 12:17:35 +0100 (CET)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id CA60C18430
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 12:17:35 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 89F511E077
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 12:17:35 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7E7F21E070
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 12:17:35 +0100 (CET)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 12:17:35 +0100 (CET)
Received: from lnxmarcusc.se.axis.com (lnxmarcusc.se.axis.com [10.92.157.1])
	by thoth.se.axis.com (Postfix) with ESMTP id 6FC442385
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 12:17:35 +0100 (CET)
Received: by lnxmarcusc.se.axis.com (Postfix, from userid 11391)
	id 6325F943EF; Mon, 28 Jan 2019 12:17:35 +0100 (CET)
From: Marcus Cooper <marcus.cooper@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Jan 2019 12:17:32 +0100
Message-Id: <20190128111732.16387-4-marcusc@axis.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190128111732.16387-1-marcusc@axis.com>
References: <20190128111732.16387-1-marcusc@axis.com>
X-TM-AS-GCONF: 00
Subject: [PATCH v2 3/3] systemd: Security fix CVE-2018-16866
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
X-List-Received-Date: Mon, 28 Jan 2019 11:17:37 -0000

Affects < v240

Signed-off-by: Marcus Cooper <marcusc@axis.com>
---
 ...nal-fix-out-of-bounds-read-CVE-2018-16866.patch | 49 ++++++++++++++++++++++
 meta/recipes-core/systemd/systemd_239.bb           |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0026-journal-fix-out-of-bounds-read-CVE-2018-16866.patch

diff --git a/meta/recipes-core/systemd/systemd/0026-journal-fix-out-of-bounds-read-CVE-2018-16866.patch b/meta/recipes-core/systemd/systemd/0026-journal-fix-out-of-bounds-read-CVE-2018-16866.patch
new file mode 100644
index 0000000000..3925a4abbb
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0026-journal-fix-out-of-bounds-read-CVE-2018-16866.patch
@@ -0,0 +1,49 @@
+From ebd06c37d4311db9851f4d3fdd023de3dd590de0 Mon Sep 17 00:00:00 2001
+From: Filipe Brandenburger <filbranden@google.com>
+Date: Thu, 10 Jan 2019 14:53:33 -0800
+Subject: [PATCH] journal: fix out-of-bounds read CVE-2018-16866
+
+The original code didn't account for the fact that strchr() would match on the
+'\0' character, making it read past the end of the buffer if no non-whitespace
+character was present.
+
+This bug was introduced in commit ec5ff4445cca6a which was first released in
+systemd v221 and later fixed in commit 8595102d3ddde6 which was released in
+v240, so versions in the range [v221, v240) are affected.
+
+Patch backported from systemd-stable at f005e73d3723d62a39be661931fcb6347119b52b
+also includes a change from systemd master which removes a heap buffer overflow
+a6aadf4ae0bae185dc4c414d492a4a781c80ffe5.
+
+CVE: CVE-2018-16866
+Upstream-Status: Backport
+Signed-off-by: Marcus Cooper <marcusc@axis.com>
+---
+ src/journal/journald-syslog.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/journal/journald-syslog.c b/src/journal/journald-syslog.c
+index 9dea116722..809b318c06 100644
+--- a/src/journal/journald-syslog.c
++++ b/src/journal/journald-syslog.c
+@@ -194,7 +194,7 @@ size_t syslog_parse_identifier(const char **buf, char **identifier, char **pid)
+         e = l;
+         l--;
+ 
+-        if (p[l-1] == ']') {
++        if (l > 0 && p[l-1] == ']') {
+                 size_t k = l-1;
+ 
+                 for (;;) {
+@@ -219,7 +219,7 @@ size_t syslog_parse_identifier(const char **buf, char **identifier, char **pid)
+         if (t)
+                 *identifier = t;
+ 
+-        if (strchr(WHITESPACE, p[e]))
++        if (p[e] != '\0' && strchr(WHITESPACE, p[e]))
+                 e++;
+         *buf = p + e;
+         return e;
+-- 
+2.11.0
+
diff --git a/meta/recipes-core/systemd/systemd_239.bb b/meta/recipes-core/systemd/systemd_239.bb
index e00d5dd914..f843f588bd 100644
--- a/meta/recipes-core/systemd/systemd_239.bb
+++ b/meta/recipes-core/systemd/systemd_239.bb
@@ -40,6 +40,7 @@ SRC_URI += "file://touchscreen.rules \
            file://0001-meson-rename-Ddebug-to-Ddebug-extra.patch \
            file://0024-journald-do-not-store-the-iovec-entry-for-process-co.patch \
            file://0025-journald-set-a-limit-on-the-number-of-fields.patch \
+           file://0026-journal-fix-out-of-bounds-read-CVE-2018-16866.patch \
            "
 
 # patches made for musl are only applied on TCLIBC is musl
-- 
2.11.0


