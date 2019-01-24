Return-Path: <marcus.cooper@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4FBB37C0D4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2019 12:43:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 22D4E185B4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2019 13:43:46 +0100 (CET)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 4O2SNBbr6_pt
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2019 13:43:43 +0100 (CET)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 0B890185B8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2019 13:43:43 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DC3C31E060
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2019 13:43:42 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C6FF81E054
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2019 13:43:42 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2019 13:43:42 +0100 (CET)
Received: from lnxmarcusc.se.axis.com (lnxmarcusc.se.axis.com [10.92.157.1])
	by seth.se.axis.com (Postfix) with ESMTP id B97EA1F50
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2019 13:43:42 +0100 (CET)
Received: by lnxmarcusc.se.axis.com (Postfix, from userid 11391)
	id B1595943E9; Thu, 24 Jan 2019 13:43:42 +0100 (CET)
From: Marcus Cooper <marcus.cooper@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Jan 2019 13:43:41 +0100
Message-Id: <20190124124341.26815-3-marcusc@axis.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190124124341.26815-1-marcusc@axis.com>
References: <20190124124341.26815-1-marcusc@axis.com>
X-TM-AS-GCONF: 00
Subject: [PATCH 3/3] systemd: Security fix CVE-2018-16866
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
X-List-Received-Date: Thu, 24 Jan 2019 12:43:45 -0000

Affects < v240

Signed-off-by: Marcus Cooper <marcusc@axis.com>
---
 .../0027-journal-fix-syslog_parse_identifier.patch | 77 ++++++++++++++++++++
 ...not-remove-multiple-spaces-after-identifi.patch | 84 ++++++++++++++++++++++
 meta/recipes-core/systemd/systemd_239.bb           |  2 +
 3 files changed, 163 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0027-journal-fix-syslog_parse_identifier.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0028-journal-do-not-remove-multiple-spaces-after-identifi.patch

diff --git a/meta/recipes-core/systemd/systemd/0027-journal-fix-syslog_parse_identifier.patch b/meta/recipes-core/systemd/systemd/0027-journal-fix-syslog_parse_identifier.patch
new file mode 100644
index 0000000000..d4df0e12fd
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0027-journal-fix-syslog_parse_identifier.patch
@@ -0,0 +1,77 @@
+From 8ccebb04e07628f7fe10131d6cd4f19d6a0d8f45 Mon Sep 17 00:00:00 2001
+From: Yu Watanabe <watanabe.yu+github@gmail.com>
+Date: Wed, 8 Aug 2018 15:06:36 +0900
+Subject: [PATCH] journal: fix syslog_parse_identifier()
+
+Fixes #9829.
+
+An out of bounds read was discovered in systemd-journald in the way it
+parses log messages that terminate with a colon ':'. A local attacker
+can use this flaw to disclose process memory data.
+
+Patch backported from systemd master at
+a6aadf4ae0bae185dc4c414d492a4a781c80ffe5.
+
+This matches the change done for systemd-journald, hence forming the first
+part of the fix for CVE-2018-16866.
+---
+ src/journal/journald-syslog.c     |  6 +++---
+ src/journal/test-journal-syslog.c | 10 ++++++++--
+ 2 files changed, 11 insertions(+), 5 deletions(-)
+
+diff --git a/src/journal/journald-syslog.c b/src/journal/journald-syslog.c
+index 9dea116722..97711ac7a3 100644
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
+@@ -219,8 +219,8 @@ size_t syslog_parse_identifier(const char **buf, char **identifier, char **pid)
+         if (t)
+                 *identifier = t;
+ 
+-        if (strchr(WHITESPACE, p[e]))
+-                e++;
++        e += strspn(p + e, WHITESPACE);
++
+         *buf = p + e;
+         return e;
+ }
+diff --git a/src/journal/test-journal-syslog.c b/src/journal/test-journal-syslog.c
+index 9ba86f6c8a..05f759817e 100644
+--- a/src/journal/test-journal-syslog.c
++++ b/src/journal/test-journal-syslog.c
+@@ -5,8 +5,8 @@
+ #include "macro.h"
+ #include "string-util.h"
+ 
+-static void test_syslog_parse_identifier(const char* str,
+-                                         const char *ident, const char*pid, int ret) {
++static void test_syslog_parse_identifier(const char *str,
++                                         const char *ident, const char *pid, int ret) {
+         const char *buf = str;
+         _cleanup_free_ char *ident2 = NULL, *pid2 = NULL;
+         int ret2;
+@@ -21,7 +21,13 @@ static void test_syslog_parse_identifier(const char* str,
+ int main(void) {
+         test_syslog_parse_identifier("pidu[111]: xxx", "pidu", "111", 11);
+         test_syslog_parse_identifier("pidu: xxx", "pidu", NULL, 6);
++        test_syslog_parse_identifier("pidu:  xxx", "pidu", NULL, 7);
+         test_syslog_parse_identifier("pidu xxx", NULL, NULL, 0);
++        test_syslog_parse_identifier(":", "", NULL, 1);
++        test_syslog_parse_identifier(":  ", "", NULL, 3);
++        test_syslog_parse_identifier("pidu:", "pidu", NULL, 5);
++        test_syslog_parse_identifier("pidu: ", "pidu", NULL, 6);
++        test_syslog_parse_identifier("pidu : ", NULL, NULL, 0);
+ 
+         return 0;
+ }
+-- 
+2.11.0
+
diff --git a/meta/recipes-core/systemd/systemd/0028-journal-do-not-remove-multiple-spaces-after-identifi.patch b/meta/recipes-core/systemd/systemd/0028-journal-do-not-remove-multiple-spaces-after-identifi.patch
new file mode 100644
index 0000000000..fa2c01034b
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0028-journal-do-not-remove-multiple-spaces-after-identifi.patch
@@ -0,0 +1,84 @@
+From c3a7da1bbb6d2df8ab7ea1c7ce34ded37a21959f Mon Sep 17 00:00:00 2001
+From: Yu Watanabe <watanabe.yu+github@gmail.com>
+Date: Fri, 10 Aug 2018 11:07:54 +0900
+Subject: [PATCH] journal: do not remove multiple spaces after identifier in
+ syslog message
+
+Single space is used as separator.
+C.f. discussions in #156.
+
+Fixes #9839 introduced by a6aadf4ae0bae185dc4c414d492a4a781c80ffe5.
+
+Patch backported from systemd master at
+8595102d3ddde6d25c282f965573a6de34ab4421.
+
+This matches the change done for systemd-journald, hence forming the second
+part of the fix for CVE-2018-16866
+---
+ src/journal/journald-syslog.c     |  4 +++-
+ src/journal/test-journal-syslog.c | 24 ++++++++++++++----------
+ 2 files changed, 17 insertions(+), 11 deletions(-)
+
+diff --git a/src/journal/journald-syslog.c b/src/journal/journald-syslog.c
+index 97711ac7a3..e0b55cc566 100644
+--- a/src/journal/journald-syslog.c
++++ b/src/journal/journald-syslog.c
+@@ -219,7 +219,9 @@ size_t syslog_parse_identifier(const char **buf, char **identifier, char **pid)
+         if (t)
+                 *identifier = t;
+ 
+-        e += strspn(p + e, WHITESPACE);
++        /* Single space is used as separator */
++        if (p[e] != '\0' && strchr(WHITESPACE, p[e]))
++                e++;
+ 
+         *buf = p + e;
+         return e;
+diff --git a/src/journal/test-journal-syslog.c b/src/journal/test-journal-syslog.c
+index 05f759817e..7294cde032 100644
+--- a/src/journal/test-journal-syslog.c
++++ b/src/journal/test-journal-syslog.c
+@@ -6,7 +6,7 @@
+ #include "string-util.h"
+ 
+ static void test_syslog_parse_identifier(const char *str,
+-                                         const char *ident, const char *pid, int ret) {
++                                         const char *ident, const char *pid, const char *rest, int ret) {
+         const char *buf = str;
+         _cleanup_free_ char *ident2 = NULL, *pid2 = NULL;
+         int ret2;
+@@ -16,18 +16,22 @@ static void test_syslog_parse_identifier(const char *str,
+         assert_se(ret == ret2);
+         assert_se(ident == ident2 || streq_ptr(ident, ident2));
+         assert_se(pid == pid2 || streq_ptr(pid, pid2));
++        assert_se(streq(buf, rest));
+ }
+ 
+ int main(void) {
+-        test_syslog_parse_identifier("pidu[111]: xxx", "pidu", "111", 11);
+-        test_syslog_parse_identifier("pidu: xxx", "pidu", NULL, 6);
+-        test_syslog_parse_identifier("pidu:  xxx", "pidu", NULL, 7);
+-        test_syslog_parse_identifier("pidu xxx", NULL, NULL, 0);
+-        test_syslog_parse_identifier(":", "", NULL, 1);
+-        test_syslog_parse_identifier(":  ", "", NULL, 3);
+-        test_syslog_parse_identifier("pidu:", "pidu", NULL, 5);
+-        test_syslog_parse_identifier("pidu: ", "pidu", NULL, 6);
+-        test_syslog_parse_identifier("pidu : ", NULL, NULL, 0);
++        test_syslog_parse_identifier("pidu[111]: xxx", "pidu", "111", "xxx", 11);
++        test_syslog_parse_identifier("pidu: xxx", "pidu", NULL, "xxx", 6);
++        test_syslog_parse_identifier("pidu:  xxx", "pidu", NULL, " xxx", 6);
++        test_syslog_parse_identifier("pidu xxx", NULL, NULL, "pidu xxx", 0);
++        test_syslog_parse_identifier("   pidu xxx", NULL, NULL, "   pidu xxx", 0);
++        test_syslog_parse_identifier("", NULL, NULL, "", 0);
++        test_syslog_parse_identifier("  ", NULL, NULL, "  ", 0);
++        test_syslog_parse_identifier(":", "", NULL, "", 1);
++        test_syslog_parse_identifier(":  ", "", NULL, " ", 2);
++        test_syslog_parse_identifier("pidu:", "pidu", NULL, "", 5);
++        test_syslog_parse_identifier("pidu: ", "pidu", NULL, "", 6);
++        test_syslog_parse_identifier("pidu : ", NULL, NULL, "pidu : ", 0);
+ 
+         return 0;
+ }
+-- 
+2.11.0
+
diff --git a/meta/recipes-core/systemd/systemd_239.bb b/meta/recipes-core/systemd/systemd_239.bb
index cc498a7da4..7efc1e5828 100644
--- a/meta/recipes-core/systemd/systemd_239.bb
+++ b/meta/recipes-core/systemd/systemd_239.bb
@@ -41,6 +41,8 @@ SRC_URI += "file://touchscreen.rules \
            file://0024-journald-do-not-store-the-iovec-entry-for-process-co.patch \
            file://0025-journald-set-a-limit-on-the-number-of-fields-1k.patch \
            file://0026-journal-remote-set-a-limit-on-the-number-of-fields-i.patch \
+           file://0027-journal-fix-syslog_parse_identifier.patch \
+           file://0028-journal-do-not-remove-multiple-spaces-after-identifi.patch \
            "
 
 # patches made for musl are only applied on TCLIBC is musl
-- 
2.11.0


