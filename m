Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9716FCCA471
	for <webhook@archiver.kernel.org>; Fri,  3 Oct 2025 18:25:52 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web11.1371.1759515946717928276
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Oct 2025 11:25:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=dC0bP+0y;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-202510031825423047a1addd000207a3-fibfc5@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202510031825423047a1addd000207a3
        for <openembedded-core@lists.openembedded.org>;
        Fri, 03 Oct 2025 20:25:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=Bqz/VoTpwzNWZtQ8hSmuRQaZEnU3z5tLgQ5d46riwU8=;
 b=dC0bP+0yLAy7eHWP3kK4sBrezLNHvO5aNhgIaZd1iKo2HrGfLsP/+s4uHx37lEP4VjHsJH
 UFM+NbX2F79wYKpvUxjjhRy3f5Mh2RlbBtfj83PR8LAYAowI6XZriyWnHMocq39zEpDWgP7C
 IFbwp3h93f6CpxrA1j4GIyWZM88gCw8NSbYTYOmThJB7OB1puNcAFEMy6MrhLhn1hvGF7FBs
 YF4LnF2o7iT/3Uv7ZSbZuuBzn+7m5akGszCFPeprPrxT4YadIw7DnrKvps8ybv0HUJ+HC2ij
 d3Jal/TghfWjKovPlZUtE6kDIHe2BGnIPRjoy1Rdbmgvn0AgYxWNN3Lg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH v2] busybox: patch CVE-2025-46394
Date: Fri,  3 Oct 2025 20:25:33 +0200
Message-Id: <20251003182533.30573-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Oct 2025 18:25:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224412

From: Peter Marko <peter.marko@siemens.com>

Pick commit mentioning this CVE.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../busybox/busybox/CVE-2025-46394-01.patch   | 57 +++++++++++++++++++
 .../busybox/busybox/CVE-2025-46394-02.patch   | 32 +++++++++++
 meta/recipes-core/busybox/busybox_1.37.0.bb   |  2 +
 3 files changed, 91 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2025-46394-01.patch
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2025-46394-02.patch

diff --git a/meta/recipes-core/busybox/busybox/CVE-2025-46394-01.patch b/meta/recipes-core/busybox/busybox/CVE-2025-46394-01.patch
new file mode 100644
index 00000000000..c95cba3c33b
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/CVE-2025-46394-01.patch
@@ -0,0 +1,57 @@
+From f5e1bf966b19ea1821f00a8c9ecd7774598689b4 Mon Sep 17 00:00:00 2001
+From: Denys Vlasenko <vda.linux@googlemail.com>
+Date: Wed, 24 Sep 2025 03:28:47 +0200
+Subject: [PATCH] archival/libarchive: sanitize filenames on output (prevent
+ control sequence attacks
+
+This fixes CVE-2025-46394 (terminal escape sequence injection)
+
+Original credit: Ian.Norton at entrust.com
+
+function                                             old     new   delta
+header_list                                            9      15      +6
+header_verbose_list                                  239     244      +5
+------------------------------------------------------------------------------
+(add/remove: 0/0 grow/shrink: 2/0 up/down: 11/0)               Total: 11 bytes
+
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+
+CVE: CVE-2025-46394
+Upstream-Status: Backport [https://git.busybox.net/busybox/commit/?id=f5e1bf966b19ea1821f00a8c9ecd7774598689b4]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ archival/libarchive/header_list.c         | 2 +-
+ archival/libarchive/header_verbose_list.c | 4 ++--
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/archival/libarchive/header_list.c b/archival/libarchive/header_list.c
+index 0621aa406..9490b3635 100644
+--- a/archival/libarchive/header_list.c
++++ b/archival/libarchive/header_list.c
+@@ -8,5 +8,5 @@
+ void FAST_FUNC header_list(const file_header_t *file_header)
+ {
+ //TODO: cpio -vp DIR should output "DIR/NAME", not just "NAME" */
+-	puts(file_header->name);
++	puts(printable_string(file_header->name));
+ }
+diff --git a/archival/libarchive/header_verbose_list.c b/archival/libarchive/header_verbose_list.c
+index a575a08a0..e7a09430d 100644
+--- a/archival/libarchive/header_verbose_list.c
++++ b/archival/libarchive/header_verbose_list.c
+@@ -57,13 +57,13 @@ void FAST_FUNC header_verbose_list(const file_header_t *file_header)
+ 		ptm->tm_hour,
+ 		ptm->tm_min,
+ 		ptm->tm_sec,
+-		file_header->name);
++		printable_string(file_header->name));
+ 
+ #endif /* FEATURE_TAR_UNAME_GNAME */
+ 
+ 	/* NB: GNU tar shows "->" for symlinks and "link to" for hardlinks */
+ 	if (file_header->link_target) {
+-		printf(" -> %s", file_header->link_target);
++		printf(" -> %s", printable_string(file_header->link_target));
+ 	}
+ 	bb_putchar('\n');
+ }
diff --git a/meta/recipes-core/busybox/busybox/CVE-2025-46394-02.patch b/meta/recipes-core/busybox/busybox/CVE-2025-46394-02.patch
new file mode 100644
index 00000000000..ec17b9285a7
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/CVE-2025-46394-02.patch
@@ -0,0 +1,32 @@
+From 7378db981d87b4a2264e14d60340a7fb5c67ae59 Mon Sep 17 00:00:00 2001
+From: Peter Marko <peter.marko@siemens.com>
+Date: Fri, 3 Oct 2025 16:12:56 +0200
+Subject: [PATCH] testsuite/tar.tests: fix test after CVE-2025-46394
+
+tar now sanitizes output and this test needs to expect that.
+
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+
+CVE: CVE-2025-46394
+Upstream-Status: Submitted [https://lists.busybox.net/pipermail/busybox/2025-October/091743.html]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ testsuite/tar.tests | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/testsuite/tar.tests b/testsuite/tar.tests
+index 0f2e89112..48fc38114 100755
+--- a/testsuite/tar.tests
++++ b/testsuite/tar.tests
+@@ -325,9 +325,9 @@ unset LANG
+ rm -rf etc usr
+ ' "\
+ etc/ssl/certs/3b2716e5.0
+-etc/ssl/certs/EBG_Elektronik_Sertifika_Hizmet_Sağlayıcısı.pem
++etc/ssl/certs/EBG_Elektronik_Sertifika_Hizmet_Sa??lay??c??s??.pem
+ etc/ssl/certs/f80cc7f6.0
+-usr/share/ca-certificates/mozilla/EBG_Elektronik_Sertifika_Hizmet_Sağlayıcısı.crt
++usr/share/ca-certificates/mozilla/EBG_Elektronik_Sertifika_Hizmet_Sa??lay??c??s??.crt
+ 0
+ etc/ssl/certs/3b2716e5.0 -> EBG_Elektronik_Sertifika_Hizmet_Sağlayıcısı.pem
+ etc/ssl/certs/EBG_Elektronik_Sertifika_Hizmet_Sağlayıcısı.pem -> /usr/share/ca-certificates/mozilla/EBG_Elektronik_Sertifika_Hizmet_Sağlayıcısı.crt
diff --git a/meta/recipes-core/busybox/busybox_1.37.0.bb b/meta/recipes-core/busybox/busybox_1.37.0.bb
index bec25348b82..9e6a7b7b4cb 100644
--- a/meta/recipes-core/busybox/busybox_1.37.0.bb
+++ b/meta/recipes-core/busybox/busybox_1.37.0.bb
@@ -56,6 +56,8 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://0001-archival-disallow-path-traversals-CVE-2023-39810.patch \
            file://0001-hwclock-Check-for-SYS_settimeofday-before-calling-sy.patch \
            file://0001-busybox-Add-awk-gsub-erroneous-word-start-match-test.patch \
+           file://CVE-2025-46394-01.patch \
+           file://CVE-2025-46394-02.patch \
            "
 SRC_URI:append:libc-musl = " file://musl.cfg"
 SRC_URI:append:x86-64 = " file://sha_accel.cfg"

