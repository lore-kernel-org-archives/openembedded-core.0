Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75EE1C282C6
	for <webhook@archiver.kernel.org>; Thu, 27 Feb 2025 17:40:11 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.17113.1740678005266520078
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Feb 2025 09:40:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=eXBMD17O;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2211acda7f6so29785195ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 09:40:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1740678004; x=1741282804; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9TV0q7x7XrmI5S9C6vcGWiaQM4CQLvcbt95Jgc9glkM=;
        b=eXBMD17Ow0d7SGDb91Q/VjVL5/IvTw9VPwQ4voqG7x1Mlnfkff0Bm9wVzp1KeWNqwv
         LLd6MLLKhzQshL9+15iIBNNs6ILYI0JkKwJG9dOLjJrOYDBJCnNXlYXUduy94FtclbMK
         4G8UVfJtDZvGw1aQb8u5OaP1qe+IeI+Zgs4qQayDIH7H4AhJsvu73yjcu8pPVtznJGev
         l+HI6uHBy+OQfDHG4F5hCVJHs9iNXYzGkdpFdUXWOnppawisA+72tbWwF29oyfN4d4xJ
         aEBXnwkawm0oX/Jv+MWguRKKTCuMotFae3aP00yeJG7C13KH9oPwHsXjmfjY6zQ9ImWS
         xl1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740678004; x=1741282804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9TV0q7x7XrmI5S9C6vcGWiaQM4CQLvcbt95Jgc9glkM=;
        b=G0zxLYKBklhpqeY5JY6m4ikSuPOIJR7VdbKHJ1hPcnGJ7Wo6eYzeZKQIGp/qv7TRb8
         W2yaGFpH8wQCvQSEKqsSVNtJTOofrYx/tgiedtblpsELIL/Qe2rHQudgKLH/z9kpF/AS
         15L4B/AitqmYHLcBL0AfIE3i6x/XfhzkLZrEOpM7t/1JOzU3tilg4Q2uBKaPuiQP8OBy
         hz8yuG/MoJwlifJQ5GYO6Q1EgjfQjHvA00nyPaCmVPLiRjAG78abNYOcriLpu7G2/Ggg
         LbmrnFf8Dx0l/UrdRZrbDllDdPBf37CIXCwZvPly99vtd9yjMj9dUTmihOw7mNM8/sC6
         UH6Q==
X-Gm-Message-State: AOJu0YwpfJNz/n2hH6w3WccPId60wf2/ioW1uc9HloA4lAieagYzybrX
	dPCJ8KOYUdbsqNxFZ80YW/WxE1H/T27RPDBxzY3BUctBQwudbhYREiDuYmwZ5N8poJ2yMA0ynIe
	P
X-Gm-Gg: ASbGncvcQf6FepBHz3LOEoxJeXIfVbfiBBorX0G+5o70lVLq7xCcClW7KWhem+y0qGe
	bkgEDnMIdbem6eDUcp5t7CTdsEhqTrjZxMVhLUx3l7yyoU6dpA2g/vs+CaPFpGhZ94/CHj3Hs+r
	eqBbvvsWT2AI3A2PJ/B+PNWw35EIyyG4C2oJwLOkbZXzCRI+5jiq9Eq40V0P96Igqa0UGgwUQY9
	X6vchFJsYxqT5TFsquqPQ9CpdOfJxC9NceGkxVXg2bzojFzqEOjfiRbsFXBg4/45kHhxUwJ7eVE
	XWaKGCPFXVOSq13OWw==
X-Google-Smtp-Source: AGHT+IGO3uI6GMMiVYd2jrE0tl+FGN0iTVupeCJOJaG++KBjO8qTT21igQP6bOMs0rwiDRvg2Ye/nQ==
X-Received: by 2002:a17:903:244d:b0:21f:8c08:94d2 with SMTP id d9443c01a7336-22368f6a138mr479065ad.8.1740678004480;
        Thu, 27 Feb 2025 09:40:04 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:1dd4:58fa:4fa2:f901])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-734a00249c3sm1914727b3a.85.2025.02.27.09.40.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 09:40:04 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/15] xserver-xorg: Fix for CVE-2025-26597
Date: Thu, 27 Feb 2025 09:39:39 -0800
Message-ID: <9d095e34da2adde63358a878cfac45ea28727bdf.1740677838.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1740677838.git.steve@sakoman.com>
References: <cover.1740677838.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 17:40:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212026

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://gitlab.freedesktop.org/xorg/xserver/-/commit/0e4ed949

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../xserver-xorg/CVE-2025-26597.patch         | 46 +++++++++++++++++++
 .../xorg-xserver/xserver-xorg_21.1.8.bb       |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-26597.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-26597.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-26597.patch
new file mode 100644
index 0000000000..b0735d0b46
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-26597.patch
@@ -0,0 +1,46 @@
+From 0e4ed94952b255c04fe910f6a1d9c852878dcd64 Mon Sep 17 00:00:00 2001
+From: Olivier Fourdan <ofourdan@redhat.com>
+Date: Thu, 28 Nov 2024 14:09:04 +0100
+Subject: [PATCH] xkb: Fix buffer overflow in XkbChangeTypesOfKey()
+
+If XkbChangeTypesOfKey() is called with nGroups == 0, it will resize the
+key syms to 0 but leave the key actions unchanged.
+
+If later, the same function is called with a non-zero value for nGroups,
+this will cause a buffer overflow because the key actions are of the wrong
+size.
+
+To avoid the issue, make sure to resize both the key syms and key actions
+when nGroups is 0.
+
+CVE-2025-26597, ZDI-CAN-25683
+
+This vulnerability was discovered by:
+Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
+
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Reviewed-by: Peter Hutterer <peter.hutterer@who-t.net>
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/1828>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/0e4ed949]
+CVE: CVE-2025-26597
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ xkb/XKBMisc.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/xkb/XKBMisc.c b/xkb/XKBMisc.c
+index abbfed90eb..fd180fad2c 100644
+--- a/xkb/XKBMisc.c
++++ b/xkb/XKBMisc.c
+@@ -553,6 +553,7 @@ XkbChangeTypesOfKey(XkbDescPtr xkb,
+         i = XkbSetNumGroups(i, 0);
+         xkb->map->key_sym_map[key].group_info = i;
+         XkbResizeKeySyms(xkb, key, 0);
++        XkbResizeKeyActions(xkb, key, 0);
+         return Success;
+     }
+ 
+-- 
+GitLab
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
index ec6550e545..7c963e9fdf 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
@@ -26,6 +26,7 @@ SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
            file://CVE-2025-26594-2.patch \
            file://CVE-2025-26595.patch \
            file://CVE-2025-26596.patch \
+           file://CVE-2025-26597.patch \
            "
 SRC_URI[sha256sum] = "38aadb735650c8024ee25211c190bf8aad844c5f59632761ab1ef4c4d5aeb152"
 
-- 
2.43.0


