Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC93CC25B7A
	for <webhook@archiver.kernel.org>; Mon, 20 May 2024 13:34:16 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.61069.1716212050101493600
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 May 2024 06:34:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Ksvv5nUk;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1ed0abbf706so6953825ad.2
        for <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 06:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1716212049; x=1716816849; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kdGD/T1O2OVStI4Wtg0Xs3NP+tSmGxTE7zQi4BGAKRI=;
        b=Ksvv5nUk/Cr4VjQaYBtIqUqJ5JQYmc2evzMKUNjnj2gzweJfSKH+CI0yLLMP4XJ4Ie
         0/UcUf9FqoQ98FxSjNxW8lhZ3Xg+SJhY/XUBm3jHac4asctSBV8iPM0jRTEwkOsp0opq
         8Ty71TapA4ZlPXHTlxwUfKhJWVcygJNY4H6LFgF5g9khClF0RXSIr4RUHykfn0gfEIW6
         E/Ig/6tmdGTFLzCStLevAOmvKyVwBBN5Z5c0aA09VpNRcO29+TysU+63jHV3i929HhoG
         S8rtZIcVaC7gsiT1EWZrUe99grvz49eXzX3CXnie33vnwL/V9A+mc63JgNfpak0BLEHy
         dyXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716212049; x=1716816849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kdGD/T1O2OVStI4Wtg0Xs3NP+tSmGxTE7zQi4BGAKRI=;
        b=n9onncVYsnjCK3a1tWq3sYZSP+WpF6Wd4M5klq/gOgz0CEUGdB1LUIgyK32EEB24Q9
         M9tJfcfDxv8y/qhiXlfhQbHh3XHBn1Faci8lzXf+vmUKru+vyzlXyzS1zivpBUiYI0rh
         Wl1IFFuugFPSiEgVRdLUg08NVmn8egY0IaGwEdCDA1rV2EZ4Gua7DJAksRy8es5u68Ql
         D/HdeyAhOvrOACe1V8yeYdXCw1hpRUWz+Q+jPB5M5MIWfVfHdJosuvK2CulT+aNssKEZ
         KTbQXiHYZs+s4ER846JyRA0cAGmcVtE6q5DexNyzStDHWVp9Ow7DG26FGGqbgVAv3rnU
         Sa1A==
X-Gm-Message-State: AOJu0YxcYc+DEKvyPdBceACfhrrZnKQn5P27wsGldW/bPvij98XAEFY2
	BLXhMOnmmL2hoz+V+10iEhqVh/913XkzQx4cs2QL8fbjMNDrGDwBpar3UchdfbKYvdL8+rppfPj
	N
X-Google-Smtp-Source: AGHT+IF+8pIPjW3yLiuefS3723p/kwg5ew2E5ML6a2G29UGqcZbwOBIvDjAE5lOWhd8WUsU+WUAxYw==
X-Received: by 2002:a05:6a21:789f:b0:1af:cdd4:9bf3 with SMTP id adf61e73a8af0-1afde10f1b3mr34257113637.32.1716212049349;
        Mon, 20 May 2024 06:34:09 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2a66621sm19671465b3a.13.2024.05.20.06.34.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 06:34:09 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 21/21] oeqa/selftest/debuginfod: use localpkgfeed to speed server startup
Date: Mon, 20 May 2024 06:33:32 -0700
Message-Id: <0795169be206f1d4d140fe378e2476a44d0ce02b.1716211838.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1716211838.git.steve@sakoman.com>
References: <cover.1716211838.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 13:34:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199592

From: Ross Burton <ross.burton@arm.com>

Sometimes the debuginfod selftest fails due to a timeout, because it
spends too long scanning a huge deploy directory that due to what tests
were ran previously can contain 30K packages.

The test only needs a subset of the feed, so use the new localpkgfeed
class to construct a minimal feed before running the test.

[ YOCTO #14937 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 855376f518b28248ccd82ef5b2e89e6a8c970542)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/debuginfod.py | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/debuginfod.py b/meta/lib/oeqa/selftest/cases/debuginfod.py
index 505b4be837..46c0cd87bb 100644
--- a/meta/lib/oeqa/selftest/cases/debuginfod.py
+++ b/meta/lib/oeqa/selftest/cases/debuginfod.py
@@ -62,7 +62,7 @@ class Debuginfod(OESelftestTestCase):
 
         raise TimeoutError("Cannot connect debuginfod, still %d scan jobs running" % latest)
 
-    def start_debuginfod(self):
+    def start_debuginfod(self, feed_dir):
         # We assume that the caller has already bitbake'd elfutils-native:do_addto_recipe_sysroot
 
         # Save some useful paths for later
@@ -82,7 +82,7 @@ class Debuginfod(OESelftestTestCase):
             # Disable rescanning, this is a one-shot test
             "--rescan-time=0",
             "--groom-time=0",
-            get_bb_var("DEPLOY_DIR"),
+            feed_dir,
         ]
 
         format = get_bb_var("PACKAGE_CLASSES").split()[0]
@@ -114,11 +114,12 @@ class Debuginfod(OESelftestTestCase):
         self.write_config("""
 TMPDIR = "${TOPDIR}/tmp-debuginfod"
 DISTRO_FEATURES:append = " debuginfod"
+INHERIT += "localpkgfeed"
 """)
-        bitbake("elfutils-native:do_addto_recipe_sysroot xz xz:do_package")
+        bitbake("elfutils-native:do_addto_recipe_sysroot xz xz:do_package xz:do_localpkgfeed")
 
         try:
-            self.start_debuginfod()
+            self.start_debuginfod(get_bb_var("LOCALPKGFEED_DIR", "xz"))
 
             env = os.environ.copy()
             env["DEBUGINFOD_URLS"] = "http://localhost:%d/" % self.port
@@ -141,12 +142,13 @@ DISTRO_FEATURES:append = " debuginfod"
         self.write_config("""
 TMPDIR = "${TOPDIR}/tmp-debuginfod"
 DISTRO_FEATURES:append = " debuginfod"
+INHERIT += "localpkgfeed"
 CORE_IMAGE_EXTRA_INSTALL += "elfutils xz"
         """)
-        bitbake("core-image-minimal elfutils-native:do_addto_recipe_sysroot")
+        bitbake("core-image-minimal elfutils-native:do_addto_recipe_sysroot xz:do_localpkgfeed")
 
         try:
-            self.start_debuginfod()
+            self.start_debuginfod(get_bb_var("LOCALPKGFEED_DIR", "xz"))
 
             with runqemu("core-image-minimal", runqemuparams="nographic") as qemu:
                 cmd = "DEBUGINFOD_URLS=http://%s:%d/ debuginfod-find debuginfo /usr/bin/xz" % (qemu.server_ip, self.port)
-- 
2.34.1


