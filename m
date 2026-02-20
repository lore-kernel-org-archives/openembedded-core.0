Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DD1EC5AD69
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 19:12:00 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5127.1771614712651806450
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Feb 2026 11:11:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=VsSFs2S/;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20260220191150eae201fae200020714-xrjhho@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20260220191150eae201fae200020714
        for <openembedded-core@lists.openembedded.org>;
        Fri, 20 Feb 2026 20:11:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=a7fNMJqZf6tHWIeTdoKj8/577JOda0kfXdIjlPa1ky0=;
 b=VsSFs2S/J+XO/q9b27QEwHW/Hj0ZpUXoCkKInTW3i3MkfTv+wBmvo65BvYpi1/bH6uO8Kk
 nWiknFKg/GS0Q0U8o8SHkRv5VVhG5NmbEN8zpws8+GZj8vPsdsPAy3jkyD9H8zf/hB/BirZl
 ZtHhq8u3F1ocAhUrCkQCQ9h6GVEwpSrQYkJvfxzoJu+ixlpuEGzM2IhMLWmbnjjNu3QPeGfc
 9C4aNP9AHFxHBR6a6p4PDSeVBvgfRkaBm6gUTBWF0HPsEuOVxhYtog4GjfQTzc3Rk8nHbYnb
 u3RTeOj/H5LRs6a7hKVfzJoFAkkrG//EuzM2m/NqpoXxiubauINs2elQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: peter.marko@siemens.com
Subject: [OE-core][kirkstone][PATCH 4/4] avahi: patch CVE-2026-24401
Date: Fri, 20 Feb 2026 20:11:32 +0100
Message-Id: <20260220191132.19689-4-peter.marko@siemens.com>
In-Reply-To: <20260220191132.19689-1-peter.marko@siemens.com>
References: <20260220191132.19689-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 19:12:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231547

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details https://nvd.nist.gov/vuln/detail/CVE-2026-24401

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 183d0ee54f1c194e245a7bbf243c19b3c2acf4f5)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-connectivity/avahi/avahi_0.8.bb  |  1 +
 .../avahi/files/CVE-2026-24401.patch          | 74 +++++++++++++++++++
 2 files changed, 75 insertions(+)
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2026-24401.patch

diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipes-connectivity/avahi/avahi_0.8.bb
index c1d919783c1..9ef771e5a2d 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
@@ -40,6 +40,7 @@ SRC_URI = "https://github.com/lathiat/avahi/releases/download/v${PV}/avahi-${PV}
            file://CVE-2025-68276.patch \
            file://CVE-2025-68468.patch \
            file://CVE-2025-68471.patch \
+           file://CVE-2026-24401.patch \
            "
 
 UPSTREAM_CHECK_URI = "https://github.com/lathiat/avahi/releases/"
diff --git a/meta/recipes-connectivity/avahi/files/CVE-2026-24401.patch b/meta/recipes-connectivity/avahi/files/CVE-2026-24401.patch
new file mode 100644
index 00000000000..1a442966fc9
--- /dev/null
+++ b/meta/recipes-connectivity/avahi/files/CVE-2026-24401.patch
@@ -0,0 +1,74 @@
+From 5eea2640324928c15936b7a2bcbf8ea0de7b08f7 Mon Sep 17 00:00:00 2001
+From: Hugo Muis <198191869+friendlyhugo@users.noreply.github.com>
+Date: Sun, 2 Mar 2025 18:06:24 +0100
+Subject: [PATCH] core: fix uncontrolled recursion bug using a simple loop
+ detection algorithm
+
+Closes https://github.com/avahi/avahi/issues/501
+
+CVE: CVE-2026-24401
+Upstream-Status: Backport [https://github.com/avahi/avahi/commit/78eab31128479f06e30beb8c1cbf99dd921e2524]
+(cherry picked from commit 78eab31128479f06e30beb8c1cbf99dd921e2524)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ avahi-core/browse.c | 40 ++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 40 insertions(+)
+
+diff --git a/avahi-core/browse.c b/avahi-core/browse.c
+index f461083..975b3e9 100644
+--- a/avahi-core/browse.c
++++ b/avahi-core/browse.c
+@@ -401,6 +401,40 @@ static int lookup_go(AvahiSRBLookup *l) {
+     return n;
+ }
+ 
++static int lookup_exists_in_path(AvahiSRBLookup* lookup, AvahiSRBLookup* from, AvahiSRBLookup* to) {
++    AvahiRList* rl;
++    if (from == to)
++        return 0;
++    for (rl = from->cname_lookups; rl; rl = rl->rlist_next) {
++        int r = lookup_exists_in_path(lookup, rl->data, to);
++        if (r == 1) {
++            /* loop detected, propagate result */
++            return r;
++        } else if (r == 0) {
++            /* is loop detected? */
++            return lookup == from;
++        } else {
++	        /* `to` not found, continue */
++            continue;
++        }
++    }
++    /* no path found */
++    return -1;
++}
++
++static int cname_would_create_loop(AvahiSRBLookup* l, AvahiSRBLookup* n) {
++    int ret;
++    if (l == n)
++        /* Loop to self */
++        return 1;
++
++    ret = lookup_exists_in_path(n, l->record_browser->root_lookup, l);
++
++    /* Path to n always exists */
++    assert(ret != -1);
++    return ret;
++}
++
+ static void lookup_handle_cname(AvahiSRBLookup *l, AvahiIfIndex interface, AvahiProtocol protocol, AvahiLookupFlags flags, AvahiRecord *r) {
+     AvahiKey *k;
+     AvahiSRBLookup *n;
+@@ -420,6 +454,12 @@ static void lookup_handle_cname(AvahiSRBLookup *l, AvahiIfIndex interface, Avahi
+         return;
+     }
+ 
++    if (cname_would_create_loop(l, n)) {
++        /* CNAME loops are not allowed */
++        lookup_unref(n);
++        return;
++    }
++
+     l->cname_lookups = avahi_rlist_prepend(l->cname_lookups, lookup_ref(n));
+ 
+     lookup_go(n);

