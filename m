Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F651CA0EE4
	for <webhook@archiver.kernel.org>; Mon, 18 Aug 2025 18:11:35 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web10.570.1755540690904953651
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Aug 2025 11:11:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=QoFiK+5Z;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20250818181127c7a2af3400f7ae62ad-bz4bc_@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20250818181127c7a2af3400f7ae62ad
        for <openembedded-core@lists.openembedded.org>;
        Mon, 18 Aug 2025 20:11:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=YQ1BOwceo69tksluveaL4yXrK2ChOxhy6vxYSuBVqr0=;
 b=QoFiK+5Z0yB3eYbVMiyGsPxrNqukOEv1tSJ4F7jSYpepeL9w0r/sNLybVRGezqQFLGwmaY
 HNDq0wrf7na7CfELtznhmO+YpEoNIy+jZ6rRUZqfx2e7qlvazrc8nKKen1b9R3p4vvNM89GA
 KJPebxD5Bc54TptekOVFpNKqqSfCHubG5/ZHVpv7qZHmEm+GVA5yskR27xvm2kiVxxUNx8pk
 6/AC1bL3pkoN0cfOIA0lvQ5xzZZW6yEScajyQxEl+1M7INR5mpABXBK+AhFyOEQ7CNGwX71p
 5VG8T3CkKleiy911OYOHE0eSFa/CMZy5hJhLKm62coTw9JH6sjBf5axw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] glib-2.0: ignore CVE-2025-4056
Date: Mon, 18 Aug 2025 20:10:37 +0200
Message-Id: <20250818181037.1685892-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Aug 2025 18:11:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222045

From: Peter Marko <peter.marko@siemens.com>

NVD report [1] says:
A flaw was found in GLib. A denial of service on **Windows platforms**
may occur if an application attempts to spawn a program using long
command lines.

The fix [3] (linked from [2]) also changes only files
glib/gspawn-win32-helper.c
glib/gspawn-win32.c

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-4056
[2] https://gitlab.gnome.org/GNOME/glib/-/issues/3668
[3] https://gitlab.gnome.org/GNOME/glib/-/merge_requests/4570

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
index 8d2c452088..31b6c1fe98 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
@@ -97,3 +97,6 @@ def find_meson_cross_files(d):
 python () {
     find_meson_cross_files(d)
 }
+
+# not-applicable-platform: Issue only applies on Windows
+CVE_CHECK_IGNORE += "CVE-2025-4056"

