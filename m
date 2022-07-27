Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C85EEC3F6B0
	for <webhook@archiver.kernel.org>; Wed, 27 Jul 2022 00:41:56 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web12.14373.1658882501172163838
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jul 2022 17:41:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=P+Q3tQw5;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id ku18so14935261pjb.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jul 2022 17:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=0ro3I/8eCLaC0bFIvHDC2GJYYjRtJxWSg8EGiYzqEK0=;
        b=P+Q3tQw53ZzRbXXbkj2m93fqfVjuWuZaJUsXy/sr5Pm0rI6osTvWKCbJmubk1c6Bar
         6f33CHqyJlEw8HvZZavXkveDNQ5/6lX8DNO0dkrpUMwu14qmVAxcuHFbbFAiXQ2P9aAY
         uRiFtqMxRligXBTp0NkVp5sYqt6M2vPWS2cQh/2lgw7bn12pFFLM9r2Hwb9oeLIZhJmx
         BpO1nVEYRePWVaW7feZV1/XgJyu/O6XnjvfEdwwvbVkBseBWaYHMYC83ghn/Ne+FX2Xy
         iBf1cLOa8VWwvagFNp780rQD390RZ7AFn4UWoWxgf+wqmmLEWfXkwQFleb0ktnfoJ0od
         ENjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0ro3I/8eCLaC0bFIvHDC2GJYYjRtJxWSg8EGiYzqEK0=;
        b=ef556o3Ey0fSAAjK/dRrgugd+hUpPQzRldYis9su7BpJVwYOrnZ297UUm7V8bazy+b
         w7cmG/9EcljYeNiWdvc6kL/aSKkWazrQDJ3Vd2bA9gY9yqPhURtY82/du1msAIftTJIr
         OqoBuqcqdfQYl2pxp7Jm2Yf9z66nEHKGqTbJu4+KgIEzR4i/4rNi8PGlQMT3/DpTokT+
         jn31fHtoo7buoUFD20XvrwW/tWOFvzG2wNnjLnv6H4qzNwwsl2SC5DA7uhd2iKsQfDO7
         6NAIi/RjKWkJ1J93mMDzCfuHnSxoryZcNEf0FFWePeghPJPbDZecWIwqsmeZYQ4FG1/I
         Fn8w==
X-Gm-Message-State: AJIora985k10kM1+B3wVswKp05Ru/YXCcCQGr457o78a2pT4Mb1UVxIN
	zG0QXPPDyIrRYGAHypoqS14LsfNxOtHB9Os3
X-Google-Smtp-Source: 
 AGRyM1tCKEKmK2vlnbGkNz9weKBt0DrIiw1L1PtqmUw4XX6SPdE6OFo8YdR+W7+HsOr2oqEYpeoZRw==
X-Received: by 2002:a17:90b:4f44:b0:1f2:a900:a1e8 with SMTP id
 pj4-20020a17090b4f4400b001f2a900a1e8mr1764142pjb.32.1658882507354;
        Tue, 26 Jul 2022 17:41:47 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 u16-20020a170902e5d000b0015e8d4eb219sm12356278plf.99.2022.07.26.17.41.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 17:41:46 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 13/15] gobject-introspection-data: Disable cache
 for g-ir-scanner
Date: Tue, 26 Jul 2022 14:40:44 -1000
Message-Id: 
 <bb1dc2bbfe268e73008dc37d6b1f83a861b48915.1658882276.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1658882276.git.steve@sakoman.com>
References: <cover.1658882276.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Jul 2022 00:41:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168536

From: Tom Hochstein <tom.hochstein@nxp.com>

An intermittent failure occurs in libical-native do_compile:

| Traceback (most recent call last):
|   File "/.../build/tmp/work/x86_64-linux/libical-native/3.0.14-r0/recipe-sysroot-native/usr/lib/python3.10/shutil.py", line 813, in move
|     os.rename(src, real_dst)
| OSError: [Errno 18] Invalid cross-device link: '/tmp/g-ir-scanner-cache-adxo_2bq' -> '/home/bamboo/.cache/g-ir-scanner/bab9a83d2cd93e62ed005a2c1d4f89ae75c67251'
|
| During handling of the above exception, another exception occurred:
|
| Traceback (most recent call last):
|   File "/.../tmp/work/x86_64-linux/libical-native/3.0.14-r0/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/bin/g-ir-scanner", line 99, in <module>
|     sys.exit(scanner_main(sys.argv))
|   File "/.../tmp/work/x86_64-linux/libical-native/3.0.14-r0/recipe-sysroot-native/usr/lib/gobject-introspection/giscanner/scannermain.py", line 590, in scanner_main
|     transformer = create_transformer(namespace, options)
|   File "/.../tmp/work/x86_64-linux/libical-native/3.0.14-r0/recipe-sysroot-native/usr/lib/gobject-introspection/giscanner/scannermain.py", line 409, in create_transformer
|     transformer.register_include(include_obj)
|   File "/.../tmp/work/x86_64-linux/libical-native/3.0.14-r0/recipe-sysroot-native/usr/lib/gobject-introspection/giscanner/transformer.py", line 140, in register_include
|     self._parse_include(filename)
|   File "/.../tmp/work/x86_64-linux/libical-native/3.0.14-r0/recipe-sysroot-native/usr/lib/gobject-introspection/giscanner/transformer.py", line 230, in _parse_include
|     self._parse_include(dep_filename)
|   File "/.../tmp/work/x86_64-linux/libical-native/3.0.14-r0/recipe-sysroot-native/usr/lib/gobject-introspection/giscanner/transformer.py", line 225, in _parse_include
|     self._cachestore.store(filename, parser)
|   File "/.../tmp/work/x86_64-linux/libical-native/3.0.14-r0/recipe-sysroot-native/usr/lib/gobject-introspection/giscanner/cachestore.py", line 153, in store
|     shutil.move(tmp_filename, store_filename)
|   File "/.../tmp/work/x86_64-linux/libical-native/3.0.14-r0/recipe-sysroot-native/usr/lib/python3.10/shutil.py", line 833, in move
|     copy_function(src, real_dst)
|   File "/.../tmp/work/x86_64-linux/libical-native/3.0.14-r0/recipe-sysroot-native/usr/lib/python3.10/shutil.py", line 435, in copy2
|     copystat(src, dst, follow_symlinks=follow_symlinks)
|   File "/.../tmp/work/x86_64-linux/libical-native/3.0.14-r0/recipe-sysroot-native/usr/lib/python3.10/shutil.py", line 374, in copystat
|     lookup("utime")(dst, ns=(st.st_atime_ns, st.st_mtime_ns),
| FileNotFoundError: [Errno 2] No such file or directory

A similar issue is described in a fix for gobject-introspection-native.

https://github.com/openembedded/openembedded-core/commit/d3c48ff7d19e86b2338b1778f9563969bba3d336

The problem was fixed there by setting the environment variable
GI_SCANNER_DISABLE_CACHE to disable the use of $HOME/.cache.

Extend the fix to users of gobject-instropection by promoting the fix
to the bbclass.

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 35d5f707f6bb2ce5e9ab908e66e1ea9eeac754b1)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/gobject-introspection-data.bbclass              | 5 +++++
 .../gobject-introspection/gobject-introspection_1.72.0.bb    | 3 ---
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/classes/gobject-introspection-data.bbclass b/meta/classes/gobject-introspection-data.bbclass
index 2ef684626a..d90cdb4839 100644
--- a/meta/classes/gobject-introspection-data.bbclass
+++ b/meta/classes/gobject-introspection-data.bbclass
@@ -5,3 +5,8 @@
 # so that qemu use can be avoided when necessary.
 GI_DATA_ENABLED ?= "${@bb.utils.contains('DISTRO_FEATURES', 'gobject-introspection-data', \
                       bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', 'True', 'False', d), 'False', d)}"
+
+do_compile:prepend() {
+    # This prevents g-ir-scanner from writing cache data to $HOME
+    export GI_SCANNER_DISABLE_CACHE=1
+}
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb
index 355e77d107..9a47e908b7 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb
@@ -113,9 +113,6 @@ EOF
 }
 
 do_compile:prepend() {
-        # This prevents g-ir-scanner from writing cache data to $HOME
-        export GI_SCANNER_DISABLE_CACHE=1
-
         # Needed to run g-ir unit tests, which won't be able to find the built libraries otherwise
         export GIR_EXTRA_LIBS_PATH=$B/.libs
 }
-- 
2.25.1


