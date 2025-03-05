Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97683C282EC
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 13:32:53 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.13076.1741181565383948877
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Mar 2025 05:32:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=MRNvAvuk;
 spf=pass (domain: mvista.com, ip: 209.85.214.180, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-22374f56453so129694535ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 05:32:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1741181564; x=1741786364; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T7et6C9DGOkTtjR2NwZapPXoI78MEw2RnzR6usoZn08=;
        b=MRNvAvukvuj33qtVVZy6DXRrpLggNLGW0xjqcZat5ZbePj+wQJK/otQV+z4Eyh+H1+
         sRlW3CZqwkwghXWk29plCWESdw55fEU47AwUEccofXK+mWVrdyGo9VdjJyvUK1VLh7M1
         NTsf2b8mzBpkWZwIC+b1QK0yhjU7tAnCiM7kA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741181564; x=1741786364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T7et6C9DGOkTtjR2NwZapPXoI78MEw2RnzR6usoZn08=;
        b=ePbVvXwzL40g5dr+VtKxt1KLDvnEWF4YcorQ7L8PAPELlRr6A8LJPgemCUhxSWbG1N
         vYN09BkEU2WWepmmPu9H2SM2ln4dAS6qVxQIn0iAiI/ozrkzJWz/kyEhCGH761BMIiUr
         B/N259vaRERyLVk2rOlv0+xyS1+1fuseerGQAWg7kD35gZHwU0RoW4vN4bc0DCVQwaCR
         2MvJrp2z0QA0T/sK/jZJvlrGnWld0ajh2Ap0LRzb2wnLtOG4jhTiat6eLUOVX9CtyQba
         xe/ypnthDO2iRBDwSl15E/D+81YFO36LYEvMU5gl/4IbTzoPv+sETd0eOK9ypUk/0d5e
         Qu2Q==
X-Gm-Message-State: AOJu0Yw7aVHbGljmZ7LZrmTfYIyQjnYEGKakZt4FBr9K631yGPN4j/qU
	4aYWLOFgbrf+xViZYt5nN78tUqSdDZ0JZA2ko1ZAaYn/w0+I9bjAa2PiV66A2PHhn8PFcYiaOlg
	A7T8=
X-Gm-Gg: ASbGncttmsUs5Bp8QVGOHrXIfD2L7EhbBwIcff/iqmzSa+3qLBvZsLEQdRuIxMiUG15
	B9LRBdJiugzyJjVvWMTG9YGFRJnUzGFKTHT5JI1FOB8VgOtRE9NJP2VXSYNQGy6N3YfPUxrm4bp
	lfZMUwUvcd66cuQJgvVSzZ7sbaX5eacOnJdr2AE2/gvb5SHA5IxFsDdyeZcxs/2wgZc7qqpMPaw
	o48bl9fa3QBKzTLo6JHU+O6ilAxVoF290ErSDtzeFRNEGfaPP76cJGl42ursZzyezK3iRvwXdHx
	ka03ANFUUQ87vMSOOyCya6chq0aquzGWJ0FnFXVITOtia6rOLrzAJcQ=
X-Google-Smtp-Source: AGHT+IGdyUgz48uG21ZVSr7f/h41+Al2h1vV/uqiXGV2wmRxo0FWkgVQHZfHrQQifbfd+1CEQgi5gQ==
X-Received: by 2002:a05:6a00:c93:b0:735:7bc0:dcda with SMTP id d2e1a72fcca58-73682b4ad83mr3986498b3a.5.1741181564391;
        Wed, 05 Mar 2025 05:32:44 -0800 (PST)
Received: from MVIN00020.mvista.com ([49.207.221.18])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-734a0024c04sm13314501b3a.105.2025.03.05.05.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 05:32:43 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][PATCH 4/9] xwayland: Fix CVE-2025-26596
Date: Wed,  5 Mar 2025 19:02:09 +0530
Message-Id: <20250305133214.169364-4-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250305133214.169364-1-vanusuri@mvista.com>
References: <20250305133214.169364-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 13:32:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212310

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://gitlab.freedesktop.org/xorg/xserver/-/commit/80d69f01

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../xwayland/xwayland/CVE-2025-26596.patch    | 49 +++++++++++++++++++
 .../xwayland/xwayland_23.2.5.bb               |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2025-26596.patch

diff --git a/meta/recipes-graphics/xwayland/xwayland/CVE-2025-26596.patch b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-26596.patch
new file mode 100644
index 0000000000..f9df8d75ea
--- /dev/null
+++ b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-26596.patch
@@ -0,0 +1,49 @@
+From 80d69f01423fc065c950e1ff4e8ddf9f675df773 Mon Sep 17 00:00:00 2001
+From: Olivier Fourdan <ofourdan@redhat.com>
+Date: Thu, 28 Nov 2024 11:49:34 +0100
+Subject: [PATCH] xkb: Fix computation of XkbSizeKeySyms
+
+The computation of the length in XkbSizeKeySyms() differs from what is
+actually written in XkbWriteKeySyms(), leading to a heap overflow.
+
+Fix the calculation in XkbSizeKeySyms() to match what kbWriteKeySyms()
+does.
+
+CVE-2025-26596, ZDI-CAN-25543
+
+This vulnerability was discovered by:
+Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
+
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Reviewed-by: Peter Hutterer <peter.hutterer@who-t.net>
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/1828>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/80d69f01]
+CVE: CVE-2025-26596
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ xkb/xkb.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/xkb/xkb.c b/xkb/xkb.c
+index 85659382da..744dba63d7 100644
+--- a/xkb/xkb.c
++++ b/xkb/xkb.c
+@@ -1095,10 +1095,10 @@ XkbSizeKeySyms(XkbDescPtr xkb, xkbGetMapReply * rep)
+     len = rep->nKeySyms * SIZEOF(xkbSymMapWireDesc);
+     symMap = &xkb->map->key_sym_map[rep->firstKeySym];
+     for (i = nSyms = 0; i < rep->nKeySyms; i++, symMap++) {
+-        if (symMap->offset != 0) {
+-            nSymsThisKey = XkbNumGroups(symMap->group_info) * symMap->width;
+-            nSyms += nSymsThisKey;
+-        }
++        nSymsThisKey = XkbNumGroups(symMap->group_info) * symMap->width;
++        if (nSymsThisKey == 0)
++            continue;
++        nSyms += nSymsThisKey;
+     }
+     len += nSyms * 4;
+     rep->totalSyms = nSyms;
+-- 
+GitLab
+
diff --git a/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb b/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
index 2215d2fe4d..63803a7a44 100644
--- a/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
@@ -14,6 +14,7 @@ SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz \
            file://CVE-2025-26594-1.patch \
            file://CVE-2025-26594-2.patch \
            file://CVE-2025-26595.patch \
+           file://CVE-2025-26596.patch \
 "
 SRC_URI[sha256sum] = "33ec7ff2687a59faaa52b9b09aa8caf118e7ecb6aed8953f526a625ff9f4bd90"
 
-- 
2.25.1


