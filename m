Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AD17C5473E
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 05:24:09 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web11.70877.1724736248511184655
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Aug 2024 22:24:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TcENxjHs;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a86a37208b2so442297366b.0
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 22:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724736247; x=1725341047; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aHuPZpBrQICQQrrBMecyASOL7hCfPbYSsQWj04bn5AI=;
        b=TcENxjHsQn13De7PIVas6/Tc4MVHcHG8QOhySeeFKEZxbRM/QYOewmi8tB7SWxMZFf
         xka1TfP90AXA1EkYIxnKX7zdPbTSaeZ0xZogwTZFl5McMBKLfBisy1LNZmUS33UdUI2+
         FSGMc0OHbPKh+TQVxT4LbEvpOzPcGYe2i1pHCGUiYEzSFR65H/2VvrKj3T9cZkEyQRJW
         rcM8gBeMnKG0dy4cNrpItx1KH62g06IdPAkGkl4flP8YlJrCtpC6q0KQBT6yVrnHNa3l
         Q39BaxuohEFW+//IklLXzc3Tvoqy3zczN35+HVmtJpFQ9h440BMpz5dLah+dK+qU7I0+
         99AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724736247; x=1725341047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aHuPZpBrQICQQrrBMecyASOL7hCfPbYSsQWj04bn5AI=;
        b=tX1Xadmkr6P3dded2X9sHu7br6G7AVPmWnMcbSoL58zpumGbq0PhMTtYiTEhdgBOrJ
         izgGQ7P/kNPDbdhOH6t9fPDlvh/tS57IvfFlRanFHekhIcs3cFkdtX1X/9UibfhDzsLh
         PCAeV3kS10Ok9L+xsmr/4IjROyPKDQJx2s+He3hx77Mlv2MIl6WbxGSkBTUZusKiooBv
         a44blwp+6urKKDU/naD8U2AQW5oJpZJISD7E4kkXRmQnPduDTbdtXgqbIcc26t077SQ1
         sZE0BWwtDnhMLWwVy8ZWjhy3EEauoPJ8KEhobRBtn008mzvuMyk4waJQlmkO9zv0nDrw
         FgXg==
X-Gm-Message-State: AOJu0Yxom9SMh8F3KrY4Sw7QvEndFQ5oKrJXbXA8sOm/9g1/yfTr+uzS
	VBo2C/CKUochEYIa4bAi+XlRuyAvfLeRMBbfjxAzVJDqrpRLnOYwoMoHuQ==
X-Google-Smtp-Source: AGHT+IG9jIvhmrOC/OQXIM7sEHli9i1V3pDnpgL19Nq/LZ4FXIToc7WKFSfxbaB/fH3eqcEDO2F1Vg==
X-Received: by 2002:a17:906:da88:b0:a86:799d:f8d1 with SMTP id a640c23a62f3a-a86a54a991cmr1031062066b.47.1724736246617;
        Mon, 26 Aug 2024 22:24:06 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a86e675aa07sm57704166b.17.2024.08.26.22.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 22:24:06 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 16/34] python3-scons: update 4.7.0 -> 4.8.0
Date: Tue, 27 Aug 2024 07:23:36 +0200
Message-Id: <20240827052354.1319810-16-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240827052354.1319810-1-alex.kanavin@gmail.com>
References: <20240827052354.1319810-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 05:24:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203792

From: Alexander Kanavin <alex@linutronix.de>

Manpages are no longer installed, and so the patch isn't needed.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0001-Fix-man-page-installation.patch      | 29 -------------------
 ...-scons_4.7.0.bb => python3-scons_4.8.0.bb} | 13 +++------
 2 files changed, 4 insertions(+), 38 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-scons/0001-Fix-man-page-installation.patch
 rename meta/recipes-devtools/python/{python3-scons_4.7.0.bb => python3-scons_4.8.0.bb} (70%)

diff --git a/meta/recipes-devtools/python/python3-scons/0001-Fix-man-page-installation.patch b/meta/recipes-devtools/python/python3-scons/0001-Fix-man-page-installation.patch
deleted file mode 100644
index 6dffe648097..00000000000
--- a/meta/recipes-devtools/python/python3-scons/0001-Fix-man-page-installation.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 8b482e618047e94833545dce3a26924ef4f075db Mon Sep 17 00:00:00 2001
-From: Tim Orling <ticotimo@gmail.com>
-Date: Sat, 22 May 2021 11:20:46 -0700
-Subject: [PATCH] Fix man page installation
-
-Fixes:
-  error: can't copy 'build/doc/man/scons.1': doesn't exist or not a regular file
-
-Upstream-Status: Inappropriate [oe specific]
-
-Signed-off-by: Tim Orling <ticotimo@gmail.com>
-
----
- MANIFEST.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/MANIFEST.in b/MANIFEST.in
-index 04ec000..937f6f3 100644
---- a/MANIFEST.in
-+++ b/MANIFEST.in
-@@ -4,7 +4,7 @@ recursive-include SCons/Tool/docbook *
- include LICENSE
- 
- include scons.1 sconsign.1 scons-time.1
--recursive-include build/doc/man *.1
-+#recursive-include build/doc/man *.1
- 
- 
- 
diff --git a/meta/recipes-devtools/python/python3-scons_4.7.0.bb b/meta/recipes-devtools/python/python3-scons_4.8.0.bb
similarity index 70%
rename from meta/recipes-devtools/python/python3-scons_4.7.0.bb
rename to meta/recipes-devtools/python/python3-scons_4.8.0.bb
index f41b3e92711..b1348665e04 100644
--- a/meta/recipes-devtools/python/python3-scons_4.7.0.bb
+++ b/meta/recipes-devtools/python/python3-scons_4.8.0.bb
@@ -4,13 +4,13 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d903b0b8027f461402bac9b5169b36f7"
 
-SRC_URI += " file://0001-Fix-man-page-installation.patch"
-SRC_URI[sha256sum] = "d8b617f6610a73e46509de70dcf82f76861b79762ff602d546f4e80918ec81f3"
-
-PYPI_PACKAGE = "SCons"
+SRC_URI[sha256sum] = "2c7377ff6a22ca136c795ae3dc3d0824696e5478d1e4940f2af75659b0d45454"
+UPSTREAM_CHECK_PYPI_PACKAGE = "SCons"
 
 inherit pypi python_setuptools_build_meta
 
+S = "${WORKDIR}/SCons-${PV}"
+
 RDEPENDS:${PN}:class-target = "\
   python3-core \
   python3-compression \
@@ -23,11 +23,6 @@ RDEPENDS:${PN}:class-target = "\
   python3-pprint \
   "
 
-do_install:append() {
-    install -d ${D}${mandir}/man1
-    mv ${D}${prefix}/scons*.1 ${D}${mandir}/man1/
-}
-
 do_install:append:class-native() {
     create_wrapper ${D}${bindir}/scons SCONS_LIB_DIR='${STAGING_DIR_HOST}/${PYTHON_SITEPACKAGES_DIR}' PYTHONNOUSERSITE='1'
 }
-- 
2.39.2


