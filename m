Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A084C282C1
	for <webhook@archiver.kernel.org>; Thu, 27 Feb 2025 17:40:01 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.17018.1740678000008906655
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Feb 2025 09:40:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Sk1tN+/j;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-220d132f16dso18402755ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 09:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1740677999; x=1741282799; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vSvtfLzhnUnZKsKMR5qAgc3oZjn7V72DxPoT/apRxTg=;
        b=Sk1tN+/jTW3Oravxq269GQCb+MspMGpuzb6Ms37vs3e+c8QY/uMAK6FRkoJZ0oA3wZ
         GACWI57Pr4dWVBHbLhRBV49pW4LovVM0Yr751d7LP53m9mSNR36azbB2leC5JkEYONF0
         +NFw8/xRyYIPEgb5SKugtYLlGhVyCsPe3fieHy1cYhj9pqFfoSmo9kl321yQTmZF7/H+
         uT/pu3PBzqxex+tkWZBf0bqhoOo6QihpedNsa1GidWan6M5kpx6BsJYXcdhDCiohggrh
         RnPrGA0eQFtsyfa2gq1Ak/3MUOeOHbgdO2X0KKzMX0wMwhDE0YYeH6D+c3/8fXVgAKIr
         tQ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740677999; x=1741282799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vSvtfLzhnUnZKsKMR5qAgc3oZjn7V72DxPoT/apRxTg=;
        b=iT1u0sQR/Lg1rDhH8OlYKsxvxDezX4eIJUeOzdhw8UogztN5ZgXFNpSlWb8PnZYkRy
         L1GD9h9aHI4lWgcBc+mQQGXDh7P8NEIifPJlrUUYUh2V3+Zunq3C7tECVaRI/yVXsTL5
         DZodnS8ZqnLnDXD0PZPUovFI5buTAXK40HAmeATPPldyLUU0EoN08UFjg5HLcC/UEa5l
         vRTv3zUiwmzbxDJ9LyA8JSC5U3/hBd4XhKVnP/b+yu5FrWRPLcrq9p89m3jaXbdAL3hj
         yqt8oHNwd+t/CC2raDdfSbazUhfD0UvqgShpVtfJMU8V70HrJ5BkdS1eGfVNLcn7ojye
         k0uw==
X-Gm-Message-State: AOJu0YwslTmglLPA1V1lArSFk21Qu+qli46G3RYnV/itk+SLox2Bj3dD
	R76iEMT/jWdDSs5SyACBhm711eFRzcKrQ8KTiwJQdk7lB2B2O9dv7X8EukrJJqsNKHfXJCxWpnS
	p
X-Gm-Gg: ASbGncuqw92Mi10rzPzlNAgW3yaVrQymT8Glmzmsq3xQrJvEmGzdOylOb8119DoUefV
	ZfMtR7EeHpAnnE5iaYa42S4jOA7OAmBuWoyNZyBzMkz4JgXeo7O4mlmUK1wC/j4hsRO7aECQFwu
	eKxk5tQ1GdLsBPcZb41kQ8VG4jSasaeRZwQgOeYPvpDKsESnIVEyz/Ivdj1Xg88Pv+4xtmE5jnT
	u2ACPFlsSI9RqMcBF/GA0uvmQlNR/0vmVMrmSMYps99QNUsPk9OcltKLIW3PhMZkwnRcckilTXz
	NMk+P3ORr0NZnpegCQ==
X-Google-Smtp-Source: AGHT+IFdOLJcWWYJ/X1NAfSPv1CJ6EN7AcoqjvRVYBIa/GwZp9TUptyXPHWofkND6PFkagPR8lfvlA==
X-Received: by 2002:a05:6a00:b95:b0:731:ff1b:dd6a with SMTP id d2e1a72fcca58-734ac44bdccmr386574b3a.20.1740677999122;
        Thu, 27 Feb 2025 09:39:59 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:1dd4:58fa:4fa2:f901])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-734a00249c3sm1914727b3a.85.2025.02.27.09.39.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 09:39:58 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 01/15] xserver-xorg: Fix for CVE-2025-26594
Date: Thu, 27 Feb 2025 09:39:36 -0800
Message-ID: <f45b068860b1be1b3dadd58f8f787953a2951405.1740677838.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1740677838.git.steve@sakoman.com>
References: <cover.1740677838.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 17:40:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212023

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
2.43.0


