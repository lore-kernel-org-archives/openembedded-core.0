Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39AC4C5DF97
	for <webhook@archiver.kernel.org>; Sun, 23 Aug 2026 12:42:29 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13442.1787488944153863520
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Aug 2026 05:42:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=l1aazdV5;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-2026082312422291b901f6bb00020753-rwf9nk@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 2026082312422291b901f6bb00020753
        for <openembedded-core@lists.openembedded.org>;
        Sun, 23 Aug 2026 14:42:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=V6k1a2t/dc222jO4aNPdkWE523zuGnmLYdrJOY2qbIA=;
 b=l1aazdV587KSUM4xx7Ii6fUipU22EY442GwEF4cKaKnyt2H8/GydSOVjW6vy4g5djef/y7
 UEvYmDl+fvvvtFP/IwAvyH/Bx1fPsOBX1K7WeclQzC2DOQ7IhRcRCIb6mir2jdxDoOE43M9t
 VqdDiqfYgWaikegv01lwqQWpyC6JxBnntYem3TkQeHsZ1EfZ3JFehN6+XJjE30fyJwYKRthN
 zHaiLrV5y9ZChVWKRR7d1leMMVY7vo5iaSHG6MUJrz2ryMJyXeoM2rPwEdQHfXde5mzzxKCg
 oMFjXyHNa4B0jP8KbV/ysVw66fNRfnctMuOFCX30OWgSKngQBJYMbN4w==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [scarthgap][PATCH 2/2] libarchive: patch CVE-2026-5745
Date: Sun, 23 Aug 2026 14:42:13 +0200
Message-ID: <20260823124213.1198947-2-peter.marko@siemens.com>
In-Reply-To: <20260823124213.1198947-1-peter.marko@siemens.com>
References: <20260823124213.1198947-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 23 Aug 2026 12:42:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244028

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1].

[1] https://security-tracker.debian.org/tracker/CVE-2026-5745

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../libarchive/libarchive/CVE-2026-5745.patch | 39 +++++++++++++++++++
 .../libarchive/libarchive_3.7.9.bb            |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2026-5745.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2026-5745.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2026-5745.patch
new file mode 100644
index 00000000000..a060b081ad8
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/CVE-2026-5745.patch
@@ -0,0 +1,39 @@
+From 5f7025543205106d64081cbafd8c345bf859b86f Mon Sep 17 00:00:00 2001
+From: Tim Kientzle <kientzle@acm.org>
+Date: Sat, 18 Apr 2026 21:04:59 -0700
+Subject: [PATCH] Merge pull request #2905 from Patsakas/Patsakas-fix-acl-bug
+
+Fix NULL pointer increment in archive_acl_from_text_nl
+
+(Not a security issue, and arguably not really even a bug, but easy to fix regardless.)
+
+(cherry picked from commit 0b0b888f86b46e3b279f5f7c6eef0479f35978ee)
+
+CVE: CVE-2026-5745
+Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit/5f7025543205106d64081cbafd8c345bf859b86f]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ libarchive/archive_acl.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/libarchive/archive_acl.c b/libarchive/archive_acl.c
+index ab601833..14a107a4 100644
+--- a/libarchive/archive_acl.c
++++ b/libarchive/archive_acl.c
+@@ -1718,7 +1718,6 @@ archive_acl_from_text_nl(struct archive_acl *acl, const char *text,
+ 
+ 			tag = 0;
+ 			s = field[n].start;
+-			st = field[n].start + 1;
+ 			len = field[n].end - field[n].start;
+ 
+ 			if (len == 0) {
+@@ -1726,6 +1725,8 @@ archive_acl_from_text_nl(struct archive_acl *acl, const char *text,
+ 				continue;
+ 			}
+ 
++			st = s + 1; 
++
+ 			switch (*s) {
+ 			case 'u':
+ 				if (len == 1 || (len == 4
diff --git a/meta/recipes-extended/libarchive/libarchive_3.7.9.bb b/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
index fb6ed5686df..b36632cc1fe 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
@@ -50,6 +50,7 @@ SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            file://CVE-2026-4424-1.patch \
            file://CVE-2026-4424-2.patch \
            file://CVE-2026-5121-02.patch \
+           file://CVE-2026-5745.patch \
            "
 UPSTREAM_CHECK_URI = "http://libarchive.org/"
 

