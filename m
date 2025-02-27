Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62158C19F32
	for <webhook@archiver.kernel.org>; Thu, 27 Feb 2025 12:32:29 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.9464.1740659539984447251
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Feb 2025 04:32:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=TrLxUraG;
 spf=pass (domain: mvista.com, ip: 209.85.214.182, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2235c5818a3so8115905ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 04:32:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1740659539; x=1741264339; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fTdRz29H4DIIwPjr8RgPKGA9Nk2QE9T+Bvmrp1cu3I4=;
        b=TrLxUraGoTe9nuH3XkBRbMfb5YoD3a06EOmrFRPP8RvCj/sfKOsgRKCOOhpp9jFQ3s
         yejx1NNd51o37Z7P9s7/7W2mx6SJO4bPLt8HVVJH0RTtbtWueqQkobhSQkV206qnC6H+
         C1hoCFmWzrX/uQ8V1UumrLh/CwlYp4FsuTo+4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740659539; x=1741264339;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fTdRz29H4DIIwPjr8RgPKGA9Nk2QE9T+Bvmrp1cu3I4=;
        b=xAwgNkhdw5OmgkLCfADwSvKiO28SSctgAhfC0kuVQC/uZFT5noGzDvHhi/LNjEcKHH
         JLxdx7oTVHi8XeJK1XwjYNIpF8a9JYUwQXIp0wPQbUTA29xDcvx7eQYmSKCGiBRi6dwY
         7fuddGZyY8+1lMNhE+l+r7DD9R6zMU/BOL8nhxb3QRn738WM144jh+jh44RufXeOjfJb
         CG11EsgCr4cVTV1ERDTqqy6GMuhPsjFbGOzQZDdmGAdUc3yeC/PFP7FxusgOz6UV+jTO
         LMb5Vea25TmyY5NFc8/AHC+BoQ5njhh3zKVhFV9C3KuK9f5bDpGQ6KV79iCXSwHk+/9p
         Fbiw==
X-Gm-Message-State: AOJu0YzSvGMcO1Qr9jj6VZKTDCrVxXkA6hay/d+9171gLhwR83+9OWw8
	ipKiivl7BMbtiTfrYM9Ztevxt7MahZjOWlunsNSftPZSeVr27/hrqLkL283Tv64pgX2TGWS8KQ6
	8eoA=
X-Gm-Gg: ASbGnctJjGnYT1qheAq24TPMg79DC/mMC86HHRTOsebediO2u5LQUsP5VpAEm+IYSks
	w8K3IOUrJ7ATdpKL+92Nx/Y11FvLrEmL/1e8uvkXoI4var1GBUu9eqnsa7ONEsv2IHh/9Au6io2
	xEQjc76HW23rLLDJNpiuU1OX6sHhLj+aa/O9k/6nIaN7FT/v2ZLTY9CjZgaPZK8Vghjp6X8mJGA
	24IV1mxcEo+JiK8oArMI45nT7jLznQLD9d5kQmm6b7FwmHxTPEG6kZ6NPv2+zCt4Lz9k3nPFhHx
	QcQJgOdu7Y+4scnlAFZSm/LqVdPvv0zSUI0=
X-Google-Smtp-Source: AGHT+IHWCY4AdocMW1mpZ4GyUBO24j7q2W60Wb4xNErtPRzymH2XDM8UE7v993br+DAER/p3MPqvbA==
X-Received: by 2002:a17:902:e852:b0:21f:7e12:5642 with SMTP id d9443c01a7336-22307b4bc06mr141282965ad.18.1740659538818;
        Thu, 27 Feb 2025 04:32:18 -0800 (PST)
Received: from MVIN00020.mvista.com ([49.207.225.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223504c7ce2sm13082805ad.128.2025.02.27.04.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 04:32:18 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH 1/9] xserver-xorg: Fix for CVE-2025-26594
Date: Thu, 27 Feb 2025 18:01:59 +0530
Message-Id: <20250227123207.270978-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 12:32:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211992

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from
https://gitlab.freedesktop.org/xorg/xserver/-/commit/01642f26 & https://gitlab.freedesktop.org/xorg/xserver/-/commit/b0a09ba6

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../xserver-xorg/CVE-2025-26594-1.patch       | 54 +++++++++++++++++++
 .../xserver-xorg/CVE-2025-26594-2.patch       | 51 ++++++++++++++++++
 .../xorg-xserver/xserver-xorg_21.1.8.bb       |  2 +
 3 files changed, 107 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-26594-1.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-26594-2.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-26594-1.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-26594-1.patch
new file mode 100644
index 0000000000..f34a89e6ea
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-26594-1.patch
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
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-26594-2.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-26594-2.patch
new file mode 100644
index 0000000000..6ebf540ab9
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-26594-2.patch
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
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
index a9cb1b5bde..11003db04d 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
@@ -22,6 +22,8 @@ SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
            file://CVE-2024-31083-0001.patch \
            file://CVE-2024-31083-0002.patch \
            file://CVE-2024-9632.patch \
+           file://CVE-2025-26594-1.patch \
+           file://CVE-2025-26594-2.patch \
            "
 SRC_URI[sha256sum] = "38aadb735650c8024ee25211c190bf8aad844c5f59632761ab1ef4c4d5aeb152"
 
-- 
2.25.1


