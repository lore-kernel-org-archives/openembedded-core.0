Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8C39C369AB
	for <webhook@archiver.kernel.org>; Fri, 18 Apr 2025 18:36:02 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web10.2764.1745001352411607611
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Apr 2025 11:35:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=ackROnaI;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20250418183549e0df9107418ca8edff-vss7f0@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20250418183549e0df9107418ca8edff
        for <openembedded-core@lists.openembedded.org>;
        Fri, 18 Apr 2025 20:35:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=RLDEg1YWK/HBaWaI2qp1y2yafxZc+nvk5VCdg4fmCgA=;
 b=ackROnaIIW3TVshqk5DzP80ZkREf4rPU227JyXH4307RU6TqJHDDENewGtNxGEcWE7+Ank
 QiLIVGGoMvaBb8gNfhu122Gk9uQg5UJuRqbn3NqSWL4rsYKA5zadYvVccxy9oddILOR3XkYC
 Kz/9mvNYLMNUqmvU+u2uArjMXljLWeisCE7o5FluStV2jeyR00ZHdZ55MDVsvGLwmc4LXusl
 MIB4Pzyc51u9XVDQdEJzPjcj9rB0tByd8pIpvAZydFlcVeQAg3f3w9ACpxds32jvguscxf4C
 GaGdX0WfyCMzHOIgpJooaCbDWZEWGBcNuU8ES0xbgXXSYth2v7fy2xsg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH] sqlite3: patch CVE-2025-3277
Date: Fri, 18 Apr 2025 20:35:01 +0200
Message-Id: <20250418183501.2290568-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Apr 2025 18:36:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215138

From: Peter Marko <peter.marko@siemens.com>

Pick commit [1] mentioned in [2].

[1] https://sqlite.org/src/info/498e3f1cf57f164f
[2] https://nvd.nist.gov/vuln/detail/CVE-2025-3277

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../sqlite/sqlite3/CVE-2025-3277.patch        | 28 +++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.45.3.bb |  4 ++-
 2 files changed, 31 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2025-3277.patch

diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2025-3277.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2025-3277.patch
new file mode 100644
index 0000000000..4e2ed5f1e0
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3/CVE-2025-3277.patch
@@ -0,0 +1,28 @@
+From d7f45414935e4ef6e3361f02a22876f1ee7a04aa Mon Sep 17 00:00:00 2001
+From: drh <>
+Date: Sun, 16 Feb 2025 10:57:25 +0000
+Subject: [PATCH] Add a typecast to avoid 32-bit integer overflow in the
+ concat_ws() function with an enormous separator values and many arguments.
+
+FossilOrigin-Name: 498e3f1cf57f164fbd8380e92bf91b9f26d6aa05d092fcd135d754abf1e5b1b5
+
+CVE: CVE-2025-3277
+Upstream-Status: Backport [https://sqlite.org/src/info/498e3f1cf57f164f]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ sqlite3.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/sqlite3.c b/sqlite3.c
+index 08c593e55c..24d0d954d9 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -129594,7 +129594,7 @@ static void concatFuncCore(
+   for(i=0; i<argc; i++){
+     n += sqlite3_value_bytes(argv[i]);
+   }
+-  n += (argc-1)*nSep;
++  n += (argc-1)*(i64)nSep;
+   z = sqlite3_malloc64(n+1);
+   if( z==0 ){
+     sqlite3_result_error_nomem(context);
diff --git a/meta/recipes-support/sqlite/sqlite3_3.45.3.bb b/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
index 03d70bbd38..0e91167eef 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
@@ -3,6 +3,8 @@ require sqlite3.inc
 LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
 
-SRC_URI = "http://www.sqlite.org/2024/sqlite-autoconf-${SQLITE_PV}.tar.gz"
+SRC_URI = "http://www.sqlite.org/2024/sqlite-autoconf-${SQLITE_PV}.tar.gz \
+           file://CVE-2025-3277.patch \
+          "
 SRC_URI[sha256sum] = "b2809ca53124c19c60f42bf627736eae011afdcc205bb48270a5ee9a38191531"
 

