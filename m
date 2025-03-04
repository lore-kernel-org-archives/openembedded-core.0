Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA9D9C282D0
	for <webhook@archiver.kernel.org>; Tue,  4 Mar 2025 12:20:14 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.20384.1741090805271025012
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Mar 2025 04:20:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=iAGJWdqf;
 spf=pass (domain: mvista.com, ip: 209.85.214.176, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2234e4b079cso99622185ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Mar 2025 04:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1741090804; x=1741695604; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7UetOM94jfqba3NiNdBPDSZWLbEWfgWlOCTaRGS91Wg=;
        b=iAGJWdqfxFlcIxpzPNxrTVv9QaBqWviREIPCWPWLQiEfft8HqmWAuD81y3IrV64fES
         FtHRhGBuLuvp5lfGLozMLLGFdwDhtwG/EzgVtM+oXujkNoK7QrEbqO1qReOr0B19qNZL
         yL5LGpGitpmaxCXL1r5hxEZEK9rfHL15HW2ZQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741090804; x=1741695604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7UetOM94jfqba3NiNdBPDSZWLbEWfgWlOCTaRGS91Wg=;
        b=ncOjU01hQOGrGzh7G6S/1aMvgsxaZUU/luiOHY6X3rF77Laj5CvXgUz+0wypl30Ih5
         4rfek1ZIJMAyT2c4jh9rZ5Kp3WY1ql8djz4pN7PScY1MYw2rvFg8bguCUUhiwEyZoIUj
         bnnfTYtR64byfBakebbZkb3zHR9rzu0OIsVqmEdE3KKJf1judRQOpb+e00FREGp0vdMX
         M0D+54FV3RbHEykP+g1oOvXxqdkyeA5X355b/2Fz4ifW/1Ht3gFtq+90UNrVjkVXBU+M
         x1WPqNM/MU0PlBCVYmXMrtS1/n2WBFzSUKJWTNVuiYeuLUinmPY0f8sr9lc6+WxHrLja
         t2cg==
X-Gm-Message-State: AOJu0YxbLvQkfb8Ksn935HO7zVq+PiUd5YklPU/PFocc4pKg5xTlJq++
	8E5kZMARQy7+W6snnBHvhyavVs2sWp9q3sBSAZ6TkphPCxFax8MMbpH76NSWRhsNJdrGEiSJQVF
	/zt4=
X-Gm-Gg: ASbGncs6uIfSgr4DB5U/uq1tUSjcPU2oM9OppIdt1xoPG+IFJWGth3NLZz0tv4JwvZB
	Gri5a08f80mDlsZiMAcoA1U84rUvUDvb9aEEFuVrkmdKGf83zXQdferag3YEwYRNyIu6Nt4h+ha
	XRoNay75h83XR9nK86APt7hgOyvS2hXWbn3GeyJmVdiMY3Kzd+QWA207dHbBJqiT5tG/7uRLmQU
	zwDLi3TYHv/ajlmrvobUMzmGXIF1jzCAP2QRFknamqqfNB3/dRB268gnNbZM1KvkFX8faw+AvM1
	DhS6uWkdtdxeL++KzCmQfmYMAdCAGMggmOrXXFSC2B1NvSkf1KPi5w==
X-Google-Smtp-Source: AGHT+IHpP05g4Bw3Qt0qdUZf5lZlxCWHmPk9uq0sKZOnUwoQyRZjkGbmjRLeNFtmJwrbEyXFCgkSYg==
X-Received: by 2002:a05:6a20:7347:b0:1ee:d8c8:4b79 with SMTP id adf61e73a8af0-1f2f4c9c694mr29676584637.2.1741090804158;
        Tue, 04 Mar 2025 04:20:04 -0800 (PST)
Received: from MVIN00020.mvista.com ([49.207.225.5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-aee7de1a488sm9859550a12.27.2025.03.04.04.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 04:20:03 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH 07/14] xwayland: Fix CVE-2025-26594
Date: Tue,  4 Mar 2025 17:49:11 +0530
Message-Id: <20250304121918.147345-7-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250304121918.147345-1-vanusuri@mvista.com>
References: <20250304121918.147345-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Mar 2025 12:20:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212272

From: Vijay Anusuri <vanusuri@mvista.com>

The patches are copied from xserver-xorg recipe.
CVE reported for both and patches apply on both.

Upstream-Commit: https://gitlab.freedesktop.org/xorg/xserver/-/commit/01642f26 & https://gitlab.freedesktop.org/xorg/xserver/-/commit/b0a09ba6

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../xwayland/xwayland/CVE-2025-26594-1.patch  | 54 +++++++++++++++++++
 .../xwayland/xwayland/CVE-2025-26594-2.patch  | 51 ++++++++++++++++++
 .../xwayland/xwayland_22.1.8.bb               |  2 +
 3 files changed, 107 insertions(+)
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2025-26594-1.patch
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2025-26594-2.patch

diff --git a/meta/recipes-graphics/xwayland/xwayland/CVE-2025-26594-1.patch b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-26594-1.patch
new file mode 100644
index 0000000000..f34a89e6ea
--- /dev/null
+++ b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-26594-1.patch
@@ -0,0 +1,54 @@
+From 01642f263f12becf803b19be4db95a4a83f94acc Mon Sep 17 00:00:00 2001
+From: Olivier Fourdan <ofourdan@redhat.com>
+Date: Wed, 27 Nov 2024 11:27:05 +0100
+Subject: [PATCH] Cursor: Refuse to free the root cursor
+
+If a cursor reference count drops to 0, the cursor is freed.
+
+The root cursor however is referenced with a specific global variable,
+and when the root cursor is freed, the global variable may still point
+to freed memory.
+
+Make sure to prevent the rootCursor from being explicitly freed by a
+client.
+
+CVE-2025-26594, ZDI-CAN-25544
+
+This vulnerability was discovered by:
+Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
+
+v2: Explicitly forbid XFreeCursor() on the root cursor (Peter Hutterer
+<peter.hutterer@who-t.net>)
+v3: Return BadCursor instead of BadValue (Michel Danzer
+<michel@daenzer.net>)
+
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Suggested-by: Peter Hutterer <peter.hutterer@who-t.net>
+Reviewed-by: Peter Hutterer <peter.hutterer@who-t.net>
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/1828>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/01642f26]
+CVE: CVE-2025-26594
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ dix/dispatch.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/dix/dispatch.c b/dix/dispatch.c
+index 4602961..30b95c1 100644
+--- a/dix/dispatch.c
++++ b/dix/dispatch.c
+@@ -3107,6 +3107,10 @@ ProcFreeCursor(ClientPtr client)
+     rc = dixLookupResourceByType((void **) &pCursor, stuff->id, RT_CURSOR,
+                                  client, DixDestroyAccess);
+     if (rc == Success) {
++        if (pCursor == rootCursor) {
++	    client->errorValue = stuff->id;
++	    return BadCursor;
++	}
+         FreeResource(stuff->id, RT_NONE);
+         return Success;
+     }
+-- 
+2.25.1
+
diff --git a/meta/recipes-graphics/xwayland/xwayland/CVE-2025-26594-2.patch b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-26594-2.patch
new file mode 100644
index 0000000000..6ebf540ab9
--- /dev/null
+++ b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-26594-2.patch
@@ -0,0 +1,51 @@
+From b0a09ba6020147961acc62d9c73d807b4cccd9f7 Mon Sep 17 00:00:00 2001
+From: Peter Hutterer <peter.hutterer@who-t.net>
+Date: Wed, 4 Dec 2024 15:49:43 +1000
+Subject: [PATCH] dix: keep a ref to the rootCursor
+
+CreateCursor returns a cursor with refcount 1 - that refcount is used by
+the resource system, any caller needs to call RefCursor to get their own
+reference. That happens correctly for normal cursors but for our
+rootCursor we keep a variable to the cursor despite not having a ref for
+ourselves.
+
+Fix this by reffing/unreffing the rootCursor to ensure our pointer is
+valid.
+
+Related to CVE-2025-26594, ZDI-CAN-25544
+
+Reviewed-by: Olivier Fourdan <ofourdan@redhat.com>
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/1828>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/b0a09ba6]
+CVE: CVE-2025-26594
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ dix/main.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/dix/main.c b/dix/main.c
+index bfc8add..38e29ce 100644
+--- a/dix/main.c
++++ b/dix/main.c
+@@ -231,6 +231,8 @@ dix_main(int argc, char *argv[], char *envp[])
+             FatalError("could not open default cursor font");
+         }
+ 
++        rootCursor = RefCursor(rootCursor);
++
+ #ifdef PANORAMIX
+         /*
+          * Consolidate window and colourmap information for each screen
+@@ -271,6 +273,8 @@ dix_main(int argc, char *argv[], char *envp[])
+ 
+         Dispatch();
+ 
++        UnrefCursor(rootCursor);
++
+         UndisplayDevices();
+         DisableAllDevices();
+ 
+-- 
+2.25.1
+
diff --git a/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb b/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
index 23575b387e..814fc1ce40 100644
--- a/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
@@ -29,6 +29,8 @@ SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz \
            file://CVE-2024-31083-0001.patch \
            file://CVE-2024-31083-0002.patch \
            file://CVE-2024-9632.patch \
+           file://CVE-2025-26594-1.patch \
+           file://CVE-2025-26594-2.patch \
 "
 SRC_URI[sha256sum] = "d11eeee73290b88ea8da42a7d9350dedfaba856ce4ae44e58c045ad9ecaa2f73"
 
-- 
2.25.1


