Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D357AC28B25
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 15:59:14 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.16565.1741190352053964118
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Mar 2025 07:59:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=bYeEmaJ2;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-223f4c06e9fso16591895ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 07:59:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741190351; x=1741795151; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f3awRCTCaUt+ORA3HqqP9LaMWdDp4SbH0k+t+Ca1oOE=;
        b=bYeEmaJ2FaYDcwNXOJ0TybGLoSNuB5fP9LCwCEGYa1VBm5helfMiyyhf1lMkrBt/Vv
         avESpw5FRz4809p7eHfn3aJlkJT9qbC0BOmbK01HoDhKc8WXEcnJnAhWAg5A6WmTevM/
         G1rtOmCsaeXF1ku3uEI16qEhizTpNqsB9tyUz5Fl1KlK5dwWrGtDTmU/Fv+1rt1hreRM
         XcRURFJBVJzNLhcdaTlduxPpj714cgqMb6eyFgqOVVTW/oHvLmx7Dys/VlDfY5+gZ4ac
         klQf7ZeL5YZrTuySEwQkAWmE42OPsFQ3qxZxu72aHGRgTQ5+o4KbeEhf2J6IongO9jUX
         PpnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741190351; x=1741795151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f3awRCTCaUt+ORA3HqqP9LaMWdDp4SbH0k+t+Ca1oOE=;
        b=moI+PnWlgkrkICu/UZs2KqoWhdtxHCrdiwsk6Ry+vVJyd+NOXbDw+VdTa/bB0583QP
         lBTOxO/8uMc+RE297PzfbLnPqBtBXsqzAxuEs/ghoX+iYnle0pyKfw8S4LwNseDwGgP0
         3fcuHTHaoSg1U/PfYhKU+F8TCMbSBpdSkDiHcjiHHUHP/R9aDfllgWep70DMWVYe0WGn
         c1W4RW1uUd15jinY4gucdYWV1XM16YafH0Kyb5mHwEq9YMwIzgYUi5nRiqfWJD1RTWLX
         X/CM8rI9w8OmtihB1sBt68MK0tFN1rBO/0IQ8o+/le3nN4om67Tke5zuGGJczBA+dbF3
         g7fQ==
X-Gm-Message-State: AOJu0YzDeKon5blcUsyJK/yyGI1bnSdxPbFkQKVMPvNnCwu5RV0w+RlL
	653XuCLeeR86YYXaw4GYtRO5ML8UaaT82tztoV6BcEUt+aPzN2VwvazmYSTubqYlNWXL4wErEuO
	a
X-Gm-Gg: ASbGncsx2uy1E9R9tFzs79c7d79MCSnWktFBotqIJC+Skm2wf00EmFi1rp1JIqkEqge
	JkZKez6fCclJdS/qnk6CmX+TDmA4b1TMaZCvjS+fPruEYrGme7kQGTNlYq0Px7hZAm3BwjJFkDO
	z8MihQ7wm3HKH61KBbAwW4DuqkV4pGhSsinLydJU+OCM0y7w+bZvPeuuPxQpxxSn7tBIZ4ue38V
	wRid5cU/vegZJosF6749TbhWqUFCq8qTUzQ6Aoty7r7L9VHsBAOiVG8xXCLNJgQMKrk40XlVNMU
	hG9352mS282LwQL3zEsvR9prAqDVNBHs8f4=
X-Google-Smtp-Source: AGHT+IFoFYBEm6gbbqYDlyA1bDW3r7VKq9GvlspXofnCiO/apOIH+SnpGUo8vlCwqTyY+HENvhomPw==
X-Received: by 2002:a17:902:ce12:b0:215:742e:5cff with SMTP id d9443c01a7336-223f1de7147mr74160855ad.16.1741190351298;
        Wed, 05 Mar 2025 07:59:11 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:2308:d28:2350:a5eb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223501f97bfsm115411025ad.85.2025.03.05.07.59.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 07:59:10 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 10/16] xwayland: Fix CVE-2025-26596
Date: Wed,  5 Mar 2025 07:58:39 -0800
Message-ID: <45738e56aaf5dac1a471cb37088d3cd24764156d.1741190221.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741190221.git.steve@sakoman.com>
References: <cover.1741190221.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 15:59:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212332

From: Vijay Anusuri <vanusuri@mvista.com>

Patch copied from xserver-xorg recipe.
CVE reported for both and patch apply on both.

Upstream-Commit: https://gitlab.freedesktop.org/xorg/xserver/-/commit/80d69f01

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.43.0


