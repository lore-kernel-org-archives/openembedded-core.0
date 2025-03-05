Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCF76C282E5
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 15:59:14 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.16712.1741190350680188007
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Mar 2025 07:59:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=pLK955ib;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-223fb0f619dso14969875ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 07:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741190350; x=1741795150; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n4qQ1MQ4zmKYHUtpKkTiJahtqm7yEk8n8z7u+NmY1zI=;
        b=pLK955ibHb8GDF2od/9S2W1hNwxECEFLJ2ApnIzRXqfgeV4Wa9+rYiXE9qk73zQBqG
         Byr7vDX7j8X+32vCg0RRYgKJLpsJWE6szWhb6KsWoswyIFKRbGC5mpMs6VLsuiP9Luj8
         Sb2GSqZek8wmuqetHndImA84Chp1nNWsT3Rna81m0tO7tV860WrCSJePPhTonX7H5JEa
         9U3P6On4qSdYIWAjFKeqYApFwBigEYK4T/f+Fy8O2fSVV7pzCtZ0GrlC1huPu+z/fDN4
         hAnrPj64uP1V3sPu6Am/sQ7xDNC/m+T/KkDW3XJqrQKmnaW7e9HxUh5j7pes2r9Sk6g6
         KpLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741190350; x=1741795150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n4qQ1MQ4zmKYHUtpKkTiJahtqm7yEk8n8z7u+NmY1zI=;
        b=KFsPRxMIX1efMkfCFgtBZoPYkrbySQM9jnRKlHqyZeKx70NAr0KkxHtN1SvDcXO+3y
         MmnZKZxaG0KlyF3FJOR1e6aPfUsYc7IHQ/aKSh1Ik1eY2fXzJO4UpUvhAcU9d+PvmlJm
         Mr2TfKGGGvCrwobxXdX2NorraLf7CQTFmsPpABYkXUSdrEGKStEYK2czSFjh4RHny/Hu
         6q71w5M+qyfdEUCG9PYBDt/T6xpxpTRa1pGq6WYEOBp0OAI9Z/MnUUzsanNjb7x7u7a6
         RLFX5ekIQmjiIB7AVZ/4PfsiNDNnFtt+QFMFDwBpXLgAKb8LoYmDDux6l+jhc+W30wA2
         Ea+A==
X-Gm-Message-State: AOJu0Yz0mS4kYdehMbi6H8D+rJuo0mwRw5mi55OF2uu5DizV1CtVdm1S
	8Yye0mVUGLtxPvp8GSLvj4W3i6xT2GpjEGeQwhc0UxKpUPuFQCreC8wl0oRiZa1cKAMNHQWJ1kI
	z
X-Gm-Gg: ASbGnctm9D5XHAf3+RSml1jLpa7DFJS3ZTU88v1UiQHpLKzdXsZ/6FMX//wRSn5e413
	CE+PBTlrNreD/oPu8B4zzY8aW8ZPtZsA8ltSR7rVMaHnyZ8SsZfZftH/VKOnG3WvRbWLRYFtuMa
	hv2xI8jmk/46Vld7TpIyi5YpOBJy7gzDtGpqx2h05MRYRuPK9+Agk5cGFU6ilZHyA954UAnU/v8
	QCqKoaJJdyZYqMPFstYquLJDqsHNW/FwCOVBVMTvICd+bcRj04W1aDmJciUFYmhEnUiN9oM8WE1
	4JG4hfCpVWaxlwJzLxFzkXE+PrZ2Bu6O+v4=
X-Google-Smtp-Source: AGHT+IFjLYRq9wOqBbHngRWHhLcMdozlcMP5Ry/FhCkR9bKeMO8GG8u8WI8FZlgomnLhLhjpQw5AIg==
X-Received: by 2002:a17:902:d48c:b0:21f:81f4:21b8 with SMTP id d9443c01a7336-223f1d3bf88mr43033595ad.50.1741190349915;
        Wed, 05 Mar 2025 07:59:09 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:2308:d28:2350:a5eb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223501f97bfsm115411025ad.85.2025.03.05.07.59.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 07:59:09 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/16] xwayland: Fix CVE-2025-26595
Date: Wed,  5 Mar 2025 07:58:38 -0800
Message-ID: <e0768162f0ece29392d4f387d263d62dd4083836.1741190221.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741190221.git.steve@sakoman.com>
References: <cover.1741190221.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 15:59:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212331

From: Vijay Anusuri <vanusuri@mvista.com>

Patch copied from xserver-xorg recipe.
CVE reported for both and patch apply on both.

Upstream-Commit: https://gitlab.freedesktop.org/xorg/xserver/-/commit/11fcda87

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xwayland/xwayland/CVE-2025-26595.patch    | 65 +++++++++++++++++++
 .../xwayland/xwayland_22.1.8.bb               |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2025-26595.patch

diff --git a/meta/recipes-graphics/xwayland/xwayland/CVE-2025-26595.patch b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-26595.patch
new file mode 100644
index 0000000000..a7478d9e2a
--- /dev/null
+++ b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-26595.patch
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
diff --git a/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb b/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
index 814fc1ce40..452bae8c8d 100644
--- a/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
@@ -31,6 +31,7 @@ SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz \
            file://CVE-2024-9632.patch \
            file://CVE-2025-26594-1.patch \
            file://CVE-2025-26594-2.patch \
+           file://CVE-2025-26595.patch \
 "
 SRC_URI[sha256sum] = "d11eeee73290b88ea8da42a7d9350dedfaba856ce4ae44e58c045ad9ecaa2f73"
 
-- 
2.43.0


