Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6124C83F03
	for <webhook@archiver.kernel.org>; Fri,  4 Jul 2025 15:29:18 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.14815.1751642948963643198
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Jul 2025 08:29:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=bU0tVvGw;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-74801bc6dc5so884201b3a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Jul 2025 08:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1751642948; x=1752247748; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MumNgmGaBXZtO/aVbVPmXug4hfst4F85syJONZUdz/k=;
        b=bU0tVvGwGszDB9Io0qKy75q0cw4W7TcXofG/KBaqIZYRTLzj+rfM8fjtJ0RiQosvMA
         edwpxlhaNlwQRmn+TBIjLahPvcUCf0kLNYeuWi/+RKA4/gWMEXejOEYu/D2enCrWWHwD
         SxWY55wRZ8hm1fzWDGx8ayrFKz92yZlYXcTnfpjngcjAGBsak/2L/OndhBhdy56EYz7q
         dLHVFHkOnt9qcZIyF1T07u2iol7oTxVsGV/+P9g+aQ7s1nVsOrPOuw4wkWkHLmJx3lhT
         JomyBJz1/tWrFH7tfSicjwWzZPSwkeW5YgF8wqkfZhpIPDbmgrto7FvUWs8CxA71yQct
         uv9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751642948; x=1752247748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MumNgmGaBXZtO/aVbVPmXug4hfst4F85syJONZUdz/k=;
        b=lTAhdVy1mBVWM6qX1EtkuiZY2z0za+OoEB0QPhK2GPyS/qDP2BuP3vWMmjMngtLXFV
         hiJ6Pt5qGxUYzVhVPGqKy83X9HVxSQ5tGvOAE9+00GDhVkG+3G8/iRBwtLt6nbhtabjL
         Vgffo2Ohk66GQZr9pfTDeO4ruggAeH5ZUrPXn2AdC7YGXn8fabIyN6xFWyeE/Ty+hAr6
         YGtcJ6cpczS3vZC6P82sBtQvoHogFN5ZgY/JUB06A8DbBaPGfzjQEycsa/ppk8kVk5sI
         2jIiInqpFtFhb9d8dJ0uO4BE+gEvACUnqgtOcXkjguH8Pp6EPk2h0gv4bwXLQbi5aVuL
         SWAQ==
X-Gm-Message-State: AOJu0Yx6w1etHzBDyf066ur6CUViSj2y/4R0fK+cugRlWpYAMXC5PHPA
	78Nb0KVUusG5vz1TlHrpNvjeaxWrWkQ8jXOAfFWTzwGHLrdlM0GWpn6dSH3kUJlhY/QHc1S86EK
	pC2tP
X-Gm-Gg: ASbGnctORlb5bHVLE1OGeOw9ccqy/xjl4+2MMT6TFRmWYuAMTyyaM+GPYKeg7BAVTDV
	V3TVF5nDVilabeDhy0UmVL8VU0ch0FXVLNF6KJjKamnuOMkh5il/m2BFyZUuFi6nyzf8lUWzM/M
	l+xJu9CrZqN5MWI7XxXrbVn2c9RMZo48vC8y4kaDUVHQzqfaL+MGBrSTom02tXGFltifT80qv4c
	KGJ42FMtMeLlL6f32Om5lrB+i+KkZqgbd2KrjBFUQq2pRqZsVLqbacNQ5Gkj8dLKvUzbq4dlM38
	IPWO4MF188r3IiR65hpE+x2Y5NwW5C3fscJXnvPnIRPJzg045xmqDw==
X-Google-Smtp-Source: AGHT+IEcIITWCIKQJI3QPoFjJFc8qUAcdQDgdGr4Mchro9LMwMvOUyXAwQfgkm4vKx+gHwT4sN5ICw==
X-Received: by 2002:a05:6a20:d492:b0:1f3:31fe:c1da with SMTP id adf61e73a8af0-225af054ca1mr4382649637.11.1751642948039;
        Fri, 04 Jul 2025 08:29:08 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:d985:cb7d:ae84:68cc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce42a1ca0sm2424232b3a.138.2025.07.04.08.29.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 08:29:07 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 4/9] xwayland: fix CVE-2025-49175
Date: Fri,  4 Jul 2025 08:28:50 -0700
Message-ID: <2c8e82f860792e7fb99c78c512be57ce74774a34.1751641924.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1751641924.git.steve@sakoman.com>
References: <cover.1751641924.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Jul 2025 15:29:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219943

From: Archana Polampalli <archana.polampalli@windriver.com>

A flaw was found in the X Rendering extension's handling of animated cursors.
If a client provides no cursors, the server assumes at least one is present,
leading to an out-of-bounds read and potential crash.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xwayland/xwayland/CVE-2025-49175.patch    | 92 +++++++++++++++++++
 .../xwayland/xwayland_22.1.8.bb               |  1 +
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
diff --git a/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb b/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
index 8b1fc85aab..55d381f868 100644
--- a/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
@@ -43,6 +43,7 @@ SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz \
            file://CVE-2025-26601-3.patch \
            file://CVE-2025-26601-4.patch \
            file://CVE-2022-49737.patch \
+           file://CVE-2025-49175.patch \
 "
 SRC_URI[sha256sum] = "d11eeee73290b88ea8da42a7d9350dedfaba856ce4ae44e58c045ad9ecaa2f73"
 
-- 
2.43.0


