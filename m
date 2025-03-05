Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C601EC282EC
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 15:59:14 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.16561.1741190349131141351
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Mar 2025 07:59:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Yc7NHj0X;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-22356471820so115262865ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 07:59:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741190348; x=1741795148; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HjJn69h/djvMDG5KcFjH7WX+5TdBLyCQQA9MLkEPcSs=;
        b=Yc7NHj0XP5O58+Ji+rH+nqMMcsCt9nBtM8nduKuj0VZnXgwzxnrnVg7hnQkvfJ1jjO
         IJOcjxDaZfz+OADHQly+7WeVKVIgsAUDIPp9+3rbdbhXh0TnPrpOlzDWwEEUbrMfeStJ
         Dva2lVww59gRjmpbiprAn4c8Om68fyCcDSKHHbs/DxSA+PiaUIlmmLIdHcJcMYQ1TxvC
         7v5PDA8erv5l8SukBqfp3xynhqku+fvfJg6cavFpZhRTm1DdRKvfO/nDf9yQL7H8nZff
         msxbWtO7lD+JacUOack6Mlu6b7MumrpqIBQzjVZRbQP+/qsQf2RvB03/F5dM9UwGlp46
         XIow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741190348; x=1741795148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HjJn69h/djvMDG5KcFjH7WX+5TdBLyCQQA9MLkEPcSs=;
        b=NIgfzQEspvJULEofqLpQIrVIz5eGAAc9K3M2T0emJx16L3KwIv2mGhc8xf2T/Aqunf
         8Tu2powB3k85LETeyyjiD0mFYZTZQXoQOgGcrCxwh+z0TefnLfH1YP3oC7ISix6hq/ij
         wtawjnymBAR6QlspoSlKDCSoYU65GvTDO3CIkomxEwOr2Skg9gP6SPJTQHcbDYUWQ1mA
         PtyYhpORVesOysWSoIk/WMIFtOtSLvx0M+BdUqwEGlrj0rBu03aHaoU/zc1SVCh4QWsD
         FRrGCygycXkc92XmifVrdmN0ipSthlvZIujZSGe1q8P5G71mvOOl13nwGB1rXzNQCSoo
         Nmiw==
X-Gm-Message-State: AOJu0YwL5aSB8/TOC8HVZReWXQtXv0fcqvDrMe+B+r7plzc9Gjn8B/Tz
	Imdf2Yzbg++0oH7Ons1Gs2gqTZDr1b+UaLy1gSNaCR6q+MH62YB0q/d2HtMCePqrVjA8hW3PPcx
	B
X-Gm-Gg: ASbGnctsSGaWZbd5OU4ehKYjokALp6Yz1YVkUhcRsgP7mGDHfu/GocTGc51FvLPhSYy
	udo7fsWs9q9mearsISVtczVv/TIj09fD5bvOa6prtf3RQjLs1QbNRJYKznK86qX+W0BJUIZh12V
	c8PJIBEeYelhCXRHlpzjK6tS8eKCUoTQ2DMYaolIGuzLmQj0x5zhX4cuNfwV7cAkyOlnPHzDO2t
	I5hCcQUVcG8uB8E+9skW5OewJH8nHg9FkCiRussFQRwZ6am7qzgdW7js1st5ggHtgklsmL0ovWE
	J3L7aGu2anGrOfSJLYIgx+Mc1WrTJaLLgoc=
X-Google-Smtp-Source: AGHT+IFqnW2Qzq7EF+fPu0sddTj2CVO/daXNhct8g/DZYSmsqgrVg5cVjCdcpdTX0KvsZpBdUs7EQg==
X-Received: by 2002:a17:903:f8d:b0:223:402b:cce2 with SMTP id d9443c01a7336-223f1d20e3emr47703335ad.33.1741190348296;
        Wed, 05 Mar 2025 07:59:08 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:2308:d28:2350:a5eb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223501f97bfsm115411025ad.85.2025.03.05.07.59.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 07:59:07 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/16] xwayland: Fix CVE-2025-26594
Date: Wed,  5 Mar 2025 07:58:37 -0800
Message-ID: <2d8bf72c892a3a6422e2a294fb6528ff67971e6d.1741190221.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741190221.git.steve@sakoman.com>
References: <cover.1741190221.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 15:59:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212330

From: Vijay Anusuri <vanusuri@mvista.com>

The patches are copied from xserver-xorg recipe.
CVE reported for both and patches apply on both.

Upstream-Commit: https://gitlab.freedesktop.org/xorg/xserver/-/commit/01642f26 & https://gitlab.freedesktop.org/xorg/xserver/-/commit/b0a09ba6

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.43.0


