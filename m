Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 922B1F357BA
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 14:25:31 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21284.1771943125350332845
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 06:25:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=VjFrpGlK;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48372efa020so44679195e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 06:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771943123; x=1772547923; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HlvglJ+AcWVRDUAHQeW2sRe0tTDXmoTvdPLaUdSRD+Y=;
        b=VjFrpGlKBFFk4ANNylIbbVU/xNAa519sDAqxFeL8u2qanOQlu04nhTt3bVJFTrKnQ5
         XhG6s3bvvOToYdyrZyC8ck/kA6psjjEVLGozbuAw5hRa3zP/wIhytWA6GvV+YmzU142B
         /CDHok9BwMGYJvEJ+iHGvQ0fjfamLtPP227mg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771943123; x=1772547923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HlvglJ+AcWVRDUAHQeW2sRe0tTDXmoTvdPLaUdSRD+Y=;
        b=JzV7IIls5GpDkS9sWmtEWr0V1F0v8UCDFz+gwhMg0QZ60+zx//gHP8GE/53wdQYYn7
         XTJ+O8yip1awthow+InuCH7G73vLbRG385ZZJpsSJby4ExFlaHQ9TgCM9jckW+fmCcax
         tkQRVjpfWMviccPX3cKfFUCknak5IzaqytukeUosyqMOwMsNpmW2gXHtSZiitsk4t2kh
         5D6e9WvM4BvOSfz0wS0ZAtxyXlJzIoOrhqJKfr2cr5605snM+dW0AdtMy2E1ndCwlO7R
         8EEb6EN8LnE+2Gc4/I/YsGLHgPEyDMfWm9+YK02KbHLE0BW/PwShsgjkH3Hz+xuR86Qa
         xNPQ==
X-Gm-Message-State: AOJu0YzqELKCgKjyCjUR9nrEy8kZ1rsxqT+GWNzSShz05v13kHHPP7i9
	AINKkg8Y5Z/H9Aetr+Ie8eh3RQL+8sqezq76PDhBZNC8EAIq1ydG8WX9U407MmGAoo+rXvZslfd
	VedJj
X-Gm-Gg: AZuq6aL28azicOHZDka/idRSA36B/eNY88aKPfAqjWysGvvQBvq6MZoBC1GD+o+pJzS
	WxK8LmQTX6RbB2oxgsZmgDHxkYnbzATdp0YvqDawXkbHxk/9dWrNqZaoDkAitKuTMaJ9WHY94Ez
	VJjqJBnUHRHBsCWo5cERXGIzu3C7GmM6ggQ/UAf/GwEIUEd44P4LilRFwqkivUJS+3VPDEpdrTj
	kI9jA5zjgNkmQQ/z+do1+Q9kCG6Rnn5qsKGxtTSMGgOkxQFEs5aKQrWDIy7hKRNgG0JEVwUMUrh
	QVJeMTnjCx/sg1xXwItyNgyAFmKTpJ/rmRCU9wnD0EaOjrfsnVaPniDNtZ9Lky6YeBSO9Ns2o7P
	Ynp//ljBBliwi8BGSiSirp3hGhxyBfKE8h9mWpRkL+mVbSeVkt26L/emZ58JMxbJMj9cm5P5ntz
	6RIWDwhSJShb0cj4oUdp7BK+RJjDh7tsiyK8UAPU2zl629QRulO0i7w1BnhJ9m1ct/hlAmF+F0d
	lAAguVzM6NHrMJHVC5uHf30Ghvw69TuNw==
X-Received: by 2002:a05:600c:4454:b0:483:80b0:b245 with SMTP id 5b1f17b1804b1-483a95f89c2mr228666655e9.9.1771943123100;
        Tue, 24 Feb 2026 06:25:23 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd7507adsm2047455e9.9.2026.02.24.06.25.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 06:25:22 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 31/38] avahi: patch CVE-2026-24401
Date: Tue, 24 Feb 2026 15:24:23 +0100
Message-ID: <92206f94ee2a4cd281492e890aa6395c3111b93f.1771942869.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771942869.git.yoann.congal@smile.fr>
References: <cover.1771942869.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 14:25:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231797

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details https://nvd.nist.gov/vuln/detail/CVE-2026-24401

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 183d0ee54f1c194e245a7bbf243c19b3c2acf4f5)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
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

