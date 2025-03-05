Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE447C19F32
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 13:32:33 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.13072.1741181552323987596
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Mar 2025 05:32:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=CVYHJ3l8;
 spf=pass (domain: mvista.com, ip: 209.85.214.172, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-22334203781so15501905ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 05:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1741181551; x=1741786351; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NWRsD41zV7uqT0ql8U5vK/MU7sf6ugibZddNJ2uW0rU=;
        b=CVYHJ3l8+It+y7vNsa+4a/PCUhgRQxdpSvxPPJqQfTl9YRlnIcNQjBc79ePTCFmiA4
         LEiX+H82XEU50waUPqfrmRj1t6bGfUbfPVJaDGC7UUm7gx/xOIzghtQ5r+3M7EtSs5pT
         2oq1I6iRgrVjS4I2ub60GhmwnrzlQ9PVo7uVc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741181551; x=1741786351;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NWRsD41zV7uqT0ql8U5vK/MU7sf6ugibZddNJ2uW0rU=;
        b=tJKQNeJbqy8HTZzl7TUGyTFoqSER6BGQp0MwfKbu4ffmg0rVKjYdhDZIKXob+pMFzx
         ThDh9/6dgh6Mizv1LCQStQvlbNI3xJJGiuYPxpJF3shzC6KdJDycb2MHXsG/jOq97TGG
         zmEgmAyg1Y1qJTOMobkUrhMK8nJNlubH0RIVVbEcAmVhs6lBwGssme3WrWw1bb15cklu
         Xiyz2rfGyNNmGxxtfdKKTidC9eEY4W894M3E2Ko28M4u9moC5kSO/j97kaGWWa9uzEIo
         LamEeZlHE5vF8H2pg7dO35/oFXPBzyXmU3AvSfRVxSwMp0gIotj4f6iqK/CBBMoW4BGv
         6dmQ==
X-Gm-Message-State: AOJu0YzF+32cMOXYNcGGktvoaWPAUiXEQoSyyfg2K5DKlDyZ95LW3CDS
	X6DRJhwMDaFbp1q9S9ysNsa6mFRJyRk4nqF7ELvgOtOMJxxbDqINNNhRULvbfCsyxFt/ryuXEZN
	Ps+k=
X-Gm-Gg: ASbGncs43dd5Or/xDICJCEWh8MAH+MJEXycXaUyLyRjNdHmrsZZ//83bvMw9B47savv
	JcHKQImGrEcVUluEFw8sMTSNrznT2UNLBo+kuZcFFERqeKFcuxCBCTwAtvh28xVmcpelkPDuMA9
	tcq/kv1ya/DqkzjZAct0MGgOVAjDW7NwvKI8hUtTCsFlIBbGVLvQOnIk9ULE3F0swCFb1WPCudo
	4WrrY9hi6mUx9fF/zlmpgElV7ts4E6I9yD4udQ3wg18XK08Koq/7TO5dDUtK31Up48lOGcXBLpP
	bOEeEXY1weGEEyQSt4IimYL72ajXzNTugXhVCcxHGjdmbJqTW+l7XXE=
X-Google-Smtp-Source: AGHT+IFob4AMa403Ry5OGxhqxtrjYuHdZE1iHFWJZ5KEQ6duBtg1BHJ/jIvfZqhfMca+/5RTWmjdbA==
X-Received: by 2002:a05:6a00:14d6:b0:736:4e14:8ec5 with SMTP id d2e1a72fcca58-73681ebc979mr4149312b3a.11.1741181550742;
        Wed, 05 Mar 2025 05:32:30 -0800 (PST)
Received: from MVIN00020.mvista.com ([49.207.221.18])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-734a0024c04sm13314501b3a.105.2025.03.05.05.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 05:32:30 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][PATCH 1/9] xwayland: Fix CVE-2024-9632
Date: Wed,  5 Mar 2025 19:02:06 +0530
Message-Id: <20250305133214.169364-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 13:32:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212307

From: Vijay Anusuri <vanusuri@mvista.com>

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2024-9632

Upstream patch:
https://gitlab.freedesktop.org/xorg/xserver/-/commit/ba1d14f8eff2a123bd7ff4d48c02e1d5131358e0

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
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
2.25.1


