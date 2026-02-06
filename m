Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10E8AEE208F
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 10:57:12 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8841.1770375424223063752
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Feb 2026 02:57:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Tjf+iU1x;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c54f700b5b1so375510a12.0
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Feb 2026 02:57:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770375423; x=1770980223; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KT3scYQ3EaMxvZ04IWacINzRfC97WqGBOwRnQdUDD1g=;
        b=Tjf+iU1xDHzWbB0kcIut+BFVwKsi6tZQxWdQsv0eNlWRs3fifM3Cfs6REW6vRUATGd
         LSA+QjHcDgbo9/n6FwPOOid/WRChBwaFhvSYFcaVvStEiHW6Eqd0O5hQ/qKAYV3rg7/i
         qUcLCYO6Ib2HlDiO96Z+ieLPQ7IUlVzR47m69n5zGiuWk8n4PlayEJ3W+pnw1kNOGCMR
         dEXBy0A3rTp6tR7Bz+9hhJWo9g9CUYbMOLwNpfTaLg3djCCsVxHdTd3JOoT2p2Nn4Qdv
         fXuIUHAKXXmKa8Nxa23Bi8toVmoVqIoYKCEs/DvRaVrzH9klDWFi7uP/YLVtMypJRprP
         PSaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770375423; x=1770980223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KT3scYQ3EaMxvZ04IWacINzRfC97WqGBOwRnQdUDD1g=;
        b=GE5r0lV4Sz9bopFcMI3OxwwXRC4sAMiJWt5CJDeSg/py6AfKq/JTJNlbgpSYJxttB2
         ZYmgkHeRUkoJge5mwlvkq/t3J1bauA4R4sw+GpS/d8S6I9ZH8E+G7LfjME8nBNzs5GCT
         u6hWD1hR/Fk8Ffg5C3BIln3StABAKsGwQ2kzCofOZe4ePUDVWvqd40RVwMULBj2Loh5a
         qEFqHDjTrnK0nPj2K5LTjUnKqnVKwFV4I8ugrhR9ePL3Itmm+A59T0oqr8MgPUpvU/SC
         JhxIeWSTv3DfGqcygtYgnnzvfM/n+wEw5UQXNd4g280sJ3GUsIdNvlNuEbcHk4aI60qh
         m5Sw==
X-Gm-Message-State: AOJu0YzNClmxXObTHs8jxDNVF3JsJHgcr2GZ3LrSj28VdBIIgIbuaKRN
	dFgJw7qwV7diyGmiO3yX8L+Kcb0wZ2CpssrG4Ax5/HQqxXULZpCx7iCer0XlAw==
X-Gm-Gg: AZuq6aLZ+d3teIxRuW+DdO7PSKiGAbRUzzMik0i73dfMM8He842+HZbKrOT+/VpRDOS
	ifAOEzmTaW2ApxUqE1K4HPcgjTGU7OihEizSnJveuxcAbfSDfrYslpM/6Jw9hFTyVHSioVg3sP6
	xvs0OYqUVvtFixBxfRBUp/holz3YHWB1/qMdP4B+Uk8rgB7q24Z6KTNE7mP/rUhgJbYtN5HDAb3
	km1H2Rd1CxBZNEyFrrj2D5z2NdJEnUSvg29jrDGOYqaK4mp7RyXpF96ASRX4763waV9iy0affL1
	fBsCr3yDFG3/mCT8phbR9VVnTIM2icZv5H+pifmNU7zOk7z0iTKclyspG0/g6f2uJattsXKNdH2
	RgYXElxE46wQAoj7fq03zpkqqaNF4aojMA3AF/Cyw2WCZx62+pbaGOLV/aAyPLQQgqObURb+m6+
	Alo6+r5+sm9KoKM45hCCZICJM=
X-Received: by 2002:a05:6a21:3990:b0:366:5bda:1ea6 with SMTP id adf61e73a8af0-393acf8c027mr2313049637.11.1770375423261;
        Fri, 06 Feb 2026 02:57:03 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.33])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6dcb526676sm1779496a12.12.2026.02.06.02.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 02:57:02 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH 2/3] avahi: patch CVE-2026-24401
Date: Fri,  6 Feb 2026 23:56:42 +1300
Message-ID: <20260206105643.2636897-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260206105643.2636897-1-ankur.tyagi85@gmail.com>
References: <20260206105643.2636897-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Feb 2026 10:57:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230611

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details https://nvd.nist.gov/vuln/detail/CVE-2026-24401

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta/recipes-connectivity/avahi/avahi_0.8.bb  |  1 +
 .../avahi/files/CVE-2026-24401.patch          | 74 +++++++++++++++++++
 2 files changed, 75 insertions(+)
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2026-24401.patch

diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipes-connectivity/avahi/avahi_0.8.bb
index bd61c39dbf..35f779c914 100644
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
index 0000000000..1a442966fc
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

