Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46C7EF357D9
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 14:33:02 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21655.1771943570782894105
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 06:32:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=u6inrMd0;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-483703e4b08so44748205e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 06:32:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771943569; x=1772548369; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rWPhwtxc+ViaisY0GzXI3i+uR9gvB7N8Aq4mEe6b93M=;
        b=u6inrMd0On1VEkWq9Vh+pJvdUSh2Um/PVd8yQN8xNctG6hwl+z1xdyBBRXy/+38tFf
         jZAFqWcK5dXdZqX0hI9ax7rWXF0QwqcveXpoLyU8tGDJ8ksE1JelNjHixN/QxgQVh0oi
         CxWdwTfw4qhW/O/a0X6IeYdprPUCL5puYv77o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771943569; x=1772548369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rWPhwtxc+ViaisY0GzXI3i+uR9gvB7N8Aq4mEe6b93M=;
        b=BcXjJPao5VvZdXf+jvGX5PwC37qRUIfnc6sQvOH2H9RrEq1JRoAnelhhmpaHv4GGSF
         BnvNH8K8YHuEEZdkMJmO9Qt4UFpgxp/99gBeq6h9sO1dJp7ilauuvTe4RWjcf+g95qsd
         LdwbQynjQDrgfYge+v3hDOET+wgGrgGP0ZgHE6lyMHZdzaY2r6BuFCbvDcLxFLx4PG4H
         CwB0pe5UWaAeW+C7FbRACr2cPrFUQ4zbxrVcSwbuWSclweQjDV14VnO02ixEQg4uo0cG
         Ephhnh1IVastoosTk7RsLc0V4BlMBXeAk7gXGnNFHXOlRO9aGeendlIQTmtla9lXlmtd
         fB5g==
X-Gm-Message-State: AOJu0YwskmMOs9Fa2zFaKomq8M397RwNW1F8hApb127ThqXGlTCCnPvL
	/fMGoEYekpRqL1gFWLlTba2W+MlvXYnpibGZc23GNnFT2YZkfb14fnQqe47QXh8Emdlllx8ApNg
	tQ3RH
X-Gm-Gg: AZuq6aIeDuYdXr8uZHyU56A7Vh0XXOCf5GdNJmRzqdjLKKLhJnSI9uF8MAs9AkboZpV
	cS9pEDQmJY9GE+EBpcvBAtYSy8koAYIyfFzQtVKe9YEkeas+Vh3nIEnZBkBAF+U0DRQfhNkOmI1
	yNtfh2EGlUEnxhFWziYCTaWxQX0uKPA6dYgZAP2D6Vw2r6HXzqulg/eRZ+rLtG0pjkctLGM+sug
	6srBq/YYrRJf0y+FO7NtohQYS/1ZloyiqwgUeFtUUxrUGEUCEGI9oo0ExKy2bEuvrzhMoRF4V27
	+wdTDImG+FyHgfGN72iQPT3Enfycvd5sTP28GYTgbYZtz+nI6I0K0N7ZYa2uisLtC781X7KKFFG
	GZCulXzUdzLU9j9/bJm14moJSpH/5v//l6xCtqNn9WVIfjr1iWvH1rn522mRpAhS0hfP8C7qVYV
	3v1Qc1yWEPH2RDBfj5FJmsvkHElvJlnsBb62npvgdGTNx0aHHTwI8ovX5z1BxVaslT73o+eZ68j
	LG3t/iPmOTlOxl1/XrJqt1G+JunfPuILA==
X-Received: by 2002:a05:600c:3e10:b0:46e:59bd:f7e2 with SMTP id 5b1f17b1804b1-483bd7429a1mr2844095e9.11.1771943568772;
        Tue, 24 Feb 2026 06:32:48 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483b88f950esm19819895e9.15.2026.02.24.06.32.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 06:32:48 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 05/44] avahi: patch CVE-2026-24401
Date: Tue, 24 Feb 2026 15:31:33 +0100
Message-ID: <7c6693ed8f1e96ab4ca4ea46e25768057c339caa.1771943404.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771943404.git.yoann.congal@smile.fr>
References: <cover.1771943404.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 14:33:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231810

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
index d349831f16f..fce2d7cd563 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
@@ -40,6 +40,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/avahi-${PV}.tar.gz \
            file://CVE-2025-68276.patch \
            file://CVE-2025-68468.patch \
            file://CVE-2025-68471.patch \
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

