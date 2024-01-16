Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E310C47258
	for <webhook@archiver.kernel.org>; Tue, 16 Jan 2024 11:08:24 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web11.10816.1705403300371707637
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jan 2024 03:08:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O8ZOYHaM;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-553ba2f0c8fso10812156a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 03:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705403299; x=1706008099; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a66iD8JvlCXMDUqR6vSPEPuC3qKTzfWLPBuLvhOVTf0=;
        b=O8ZOYHaM4CR51RJlCr6jiATRJEwLRTwrU0odbIFwcYSK5fZCIPZQK0TKYjScjV9AkJ
         VAkeE06OMbMsKGib/yrb0k3HmxwMqtK2SYNCE3IOUrd4PLQJGOxN58r5piUkma1n/5Yo
         3xfVoYttVz1vazqs5lC1MDzO1HsYyIGnqsYRPvLheYwzTRAaVKgaFURFIx7eAXyL119/
         1PMObo6ZUUeq5wtsuisJsz3beL8SYH2cfDi75tHMjtyXXPenBhjuz5LUH9/m4NEqbtFJ
         vonikNQ/s4Z7XKxfcF0UYsjLi+/u74zM8L9Jv//4qIAOHovPbOx0aUPMvK6S9oEu8cYa
         HRJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705403299; x=1706008099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a66iD8JvlCXMDUqR6vSPEPuC3qKTzfWLPBuLvhOVTf0=;
        b=Qa7i3KUG1FlHCZZ0fDo7nUNtCWD/E8goEUIfZXnBGhBRsfvElZ+pQiZX1PQnyrSIyN
         6a+FRIaMxYIirAt73q9wPNoUKTADT9psaIodAXvD4jyHuKVwgMrlVzOHOAtcHmAUGTVS
         tajzwZQgJgZaAMR+uYE2ChlDR5z0DdrOxp2Jx03pTjNTMfB9BESZoI0arzUG2P97X2pe
         XZkRNc+zEfeu8PnHjvBMmDs15uiqDDlDg49kAMKlji+j94dW909Mj2hUzZVE1uthATPx
         /8hxHehvwDASrrLcPBQN0H9g1bxTKe3rVaHeGnVqHoKr1L43R0Pe82yUg+rJYppJ1fJa
         4DyA==
X-Gm-Message-State: AOJu0YyPYzVuoQzeQCbWHJJ2qv+hKWQhyLN+dZ1y7iZgn/CC8eU/fSRo
	6ge/hY/8/sMVzMmdT1JyBANTXsgB09I=
X-Google-Smtp-Source: AGHT+IE8Bg2Ki8s95weRZlaf7wFBXVvsv2ylkZ+QthEILyOl2G11/oy8cRQ81UXYNm/6SJKxA5j4uw==
X-Received: by 2002:a17:906:ff53:b0:a2a:4376:68aa with SMTP id zo19-20020a170906ff5300b00a2a437668aamr1769122ejb.158.1705403298551;
        Tue, 16 Jan 2024 03:08:18 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id l16-20020a1709067d5000b00a26f6b8be1csm6327937ejp.75.2024.01.16.03.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jan 2024 03:08:18 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2 2/3] gobject-introspection-data.bbclass: move do_compile() tweak to g-i class
Date: Tue, 16 Jan 2024 12:08:13 +0100
Message-Id: <20240116110814.1052866-2-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240116110814.1052866-1-alex@linutronix.de>
References: <20240116110814.1052866-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 11:08:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193855

g-i-data class is strictly for setting GI_DATA_ENABLED. Any build tweaks
should be in g-i class.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes-recipe/gobject-introspection-data.bbclass | 5 -----
 meta/classes-recipe/gobject-introspection.bbclass      | 5 +++++
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/classes-recipe/gobject-introspection-data.bbclass b/meta/classes-recipe/gobject-introspection-data.bbclass
index 7f522a1ed32..aa04c70ca6c 100644
--- a/meta/classes-recipe/gobject-introspection-data.bbclass
+++ b/meta/classes-recipe/gobject-introspection-data.bbclass
@@ -11,8 +11,3 @@
 # so that qemu use can be avoided when necessary.
 GI_DATA_ENABLED ?= "${@bb.utils.contains('DISTRO_FEATURES', 'gobject-introspection-data', \
                       bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', 'True', 'False', d), 'False', d)}"
-
-do_compile:prepend() {
-    # This prevents g-ir-scanner from writing cache data to $HOME
-    export GI_SCANNER_DISABLE_CACHE=1
-}
diff --git a/meta/classes-recipe/gobject-introspection.bbclass b/meta/classes-recipe/gobject-introspection.bbclass
index 65c67ddc721..d0052cd6231 100644
--- a/meta/classes-recipe/gobject-introspection.bbclass
+++ b/meta/classes-recipe/gobject-introspection.bbclass
@@ -50,6 +50,11 @@ do_configure:prepend:class-target () {
     cp ${STAGING_DIR_NATIVE}/${datadir}/aclocal/introspection.m4 ${S}/m4
 }
 
+do_compile:prepend() {
+    # This prevents g-ir-scanner from writing cache data to $HOME
+    export GI_SCANNER_DISABLE_CACHE=1
+}
+
 # .typelib files are needed at runtime and so they go to the main package (so
 # they'll be together with libraries they support).
 FILES:${PN}:append = " ${libdir}/girepository-*/*.typelib" 
-- 
2.39.2


