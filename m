Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 701F7C282C1
	for <webhook@archiver.kernel.org>; Thu, 27 Feb 2025 17:40:11 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.17110.1740678003098460891
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Feb 2025 09:40:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=MGRMv02a;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2230c74c8b6so36194215ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 09:40:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1740678002; x=1741282802; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aCjdC2TqRj1Ziy8e4KQmaZ5tqxEouPrlUAxbxMH92NM=;
        b=MGRMv02ac5w4AWVzP+cGyjZg0vENCi6OSD3vSw3w0rfljTfqOSkhWpkzMl7qgXn2u0
         n4XUH1CqZ1dWhezRbtSVeMDSIhiYBshQlSjmxLew5x8cEXNLO7ItDy3wQhu8c3It+02A
         othqwyUpbzV1Zxwdr6dvTk6de4VPTMEq/xbkRFKux48P4mvLnAyGaw6v1PQM6yZOad6X
         sxpwKXbf2NS6Fgvyzkw7Be8bQWX/LHNwSWNZUu/SLatG1t2Mmlg0qTsmsvR7WXRNTVZa
         laCsAK1qOFRxHZEy5ElrFnLQnXCzIrFzohhShedX5aJrKJRB6rtr67UVeAc08iORV39d
         gnDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740678002; x=1741282802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aCjdC2TqRj1Ziy8e4KQmaZ5tqxEouPrlUAxbxMH92NM=;
        b=r4Ks0wB2JFYPoA1WAOOdir1b4hFZxgTd1WsIEQ41sr1JDDZ0Q4gK3nSs/EFeJIaUOS
         b9iVA5jK8JFCfIN9DZglhVnw6CxIsmNGz9Cm3Y/xat2ye2UIZ4th9m172iPVmyIdDU49
         JfjpdXKRRNpT7cRDPNw/TFBq/jpN5yXJffPSOZAgsCr4MNxyqgTdNZx3iELANt8pjv1M
         dMh97QXm5arJlaNI+/WdiezWQSQTYv3FNIaoTIB0F8cagl7Ayoo+Orvb2IlOo2A5OWf2
         ksqf9zBL7CMh5kSrWeqNFASHznLv9jorB0ZRLsxB8UjBBud8TZO3xl3jgEHdSI1jvmUd
         JYuA==
X-Gm-Message-State: AOJu0YxVvL9tU2C68tkWFNTMdzvoLWVTpwNgi/pCRpnyPYJftKQcZp3W
	gcU2PcIrwgDpXKML698Vr0yBk7COcY+HiJI4FV0+DPyq0xwDYy8+uDBR2EB6s1MVBUSVsNJtItN
	g
X-Gm-Gg: ASbGnctMEQgG3sr6WgsaeQjkKx7bpZvK8vNM0GuzXy+tf8PNhGZ8fPR3TxiM+w+4esT
	lehZ1Quqxg7apt04evTRIPk9bMzd3VHOwaWxJQFFFrQqQt/L0OQe+bfNH/Rb1TeWVkGAr/ybO9W
	eYyPlmNHQxRMzMvSjZVeoPtB8R7FT5KS4GbukIwdKY1vt5W6d4a3/3NFhGT2o/nbpi/MEmiINJF
	R9i3uYt21ELkBH0il+cSN+vXuIHld7W1jICbfFr/3W8zUU+/I1EjZ5o2+JFituubM3Ek9xtE3Kk
	JxkwH5ODh8aYvtDrrg==
X-Google-Smtp-Source: AGHT+IEYasJxg3P1t4DZmBI4tcvLmiogKG+Rue1O28SZLZ0UbBu7kJrdmQj9hD1rUJhTQc8v+EWiqA==
X-Received: by 2002:a05:6a20:728c:b0:1f0:e808:42ee with SMTP id adf61e73a8af0-1f0fc994027mr19598470637.42.1740678002328;
        Thu, 27 Feb 2025 09:40:02 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:1dd4:58fa:4fa2:f901])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-734a00249c3sm1914727b3a.85.2025.02.27.09.40.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 09:40:01 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/15] xserver-xorg: Fix for CVE-2025-26596
Date: Thu, 27 Feb 2025 09:39:38 -0800
Message-ID: <d510d87d9bb3e3489a4482dd0ce66e4bc7622ca0.1740677838.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1740677838.git.steve@sakoman.com>
References: <cover.1740677838.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 17:40:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212025

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://gitlab.freedesktop.org/xorg/xserver/-/commit/80d69f01

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../xserver-xorg/CVE-2025-26596.patch         | 49 +++++++++++++++++++
 .../xorg-xserver/xserver-xorg_21.1.8.bb       |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-26596.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-26596.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-26596.patch
new file mode 100644
index 0000000000..f9df8d75ea
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-26596.patch
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
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
index 94381a1a16..ec6550e545 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
@@ -25,6 +25,7 @@ SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
            file://CVE-2025-26594-1.patch \
            file://CVE-2025-26594-2.patch \
            file://CVE-2025-26595.patch \
+           file://CVE-2025-26596.patch \
            "
 SRC_URI[sha256sum] = "38aadb735650c8024ee25211c190bf8aad844c5f59632761ab1ef4c4d5aeb152"
 
-- 
2.43.0


