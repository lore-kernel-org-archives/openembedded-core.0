Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 905A7F47CBA
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 19:20:07 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.52436.1772738401625472288
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Mar 2026 11:20:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=Q37mMGNQ;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-2026030519195946b940cfd5000207f9-5n1r9e@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 2026030519195946b940cfd5000207f9
        for <openembedded-core@lists.openembedded.org>;
        Thu, 05 Mar 2026 20:19:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=9rVrY7F0Tms5+GXaseEsP7FmdaEKz49eNnQayzVmJEc=;
 b=Q37mMGNQeENrmAyZM6LEm4r+G1zE7bAdDJB2lf/JfMSqRFtc2zTd5iKHtYzJTGM+baB2FT
 H52vjUW6tpRh2knwNiWW5WF8GGh4NlE8bpe02xJn0b9UtygRLocz7vL+F/zFMwPiPRnKRgnS
 SZd/EeFhlaz06/kNWaeJ40xW4zQvoNj8+wZFiNc0yMZvjSm7AsKb195PJCcGF2HcNMSmkGCo
 qVBV+1W6bdOAXc0tW3DFVeM+eHTugiePjI2ITZJmtVOANIwiwzSDNCORoGFgfj2SPD3wEsEp
 uDZmroIQZ7neTEOv/eUyhkdvaPGpT90g6WNgE/VWPfgrrC5wZmfpzObA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: peter.marko@siemens.com,
	Livin Sunny <livinsunny519@gmail.com>
Subject: [OE-core][whinlatter][PATCH] busybox: Fixes CVE-2025-60876
Date: Thu,  5 Mar 2026 20:19:58 +0100
Message-Id: <20260305191958.1565299-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 19:20:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232514

From: Livin Sunny <livinsunny519@gmail.com>

This addresses CVE-2025-60876[1], which allows malicious URLs to inject
HTTP headers. It has been accepted by Debian[2] and is tracked here [4].
The upstream fix has been submitted [3] and is pending merge.

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-60876
[2] https://bugs.debian.org/1120795
[3] https://lists.busybox.net/pipermail/busybox/2025-November/091840.html
[4] https://security-tracker.debian.org/tracker/CVE-2025-60876

Upstream-Status: Submitted [https://lists.busybox.net/pipermail/busybox/2025-November/0918
40.html]

Signed-off-by: Livin Sunny <livinsunny519@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>a

(cherry-picked from f12af98df8f627c6d1836d27be48bac542a4f00e)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../busybox/busybox/CVE-2025-60876.patch      | 42 +++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.37.0.bb   |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2025-60876.patch

diff --git a/meta/recipes-core/busybox/busybox/CVE-2025-60876.patch b/meta/recipes-core/busybox/busybox/CVE-2025-60876.patch
new file mode 100644
index 0000000000..1cf29680e0
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/CVE-2025-60876.patch
@@ -0,0 +1,42 @@
+From: Radoslav Kolev <radoslav.kolev@suse.com>
+Date: Fri, 21 Nov 2025 11:21:18 +0200
+Subject: wget: don't allow control characters or spaces in the URL
+Bug-Debian: https://bugs.debian.org/1120795
+
+Fixes CVE-2025-60876 malicious URL can be used to inject
+HTTP headers in the request.
+
+Signed-off-by: Radoslav Kolev <radoslav.kolev@suse.com>
+Reviewed-by: Emmanuel Deloget <logout@free.fr>
+
+Upstream-Status: Submitted [https://lists.busybox.net/pipermail/busybox/2025-November/091840.html]
+
+CVE: CVE-2025-60876
+
+Signed-off-by: Livin Sunny <livinsunny519@gmail.com>
+---
+ networking/wget.c | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/networking/wget.c b/networking/wget.c
+index ec3767793..fa555427b 100644
+--- a/networking/wget.c
++++ b/networking/wget.c
+@@ -536,6 +536,15 @@ static void parse_url(const char *src_url, struct host_info *h)
+ {
+	char *url, *p, *sp;
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
+	free(h->allocated);
+	h->allocated = url = xstrdup(src_url);
+
+--
+2.47.3
diff --git a/meta/recipes-core/busybox/busybox_1.37.0.bb b/meta/recipes-core/busybox/busybox_1.37.0.bb
index 9e6a7b7b4c..d3851a27b9 100644
--- a/meta/recipes-core/busybox/busybox_1.37.0.bb
+++ b/meta/recipes-core/busybox/busybox_1.37.0.bb
@@ -58,6 +58,7 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://0001-busybox-Add-awk-gsub-erroneous-word-start-match-test.patch \
            file://CVE-2025-46394-01.patch \
            file://CVE-2025-46394-02.patch \
+           file://CVE-2025-60876.patch \
            "
 SRC_URI:append:libc-musl = " file://musl.cfg"
 SRC_URI:append:x86-64 = " file://sha_accel.cfg"

