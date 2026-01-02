Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D95A9FA3748
	for <webhook@archiver.kernel.org>; Fri,  2 Jan 2026 13:33:08 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4983.1767360785260924590
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jan 2026 05:33:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=AJoUiKeJ;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20260102133303f93bc6b123000207e2-vo1bag@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20260102133303f93bc6b123000207e2
        for <openembedded-core@lists.openembedded.org>;
        Fri, 02 Jan 2026 14:33:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=HBUVAmbfVB2yYmx6jtNlOD1wM+xs1kQRRGkrylWGUp4=;
 b=AJoUiKeJDwDUluS89OoJou+lUgltScrO3Q8bev7jTX/egB57vBobkG+MCj/ocGxvpLnFwN
 RmlNJGmT1wXM0osWfxgPfkXFN42Pecgq4+3i8lNirvfQi0wPyg+Hw8jkIrL30QkY095bqmsL
 OWi6/cC9tt8d7Aif2jSRADTc9xfXFVrXspUEVYPzTA/gD8f7Mu1e5ZVdXcDNqIZSTE9Ha930
 AikvTgGRZAQcDpTwHAS1BPBe+KEAS5FybshyVg1yYOcjQpU3yJQWC9fSQJz62UqTTq9qH5jC
 uCqWt15QPgcIAhyCw022rRhmDQy+ZxCF2+aHA14YvgCqOlEVL2k+33bg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH 2/2] libpcap: patch CVE-2025-11964
Date: Fri,  2 Jan 2026 14:32:53 +0100
Message-Id: <20260102133253.2651626-2-peter.marko@siemens.com>
In-Reply-To: <20260102133253.2651626-1-peter.marko@siemens.com>
References: <20260102133253.2651626-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jan 2026 13:33:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228847

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1].

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-11964

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../libpcap/libpcap/CVE-2025-11964.patch      | 33 +++++++++++++++++++
 .../libpcap/libpcap_1.10.1.bb                 |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/CVE-2025-11964.patch

diff --git a/meta/recipes-connectivity/libpcap/libpcap/CVE-2025-11964.patch b/meta/recipes-connectivity/libpcap/libpcap/CVE-2025-11964.patch
new file mode 100644
index 00000000000..003d21fb1f1
--- /dev/null
+++ b/meta/recipes-connectivity/libpcap/libpcap/CVE-2025-11964.patch
@@ -0,0 +1,33 @@
+From 7fabf607f2319a36a0bd78444247180acb838e69 Mon Sep 17 00:00:00 2001
+From: Guy Harris <gharris@sonic.net>
+Date: Sun, 7 Sep 2025 12:51:56 -0700
+Subject: [PATCH] Fix a copy-and-pasteo in utf_16le_to_utf_8_truncated().
+
+For the four octets of UTF-8 case, it was decrementing the remaining
+buffer length by 3, not 4.
+
+Thanks to a team of developers from the Univesity of Waterloo for
+reporting this.
+
+(cherry picked from commit aebfca1aea2fc8c177760a26e8f4de27b51d1b3b)
+
+CVE: CVE-2025-11964
+Upstream-Status: Backport [https://github.com/the-tcpdump-group/libpcap/commit/7fabf607f2319a36a0bd78444247180acb838e69]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ fmtutils.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/fmtutils.c b/fmtutils.c
+index a5a4fe62..78a0f8b7 100644
+--- a/fmtutils.c
++++ b/fmtutils.c
+@@ -235,7 +235,7 @@ utf_16le_to_utf_8_truncated(const wchar_t *utf_16, char *utf_8,
+ 			*utf_8++ = ((uc >> 12) & 0x3F) | 0x80;
+ 			*utf_8++ = ((uc >> 6) & 0x3F) | 0x80;
+ 			*utf_8++ = ((uc >> 0) & 0x3F) | 0x80;
+-			utf_8_len -= 3;
++			utf_8_len -= 4;
+ 		}
+ 	}
+ 
diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.10.1.bb b/meta/recipes-connectivity/libpcap/libpcap_1.10.1.bb
index b3bd4f669af..5e136e3b1a9 100644
--- a/meta/recipes-connectivity/libpcap/libpcap_1.10.1.bb
+++ b/meta/recipes-connectivity/libpcap/libpcap_1.10.1.bb
@@ -19,6 +19,7 @@ SRC_URI = "https://www.tcpdump.org/release/${BP}.tar.gz \
            file://CVE-2024-8006.patch \
            file://CVE-2025-11961-01.patch \
            file://CVE-2025-11961-02.patch \
+           file://CVE-2025-11964.patch \
           "
 
 SRC_URI[sha256sum] = "ed285f4accaf05344f90975757b3dbfe772ba41d1c401c2648b7fa45b711bdd4"

