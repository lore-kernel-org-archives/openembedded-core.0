Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E59F0C9832A
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 04:00:37 +0000 (UTC)
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.384.1790654433976178782
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 21:00:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=JbzOIi89;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=7561; q=dns/txt;
  s=iport01; t=1790654433; x=1791864033;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Uod2PzHegFecHiAtstlMJX+UNFSfWG+XTIU4R+zi3R4=;
  b=JbzOIi89CXGrrs6gkM7YuU35sLdPlMvutQqJsl0FTlIe6RJB+gcqpnla
   HT3PrzZ0SJiHMFptBzwPv4z7NAo8wSKVegtzEGrlqls7GD42+GqBi4BNh
   RyfIYX//TMPeeNe8DThHf/g1tZ/CB3vcyhMTqZO91IQczOgUiFXK+hggu
   ClsLGUB3MLpS6FjkuUYcjU4L92IAD7oWMm+ldpnSeU6fsie4aru7UdB+p
   U+XvCNWkhPTcZ1r5B9C+UqH03AQjqlgES3jtm+iRHjrsFHa1r0X5l+FYw
   omaOAo/vUszdA001Rl2WyKT8O2IjvhRsXVzefy0s40TvzPioqwbYHBbe0
   w==;
X-CSE-ConnectionGUID: 05a7osxeQOKiLc15FNu8Ww==
X-CSE-MsgGUID: ExocosRsSDaEJYGt+JB8Gw==
X-IPAS-Result: =?us-ascii?q?A0BLAgBoN7tq/4r/Ja1aglmCV3VgQ0mWSoEWmQOEBBSBa?=
 =?us-ascii?q?g8BAQEPRA0EAQGFBY4KAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4ZPDZASAQIBKgsBGAEtLAMBAlodAQUhgwIBgnQDEcAKgXkzgQGDK?=
 =?us-ascii?q?QGBVNsyAQsUAQWBM4VAiCNdGAGEfCcbG4FygRWCc3aCYQICgUWGXgSDLoFaH?=
 =?us-ascii?q?pM4SIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4EHGwYFgR2BIIIZIxk2e?=
 =?us-ascii?q?oEJXoErKWABEBeBB4IHAoJUggECAUlDDgdFUwklRRJHJiIIEgkBExowC4EhO?=
 =?us-ascii?q?EEJKD8YDUgRLDcVGQQ+bgeQPx6CGEYHATBdARMXAReBLEVGkxMKO4JgjHuCI?=
 =?us-ascii?q?aEPCiiDdowilToaM4QEgVeSQJJUmQiKC4N/lXNdhGmBaDyBWXAVgyIJShkPj?=
 =?us-ascii?q?i4WgwKFcYE9xWknMgIJMgIHAgcOAwuTBmABAQ?=
IronPort-Data: A9a23:TVtDWqy94tmIrOfRPWh6t+dhxyrEfRIJ4+MujC+fZmUNrF6WrkUFy
 2QcCzyDaPeOZGPze4xxYITlphtTupXVmNBhSQtu+1hgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCKa/lHyYuCJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 4yaT/H3Ygf/hWYlaDJMscpvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJBlrNNIf4fZ6OEZt9
 NgTcW0jSA3TuP3jldpXSsE07igiBNPgMIVavjRryivUSK5/B5vCWK7No9Rf2V/chOgXQq2YP
 JVfM2cyKk2bM3WjOX9PYH46tOe0hnD8eidwo1OOrq1x6G/WpOB0+OW3YIWMI4XSFK25mG61t
 mXN+H/DGSo2PfG9+BWZsVCG1sDQyHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rbyyjVSzc9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc8BbH+t/7ESGzbDZpl7AQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSv1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:+8VEnqm0hE/k+JKG79hutQhHKt7pDfIA3DAbv31ZSRFFG/FwWf
 rAoB19726QtN9/YhAdcLy7VZVoIkmsl6Kdn7NwAV7KZmCP0wGVxepZg7cKrQeNJ8TWzJ846U
 4ZSdkcNPTASX5nkM39/A60V/wkwNWB7eSUoN229QYLcemvAJsQljuQzW2gYytLeDU=
X-Talos-CUID: 9a23:EV1GRW1gqpvI9AHcPYxeQbxfQp0sLXrG3HrpBGy5LW0wFZOzVA+v5/Yx
X-Talos-MUID: 9a23:NiEGOgosWDCrWt1G3yoezxxyM8xv+J61M2wEvLc3lNXHFwYgFCjI2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,129,1787011200"; 
   d="scan'208";a="528711109"
Received: from rcdn-l-core-01.cisco.com ([173.37.255.138])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 29 Sep 2026 04:00:33 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-01.cisco.com (Postfix) with ESMTPS id D36DF18000330;
	Tue, 29 Sep 2026 04:00:32 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id 7ADA6CC1611; Mon, 28 Sep 2026 21:00:32 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][wrynose][PATCH] libxml2: upgrade 2.15.3 -> 2.15.4
Date: Mon, 28 Sep 2026 21:00:32 -0700
Message-Id: <20260929040032.325322-1-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: rcdn-l-core-01.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 04:00:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246805

From: Richard Purdie <richard.purdie@linuxfoundation.org>

v2.15.4: Sep 01 2026

- xmlregexp: Prevent out-of-bounds read in NXT macro
- fix: add missing overflow checks in dict.c, uri.c, and valid.c
- xmlregexp: Calc string length after null checking
- xpointer: Check overflow in xmlXPtrEvalXPtrPart
- xmlIO: Check for int overflow before calling writecallback
- fix(xinclude): propagate parseFlags in xmlXIncludeProcess and xmlXIncludeProcessTree

- Improve bound checks for xmlcatalog and xmllint arguments (out-of-bound)
- Fix memory leak in static Windows library (memory-leak)
- xmlreader: Copy DTD in xmlTextReaderDumpCopy
- parser: Fix double free in xmlIOParseDTD (double-free)
- parser: fix division-by-zero when maxAmpl is set to 0
- parser: Fix memory leak in xmlCtxtSetSaxHandler (memory-leak)
- catalog: Make sure to reset catalog resolve cache
- xmlAddChild: unlink node before free for text nodes (memory-leak)
- Normalize entity values in attr in xmlNodeGetContent
- Handle whitespace for date/time/duration types
- catalog: Fix NULL deref for nextCatalog without 'catalog' attribute (null-deref)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8875c7e8dbecc0700aa6db49b66b8d77a21938b1)
Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 ...-installation-directories-in-libxml2.patch |  6 +-
 .../libxml/libxml2/CVE-2026-11979.patch       | 81 -------------------
 .../libxml/libxml2/install-tests.patch        |  2 +-
 .../{libxml2_2.15.3.bb => libxml2_2.15.4.bb}  |  3 +-
 4 files changed, 5 insertions(+), 87 deletions(-)
 delete mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-11979.patch
 rename meta/recipes-core/libxml/{libxml2_2.15.3.bb => libxml2_2.15.4.bb} (96%)

diff --git a/meta/recipes-core/libxml/libxml2/0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch b/meta/recipes-core/libxml/libxml2/0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch
index d19b284866d..a1d24b596e0 100644
--- a/meta/recipes-core/libxml/libxml2/0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch
+++ b/meta/recipes-core/libxml/libxml2/0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch
@@ -1,4 +1,4 @@
-From 803e6f21d3d7ef6399f6ffe58cd28fa6dc7b94e9 Mon Sep 17 00:00:00 2001
+From aa31b72c260de3f15289db8d78c9674b0cf55f7f Mon Sep 17 00:00:00 2001
 From: Peter Marko <peter.marko@siemens.com>
 Date: Mon, 26 May 2025 21:11:14 +0200
 Subject: [PATCH] Revert "cmake: Fix installation directories in
@@ -66,10 +66,10 @@ index ff6433f..b775cfe 100644
  set(LIBXML2_LIBRARIES ${LIBXML2_LIBRARY})
  set(LIBXML2_INCLUDE_DIRS ${LIBXML2_INCLUDE_DIR})
 diff --git a/meson.build b/meson.build
-index 2cfecb6..f78da31 100644
+index f8337ea..19fdbb0 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -593,9 +593,6 @@ config_cmake = configuration_data()
+@@ -594,9 +594,6 @@ config_cmake = configuration_data()
  config_cmake.set('LIBXML_MAJOR_VERSION', v_maj)
  config_cmake.set('LIBXML_MINOR_VERSION', v_min)
  config_cmake.set('LIBXML_MICRO_VERSION', v_mic)
diff --git a/meta/recipes-core/libxml/libxml2/CVE-2026-11979.patch b/meta/recipes-core/libxml/libxml2/CVE-2026-11979.patch
deleted file mode 100644
index a14e566681e..00000000000
--- a/meta/recipes-core/libxml/libxml2/CVE-2026-11979.patch
+++ /dev/null
@@ -1,81 +0,0 @@
-From dfad0660f7dab3b5f8317b703b16ad0b0d12697d Mon Sep 17 00:00:00 2001
-From: Daniel Garcia Moreno <daniel.garcia@suse.com>
-Date: Fri, 22 May 2026 12:21:20 +0200
-Subject: [PATCH] xmlcatalog: overflow check for large --shell commands
-
-Fix https://gitlab.gnome.org/GNOME/libxml2/-/work_items/1124
-
-CVE: CVE-2026-11979
-Signed-off-by: Anton Skorup <anton.skorup@axis.com>
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/c2e233fc1b341685fc99621b2768b503f777a72e]
----
- test/catalogs/test.sh | 11 +++++++++++
- xmlcatalog.c          | 16 ++++++++++++++++
- 2 files changed, 27 insertions(+)
-
-diff --git a/test/catalogs/test.sh b/test/catalogs/test.sh
-index 7e5eaa76..84e8b90a 100755
---- a/test/catalogs/test.sh
-+++ b/test/catalogs/test.sh
-@@ -10,6 +10,17 @@ fi
- 
- exitcode=0
- 
-+# Test xmlcatalog --shell command line
-+# Case 1: Really long argument (470 chars)
-+input=""; for i in {1..470}; do input="${input}A"; done
-+echo $input | $xmlcatalog --shell test/catalogs/dockbook.xml || exit 1
-+# Case 2: public + long argument
-+input="public "; for i in {1..470}; do input="${input}A"; done
-+echo $input | $xmlcatalog --shell test/catalogs/dockbook.xml || exit 1
-+# Case 3: public + lots of args
-+input="public "; for i in {1..80}; do input="${input} x"; done
-+echo $input | $xmlcatalog --shell test/catalogs/dockbook.xml || exit 1
-+
- for i in test/catalogs/*.script ; do
-     name=$(basename $i .script)
-     xml="./test/catalogs/$name.xml"
-diff --git a/xmlcatalog.c b/xmlcatalog.c
-index b400c7cb..5113e930 100644
---- a/xmlcatalog.c
-+++ b/xmlcatalog.c
-@@ -135,6 +135,12 @@ static void usershell(void) {
- 	       (*cur != '\n') && (*cur != '\r')) {
- 	    if (*cur == 0)
- 		break;
-+            /* Do not read beyond the command array capacity */
-+            if (i >= (int)sizeof(command) - 2) {
-+                printf("Invalid command %s\n", cur);
-+                i = 0;
-+                break;
-+            }
- 	    command[i++] = *cur++;
- 	}
- 	command[i] = 0;
-@@ -152,6 +158,11 @@ static void usershell(void) {
- 	while ((*cur != '\n') && (*cur != '\r') && (*cur != 0)) {
- 	    if (*cur == 0)
- 		break;
-+            if (i >= (int)sizeof(arg) - 2) {
-+                printf("Invalid arg %s\n", arg);
-+                i = 0;
-+                break;
-+            }
- 	    arg[i++] = *cur++;
- 	}
- 	arg[i] = 0;
-@@ -164,6 +175,11 @@ static void usershell(void) {
- 	cur = arg;
- 	memset(argv, 0, sizeof(argv));
- 	while (*cur != 0) {
-+            if (i >= (int)sizeof(argv) / (int)sizeof(char*)) {
-+                printf("Too much arguments\n");
-+                break;
-+            }
-+
- 	    while ((*cur == ' ') || (*cur == '\t')) cur++;
- 	    if (*cur == '\'') {
- 		cur++;
--- 
-2.43.0
-
diff --git a/meta/recipes-core/libxml/libxml2/install-tests.patch b/meta/recipes-core/libxml/libxml2/install-tests.patch
index 996ade614e2..55559b7df3e 100644
--- a/meta/recipes-core/libxml/libxml2/install-tests.patch
+++ b/meta/recipes-core/libxml/libxml2/install-tests.patch
@@ -1,4 +1,4 @@
-From c6b547e06beb0f0ba99e30d036f055eaed9ec4dc Mon Sep 17 00:00:00 2001
+From 11159757ae9ff484e02764b36cef970b3d0178c2 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Fri, 17 Oct 2025 14:15:36 +0800
 Subject: [PATCH] add yocto-specific install-ptest target
diff --git a/meta/recipes-core/libxml/libxml2_2.15.3.bb b/meta/recipes-core/libxml/libxml2_2.15.4.bb
similarity index 96%
rename from meta/recipes-core/libxml/libxml2_2.15.3.bb
rename to meta/recipes-core/libxml/libxml2_2.15.4.bb
index abf9889b3f3..a0605199513 100644
--- a/meta/recipes-core/libxml/libxml2_2.15.3.bb
+++ b/meta/recipes-core/libxml/libxml2_2.15.4.bb
@@ -18,10 +18,9 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://run-ptest \
            file://install-tests.patch \
            file://0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch \
-           file://CVE-2026-11979.patch \
            "
 
-SRC_URI[archive.sha256sum] = "78262a6e7ac170d6528ebfe2efccdf220191a5af6a6cd61ea4a9a9a5042c7a07"
+SRC_URI[archive.sha256sum] = "98087fd181d9070724f3fbc65c7377db03038eb92bd882374daff44940138821"
 SRC_URI[testtar.sha256sum] = "c6b2d42ee50b8b236e711a97d68e6c4b5c8d83e69a2be4722379f08702ea7273"
 
 CVE_STATUS[CVE-2025-6170] = "fixed-version: fixed in version 2.14.5"
-- 
2.35.6


