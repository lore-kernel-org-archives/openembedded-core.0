Return-Path: <victor.kamensky7@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76F4BE66886
	for <webhook@archiver.kernel.org>; Sun, 21 Dec 2025 07:29:02 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.56278.1766302131171016067
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Dec 2025 23:28:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fHLjI0D2;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: victor.kamensky7@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2a0a33d0585so28356905ad.1
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Dec 2025 23:28:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766302130; x=1766906930; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sYhb5aBSheWH+CLo8gASigOqfEm9l9Ud9rvrmADND3g=;
        b=fHLjI0D2UDxTalWa7xcu9Yeq5Y6uCYCuP7B76qUrU4C1DruVGPA5q5iRQ8CzXaoMVN
         f91Z/1QjIWsqd5V7E40PH6EhpANNV6gDQfI/9ldzVChu0bCGft4YP63upQGUDfWMWyiE
         QejOTvhuvvvz4BsYXqQL2Y3EW8+zQZ9imra3f5Fui4yBg/pXMbJyPZT4PiQKil8JLfh9
         /nkeK7bQcQoPCxQRzuFMl1kdEsjUAA0aEPdUtnSV1zdI+LkZ+wfw5sSg08784lpzzI0L
         0ksZIQ6qy2u2YdKUWDdgnts6Q6fXKtq/PTuNjI1bI4L3OCFApoDz4jdAjrVbcTRz7qZd
         oouQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766302130; x=1766906930;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sYhb5aBSheWH+CLo8gASigOqfEm9l9Ud9rvrmADND3g=;
        b=DNHbBun2Q9X/BX53s6hIIDpfVnjff0YQ2V2h7fqAFGVZwKUeEn5XyB/LD2gtROV4bA
         +tTCkVmp+Ej6rAS7xXajnGzTIt19GXmuGmS+feqT/TI6SYTtR34dRBXTY9SLB5QVNwgL
         ohu74+XyoN+vI08n+Ou7YuwUsVh8Vns+kRDuTAeL8Mc7+SS+D4N13eF1FeUWHt/OYrCS
         sIDWey8/DEsvbL+/YhvDeKqdLmXkZbZ0+HA8uynEsjMRw7ZLV7ycbMZXR5E9nfWrjxNu
         VMnTPkZ/K2QWdgyMDFQtnNVlH9whBsQI4KUOSp9y59roEZEJ01GpoJ6yJAQI/EtPAjsL
         XViQ==
X-Gm-Message-State: AOJu0YxuAv1BLf5IPAbaqO7kC0utwjC24A0Hm1zD7ygviATcx24iLIrB
	1N5b8LFE45FRM61hThddhL6zmQ2GP7KCCsShw3q+M/3GvGAmvOhoNfFrft62Vw==
X-Gm-Gg: AY/fxX53z4D4mWIrPKXdrB5b2m9mYGBGNBODcZ/W6O+ULs6gP75iuKRDY3K7G9qRRMg
	KH9TJps8ArtQqxhzOZRSZOenk6U7Tr7w9jaKbzzvQPhBWaXjpxfhqUMS+BCceclag5pc2ty+FAv
	So2TDIlFWqPAWKoCJs9zlBGx2yLBacNrrCeTC2tO/hBeB8GNJw+hXLSaFG1HroLa77cZ5BsTqqr
	AycaUmE+j3g+PXRUYjvdwnxTkw1/rHJTtAo9Q8W71rEvHRol+9dVb6I3FrfI4yI22yFUPHvcZBs
	gr+Pn0ytWx7vGk9MVH83MeWyniIvZGBsS/neJqviK9oQNhtSSEh3tUDRESUYW9BsuO+ZbARQQLO
	HLqxzM23vKPEMDzipAjCSaP+AhZpLNaAK/w3h3j+Lku/+SLIys2PU4lxOsN7dXZlpJ7aB0MhKXS
	h3rE4fe6dV29UX+j0ghz0=
X-Google-Smtp-Source: AGHT+IHIoV6SkYZDz0+fG/kudHFbgSGFB8al9nkBS4+QhXOL9R62GRQfE1ovu+oXzMiKAyePWWnO/Q==
X-Received: by 2002:a05:7022:3705:b0:119:e56b:91e9 with SMTP id a92af1059eb24-121722dff1cmr6275120c88.26.1766302129631;
        Sat, 20 Dec 2025 23:28:49 -0800 (PST)
Received: from kamensky-p15s.cisco.com ([2601:646:827e:e610::b994])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217253c23csm28588633c88.9.2025.12.20.23.28.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Dec 2025 23:28:49 -0800 (PST)
From: Victor Kamensky <victor.kamensky7@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Victor Kamensky <victor.kamensky7@gmail.com>
Subject: [PATCH] systemtap: upgrade 5.3 -> 5.4
Date: Sat, 20 Dec 2025 23:28:24 -0800
Message-Id: <20251221072824.3981-1-victor.kamensky7@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 21 Dec 2025 07:29:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228251

* removed upstreamed patch
* fixed patch fuzz issue

Signed-off-by: Victor Kamensky <victor.kamensky7@gmail.com>
---
 ...-native_5.3.bb => systemtap-native_5.4.bb} |  0
 ...ython-modules-to-correct-library-dir.patch |  6 ++--
 ...am-use-absolute-path-for-source-dire.patch | 36 -------------------
 .../{systemtap_5.3.bb => systemtap_5.4.bb}    |  1 -
 .../systemtap/systemtap_git.inc               |  2 +-
 5 files changed, 4 insertions(+), 41 deletions(-)
 rename meta/recipes-kernel/systemtap/{systemtap-native_5.3.bb => systemtap-native_5.4.bb} (100%)
 delete mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-python-Makefile.am-use-absolute-path-for-source-dire.patch
 rename meta/recipes-kernel/systemtap/{systemtap_5.3.bb => systemtap_5.4.bb} (97%)

diff --git a/meta/recipes-kernel/systemtap/systemtap-native_5.3.bb b/meta/recipes-kernel/systemtap/systemtap-native_5.4.bb
similarity index 100%
rename from meta/recipes-kernel/systemtap/systemtap-native_5.3.bb
rename to meta/recipes-kernel/systemtap/systemtap-native_5.4.bb
diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-Install-python-modules-to-correct-library-dir.patch b/meta/recipes-kernel/systemtap/systemtap/0001-Install-python-modules-to-correct-library-dir.patch
index ee9baedcda..21e3096405 100644
--- a/meta/recipes-kernel/systemtap/systemtap/0001-Install-python-modules-to-correct-library-dir.patch
+++ b/meta/recipes-kernel/systemtap/systemtap/0001-Install-python-modules-to-correct-library-dir.patch
@@ -1,4 +1,4 @@
-From 18d088d10c1a0885fa25ac40591e38c8aa545c81 Mon Sep 17 00:00:00 2001
+From 7847240a97f5010ebab775f7ac51812a7705a886 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 24 Feb 2017 17:53:02 +0200
 Subject: [PATCH] Install python modules to correct library dir.
@@ -19,11 +19,11 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 6 insertions(+), 2 deletions(-)
 
 diff --git a/python/Makefile.am b/python/Makefile.am
-index 13618dc2f..9d5cb7bcb 100644
+index 845db3661..130e90b24 100644
 --- a/python/Makefile.am
 +++ b/python/Makefile.am
 @@ -8,6 +8,10 @@ AUTOMAKE_OPTIONS = subdir-objects
- AM_CPPFLAGS = -I$(srcdir)/../includes
+ AM_CPPFLAGS = -I$(abs_srcdir)/../includes
  AM_CPPFLAGS += -I$(abs_builddir)/../includes/sys
  
 +# Add OE's CFLAGS which contains `-fdebug-prefix-map' options to
diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-python-Makefile.am-use-absolute-path-for-source-dire.patch b/meta/recipes-kernel/systemtap/systemtap/0001-python-Makefile.am-use-absolute-path-for-source-dire.patch
deleted file mode 100644
index dacd19edd1..0000000000
--- a/meta/recipes-kernel/systemtap/systemtap/0001-python-Makefile.am-use-absolute-path-for-source-dire.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 71e4ffd46dbbb7de1d06edb66f3e1fe0de423586 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Wed, 21 May 2025 13:25:46 +0200
-Subject: [PATCH] python/Makefile.am: use absolute path for source directory
- includes as well
-
-Otherwise it would be relative to the build directory,
-which works only if the build and source directory are in the
-same parent directory, and breaks if they're on different levels.
-
-Upstream-Status: Submitted [by email to fche@redhat.com,wcohen@redhat.com,systemtap@sourceware.org]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- python/Makefile.am | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/python/Makefile.am b/python/Makefile.am
-index 9d5cb7bcb..130e90b24 100644
---- a/python/Makefile.am
-+++ b/python/Makefile.am
-@@ -2,10 +2,10 @@
- 
- AUTOMAKE_OPTIONS = subdir-objects
- 
--# Note that we have to use 'abs_builddir' here since we change
-+# Note that we have to use absolute directores here since we change
- # directories back to the source directory when building the python
- # extension.
--AM_CPPFLAGS = -I$(srcdir)/../includes
-+AM_CPPFLAGS = -I$(abs_srcdir)/../includes
- AM_CPPFLAGS += -I$(abs_builddir)/../includes/sys
- 
- # Add OE's CFLAGS which contains `-fdebug-prefix-map' options to
--- 
-2.39.5
-
diff --git a/meta/recipes-kernel/systemtap/systemtap_5.3.bb b/meta/recipes-kernel/systemtap/systemtap_5.4.bb
similarity index 97%
rename from meta/recipes-kernel/systemtap/systemtap_5.3.bb
rename to meta/recipes-kernel/systemtap/systemtap_5.4.bb
index 588b3b8d36..254bac4d6f 100644
--- a/meta/recipes-kernel/systemtap/systemtap_5.3.bb
+++ b/meta/recipes-kernel/systemtap/systemtap_5.4.bb
@@ -9,7 +9,6 @@ require systemtap_git.inc
 SRC_URI += " \
            file://0001-improve-reproducibility-for-c-compiling.patch \
            file://0001-staprun-address-ncurses-6.3-failures.patch \
-           file://0001-python-Makefile.am-use-absolute-path-for-source-dire.patch \
            "
 
 DEPENDS = "elfutils"
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
index c5d10c8fd5..180ebc9f61 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -7,7 +7,7 @@ SRC_URI = "git://sourceware.org/git/systemtap.git;protocol=https;branch=master;t
            file://0001-staprun-stapbpf-don-t-support-installing-a-non-root.patch \
            "
 
-SRCREV = "c4fc655170b534478a6b131292b987630c7c0865"
+SRCREV = "911a1354aac264651fda932061e7f20d2ecc2471"
 
 COMPATIBLE_HOST = '(x86_64|i.86|powerpc|arm|aarch64|microblazeel|mips|riscv64|riscv32).*-linux'
 COMPATIBLE_HOST:libc-musl = 'null'
-- 
2.45.0


