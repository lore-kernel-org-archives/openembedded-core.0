Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web09.24804.1619986594681901831
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 May 2021 13:16:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=A1t/PTfm;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id i14so2286949pgk.5
        for <openembedded-core@lists.openembedded.org>; Sun, 02 May 2021 13:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8xToz2V4e726PdGuYJrufZ3U+CId3BqSs/LbUVKyeKA=;
        b=A1t/PTfmKphcc9DrRyH+LEUb7x+XdXhX8jKIinXiI9ITzpRULSoOOaFc0IN808xyVQ
         2g8mgpu+9BCZHgQQteorp++OfLuIHiQf7FQaieGqPt0VPasyBiYCbuHfrhpFreafZNqm
         YhXgY1ol8NL2INvKy/NLeCH2By+BOAY/7734kTH5ZPAcgSfS9zNa3QJslubNabggWZQZ
         OsP+ga8aPCRYo0rHgpIMtRr7M1EP70adzBJpc8ZxRun/NE9o3dOb8L3dj44wWlW+niGD
         Bn9JfARbFz6YSXaShrtTYacEKfZdnLw2DjiGVNrFmKugwtxPr2GO1Ny3PivOnXVNENPY
         gjyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8xToz2V4e726PdGuYJrufZ3U+CId3BqSs/LbUVKyeKA=;
        b=JC3WEtkkfTQbJXpdwEpQEM5+w9C4GOxVvnHv4uQ23PACq1aWqxGN9aMBde1xGjdwb2
         FD66XsEFKEeGaw6KUFVB6wKDF/ZOod9IGnQvpTl+n3JjRV8/fyor5CWH1kKQgsvMs4/1
         k3OE4S37o5EtFfKNQt4e4B7jpyHheZB3WdffJDWHiiZW3aHD7PsPrdy42r8I4JdSBXqU
         mZbrzGiGa/C7/KSH4OWilto3Qk9fEI04eGb+EXFjqkGjZoZZjQDTFV4V/q//aMRa7CC+
         eJlUrcMa+vUnTYFdpjJwDG0xrcxU4E5KlGn7r0SM8ErCJlvYlAWycJ9/nZg6k4GEiZCC
         hFDQ==
X-Gm-Message-State: AOAM532PTYXYG1mWiNvjLfVgGJeCBfSaoGMUmWrFru2KjpZi3dVvpYuO
	GYC4DjNakyiFMZ/S/y/CXqmUUX+s1kklDw==
X-Google-Smtp-Source: ABdhPJzxHsv6unemaqQ8y04Wgu7wY5zxxOGV30hmz0rJYlCiiHgZHAWG9txqgehVgDHxFxv9SBT4nA==
X-Received: by 2002:a62:1dca:0:b029:28e:74d9:1e1a with SMTP id d193-20020a621dca0000b029028e74d91e1amr5318401pfd.62.1619986593942;
        Sun, 02 May 2021 13:16:33 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a7ac])
        by smtp.gmail.com with ESMTPSA id b21sm7385815pji.39.2021.05.02.13.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 May 2021 13:16:33 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] webkitgtk: Fix reproducibility in minibrowser
Date: Sun,  2 May 2021 13:16:30 -0700
Message-Id: <20210502201631.1490332-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-MiniBrowser-Fix-reproduciblity.patch | 31 +++++++++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.30.6.bb  |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-MiniBrowser-Fix-reproduciblity.patch

diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-MiniBrowser-Fix-reproduciblity.patch b/meta/recipes-sato/webkit/webkitgtk/0001-MiniBrowser-Fix-reproduciblity.patch
new file mode 100644
index 0000000000..98d2d1ded9
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-MiniBrowser-Fix-reproduciblity.patch
@@ -0,0 +1,31 @@
+From dcf9ae0dc0b4510eddbeeea09e11edfb123f95af Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 2 May 2021 13:10:49 -0700
+Subject: [PATCH] MiniBrowser: Fix reproduciblity
+
+Do not emit references to source dir in generated sourcecode
+
+Upstream-Status: Submitted [https://bugs.webkit.org/show_bug.cgi?id=225283]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Tools/MiniBrowser/gtk/CMakeLists.txt | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Tools/MiniBrowser/gtk/CMakeLists.txt b/Tools/MiniBrowser/gtk/CMakeLists.txt
+index 93b62521..482d3b00 100644
+--- a/Tools/MiniBrowser/gtk/CMakeLists.txt
++++ b/Tools/MiniBrowser/gtk/CMakeLists.txt
+@@ -51,8 +51,8 @@ add_custom_command(
+     OUTPUT ${MiniBrowser_DERIVED_SOURCES_DIR}/BrowserMarshal.c
+            ${MiniBrowser_DERIVED_SOURCES_DIR}/BrowserMarshal.h
+     MAIN_DEPENDENCY ${MiniBrowser_DIR}/browser-marshal.list
+-    COMMAND glib-genmarshal --prefix=browser_marshal ${MiniBrowser_DIR}/browser-marshal.list --body > ${MiniBrowser_DERIVED_SOURCES_DIR}/BrowserMarshal.c
+-    COMMAND glib-genmarshal --prefix=browser_marshal ${MiniBrowser_DIR}/browser-marshal.list --header > ${MiniBrowser_DERIVED_SOURCES_DIR}/BrowserMarshal.h
++    COMMAND glib-genmarshal --prefix=browser_marshal ${MiniBrowser_DIR}/browser-marshal.list --body --skip-source > ${MiniBrowser_DERIVED_SOURCES_DIR}/BrowserMarshal.c
++    COMMAND glib-genmarshal --prefix=browser_marshal ${MiniBrowser_DIR}/browser-marshal.list --header --skip-source > ${MiniBrowser_DERIVED_SOURCES_DIR}/BrowserMarshal.h
+     VERBATIM)
+ 
+ if (USE_GTK4)
+-- 
+2.31.1
+
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.30.6.bb b/meta/recipes-sato/webkit/webkitgtk_2.30.6.bb
index 2912bc83a6..7d0d0fc16f 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.30.6.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.30.6.bb
@@ -20,6 +20,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://reduce-memory-overheads.patch \
            file://0001-Extend-atomics-check-to-include-1-byte-CAS-test.patch \
            file://musl-lower-stack-usage.patch \
+           file://0001-MiniBrowser-Fix-reproduciblity.patch \
            "
 
 SRC_URI[sha256sum] = "50736ec7a91770b5939d715196e5fe7209b93efcdeef425b24dc51fb8e9d7c1e"
-- 
2.31.1

