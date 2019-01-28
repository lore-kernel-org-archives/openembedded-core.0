Return-Path: <marcus.cooper@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 35E897C05B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 11:17:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 39F221842A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 12:17:37 +0100 (CET)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id PpCRivSc5Ecu
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 12:17:35 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id CA6D718432
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 12:17:35 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8EA781A08A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 12:17:35 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 79C9F1A061
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 12:17:35 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 12:17:35 +0100 (CET)
Received: from lnxmarcusc.se.axis.com (lnxmarcusc.se.axis.com [10.92.157.1])
	by seth.se.axis.com (Postfix) with ESMTP id 6DF5A2244
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 12:17:35 +0100 (CET)
Received: by lnxmarcusc.se.axis.com (Postfix, from userid 11391)
	id 5F511943E9; Mon, 28 Jan 2019 12:17:35 +0100 (CET)
From: Marcus Cooper <marcus.cooper@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Jan 2019 12:17:31 +0100
Message-Id: <20190128111732.16387-3-marcusc@axis.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190128111732.16387-1-marcusc@axis.com>
References: <20190128111732.16387-1-marcusc@axis.com>
X-TM-AS-GCONF: 00
Subject: [PATCH v2 2/3] systemd: Security fix CVE-2018-16865
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
 ...rnald-set-a-limit-on-the-number-of-fields.patch | 139 +++++++++++++++++++++
 meta/recipes-core/systemd/systemd_239.bb           |   1 +
 2 files changed, 140 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0025-journald-set-a-limit-on-the-number-of-fields.patch

diff --git a/meta/recipes-core/systemd/systemd/0025-journald-set-a-limit-on-the-number-of-fields.patch b/meta/recipes-core/systemd/systemd/0025-journald-set-a-limit-on-the-number-of-fields.patch
new file mode 100644
index 0000000000..ae9ef5de56
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0025-journald-set-a-limit-on-the-number-of-fields.patch
@@ -0,0 +1,139 @@
+From 7cad044b72406cbadf048da432c29afea74c3c10 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <zbyszek@in.waw.pl>
+Date: Wed, 5 Dec 2018 22:45:02 +0100
+Subject: [PATCH] journald: set a limit on the number of fields
+
+The fix for CVE-2018-16865 is plucked from two commits that have
+been pushed to systemd master.
+
+journald: set a limit on the number of fields (1k)
+
+We allocate a iovec entry for each field, so with many short entries,
+our memory usage and processing time can be large, even with a relatively
+small message size. Let's refuse overly long entries.
+
+CVE-2018-16865
+https://bugzilla.redhat.com/show_bug.cgi?id=1653861
+
+What from I can see, the problem is not from an alloca, despite what the CVE
+description says, but from the attack multiplication that comes from creating
+many very small iovecs: (void* + size_t) for each three bytes of input message.
+
+Patch backported from systemd master at
+052c57f132f04a3cf4148f87561618da1a6908b4.
+
+journal-remote: set a limit on the number of fields in a message
+
+Existing use of E2BIG is replaced with ENOBUFS (entry too long), and E2BIG is
+reused for the new error condition (too many fields).
+
+This matches the change done for systemd-journald, hence forming the second
+part of the fix for CVE-2018-16865
+(https://bugzilla.redhat.com/show_bug.cgi?id=1653861).
+
+Patch backported from systemd master at
+ef4d6abe7c7fab6cbff975b32e76b09feee56074.
+with the changes applied by 7fdb237f5473cb8fc2129e57e8a0039526dcb4fd
+removed.
+
+CVE: CVE-2018-16865
+Upstream-Status: Backport
+Signed-off-by: Marcus Cooper <marcusc@axis.com>
+---
+ src/basic/journal-importer.c             | 5 ++++-
+ src/basic/journal-importer.h             | 3 +++
+ src/journal-remote/journal-remote-main.c | 7 ++++++-
+ src/journal-remote/journal-remote.c      | 5 ++++-
+ src/journal/journald-native.c            | 5 +++++
+ 5 files changed, 22 insertions(+), 3 deletions(-)
+
+diff --git a/src/basic/journal-importer.c b/src/basic/journal-importer.c
+index ca203bbbfc..3ac55a66d9 100644
+--- a/src/basic/journal-importer.c
++++ b/src/basic/journal-importer.c
+@@ -23,6 +23,9 @@ enum {
+ };
+ 
+ static int iovw_put(struct iovec_wrapper *iovw, void* data, size_t len) {
++        if (iovw->count >= ENTRY_FIELD_COUNT_MAX)
++                return -E2BIG;
++
+         if (!GREEDY_REALLOC(iovw->iovec, iovw->size_bytes, iovw->count + 1))
+                 return log_oom();
+ 
+@@ -98,7 +101,7 @@ static int get_line(JournalImporter *imp, char **line, size_t *size) {
+                 imp->scanned = imp->filled;
+                 if (imp->scanned >= DATA_SIZE_MAX) {
+                         log_error("Entry is bigger than %u bytes.", DATA_SIZE_MAX);
+-                        return -E2BIG;
++                        return -ENOBUFS;
+                 }
+ 
+                 if (imp->passive_fd)
+diff --git a/src/basic/journal-importer.h b/src/basic/journal-importer.h
+index f49ce734a1..c4ae45d32d 100644
+--- a/src/basic/journal-importer.h
++++ b/src/basic/journal-importer.h
+@@ -16,6 +16,9 @@
+ #define DATA_SIZE_MAX (1024*1024*768u)
+ #define LINE_CHUNK 8*1024u
+ 
++/* The maximum number of fields in an entry */
++#define ENTRY_FIELD_COUNT_MAX 1024
++
+ struct iovec_wrapper {
+         struct iovec *iovec;
+         size_t size_bytes;
+diff --git a/src/journal-remote/journal-remote-main.c b/src/journal-remote/journal-remote-main.c
+index 8fda9d1499..3a01fef646 100644
+--- a/src/journal-remote/journal-remote-main.c
++++ b/src/journal-remote/journal-remote-main.c
+@@ -212,7 +212,12 @@ static int process_http_upload(
+                         break;
+                 else if (r < 0) {
+                         log_warning("Failed to process data for connection %p", connection);
+-                        if (r == -E2BIG)
++                        if (r == -ENOBUFS)
++                                return mhd_respondf(connection,
++                                                    r, MHD_HTTP_PAYLOAD_TOO_LARGE,
++                                                    "Entry is above the maximum of %u, aborting connection %p.",
++                                                    DATA_SIZE_MAX, connection);
++                        else if (r == -E2BIG)
+                                 return mhd_respondf(connection,
+                                                     r, MHD_HTTP_PAYLOAD_TOO_LARGE,
+                                                     "Entry is too large, maximum is " STRINGIFY(DATA_SIZE_MAX) " bytes.");
+diff --git a/src/journal-remote/journal-remote.c b/src/journal-remote/journal-remote.c
+index beb75a1cb4..67e3a70c06 100644
+--- a/src/journal-remote/journal-remote.c
++++ b/src/journal-remote/journal-remote.c
+@@ -408,7 +408,10 @@ int journal_remote_handle_raw_source(
+                 log_debug("%zu active sources remaining", s->active);
+                 return 0;
+         } else if (r == -E2BIG) {
+-                log_notice_errno(E2BIG, "Entry too big, skipped");
++                log_notice("Entry with too many fields, skipped");
++                return 1;
++        } else if (r == -ENOBUFS) {
++                log_notice("Entry too big, skipped");
+                 return 1;
+         } else if (r == -EAGAIN) {
+                 return 0;
+diff --git a/src/journal/journald-native.c b/src/journal/journald-native.c
+index 5ff22a10af..951d092053 100644
+--- a/src/journal/journald-native.c
++++ b/src/journal/journald-native.c
+@@ -140,6 +140,11 @@ static int server_process_entry(
+                 }
+ 
+                 /* A property follows */
++                if (n > ENTRY_FIELD_COUNT_MAX) {
++                        log_debug("Received an entry that has more than " STRINGIFY(ENTRY_FIELD_COUNT_MAX) " fields, ignoring entry.");
++                        r = 1;
++                        goto finish;
++                }
+ 
+                 /* n existing properties, 1 new, +1 for _TRANSPORT */
+                 if (!GREEDY_REALLOC(iovec, m,
+-- 
+2.11.0
+
diff --git a/meta/recipes-core/systemd/systemd_239.bb b/meta/recipes-core/systemd/systemd_239.bb
index 94729a6a39..e00d5dd914 100644
--- a/meta/recipes-core/systemd/systemd_239.bb
+++ b/meta/recipes-core/systemd/systemd_239.bb
@@ -39,6 +39,7 @@ SRC_URI += "file://touchscreen.rules \
            file://0002-core-Fix-use-after-free-case-in-load_from_path.patch \
            file://0001-meson-rename-Ddebug-to-Ddebug-extra.patch \
            file://0024-journald-do-not-store-the-iovec-entry-for-process-co.patch \
+           file://0025-journald-set-a-limit-on-the-number-of-fields.patch \
            "
 
 # patches made for musl are only applied on TCLIBC is musl
-- 
2.11.0


