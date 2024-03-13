Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0B95C54E77
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 17:33:57 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web11.2040.1710351227633678262
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Mar 2024 10:33:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Kg1qrlPP;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-512f3e75391so117556e87.2
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 10:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710351226; x=1710956026; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GtW7A8H8wjodmYl6zp5Gem9+jUyFcNk+tj28V6p1wHY=;
        b=Kg1qrlPPRrqdA+UbDIrhoSUxzoNheb8pZEE/jeo3iiSBXMeIOZlDned4GegI16uxhK
         bogZimFQyK6D67Qq7bc8bPY0anG0G732QMenMB6xzWBfcb6Pm7MyXjqIec2dvkZcIkQw
         Ba4Z+pRxova+GlF/Co/+cO/p9PcgYW1Ur+yftIiZROFbw1FIj6vs+S5DuNu1IaAgy47a
         vstphLKS9GpYOVjBqzvPScXHm/Lt+TbEkEYN5k5/ozwvaDCS0cCHe2DEDtm4sK0z4l7h
         UR7aFA2zrmpNBLE1jZSx4IYcg4i9Qj9t3mmWHd2QijCqLK+J4dsw4u0AqXc66vrknEJO
         v0tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710351226; x=1710956026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GtW7A8H8wjodmYl6zp5Gem9+jUyFcNk+tj28V6p1wHY=;
        b=k/cg+Go31cxpGOXvK/SEp6lcn0WWHofNK1utszT32x8khsTzb2/B6/UgGBeFmqPUSP
         8MSNKv2o+ykfjDBmAJZhvU6XnJpxxUIcyKXRMUQCeb7mlwKKa4uLE3G7nwrEGpB5rTFu
         Demcb1rA7zd+XSYaioy16inw3KOxkl3ZCy7kU3aRPcBzLgqtGRjvja2DKswvC52aGSJE
         kTm/MVhozCk2FpFaA2kvGnqRHEJDSHNcTWHD1vXPhEV2sOMBAxmnGUI05uTfPt7vgE5D
         46jkfj97dW8pSltQdiL+KtVZtUUHtCh0Cm6H+/sHqJ3SM1UApAz8dxLY2Kwxlz+XpEqQ
         a+zw==
X-Gm-Message-State: AOJu0Yx3EiRdJKKqGDX98d+oIy3Rl0DugZa4no9rivZsCpVe21+sOlIL
	1z+3cWpED9aIFiBa2YTpRAVvjKs0ZvSDIl/f6XWSU+5SJHJTv0KA/tcl9x5d
X-Google-Smtp-Source: AGHT+IHFbp/okpM/mwDKS5GmZZzE6/bblqi2jdZPkriW5Cr67pQ+YEw0yF5cARkNZHEG0he+aBihRA==
X-Received: by 2002:ac2:58ec:0:b0:513:a7ce:5264 with SMTP id v12-20020ac258ec000000b00513a7ce5264mr3354623lfo.44.1710351225736;
        Wed, 13 Mar 2024 10:33:45 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id l5-20020a05600c1d0500b00412ea52b102sm2989710wms.34.2024.03.13.10.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 10:33:45 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 10/21] libtraceevent: update 1.7.3 -> 1.8.2
Date: Wed, 13 Mar 2024 18:33:25 +0100
Message-Id: <20240313173336.3900178-10-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240313173336.3900178-1-alex@linutronix.de>
References: <20240313173336.3900178-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 17:33:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197062

Drop docs option from meson.patch, as upstream added a doc
option that does the same thing.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../libtraceevent/libtraceevent/meson.patch   | 47 ++++---------------
 ...eevent_1.7.3.bb => libtraceevent_1.8.2.bb} |  4 +-
 2 files changed, 11 insertions(+), 40 deletions(-)
 rename meta/recipes-kernel/libtraceevent/{libtraceevent_1.7.3.bb => libtraceevent_1.8.2.bb} (89%)

diff --git a/meta/recipes-kernel/libtraceevent/libtraceevent/meson.patch b/meta/recipes-kernel/libtraceevent/libtraceevent/meson.patch
index 38b6107136f..0c21b2347a1 100644
--- a/meta/recipes-kernel/libtraceevent/libtraceevent/meson.patch
+++ b/meta/recipes-kernel/libtraceevent/libtraceevent/meson.patch
@@ -1,14 +1,20 @@
-Fixes for the Meson build of libtraceevent:
+From 7f88c9ba5f27276e844252500a9f0ba2b350b919 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Sun, 27 Aug 2023 20:57:44 +0100
+Subject: [PATCH] Fixes for the Meson build of libtraceevent:
 
 - Make the plugin directory the same as the Makefiles
 - Install the plugins as modules not static and versioned shared libraries
-- Add an option to disable building the documentation (needs asciidoc and xmlto)
 
 Upstream-Status: Pending
 Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ meson.build         | 2 +-
+ plugins/meson.build | 3 +--
+ 2 files changed, 2 insertions(+), 3 deletions(-)
 
 diff --git a/meson.build b/meson.build
-index b61c873..4bba4d8 100644
+index 40ce38c..1eb7912 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -25,7 +25,7 @@ htmldir = join_paths(prefixdir, get_option('htmldir'))
@@ -20,41 +26,6 @@ index b61c873..4bba4d8 100644
  endif
  
  add_project_arguments(
-@@ -45,10 +45,13 @@ if cunit_dep.found()
-     subdir('utest')
- endif
- subdir('samples')
--subdir('Documentation')
- 
--custom_target(
--    'docs',
--    output: 'docs',
--    depends: [html, man],
--    command: ['echo'])
-+if get_option('docs')
-+    subdir('Documentation')
-+
-+    custom_target(
-+        'docs',
-+        output: 'docs',
-+        depends: [html, man],
-+        command: ['echo'])
-+endif
-diff --git a/meson_options.txt b/meson_options.txt
-index b2294f6..0611216 100644
---- a/meson_options.txt
-+++ b/meson_options.txt
-@@ -4,6 +4,10 @@
- 
- option('plugindir', type : 'string',
-        description : 'set the plugin dir')
-+
-+option('docs', type : 'boolean', value: true,
-+       description : 'build documentation')
-+
- option('htmldir', type : 'string', value : 'share/doc/libtraceevent-doc',
-        description : 'directory for HTML documentation')
- option('asciidoctor', type : 'boolean', value: false,
 diff --git a/plugins/meson.build b/plugins/meson.build
 index 74ad664..4919be4 100644
 --- a/plugins/meson.build
diff --git a/meta/recipes-kernel/libtraceevent/libtraceevent_1.7.3.bb b/meta/recipes-kernel/libtraceevent/libtraceevent_1.8.2.bb
similarity index 89%
rename from meta/recipes-kernel/libtraceevent/libtraceevent_1.7.3.bb
rename to meta/recipes-kernel/libtraceevent/libtraceevent_1.8.2.bb
index bee7891832a..d4ace548840 100644
--- a/meta/recipes-kernel/libtraceevent/libtraceevent_1.7.3.bb
+++ b/meta/recipes-kernel/libtraceevent/libtraceevent_1.8.2.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSES/GPL-2.0;md5=e6a75371ba4d16749254a51215d13f97
                     file://LICENSES/LGPL-2.1;md5=b370887980db5dd40659b50909238dbd"
 SECTION = "libs"
 
-SRCREV = "dd148189b74da3e2f45c7e536319fec97cb71213"
+SRCREV = "6f6d5802f31992e7527a4c32b43a32fda6bf6bdf"
 SRC_URI = "git://git.kernel.org/pub/scm/libs/libtrace/libtraceevent.git;branch=${BPN};protocol=https \
            file://meson.patch"
 
@@ -16,7 +16,7 @@ S = "${WORKDIR}/git"
 
 inherit meson pkgconfig
 
-EXTRA_OEMESON = "-Ddocs=false"
+EXTRA_OEMESON = "-Ddoc=false"
 
 PACKAGES += "${PN}-plugins"
 
-- 
2.39.2


