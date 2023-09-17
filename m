Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7468CD13DA
	for <webhook@archiver.kernel.org>; Sun, 17 Sep 2023 09:39:26 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web11.27421.1694943561337163591
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Sep 2023 02:39:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Agi2g1h7;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-52f9a45b4bdso4270971a12.3
        for <openembedded-core@lists.openembedded.org>; Sun, 17 Sep 2023 02:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694943560; x=1695548360; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IMm7+/NV/WdTnhZF+Ahp1g//QHDiig8jIZ7H7mfYEAs=;
        b=Agi2g1h7uwe+KQXIfmErEzlSAMTQnKGBo8H5HhAtKQBntRFhyVHJgxixDanHUO4K2r
         2fXPgUBi+zUGnmcL6fKthpn6dMhQlQfxrhkcpaNXZ2bF7YFEOoPwG3WTp8ZSTbqBXHkA
         0ct+r32UV/4//rg/zvaV9ymcMvWuPHUJK20gDumTVrZ9bLTZ+Xls+qAlSQIEYG1W1D+s
         bUZQ5/lcXIvWWq/YAfnzNaArL+RyoEkP8WeY4zlCNCPVrM4ST/r9XI9sVnE+ttkbLsMY
         W66yJsH4HdXDTTvBp8qKv7xr4wSgSX7I3CLzpdZNuKPeKu21Xf8aJwIP4VoZ1QlRdCoO
         3/uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694943560; x=1695548360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IMm7+/NV/WdTnhZF+Ahp1g//QHDiig8jIZ7H7mfYEAs=;
        b=W09QtSIAssNdO1MpBd3fZdBmpiLEPgsfM3XT9fAdJK5OqeJwJsz68JB1QLgi1RatEM
         Z5UABaHFq3w3u846NIowGmhcOU1Rd295PD/7VQ0sNPWxVcVVXXayTlib1ztYqRHlex/m
         JLNHLpVNHbWrESts+1p28QedsTGbF3HUtYuS5WPFlWXJOX2fbMWVJkFctq/DHR9fgpK3
         HJiNp+R0vsA8XxffjxpBAlehevpcaoddvu2buzx4KFBWbj/vlmEfQZtW57Mpa5KxQAik
         vfGAy5RDrQCHe1F1ZWtm/wwf2fDmozMK0n9wzK9qGWnAIHfo8uzMZ5HnQomGOG0gXxZY
         rbEw==
X-Gm-Message-State: AOJu0Yx3W3sxhidOGrYAkufoZCnS/61aFR73TxWxdLlMk5V2BZhnRVrw
	6M5X91sBvpwGgCl5cPX+A4arzlwDYUA=
X-Google-Smtp-Source: AGHT+IG/j6+McpKTcfydbLNx+R0ne5xLEkuf0x1ik0DSKtJMV+oRW8hf/E07zO2Qxhw4murf6ujuhw==
X-Received: by 2002:a17:907:b0c:b0:9ad:a46c:2936 with SMTP id h12-20020a1709070b0c00b009ada46c2936mr5691814ejl.8.1694943559641;
        Sun, 17 Sep 2023 02:39:19 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id d8-20020a17090694c800b0099ce188be7fsm4779683ejy.3.2023.09.17.02.39.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Sep 2023 02:39:19 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 25/29] gobject-introspection: update 1.76.1 -> 1.78.0
Date: Sun, 17 Sep 2023 11:38:57 +0200
Message-Id: <20230917093901.428214-25-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230917093901.428214-1-alex@linutronix.de>
References: <20230917093901.428214-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Sep 2023 09:39:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187798

Remove patch as issue fixed upstream.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...pository-directory-for-native-builds.patch |  2 +-
 ...-ir-tool-template.in-fix-girdir-path.patch | 33 -------------------
 ...6.1.bb => gobject-introspection_1.78.0.bb} |  3 +-
 3 files changed, 2 insertions(+), 36 deletions(-)
 delete mode 100644 meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-g-ir-tool-template.in-fix-girdir-path.patch
 rename meta/recipes-gnome/gobject-introspection/{gobject-introspection_1.76.1.bb => gobject-introspection_1.78.0.bb} (98%)

diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Relocate-the-repository-directory-for-native-builds.patch b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Relocate-the-repository-directory-for-native-builds.patch
index 9ba8bcfd71a..c9e1afffd0f 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Relocate-the-repository-directory-for-native-builds.patch
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Relocate-the-repository-directory-for-native-builds.patch
@@ -1,4 +1,4 @@
-From 2c31944eabbb42a86a4ddaa2998a3b100a13138d Mon Sep 17 00:00:00 2001
+From aeb5532f8be42d42f4e8725ca42e239b36983a4d Mon Sep 17 00:00:00 2001
 From: Sascha Silbe <x-yo17@se-silbe.de>
 Date: Fri, 8 Jun 2018 13:55:10 +0200
 Subject: [PATCH] Relocate the repository directory for native builds
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-g-ir-tool-template.in-fix-girdir-path.patch b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-g-ir-tool-template.in-fix-girdir-path.patch
deleted file mode 100644
index 5c78649de48..00000000000
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-g-ir-tool-template.in-fix-girdir-path.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From b01b448613b76f9acefdfd89ee01686dc7a67df4 Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Tue, 13 Jul 2021 02:05:11 -0700
-Subject: [PATCH] g-ir-tool-template.in: fix girdir path
-
-In case gir_dir_prefix is set, it's possible that g-ir-scanner
-cannot find the .gir files. This is because that the girdir
-is set to gir_dir_prefix, which is wrong. It's not a prefix,
-it the actual gir dir.
-
-Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/gobject-introspection/-/merge_requests/329]
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- tools/g-ir-tool-template.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tools/g-ir-tool-template.in b/tools/g-ir-tool-template.in
-index 6e98f52e..62c07c31 100755
---- a/tools/g-ir-tool-template.in
-+++ b/tools/g-ir-tool-template.in
-@@ -55,7 +55,7 @@ builtins.__dict__['DATADIR'] = datadir
- 
- # Respect gir_dir_prefix
- girdir = ''
--girdir = os.path.abspath(os.path.join(filedir, '..', '@gir_dir_prefix@'))
-+girdir = os.path.abspath(os.path.join(filedir, '..', '@gir_dir_prefix@', 'gir-1.0'))
- builtins.__dict__['GIRDIR'] = [girdir]
- 
- # Again, relative paths first so that the installation prefix is relocatable
--- 
-2.30.2
-
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.0.bb
similarity index 98%
rename from meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb
rename to meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.0.bb
index 6d006338251..42b0979aafd 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.0.bb
@@ -14,10 +14,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c434e8128a68bedd59b80b2ac1eb1c4a \
                     "
 
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${@oe.utils.trim_version("${PV}", 2)}/${BPN}-${PV}.tar.xz \
-           file://0001-g-ir-tool-template.in-fix-girdir-path.patch \
            "
 
-SRC_URI[sha256sum] = "196178bf64345501dcdc4d8469b36aa6fe80489354efe71cb7cb8ab82a3738bf"
+SRC_URI[sha256sum] = "84f5bd2038bd52abbce74a639832c5b46a2d17e9c5a8ae14f9788e8516c04166"
 
 SRC_URI:append:class-native = " file://0001-Relocate-the-repository-directory-for-native-builds.patch"
 
-- 
2.30.2


