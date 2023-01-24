Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4A8DC25B50
	for <webhook@archiver.kernel.org>; Tue, 24 Jan 2023 02:38:06 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.6200.1674527880179940931
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Jan 2023 18:38:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UsHEo4AM;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id c26so10283535pfp.10
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Jan 2023 18:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Hg/K2Qnvij9tmy8l4TP+n3eymVESjjYqxK+Jjvrt31M=;
        b=UsHEo4AMlDDJFlBCKO4U9sevcCzyOZLahVds7wH5cArEIG/JdQsP8AFgaMQmYhf17r
         1sZUcnnsiI8Qm9WxWML/pxOSmfN4nO6vjeS2BiyGtP7YO7BzkpBoSjWDCWgTeMJx9RFo
         ABOb09kNcEnXvNJZzDxCa+Fj6eadmKkpqbuhVSPkA8lfIyGZ2n3NbApGP/3ajJsZuvAc
         Bp4vi5qvkz3VCq8hf3kUll8y/dY9onuJwPuoArBxgi82FdAy3SuW6tMTl+flzRCbf90C
         uX3iv+D9CuHTNniFOP382JcgqRpV0T7q5siZWwsqZC3u2/zHkH2fddNcxtLBfjUwZeW/
         9UiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hg/K2Qnvij9tmy8l4TP+n3eymVESjjYqxK+Jjvrt31M=;
        b=Z6oJeQGUbAq2b23rkUXHSkzXgtU40Onyl/kEQVH2HxwT28LcQGg6U4+TDOsSfgnL8S
         wYR6tOpbR6N7jbXj/BBCUFzx/0F3JW+DYKcK9S77PRHKzmDU24/ph+ZMrm98Cu7OrLgp
         RH3NWpMhRvJO/zu7OLj9CfUgCzqwZNpOCvjAwHcVrNLd/x8fOa4TU1uEUQOBQVNqm/NH
         jHjqb/c5/MfHdgUIPh/v5pp/rZD4f2yJVKWbFd/Tv6tvsRlsNZD1usi1dmjU8Opp6som
         sj22kAFCRWXo7eYsKRnMTxfnGMBJwVTu0/D/fJuQfrOx9uUIaQcF/ggH+mdbN0uWltyr
         wBzw==
X-Gm-Message-State: AFqh2kpSSsO7aF6pD2BOwzkQtiYXXnSr+0flWAC42CZMEwVFZJfWghiD
	3IFd+0YJLHTVYDMplzXeQtfSjSuUOSnjgA==
X-Google-Smtp-Source: AMrXdXvFYIA8QGyB7Azjcdj82iXze1WKjiePY85kORXiBoxmRFwyy9EAAm5FuxGrsNTSg4G2h5kZBg==
X-Received: by 2002:a05:6a00:2191:b0:581:19ed:78b9 with SMTP id h17-20020a056a00219100b0058119ed78b9mr35495863pfi.2.1674527879314;
        Mon, 23 Jan 2023 18:37:59 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id b26-20020aa78eda000000b0058b9c9def36sm289810pfr.139.2023.01.23.18.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 18:37:58 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/3] harfbuzz:  Add missing <cstdio> and <cstdlib> includes
Date: Mon, 23 Jan 2023 18:37:54 -0800
Message-Id: <20230124023756.543982-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Jan 2023 02:38:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176321

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...subset-threads.cc-add-missing-cstdio.patch | 34 +++++++++++++++++++
 .../harfbuzz/harfbuzz_6.0.0.bb                |  3 +-
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/harfbuzz/harfbuzz/0001-test-threads-hb-subset-threads.cc-add-missing-cstdio.patch

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz/0001-test-threads-hb-subset-threads.cc-add-missing-cstdio.patch b/meta/recipes-graphics/harfbuzz/harfbuzz/0001-test-threads-hb-subset-threads.cc-add-missing-cstdio.patch
new file mode 100644
index 0000000000..13819f5cf8
--- /dev/null
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz/0001-test-threads-hb-subset-threads.cc-add-missing-cstdio.patch
@@ -0,0 +1,34 @@
+From 7dfa672dac958bdbc7703ab0920e167eaa126754 Mon Sep 17 00:00:00 2001
+From: Sergei Trofimovich <slyich@gmail.com>
+Date: Mon, 16 Jan 2023 19:49:53 +0000
+Subject: [PATCH] test/threads/hb-subset-threads.cc: add missing <cstdio> include
+
+This week's `gcc-13` snapshot cleaned further up it's standard headers
+and exposed missing declaration as a build failure:
+
+    ../test/threads/hb-subset-threads.cc: In function 'void test_operation(operation_t, const char*, const test_input_t&)':
+    ../test/threads/hb-subset-threads.cc:127:3: error: 'printf' was not declared in this scope
+
+    ../test/threads/hb-subset-threads.cc: In function 'int main(int, char**)':
+    ../test/threads/hb-subset-threads.cc:157:19: error: 'atoi' was not declared in this scope
+
+Upstream-Status: Backport [https://github.com/harfbuzz/harfbuzz/commit/7dfa672dac958bdbc7703ab0920e167eaa126754]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ test/threads/hb-subset-threads.cc | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/test/threads/hb-subset-threads.cc b/test/threads/hb-subset-threads.cc
+index 9d86d8d51..f0e4b7e2a 100644
+--- a/test/threads/hb-subset-threads.cc
++++ b/test/threads/hb-subset-threads.cc
+@@ -1,4 +1,6 @@
+ #include <cassert>
++#include <cstdio>
++#include <cstdlib>
+ #include <cstring>
+ #include <thread>
+ #include <condition_variable>
+-- 
+2.39.1
+
diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb
index ae54bad643..1fce127d07 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb
@@ -8,7 +8,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6ee0f16281694fb6aa689cca1e0fb3da \
                     file://src/hb-ucd.cc;beginline=1;endline=15;md5=29d4dcb6410429195df67efe3382d8bc \
                     "
 
-SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
+SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz \
+           file://0001-test-threads-hb-subset-threads.cc-add-missing-cstdio.patch"
 SRC_URI[sha256sum] = "1d1010a1751d076d5291e433c138502a794d679a7498d1268ee21e2d4a140eb4"
 
 inherit meson pkgconfig lib_package gtk-doc gobject-introspection github-releases
-- 
2.39.1


