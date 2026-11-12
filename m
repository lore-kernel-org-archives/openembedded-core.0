Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2267.1794505382240375343
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Nov 2026 09:43:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=eFozZmi6;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20261112174258aef9611f11000207e7-54kmwp@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20261112174258aef9611f11000207e7
        for <openembedded-core@lists.openembedded.org>;
        Thu, 12 Nov 2026 18:42:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=VL/LpsVmbzIPGfPyO67tq9fIPWuq76uEk/NXhLPpR3o=;
 b=eFozZmi6BNw/jp8WegRuRm2Z3zOAbQahpXxb2B/WZ2DPx1zo8Jn90NnnOkjK1l5hL69dqm
 qj+HU8p4R0O/vz5tWHMu9XTtJVVHmSxvsz5rYqNUHRSEc9VjgOTbXWE/ja4WqS5b+NMI3kqm
 AuCbszJ44ST2OFe+zV3VA0z1Jj9ysxNFttAnHNnXcKeItqapQGpHR7g/qzxHJ9ojswu10e/U
 0ILmCcGEV0x1ZTX0+jHiy3xMLeslsueLoq92H3gBf3EvfUEiwaalw0LWAHYkhXlE6VjdSwBy
 +qDEsARPY9jTor9fZkvTU9L4CCDRmXYvfBS2A28NpSsg6KAqNvFpiVrA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH] avahi: set status of 10 pre-rc5 CVEs
Date: Thu, 12 Nov 2026 18:42:44 +0100
Message-ID: <20261112174244.332987-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2026 17:43:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250109
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

New verstion of python3-sbom-cve-check (1.4.0) now correctly interprets
"0.9~rcX" as "<0.9", while previous version just dropped the suffix and
incorrectly treated it as "=0.9".
Unfortunately there is no prerelase (or other suffix) comparison
available, so all CVEs fixed e.g in 0.9~rc1 are evaluated as fixed in
0.9, which does not match version <0.9.

All these CVEs are fixed in RC1..4, while this commit leaves one CVE
which does not have a fix yet still as open in the report.
* rc1: CVE-2023-38469, CVE-2023-38470, CVE-2023-38471, CVE-2023-38472
  and CVE-2023-38473
* rc3: CVE-2025-68276, CVE-2025-68468, CVE-2025-68471, CVE-2026-24401
* rc4: CVE-2026-34933

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-connectivity/avahi/avahi_0.9.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-connectivity/avahi/avahi_0.9.bb b/meta/recipes-connectivity/avahi/avahi_0.9.bb
index 560e95fce38..44ec08d8956 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.9.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.9.bb
@@ -33,6 +33,12 @@ SRCREV = "71b640e686964efb27cb708f4457ffaed183c319"
 GITHUB_BASE_URI = "https://github.com/avahi/avahi/releases/"
 
 CVE_STATUS[CVE-2021-26720] = "not-applicable-platform: Issue only affects Debian/SUSE"
+CVE_STATUS_GROUPS += "CVE_STATUS_RC"
+CVE_STATUS_RC = " \
+    CVE-2023-38469 CVE-2023-38470 CVE-2023-38471 CVE-2023-38472 CVE-2023-38473 \
+    CVE-2025-68276 CVE-2025-68468 CVE-2025-68471 CVE-2026-24401 CVE-2026-34933 \
+"
+CVE_STATUS_RC[status] = "fixed-version: fix included in current rc tag"
 
 DEPENDS = "expat libcap libdaemon glib-2.0 glib-2.0-native"
 
