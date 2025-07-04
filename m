Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A90C9C83F0D
	for <webhook@archiver.kernel.org>; Fri,  4 Jul 2025 15:10:58 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.14467.1751641852130049537
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Jul 2025 08:10:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=p4PoPh3T;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-74b54af901bso718178b3a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Jul 2025 08:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1751641851; x=1752246651; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tXNro1H4OhHE21SejcnhjoIAmxtKAMvo2d0N3leqZTg=;
        b=p4PoPh3T9kQzM++ATw20eCxvwq3Wv43/tPhhUJVfpJFwgZkpY7KeH7szBvBKX1Q2BU
         qqqmE1BhRKT4Av06qxntDbQQ7Rh4tt4SCYsIA2qwOh9cjyJpIIx76nrAy4NTwDNDVz/o
         XbNpRm7UbM30AcuECkCErPUti+ssIVURjUxznzRR5znzK8SLv4CrAFxLk4lzjBObLJwc
         MntHfW+R3iPVGWs5vSnxfltKS0uM9aUhucp9sGPrpDqGdOC8MRU5BSurGYQR1grkpaof
         x9ejA8WPKRmBnRIf19e1+tOJyBlRCMbCFZ/sMTlcP4CLcSvCxzINRSfBKNBEKxLdwWu6
         +M4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751641851; x=1752246651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tXNro1H4OhHE21SejcnhjoIAmxtKAMvo2d0N3leqZTg=;
        b=ejUqoLJYVk58nASwXAZqehHjCZ09iEufqGi0rAewXGye4cszliKX73VbIsHxsZQM5W
         ihe/w93OUO6Hn6kMDT7njh3I3do2Y3DqHKAd0QOikAjodziRWs83Yc3jPnv6SAUsNDql
         LMXFdj7Y1OY2b5KR1WtXsociMZB/27oLubvMKbsWqf1ksaKyEKb43OGl5dOEdQl5uzkU
         1mKWHH2UlDtSc0T3/2byodZ+WHcm2H8bx4bDLNe+tQMm+FxyzYzZqVsGWumDWofwLqzx
         G8nASLw/ZSLFV6UmNPEAgPtK3PgeNhnrKVFlPgEVAuw71kqN1K7kRsQLWC69+EouiQ0r
         vsTA==
X-Gm-Message-State: AOJu0YziCn3a3K63KbeCK/ab21Tm8uCWAdZaokN9W+Xdamf8d1qqy26w
	hPb8q32Q8UIPHOdOKwfQreR33TF6BVxfPP41zhrMPurWJwVtyUVqilC8aXbH3ZH1Jn6D13SCNcu
	nSCda
X-Gm-Gg: ASbGnct8XJh+DQpFodtYuT4DomZLBiZA6579sUcrLF3IkNn80ja2gb69qGIMwcO57ln
	DRufJYDVIPLs+pZt+ymBOacweJRwtVfDxvwN6j1ekWsCg44kH5d96+zn34gPvUQVCn1ILZ9ZtpU
	jJLfs20AkMojyH2yjaE+ddtjCy8501PXuxaobfhlLd+mCvylOKucU0nMqJoG4vys22lGXA8Bn9C
	NRkQMzppb2jCCfM3B2MEOEafRlBqXKAH98gXrhKd5PUl972SGCAZvnz6iAkmB5CVIrrW2LHkXxW
	VnBFHekie7llk64NIXNKbDU+7ymnVz3enwc3oxGJrSn6dyXhnW+4Ew==
X-Google-Smtp-Source: AGHT+IFjq0/CKgrndQF6Q+qKrjKN8yfuwCLjmWbydIgtk6nGOFmgDUFgVAW+71AmbLa7AsdgPcFswQ==
X-Received: by 2002:a05:6a00:4f90:b0:742:a77b:8c3 with SMTP id d2e1a72fcca58-74ce68ce9c5mr4425140b3a.4.1751641851216;
        Fri, 04 Jul 2025 08:10:51 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:d985:cb7d:ae84:68cc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce417e869sm2159592b3a.82.2025.07.04.08.10.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 08:10:50 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 06/11] xwayland: fix CVE-2025-49175
Date: Fri,  4 Jul 2025 08:10:29 -0700
Message-ID: <fec7644b70452794fabfb7d967e2124918215440.1751641631.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1751641631.git.steve@sakoman.com>
References: <cover.1751641631.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Jul 2025 15:10:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219932

From: Archana Polampalli <archana.polampalli@windriver.com>

A flaw was found in the X Rendering extension's handling of animated cursors.
If a client provides no cursors, the server assumes at least one is present,
leading to an out-of-bounds read and potential crash.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xwayland/xwayland/CVE-2025-49175.patch    | 92 +++++++++++++++++++
 .../xwayland/xwayland_23.2.5.bb               |  1 +
 2 files changed, 93 insertions(+)
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2025-49175.patch

diff --git a/meta/recipes-graphics/xwayland/xwayland/CVE-2025-49175.patch b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-49175.patch
new file mode 100644
index 0000000000..bfb37fcea0
--- /dev/null
+++ b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-49175.patch
@@ -0,0 +1,92 @@
+From 0885e0b26225c90534642fe911632ec0779eebee Sep 17 00:00:00 2001
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
+CVE: CVE-2025-49175
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/0885e0b26225c90534642fe911632ec0779eebee]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ render/animcur.c | 3 +++
+ render/render.c  | 2 ++
+ 2 files changed, 5 insertions(+)
+
+diff --git a/render/animcur.c b/render/animcur.c
+index ef27bda..77942d8 100644
+--- a/render/animcur.c
++++ b/render/animcur.c
+@@ -304,6 +304,9 @@ AnimCursorCreate(CursorPtr *cursors, CARD32 *deltas, int ncursor,
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
+index 5bc2a20..a8c2da0 100644
+--- a/render/render.c
++++ b/render/render.c
+@@ -1795,6 +1795,8 @@ ProcRenderCreateAnimCursor(ClientPtr client)
+     ncursor =
+         (client->req_len -
+          (bytes_to_int32(sizeof(xRenderCreateAnimCursorReq)))) >> 1;
++    if (ncursor <= 0)
++        return BadValue;
+     cursors = xallocarray(ncursor, sizeof(CursorPtr) + sizeof(CARD32));
+     if (!cursors)
+         return BadAlloc;
+--
+2.40.0
diff --git a/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb b/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
index 0265366393..b9b4aa1a6a 100644
--- a/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
@@ -24,6 +24,7 @@ SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz \
            file://CVE-2025-26601-2.patch \
            file://CVE-2025-26601-3.patch \
            file://CVE-2025-26601-4.patch \
+           file://CVE-2025-49175.patch \
 "
 SRC_URI[sha256sum] = "33ec7ff2687a59faaa52b9b09aa8caf118e7ecb6aed8953f526a625ff9f4bd90"
 
-- 
2.43.0


