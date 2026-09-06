Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB601C79FA1
	for <webhook@archiver.kernel.org>; Sun,  6 Sep 2026 08:06:11 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9861.1788681961404674281
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Sep 2026 01:06:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ds0yYrAY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49b96837ca3so18263165e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Sep 2026 01:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1788681959; x=1789286759; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1CCWb5oGYShlTjCVhpzjLMFj+CE189W0vb5f7mzARzo=;
        b=Ds0yYrAYdmGKxpEE27vRLM3P7Ipdl8AwpJpB3Mjv5xIir0BSERZA8dRMs3+VKYMRsv
         o/RH/mBzMWlNWAZwc/cQ5On8Of3dK9V9Bet3vfi7gfKkAQnmWFD6c+rSF16vsKjsxoVi
         IC1L19Ujtlzsw84nBJBFxMXj3n9Kr7GsukRBs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788681959; x=1789286759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=1CCWb5oGYShlTjCVhpzjLMFj+CE189W0vb5f7mzARzo=;
        b=i71oDfOtKijgpbdaS6Wc04JFyHCMnDY3iQbymIqfdNrzybk4UxeakzpoJXpXrl2KAw
         OT4iSZYaHugUfswERqilBcYcqoiWawDSM+sTgL3UWYvFbG3d9q743kOpVaJmfNXqOURn
         AXPQLFeKTh3VQdNhtwdn7541KWox+/sBL5WiiluCzUy3XTquWfVQ/lJn7UWq5Wq+O+YF
         iXrWUTtdCD2pDrK8u4IU6BOaYwVrbYOjfIj8EcKXjVwCZ18XNgEW7onVi+UmWaPpcZ52
         4cGbLTz0qpKYCNWJQonXIe2G3i2z5ZB1WWOk0gp9Sn/ayInIrwwWwqrwtHwc52X936Qz
         Gpfw==
X-Gm-Message-State: AFuF++nQWcxp+IoWYeN9LVxK0VNA9eFEwzE/DQRQyYC6nhibzO+hgbVm
	RZpVsv5wrYtn5+UEHV7//6Xp9paAAhcaqswkJTcaMsTVhWGLT4GTVVErWx9pBe2v6eP9zDjVNmi
	wQnN/eBc=
X-Gm-Gg: AYBFou3S3cYgurpPKgaaf0ZEnRKxc3EITrpXB1JHyDizOUJX5Ss5S+veAxTYjWH0M/K
	HGjjLdokYBV8FWhHncCBOvLNGMe1ymIq3Gq5mFCMn1cNd7RL0Z1OdOMLCud6+VmVqipigSUjQ0u
	5hoiM+yxOh5wwgYiTqRJ8d6UBX/0h/2aKldRKp91cxn7clTvHFU8tkKHjGtMqEyhtL1GxjrfnNF
	j/rEgDAVy55xvXD0zWhKg9CSGHU3Eu7O0DGko4/zVtg8mhnvhChH1XMKsrg2Ruf2pDr5rwAat1q
	JXCFUQqJ0KwPNxM8BstFQtvSM42A/uIiCZWFyB5zltjYyl1jE1X+LZyxyt5ww2M+HHgkydHWKHU
	g/oPpH/gQn39HRu1e0IJCqVTPyV6hDFK6BlUcUmiBqXWdcdClS3EzFr/8NA23gy5gCUMjuk/+N0
	3EuYSU0f3rHihmgEMAjvt07zZdZfLREhok1mqIi+2lsoIBr9ZBBgIJtE/rixAzoBhCwWvbLCdBa
	4tqrfeMsIvP3N86f4/pr6TuZ0ff
X-Received: by 2002:a05:600c:4f12:b0:49c:fc6c:be00 with SMTP id 5b1f17b1804b1-49cfc6cbfcamr128331405e9.23.1788681959492;
        Sun, 06 Sep 2026 01:05:59 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:a7e4:ecad:c000:9c61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cfbdacc45sm183691545e9.11.2026.09.06.01.05.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 01:05:58 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/6] libxml2: upgrade 2.15.3 -> 2.15.4
Date: Sun,  6 Sep 2026 09:05:49 +0100
Message-ID: <20260906080553.3151802-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260906080553.3151802-1-richard.purdie@linuxfoundation.org>
References: <20260906080553.3151802-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Sep 2026 08:06:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245203

v2.15.4: Sep 01 2026

- xmlregexp: Prevent out-of-bounds read in NXT macro
- fix: add missing overflow checks in dict.c, uri.c, and valid.c
- xmlregexp: Calc string length after null checking
- xpointer: Check overflow in xmlXPtrEvalXPtrPart
- xmlIO: Check for int overflow before calling writecallback
- fix(xinclude): propagate parseFlags in xmlXIncludeProcess and xmlXIncludeProcessTree

- Improve bound checks for xmlcatalog and xmllint arguments (out-of-bound)
- Fix memory leak in static Windows library (memory-leak)
- xmlreader: Copy DTD in xmlTextReaderDumpCopy
- parser: Fix double free in xmlIOParseDTD (double-free)
- parser: fix division-by-zero when maxAmpl is set to 0
- parser: Fix memory leak in xmlCtxtSetSaxHandler (memory-leak)
- catalog: Make sure to reset catalog resolve cache
- xmlAddChild: unlink node before free for text nodes (memory-leak)
- Normalize entity values in attr in xmlNodeGetContent
- Handle whitespace for date/time/duration types
- catalog: Fix NULL deref for nextCatalog without 'catalog' attribute (null-deref)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...-installation-directories-in-libxml2.patch |  6 +-
 .../libxml/libxml2/CVE-2026-11979.patch       | 81 -------------------
 .../libxml/libxml2/install-tests.patch        |  2 +-
 .../{libxml2_2.15.3.bb => libxml2_2.15.4.bb}  |  3 +-
 4 files changed, 5 insertions(+), 87 deletions(-)
 delete mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-11979.patch
 rename meta/recipes-core/libxml/{libxml2_2.15.3.bb => libxml2_2.15.4.bb} (96%)

diff --git a/meta/recipes-core/libxml/libxml2/0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch b/meta/recipes-core/libxml/libxml2/0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch
index d19b284866d..a1d24b596e0 100644
--- a/meta/recipes-core/libxml/libxml2/0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch
+++ b/meta/recipes-core/libxml/libxml2/0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch
@@ -1,4 +1,4 @@
-From 803e6f21d3d7ef6399f6ffe58cd28fa6dc7b94e9 Mon Sep 17 00:00:00 2001
+From aa31b72c260de3f15289db8d78c9674b0cf55f7f Mon Sep 17 00:00:00 2001
 From: Peter Marko <peter.marko@siemens.com>
 Date: Mon, 26 May 2025 21:11:14 +0200
 Subject: [PATCH] Revert "cmake: Fix installation directories in
@@ -66,10 +66,10 @@ index ff6433f..b775cfe 100644
  set(LIBXML2_LIBRARIES ${LIBXML2_LIBRARY})
  set(LIBXML2_INCLUDE_DIRS ${LIBXML2_INCLUDE_DIR})
 diff --git a/meson.build b/meson.build
-index 2cfecb6..f78da31 100644
+index f8337ea..19fdbb0 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -593,9 +593,6 @@ config_cmake = configuration_data()
+@@ -594,9 +594,6 @@ config_cmake = configuration_data()
  config_cmake.set('LIBXML_MAJOR_VERSION', v_maj)
  config_cmake.set('LIBXML_MINOR_VERSION', v_min)
  config_cmake.set('LIBXML_MICRO_VERSION', v_mic)
diff --git a/meta/recipes-core/libxml/libxml2/CVE-2026-11979.patch b/meta/recipes-core/libxml/libxml2/CVE-2026-11979.patch
deleted file mode 100644
index a14e566681e..00000000000
--- a/meta/recipes-core/libxml/libxml2/CVE-2026-11979.patch
+++ /dev/null
@@ -1,81 +0,0 @@
-From dfad0660f7dab3b5f8317b703b16ad0b0d12697d Mon Sep 17 00:00:00 2001
-From: Daniel Garcia Moreno <daniel.garcia@suse.com>
-Date: Fri, 22 May 2026 12:21:20 +0200
-Subject: [PATCH] xmlcatalog: overflow check for large --shell commands
-
-Fix https://gitlab.gnome.org/GNOME/libxml2/-/work_items/1124
-
-CVE: CVE-2026-11979
-Signed-off-by: Anton Skorup <anton.skorup@axis.com>
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/c2e233fc1b341685fc99621b2768b503f777a72e]
----
- test/catalogs/test.sh | 11 +++++++++++
- xmlcatalog.c          | 16 ++++++++++++++++
- 2 files changed, 27 insertions(+)
-
-diff --git a/test/catalogs/test.sh b/test/catalogs/test.sh
-index 7e5eaa76..84e8b90a 100755
---- a/test/catalogs/test.sh
-+++ b/test/catalogs/test.sh
-@@ -10,6 +10,17 @@ fi
- 
- exitcode=0
- 
-+# Test xmlcatalog --shell command line
-+# Case 1: Really long argument (470 chars)
-+input=""; for i in {1..470}; do input="${input}A"; done
-+echo $input | $xmlcatalog --shell test/catalogs/dockbook.xml || exit 1
-+# Case 2: public + long argument
-+input="public "; for i in {1..470}; do input="${input}A"; done
-+echo $input | $xmlcatalog --shell test/catalogs/dockbook.xml || exit 1
-+# Case 3: public + lots of args
-+input="public "; for i in {1..80}; do input="${input} x"; done
-+echo $input | $xmlcatalog --shell test/catalogs/dockbook.xml || exit 1
-+
- for i in test/catalogs/*.script ; do
-     name=$(basename $i .script)
-     xml="./test/catalogs/$name.xml"
-diff --git a/xmlcatalog.c b/xmlcatalog.c
-index b400c7cb..5113e930 100644
---- a/xmlcatalog.c
-+++ b/xmlcatalog.c
-@@ -135,6 +135,12 @@ static void usershell(void) {
- 	       (*cur != '\n') && (*cur != '\r')) {
- 	    if (*cur == 0)
- 		break;
-+            /* Do not read beyond the command array capacity */
-+            if (i >= (int)sizeof(command) - 2) {
-+                printf("Invalid command %s\n", cur);
-+                i = 0;
-+                break;
-+            }
- 	    command[i++] = *cur++;
- 	}
- 	command[i] = 0;
-@@ -152,6 +158,11 @@ static void usershell(void) {
- 	while ((*cur != '\n') && (*cur != '\r') && (*cur != 0)) {
- 	    if (*cur == 0)
- 		break;
-+            if (i >= (int)sizeof(arg) - 2) {
-+                printf("Invalid arg %s\n", arg);
-+                i = 0;
-+                break;
-+            }
- 	    arg[i++] = *cur++;
- 	}
- 	arg[i] = 0;
-@@ -164,6 +175,11 @@ static void usershell(void) {
- 	cur = arg;
- 	memset(argv, 0, sizeof(argv));
- 	while (*cur != 0) {
-+            if (i >= (int)sizeof(argv) / (int)sizeof(char*)) {
-+                printf("Too much arguments\n");
-+                break;
-+            }
-+
- 	    while ((*cur == ' ') || (*cur == '\t')) cur++;
- 	    if (*cur == '\'') {
- 		cur++;
--- 
-2.43.0
-
diff --git a/meta/recipes-core/libxml/libxml2/install-tests.patch b/meta/recipes-core/libxml/libxml2/install-tests.patch
index 996ade614e2..55559b7df3e 100644
--- a/meta/recipes-core/libxml/libxml2/install-tests.patch
+++ b/meta/recipes-core/libxml/libxml2/install-tests.patch
@@ -1,4 +1,4 @@
-From c6b547e06beb0f0ba99e30d036f055eaed9ec4dc Mon Sep 17 00:00:00 2001
+From 11159757ae9ff484e02764b36cef970b3d0178c2 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Fri, 17 Oct 2025 14:15:36 +0800
 Subject: [PATCH] add yocto-specific install-ptest target
diff --git a/meta/recipes-core/libxml/libxml2_2.15.3.bb b/meta/recipes-core/libxml/libxml2_2.15.4.bb
similarity index 96%
rename from meta/recipes-core/libxml/libxml2_2.15.3.bb
rename to meta/recipes-core/libxml/libxml2_2.15.4.bb
index 8b0ba294122..99f3b9675aa 100644
--- a/meta/recipes-core/libxml/libxml2_2.15.3.bb
+++ b/meta/recipes-core/libxml/libxml2_2.15.4.bb
@@ -18,10 +18,9 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://run-ptest \
            file://install-tests.patch \
            file://0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch \
-           file://CVE-2026-11979.patch \
            "
 
-SRC_URI[archive.sha256sum] = "78262a6e7ac170d6528ebfe2efccdf220191a5af6a6cd61ea4a9a9a5042c7a07"
+SRC_URI[archive.sha256sum] = "98087fd181d9070724f3fbc65c7377db03038eb92bd882374daff44940138821"
 SRC_URI[testtar.sha256sum] = "c6b2d42ee50b8b236e711a97d68e6c4b5c8d83e69a2be4722379f08702ea7273"
 
 CVE_STATUS[CVE-2025-6170] = "fixed-version: fixed in version 2.14.5"

