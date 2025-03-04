Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D81D3C282D0
	for <webhook@archiver.kernel.org>; Tue,  4 Mar 2025 12:20:24 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.20390.1741090816718504607
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Mar 2025 04:20:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=d/ZXNHLh;
 spf=pass (domain: mvista.com, ip: 209.85.214.169, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2234bec7192so89989385ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Mar 2025 04:20:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1741090816; x=1741695616; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E+JmaMEKUz8wQsYPjITgyxGGXg0xiYT3TWEqdIBcsG8=;
        b=d/ZXNHLhMG+BWiW8rVZAGsNHVHEbg+MhfDLP3mm2vtyFQ6qnCiabgdFo7Mpk0BawGR
         ZtP3/10tFSEl++PfsJ+PdQypcarw38JIeEFX1QEPMP9JqQNUO2R98GaB83kJzQfiiHfG
         MgduXWMHpdBmctbErEGUhjDuWiiFU3q/IuToA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741090816; x=1741695616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E+JmaMEKUz8wQsYPjITgyxGGXg0xiYT3TWEqdIBcsG8=;
        b=nZ/daFznfPWqdJ9qJ5Bx7zFHSnydOFORrw1qlSSe2KT2uDcWHZdQhGgqbh6XT9Q8Ar
         8AKPNS//dWMQWukWHrddzQZAp6rWoufNP+KFCt+b0gVKbjtdmkz1UAEELR4Cgd/D9ycL
         1kHmtv5+rGZoEV7hRe44DmUU+GYO3ZllLMOZxcyGH40RTOIS4he4WIal4CGXmqOMBpO5
         5i9E8Vh1/RU3QL71u0lkRXWq5x/vkDla3Jm48wCoQ4PzrVvkfRdCz8VhlVY/rwDrI2Sz
         ZqJkYXN+q3dtu+vdhZlugYc0kN8CwDzGudqtO1vOlsKkU3M9KIUD2iUwKiBRZha3Hiu/
         L2xQ==
X-Gm-Message-State: AOJu0YxcyM99hEW7uZIUL39ZqBK/Plq5HvDamayo1zVUqzK1AIegmtpC
	wR0e6rWxptWsZcPpb3vUdmWAQXltMDNuVvxjmxzNJOt8Tq9ShOOG5jsxkAgkmZBr8oYtjbkruvF
	ZFws=
X-Gm-Gg: ASbGnctTL7IoXCac6joY75XjNk7nwva/dy+3pgM1BodlDgzFyK78d21nJD//EJTvysB
	hyUingc/P0SfEtMf08o9wc7GKZ7KmuF9K5pv7hhU/T8imDhTSjj1E6aoF9NrVEA9UYxEiTsaryX
	bK3wrmEqKC0lcrcnpxdIjpSq1iqOyFWN+9mMVhKlq5Q9uImhXKsde9PApIaA9VbelJehLdeEusC
	XdP8HVgv+58t4MDikPVBBSpB+w4NNofA99S3uzNA5krj2wN64+sbJuL88naADjn5KA9O0TOlV6J
	lM7pI1yDP4Lp8sQCBy4cCGP5+cuWa7Sz7H5yg0HBpPhukSp5MzpE4w==
X-Google-Smtp-Source: AGHT+IG0HuxcuQaQdoG/wGWigYN7fsk/VPmjWILOU0OsQZ8AObIXSVWs8LxsUfsP/v2QX+08JK4yyQ==
X-Received: by 2002:a05:6a21:2d85:b0:1ee:64c4:89bb with SMTP id adf61e73a8af0-1f2f4e4de61mr27038781637.42.1741090815688;
        Tue, 04 Mar 2025 04:20:15 -0800 (PST)
Received: from MVIN00020.mvista.com ([49.207.225.5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-aee7de1a488sm9859550a12.27.2025.03.04.04.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 04:20:15 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH 10/14] xwayland: Fix CVE-2025-26597
Date: Tue,  4 Mar 2025 17:49:14 +0530
Message-Id: <20250304121918.147345-10-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250304121918.147345-1-vanusuri@mvista.com>
References: <20250304121918.147345-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Mar 2025 12:20:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212275

From: Vijay Anusuri <vanusuri@mvista.com>

Patch copied from xserver-xorg recipe.
CVE reported for both and patch apply on both.

Upstream-Commit: https://gitlab.freedesktop.org/xorg/xserver/-/commit/0e4ed949

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../xwayland/xwayland/CVE-2025-26597.patch    | 46 +++++++++++++++++++
 .../xwayland/xwayland_22.1.8.bb               |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2025-26597.patch

diff --git a/meta/recipes-graphics/xwayland/xwayland/CVE-2025-26597.patch b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-26597.patch
new file mode 100644
index 0000000000..b0735d0b46
--- /dev/null
+++ b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-26597.patch
@@ -0,0 +1,46 @@
+From 0e4ed94952b255c04fe910f6a1d9c852878dcd64 Mon Sep 17 00:00:00 2001
+From: Olivier Fourdan <ofourdan@redhat.com>
+Date: Thu, 28 Nov 2024 14:09:04 +0100
+Subject: [PATCH] xkb: Fix buffer overflow in XkbChangeTypesOfKey()
+
+If XkbChangeTypesOfKey() is called with nGroups == 0, it will resize the
+key syms to 0 but leave the key actions unchanged.
+
+If later, the same function is called with a non-zero value for nGroups,
+this will cause a buffer overflow because the key actions are of the wrong
+size.
+
+To avoid the issue, make sure to resize both the key syms and key actions
+when nGroups is 0.
+
+CVE-2025-26597, ZDI-CAN-25683
+
+This vulnerability was discovered by:
+Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
+
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Reviewed-by: Peter Hutterer <peter.hutterer@who-t.net>
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/1828>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/0e4ed949]
+CVE: CVE-2025-26597
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ xkb/XKBMisc.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/xkb/XKBMisc.c b/xkb/XKBMisc.c
+index abbfed90eb..fd180fad2c 100644
+--- a/xkb/XKBMisc.c
++++ b/xkb/XKBMisc.c
+@@ -553,6 +553,7 @@ XkbChangeTypesOfKey(XkbDescPtr xkb,
+         i = XkbSetNumGroups(i, 0);
+         xkb->map->key_sym_map[key].group_info = i;
+         XkbResizeKeySyms(xkb, key, 0);
++        XkbResizeKeyActions(xkb, key, 0);
+         return Success;
+     }
+ 
+-- 
+GitLab
+
diff --git a/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb b/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
index 18fe2dbc98..0303e39de4 100644
--- a/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
@@ -33,6 +33,7 @@ SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz \
            file://CVE-2025-26594-2.patch \
            file://CVE-2025-26595.patch \
            file://CVE-2025-26596.patch \
+           file://CVE-2025-26597.patch \
 "
 SRC_URI[sha256sum] = "d11eeee73290b88ea8da42a7d9350dedfaba856ce4ae44e58c045ad9ecaa2f73"
 
-- 
2.25.1


