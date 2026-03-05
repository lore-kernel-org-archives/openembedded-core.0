Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6505EF513E1
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 21:47:00 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.55902.1772747213557078655
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Mar 2026 13:46:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=UtzTt/m3;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20260305214650bd9cccc1820002070b-hdmcpo@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20260305214650bd9cccc1820002070b
        for <openembedded-core@lists.openembedded.org>;
        Thu, 05 Mar 2026 22:46:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=Xp0gGrZYQSB+mRrvWN5qHoVwp3pyJDVNkSQ1C33+Aa4=;
 b=UtzTt/m33RcIanXMnRinhqNUZC067J9P47go7oPfdvk3g7Z68LuGvkPvmtB2Sv0YoQgfs2
 QMmwyNKf9QwA7/wkiZvLPvlLhKiS9XcJDIY0VN8zfxHAH7OPwJCYI9rStGX6Y5/eENU7pSDp
 8ZFet/tl/PcRXGxbYx95f6F0McXIcyIUkvhU61J0Ia2881woszw8VB8I8zVWYzgyth+USEsl
 CfJNj8AJftE6fi6f2lyOYGuME/+9RRGKcV1P6Q3ahVw1LjyVe+X7RVB6kl8pTWmwhybqN8wJ
 KYuPO2oIhblQz43P0IvVr0QU1eUGFKD4gW4iUhKfZ51xIkLupXovRJ1Q==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] busybox: patch 2025-60876
Date: Thu,  5 Mar 2026 22:46:48 +0100
Message-Id: <20260305214648.3205354-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 21:47:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232522

From: Peter Marko <peter.marko@siemens.com>

Although the patch was not merged yet, Debian already took it ([1]).
Since busybox CVE handling is slow, follow Debian decision.

[1] https://sources.debian.org/src/busybox/1%3A1.37.0-10/debian/patches/wget-disallow-control-chars-in-URLs-CVE-2025-60876.patch

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../busybox/busybox/CVE-2025-60876.patch      | 38 +++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.35.0.bb   |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2025-60876.patch

diff --git a/meta/recipes-core/busybox/busybox/CVE-2025-60876.patch b/meta/recipes-core/busybox/busybox/CVE-2025-60876.patch
new file mode 100644
index 00000000000..72d7020f625
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/CVE-2025-60876.patch
@@ -0,0 +1,38 @@
+From 32c0f6f240fcb041ae7df44a9bbf958d627a8212 Mon Sep 17 00:00:00 2001
+From: Radoslav Kolev <radoslav.kolev@suse.com>
+Date: Fri, 21 Nov 2025 11:21:18 +0200
+Subject: [PATCH] wget: don't allow control characters or spaces in the URL
+
+Fixes CVE-2025-60876 malicious URL can be used to inject
+HTTP headers in the request.
+
+Signed-off-by: Radoslav Kolev <radoslav.kolev@suse.com>
+Reviewed-by: Emmanuel Deloget <logout@free.fr>
+
+CVE: CVE-2025-60876
+Upstream-Status: Submitted [https://lists.busybox.net/pipermail/busybox/2025-November/091840.html]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ networking/wget.c | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/networking/wget.c b/networking/wget.c
+index 9ec0e67..7602563 100644
+--- a/networking/wget.c
++++ b/networking/wget.c
+@@ -536,6 +536,15 @@ static void parse_url(const char *src_url, struct host_info *h)
+ {
+ 	char *url, *p, *sp;
+ 
++	/* Fix for CVE-2025-60876 - don't allow control characters or spaces in the URL */
++	/* otherwise a malicious URL can be used to inject HTTP headers in the request */
++	const unsigned char *u = (void *) src_url;
++	while (*u) {
++		if (*u <= ' ')
++			bb_simple_error_msg_and_die("Unencoded control character found in the URL!");
++		u++;
++	}
++
+ 	free(h->allocated);
+ 	h->allocated = url = xstrdup(src_url);
+ 
diff --git a/meta/recipes-core/busybox/busybox_1.35.0.bb b/meta/recipes-core/busybox/busybox_1.35.0.bb
index 57a5747a489..0b5ac220f5f 100644
--- a/meta/recipes-core/busybox/busybox_1.35.0.bb
+++ b/meta/recipes-core/busybox/busybox_1.35.0.bb
@@ -61,6 +61,7 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://CVE-2023-39810.patch \
            file://CVE-2025-46394-01.patch \
            file://CVE-2025-46394-02.patch \
+           file://CVE-2025-60876.patch \
            "
 SRC_URI:append:libc-musl = " file://musl.cfg "
 

