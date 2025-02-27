Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 701B7C19F32
	for <webhook@archiver.kernel.org>; Thu, 27 Feb 2025 17:40:11 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.17021.1740678002174801194
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Feb 2025 09:40:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=TRKvylXz;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2233622fdffso25277945ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 09:40:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1740678001; x=1741282801; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oLi9xqknp3NYUeo7LSgCX4bO/dg4BUE/ZOrev1nhnwA=;
        b=TRKvylXzBZr9ZLqRehaGGFCrWNuh2iMB2TcLCoGj0fbn9mF9HO1PukHx5fB9BIFP/8
         K/HmkqrvwGjVeXBqsn43I4o7m/9bQ+r0w/L2kUoYFsyK1VHepxsal+Qk7dCNlI6cEqWs
         0rAicK3SDTJVyHrWSX5yIPQ/cS8LWpQq7EMexU4r2FyWAifMBx6GW5f50ebZyCrpVqvC
         4nB/s+d+Ic1HdS1lB02JLRRG5eSCG0/SEA1wa0eWYFURm64yTHcRrR85KrJcF5LzOA3C
         lGoXuNBMFDGxOe0SIhu4c/3AJRkqUZP8ed5BXlHPHAK/f10cXgtBx+vyy9Vup3P3vyo1
         lbuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740678001; x=1741282801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oLi9xqknp3NYUeo7LSgCX4bO/dg4BUE/ZOrev1nhnwA=;
        b=Q0wGnmS4PBYAXIMPIuZ2a+5x8UYTO5OZ9nbLjLWATAopAfdRPzRAScMFN5OgVx4aQS
         nw37xhrfw2mlVXfkaKIg0Uc293Q7Rv6fGGcBMr/GXL9BNg5WNkmTL3F7KRBPkjbt8wgh
         ktX3kjB2Qej+BUsdL/CGDZ0ue8vlSnYPQOS5oEiFXcs7Mx3LT37mWH4h9JrwtW9l4kmu
         WmjfmXJP5yzqCLHD/uY7V3jhqW9/iRdj83xyYb1pfNhsoNpkpqwBkQH2S1S+iW9S3HCL
         X0jKNGQ9C8Xmog28GN9nsSvM9ng2J4ygvaZ0KW2sx7HN6J7tTQFD4bPUyheXJqUGJEIV
         AOdw==
X-Gm-Message-State: AOJu0Yzx5cZaxRAADSJtDcuFuABAWtqLIwbzovjxDR3pHpemxniTkdwv
	42H9ORlrOyRcSU5L2xEj31Uf8JMf9z8XpE0cRSHJTQx8ke9RfG1gdD8njTPcyA4VuEDrXo8QNdT
	N
X-Gm-Gg: ASbGncvbEeknfSXwgC6eE7KOtFzAHccCtpVZ60pWZ9iJT/r6EGOmdC/V1bQuC8V/rcp
	CGEzneHFdBwrGCOWSCiVgNTHrL40e1g4Tc6myk7LPxDnvo6iR+EmW+7U/OW8Cqk6XkjQw/LoRDJ
	KG71y1VTljqxf2MRs2GoyZqUbFpdYg/7+oJ7GXoL7WC45H/TlJyqczUpItI87tDG8mdNniOqCfw
	dwtlyegd6FEOwan0iJ6qjVmlqM5GNp4WIMnieqEs8MejaguVBIaNzdqUoeH9H1LD00IxHeYVTJP
	/hMSGkFUFz3hLWw/Zg==
X-Google-Smtp-Source: AGHT+IFC+Th4v8F0MrD4Jc3FAD6hX8qjf2nwGa0Ji7j7+cjl2gMYi4Bg9lAFhmW8hp/O+155bCcPdg==
X-Received: by 2002:a05:6a21:3994:b0:1f0:e70a:4302 with SMTP id adf61e73a8af0-1f0fbff752cmr23032537637.2.1740678000625;
        Thu, 27 Feb 2025 09:40:00 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:1dd4:58fa:4fa2:f901])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-734a00249c3sm1914727b3a.85.2025.02.27.09.39.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 09:40:00 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/15] xserver-xorg: Fix for CVE-2025-26595
Date: Thu, 27 Feb 2025 09:39:37 -0800
Message-ID: <78d718f0a683f9fb81aa24b39f148d2acf2e1fc6.1740677838.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1740677838.git.steve@sakoman.com>
References: <cover.1740677838.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 17:40:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212024

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://gitlab.freedesktop.org/xorg/xserver/-/commit/11fcda87

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../xserver-xorg/CVE-2025-26595.patch         | 65 +++++++++++++++++++
 .../xorg-xserver/xserver-xorg_21.1.8.bb       |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-26595.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-26595.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-26595.patch
new file mode 100644
index 0000000000..a7478d9e2a
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-26595.patch
@@ -0,0 +1,65 @@
+From 11fcda8753e994e15eb915d28cf487660ec8e722 Mon Sep 17 00:00:00 2001
+From: Olivier Fourdan <ofourdan@redhat.com>
+Date: Wed, 27 Nov 2024 14:41:45 +0100
+Subject: [PATCH] xkb: Fix buffer overflow in XkbVModMaskText()
+
+The code in XkbVModMaskText() allocates a fixed sized buffer on the
+stack and copies the virtual mod name.
+
+There's actually two issues in the code that can lead to a buffer
+overflow.
+
+First, the bound check mixes pointers and integers using misplaced
+parenthesis, defeating the bound check.
+
+But even though, if the check fails, the data is still copied, so the
+stack overflow will occur regardless.
+
+Change the logic to skip the copy entirely if the bound check fails.
+
+CVE-2025-26595, ZDI-CAN-25545
+
+This vulnerability was discovered by:
+Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
+
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Reviewed-by: Peter Hutterer <peter.hutterer@who-t.net>
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/1828>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/11fcda87]
+CVE: CVE-2025-26595
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ xkb/xkbtext.c | 16 ++++++++--------
+ 1 file changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/xkb/xkbtext.c b/xkb/xkbtext.c
+index 0184664207..93262528bb 100644
+--- a/xkb/xkbtext.c
++++ b/xkb/xkbtext.c
+@@ -173,14 +173,14 @@ XkbVModMaskText(XkbDescPtr xkb,
+                 len = strlen(tmp) + 1 + (str == buf ? 0 : 1);
+                 if (format == XkbCFile)
+                     len += 4;
+-                if ((str - (buf + len)) <= VMOD_BUFFER_SIZE) {
+-                    if (str != buf) {
+-                        if (format == XkbCFile)
+-                            *str++ = '|';
+-                        else
+-                            *str++ = '+';
+-                        len--;
+-                    }
++                if ((str - buf) + len > VMOD_BUFFER_SIZE)
++                    continue; /* Skip */
++                if (str != buf) {
++                    if (format == XkbCFile)
++                        *str++ = '|';
++                    else
++                        *str++ = '+';
++                    len--;
+                 }
+                 if (format == XkbCFile)
+                     sprintf(str, "%sMask", tmp);
+-- 
+GitLab
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
index 11003db04d..94381a1a16 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
@@ -24,6 +24,7 @@ SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
            file://CVE-2024-9632.patch \
            file://CVE-2025-26594-1.patch \
            file://CVE-2025-26594-2.patch \
+           file://CVE-2025-26595.patch \
            "
 SRC_URI[sha256sum] = "38aadb735650c8024ee25211c190bf8aad844c5f59632761ab1ef4c4d5aeb152"
 
-- 
2.43.0


