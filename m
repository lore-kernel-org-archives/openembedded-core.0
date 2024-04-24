Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0900C41513
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 08:43:03 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.11780.1713948176774387245
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Apr 2024 01:43:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Og31/ERt;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713948180; x=1745484180;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=pdnNVsL6HItx0yXZfuDwrNRiESBq6IqQPTpfnt4kCps=;
  b=Og31/ERtXXApItil0hoPnEMLnLTPCixL7Adip/suap5+cDKSQx8vCGYC
   5222bZ5E48YwNKZkUXU3W75l/IQ3Z4XAb3jawcCAg19re73LRX6EmF+mU
   fGJS7jQO9ycAUWqZRpgc2ukh6TyVnR0BpidrUqTs2Hn06B+o0Vv8pU6pb
   89HJ7juYretxA24eWgispc97LQpXY53prwPoyL9K3kVtz8RwnRY3zWF5E
   izUP7h3JhU5XK/MDQ7OIV07livdVVC6CHASMDN3ocmzg32MXWpuQjV28x
   1PW/RVbL8jw+wmEasaMNJczmcWts5AK7UrooPu1KKiuX33VzW517Wvy/j
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="144151921"
X-IronPort-AV: E=Sophos;i="6.07,225,1708354800"; 
   d="scan'208";a="144151921"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 17:42:59 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 594EDE8FC3
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:42:57 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 920B99E181
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:42:56 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 29CCB202CE131
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:42:56 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C9D441A000A;
	Wed, 24 Apr 2024 16:42:55 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 09/38] libpam: upgrade 1.6.0 -> 1.6.1
Date: Wed, 24 Apr 2024 16:42:03 +0800
Message-Id: <1713948152-13501-9-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713948152-13501-1-git-send-email-wangmy@fujitsu.com>
References: <1713948152-13501-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28340.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28340.006
X-TMASE-Result: 10--8.857800-10.000000
X-TMASE-MatchedRID: FBE0XpCroJijz0nOeth/yT5CC20xzaebkdS3kPlaZyXkABvhO7aBvq4r
	mQIDoB6S4P+DDgXrqGyEdmxsBLOwc8wS8zoD/8vbjoyKzEmtrEdpkBMYDn8FeNY4gGu+zbN7HGp
	23bat06CV2Grux8WHh0qEFQnLGOEGiCsqewnUZGC/mux8PsfamT/FEHo4advasrDwfHQQaK2CDx
	bm2wVcgKE7LBRkh+1t5p98cjyQCaKN6MoIzHiu3krOO5m0+0gEGbJMFqqIm9xHpEd1UrzmFVkIT
	z82Kc4AUoDKDRI6O5ma6MzgKDIWJnh1rPkUeh+7boT9s9dVCZpnXBVFJwvSMBHfiujuTbedR0np
	HzTJIVStqhvfTy0XN9leeD2UjFuVCm0rE5/j6WQDfgpjSDkFN7SgyqRj33XJAhn751acftuem2v
	w+cenKeLzNWBegCW2wgn7iDBesS0gBwKKRHe+rx6igcdt/SaYQt2Ewd0JWPL6F7VYilZ/xn8ieH
	TWku1XLk1smOybwWA=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 08:43:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198654

From: Wang Mingyu <wangmy@fujitsu.com>

0001-pam_namespace-include-stdint-h.patch
removed since it's included in 1.6.1

Changelog:
===========
* build: fail if specified configure options cannot be satisfied.
* pam_env: fixed --disable-econf --enable-vendordir support.
* pam_unix: do not warn if password aging is disabled.
* pam_unix: try to set uid to 0 before unix_chkpwd invocation.
* pam_unix: allow empty passwords with non-empty hashes.
* Multiple minor bug fixes, build fixes, portability fixes,
  documentation improvements, and translation updates.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../0001-pam_namespace-include-stdint-h.patch | 42 -------------------
 .../pam/{libpam_1.6.0.bb => libpam_1.6.1.bb}  |  3 +-
 2 files changed, 1 insertion(+), 44 deletions(-)
 delete mode 100644 meta/recipes-extended/pam/libpam/0001-pam_namespace-include-stdint-h.patch
 rename meta/recipes-extended/pam/{libpam_1.6.0.bb => libpam_1.6.1.bb} (97%)

diff --git a/meta/recipes-extended/pam/libpam/0001-pam_namespace-include-stdint-h.patch b/meta/recipes-extended/pam/libpam/0001-pam_namespace-include-stdint-h.patch
deleted file mode 100644
index 124e5f1c3c..0000000000
--- a/meta/recipes-extended/pam/libpam/0001-pam_namespace-include-stdint-h.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From cc9d40b7cdbd3e15ccaa324a0dda1680ef9dea13 Mon Sep 17 00:00:00 2001
-From: Jacob Heider <jacob@pkgx.dev>
-Date: Wed, 17 Jan 2024 11:49:26 -0500
-Subject: [PATCH] pam_namespace: include stdint.h
-
-pam_namespace.c makes use of SIZE_MAX but doesn't include stdint.h,
-resulting in the following build failures on 1.6.0:
-
-  pam_namespace.c: In function 'process_line':
-  pam_namespace.c:649:41: error: 'SIZE_MAX' undeclared (first use in this function)
-    649 |         if (count > UINT_MAX || count > SIZE_MAX / sizeof(uid_t)) {
-        |                                         ^~~~~~~~
-  pam_namespace.c:41:1: note: 'SIZE_MAX' is defined in header '<stdint.h>'; did you forget to '#include <stdint.h>'?
-     40 | #include "argv_parse.h"
-    +++ |+#include <stdint.h>
-     41 |
-  pam_namespace.c:649:41: note: each undeclared identifier is reported only once for each function it appears in
-    649 |         if (count > UINT_MAX || count > SIZE_MAX / sizeof(uid_t)) {
-        |                                         ^~~~~~~~
-
-Fixes: v1.6.0~100 ("pam_namespace: validate amount of uids in config")
-Resolves: https://github.com/linux-pam/linux-pam/issues/733
-
-Upstream-Status: Backport [https://github.com/linux-pam/linux-pam/commit/cc9d40b7cdbd3e15ccaa324a0dda1680ef9dea13]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- modules/pam_namespace/pam_namespace.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/modules/pam_namespace/pam_namespace.c b/modules/pam_namespace/pam_namespace.c
-index f72d67189..b16731c22 100644
---- a/modules/pam_namespace/pam_namespace.c
-+++ b/modules/pam_namespace/pam_namespace.c
-@@ -34,6 +34,8 @@
- 
- #define _ATFILE_SOURCE
- 
-+#include "config.h"
-+#include <stdint.h>
- #include "pam_cc_compat.h"
- #include "pam_inline.h"
- #include "pam_namespace.h"
diff --git a/meta/recipes-extended/pam/libpam_1.6.0.bb b/meta/recipes-extended/pam/libpam_1.6.1.bb
similarity index 97%
rename from meta/recipes-extended/pam/libpam_1.6.0.bb
rename to meta/recipes-extended/pam/libpam_1.6.1.bb
index e1ed940d1e..849f485f75 100644
--- a/meta/recipes-extended/pam/libpam_1.6.0.bb
+++ b/meta/recipes-extended/pam/libpam_1.6.1.bb
@@ -23,10 +23,9 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/Linux-PAM-${PV}.tar.xz \
            file://libpam-xtests.patch \
            file://run-ptest \
            file://pam-volatiles.conf \
-           file://0001-pam_namespace-include-stdint-h.patch \
            "
 
-SRC_URI[sha256sum] = "fff4a34e5bbee77e2e8f1992f27631e2329bcbf8a0563ddeb5c3389b4e3169ad"
+SRC_URI[sha256sum] = "f8923c740159052d719dbfc2a2f81942d68dd34fcaf61c706a02c9b80feeef8e"
 
 DEPENDS = "bison-native flex-native cracklib libxml2-native virtual/crypt"
 
-- 
2.34.1


