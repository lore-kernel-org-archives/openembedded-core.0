Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D618C5AD6A
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 19:11:50 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5254.1771614706352206854
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Feb 2026 11:11:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=NXKwYobU;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-2026022019114864d602f5aa0002072d-htdaep@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 2026022019114864d602f5aa0002072d
        for <openembedded-core@lists.openembedded.org>;
        Fri, 20 Feb 2026 20:11:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=N83/T2kp4zCB2K6rjDD1GGS6oOSm7/KBiyCB4Yl6/Ww=;
 b=NXKwYobU/OiaLRTiOLj3rwph/WDZejeENuAJHm7cdjY6yq8/xs2kHJyHW635qsGUU7eewo
 UyGjRKKzeeaw7j4Ztrm125yPFq6Vd+VZSxKn0oj9SPbx5PDHzvuGEcaGn/uwj8Sbw44tOVuN
 TM49Wo54MhqbvEeOFiDKc4M1aTJ7PxScRCwe5GAvDhMt11Sn63TUbdUCeC0D3jFmE/FnSGO3
 PWbvYHHM+a/dzvCHxJ9fqEUZn+peH9SQbYL3eEZCntqsPZWYmPi+cD4YY7EIi5TDOvb2AEHa
 5uNrRwGAbB+9wS+b6uH7Oe3F0GEYyjuGunkQObPWk534/OPoQE+JtFUw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: peter.marko@siemens.com
Subject: [OE-core][kirkstone][PATCH 3/4] avahi: patch CVE-2025-68471
Date: Fri, 20 Feb 2026 20:11:31 +0100
Message-Id: <20260220191132.19689-3-peter.marko@siemens.com>
In-Reply-To: <20260220191132.19689-1-peter.marko@siemens.com>
References: <20260220191132.19689-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 19:11:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231546

From: Amaury Couderc <amaury.couderc@est.tech>

Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5ec4156330c765bc52dbce28dbba6def9868d30f)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-connectivity/avahi/avahi_0.8.bb  |  1 +
 .../avahi/files/CVE-2025-68471.patch          | 36 +++++++++++++++++++
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2025-68471.patch

diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipes-connectivity/avahi/avahi_0.8.bb
index 3faebcba832..c1d919783c1 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
@@ -39,6 +39,7 @@ SRC_URI = "https://github.com/lathiat/avahi/releases/download/v${PV}/avahi-${PV}
            file://CVE-2024-52615.patch \
            file://CVE-2025-68276.patch \
            file://CVE-2025-68468.patch \
+           file://CVE-2025-68471.patch \
            "
 
 UPSTREAM_CHECK_URI = "https://github.com/lathiat/avahi/releases/"
diff --git a/meta/recipes-connectivity/avahi/files/CVE-2025-68471.patch b/meta/recipes-connectivity/avahi/files/CVE-2025-68471.patch
new file mode 100644
index 00000000000..210565cdd61
--- /dev/null
+++ b/meta/recipes-connectivity/avahi/files/CVE-2025-68471.patch
@@ -0,0 +1,36 @@
+From 4e84c1d6eb2f54d1643bd7ce62817c722ca36d25 Mon Sep 17 00:00:00 2001
+From: Hugo Muis <198191869+friendlyhugo@users.noreply.github.com>
+Date: Sun, 2 Mar 2025 18:06:24 +0100
+Subject: [PATCH] core: fix DoS bug by changing assert to return
+
+Closes https://github.com/avahi/avahi/issues/678
+
+CVE: CVE-2025-68471
+
+Upstream-Status: Backport
+[https://github.com/avahi/avahi/commit/9c6eb53bf2e290aed84b1f207e3ce35c54cc0aa1]
+
+Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
+---
+ avahi-core/browse.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/avahi-core/browse.c b/avahi-core/browse.c
+index 2941e57..86e4432 100644
+--- a/avahi-core/browse.c
++++ b/avahi-core/browse.c
+@@ -320,7 +320,10 @@ static int lookup_start(AvahiSRBLookup *l) {
+     assert(l);
+ 
+     assert(!(l->flags & AVAHI_LOOKUP_USE_WIDE_AREA) != !(l->flags & AVAHI_LOOKUP_USE_MULTICAST));
+-    assert(!l->wide_area && !l->multicast);
++    if (l->wide_area || l->multicast) {
++        /* Avoid starting a duplicate lookup */
++        return 0;
++    }
+ 
+     if (l->flags & AVAHI_LOOKUP_USE_WIDE_AREA) {
+ 
+-- 
+2.43.0
+

