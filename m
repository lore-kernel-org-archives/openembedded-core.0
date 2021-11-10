Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17435C433FE
	for <webhook@archiver.kernel.org>; Wed, 10 Nov 2021 19:40:00 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web09.376.1636573199200698447
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 11:39:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=g3tCh7EO;
 spf=pass (domain: gmail.com, ip: 209.85.128.50,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id
 c71-20020a1c9a4a000000b0032cdcc8cbafso2780544wme.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 11:39:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ygCEpMlukJaHREKjbmqcx1zgpHTo0RKGfSwJOBM87uE=;
        b=g3tCh7EOs1+aB3S7gM/ZqHLjppOYsqzXWBrZhfHxBe7ixdTgsI0Xs13ZJzQnkdSCTr
         JpnW/3fuqz9PY0bXRwYCjZr2rdl6XLJUuvaG0VXiglj6t7o9OVDPAWhC8BhYMSDghr5H
         Oq6s6VHzoXUB9WDGIKphj0GFISEgmST3u97wKN70oWTRGEYp8BfNvMzwinD+dq8VYaCV
         KskWsaNs0O28ghS0yQfCisbtJ/wP2uy6LyF0yrZAfF0S8aUgVFVinhHa8peZuV3VI+kG
         O6ggWZ7o982Tk3TH8Pd9iAH2W/sCFg6xyL1IT598409bh1280ZI2jwwwqvnRwmVL7gNG
         e56Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ygCEpMlukJaHREKjbmqcx1zgpHTo0RKGfSwJOBM87uE=;
        b=S9GSIGia4ZYRNPejm9pp3xDBqlELytVlx/rLCRFHJPu25QQcEZs78onK/2WiIq0cmz
         H9aMSz0T1f6phZrFC7QKSPy+f3uDfaV9sDCvIunS/Ypez9btoGkuydBch5zEqUDdj7Ki
         7IVYCZPwF5bBrTr0NV8z+kWBmnzrxmrMBnywlUy/paW1LHud9V5x9IQ8v3slTf3Dj9tT
         UOW4JlFscIdAHFCMhRxwTJSPHqJdZh+n1Blvpr0nOynl+awCCSbLICa+H4HK+zcaLXFG
         2GD32TPCBPqknDNftxTZrF3WxKaHknRESk7LaE3tlZvXYbds891OD3TlsnvHtaxgjXZR
         cL9Q==
X-Gm-Message-State: AOAM532qCr8WPDgdnMBB4NUxwPofQFcmDbo0++TrE4BJllKjkG7it6io
	+N/dqYZtE4Ce/w2f7kEOW59ZS88tusk=
X-Google-Smtp-Source: 
 ABdhPJyFeYXLl3z+F7Qd6gPmkSI0w61rutuRjpWuF0D0s2MqG+V5vaBf2lflQr/TBvkPVtDpNRKoww==
X-Received: by 2002:a05:600c:210d:: with SMTP id
 u13mr1860338wml.82.1636573197801;
        Wed, 10 Nov 2021 11:39:57 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 q18sm6865124wmc.7.2021.11.10.11.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 11:39:57 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 21/24] meson: upgrade 0.59.2 -> 0.60.1
Date: Wed, 10 Nov 2021 20:39:34 +0100
Message-Id: <20211110193937.2606747-21-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211110193937.2606747-1-alex@linutronix.de>
References: <20211110193937.2606747-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Nov 2021 19:40:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158105

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/meson/meson.inc         |  2 +-
 ...-not-manipulate-the-environment-when.patch | 53 +++++++++----------
 .../meson/meson/disable-rpath-handling.patch  | 14 ++---
 .../{meson_0.59.2.bb => meson_0.60.1.bb}      |  0
 ...on_0.59.2.bb => nativesdk-meson_0.60.1.bb} |  0
 5 files changed, 33 insertions(+), 36 deletions(-)
 rename meta/recipes-devtools/meson/{meson_0.59.2.bb => meson_0.60.1.bb} (100%)
 rename meta/recipes-devtools/meson/{nativesdk-meson_0.59.2.bb => nativesdk-meson_0.60.1.bb} (100%)

diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/recipes-devtools/meson/meson.inc
index 174ebd9f31..f383ad9f74 100644
--- a/meta/recipes-devtools/meson/meson.inc
+++ b/meta/recipes-devtools/meson/meson.inc
@@ -15,7 +15,7 @@ SRC_URI = "https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${P
            file://0002-Support-building-allarch-recipes-again.patch \
            file://0001-is_debianlike-always-return-False.patch \
            "
-SRC_URI[sha256sum] = "13dee549a7ba758b7e33ce7719f28d1d337a98d10d378a4779ccc996f5a2fc49"
+SRC_URI[sha256sum] = "5add789c953d984b500858b2851ee3d7add0460cf1a6f852f0a721af17384e13"
 
 UPSTREAM_CHECK_URI = "https://github.com/mesonbuild/meson/releases"
 UPSTREAM_CHECK_REGEX = "meson-(?P<pver>\d+(\.\d+)+)\.tar"
diff --git a/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch b/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch
index fdadc6869b..86abfa9d52 100644
--- a/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch
+++ b/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch
@@ -1,4 +1,4 @@
-From 2264e67d7c2c22ca634fd26ea8ada6f0344ab280 Mon Sep 17 00:00:00 2001
+From dd5b4a200cd2fdf7fef627c4b6752f90c00b863a Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 19 Nov 2018 14:24:26 +0100
 Subject: [PATCH] python module: do not manipulate the environment when calling
@@ -8,36 +8,31 @@ Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 
 ---
- mesonbuild/modules/python.py | 12 ------------
- 1 file changed, 12 deletions(-)
+ mesonbuild/modules/python.py | 7 +------
+ 1 file changed, 1 insertion(+), 6 deletions(-)
 
 diff --git a/mesonbuild/modules/python.py b/mesonbuild/modules/python.py
-index 422155b..aaf5844 100644
+index f479ab9..b934bc6 100644
 --- a/mesonbuild/modules/python.py
 +++ b/mesonbuild/modules/python.py
-@@ -70,11 +70,6 @@ class PythonDependency(ExternalDependency):
-                 old_pkg_libdir = os.environ.get('PKG_CONFIG_LIBDIR')
-                 old_pkg_path = os.environ.get('PKG_CONFIG_PATH')
- 
--                os.environ.pop('PKG_CONFIG_PATH', None)
--
--                if pkg_libdir:
--                    os.environ['PKG_CONFIG_LIBDIR'] = pkg_libdir
--
-                 try:
-                     self.pkgdep = PkgConfigDependency(pkg_name, environment, kwargs)
-                     mlog.debug(f'Found "{pkg_name}" via pkgconfig lookup in LIBPC ({pkg_libdir})')
-@@ -83,13 +78,6 @@ class PythonDependency(ExternalDependency):
-                     mlog.debug(f'"{pkg_name}" could not be found in LIBPC ({pkg_libdir})')
-                     mlog.debug(e)
- 
--                if old_pkg_path is not None:
--                    os.environ['PKG_CONFIG_PATH'] = old_pkg_path
--
--                if old_pkg_libdir is not None:
--                    os.environ['PKG_CONFIG_LIBDIR'] = old_pkg_libdir
--                else:
--                    os.environ.pop('PKG_CONFIG_LIBDIR', None)
-             else:
-                 mlog.debug(f'"{pkg_name}" could not be found in LIBPC ({pkg_libdir}), this is likely due to a relocated python installation')
+@@ -239,10 +239,6 @@ def python_factory(env: 'Environment', for_machine: 'MachineChoice',
+         # If python-X.Y.pc exists in LIBPC, we will try to use it
+         def wrap_in_pythons_pc_dir(name: str, env: 'Environment', kwargs: T.Dict[str, T.Any],
+                                    installation: 'PythonInstallation') -> 'ExternalDependency':
+-            old_pkg_libdir = os.environ.pop('PKG_CONFIG_LIBDIR', None)
+-            old_pkg_path = os.environ.pop('PKG_CONFIG_PATH', None)
+-            if pkg_libdir:
+-                os.environ['PKG_CONFIG_LIBDIR'] = pkg_libdir
+             try:
+                 return PythonPkgConfigDependency(name, env, kwargs, installation)
+             finally:
+@@ -251,8 +247,7 @@ def python_factory(env: 'Environment', for_machine: 'MachineChoice',
+                         os.environ[name] = value
+                     elif name in os.environ:
+                         del os.environ[name]
+-                set_env('PKG_CONFIG_LIBDIR', old_pkg_libdir)
+-                set_env('PKG_CONFIG_PATH', old_pkg_path)
++                pass
  
+         candidates.extend([
+             functools.partial(wrap_in_pythons_pc_dir, pkg_name, env, kwargs, installation),
diff --git a/meta/recipes-devtools/meson/meson/disable-rpath-handling.patch b/meta/recipes-devtools/meson/meson/disable-rpath-handling.patch
index 7c766c61b0..7aaed8b4a3 100644
--- a/meta/recipes-devtools/meson/meson/disable-rpath-handling.patch
+++ b/meta/recipes-devtools/meson/meson/disable-rpath-handling.patch
@@ -1,4 +1,4 @@
-From 27bbd3c9d8d86de545fcf6608564a14571c98a61 Mon Sep 17 00:00:00 2001
+From 18600f7a1cddf23aeabd188f86e66983f27ccfe3 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Fri, 23 Nov 2018 15:28:28 +0000
 Subject: [PATCH] meson: Disable rpath stripping at install time
@@ -10,26 +10,28 @@ is a specific directive to do something differently in the project.
 RP 2018/11/23
 
 Upstream-Status: Submitted [https://github.com/mesonbuild/meson/issues/2567]
-
 ---
  mesonbuild/minstall.py | 7 +++++--
  1 file changed, 5 insertions(+), 2 deletions(-)
 
 diff --git a/mesonbuild/minstall.py b/mesonbuild/minstall.py
-index 212568a..06366d4 100644
+index 7d0da13..17d50db 100644
 --- a/mesonbuild/minstall.py
 +++ b/mesonbuild/minstall.py
-@@ -653,8 +653,11 @@ class Installer:
+@@ -718,8 +718,11 @@ class Installer:
              if file_copied:
                  self.did_install_something = True
                  try:
 -                    self.fix_rpath(outname, t.rpath_dirs_to_remove, install_rpath, final_path,
--                                         install_name_mappings, verbose=False)
+-                                   install_name_mappings, verbose=False)
 +                    if install_rpath:
 +                        self.fix_rpath(outname, t.rpath_dirs_to_remove, install_rpath, final_path,
-+                                           install_name_mappings, verbose=False)
++                                       install_name_mappings, verbose=False)
 +                    else:
 +                        print("RPATH changes at install time disabled")
                  except SystemExit as e:
                      if isinstance(e.code, int) and e.code == 0:
                          pass
+-- 
+2.20.1
+
diff --git a/meta/recipes-devtools/meson/meson_0.59.2.bb b/meta/recipes-devtools/meson/meson_0.60.1.bb
similarity index 100%
rename from meta/recipes-devtools/meson/meson_0.59.2.bb
rename to meta/recipes-devtools/meson/meson_0.60.1.bb
diff --git a/meta/recipes-devtools/meson/nativesdk-meson_0.59.2.bb b/meta/recipes-devtools/meson/nativesdk-meson_0.60.1.bb
similarity index 100%
rename from meta/recipes-devtools/meson/nativesdk-meson_0.59.2.bb
rename to meta/recipes-devtools/meson/nativesdk-meson_0.60.1.bb
-- 
2.20.1


