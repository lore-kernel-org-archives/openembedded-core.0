Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F3F2C54FCD
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 09:25:07 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2567.1785576295896644366
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Aug 2026 02:24:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=QPdYavyk;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-2026080109245214a68079a9000207fe-ainata@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 2026080109245214a68079a9000207fe
        for <openembedded-core@lists.openembedded.org>;
        Sat, 01 Aug 2026 11:24:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=Yqkf0w0df17XsOrdmnaaHwLTwNxn5u+8KZ/qG0l7w98=;
 b=QPdYavykAdg4HPTYtBT+f6Y35V79Yp5LT0EqaWibcJr8uT3/eUU+iOX/5o3kEsIWmEUfBM
 Qtu65crA7Qjjr/mcf139Isfj4MhdeeJ3vCh+fg6T9UXSlwZEpoEbHCXFdA11XSFSg/+FzDbk
 fnBthhh7mmyUlt+Gf4zCYNRwQqQoa1GeQuRKfa+My9+6DQZrP36yFQ+fBRWL4qYYFbNx7263
 1Qj7qrgNJyg3PlB0kbO9wGnsWLhtm3hQcDyvkgytX45YenC7E6Tyz5uY2GrGVb5zFG+i8o1d
 6h2Ily8XcUK4HFK3R3c4avaTQcU7fyJswWA15Q99SvoFinlP0Z+YCRcQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH] glibc: set status for CVE-2026-5435
Date: Sat,  1 Aug 2026 11:24:37 +0200
Message-ID: <20260801092437.6273-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Aug 2026 09:25:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242489

From: Peter Marko <peter.marko@siemens.com>

Commit fixing this CVE [3] is available in current hash.
It is listed via [1] -> [2] and has CVE reference in commit message.

Additionally add comment that CVE_STATUS_STABLE_BACKPORTS variable
should be kept during recipe upgrades.

[1] https://nvd.nist.gov/vuln/detail/CVE-2026-5435
[2] https://sourceware.org/bugzilla/show_bug.cgi?id=34033
[3] https://sourceware.org/git/gitweb.cgi?p=glibc.git;h=ca44a6609c29a683b03575fa035c6d17aa591e72

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-core/glibc/glibc_2.44.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-core/glibc/glibc_2.44.bb b/meta/recipes-core/glibc/glibc_2.44.bb
index 9c93c05fe9..c629b30827 100644
--- a/meta/recipes-core/glibc/glibc_2.44.bb
+++ b/meta/recipes-core/glibc/glibc_2.44.bb
@@ -16,6 +16,13 @@ CVE_STATUS[CVE-2019-1010025] = "disputed: \
 Allows for ASLR bypass so can bypass some hardening, not an exploit in itself, may allow \
 easier access for another. 'ASLR bypass itself is not a vulnerability.'"
 
+# when upgrading, clear CVE list but keep the variables
+CVE_STATUS_GROUPS += "CVE_STATUS_STABLE_BACKPORTS"
+CVE_STATUS_STABLE_BACKPORTS = "\
+    CVE-2026-5435 \
+"
+CVE_STATUS_STABLE_BACKPORTS[status] = "cpe-stable-backport: fix available in used git hash"
+
 DEPENDS += "gperf-native bison-native"
 
 NATIVESDKFIXES ?= ""

