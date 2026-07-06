Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C554C4450C
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 17:17:44 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.156320.1783358257371479414
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 10:17:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=MV5+4WFv;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493c733f15aso33163395e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 10:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783358256; x=1783963056; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ompalEan5s7jl+bh0PyUsjVaR/z20fAdpIC6yPQEtto=;
        b=MV5+4WFveNn7a0QfSJ/H1TMkDowU94iWuvduqnSpLZOIYT6XCfq7EN+7TLjp9SyaTy
         Nu9tAIUYeRwVDDsioYXCFXu5l/08ESUuqiz8hGa2k0pnbYuPilaqiKrSqPWxelKtTUUP
         AfujEjvcwwxujuqLqwdk91lEJ8BiPKV583PVW9hF3eolARxJ2DZAg3RaywbDWpPMuFQG
         pwofSYMLgHnKgI14GhHvltVO5uS+TXrnEkJABpFqtm1AtIj2PWBiPoVubfPN+jGlZeu9
         bic20BirLReyOjKAw2RZCqKhZz+7F4xz/jBSHWIlGd/+MgamqP7RPfcCaq0+1PvYXMSk
         jCJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783358256; x=1783963056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ompalEan5s7jl+bh0PyUsjVaR/z20fAdpIC6yPQEtto=;
        b=NWQpin5AKdyoh3b9Q0D99rRvWhGKz0P8HTrmeNmqE3gU+UaXSttZU429MxpAcg1Jeo
         LYm5pfLnPBEaaTfBIFY6PTyzScVZJjQkxHssUZwcFznCPVqGfUmSFcZPyXZwnjiQco1i
         VTmbc1nNTFf4U/7VUe78a6r8GIYRUDDUtyA1IZZ64ZWVZr1RbJwGlUI8HoVxjCU8Fvo5
         UPSez+4pue7MZcBgn3RCWkWfQ1AxgMOtSNyDU2uOc5foX1kXsuBfTT2dOHUPEwYZPMvs
         pRfsKhw/COwVEyzrWkOGPlQlGt/LZFwESp4Sb+KQx4hdsHXBBOa1Rzdyc+iFOklJtaln
         AJdA==
X-Gm-Message-State: AOJu0YyYb9+fmxj6ZtuSJFqNNGpTaKOx0mCI8/pkMKN5GifBKQIeXABj
	ni04ELBlp84NmTU+voFEtujuRxkRIVPWYatSwhh5AzG2WNtKBvglcUx38fV0zA==
X-Gm-Gg: AfdE7clPZkBOmfpwk3GEH76G1hgfFPWHXIW1HG6bi3RyUBEpr0unmeag/9izTRLnQuA
	fWcF6ZUHAGLqnLdg68dovEpZ6gd29kjpJzYR1ZLLrtb+xmVJ4jbQI+lVjXWNy9yfdWCsRzbZ2yN
	TkeH7PyFNifEe0jcA7/+c+nnlYFCHYaJLogn4tihVWbxg216R1FejQiNPcySW++fbt10m+RZpqg
	7oNfJ9/pmjhIeP9hSSxSRqBsKUHqdMBG+DK3aqgLGqmiyVWuTWYjtfQ09eH0wp0j3FuTzkC2STk
	u1CAaHfJscmr5Spwyau9I/UgtfD6JZQnhWv2Nj7gvDKYAnmLhQ6Vh6LAbaaUNiF8netMFPkVAAa
	00+0wQryZTwMr083VoY3sPr2vhoSWW83MJI6mjBML/XE/V2xOBe0owJhZyvsS5Vpk1H/mpxJXzq
	Oq0QNeaHqU+BuuCj3xynuLta5B8aRClsgRmwRvCC0W1wlRgihk
X-Received: by 2002:a05:600c:1d1a:b0:493:b783:ad59 with SMTP id 5b1f17b1804b1-493df07390amr19513305e9.14.1783358255546;
        Mon, 06 Jul 2026 10:17:35 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63ba971sm640541005e9.13.2026.07.06.10.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:17:35 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 35/45] shared-mime-info: upgrade 2.4 -> 2.5.1
Date: Mon,  6 Jul 2026 19:16:49 +0200
Message-ID: <20260706171701.70536-35-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260706171701.70536-1-alex.kanavin@gmail.com>
References: <20260706171701.70536-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 17:17:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240321

From: Alexander Kanavin <alex@linutronix.de>

Explicitly disable tests, as they now have xdgmime dependency.

Drop backports.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...ild-with-libxml2-2.12.0-and-clang-17.patch | 26 ---------
 ...dle-build-with-older-versions-of-GCC.patch | 54 -------------------
 ...-info_2.4.bb => shared-mime-info_2.5.1.bb} |  6 +--
 3 files changed, 3 insertions(+), 83 deletions(-)
 delete mode 100644 meta/recipes-support/shared-mime-info/shared-mime-info/0001-Fix-build-with-libxml2-2.12.0-and-clang-17.patch
 delete mode 100644 meta/recipes-support/shared-mime-info/shared-mime-info/0002-Handle-build-with-older-versions-of-GCC.patch
 rename meta/recipes-support/shared-mime-info/{shared-mime-info_2.4.bb => shared-mime-info_2.5.1.bb} (85%)

diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info/0001-Fix-build-with-libxml2-2.12.0-and-clang-17.patch b/meta/recipes-support/shared-mime-info/shared-mime-info/0001-Fix-build-with-libxml2-2.12.0-and-clang-17.patch
deleted file mode 100644
index 936f72ccf8..0000000000
--- a/meta/recipes-support/shared-mime-info/shared-mime-info/0001-Fix-build-with-libxml2-2.12.0-and-clang-17.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 665383306c725f299a1b373f947cda01949d49e4 Mon Sep 17 00:00:00 2001
-From: David Faure <faure@kde.org>
-Date: Sun, 19 Nov 2023 11:18:11 +0100
-Subject: [PATCH] Fix build with libxml2-2.12.0 and clang-17
-
-Fixes #219
-
-Upstream-Status: Backport [https://gitlab.freedesktop.org/xdg/shared-mime-info/-/commit/c918fe77e255150938e83a6aec259f153d303573]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/test-subclassing.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/test-subclassing.c b/src/test-subclassing.c
-index dd099e4..0758164 100644
---- a/src/test-subclassing.c
-+++ b/src/test-subclassing.c
-@@ -1,4 +1,5 @@
- #include <libxml/tree.h>
-+#include <libxml/parser.h>
- #include <stdio.h>
- #include <string.h>
- 
--- 
-2.43.0
-
diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info/0002-Handle-build-with-older-versions-of-GCC.patch b/meta/recipes-support/shared-mime-info/shared-mime-info/0002-Handle-build-with-older-versions-of-GCC.patch
deleted file mode 100644
index 2af6b461b6..0000000000
--- a/meta/recipes-support/shared-mime-info/shared-mime-info/0002-Handle-build-with-older-versions-of-GCC.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 461d00fcd5c5842b9a56f7462d55d46bf21163cc Mon Sep 17 00:00:00 2001
-From: Patrick Williams <patrick@stwcx.xyz>
-Date: Fri, 1 Dec 2023 11:19:02 -0600
-Subject: [PATCH] Handle build with older versions of GCC
-
-Older versions of GCC (prior to 9.1) did not put the `std::filesystem`
-support directly into libstdcpp, but in a separate `libstdc++fs`.  Add
-meson logic to detect if an extra linker flag is necessary.
-
-Fixes #223.
-
-Tested on AlmaLinux 8 which uses GCC-8.
-
-Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/xdg/shared-mime-info/-/merge_requests/278]
----
- meson.build | 14 ++++++++++++++
- 1 file changed, 14 insertions(+)
-
-diff --git a/meson.build b/meson.build
-index ecc012f..93acd40 100644
---- a/meson.build
-+++ b/meson.build
-@@ -11,6 +11,7 @@ config = configuration_data()
- i18n = import('i18n')
- 
- cc = meson.get_compiler('c')
-+cxx = meson.get_compiler('cpp')
- 
- ###############################################################################
- # Project configuration
-@@ -46,6 +47,19 @@ if not xdgmime_found
-     ''')
- endif
- 
-+###############################################################################
-+# Check if GCC needs -lstdc++fs (before 9.1)
-+
-+if not cxx.links('''
-+        #include <filesystem>
-+        int main() {
-+            return std::filesystem::is_directory(
-+                std::filesystem::status("/tmp")) ? 0 : 1;
-+        }
-+        ''', name: 'std++fs-check')
-+    add_project_link_arguments('-lstdc++fs', language : 'cpp')
-+endif
-+
- ###############################################################################
- # Dependencies
- 
--- 
-2.41.0
-
diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb b/meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb
similarity index 85%
rename from meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb
rename to meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb
index f27061d5d1..f4551c8f59 100644
--- a/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb
+++ b/meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb
@@ -9,15 +9,15 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "libxml2 glib-2.0 shared-mime-info-native xmlto-native"
 
 SRC_URI = "git://gitlab.freedesktop.org/xdg/shared-mime-info.git;protocol=https;branch=master \
-           file://0001-Fix-build-with-libxml2-2.12.0-and-clang-17.patch \
-           file://0002-Handle-build-with-older-versions-of-GCC.patch"
-SRCREV = "9a6d6b8e963935f145f3a1ef446552de6996dada"
+           "
+SRCREV = "fd8ab89c20093f1bfba8fa9e302ba584fffd0fd7"
 
 inherit meson pkgconfig gettext mime
 
 EXTRA_OEMESON = " \
                  -Dupdate-mimedb=true \
                  -Dbuild-translations=${@'false' if d.getVar('USE_NLS') == 'no' else 'true'} \
+                 -Dbuild-tests=false \
                 "
 
 FILES:${PN} += "${datadir}/mime"
-- 
2.47.3


