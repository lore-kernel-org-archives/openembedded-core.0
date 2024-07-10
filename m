Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00AB4C3DA5A
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 09:44:30 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.10228.1720604655855506421
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jul 2024 02:44:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=rNnYXTKm;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1720604661; x=1752140661;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=VBiyZlbsoKP5RKqU6XFOojXgtqF1M+TEtDsKE+gLW2E=;
  b=rNnYXTKm05m+hN2N70cKqTD1Z5Hm4Z2ycv/9W9oXxxOkDARzYLIREld4
   iqReUobPEft1ksM5m61lWnV1uarU3yMczaQlZ6liMnfkBY2xDgNXYBMke
   +InFXE4HWUtZRSDqWik3cPon0/YwpCAmvSMF5VfbVnRndS7lo0Wpr0KFi
   QQNeGRJTlEv6ETxMAxI16TZ4aRwmq1kduM6VdtwUSTKahbxBQBdS8qmBB
   sNE9+3Tlv+USAWeZww7ejFLu0Uxt3CMHDRLGjQF+mwBcvT41kU6rICDO/
   TRkyxOUj6k+B/hmhe77kysUniGgGqOQUutSyzEjrJDl6jIMI7cqQ+7d2E
   g==;
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="145971271"
X-IronPort-AV: E=Sophos;i="6.09,197,1716217200"; 
   d="scan'208";a="145971271"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2024 18:44:19 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 3DF40C9164
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 18:44:17 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 903AACF7FE
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 18:44:16 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 21DBB1EBE69
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 18:44:16 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C62181A000C;
	Wed, 10 Jul 2024 17:44:15 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 19/30] opkg: upgrade 0.6.3 -> 0.7.0
Date: Wed, 10 Jul 2024 17:43:43 +0800
Message-Id: <1720604634-23406-19-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1720604634-23406-1-git-send-email-wangmy@fujitsu.com>
References: <1720604634-23406-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28520.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28520.006
X-TMASE-Result: 10--9.829400-10.000000
X-TMASE-MatchedRID: PXzrFdFmygGjz0nOeth/yeMobH1h01zikdS3kPlaZyVUjspoiX02F0od
	GV1LGob5KqrQ7lLcMnwt/DPtuO0OwdzZGrP764sO/HTKStsDGMJyGvikEsYi8AfxTM57BPHDvwU
	evDt+uW40gGvDuBPXdC//MlDRqI8m9R7dwXny/beRgPzABkqxIBdoyFlJ5UUM+7PAkASTOu643g
	AM6cgX+xZ65xuSzpC2KaZvH6MZxf30hqgkYn/Qi836paW7ZnFomLueCjm/53TC9z60K74zjD9Jn
	3A147yPuH0SzH4JWPZQ0dgkyLN5bnN78NmAjN8v6nHbeBu5LnkeHKxY83c7OJsoi2XrUn/JQYMO
	RuDWAmTfaY87m2dqxyAHAopEd76vg35wH1nihfkUDz3lXxp1PDPyDRdxOc8dio5T35TKoDvNPt8
	yH6hU+g==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 09:44:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201712

From: Wang Mingyu <wangmy@fujitsu.com>

0001-libopkg-Use-libgen.h-to-provide-basename-API.patch
removed since it's included in 0.7.0

0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch
refreshed for 0.7.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...Use-libgen.h-to-provide-basename-API.patch | 62 -------------------
 ...-opkg.lock-in-run-instead-of-var-run.patch |  9 +--
 .../opkg/{opkg_0.6.3.bb => opkg_0.7.0.bb}     |  3 +-
 3 files changed, 4 insertions(+), 70 deletions(-)
 delete mode 100644 meta/recipes-devtools/opkg/opkg/0001-libopkg-Use-libgen.h-to-provide-basename-API.patch
 rename meta/recipes-devtools/opkg/{opkg_0.6.3.bb => opkg_0.7.0.bb} (95%)

diff --git a/meta/recipes-devtools/opkg/opkg/0001-libopkg-Use-libgen.h-to-provide-basename-API.patch b/meta/recipes-devtools/opkg/opkg/0001-libopkg-Use-libgen.h-to-provide-basename-API.patch
deleted file mode 100644
index 61581e752b..0000000000
--- a/meta/recipes-devtools/opkg/opkg/0001-libopkg-Use-libgen.h-to-provide-basename-API.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 7a1c13a48cf020c40dda1721d5c2ffd95e8e669a Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 10 Dec 2023 19:39:29 -0800
-Subject: [PATCH v2] libopkg: Use libgen.h to provide basename API
-
-Also ensure that copy of filename is passed into archive_entry_set_pathname
-so it can be operated upon by posix basename which expect non-const
-character pointer as input.
-
-This became evident with latest musl where basename declaration was
-dropped from string.h [1]
-
-[1] https://git.musl-libc.org/cgit/musl/commit/?id=725e17ed6dff4d0cd22487bb64470881e86a92e7
-
-Upstream-Status: Backport [74fc3a991f974095644897d18d43846b5f359dae]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-v2: Do not override basename wholesale
-
- libopkg/opkg_archive.c | 6 ++++--
- libopkg/opkg_remove.c  | 1 +
- 2 files changed, 5 insertions(+), 2 deletions(-)
-
-diff --git a/libopkg/opkg_archive.c b/libopkg/opkg_archive.c
-index 03a4afb..b099f5b 100644
---- a/libopkg/opkg_archive.c
-+++ b/libopkg/opkg_archive.c
-@@ -20,6 +20,7 @@
- 
- #include <archive.h>
- #include <archive_entry.h>
-+#include <libgen.h>
- #include <stdlib.h>
- #include <stdio.h>
- #include <string.h>
-@@ -797,8 +798,9 @@ int gz_write_archive(const char *filename, const char *gz_filename)
-     }
- 
-     /* Remove path hierarchy, as we are only compressing a single file */
--    archive_entry_set_pathname(entry, basename(filename));
--
-+    char* tmp = xstrdup(filename);
-+    archive_entry_set_pathname(entry, basename(tmp));
-+    free(tmp);
-     r = archive_write_header(a, entry);
-     if (r != ARCHIVE_OK) {
-         opkg_msg(ERROR, "Failed to create compressed file: '%s' : %s (errno=%d)",
-diff --git a/libopkg/opkg_remove.c b/libopkg/opkg_remove.c
-index 889c672..5254388 100644
---- a/libopkg/opkg_remove.c
-+++ b/libopkg/opkg_remove.c
-@@ -20,6 +20,7 @@
- 
- #include "config.h"
- 
-+#include <libgen.h>
- #include <stdio.h>
- #include <glob.h>
- #include <unistd.h>
--- 
-2.43.0
-
diff --git a/meta/recipes-devtools/opkg/opkg/0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch b/meta/recipes-devtools/opkg/opkg/0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch
index e94a4123dd..98daf746ec 100644
--- a/meta/recipes-devtools/opkg/opkg/0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch
+++ b/meta/recipes-devtools/opkg/opkg/0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch
@@ -1,4 +1,4 @@
-From a4628a6171f393add9a2b287483ca39bb72b4dd6 Mon Sep 17 00:00:00 2001
+From 82b29dcfe3033d8285890bf46e58f464d9944196 Mon Sep 17 00:00:00 2001
 From: Jonathan Liu <net147@gmail.com>
 Date: Mon, 21 Sep 2015 20:23:23 +1000
 Subject: [PATCH] opkg_conf: create opkg.lock in /run instead of /var/run
@@ -17,10 +17,10 @@ Signed-off-by: Jonathan Liu <net147@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/libopkg/opkg_conf.h b/libopkg/opkg_conf.h
-index 7bca948..5a1bc44 100644
+index 3fa6ca9..b12672e 100644
 --- a/libopkg/opkg_conf.h
 +++ b/libopkg/opkg_conf.h
-@@ -40,7 +40,7 @@ extern "C" {
+@@ -42,7 +42,7 @@ extern "C" {
  #define OPKG_CONF_DEFAULT_STATUS_FILE   VARDIR "/lib/opkg/status"
  #define OPKG_CONF_DEFAULT_CACHE_DIR     VARDIR "/cache/opkg"
  #define OPKG_CONF_DEFAULT_CONF_FILE_DIR SYSCONFDIR "/opkg"
@@ -29,6 +29,3 @@ index 7bca948..5a1bc44 100644
  
  /* In case the config file defines no dest */
  #define OPKG_CONF_DEFAULT_DEST_NAME "root"
--- 
-2.5.0
-
diff --git a/meta/recipes-devtools/opkg/opkg_0.6.3.bb b/meta/recipes-devtools/opkg/opkg_0.7.0.bb
similarity index 95%
rename from meta/recipes-devtools/opkg/opkg_0.6.3.bb
rename to meta/recipes-devtools/opkg/opkg_0.7.0.bb
index ef7c4f3a72..6b2b13024d 100644
--- a/meta/recipes-devtools/opkg/opkg_0.6.3.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.7.0.bb
@@ -15,11 +15,10 @@ PE = "1"
 SRC_URI = "http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz \
            file://opkg.conf \
            file://0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch \
-           file://0001-libopkg-Use-libgen.h-to-provide-basename-API.patch \
            file://run-ptest \
            "
 
-SRC_URI[sha256sum] = "f3938e359646b406c40d5d442a1467c7e72357f91ab822e442697529641e06de"
+SRC_URI[sha256sum] = "d973fd0f1568f58f87d6aecd9aa95e3e1f60214a45cee26704bf8fe757c54567"
 
 # This needs to be before ptest inherit, otherwise all ptest files end packaged
 # in libopkg package if OPKGLIBDIR == libdir, because default
-- 
2.34.1


