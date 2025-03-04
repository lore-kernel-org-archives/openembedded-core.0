Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF905C282D6
	for <webhook@archiver.kernel.org>; Tue,  4 Mar 2025 12:20:14 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.20387.1741090812846310489
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Mar 2025 04:20:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=CpfU3K1v;
 spf=pass (domain: mvista.com, ip: 209.85.214.181, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2234e4b079cso99624045ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Mar 2025 04:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1741090812; x=1741695612; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uW0UI/s0nyAhTyDkV309ZDzvPWQUoOxHiYohZjFaqh4=;
        b=CpfU3K1vt/rtpldhEGtAiX+K8HSVU8eg6h/kHGXJDJPt+1kDvQc1uxnwxA0aW2EhAs
         RPJE68YWM1V7jYuQ8P/dKRlCvSlh9z+x03UAN/dQtjssbI/9+aRizO9vJV0IFrDLovbB
         lEdPkDt0tC9Jmh9GMP6vhcxgwu2TbiOQy/L/g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741090812; x=1741695612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uW0UI/s0nyAhTyDkV309ZDzvPWQUoOxHiYohZjFaqh4=;
        b=Pg04QDG+UtphTEEsmUZG+lF5801U3NF6g6MmCIak7G5s3m700StiBXb2te9N5XF6ML
         gCbE4NPTsl4EMQWqvMLFTpDZz04v2h29DUTBFKBhAGWWzA57WzoDfaCJXj1I/BSEPMgr
         E014vbSMREMQsCgkzmW/nNlt9X8hF8yqCIOB53lbCAhWHBnwxhN7hglBTcqoIhmWrV65
         GHoeof4ndsbjAvOjWQPMWaNma7eDa86QSoSXJUFZb7my8G4anHoGQP0EPEHLM6b8IrAK
         ted7d3ftP1Cxp1JNdbs3680/751BiEiytBWd5pWKZhyaquw+7fjlpt9TCyw1iDgpHpUp
         6MIA==
X-Gm-Message-State: AOJu0YzGe01mLSVuQyy7dlpeTdnc4exQguapuSi4HoEuPLg0jN9b1KTs
	lFyrKIhgONMcvOJJi5ZIWJ+gOyQtBKAynh7BktASxDu/HIKv84s3dRF7enZW3YhM1ea4MbZyF1Z
	Xvzo=
X-Gm-Gg: ASbGncukoYHc7bf+IYMjM7XxFs+wyuxJKkhUe/rsQz75DWM9unAE96Nb4BbvmRtkrsP
	g0s+2D7qWNuZeFFrdcZ5jKZGPQS7rxJ4ZCY2yIYSXI8OsQLupf0gvStB+kJh0VUbXOK805O10if
	Ql+vlxdwJKxyevlquYVM1s0ZLC/69V4dOVrLqDFmla1dAumsrHNRgajdpAEdNjCCmo3HZ75hsl3
	HDRriCpOJBtt+kBKxeqy9lrDEFybtlqcJWfvaUJ6EX0877vrk2laKgWIxkHbwPYFgDG4ft1AwFu
	7B/kn09eSzf29wqChffoy+E+inLXHH+wJ9hlHPXMTN3krt5pAs01ew==
X-Google-Smtp-Source: AGHT+IEpFsSUiz+Vs8Gfx6C+PteV6QSzigSkk9fa9GAqocm6/D5hv51Af0KstVAO6B4YJvHJcwrxww==
X-Received: by 2002:a05:6a21:99a5:b0:1ee:e808:732c with SMTP id adf61e73a8af0-1f2f4cc65aamr28333827637.14.1741090811817;
        Tue, 04 Mar 2025 04:20:11 -0800 (PST)
Received: from MVIN00020.mvista.com ([49.207.225.5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-aee7de1a488sm9859550a12.27.2025.03.04.04.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 04:20:11 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH 09/14] xwayland: Fix CVE-2025-26596
Date: Tue,  4 Mar 2025 17:49:13 +0530
Message-Id: <20250304121918.147345-9-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250304121918.147345-1-vanusuri@mvista.com>
References: <20250304121918.147345-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Mar 2025 12:20:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212274

From: Vijay Anusuri <vanusuri@mvista.com>

Patch copied from xserver-xorg recipe.
CVE reported for both and patch apply on both.

Upstream-Commit: https://gitlab.freedesktop.org/xorg/xserver/-/commit/80d69f01

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../xwayland/xwayland/CVE-2025-26596.patch    | 49 +++++++++++++++++++
 .../xwayland/xwayland_22.1.8.bb               |  1 +
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
diff --git a/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb b/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
index 452bae8c8d..18fe2dbc98 100644
--- a/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
@@ -32,6 +32,7 @@ SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz \
            file://CVE-2025-26594-1.patch \
            file://CVE-2025-26594-2.patch \
            file://CVE-2025-26595.patch \
+           file://CVE-2025-26596.patch \
 "
 SRC_URI[sha256sum] = "d11eeee73290b88ea8da42a7d9350dedfaba856ce4ae44e58c045ad9ecaa2f73"
 
-- 
2.25.1


