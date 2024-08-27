Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85699C52D6F
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 05:24:19 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.71685.1724736258598714512
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Aug 2024 22:24:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hE2oZW/f;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a7aa086b077so447904366b.0
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 22:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724736257; x=1725341057; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/z31p4ECN2qRz7mLqdUT7YuYato9gNkBRNLODhv7PzY=;
        b=hE2oZW/fjs2CBP9R1+uuTtEx8Y2R62wsgBmKLrRYu+NKE1AmK4iIyZY1dE503IzX2O
         zL3/dr26nw4AN07VwlpHI8g9UdK/5/baB3i+Z+YIU7YRg6N2rPFp7lhrcf3tmmeWMJ/x
         PmzSMaVzYkPxBbles1uJ/gYGiM93nXgNGz1ak20G6MZy7dCymymUp5ShOOai//EiBS7l
         hGTnSPkpXbdCwCvJvGp4Vk2zRHKvdlDIYDjLwpOR189RCEm3sj8m3O0jHnY/i8qwgyMh
         Irabas+svgo+cV/7oCx3cGq6G2LhImx4D51ym769y6SJwN9CCMY9S+xx8Jn0Kn79y30E
         zVTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724736257; x=1725341057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/z31p4ECN2qRz7mLqdUT7YuYato9gNkBRNLODhv7PzY=;
        b=oHoDKNKabfs5ltjNCI1Zo5N1TR+ztzaf2iqgj1xGzaGg0oNxQP8M020+9zzLj2qoyN
         0m13dd/Es0iuSsxxrdrSrdSkfDmK/jg0UGscIj66kGw7zQTrJ3uZLti5x8z1exEtdBGO
         HBrn2NFWhHhOznQuLQ1cZip/h9dQkgFbUL0BZBGUHIo1x5QHi5jfojV62+cu9kylUy1B
         TbRuUvWrzX/1e92S78eUeEAOfGGPFJCnLu0KvjmHiStXuhfjhLmHNgldqj6faBZ04ryu
         im9aq64cabG3Gh4ZXRKSaMveSOUTlC2fEfoiRzVUqY5PHgpIL1xhguEnpD4fUcjy2wm+
         v0Mg==
X-Gm-Message-State: AOJu0YyVXcXOMcoZrqsKEPGWuE9WWSWeNkeAgKyiX8DePtwCZcSjXiwC
	aN3/ZGS8VMLp0tMWqEMvv6fZ8H1PwEJAxsQVSp9dHr0JiGbFn16FyMv+4w==
X-Google-Smtp-Source: AGHT+IFe5J/mzAx/1q/fRzcVapJQ1nT+cuxJWZsqNw46qd43hB4IX+8wzkLZESJx701RV5kH1OBmIw==
X-Received: by 2002:a17:907:efcb:b0:a86:7adb:b327 with SMTP id a640c23a62f3a-a86a530135dmr854788466b.40.1724736256759;
        Mon, 26 Aug 2024 22:24:16 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a86e675aa07sm57704166b.17.2024.08.26.22.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 22:24:16 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 33/34] vte: upgrade 0.74.2 -> 0.76.3
Date: Tue, 27 Aug 2024 07:23:53 +0200
Message-Id: <20240827052354.1319810-33-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240827052354.1319810-1-alex.kanavin@gmail.com>
References: <20240827052354.1319810-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 05:24:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203809

From: Alexander Kanavin <alex@linutronix.de>

lz4 is a new required dependency.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...1-Add-W_EXITCODE-macro-for-non-glibc-systems.patch | 11 ++++-------
 .../vte/{vte_0.74.2.bb => vte_0.76.3.bb}              |  4 ++--
 2 files changed, 6 insertions(+), 9 deletions(-)
 rename meta/recipes-support/vte/{vte_0.74.2.bb => vte_0.76.3.bb} (95%)

diff --git a/meta/recipes-support/vte/vte/0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch b/meta/recipes-support/vte/vte/0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch
index 8934d5f80a6..e2cff6cf764 100644
--- a/meta/recipes-support/vte/vte/0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch
+++ b/meta/recipes-support/vte/vte/0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch
@@ -1,4 +1,4 @@
-From de9639baac792327c701e509258b8a13f6959e82 Mon Sep 17 00:00:00 2001
+From b8795dda629614cd842fcba1c4b50be759c20da4 Mon Sep 17 00:00:00 2001
 From: Danilo Spinella <danyspin97@protonmail.com>
 Date: Thu, 21 Mar 2019 14:19:26 +0100
 Subject: [PATCH] Add W_EXITCODE macro for non-glibc systems
@@ -12,11 +12,11 @@ Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
 
 [1] https://gitlab.gnome.org/GNOME/vte/issues/72
 ---
- src/widget.cc  | 4 +++
- 1 files changed, 4 insertions(+)
+ src/widget.cc | 4 ++++
+ 1 file changed, 4 insertions(+)
 
 diff --git a/src/widget.cc b/src/widget.cc
-index 07f7cabf..31a77f68 100644
+index b8daa5c..c357960 100644
 --- a/src/widget.cc
 +++ b/src/widget.cc
 @@ -16,6 +16,10 @@
@@ -30,6 +30,3 @@ index 07f7cabf..31a77f68 100644
  #include "config.h"
  
  #include "widget.hh"
--- 
-2.42.0
-
diff --git a/meta/recipes-support/vte/vte_0.74.2.bb b/meta/recipes-support/vte/vte_0.76.3.bb
similarity index 95%
rename from meta/recipes-support/vte/vte_0.74.2.bb
rename to meta/recipes-support/vte/vte_0.76.3.bb
index d8eafde2fb0..515ff228fd4 100644
--- a/meta/recipes-support/vte/vte_0.74.2.bb
+++ b/meta/recipes-support/vte/vte_0.76.3.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = " \
     file://COPYING.XTERM;md5=d7fc3a23c16c039afafe2e042030f057 \
 "
 
-DEPENDS = "glib-2.0 glib-2.0-native gtk+3 libpcre2 libxml2-native gperf-native icu"
+DEPENDS = "glib-2.0 glib-2.0-native gtk+3 libpcre2 libxml2-native gperf-native icu lz4"
 
 GIR_MESON_OPTION = 'gir'
 GIDOCGEN_MESON_OPTION = "docs"
@@ -19,7 +19,7 @@ GIDOCGEN_MESON_OPTION = "docs"
 inherit gnomebase gi-docgen features_check upstream-version-is-even gobject-introspection systemd vala
 
 SRC_URI += "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch"
-SRC_URI[archive.sha256sum] = "a535fb2a98fea8a2449cd1a02cccf5190131dddff52e715afdace3feb536eae7"
+SRC_URI[archive.sha256sum] = "f678e94c056f377fd0021214adff5450cb172e9a08b160911181ddff7b7d5d60"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-- 
2.39.2


