Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86250C433F5
	for <webhook@archiver.kernel.org>; Sun, 16 Jan 2022 16:24:04 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web11.35058.1642350244059959139
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Jan 2022 08:24:04 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: kai.kang@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 20GGO3ll007727
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Jan 2022 08:24:03 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 20GGO3CZ019248
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Jan 2022 08:24:03 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Sun, 16 Jan 2022 08:24:03 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Sun, 16 Jan 2022 08:24:02 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Sun, 16 Jan 2022 08:24:02 -0800
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/2] speex: fix CVE-2020-23903
Date: Mon, 17 Jan 2022 00:23:58 +0800
Message-ID: <20220116162358.25288-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <16CACCBAFCDDAA88.10264@lists.openembedded.org>
References: <16CACCBAFCDDAA88.10264@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Jan 2022 16:24:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160615

From: Kai Kang <kai.kang@windriver.com>

Backport patch to fix CVE-2020-23903.

CVE: CVE-2020-23903

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../speex/speex/CVE-2020-23903.patch          | 30 +++++++++++++++++++
 meta/recipes-multimedia/speex/speex_1.2.0.bb  |  4 ++-
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/speex/speex/CVE-2020-23903.patch

diff --git a/meta/recipes-multimedia/speex/speex/CVE-2020-23903.patch b/meta/recipes-multimedia/speex/speex/CVE-2020-23903.patch
new file mode 100644
index 0000000000..eb16e95ffc
--- /dev/null
+++ b/meta/recipes-multimedia/speex/speex/CVE-2020-23903.patch
@@ -0,0 +1,30 @@
+Backport patch to fix CVE-2020-23903.
+
+CVE: CVE-2020-23903
+Upstream-Status: Backport [https://github.com/xiph/speex/commit/870ff84]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+From 870ff845b32f314aec0036641ffe18aba4916887 Mon Sep 17 00:00:00 2001
+From: Tristan Matthews <tmatth@videolan.org>
+Date: Mon, 13 Jul 2020 23:25:03 -0400
+Subject: [PATCH] wav_io: guard against invalid channel numbers
+
+Fixes #13
+---
+ src/wav_io.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/wav_io.c b/src/wav_io.c
+index b5183015..09d62eb0 100644
+--- a/src/wav_io.c
++++ b/src/wav_io.c
+@@ -111,7 +111,7 @@ int read_wav_header(FILE *file, int *rate, int *channels, int *format, spx_int32
+    stmp = le_short(stmp);
+    *channels = stmp;
+ 
+-   if (stmp>2)
++   if (stmp>2 || stmp<1)
+    {
+       fprintf (stderr, "Only mono and (intensity) stereo supported\n");
+       return -1;
diff --git a/meta/recipes-multimedia/speex/speex_1.2.0.bb b/meta/recipes-multimedia/speex/speex_1.2.0.bb
index 3a0911d6f8..ea475f0f1b 100644
--- a/meta/recipes-multimedia/speex/speex_1.2.0.bb
+++ b/meta/recipes-multimedia/speex/speex_1.2.0.bb
@@ -7,7 +7,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=314649d8ba9dd7045dfb6683f298d0a8 \
                     file://include/speex/speex.h;beginline=1;endline=34;md5=ef8c8ea4f7198d71cf3509c6ed05ea50"
 DEPENDS = "libogg speexdsp"
 
-SRC_URI = "http://downloads.xiph.org/releases/speex/speex-${PV}.tar.gz"
+SRC_URI = "http://downloads.xiph.org/releases/speex/speex-${PV}.tar.gz \
+           file://CVE-2020-23903.patch \
+           "
 UPSTREAM_CHECK_REGEX = "speex-(?P<pver>\d+(\.\d+)+)\.tar"
 
 SRC_URI[md5sum] = "8ab7bb2589110dfaf0ed7fa7757dc49c"
-- 
2.17.1


