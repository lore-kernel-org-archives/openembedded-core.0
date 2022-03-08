Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2665BC433EF
	for <webhook@archiver.kernel.org>; Tue,  8 Mar 2022 09:32:39 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web12.6469.1646731958557589090
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Mar 2022 01:32:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fUaMAhgJ;
 spf=pass (domain: gmail.com, ip: 209.85.218.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id bi12so24699686ejb.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Mar 2022 01:32:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=H/Yc/Bt3Dqimfig6zBHWQ1jTqn5I3PllOLKznmU2s58=;
        b=fUaMAhgJhweuX0gwgSu6sO4CIvAxu+YqpOLbaQRHavKdjiFExRxMDx/Rwv8mlzl3Dj
         DGgBJ8oBINJdsxIEKnao7/JzedDuZv79GGUO5CJ+aZOpJh/IPyZ8PNmhTwAksMoBVOQp
         F70WBHJ7SGYMzc/ENdQJSDHnRxSX5crXRJDDrPl2TEww7H3Staw4YJ+fGx8HgsO8lqPz
         1iw9XSZHFvu2qmTorC0UmfPjRKi6v1zNwBzY/vb3b1s9CYFYYzSu/GokcK7PEzAVE5Rh
         XhzXi5n6huP6Kdz+y+og/wP4+3xP2DVt6ZGwPvvrwgz0op5p/qQaUO9BbqDOUc8nx2Qr
         MEEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=H/Yc/Bt3Dqimfig6zBHWQ1jTqn5I3PllOLKznmU2s58=;
        b=ZeDp25bNAIDnNUVIrNhFEpApP8vgYyAYH4mY4wicXqm7BR0I6p0ACotUnAmvG8piYY
         LUoWADSmO+qWyiUlBmpAZBywXMv4BhfR+RGfjiKGNHhTQSbNVT6UiN+gvToldqdPd+pw
         Pu2+FtHjvCxysyLVuue/sQ5STbRsWTztXsv5/gj8d6AAOZxhkJpeVA0aNtDrPAzT5Blt
         MyPIrklZpmX76rSKknQOzx9hKVIEUiW2LH3V6DrZ6bJIkQ4qHGiIBeylNQCmSOCbR07S
         IC7gT9GYYkH4OPcUhSthENfw9Ljxi3hillbnJL9YN0AkG0rBW8Ik0Rn5kdKRrJCnrynk
         WQ1A==
X-Gm-Message-State: AOAM532bOiI5SumTXmBvvvYh92AHLlEmxlZw0mjuzIjLX6WVSXEvN6a4
	lU8f8TcldxA1sczLPEyDjK1hISTq9UQ=
X-Google-Smtp-Source: 
 ABdhPJy2cJc1p6eJwFyShVIEwMNiWwSGZxG1vfIJ+1iKDTbiGI3Xh9x6nnh9W+t/TijWdOunftG6Lw==
X-Received: by 2002:a17:906:2bc5:b0:6cd:e676:3624 with SMTP id
 n5-20020a1709062bc500b006cde6763624mr12571627ejg.277.1646731957072;
        Tue, 08 Mar 2022 01:32:37 -0800 (PST)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 g22-20020a170906395600b006cec40b9cf0sm5640178eje.92.2022.03.08.01.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 01:32:36 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 12/16] libsecret: upgrade 0.20.4 -> 0.20.5
Date: Tue,  8 Mar 2022 10:32:20 +0100
Message-Id: <20220308093224.3436483-12-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220308093224.3436483-1-alex@linutronix.de>
References: <20220308093224.3436483-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Mar 2022 09:32:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162889

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libsecret/libsecret/determinism.patch     | 37 -------------------
 ...ibsecret_0.20.4.bb => libsecret_0.20.5.bb} |  6 +--
 2 files changed, 2 insertions(+), 41 deletions(-)
 delete mode 100644 meta/recipes-gnome/libsecret/libsecret/determinism.patch
 rename meta/recipes-gnome/libsecret/{libsecret_0.20.4.bb => libsecret_0.20.5.bb} (83%)

diff --git a/meta/recipes-gnome/libsecret/libsecret/determinism.patch b/meta/recipes-gnome/libsecret/libsecret/determinism.patch
deleted file mode 100644
index ad96e8f59b..0000000000
--- a/meta/recipes-gnome/libsecret/libsecret/determinism.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-secret-enum-types.c/h.template: Fix reproducibility issue 
-
-When full filenames are used in generated sources it makes the resulting
-debug packages non-reproducible. Best practise is to use basename in
-comments instead.
-
-Signed-off-by: Richard Purdie richard.purdie@linuxfoundation.org
-Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/libsecret/-/merge_requests/68]
-
-Index: libsecret-0.20.4/libsecret/secret-enum-types.c.template
-===================================================================
---- libsecret-0.20.4.orig/libsecret/secret-enum-types.c.template
-+++ libsecret-0.20.4/libsecret/secret-enum-types.c.template
-@@ -23,8 +23,8 @@
- /*** END file-header ***/
- 
- /*** BEGIN file-production ***/
--#include "@filename@"
--/* enumerations from "@filename@" */
-+#include "@basename@"
-+/* enumerations from "@basename@" */
- /*** END file-production ***/
- 
- /*** BEGIN value-header ***/
-Index: libsecret-0.20.4/libsecret/secret-enum-types.h.template
-===================================================================
---- libsecret-0.20.4.orig/libsecret/secret-enum-types.h.template
-+++ libsecret-0.20.4/libsecret/secret-enum-types.h.template
-@@ -27,7 +27,7 @@ G_BEGIN_DECLS
- 
- /*** BEGIN file-production ***/
- 
--/* enumerations from "@filename@" */
-+/* enumerations from "@basename@" */
- /*** END file-production ***/
- 
- /*** BEGIN value-header ***/
diff --git a/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb b/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb
similarity index 83%
rename from meta/recipes-gnome/libsecret/libsecret_0.20.4.bb
rename to meta/recipes-gnome/libsecret/libsecret_0.20.5.bb
index 39ecdd770a..9b09c3bee4 100644
--- a/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb
+++ b/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb
@@ -10,13 +10,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=23c2a5e0106b99d75238986559bb5fc6"
 
 GNOMEBASEBUILDCLASS = "meson"
 
-inherit gnomebase gtk-doc vala gobject-introspection manpages
+inherit gnomebase gi-docgen vala gobject-introspection manpages
 
 DEPENDS += "glib-2.0 libgcrypt gettext-native"
 
-SRC_URI += " file://determinism.patch"
-
-SRC_URI[archive.sha256sum] = "325a4c54db320c406711bf2b55e5cb5b6c29823426aa82596a907595abb39d28"
+SRC_URI[archive.sha256sum] = "3fb3ce340fcd7db54d87c893e69bfc2b1f6e4d4b279065ffe66dac9f0fd12b4d"
 
 GTKDOC_MESON_OPTION = 'gtk_doc'
 
-- 
2.30.2


