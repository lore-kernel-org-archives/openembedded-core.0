Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94788C28B22
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 13:32:43 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.13029.1741181557349109143
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Mar 2025 05:32:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Y2scmxbS;
 spf=pass (domain: mvista.com, ip: 209.85.214.172, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-223fb0f619dso9105995ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 05:32:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1741181556; x=1741786356; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bmf5IcNrJgPC8ZpWY/citiLdCyizjAS5MKxttyAaHUI=;
        b=Y2scmxbSTIDwovL5WnrPiwBVmwMDO0WdW7wRZ5TNBVebFvGetYzh8wyDF4vobMGHc/
         d6TRKK8avPs7rSPsAHBmQUx7s35QdMpexxaKeb3j30CsQRPf8WS0AaRtB9dl6Fm709Os
         tC4r9XGBCcZvO/Jui3k1IPLbcxnGjXqbxmB8s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741181556; x=1741786356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bmf5IcNrJgPC8ZpWY/citiLdCyizjAS5MKxttyAaHUI=;
        b=R24FdXOthJFIZZjQjDYd1knaZyMk3BtK4hnttSQCAzjxli/dL8Q9l6PUHXmLVulT8U
         LmCN+DxbqIQzm9dRW6/9vMTOzjPQzLYG33GUz1H1QCgzlOY7ewLhnqSUxhdI0BuJ1MfN
         ctfG2x4Gc+J/wvlrMfVko8WrdLRRexLmdOhWO0d9IKX9N/wnQNp/fP9k2FdPaXm2SyP1
         3ecI68oxGkVgEODfwRQoXRJxu0X3JSrghxFrhu1tQBSR1bjlarUWJmyh8NSyQLP51rbv
         n05GdpXOvesOI4VfsamcYLvU3DlTr7LkswA5EO13vSb1LLCtO5fpnR5M1gYbAwJby6jZ
         HFLg==
X-Gm-Message-State: AOJu0YxCZNYLrpa/qJS/KZ5UAt8MqykmxNRt3vbUR3cq1wSImR9LG5GM
	6LONityMnzm64WzzZqnKFMwvb/pgn4NBJhXnMojqvZnrRb1RMd3ODghziioQYgfr/J9c8d1ir+a
	1/HU=
X-Gm-Gg: ASbGncvuDXQEgsZMmFz9RvT4TCNjflYVv3n524HhoLHbSRodhhlNWqESr76iUQB9ZY+
	xre2NJlATgjTLGT6P1gxDto3EzQ9odsWG5E3KP3wEBipK23BAooZRc6tZp88sJK2RKtCFcVmvi8
	Ly0HyMG/yeCNORW3VSN7Q2DdU0/YFWikK/a7+5HX0a8L92Szsga44L5slovAykkCWx9faiCLZCZ
	WOtQd836AUhf8Q+sRck7YqDLfNm728xp4cW2pKq1U4/C6yULdfdnUteq7xhya4kRWc9N28hjf75
	oNMzYxHR0CyZh6jwXEtpxJt8RbbQjy6GpGNSHxPAG6/ycI/4IOFRpPQ=
X-Google-Smtp-Source: AGHT+IEO0HcwXnTgDscgQR3XWWCZNkfnCPdQuvtxVeiH83SAj57jsnTXe1qs0HweaQPBtAM4QEPqBw==
X-Received: by 2002:a05:6a00:4b10:b0:730:927c:d451 with SMTP id d2e1a72fcca58-73682ce10bcmr4539230b3a.20.1741181556282;
        Wed, 05 Mar 2025 05:32:36 -0800 (PST)
Received: from MVIN00020.mvista.com ([49.207.221.18])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-734a0024c04sm13314501b3a.105.2025.03.05.05.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 05:32:35 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][PATCH 2/9] xwayland: Fix CVE-2025-26594
Date: Wed,  5 Mar 2025 19:02:07 +0530
Message-Id: <20250305133214.169364-2-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250305133214.169364-1-vanusuri@mvista.com>
References: <20250305133214.169364-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 13:32:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212308

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from
https://gitlab.freedesktop.org/xorg/xserver/-/commit/01642f26 & https://gitlab.freedesktop.org/xorg/xserver/-/commit/b0a09ba6

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../xwayland/xwayland/CVE-2025-26594-1.patch  | 54 +++++++++++++++++++
 .../xwayland/xwayland/CVE-2025-26594-2.patch  | 51 ++++++++++++++++++
 .../xwayland/xwayland_23.2.5.bb               |  2 +
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
diff --git a/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb b/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
index c88fdb6e9f..3af0bb9012 100644
--- a/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
@@ -11,6 +11,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5df87950af51ac2c5822094553ea1880"
 
 SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz \
            file://CVE-2024-9632.patch \
+           file://CVE-2025-26594-1.patch \
+           file://CVE-2025-26594-2.patch \
 "
 SRC_URI[sha256sum] = "33ec7ff2687a59faaa52b9b09aa8caf118e7ecb6aed8953f526a625ff9f4bd90"
 
-- 
2.25.1


