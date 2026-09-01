Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40A12C624D3
	for <webhook@archiver.kernel.org>; Tue,  1 Sep 2026 17:41:59 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.566.1788284512043528208
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2026 10:41:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=0npFOetW;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 6558D1A1937
	for <openembedded-core@lists.openembedded.org>; Tue,  1 Sep 2026 17:41:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 323436053C
	for <openembedded-core@lists.openembedded.org>; Tue,  1 Sep 2026 17:41:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5B7C211C792AB;
	Tue,  1 Sep 2026 19:41:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788284509; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=tOrwNCXrEphq+Ko9BpqniwFRfWoV11/iNFqGYWsTuCk=;
	b=0npFOetWcBWV3POz4ZNiq6+hWRbGhppdHjrERLEZjvNFv3K01OMSK5DISIR6oAaAz/4Xlm
	4AjzaYHunJfdzsD1RjAXI6mZIF/ZVF0ceB+wIzfNn2qXhRc40iElJNf0SF69ghYtNteaL0
	MHYM/t+PmCHStFODRwIYt9Ca8o48C3t6Fwo5+MD/+LK2/PNpVU16o79ix1emSG0KTjhY7z
	CULa0hwW96y8Ou43T0bsKKzbIn76fzdOE0aJu1zMV7LD9LrEOPmwiT3A/AGXkGF2PuA/6l
	CuLwJ/kpW0cGPuBfVb/1wBq4gjE6K1oW6iWxsXIevQAr5eI0tC1sWsldzDdiow==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Tue, 01 Sep 2026 19:41:44 +0200
Subject: [PATCH 1/2] libfaketime: Import recipe from meta-oe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-mathieu-reproducible-faketime-v1-1-eac182548422@bootlin.com>
References: <20260901-mathieu-reproducible-faketime-v1-0-eac182548422@bootlin.com>
In-Reply-To: <20260901-mathieu-reproducible-faketime-v1-0-eac182548422@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788284507; l=4234;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=nAB9NQc/4a0d/sfZjB32bj75o2ghx5teWOc86MVb9Qs=;
 b=kZnHhRbxspP2fRKlSWhkMl7NaYr1/Koxvrh73gYc+9nOfhsrEiFrx9X7vT1bST2McALo3pzIL
 5BWJdBD9g1kBbDFCpb6sTwkSWj8Ew8MRUMhct7dda3KFn7uOHnZRtdR
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 17:41:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244842

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 meta/conf/distro/include/maintainers.inc           |  1 +
 ...onst-qualifiers-to-fix-build-with-ISO-C23.patch | 34 ++++++++++++++++++++++
 .../libfaketime/libfaketime_0.9.12.bb              | 31 ++++++++++++++++++++
 3 files changed, 66 insertions(+)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 2966cddc0569..fc57eb1395a1 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -342,6 +342,7 @@ RECIPE_MAINTAINER:pn-libevdev = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libevent = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libexif = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libfakekey = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-libfaketime = "Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>"
 RECIPE_MAINTAINER:pn-libffi = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libfm = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libfm-extra = "Unassigned <unassigned@yoctoproject.org>"
diff --git a/meta/recipes-support/libfaketime/libfaketime/0001-Add-const-qualifiers-to-fix-build-with-ISO-C23.patch b/meta/recipes-support/libfaketime/libfaketime/0001-Add-const-qualifiers-to-fix-build-with-ISO-C23.patch
new file mode 100644
index 000000000000..1696e7146e83
--- /dev/null
+++ b/meta/recipes-support/libfaketime/libfaketime/0001-Add-const-qualifiers-to-fix-build-with-ISO-C23.patch
@@ -0,0 +1,34 @@
+From dbe865dfdba0145d993d70b7fd4ec88b2f47554b Mon Sep 17 00:00:00 2001
+From: Tomas Korbar <tkorbar@redhat.com>
+Date: Mon, 15 Dec 2025 11:03:21 +0100
+Subject: [PATCH] Add const qualifiers to fix build with ISO C23
+
+Fix https://github.com/wolfcw/libfaketime/issues/524
+
+Upstream-Status: Backport [https://github.com/wolfcw/libfaketime/pull/525]
+---
+ src/libfaketime.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/libfaketime.c b/src/libfaketime.c
+index ef1dca9..02839c8 100644
+--- a/src/libfaketime.c
++++ b/src/libfaketime.c
+@@ -2666,7 +2666,7 @@ int timespec_get(struct timespec *ts, int base)
+ static void parse_ft_string(const char *user_faked_time)
+ {
+   struct tm user_faked_time_tm;
+-  char * tmp_time_fmt;
++  const char * tmp_time_fmt;
+   char * nstime_str;
+
+   if (!strncmp(user_faked_time, user_faked_time_saved, BUFFERLEN))
+@@ -3338,7 +3338,7 @@ static void prepare_config_contents(char *contents)
+ bool str_array_contains(const char *haystack, const char *needle)
+ {
+   size_t needle_len = strlen(needle);
+-  char *pos = strstr(haystack, needle);
++  const char *pos = strstr(haystack, needle);
+   while (pos) {
+     if (pos == haystack || *(pos - 1) == ',') {
+       char nextc = *(pos + needle_len);
diff --git a/meta/recipes-support/libfaketime/libfaketime_0.9.12.bb b/meta/recipes-support/libfaketime/libfaketime_0.9.12.bb
new file mode 100644
index 000000000000..89e4eebeaa46
--- /dev/null
+++ b/meta/recipes-support/libfaketime/libfaketime_0.9.12.bb
@@ -0,0 +1,31 @@
+SUMMARY = "A library for faking the system time in user-space programs"
+SECTION = "libs"
+HOMEPAGE = "https://github.com/wolfcw/libfaketime"
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+SRCREV = "3ccdd344aadf1e317156fa5fb7c881f2c4404778"
+
+SRC_URI = "git://github.com/wolfcw/libfaketime.git;branch=master;tag=v${PV};protocol=https \
+           file://0001-Add-const-qualifiers-to-fix-build-with-ISO-C23.patch \
+"
+
+CFLAGS:append:libc-musl = " -D_LARGEFILE64_SOURCE"
+
+do_configure[noexec] = "1"
+
+do_compile () {
+    oe_runmake
+}
+
+do_install () {
+    install -d ${D}${libdir}/faketime
+    oe_libinstall -C src libfaketime ${D}${libdir}/faketime
+    install -d ${D}${bindir}
+    install -m 0755 src/faketime ${D}${bindir}
+}
+
+FILES:${PN} = "${bindir}/faketime ${libdir}/faketime/lib*${SOLIBS}"
+FILES:${PN}-dev += "${libdir}/faketime/lib*${SOLIBSDEV}"
+
+BBCLASSEXTEND = "native"

-- 
2.47.3


