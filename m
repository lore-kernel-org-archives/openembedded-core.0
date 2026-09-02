Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0332C624D5
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 18:10:07 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2064.1788372597330317958
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2026 11:09:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ezpV1hJz;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 656F24E414D0
	for <openembedded-core@lists.openembedded.org>; Wed,  2 Sep 2026 18:09:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3A0356053C
	for <openembedded-core@lists.openembedded.org>; Wed,  2 Sep 2026 18:09:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 908A811C78E0A;
	Wed,  2 Sep 2026 20:09:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788372594; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+7GQ1Q+VncgOjL9QVulAe+UMQl/OfmtnOGglfgyk2D8=;
	b=ezpV1hJzFgEVrMayJtuEgBpDKkfPjGGOq7P585bdupPUyrizqIxPUsSGutM7Vgbt5hUJzs
	t2VqsnMdUT1ng4CRYfb+WfFmbKrg2CHCFHES/wwy06CSNxq7JFO/vYihwLI3dSe4YvwARA
	ydreatttZCfTGmTJR6+Sl+taXJXQl0zoZmkggwZtWGQWB/tOq7U4DsULBooOklY3Pbd4q1
	QqkVRQIGZyssHvRwiqQ8/pTlz9m48pTCOtKdKY4wHfkCCa/hE0Bechb6KqAfup3icX+bWP
	5UpUCJidhwVVydq4zPM8D+u6sirO21xxmYAPUgudFv5ErLa1tuIo1bn1EmzIYw==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Wed, 02 Sep 2026 20:09:43 +0200
Subject: [PATCH v2 2/4] libfaketime: update 0.9.12 -> 0.9.13
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-mathieu-reproducible-faketime-v2-2-9496dff5bde3@bootlin.com>
References: <20260902-mathieu-reproducible-faketime-v2-0-9496dff5bde3@bootlin.com>
In-Reply-To: <20260902-mathieu-reproducible-faketime-v2-0-9496dff5bde3@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788372584; l=4966;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=WJy3DCQ0TJbpxFy8Oagb86+tecwb8sgztfqryUtWuJw=;
 b=UHKJJi9t9ZaILRuwdx1E3bi+AljOVzH5FOKTotwfol/wyGdXk+wIB3cvfI/QlpllUXVYmJ1Yd
 4u6IcW9sTqyBci6aIAlNLShH/qiPrQHGUd6eWs19HyEZeaHLnNKyLrp
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 18:10:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244987

Changelog:
- Improved macOS arm64/arm64e build and runtime compatibility, including
  shared-memory lifecycle, clock, wait, configuration, and failure-path
  regression coverage.
- Hardened initialization and cleanup across Linux and macOS, including
  shared-memory validation, descriptor ownership, loader re-entry, and
  bounded process/loader tests.
- Fixed clock-domain handling for monotonic and realtime waits, timerfd,
  semaphore, pthread, futex, poll, select, and pselect contracts.
- Added glibc 32-bit time64 ABI coverage and improved selection of the
  appropriate time64 preload library.
- Improved configuration and numeric parsing validation, including
  overflow, embedded NUL, CRLF, comment, and malformed-input cases.
- Prevented timestamp-save write failures from wrapping offsets or
  hanging on short, zero-byte, or interrupted writes.
- Fixed deterministic FAKE_RANDOM seed handling for the complete
  unsigned 64-bit seed range and made seeded output independent of
  loader startup activity.
- Expanded filesystem timestamp and ABI probes, including fstatat and
  symlink metadata behavior, while documenting implementation-dependent
  contracts.
- Added bounded sanitizer, Valgrind, low-resource, loader, concurrency,
  and optional runtime compatibility checks.
- Expanded Linux CI coverage to Debian, Fedora, Rocky Linux, CentOS
  Stream, openSUSE Tumbleweed, Arch Linux, Alpine/musl, ARM64, and
  32-bit/time64 variants.
- Added CI execution of the documented test snippets and improved
  failure log collection and release-hygiene checks.

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 ...onst-qualifiers-to-fix-build-with-ISO-C23.patch | 34 ----------------------
 ...libfaketime_0.9.12.bb => libfaketime_0.9.13.bb} |  9 +++---
 2 files changed, 5 insertions(+), 38 deletions(-)

diff --git a/meta/recipes-support/libfaketime/libfaketime/0001-Add-const-qualifiers-to-fix-build-with-ISO-C23.patch b/meta/recipes-support/libfaketime/libfaketime/0001-Add-const-qualifiers-to-fix-build-with-ISO-C23.patch
deleted file mode 100644
index 1696e7146e83..000000000000
--- a/meta/recipes-support/libfaketime/libfaketime/0001-Add-const-qualifiers-to-fix-build-with-ISO-C23.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From dbe865dfdba0145d993d70b7fd4ec88b2f47554b Mon Sep 17 00:00:00 2001
-From: Tomas Korbar <tkorbar@redhat.com>
-Date: Mon, 15 Dec 2025 11:03:21 +0100
-Subject: [PATCH] Add const qualifiers to fix build with ISO C23
-
-Fix https://github.com/wolfcw/libfaketime/issues/524
-
-Upstream-Status: Backport [https://github.com/wolfcw/libfaketime/pull/525]
----
- src/libfaketime.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/libfaketime.c b/src/libfaketime.c
-index ef1dca9..02839c8 100644
---- a/src/libfaketime.c
-+++ b/src/libfaketime.c
-@@ -2666,7 +2666,7 @@ int timespec_get(struct timespec *ts, int base)
- static void parse_ft_string(const char *user_faked_time)
- {
-   struct tm user_faked_time_tm;
--  char * tmp_time_fmt;
-+  const char * tmp_time_fmt;
-   char * nstime_str;
-
-   if (!strncmp(user_faked_time, user_faked_time_saved, BUFFERLEN))
-@@ -3338,7 +3338,7 @@ static void prepare_config_contents(char *contents)
- bool str_array_contains(const char *haystack, const char *needle)
- {
-   size_t needle_len = strlen(needle);
--  char *pos = strstr(haystack, needle);
-+  const char *pos = strstr(haystack, needle);
-   while (pos) {
-     if (pos == haystack || *(pos - 1) == ',') {
-       char nextc = *(pos + needle_len);
diff --git a/meta/recipes-support/libfaketime/libfaketime_0.9.12.bb b/meta/recipes-support/libfaketime/libfaketime_0.9.13.bb
similarity index 81%
rename from meta/recipes-support/libfaketime/libfaketime_0.9.12.bb
rename to meta/recipes-support/libfaketime/libfaketime_0.9.13.bb
index 89e4eebeaa46..e10d5aa457b4 100644
--- a/meta/recipes-support/libfaketime/libfaketime_0.9.12.bb
+++ b/meta/recipes-support/libfaketime/libfaketime_0.9.13.bb
@@ -4,11 +4,9 @@ HOMEPAGE = "https://github.com/wolfcw/libfaketime"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRCREV = "3ccdd344aadf1e317156fa5fb7c881f2c4404778"
+SRCREV = "86b37fde2fed7336ea2d0c17928e3015a55d9b4a"
 
-SRC_URI = "git://github.com/wolfcw/libfaketime.git;branch=master;tag=v${PV};protocol=https \
-           file://0001-Add-const-qualifiers-to-fix-build-with-ISO-C23.patch \
-"
+SRC_URI = "git://github.com/wolfcw/libfaketime.git;branch=master;tag=v${PV};protocol=https"
 
 CFLAGS:append:libc-musl = " -D_LARGEFILE64_SOURCE"
 
@@ -29,3 +27,6 @@ FILES:${PN} = "${bindir}/faketime ${libdir}/faketime/lib*${SOLIBS}"
 FILES:${PN}-dev += "${libdir}/faketime/lib*${SOLIBSDEV}"
 
 BBCLASSEXTEND = "native"
+
+# Building with -O2 results in clobbered variable error on 0.9.13
+FULL_OPTIMIZATION = "-O1"

-- 
2.47.3


