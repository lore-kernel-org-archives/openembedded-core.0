Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B35CCA0EF5
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 20:50:15 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.4494.1755636605692945370
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Aug 2025 13:50:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=FbQrxYKs;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-244580523a0so51552835ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 13:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1755636605; x=1756241405; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=htNL64EJ7ZT560ok94cmx1+FppEoid/M8ryOOCEqpaI=;
        b=FbQrxYKsh+R/4ZhsZo05k7W6/16ovyHlel4Nx2FpXIMTKUKPep+2zzT1hkG8K59hJ/
         paizhhVQBaBLZHRAvkTCefKmBIGzycQJEU1nGY4CI2Igsd6x7j+OlWeTp2BrY7rWK3lf
         TskD2jqtF8LHnNm5c3VGQWKF/WSQXimprShW/93fC1KWQmzTHkwkJOBU4nteLKES/zFb
         OaZSRCWJ2pSTvZ7v/uDGxy5FfpM/QWFEjI3rMkghHhejoIp2E3dEDraAChUz+vOObGCC
         rBuB/LdMaT5yLJAAOe8TNAIGtUr+jskWqt389fR2r8fMnoKyzJO4jbvmZ66kdn9+vtGm
         myzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755636605; x=1756241405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=htNL64EJ7ZT560ok94cmx1+FppEoid/M8ryOOCEqpaI=;
        b=dmpp7ZTmtdU7tsNoyd3+zMnaIGXIAIiInXZ9ShYqMMzdzvCE7rCgDttaMz5Bd2RzWh
         25oIPAxj0XV0xHlS9D4rOzjXdsCs459kBry3dZa3Exk5dvDNYIv/C0eFd34eDeqgfpXT
         6ZNV6/Pmk54Ireeny3v8Rnsfi3apaX/tWz8exJbBLKzCXTwEA3t+cu8UJ7HfWkRVzzrc
         62Pj6fdo/BN3VvgzfgkeJOgi2rJZVHzoHhsFi1BObmAmFCA2Y4hU89UbOUEIhYormYN/
         P+WzRUnqfsStj7jKTWBJV4RCNtP28A6tYE/codCs/1laQ5RraoCUeCnSdbM7ImwBlBDs
         wGcg==
X-Gm-Message-State: AOJu0Yz0N1V3o7m5NuBdC7Sw2OGTqPd0F+Wl3YMREq6qyfwNwYCi2Z+O
	0NKFXXFO7fjaOJ7F2P5YwBBJkkbTaImR3WRGnJB5/iixPynTKoqUws8JYNhvhPMJy28m04rQU3/
	iKLQT
X-Gm-Gg: ASbGncvFH3nbmXebb3PSj79MmDi9tfQZ/mjRT4uQEJnm0biznHSJK7gIi1FKP798Ucf
	mUGC/t7f9ZtydQoULrP3AmLn8Gokh4iS/UccOavaeqJ6sjd+YhJakgS47o9ClJ0OlKGG2lSkg7W
	yl8EpHgsqWu1v//r08SglWFKy8uZ8kLOJv06thv19oTZSRriv2tzKnm8gSG0xbzg5lU6ELs4Gg/
	Pe/XdJdwSqiEp7LHfZdZ8TmXMi1l+XUb0t9Z1pf3UiAp+wQ6O3mEPcrZrpO364F59JgH6fgvSMd
	DDPuCsXpyM+NeXUcDyVtUZV4bb9IPTG7AzqVoeD70J5AnfdHAet2Usf2pdkjzQDWPp27TvrDiDu
	jazUu1gF1P++JCQ==
X-Google-Smtp-Source: AGHT+IEUaUrAdfu7c0u2ReQNdttupARz+0VXdFrL66K2erXyzNmgI843ovy8iGSg25nM2/gr9hWUFA==
X-Received: by 2002:a17:902:f783:b0:240:c9b6:f8ee with SMTP id d9443c01a7336-245ef27f86cmr2132425ad.50.1755636604829;
        Tue, 19 Aug 2025 13:50:04 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:f07e:6fcf:4f52:4db2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed33af50sm6179675ad.2.2025.08.19.13.50.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 13:50:04 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 4/9] xserver-xorg: Fix for CVE-2025-49175
Date: Tue, 19 Aug 2025 13:49:43 -0700
Message-ID: <23c1a62bced088cbc5eb31937bbc1e5d864213ab.1755636489.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1755636489.git.steve@sakoman.com>
References: <cover.1755636489.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 20:50:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222143

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://gitlab.freedesktop.org/xorg/xserver/-/commit/0885e0b26225c90534642fe911632ec0779eebee

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xserver-xorg/CVE-2025-49175.patch         | 91 +++++++++++++++++++
 .../xorg-xserver/xserver-xorg_21.1.8.bb       |  1 +
 2 files changed, 92 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-49175.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-49175.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-49175.patch
new file mode 100644
index 0000000000..2f56a8f6b9
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-49175.patch
@@ -0,0 +1,91 @@
+From 0885e0b26225c90534642fe911632ec0779eebee Mon Sep 17 00:00:00 2001
+From: Olivier Fourdan <ofourdan@redhat.com>
+Date: Fri, 28 Mar 2025 09:43:52 +0100
+Subject: [PATCH] render: Avoid 0 or less animated cursors
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Animated cursors use a series of cursors that the client can set.
+
+By default, the Xserver assumes at least one cursor is specified
+while a client may actually pass no cursor at all.
+
+That causes an out-of-bound read creating the animated cursor and a
+crash of the Xserver:
+
+ | Invalid read of size 8
+ |    at 0x5323F4: AnimCursorCreate (animcur.c:325)
+ |    by 0x52D4C5: ProcRenderCreateAnimCursor (render.c:1817)
+ |    by 0x52DC80: ProcRenderDispatch (render.c:1999)
+ |    by 0x4A1E9D: Dispatch (dispatch.c:560)
+ |    by 0x4B0169: dix_main (main.c:284)
+ |    by 0x4287F5: main (stubmain.c:34)
+ |  Address 0x59aa010 is 0 bytes after a block of size 0 alloc'd
+ |    at 0x48468D3: reallocarray (vg_replace_malloc.c:1803)
+ |    by 0x52D3DA: ProcRenderCreateAnimCursor (render.c:1802)
+ |    by 0x52DC80: ProcRenderDispatch (render.c:1999)
+ |    by 0x4A1E9D: Dispatch (dispatch.c:560)
+ |    by 0x4B0169: dix_main (main.c:284)
+ |    by 0x4287F5: main (stubmain.c:34)
+ |
+ | Invalid read of size 2
+ |    at 0x5323F7: AnimCursorCreate (animcur.c:325)
+ |    by 0x52D4C5: ProcRenderCreateAnimCursor (render.c:1817)
+ |    by 0x52DC80: ProcRenderDispatch (render.c:1999)
+ |    by 0x4A1E9D: Dispatch (dispatch.c:560)
+ |    by 0x4B0169: dix_main (main.c:284)
+ |    by 0x4287F5: main (stubmain.c:34)
+ |  Address 0x8 is not stack'd, malloc'd or (recently) free'd
+
+To avoid the issue, check the number of cursors specified and return a
+BadValue error in both the proc handler (early) and the animated cursor
+creation (as this is a public function) if there is 0 or less cursor.
+
+CVE-2025-49175
+
+This issue was discovered by Nils Emmerich <nemmerich@ernw.de> and
+reported by Julian Suleder via ERNW Vulnerability Disclosure.
+
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Reviewed-by: José Expósito <jexposit@redhat.com>
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/2024>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/0885e0b26225c90534642fe911632ec0779eebee]
+CVE: CVE-2025-49175
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ render/animcur.c | 3 +++
+ render/render.c  | 2 ++
+ 2 files changed, 5 insertions(+)
+
+diff --git a/render/animcur.c b/render/animcur.c
+index f906cd8130..1194cee7e7 100644
+--- a/render/animcur.c
++++ b/render/animcur.c
+@@ -305,6 +305,9 @@ AnimCursorCreate(CursorPtr *cursors, CARD32 *deltas, int ncursor,
+     int rc = BadAlloc, i;
+     AnimCurPtr ac;
+ 
++    if (ncursor <= 0)
++        return BadValue;
++
+     for (i = 0; i < screenInfo.numScreens; i++)
+         if (!GetAnimCurScreen(screenInfo.screens[i]))
+             return BadImplementation;
+diff --git a/render/render.c b/render/render.c
+index 113f6e0c5a..fe9f03c8c8 100644
+--- a/render/render.c
++++ b/render/render.c
+@@ -1799,6 +1799,8 @@ ProcRenderCreateAnimCursor(ClientPtr client)
+     ncursor =
+         (client->req_len -
+          (bytes_to_int32(sizeof(xRenderCreateAnimCursorReq)))) >> 1;
++    if (ncursor <= 0)
++        return BadValue;
+     cursors = xallocarray(ncursor, sizeof(CursorPtr) + sizeof(CARD32));
+     if (!cursors)
+         return BadAlloc;
+-- 
+GitLab
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
index 6790eb0921..565489a926 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
@@ -36,6 +36,7 @@ SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
            file://CVE-2025-26601-3.patch \
            file://CVE-2025-26601-4.patch \
            file://CVE-2022-49737.patch \
+           file://CVE-2025-49175.patch \
            "
 SRC_URI[sha256sum] = "38aadb735650c8024ee25211c190bf8aad844c5f59632761ab1ef4c4d5aeb152"
 
-- 
2.43.0


