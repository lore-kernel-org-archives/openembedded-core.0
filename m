Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7264AC19F32
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 22:11:36 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.6370.1741212689887984756
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Mar 2025 14:11:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=VCXS3os/;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-22349bb8605so141990565ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 14:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741212689; x=1741817489; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G2xX6tYnSY64PudW7GOk+qiDunRa8L0pwVzxEG9TjGI=;
        b=VCXS3os/2gIECo+ZSJ/wdoE9Nojhb1jrCgJW/1CC36s9qO6ptLYlJXXqOYsLPUCCNf
         iS/Ijj3o5A+q2Py+3RqKitsrgQ+Ne7vWvAbnZuijfHEVZ18ED5OYzljSCF6ST3b7jFNI
         GI9qidEjfpGyFA+cPrWnoxD6NqyEzejQWqqybQ4BsQm+nwgAUI+qRZPuSbzAOVlvlXp4
         lsGTnOoQsYQxjqCHcr9eQ6UzSA/bwkHCcnxYtVC+AWG7wonLsBpFohJkqzGX/IaxkHGI
         GcwMWPpb2qvmD4i+qLme+O0AJTMZ6SWBMGVreu0nEAn6iTqrgPqVqNzHUokuZMMTHlx6
         aKYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741212689; x=1741817489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G2xX6tYnSY64PudW7GOk+qiDunRa8L0pwVzxEG9TjGI=;
        b=NFa85EVVhXPatyWrcLH5jotBjwGG7U8Y8SzH7STepYlaCunISaUwuvWKqqIdz8MS6I
         QNkOIw8krVrL8lWKz130cOoKORmySK177Z5chA3q01DYgUPDFAp2Wm9jbpZ/aIUx9w9v
         K0huu2l7K0YN6iA18EvFa79jE3Y4YDWW7UnXSgftdNJOl34eyCkVDguLa/raZHnROtNg
         3T0lHyLmyWLuphL7DQfIIllSQoTgmGX5hD8ajFJ0VzextYBDcAXdLBP70iR1vdXMjG2Z
         jAN8KfL3VtXzRPumrYIyfmd1/luV4uNy/wymyfFEy+PuGDIP6O0LMXISX7c/X3kY1nyH
         4Zgg==
X-Gm-Message-State: AOJu0Yzsig1s8Dw1MawyZDRkBx68gWRDAJHREBwctzzKhh5HSnsbzP9N
	7X8yUydWKFwUzCnfeJafrHn2yIkjz506BJMAneJRVIZzZVSE6VZs48GPLxOXpbLmsMmvrgUbI88
	V
X-Gm-Gg: ASbGnctVTVzxNZCOwUnLD3nMZgXtH63rnAY9zeP4wv6lmww3fRcH7uIXmBJeoLKHFoj
	wVyfKFiXAvOysoYAW/je3fXTOlLMkvn7YeoKTtDyTb+Jomf/oiQ56fMKGBrnD4NBhc+HaNPsW76
	ZRxSHbi4PoRV141gIK7wmWuZhKZk3aUv/xGfAgaFPU8xZCmaNCHQSne6hI9HuQtRa5rY6aITv38
	p88lCXJIAaxYS+EBlBjrG+QryhkE3K8UYZFQ2vuNdu/2Y1pHQRVWCcm4uj5OoT/UZTeKUlkteQA
	PH02MPq/pKgv89YjfcREdz0NBV9sHYruH24=
X-Google-Smtp-Source: AGHT+IH/TgKtRiFvjMvhvEM+MN0K5wF645Q4nmSP1n6UMXILPskxVUWDgr8LEyQJKF0VLBz1fAVRBg==
X-Received: by 2002:a05:6a00:14d5:b0:736:2d84:74da with SMTP id d2e1a72fcca58-73682b84ef1mr6819432b3a.10.1741212689004;
        Wed, 05 Mar 2025 14:11:29 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:2308:d28:2350:a5eb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7362e19fd7bsm10204855b3a.43.2025.03.05.14.11.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 14:11:28 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 03/16] xwayland: Fix CVE-2024-9632
Date: Wed,  5 Mar 2025 14:11:02 -0800
Message-ID: <634a10db7da46688413d26f3fc9d5510f239b40b.1741206348.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741206348.git.steve@sakoman.com>
References: <cover.1741206348.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 22:11:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212353

From: Vijay Anusuri <vanusuri@mvista.com>

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2024-9632

Upstream patch:
https://gitlab.freedesktop.org/xorg/xserver/-/commit/ba1d14f8eff2a123bd7ff4d48c02e1d5131358e0

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xwayland/xwayland/CVE-2024-9632.patch     | 59 +++++++++++++++++++
 .../xwayland/xwayland_23.2.5.bb               |  4 +-
 2 files changed, 62 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2024-9632.patch

diff --git a/meta/recipes-graphics/xwayland/xwayland/CVE-2024-9632.patch b/meta/recipes-graphics/xwayland/xwayland/CVE-2024-9632.patch
new file mode 100644
index 0000000000..54888f6347
--- /dev/null
+++ b/meta/recipes-graphics/xwayland/xwayland/CVE-2024-9632.patch
@@ -0,0 +1,59 @@
+From ba1d14f8eff2a123bd7ff4d48c02e1d5131358e0 Mon Sep 17 00:00:00 2001
+From: Matthieu Herrb <matthieu@herrb.eu>
+Date: Thu, 10 Oct 2024 10:37:28 +0200
+Subject: [PATCH] xkb: Fix buffer overflow in _XkbSetCompatMap()
+
+The _XkbSetCompatMap() function attempts to resize the `sym_interpret`
+buffer.
+
+However, It didn't update its size properly. It updated `num_si` only,
+without updating `size_si`.
+
+This may lead to local privilege escalation if the server is run as root
+or remote code execution (e.g. x11 over ssh).
+
+CVE-2024-9632, ZDI-CAN-24756
+
+This vulnerability was discovered by:
+Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
+
+Reviewed-by: Peter Hutterer <peter.hutterer@who-t.net>
+Tested-by: Peter Hutterer <peter.hutterer@who-t.net>
+Reviewed-by: José Expósito <jexposit@redhat.com>
+(cherry picked from commit 85b77657)
+
+Part-of: <!1734>
+
+CVE: CVE-2024-9632
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/ba1d14f8eff2a123bd7ff4d48c02e1d5131358e0]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ xkb/xkb.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/xkb/xkb.c b/xkb/xkb.c
+index 276dc19..7da00a0 100644
+--- a/xkb/xkb.c
++++ b/xkb/xkb.c
+@@ -2992,13 +2992,13 @@ _XkbSetCompatMap(ClientPtr client, DeviceIntPtr dev,
+         XkbSymInterpretPtr sym;
+         unsigned int skipped = 0;
+
+-        if ((unsigned) (req->firstSI + req->nSI) > compat->num_si) {
+-            compat->num_si = req->firstSI + req->nSI;
++        if ((unsigned) (req->firstSI + req->nSI) > compat->size_si) {
++            compat->num_si = compat->size_si = req->firstSI + req->nSI;
+             compat->sym_interpret = reallocarray(compat->sym_interpret,
+-                                                 compat->num_si,
++                                                 compat->size_si,
+                                                  sizeof(XkbSymInterpretRec));
+             if (!compat->sym_interpret) {
+-                compat->num_si = 0;
++                compat->num_si = compat->size_si = 0;
+                 return BadAlloc;
+             }
+         }
+--
+2.40.0
diff --git a/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb b/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
index b934a873d1..c88fdb6e9f 100644
--- a/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
@@ -9,7 +9,9 @@ HOMEPAGE = "https://fedoraproject.org/wiki/Changes/XwaylandStandalone"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5df87950af51ac2c5822094553ea1880"
 
-SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz"
+SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz \
+           file://CVE-2024-9632.patch \
+"
 SRC_URI[sha256sum] = "33ec7ff2687a59faaa52b9b09aa8caf118e7ecb6aed8953f526a625ff9f4bd90"
 
 UPSTREAM_CHECK_REGEX = "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+)\.tar"
-- 
2.43.0


