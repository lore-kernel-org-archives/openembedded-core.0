Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BB22C3DA42
	for <webhook@archiver.kernel.org>; Wed, 17 Jul 2024 15:59:56 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web10.2024.1721231990976087848
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jul 2024 08:59:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=fHAdarGk;
 spf=pass (domain: baylibre.com, ip: 209.85.160.177, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-44953ab0e2bso42748411cf.0
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jul 2024 08:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1721231990; x=1721836790; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=8+Te1kzzkofE/KVGlzFxIBphEMlgQKHJmVtdcrvXml0=;
        b=fHAdarGkshlOwLPqYNLyg7ke+8e+weUHnhByYfrPvysMWHkga4Yk9jvHZwxEE4bdz1
         8Sxylx4SAfVYoH4CoAUgs1Tdq1GK+3TwqkdvQgTmf0Lg8NXHFCXhWioXTvvLKE5zqu+5
         8pSgr00/vg66VJmHMzLBXGZBxqWjYAp/6av5uXwa4n7buz9O3x0oz+Jv5iVQ8boW+RWd
         xQnQ1zNMmKfdw0VX9ZqYhuMHgxvZ3vNPFvE4d94OYocgo2Fnax1mWxqVc03NhqLCRvEz
         +dNo4tq8N6zKsVzHpekjL1FOilWFz+vPZ40fJVWtne/IZlneymR2DS9WcM9WuhoEcDik
         g73g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721231990; x=1721836790;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8+Te1kzzkofE/KVGlzFxIBphEMlgQKHJmVtdcrvXml0=;
        b=jwgGRdxmsU6BOvj3313/w8WtYe3lP097gEIuQs2RNML72Q/9r0IdLcWsogCmaCkgJP
         v+q7LHqIwbRBZk5le2tR0gdiLiYbggEt93abarWeme0nwlHvzO0aoLc2hgvv3wMiplLT
         lC6UjPstr5rXAk8MRYFB9xSHS/rChxjyXknFdBGwLIpgdQfz5fSsXMY+d0Qk2ysrTjSB
         H0IuH9BnA2XiswBWETFrS42MOXVJ8R+DVGFDa6ePKDVlWE3cKq2OKjAL0RlZVCdbUPUJ
         UDFkpd2lGBH/CLrCkiStprgZHYpib32j/dJJvOST6sv8xFgyA2EAW9msYuviGuJKYmit
         o8Kw==
X-Gm-Message-State: AOJu0Yz/CTsO2me69vgAyBvMink6IJRUtcID+5LDUCKXB+S/EQhEpn/f
	wflPXaFQuKvQ/NA1bOzGKBLVOTOFr6hv7f1orl/JTRvZ0KAw94cEaLXnmi14naYDFSdjzojnf0r
	V
X-Google-Smtp-Source: AGHT+IGx+Q/yGrWtfsyvSi80B5b1TWhGeV6X8aTROH8MKonPk9yDbQ5xFBXChF6lPkKhceZf1GKa9g==
X-Received: by 2002:ac8:588d:0:b0:446:6938:d1c2 with SMTP id d75a77b69052e-44f86173cc3mr24632971cf.3.1721231989622;
        Wed, 17 Jul 2024 08:59:49 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-44f5b7fcb7esm48968471cf.57.2024.07.17.08.59.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 08:59:49 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] python3-setuptools: upgrade 69.5.1 -> 70.3.0
Date: Wed, 17 Jul 2024 11:59:48 -0400
Message-Id: <20240717155948.2532-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jul 2024 15:59:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202168

Refactor 0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch
to apply on the latest codebase.

Changelog: https://github.com/pypa/setuptools/blob/main/NEWS.rst

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...config.py-make-it-possible-to-substite.patch | 17 ++++++++++-------
 ...s_69.5.1.bb => python3-setuptools_70.3.0.bb} |  2 +-
 2 files changed, 11 insertions(+), 8 deletions(-)
 rename meta/recipes-devtools/python/{python3-setuptools_69.5.1.bb => python3-setuptools_70.3.0.bb} (94%)

diff --git a/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch b/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch
index 0f6c9d250d..68dca43e21 100644
--- a/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch
+++ b/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch
@@ -1,4 +1,4 @@
-From d393759315b189a738e4b6a2ce31dc18dbbfae29 Mon Sep 17 00:00:00 2001
+From a9f3483b492317959a35886308c31c078e350a35 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Wed, 11 May 2022 21:41:14 +0200
 Subject: [PATCH] _distutils/sysconfig.py: make it possible to substite the
@@ -20,19 +20,19 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 10 insertions(+), 2 deletions(-)
 
 diff --git a/setuptools/_distutils/sysconfig.py b/setuptools/_distutils/sysconfig.py
-index a40a723..14f35e7 100644
+index 7ebe67687..8039021a8 100644
 --- a/setuptools/_distutils/sysconfig.py
 +++ b/setuptools/_distutils/sysconfig.py
-@@ -119,6 +119,8 @@ def get_python_inc(plat_specific=0, prefix=None):
+@@ -121,6 +121,8 @@ def get_python_inc(plat_specific=False, prefix=None):
      sys.base_exec_prefix -- i.e., ignore 'plat_specific'.
      """
      default_prefix = BASE_EXEC_PREFIX if plat_specific else BASE_PREFIX
 +    if os.environ.get('STAGING_INCDIR', ""):
 +        default_prefix = os.environ['STAGING_INCDIR'].rstrip('include')
      resolved_prefix = prefix if prefix is not None else default_prefix
-     try:
-         getter = globals()[f'_get_python_inc_{os.name}']
-@@ -238,7 +240,13 @@ def get_python_lib(plat_specific=0, standard_lib=0, prefix=None):
+     # MinGW imitates posix like layout, but os.name != posix
+     os_name = "posix" if is_mingw() else os.name
+@@ -241,7 +243,13 @@ def get_python_lib(plat_specific=False, standard_lib=False, prefix=None):
  
      early_prefix = prefix
  
@@ -47,7 +47,7 @@ index a40a723..14f35e7 100644
          if standard_lib:
              prefix = plat_specific and BASE_EXEC_PREFIX or BASE_PREFIX
          else:
-@@ -253,7 +261,7 @@ def get_python_lib(plat_specific=0, standard_lib=0, prefix=None):
+@@ -256,7 +264,7 @@ def get_python_lib(plat_specific=False, standard_lib=False, prefix=None):
              # Pure Python
              libdir = "lib"
          implementation = 'pypy' if IS_PYPY else 'python'
@@ -56,3 +56,6 @@ index a40a723..14f35e7 100644
          return _posix_lib(standard_lib, libpython, early_prefix, prefix)
      elif os.name == "nt":
          if standard_lib:
+-- 
+2.39.2
+
diff --git a/meta/recipes-devtools/python/python3-setuptools_69.5.1.bb b/meta/recipes-devtools/python/python3-setuptools_70.3.0.bb
similarity index 94%
rename from meta/recipes-devtools/python/python3-setuptools_69.5.1.bb
rename to meta/recipes-devtools/python/python3-setuptools_70.3.0.bb
index cc6256db80..291601ca98 100644
--- a/meta/recipes-devtools/python/python3-setuptools_69.5.1.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_70.3.0.bb
@@ -11,7 +11,7 @@ SRC_URI:append:class-native = " file://0001-conditionally-do-not-fetch-code-by-e
 SRC_URI += " \
             file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
 
-SRC_URI[sha256sum] = "6c1fccdac05a97e598fb0ae3bbed5904ccb317337a51139dcd51453611bbb987"
+SRC_URI[sha256sum] = "f171bab1dfbc86b132997f26a119f6056a57950d058587841a0082e8830f9dc5"
 
 DEPENDS += "python3"
 
-- 
2.39.2


