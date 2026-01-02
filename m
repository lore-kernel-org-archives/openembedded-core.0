Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0613CFA3748
	for <webhook@archiver.kernel.org>; Fri,  2 Jan 2026 13:32:59 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5026.1767360767920129325
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jan 2026 05:32:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=ShOT97Lc;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-20260102133250afa50dc1830002078b-w0qaqz@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20260102133250afa50dc1830002078b
        for <openembedded-core@lists.openembedded.org>;
        Fri, 02 Jan 2026 14:32:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=nSI6+DkH/7tnBOyWDUQHSKFByMZckfUuMSICEw2Q7vk=;
 b=ShOT97Lc4k+yGHSRQsQhkL0nEGKFEJNaOvIPhLO0Ep6GuzHew2JiVn54iCpmOneUUXPP4X
 gGEMqdD0SFapKOzjK3mzneo5XVuoOfyq2/W4o+NymsqCub8lqSj2hDBE5eD6PWjZ5ZgPfKkM
 FeOA/MThhgqBqHoZ6bhJOOZTd+J/8BRltJgcVDi2IUhVNtOQu1ANnsZ5bfOT09XFJQqE/pBN
 HDAb0NcdanyFlCt+DM3RafKwruROpUaR8EY/cyvrvAbZSbH5lxjbsq6SneAC/xUEI1blJgEG
 06LNBvtvFh0hgyx5YTCITnaXGn8StOo8hK4c+90srdiMMb0srs4mmAHg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH 2/2] libpcap: patch CVE-2025-11964
Date: Fri,  2 Jan 2026 14:32:34 +0100
Message-Id: <20260102133234.2651606-2-peter.marko@siemens.com>
In-Reply-To: <20260102133234.2651606-1-peter.marko@siemens.com>
References: <20260102133234.2651606-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jan 2026 13:32:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228845

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1].

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-11964

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../libpcap/libpcap/CVE-2025-11964.patch      | 33 +++++++++++++++++++
 .../libpcap/libpcap_1.10.4.bb                 |  1 +
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
diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.10.4.bb b/meta/recipes-connectivity/libpcap/libpcap_1.10.4.bb
index df091e5ca2c..ee7d7540f67 100644
--- a/meta/recipes-connectivity/libpcap/libpcap_1.10.4.bb
+++ b/meta/recipes-connectivity/libpcap/libpcap_1.10.4.bb
@@ -16,6 +16,7 @@ SRC_URI = "https://www.tcpdump.org/release/${BP}.tar.gz \
            file://CVE-2024-8006.patch \
            file://CVE-2025-11961-01.patch \
            file://CVE-2025-11961-02.patch \
+           file://CVE-2025-11964.patch \
           "
 
 SRC_URI[sha256sum] = "ed19a0383fad72e3ad435fd239d7cd80d64916b87269550159d20e47160ebe5f"

