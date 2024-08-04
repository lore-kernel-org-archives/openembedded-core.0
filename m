Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3B2FC3DA7F
	for <webhook@archiver.kernel.org>; Sun,  4 Aug 2024 17:47:52 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web11.30779.1722793665479154366
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Aug 2024 10:47:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=TEMdMmpp;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-202408041747422475ae70fb234b7ae0-ylddsw@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 202408041747422475ae70fb234b7ae0
        for <openembedded-core@lists.openembedded.org>;
        Sun, 04 Aug 2024 19:47:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=MQPbcwWNMmEMgPnVdZRfxWPs//JwLhxRgCIuwuQ//cU=;
 b=TEMdMmppxFhVANDAD8vpImvk0/n1ug30XxbcxiTCgjpij6ecKvYXM1Aostk1zxDK7yc0Cz
 oJSL7SD3X/IWKLpAIPnSjAcRZRY9bbeO80+fUgWxv2mutE7wX3ehHHEy2VeTMh8vDsnl+NRq
 d6rSKj9c+G+c/bS4mxTjSg12Nu6rPq8m+qBM0uewHQZnKqEzKY+yOu3gu1D0aiy2B5fp4GGr
 ERFDlkej6jQM9ZIYURk156uyqIuqwbG5kAZNMGdRYBCa08Q6R0GUkO+U0zd77Abue/krNZsQ
 y/UEzbhE/AtwiLyIyykD+ibIBVyP1eWOiGN4dZFJfaJfV3yTqEb12D0g==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH] curl: Patch CVE-2024-6197
Date: Sun,  4 Aug 2024 19:46:54 +0200
Message-Id: <20240804174654.2101764-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Aug 2024 17:47:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202978

From: Peter Marko <peter.marko@siemens.com>

Picked commit per https://curl.se/docs/CVE-2024-6197.html

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../curl/curl/CVE-2024-6197.patch             | 24 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.7.1.bb       |  1 +
 2 files changed, 25 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2024-6197.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2024-6197.patch b/meta/recipes-support/curl/curl/CVE-2024-6197.patch
new file mode 100644
index 0000000000..0622e70dc8
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2024-6197.patch
@@ -0,0 +1,24 @@
+From 3a537a4db9e65e545ec45b1b5d5575ee09a2569d Mon Sep 17 00:00:00 2001
+From: z2_ <88509734+z2-2z@users.noreply.github.com>
+Date: Fri, 28 Jun 2024 14:45:47 +0200
+Subject: [PATCH] x509asn1: remove superfluous free()
+
+CVE: CVE-2024-6197
+Upstream-Status: Backport [https://github.com/curl/curl/commit/3a537a4db9e65e545ec45b1b5d5575ee09a2569d.patch]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ lib/vtls/x509asn1.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/lib/vtls/x509asn1.c b/lib/vtls/x509asn1.c
+index f71ab0b90a5931..1bc4243ddae343 100644
+--- a/lib/vtls/x509asn1.c
++++ b/lib/vtls/x509asn1.c
+@@ -393,7 +393,6 @@ utf8asn1str(struct dynbuf *to, int type, const char *from, const char *end)
+         if(wc >= 0x00000800) {
+           if(wc >= 0x00010000) {
+             if(wc >= 0x00200000) {
+-              free(buf);
+               /* Invalid char. size for target encoding. */
+               return CURLE_WEIRD_SERVER_REPLY;
+             }
diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index 3fdad6a4cf..136782ffec 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -15,6 +15,7 @@ SRC_URI = " \
     file://run-ptest \
     file://disable-tests \
     file://no-test-timeout.patch \
+    file://CVE-2024-6197.patch \
 "
 SRC_URI[sha256sum] = "6fea2aac6a4610fbd0400afb0bcddbe7258a64c63f1f68e5855ebc0c659710cd"
 
-- 
2.30.2


