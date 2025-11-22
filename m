Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CAC9CFD313
	for <webhook@archiver.kernel.org>; Sat, 22 Nov 2025 22:17:44 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3808.1763849853875325492
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Nov 2025 14:17:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=CtA9DQQZ;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-202511222217319d85adee08000207c7-b3e_7d@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 202511222217319d85adee08000207c7
        for <openembedded-core@lists.openembedded.org>;
        Sat, 22 Nov 2025 23:17:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=kRZjDCig4K7k9hlVHT2la4fjFfl36uqkIwsa+7XdJD0=;
 b=CtA9DQQZEOKeU4C6CGaO1g5Ur251UNZd3Wa+qEDL0zirGws6OwdSRyLPlzCqOhr7PxZl3P
 LtJkS8R+q3CjxEVOMmWKUv9XQKlYgzCXw8cYqN3FMgQZrdgqOPPpiRRou1Bxn571r4EzQZ2d
 +ORytYdemnvKQlhY5HpIdkCK12qXMVKwaHgUf5thXEgFWgGHlBdN/fFDSQ+h481ouMmzBp4u
 vpkRxt1dFgdp/iLkQjz2pTjX2hSRZxe/fG7ROdDmqmLbD7x/Jp3YLeAkBC40SYBkG3MrKec1
 +7DSl0YIErlV8gGLs82IpSUj8cEcHsU5KhYz7hgEQF4JcrhDpKkcMgcQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH 2/3] libarchive: patch 3.8.3 security issue 2
Date: Sat, 22 Nov 2025 23:16:53 +0100
Message-Id: <20251122221654.3047008-2-peter.marko@siemens.com>
In-Reply-To: <20251122221654.3047008-1-peter.marko@siemens.com>
References: <20251122221654.3047008-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Nov 2025 22:17:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226721

From: Peter Marko <peter.marko@siemens.com>

Pick patch [2] as listed in [1].

[1] https://github.com/libarchive/libarchive/releases/tag/v3.8.3
[2] https://github.com/libarchive/libarchive/pull/2768

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...-request-2768-from-Commandoss-master.patch | 28 +++++++++++++++++++
 .../libarchive/libarchive_3.7.9.bb            |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0001-Merge-pull-request-2768-from-Commandoss-master.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/0001-Merge-pull-request-2768-from-Commandoss-master.patch b/meta/recipes-extended/libarchive/libarchive/0001-Merge-pull-request-2768-from-Commandoss-master.patch
new file mode 100644
index 00000000000..66e88c91b4f
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/0001-Merge-pull-request-2768-from-Commandoss-master.patch
@@ -0,0 +1,28 @@
+From 82b57a9740aa6d084edcf4592a3b8e49f63dec98 Mon Sep 17 00:00:00 2001
+From: Tim Kientzle <kientzle@acm.org>
+Date: Fri, 31 Oct 2025 22:07:19 -0700
+Subject: [PATCH] Merge pull request #2768 from Commandoss/master
+
+Fix for an out-of-bounds buffer overrun when using p[H_LEVEL_OFFSET]
+
+(cherry picked from commit ce614c65246158bcb0dc1f9c1dce5a5af65f9827)
+
+Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit/82b57a9740aa6d084edcf4592a3b8e49f63dec98]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ libarchive/archive_read_support_format_lha.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libarchive/archive_read_support_format_lha.c b/libarchive/archive_read_support_format_lha.c
+index 2a84ad9d..abf8b879 100644
+--- a/libarchive/archive_read_support_format_lha.c
++++ b/libarchive/archive_read_support_format_lha.c
+@@ -690,7 +690,7 @@ archive_read_format_lha_read_header(struct archive_read *a,
+ 	 * a pathname and a symlink has '\' character, a directory
+ 	 * separator in DOS/Windows. So we should convert it to '/'.
+ 	 */
+-	if (p[H_LEVEL_OFFSET] == 0)
++	if (lha->level == 0)
+ 		lha_replace_path_separator(lha, entry);
+ 
+ 	archive_entry_set_mode(entry, lha->mode);
diff --git a/meta/recipes-extended/libarchive/libarchive_3.7.9.bb b/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
index 88e9fbf8e99..da11e052a71 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
@@ -41,6 +41,7 @@ SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            file://0001-Merge-pull-request-2696-from-al3xtjames-mkstemp.patch \
            file://0001-Merge-pull-request-2749-from-KlaraSystems-des-tempdi.patch \
            file://0001-Merge-pull-request-2753-from-KlaraSystems-des-temp-f.patch \
+           file://0001-Merge-pull-request-2768-from-Commandoss-master.patch \
            "
 UPSTREAM_CHECK_URI = "http://libarchive.org/"
 

