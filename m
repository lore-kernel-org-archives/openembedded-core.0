Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85900E77184
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 20:55:20 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.91464.1734468920287494200
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Dec 2024 12:55:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=1wk+W4Z1;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-725ea1e19f0so5045557b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 12:55:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1734468919; x=1735073719; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eEiaKCU+x1U9N63VvuvSXEhINv/647jg0nO0w0XYr0Y=;
        b=1wk+W4Z1IM7TUCX3iLwAs2bZEErwz4pvDRH00JZ+EfqA+q+2SgU4ElvAKRumoyNOU+
         GL+q/zatv48DyYUlaWlIlLK68wmf6aAKKMQEaBVKph9qvS5sY+7t3aaIDBMro0I2xVnN
         mQp9PRfQ8jNkbyUllkcQf4+wBVn5LYupQ27kSQGegCCTXisFke2VxVwV4dapF5XgpdK8
         TCD/V2kyNKx/v7KLCFx8uxKrsGNQ7xiscRJe1ePq+rENaN/YMn2C/y6pRkH5GJz/ptcA
         9ez4QAbrXGQvjuUItmRNGbkVjbdDtwAYRCKeYKScF5eH1LQP5kPkA5INqw9Ta2TiDJ0b
         cCSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734468919; x=1735073719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eEiaKCU+x1U9N63VvuvSXEhINv/647jg0nO0w0XYr0Y=;
        b=MwnMqlo8VNGWfm4ah4+N3X3jmYLsVQsRLCRANhRTX06en6R/lNa0VwGTWTp7Y5P6h2
         ruZ/tN3ORw1j6y19hyEg4qeC2PVUj3CAw7W5xdITolf9yceyVO7zb9ijTHnUDg/xYTLF
         DNIqLXeJAgDSGMTw0d/aF1GU9oeag/ALXDqypWJ89UA6pIdNdbkla/nb9l5uLIC+tazT
         ZO4xJ5qf4KCuFSeoMZVIp/JQkbICWUZyejBt9TktnJiX04wy6SpiMw7HzcXr5O4Nu/i1
         YpJM4svgb1ZnkfspmWYuKT9nGbF3XApIAaDZZinfqx0kcVUHeV0bMstXezH9Ul/0Y1eK
         +hYQ==
X-Gm-Message-State: AOJu0YxYSLkTOXGDc73VzMFq/Ghd53xecnco65jwC4EKmrc6u8AVxTY5
	dWfNaqPBe8lYY/2AQVzr+NwFCeA0JJ/5YN2RnfOvNgGRbzZk1GrXw4MGtsR22G49d3szhuhHtut
	u
X-Gm-Gg: ASbGncu92b5QSS1v9Un32QxEoEwTo4i6IChY7djBYNn7C2tjJb9qmi7yY5pWG4C74o4
	iFGC6evlQEcVmQV8PAGgr38/ofc5uHQK3VO4t+Rs+/OCy/Bp+n0rA7L9DJdWgJi4RzTqVLnsbJp
	kg47oyYzr/KlSklMBnCmkVg8cfPUCqeTTaR8EREGfciWpioxJmxfJ+PGTexhfitTjhfSGpbC4v/
	4d694mLy8NmweMh2etaYEIPI64JXit3+wUPgoc1f1T9Og==
X-Google-Smtp-Source: AGHT+IHlsaEQSTNQMhbsTh/MKKoYA7h2xmGqrEZvUghDMcb7Imu8TgAyaVJt5qXBc3BFBvueNEdbEw==
X-Received: by 2002:a05:6a00:3a19:b0:725:ead7:fcae with SMTP id d2e1a72fcca58-72a8d2a5e90mr670720b3a.18.1734468919513;
        Tue, 17 Dec 2024 12:55:19 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72918ad5bc5sm7353294b3a.69.2024.12.17.12.55.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 12:55:19 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 1/9] xserver-xorg: fix CVE-2024-9632
Date: Tue, 17 Dec 2024 12:54:52 -0800
Message-Id: <5c0bfc80311b31646df9abfa02436825024baec1.1734468756.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1734468756.git.steve@sakoman.com>
References: <cover.1734468756.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 20:55:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208847

From: Yogita Urade <yogita.urade@windriver.com>

A flaw was found in the X.org server. Due to improperly
tracked allocation size in _XkbSetCompatMap, a local
attacker may be able to trigger a buffer overflow condition
via a specially crafted payload, leading to denial of service
or local privilege escalation in distributions where the
X.org server is run with root privileges.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2024-9632

Upstream patch:
https://gitlab.freedesktop.org/xorg/xserver/-/commit/ba1d14f8eff2a123bd7ff4d48c02e1d5131358e0

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xserver-xorg/CVE-2024-9632.patch          | 58 +++++++++++++++++++
 .../xorg-xserver/xserver-xorg_21.1.8.bb       |  1 +
 2 files changed, 59 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-9632.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-9632.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-9632.patch
new file mode 100644
index 0000000000..387cdaa3c9
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-9632.patch
@@ -0,0 +1,58 @@
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
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
index fe577050d9..a9cb1b5bde 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
@@ -21,6 +21,7 @@ SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
            file://CVE-2024-31082.patch \
            file://CVE-2024-31083-0001.patch \
            file://CVE-2024-31083-0002.patch \
+           file://CVE-2024-9632.patch \
            "
 SRC_URI[sha256sum] = "38aadb735650c8024ee25211c190bf8aad844c5f59632761ab1ef4c4d5aeb152"
 
-- 
2.34.1


