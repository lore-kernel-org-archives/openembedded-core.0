Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7594AC64ED8
	for <webhook@archiver.kernel.org>; Sun, 19 Feb 2023 19:31:30 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.3926.1676835071799349989
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Feb 2023 11:31:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=E+Kf6naz;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id bx23so836309wrb.10
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 11:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vLfkPEA0WAWV6Hfhes5F4GJC/iEADej5MvyRykNrs/A=;
        b=E+Kf6nazs9q625r/pIAtxa7IQk2Us9RCNOS/GEm0E8rO25uHagAnhVJaKr07phxIs4
         AnA8fUJHvpH70lwgN8peHgUj8jslAgtF2WNgcwozCOyTV/8ohCv1tA4FdpQ006W2zUiF
         kG4xntDLuzHTlgpm+SOG7EEjdJhR5nXKt36K253GwuX0qnN/oXBHZXH2gCF8PLwtQn+c
         u0umjOX21eV9jrsokkRi8Cx7DsZGY8eIwBHwKI3jkO3XDyhy1wRouNvH0cTUoLmfRdBN
         PGizQYmTUpqyZgcm7kTC2cqi6bs8xltd9F+Ll5gbiZyLQVnUe3odMR1qW1r0g9z53+J6
         q4iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vLfkPEA0WAWV6Hfhes5F4GJC/iEADej5MvyRykNrs/A=;
        b=8R0qgZVRTJ3NDgI1mzzprsa1HnuKKNfLmNo0NWG+XyZ+wpIVMg+cvuwF2yiew1PJGH
         q33bMQ67dCGBCulDKS16yC+orxeNmCblDFw+XayO8um7iFOIHohOMD+OK3FB0VFZzrHd
         MDWXRlli/Znyz5la+ix2cdjUfVvFehpDlqXiMhyArPcEnBb2eMzy3ypBInVkALstFWUL
         JevTeCzb5rAMNOz3ZMjrALKAhZuUf3WJ5XX4kwxYCRrNC1+qAxcn/mb+cNzbnD85LsaJ
         zHnuHL5jI7M7087IEZGKSQeP8YUNum8cAKthv2Cw2lY9ZDXavVjaha95My+LyhmIErEr
         srOg==
X-Gm-Message-State: AO0yUKUo7S4HLO2HlPRpK9ZQBuIGI9Q1cG+WZIJKdS121ekjFj4ZorSe
	iscuB0PE5LMVncVTieC8Nif2gbd09fA=
X-Google-Smtp-Source: AK7set8qnr9hQKj5IMc7KXl1DKD3dWNKjsQ+qIE/U3O9iP+I8ygYxgRPoUaH2lV/N57b6iXu+F9/pg==
X-Received: by 2002:adf:fd04:0:b0:2c5:52bd:9ed3 with SMTP id e4-20020adffd04000000b002c552bd9ed3mr220835wrr.56.1676835085467;
        Sun, 19 Feb 2023 11:31:25 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id d10-20020adffbca000000b002c54c8e70b1sm3347478wrs.9.2023.02.19.11.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Feb 2023 11:31:25 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 31/39] harfbuzz: upgrade 6.0.0 -> 7.0.0
Date: Sun, 19 Feb 2023 20:30:53 +0100
Message-Id: <20230219193101.338397-31-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230219193101.338397-1-alex@linutronix.de>
References: <20230219193101.338397-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 19:31:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177374

License-Update: copyright years

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...subset-threads.cc-add-missing-cstdio.patch | 34 -------------------
 .../{harfbuzz_6.0.0.bb => harfbuzz_7.0.0.bb}  |  7 ++--
 2 files changed, 3 insertions(+), 38 deletions(-)
 delete mode 100644 meta/recipes-graphics/harfbuzz/harfbuzz/0001-test-threads-hb-subset-threads.cc-add-missing-cstdio.patch
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_6.0.0.bb => harfbuzz_7.0.0.bb} (87%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz/0001-test-threads-hb-subset-threads.cc-add-missing-cstdio.patch b/meta/recipes-graphics/harfbuzz/harfbuzz/0001-test-threads-hb-subset-threads.cc-add-missing-cstdio.patch
deleted file mode 100644
index 13819f5cf8..0000000000
--- a/meta/recipes-graphics/harfbuzz/harfbuzz/0001-test-threads-hb-subset-threads.cc-add-missing-cstdio.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 7dfa672dac958bdbc7703ab0920e167eaa126754 Mon Sep 17 00:00:00 2001
-From: Sergei Trofimovich <slyich@gmail.com>
-Date: Mon, 16 Jan 2023 19:49:53 +0000
-Subject: [PATCH] test/threads/hb-subset-threads.cc: add missing <cstdio> include
-
-This week's `gcc-13` snapshot cleaned further up it's standard headers
-and exposed missing declaration as a build failure:
-
-    ../test/threads/hb-subset-threads.cc: In function 'void test_operation(operation_t, const char*, const test_input_t&)':
-    ../test/threads/hb-subset-threads.cc:127:3: error: 'printf' was not declared in this scope
-
-    ../test/threads/hb-subset-threads.cc: In function 'int main(int, char**)':
-    ../test/threads/hb-subset-threads.cc:157:19: error: 'atoi' was not declared in this scope
-
-Upstream-Status: Backport [https://github.com/harfbuzz/harfbuzz/commit/7dfa672dac958bdbc7703ab0920e167eaa126754]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- test/threads/hb-subset-threads.cc | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/test/threads/hb-subset-threads.cc b/test/threads/hb-subset-threads.cc
-index 9d86d8d51..f0e4b7e2a 100644
---- a/test/threads/hb-subset-threads.cc
-+++ b/test/threads/hb-subset-threads.cc
-@@ -1,4 +1,6 @@
- #include <cassert>
-+#include <cstdio>
-+#include <cstdlib>
- #include <cstring>
- #include <thread>
- #include <condition_variable>
--- 
-2.39.1
-
diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_7.0.0.bb
similarity index 87%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_7.0.0.bb
index 1fce127d07..a85c4ca1ce 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_7.0.0.bb
@@ -4,13 +4,12 @@ HOMEPAGE = "http://www.freedesktop.org/wiki/Software/HarfBuzz"
 BUGTRACKER = "https://bugs.freedesktop.org/enter_bug.cgi?product=HarfBuzz"
 SECTION = "libs"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=6ee0f16281694fb6aa689cca1e0fb3da \
+LIC_FILES_CHKSUM = "file://COPYING;md5=b98429b8e8e3c2a67cfef01e99e4893d \
                     file://src/hb-ucd.cc;beginline=1;endline=15;md5=29d4dcb6410429195df67efe3382d8bc \
                     "
 
-SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz \
-           file://0001-test-threads-hb-subset-threads.cc-add-missing-cstdio.patch"
-SRC_URI[sha256sum] = "1d1010a1751d076d5291e433c138502a794d679a7498d1268ee21e2d4a140eb4"
+SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
+SRC_URI[sha256sum] = "7b4685b7066c5c6b8dc6cd7b02f63c554fb8cc1c4ddcfc44bc284efa3c20cf28"
 
 inherit meson pkgconfig lib_package gtk-doc gobject-introspection github-releases
 
-- 
2.30.2


