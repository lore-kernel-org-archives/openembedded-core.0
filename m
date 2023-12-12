Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10F7FC4332F
	for <webhook@archiver.kernel.org>; Tue, 12 Dec 2023 14:28:02 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web11.2829.1702391273031191679
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Dec 2023 06:27:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=b0IXGhLd;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.177, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-5ca1b4809b5so810009a12.3
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 06:27:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1702391272; x=1702996072; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J2lJSIO0HXIjEwvTXlv1Y/BtzyCDyL7Y8mRQZ7qVUrI=;
        b=b0IXGhLdCbcT83AWLhUpImiDXcu4K+eOxZi+Leac1ba5/l/YjvGZvBvVyPKmEbynuJ
         irBqAHasOqJObdcWr9tW4WEBHpqn3FrHudba2KOy8C3MIv0wJVjg2BZEEOGACIMSW4XK
         Gq7quO/DZ3MN6mc7wzJ6poWRw05VlFQzEGCShfCyEp/gxBhskXCt9X/ZtBGVWYDSuL9+
         STFQplsAcXWkF8HZN8iwDnkwZXd55xSQ3xBf/68ESMn0NKYBleoqfSmWMtjEph+w8F6T
         X9tkVbdwt35q0PnOLdfDEHfwBrdfGXCinGt2ch0yfefLMC+YfBqVmpG6W64fe/+wsXEY
         zISA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702391272; x=1702996072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J2lJSIO0HXIjEwvTXlv1Y/BtzyCDyL7Y8mRQZ7qVUrI=;
        b=BzKQpscHM0cHDFcLpygGuv6sv2a6PqISTdAibyxa3O4A+KTGpyvAi8grJnRxS+7yUO
         8qOsrZCoE6IP2VAoryfArIT4aRx09CuXMtoSt2D1aKowptwhoYUTC/73ozQlrC27us2P
         0ctgmBqLJQ/mP2PT0p5u6TNhMvCetEGgfUIFxigSymA8wINrG99cGB9DU9MTKcCiFDDu
         Xaj6s+eAH4e36FeDrEttve0p1oq6StZoxSafU6Rjnz2nAi4uHb8O2qONzJ1GxBjda7VI
         +HuYQpS+hEub7WX5WbV9NEC9E506gQ2k8XnmtiFiB5JaWqDDrUJB1xHFRFT4LXFyJ5j2
         +JLw==
X-Gm-Message-State: AOJu0YyhejvF6LaitON6RFtpyAoh5RwBLo7rbsMdskTNiGnVXqWkD6EC
	M36Kz6aahJUpaRZTSvym/M/REb33rf4mHXEZYdI=
X-Google-Smtp-Source: AGHT+IG1fCRqZ/lEdylMXFzdLLpbg7COkqUVtDFakWMROGJUz2HfcCYPHFXSsldJAMzGEiatXT+cMg==
X-Received: by 2002:a05:6a20:639e:b0:18f:97c:4f58 with SMTP id m30-20020a056a20639e00b0018f097c4f58mr2185079pzg.100.1702391271749;
        Tue, 12 Dec 2023 06:27:51 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id n23-20020a056a000d5700b006cbb40669b1sm8188928pfv.23.2023.12.12.06.27.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 06:27:51 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 05/29] glib-2.0: upgrade 2.78.0 -> 2.78.1
Date: Tue, 12 Dec 2023 04:27:11 -1000
Message-Id: <ca5ec3ed5c528f36204b0f6b95bef896f8858176.1702391115.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702391115.git.steve@sakoman.com>
References: <cover.1702391115.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 14:28:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192209

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
* Fix truncating files when "g_file_set_contents_full()" is called without
  "G_FILE_SET_CONTENTS_CONSISTENT"

* Fix "-Dlibelf=disabled" on Linux

* Bugs fixed:
  - #3105 NetworkManager 1.44.0 crashes repeatedly with glib 2.78.0
  - #3111 gsubprocess-testprog.c: build error with cygwin (sys/ptrace.h: No such
    file or directory)
  - #3116 gio clears modification time in microseconds when setting with
    "set_modification_date_time"
  - #3120 Build of glib 2.78.0 ignores -Dlibelf=disabled
  - #3128 glib-2.78.0 fails at gio/tests/gsubprocess.p/gsubprocess.c.o
  - #3130 Segfault when creating GIO GPropertyAction without properties
  - #3144 "g_file_set_contents_full()" doesn't truncate the file (without
    "G_FILE_SET_CONTENTS_CONSISTENT")
  - !3576 guniprop.c: Avoid creating (temporarily) out-of-bounds pointers
  - !3579 Fixes for integer cast warnings when targeting CHERI
  - !3580 Fix test_find_program on FreeBSD
  - !3589 gconstructor.h: Ensure [c|d]tor prototypes are present for MSVC
  - !3594 Fix gutils-user-database test on macOS
  - !3596 Add value annotation to G_TYPE_FUNDAMENTAL_MAX
  - !3601 meson: Fix Windows build with PCRE2 as sibling subproject
  - !3604 Backport !3589 "gconstructor.h: Ensure [c|d]tor prototypes are present
    for MSVC" to glib-2-78
  - !3608 Backport !3587 "glocalfileinfo: Preserve microseconds for
    access/modify times" to glib-2-78
  - !3609 Backport !3607 "Make sure the "GTask" is freed on a graceful
    disconnect" to glib-2-78
  - !3614 Backport !3582 "Buffer needs to be aligned correctly to receive
    linux_dirent64." to glib-2-78
  - !3616 Backport !3590 "gtestutils.h: Fix warning with -Wsign-conversion
    caused by g_assert_cmpint" to glib-2-78
  - !3619 Backport !3617 "tests: Drop unnecessary include from gsubprocess-
    testprog.c" to glib-2-78
  - !3622 Backport !3621 "wakeup: do single read when using eventfd()" to
    glib-2-78
  - !3625 Backport !3624 "wakeup: Fix g_wakeup_acknowledge if signal comes in"
    to glib-2-78
  - !3644 Backport !3633 "Use g_task_return in task threads" to glib-2-78
  - !3649 Backport !3648 "build: Fix -Dlibelf=disabled on Linux" to glib-2-78
  - !3659 Backport !3650 "gfileutils: Add a missing ftruncate() call when
    writing files" to glib-2-78

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 2a2df44ef1b413f1ae268a69e36ca796fc8c9d0b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../glib-2.0/{glib-2.0_2.78.0.bb => glib-2.0_2.78.1.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.78.0.bb => glib-2.0_2.78.1.bb} (96%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.78.1.bb
similarity index 96%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.78.1.bb
index 500e4e873e..a490262112 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.78.1.bb
@@ -19,7 +19,7 @@ SRC_URI:append:class-native = " file://relocate-modules.patch \
                                 file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \
                               "
 
-SRC_URI[sha256sum] = "44eaab8b720877ce303c5540b657b126f12dc94972d9880b52959f43fb537b30"
+SRC_URI[sha256sum] = "915bc3d0f8507d650ead3832e2f8fb670fce59aac4d7754a7dab6f1e6fed78b2"
 
 # Find any meson cross files in FILESPATH that are relevant for the current
 # build (using siteinfo) and add them to EXTRA_OEMESON.
-- 
2.34.1


