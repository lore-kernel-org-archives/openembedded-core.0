Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8E9CC28B28
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 19:29:26 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web11.4084.1741807764066060702
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Mar 2025 12:29:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=cv40Jia4;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-202503121929217697caa1f0c5ad3625-vfs3kq@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202503121929217697caa1f0c5ad3625
        for <openembedded-core@lists.openembedded.org>;
        Wed, 12 Mar 2025 20:29:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=arbZvlLkIrrPAWHsercrCut7YQAegRHJXiV/jd9suhE=;
 b=cv40Jia4Xcpzx8okYYDeLIJO3AnUAvwwYma1a7eMGDUPIm4JXtjCaAz5WeDaOjLM8gVbwB
 3bWWqn4QRL3JZz4Cf+BkvE8ti2hxzh9Z8xLHkbgfX0OU1eCPclJcX1aXG5lBV1Tgr3ZvfoSy
 T9Mrt8ipj4h/QPgfWUf/CymtV8L/V21rji5w2GQJT5m/XnrcVBjVxcId7K5kW39WSGuZnRWl
 GQJes5b6gKGBHLu3vIRoLNnzRymsXFPAHgZbzgP87zfRQJ6fxjsuSFQJLpGpGKKUvw8Vx59F
 cLJ0DdJW/Tj3RBHNtT3eNssBMPK1fa0gkQ4A9hdSxycMVpg5QoUnzzrg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] libarchive: patch CVE-2025-25724
Date: Wed, 12 Mar 2025 20:28:28 +0100
Message-Id: <20250312192828.1845318-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 19:29:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212666

From: Peter Marko <peter.marko@siemens.com>

Pick commit referencing this MR which was merged to master.
Note that this commit also patched CVE-2025-1632 in bsdunzip, however
that utility was introduced only in 3.7.0, so that part is not
applicable in kirkstone.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../libarchive/CVE-2025-25724.patch           | 40 +++++++++++++++++++
 .../libarchive/libarchive_3.6.2.bb            |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2025-25724.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2025-25724.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2025-25724.patch
new file mode 100644
index 0000000000..fe489e852f
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/CVE-2025-25724.patch
@@ -0,0 +1,40 @@
+From c9bc934e7e91d302e0feca6e713ccc38d6d01532 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Peter=20K=C3=A4stle?= <peter@piie.net>
+Date: Mon, 10 Mar 2025 16:43:04 +0100
+Subject: [PATCH] fix CVE-2025-1632 and CVE-2025-25724 (#2532)
+
+Hi,
+
+please find my approach to fix the CVE-2025-1632 and CVE-2025-25724
+vulnerabilities in this pr.
+As both error cases did trigger a NULL pointer deref (and triggered
+hopefully everywhere a coredump), we can safely replace the actual
+information by a predefined invalid string without breaking any
+functionality.
+
+CVE: CVE-2025-25724
+Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit/c9bc934e7e91d302e0feca6e713ccc38d6d01532]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---------
+
+Signed-off-by: Peter Kaestle <peter@piie.net>
+---
+ tar/util.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/tar/util.c b/tar/util.c
+index 3b099cb5..f3cbdf0b 100644
+--- a/tar/util.c
++++ b/tar/util.c
+@@ -758,7 +758,10 @@ list_item_verbose(struct bsdtar *bsdtar, FILE *out, struct archive_entry *entry)
+ #else
+ 	ltime = localtime(&tim);
+ #endif
+-	strftime(tmp, sizeof(tmp), fmt, ltime);
++	if (ltime)
++		strftime(tmp, sizeof(tmp), fmt, ltime);
++	else
++		sprintf(tmp, "-- -- ----");
+ 	fprintf(out, " %s ", tmp);
+ 	safe_fprintf(out, "%s", archive_entry_pathname(entry));
+ 
diff --git a/meta/recipes-extended/libarchive/libarchive_3.6.2.bb b/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
index 6af01cf408..4ceb0df2c0 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
@@ -34,6 +34,7 @@ SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            file://CVE-2024-48957.patch \
            file://CVE-2024-48958.patch \
            file://CVE-2024-20696.patch \
+           file://CVE-2025-25724.patch \
            "
 UPSTREAM_CHECK_URI = "http://libarchive.org/"
 

