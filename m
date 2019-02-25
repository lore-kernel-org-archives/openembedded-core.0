Return-Path: <george.mccollister@gmail.com>
Received: from mail-yw1-f41.google.com (mail-yw1-f41.google.com
	[209.85.161.41])
	by mail.openembedded.org (Postfix) with ESMTP id D4FAD7CB03
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2019 16:38:11 +0000 (UTC)
Received: by mail-yw1-f41.google.com with SMTP id n12so3867212ywn.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2019 08:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=QsRDWAxaGHDzG3CIJrgF/dFX8U73gZnWw5zOj4n5eK0=;
	b=T+ezUNNAb5RPkhhhif1bA4IdPufeDGG+RG6OvNIRiQtnuv2VuZlw95dyp0cMMYySqO
	Sl2GdgwSgKiFLGkdTxIl3oKZIBzslGgoQ1sI4kCge3CCX16JVGkasaNj/PO0TiL0sP6I
	RFjZmTNfzIEK5k+DYxMshdIqr20i7CR1fCyx1Y1sQIYxJLuLzmpgbxiRzgv1FF8tm4F4
	FpW3P+0v2gn1HDc9UF2rF+AL2HkhCcN1QOCZqVoqN22L0+U2dPbWYvz/5TXculEvkwjB
	dtQqCvOqVgq6zfGdUOCfoWy/Sy4nZXOe/A56pA1SsSUCPgxAy27C7sIhB9Y2anvliq59
	xwog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=QsRDWAxaGHDzG3CIJrgF/dFX8U73gZnWw5zOj4n5eK0=;
	b=rd4aFE4sJw7p85joXSubwQLxmhxxwJSA/RfBb2kWDQs6UBIHsodOAjHZDUoU7zJjDS
	mHWBzOHnssNM6FuRtY1o5lW8TRaQFQVx9oa1RbKxOLCmnmCJrz/UnUmSegQFLGzZ2b8W
	CfbXMljsRxgCKe7KjV+q+1lLlEPyjsc/IpFg3nd3O3ecjqsEFea4EKVeSHWz8kz6rNni
	7DvIl4qEDbDxkPPrakjZnWJ6vTpx1lPl2ZJIueX4Rhr9NBN0kJ3sGJ+B74ziH3lmvXne
	9q/c6tSDdUuWX6xcr0/1eUCdQkHgKVRZot3xZzK9AZ6OCW9a516WJq6extgiddAlrcOQ
	t4Kg==
X-Gm-Message-State: AHQUAubeFNmr8qXE1K4a3f6Rj12wAKJxUMLVe3HlRIn+D9U+0yJsDZOL
	2Ug1ZQDteTMSVgkatGhjNOSBQhc=
X-Google-Smtp-Source: AHgI3IZuQ8cB4ZurkfklLvrN3pw9npl5z53F1HAW+8BpOTCK1Ji/w1Xul4Bqxd8odBtVusSVbL0paw==
X-Received: by 2002:a81:7852:: with SMTP id t79mr14081595ywc.432.1551112692428;
	Mon, 25 Feb 2019 08:38:12 -0800 (PST)
Received: from threadripper.novatech-llc.local ([216.21.169.52])
	by smtp.gmail.com with ESMTPSA id
	z23sm6293654ywj.36.2019.02.25.08.38.10
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Feb 2019 08:38:11 -0800 (PST)
From: George McCollister <george.mccollister@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Feb 2019 10:37:10 -0600
Message-Id: <1c7d2cd92c5adde214fdb732e180117246fef97e.1551111341.git.george.mccollister@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1551111341.git.george.mccollister@gmail.com>
References: <cover.1551111341.git.george.mccollister@gmail.com>
Subject: [sumo][PATCH 5/8] systemd: Security fix CVE-2018-16865
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
X-List-Received-Date: Mon, 25 Feb 2019 16:38:12 -0000

Affects < v240

Based on thud commit d5d2b821fc85b8cf39f683061ac2a45bddd2139f
The second patch in the thud commit doesn't apply against 237. Use the
version of the second patch CVE-2018-16865_2.patch from
systemd_237-3ubuntu10.13.debian.

Signed-off-by: George McCollister <george.mccollister@gmail.com>
---
 ...ld-set-a-limit-on-the-number-of-fields-1k.patch | 60 ++++++++++++++++
 ...ote-set-a-limit-on-the-number-of-fields-i.patch | 79 ++++++++++++++++++++++
 meta/recipes-core/systemd/systemd_237.bb           |  2 +
 3 files changed, 141 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0025-journald-set-a-limit-on-the-number-of-fields-1k.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0026-journal-remote-set-a-limit-on-the-number-of-fields-i.patch

diff --git a/meta/recipes-core/systemd/systemd/0025-journald-set-a-limit-on-the-number-of-fields-1k.patch b/meta/recipes-core/systemd/systemd/0025-journald-set-a-limit-on-the-number-of-fields-1k.patch
new file mode 100644
index 0000000000..e8a6f2b986
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0025-journald-set-a-limit-on-the-number-of-fields-1k.patch
@@ -0,0 +1,60 @@
+From 4566aaf97f5b4143b930d75628f3abc905249dcd Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <zbyszek@in.waw.pl>
+Date: Wed, 5 Dec 2018 22:45:02 +0100
+Subject: [PATCH] journald: set a limit on the number of fields (1k)
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
+CVE: CVE-2018-16865
+Upstream-Status: Backport
+
+---
+ src/basic/journal-importer.h  | 3 +++
+ src/journal/journald-native.c | 5 +++++
+ 2 files changed, 8 insertions(+)
+
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
diff --git a/meta/recipes-core/systemd/systemd/0026-journal-remote-set-a-limit-on-the-number-of-fields-i.patch b/meta/recipes-core/systemd/systemd/0026-journal-remote-set-a-limit-on-the-number-of-fields-i.patch
new file mode 100644
index 0000000000..f297333e72
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0026-journal-remote-set-a-limit-on-the-number-of-fields-i.patch
@@ -0,0 +1,79 @@
+From ce1475b4f69f0a4382c6190f55e080d91de84611 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <zbyszek@in.waw.pl>
+Date: Fri, 7 Dec 2018 10:48:10 +0100
+Subject: [PATCH] journal-remote: set a limit on the number of fields in a
+ message
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
+
+Patch for 237 from:
+systemd_237-3ubuntu10.13.debian CVE-2018-16865_2.patch
+
+CVE: CVE-2018-16865
+Upstream-Status: Backport
+
+---
+ src/journal-remote/journal-remote-main.c | 7 +++++--
+ src/journal-remote/journal-remote.c      | 3 +++
+ src/shared/journal-importer.c            | 5 ++++-
+ 3 files changed, 12 insertions(+), 3 deletions(-)
+
+--- a/src/basic/journal-importer.c
++++ b/src/basic/journal-importer.c
+@@ -38,6 +38,9 @@
+ };
+ 
+ static int iovw_put(struct iovec_wrapper *iovw, void* data, size_t len) {
++        if (iovw->count >= ENTRY_FIELD_COUNT_MAX)
++                return -E2BIG;
++
+         if (!GREEDY_REALLOC(iovw->iovec, iovw->size_bytes, iovw->count + 1))
+                 return log_oom();
+ 
+@@ -113,7 +116,7 @@
+                 imp->scanned = imp->filled;
+                 if (imp->scanned >= DATA_SIZE_MAX) {
+                         log_error("Entry is bigger than %u bytes.", DATA_SIZE_MAX);
+-                        return -E2BIG;
++                        return -ENOBUFS;
+                 }
+ 
+                 if (imp->passive_fd)
+--- a/src/journal-remote/journal-remote.c
++++ b/src/journal-remote/journal-remote.c
+@@ -517,10 +517,16 @@
+                         break;
+                 else if (r < 0) {
+                         log_warning("Failed to process data for connection %p", connection);
+-                        if (r == -E2BIG)
++                        if (r == -ENOBUFS)
+                                 return mhd_respondf(connection,
+                                                     r, MHD_HTTP_PAYLOAD_TOO_LARGE,
+                                                     "Entry is too large, maximum is " STRINGIFY(DATA_SIZE_MAX) " bytes.");
++
++                        else if (r == -E2BIG)
++                                return mhd_respondf(connection,
++                                                    r, MHD_HTTP_REQUEST_ENTITY_TOO_LARGE,
++                                                    "Entry with more fields than the maximum of " STRINGIFY(ENTRY_FIELD_COUNT_MAX) ".");
++
+                         else
+                                 return mhd_respondf(connection,
+                                                     r, MHD_HTTP_UNPROCESSABLE_ENTITY,
+@@ -1090,6 +1096,9 @@
+                 log_debug("%zu active sources remaining", s->active);
+                 return 0;
+         } else if (r == -E2BIG) {
++                log_notice("Entry with too many fields, skipped");
++                return 1;
++        } else if (r == -ENOBUFS) {
+                 log_notice_errno(E2BIG, "Entry too big, skipped");
+                 return 1;
+         } else if (r == -EAGAIN) {
diff --git a/meta/recipes-core/systemd/systemd_237.bb b/meta/recipes-core/systemd/systemd_237.bb
index 0cb84c002f..e6ef385f52 100644
--- a/meta/recipes-core/systemd/systemd_237.bb
+++ b/meta/recipes-core/systemd/systemd_237.bb
@@ -58,6 +58,8 @@ SRC_URI += "file://touchscreen.rules \
            file://0001-chown-recursive-let-s-rework-the-recursive-logic-to-.patch \
            file://0001-dhcp6-make-sure-we-have-enough-space-for-the-DHCP6-o.patch \
            file://0024-journald-do-not-store-the-iovec-entry-for-process-co.patch \
+           file://0025-journald-set-a-limit-on-the-number-of-fields-1k.patch \
+           file://0026-journal-remote-set-a-limit-on-the-number-of-fields-i.patch \
            "
 SRC_URI_append_qemuall = " file://0001-core-device.c-Change-the-default-device-timeout-to-2.patch"
 
-- 
2.11.0


