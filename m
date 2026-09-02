Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D91B7C61DD6
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 18:09:57 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2105.1788372596499766785
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2026 11:09:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=qjca6XVS;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D45A24E414CE
	for <openembedded-core@lists.openembedded.org>; Wed,  2 Sep 2026 18:09:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AA3406053C
	for <openembedded-core@lists.openembedded.org>; Wed,  2 Sep 2026 18:09:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 27BDA11C78B34;
	Wed,  2 Sep 2026 20:09:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788372590; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=tOrwNCXrEphq+Ko9BpqniwFRfWoV11/iNFqGYWsTuCk=;
	b=qjca6XVSa6HBuD1J65mUkDX0Jv6Ou8AiVM7c7LHNfV+LOq/hXz32b08TqQxlj5d8YYZy9b
	IvKKWFNo1dWnrBt23fZbl4Jt03Aqag7kxw2T5GjU9Gekj8V1MYm2js44WAVLqQlTcvKPmT
	UfK4l2U5rHYeLlaqVSHa+cpg87M+83CKnab1qhzu7iw2J5wJ+S39FFHLsTDooQs4X+88Wm
	pN+SzeEmlymniBZ6kwVItqcCOtKIFfufdeg/U8l6LcAB76IT+4axiB6IEGByFficU+0EtG
	7wtxlF4Iu77FdFH2LeZfqNg7JTciTBkbjj76a5birExlC4/lyyylK8kviom48w==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Wed, 02 Sep 2026 20:09:42 +0200
Subject: [PATCH v2 1/4] libfaketime: Import recipe from meta-oe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-mathieu-reproducible-faketime-v2-1-9496dff5bde3@bootlin.com>
References: <20260902-mathieu-reproducible-faketime-v2-0-9496dff5bde3@bootlin.com>
In-Reply-To: <20260902-mathieu-reproducible-faketime-v2-0-9496dff5bde3@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788372584; l=4234;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=nAB9NQc/4a0d/sfZjB32bj75o2ghx5teWOc86MVb9Qs=;
 b=JOntaTzJxtwUj6amqCQy/Z3sEP5pUlUCJrRpPhfiGyUwWaJHPKf/CmsoMkL7gDCdhFNKajfLn
 X+gCHYE+FAvBRDU8YKcmpAwhkv1MTU0hKLy3+4mVSv9KeIw6nWxjgQH
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 18:09:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244986

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


