Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B49DC5AD69
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 19:11:50 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5254.1771614706352206854
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Feb 2026 11:11:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=d+aCsEGX;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20260220191144d0639554ab00020770-vnefbg@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20260220191144d0639554ab00020770
        for <openembedded-core@lists.openembedded.org>;
        Fri, 20 Feb 2026 20:11:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=OdkEINDNncbLGVjpnefdzGxMQ7tKTqUj5B556uayJo8=;
 b=d+aCsEGXnEdfCrlA7dsyMldqyuSYCFsdRoYY0jFJnXowizg5PazAXLQt+w7Cpv4qFAbqdE
 Z9SNn6a1/Bm91DTrQW6vASVTtD/L2wf+Dc+0kOcPBLnr+ahXZ7W6MNx0hxTkPXxYVEoC++i7
 EnzqIknqq/D8rEFPnYCqgYsfwXJSbK575fLPLIuWWK/k6nz3Bsa1Lhv6P6qDNKzWyhrVnepn
 rqdXw/A2FFqxLU2/ejWbcZUoPSwJjVzkuVr9V8v2JNCGzYxx7wjko1mJg1XqpHRlzWms378y
 ILDYVWmBiFTP8Ky0KCKzNdPS2kiPIvHiRRH/nrJEIF4Xq6lNBLgiAYrw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: peter.marko@siemens.com
Subject: [OE-core][kirkstone][PATCH 2/4] avahi: patch CVE-2025-68468
Date: Fri, 20 Feb 2026 20:11:30 +0100
Message-Id: <20260220191132.19689-2-peter.marko@siemens.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231545

From: Amaury Couderc <amaury.couderc@est.tech>

Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9f2ed8adc37a42b561b3c4853cf8106fba39889e)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-connectivity/avahi/avahi_0.8.bb  |  1 +
 .../avahi/files/CVE-2025-68468.patch          | 32 +++++++++++++++++++
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2025-68468.patch

diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipes-connectivity/avahi/avahi_0.8.bb
index b38fedb38bf..3faebcba832 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
@@ -38,6 +38,7 @@ SRC_URI = "https://github.com/lathiat/avahi/releases/download/v${PV}/avahi-${PV}
            file://CVE-2024-52616.patch \
            file://CVE-2024-52615.patch \
            file://CVE-2025-68276.patch \
+           file://CVE-2025-68468.patch \
            "
 
 UPSTREAM_CHECK_URI = "https://github.com/lathiat/avahi/releases/"
diff --git a/meta/recipes-connectivity/avahi/files/CVE-2025-68468.patch b/meta/recipes-connectivity/avahi/files/CVE-2025-68468.patch
new file mode 100644
index 00000000000..3635cc8d53e
--- /dev/null
+++ b/meta/recipes-connectivity/avahi/files/CVE-2025-68468.patch
@@ -0,0 +1,32 @@
+From 483f83828cfda965fac914ff1b39c63c256372b2 Mon Sep 17 00:00:00 2001
+From: Hugo Muis <198191869+friendlyhugo@users.noreply.github.com>
+Date: Sun, 2 Mar 2025 18:06:24 +0100
+Subject: [PATCH] core: fix DoS bug by removing incorrect assertion
+
+Closes https://github.com/avahi/avahi/issues/683
+
+CVE: CVE-2025-68468
+
+Upstream-Status: Backport
+[https://github.com/avahi/avahi/commit/f66be13d7f31a3ef806d226bf8b67240179d309a]
+
+Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
+---
+ avahi-core/browse.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/avahi-core/browse.c b/avahi-core/browse.c
+index 86e4432..79595fe 100644
+--- a/avahi-core/browse.c
++++ b/avahi-core/browse.c
+@@ -295,7 +295,6 @@ static void lookup_multicast_callback(
+                 lookup_drop_cname(l, interface, protocol, 0, r);
+             else {
+                 /* It's a normal record, so let's call the user callback */
+-                assert(avahi_key_equal(b->key, l->key));
+ 
+                 b->callback(b, interface, protocol, event, r, flags, b->userdata);
+             }
+-- 
+2.43.0
+

