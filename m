Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D85A6C021B8
	for <webhook@archiver.kernel.org>; Tue,  4 Mar 2025 12:20:04 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.20382.1741090800948075151
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Mar 2025 04:20:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=GLFu0RYo;
 spf=pass (domain: mvista.com, ip: 209.85.214.169, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-22382657540so55482755ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Mar 2025 04:20:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1741090800; x=1741695600; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QQ/QO6xESPM51D9mFs54TtAYQXj3rWbIyxePRdhSPno=;
        b=GLFu0RYo9fZceVndCXJ2eZ0BEP5SY9PsIASrQB5MTgS5P0LDroeDzFqEWX30hR+dFT
         cQdDEudLNGuk3N4G/iKmE+67OYzQXEnM5qSr+HCOhLqqVdzJ3bOpFjWyKQWcTcON2nqx
         yoh1qsU6k+Mnf9OWtLpmq54+b1PrAdr5fxyhg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741090800; x=1741695600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QQ/QO6xESPM51D9mFs54TtAYQXj3rWbIyxePRdhSPno=;
        b=WCiVs6qbES/hfQsbv+TLoNQyaUaxJZ1wdKAzJrG+CDX8UN/tPBn0mFfJL9yF+zN6KX
         j8H8UB7I4F/CqyLzxK73J2In95YxhsB2tDbxcsG+d6teqj4NGn2/1/A8UpP5EBnVCxEA
         f6pA6hvdLJcGuHLafkQEpOMb5SuHeoo+9DHeggQqy1hzdHW78aVKIh5pXQazNjPogmNc
         kjlqdH7YR7swKnu7+qGRNFjUfQIUJfQ9ooKWukRjXmsUjV68DIe6dfoV6kXW1d1bEiAW
         x3KZyH7jYgVzd3lk2RaHCs4gQdM0xz5Ixp1z1OMl5jtN9x4DmP+gZtt6WSJj0wZzIQwg
         sLmA==
X-Gm-Message-State: AOJu0Yy5Lc2pQwcqx7EN4Q1ydKgg/eFhKqegI1zRFQu7eULHnS2EK6Em
	hSrM4RsaCSFM55Mvuy6VjVpC1KFWB7HCpmr4hwS7P97I5fnDutTJd9aKZuHiuv5Nq+Zab/DGnTd
	e1Qg=
X-Gm-Gg: ASbGncsNeQqFzQ9j2VDgWBQBJfLo7xVutK/6otXwkpB++zP/VQlkn+ZUi7I8rotDtX8
	vI3Z/i5BWrFryGbW2BL1q20rKDCxGI93c8D8bOHdCNww79/cTRlx3aGrRwLfMVLaxja7i8R4uON
	GfKCOB3hhSKtnrz9UO0BSZjbBtxSMoWEaSmgYHI0vAWTakJRwzV8zukDkVB0APVClQ5VXVTD1Qs
	WTB5SHmE0TBwjDWZlTgPe6zh++WnWeIT6yoSDSuaZudLuSXViyIbvNPPRalU+QRAc8CAbHF13NW
	qkFOH9jqpijmvU7BnSOjRBtnMp6pfCcwI2kjflnL5ysKXn970hiUgQ==
X-Google-Smtp-Source: AGHT+IGvIDGqAGiaP306m9SBXVzBW7KcShNLJa+mQLyIdOEep6FbEq7EyPXR9nIkDxVJy1hVoulDLw==
X-Received: by 2002:a05:6a21:7895:b0:1ee:e2ac:5159 with SMTP id adf61e73a8af0-1f2f4d28a3bmr25797259637.19.1741090799916;
        Tue, 04 Mar 2025 04:19:59 -0800 (PST)
Received: from MVIN00020.mvista.com ([49.207.225.5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-aee7de1a488sm9859550a12.27.2025.03.04.04.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 04:19:59 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH 06/14] xwayland: Fix CVE-2024-9632
Date: Tue,  4 Mar 2025 17:49:10 +0530
Message-Id: <20250304121918.147345-6-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250304121918.147345-1-vanusuri@mvista.com>
References: <20250304121918.147345-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Mar 2025 12:20:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212271

From: Vijay Anusuri <vanusuri@mvista.com>

Patch copied from xserver-xorg recipe.
CVE reported for both and patch apply on both.

Upstream-Commit: https://gitlab.freedesktop.org/xorg/xserver/-/commit/ba1d14f8eff2a123bd7ff4d48c02e1d5131358e0

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../xwayland/xwayland/CVE-2024-9632.patch     | 59 +++++++++++++++++++
 .../xwayland/xwayland_22.1.8.bb               |  1 +
 2 files changed, 60 insertions(+)
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
diff --git a/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb b/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
index 258a875697..23575b387e 100644
--- a/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
@@ -28,6 +28,7 @@ SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz \
            file://CVE-2024-31081.patch \
            file://CVE-2024-31083-0001.patch \
            file://CVE-2024-31083-0002.patch \
+           file://CVE-2024-9632.patch \
 "
 SRC_URI[sha256sum] = "d11eeee73290b88ea8da42a7d9350dedfaba856ce4ae44e58c045ad9ecaa2f73"
 
-- 
2.25.1


