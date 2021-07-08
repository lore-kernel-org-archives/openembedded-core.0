Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web08.6590.1625710447498970748
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jul 2021 19:14:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: mingli.yu@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 1682E6nX032511
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 7 Jul 2021 19:14:06 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 1682E5Ea002789
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 7 Jul 2021 19:14:06 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Wed, 7 Jul 2021 19:14:04 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.10 via Frontend Transport; Wed, 7 Jul 2021 19:14:03 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [hardknott][PATCH] busybox: fix traceroute failure
Date: Thu, 8 Jul 2021 10:12:53 +0800
Message-ID: <20210708021253.38713-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Backport a patch to fix the below traceroute failure:
 $ traceroute -f 64 -I -n -m 240 10.226.43.84 46
traceroute: NO OPT x!

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../0001-traceroute-fix-option-parsing.patch  | 31 +++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.33.0.bb   |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/0001-traceroute-fix-option-parsing.patch

diff --git a/meta/recipes-core/busybox/busybox/0001-traceroute-fix-option-parsing.patch b/meta/recipes-core/busybox/busybox/0001-traceroute-fix-option-parsing.patch
new file mode 100644
index 0000000000..1e03b7dbfb
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/0001-traceroute-fix-option-parsing.patch
@@ -0,0 +1,31 @@
+From 89358a7131d3e75c74af834bb117b4fad7914983 Mon Sep 17 00:00:00 2001
+From: Denys Vlasenko <vda.linux@googlemail.com>
+Date: Tue, 2 Feb 2021 13:48:21 +0100
+Subject: [PATCH] traceroute: fix option parsing
+
+Fix option parsing
+
+Upstream-Status: Backport [https://git.busybox.net/busybox/commit/?h=1_33_stable&id=89358a7131d3e75c74af834bb117b4fad7914983]
+
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ networking/traceroute.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/networking/traceroute.c b/networking/traceroute.c
+index 3f1a9ab46..29f5e480b 100644
+--- a/networking/traceroute.c
++++ b/networking/traceroute.c
+@@ -896,7 +896,7 @@ traceroute_init(int op, char **argv)
+ 
+ 	op |= getopt32(argv, "^"
+ 		OPT_STRING
+-		"\0" "-1:x-x" /* minimum 1 arg */
++		"\0" "-1" /* minimum 1 arg */
+ 		, &tos_str, &device, &max_ttl_str, &port_str, &nprobes_str
+ 		, &source, &waittime_str, &pausemsecs_str, &first_ttl_str
+ 	);
+-- 
+2.31.1
+
diff --git a/meta/recipes-core/busybox/busybox_1.33.0.bb b/meta/recipes-core/busybox/busybox_1.33.0.bb
index b2a30ba16f..2d18ec072c 100644
--- a/meta/recipes-core/busybox/busybox_1.33.0.bb
+++ b/meta/recipes-core/busybox/busybox_1.33.0.bb
@@ -48,6 +48,7 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://pgrep.cfg \
            file://0001-decompress_gunzip-Fix-DoS-if-gzip-is-corrupt.patch \
            file://0001-gen_build_files-Use-C-locale-when-calling-sed-on-glo.patch \
+           file://0001-traceroute-fix-option-parsing.patch \
            "
 SRC_URI_append_libc-musl = " file://musl.cfg "
 
-- 
2.17.1

