Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97D3EEF48E6
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 08:10:30 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.67363.1770970228142418472
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Feb 2026 00:10:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=eoA4lVQc;
 spf=pass (domain: smile.fr, ip: 209.85.221.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4358fb60802so416346f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 00:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770970226; x=1771575026; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hg20fcynal9W90zVB9kv+Auo8cAKBy70s4pzsbN1BC0=;
        b=eoA4lVQcihGggSnO2r3qKPchDn1z3AI7WhiVQYf8S22kIdp8+I6SjyUCdo4TwCX39G
         4SJFGHkYti018gYHGFkRFq8wX1qfH9Qr8LOqn40m9LiTQ25qNvwy8ugbpjbyEeGm74dT
         jr1d7UtnXDlIML59Ojs1tbbK7+Yf5h2W8X4fo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770970226; x=1771575026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Hg20fcynal9W90zVB9kv+Auo8cAKBy70s4pzsbN1BC0=;
        b=f+UafimhOMNvOFypXLuBvoC5vOHDi0vyYdDW8Rv67f6+B+8xfwfV/w570xuGG05Z5A
         ib/vyOHQcY6j0YyLkVP1mlTplwXHkPaPLa/3a8/jeYp33dgv9adRQIF2t1+++orql9Cr
         hmXHTgpM1/5I8VV/VrgWxeuVRyPEbag/Cdm2uE+HMgJbgGGYCf1H87GL0XnmEvgD6I7o
         IzQWZ0bBioHJdKWvGR3KLb6/+gfKKAtQFfhZ7M79a3X9LA3N2iOlM+cpWq1P8GhHcaQB
         pdbh2uKeZSP4q9WqdWL9rucRmy9uGtoryXhNG7fUlIilrmhvwg+fZkKxQcaBoqM+Iijy
         o5Aw==
X-Gm-Message-State: AOJu0Yw33zwfZ1fyPN0vfyCA5e9Q2nhwL45gcGxIZc4YNClBm3HMgrq8
	W1zNusimTWEfdKF+/wngyF7sF79L6wat2oU+1aQdO1cXYskM/nUyJyRSkLCwwWK5zGPJVIYD8Wo
	MfeSb
X-Gm-Gg: AZuq6aKiOJTSN0QSLsXa+DncN15+eUKmaAy/0kPVjA1PEbF5u7sZuaDtTcsPUyUmrKo
	OALbpxR8c75D6lkpxFKxFSJaO9BSlKOP8zrR3+5ry8lXc7Lk6L7DSxR6eM942bT4GnKc1gTf4f1
	T9Yx2nLNOzoHDM0z+8pU4umvvDZzKzvAapQzRCIZJwD5BL+x3Un1xOmG1qP6GzJ82VwYtdz7hcg
	R2h1GckS205gEAyd1fCMNlFPbpixkawETWBGvH87YEZ4YX6Z9G8OCUtdl6CFIHfkN2aILZf72HY
	bKzJQKcIYqGfvO9bYMf7pESein2U86nu+KEsTiAWKOIm5zHQRRUbBNsbe0plorB4mX59P5qL3tx
	OKFu09BuzYItntqpO5JxzGPO/maii7kk4SZzBGVFWRKxeUeraYvYxbwe8o5MfwdZ4jhVDiJ00Gs
	rKn3UkjxIwDdx9aUbeWUgwlQnOrXlA24JMhU10odRHK5VkXE77pBJz74LtYNaPPAVdw59l+859S
	XJfm/n49YKvFr5VAnOOEj02b5o=
X-Received: by 2002:a05:6000:2909:b0:437:678b:83cd with SMTP id ffacd0b85a97d-437980327a2mr1791672f8f.15.1770970226200;
        Fri, 13 Feb 2026 00:10:26 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00d6f202ec534aee64.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:d6f2:2ec:534a:ee64])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-437969fd36dsm3590815f8f.0.2026.02.13.00.10.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 00:10:25 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 12/19] avahi: patch CVE-2026-24401
Date: Fri, 13 Feb 2026 09:08:30 +0100
Message-ID: <dfee35ccb0e932a2278da5215842be294aa55b14.1770968514.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1770968514.git.yoann.congal@smile.fr>
References: <cover.1770968514.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 08:10:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231095

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details https://nvd.nist.gov/vuln/detail/CVE-2026-24401

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 183d0ee54f1c194e245a7bbf243c19b3c2acf4f5)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-connectivity/avahi/avahi_0.8.bb  |  1 +
 .../avahi/files/CVE-2026-24401.patch          | 74 +++++++++++++++++++
 2 files changed, 75 insertions(+)
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2026-24401.patch

diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipes-connectivity/avahi/avahi_0.8.bb
index bd61c39dbf3..35f779c9143 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
@@ -38,6 +38,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/avahi-${PV}.tar.gz \
            file://CVE-2024-52616.patch \
            file://CVE-2024-52615.patch \
            file://CVE-2025-68276.patch \
+           file://CVE-2026-24401.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/avahi/avahi/releases/"
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

