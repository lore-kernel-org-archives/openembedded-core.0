Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B493EC47DD9
	for <webhook@archiver.kernel.org>; Sun, 25 Feb 2024 09:37:48 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web10.36286.1708853860597142042
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Feb 2024 01:37:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GusJvjxW;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-563fe793e1cso2861092a12.3
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Feb 2024 01:37:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708853859; x=1709458659; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dHx7MIetbs+Vz09St1ipZWgKd8HK8lco0ypEEL7uCnM=;
        b=GusJvjxWpqX1Iypc5u9r5qi5/Pqdjk9bWfvbQIgftry+rRzCs8agBQCDcYaJgX7Bqx
         HfdNr+7YH/rEKtbF39Xt2goM3b8/Tyga3oLsQJzPFllQEHjZlDmbiFE1gADjwJYVlT2D
         x4HZRr1bJ1l+6O+0khXB0ho1WZWHVIEQRUYo5kUW0MRejte2sZmBACwVjRSeFEdNtkrJ
         KHy03tW6pdmctyEaaTj8KXKr+hAyEhlIEHan1J3aG3S4wfTOBDKWoik6h0npcdSFiTtS
         UbroaLOXfKsv7RYjDl/y9eShksWZ4HU5qpf1ivMGtQZ+5qqfBFbTo9hxmz5rmkcGEErB
         fZmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708853859; x=1709458659;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dHx7MIetbs+Vz09St1ipZWgKd8HK8lco0ypEEL7uCnM=;
        b=uN8h9SPG/eW1rQMl2Mak9JcrksMOiNls4vSMELuUvzhrmba2Y8wq+msA9cKmozgjSe
         6nPYvpcgbX0dmQINr93yUWM07k693+S4B8zotDDCh7ItsG5rcFVQ7jcoN2Isf13fsfzy
         LZJOD4oQ/gmxN1tKH6RcFZIzPWzgvLZTDhTvO3HFEMud5ASVxXj9usTrlEFLoWc1td7A
         fHIP3ZdaNe+mt5yhn6VLHRZ4j1qiuf6l5+OMJjZXaw54sbEhH343hQkbndrAZ0CmvDuI
         Agma3vKf7bXjHVTuvcHM0E2bxA7IB8VlmNbZD6k3YmvvAJ7QJK1y7Me1JpiY/Isigcm3
         m14g==
X-Gm-Message-State: AOJu0Yzg7WTFqTm4iXbZQgrPLukfUU/sbXl3MpncGwv2I5R/c2fep129
	XUWh2s9nWBFOftdR6Os9/Y07uEdoV1G3gzGw6r99EmsWpKxpLqvH5FrxUow0
X-Google-Smtp-Source: AGHT+IHwLT0TCDxoRkZUkS1/692azZVdLOaMEry1qB0A2TOFMEywCythj3eJ8XQJT15OKtz5mnoJjg==
X-Received: by 2002:aa7:d385:0:b0:565:9b29:ad3e with SMTP id x5-20020aa7d385000000b005659b29ad3emr2243280edq.6.1708853858816;
        Sun, 25 Feb 2024 01:37:38 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id w8-20020a056402070800b00565d42006b8sm391335edx.62.2024.02.25.01.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 01:37:38 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH] glib-2.0: backport a switch from distutils to packaging in codegen
Date: Sun, 25 Feb 2024 10:37:26 +0100
Message-ID: <20240225093726.1113403-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Feb 2024 09:37:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196136

* to fix build on hosts with python-3.12, now it fails with:

Traceback (most recent call last):
  File "recipe-sysroot-native/usr/bin/gdbus-codegen", line 53, in <module>
    from codegen import codegen_main
  File "recipe-sysroot-native/usr/share/glib-2.0/codegen/codegen_main.py", line 29, in <module>
    from . import dbustypes
  File "recipe-sysroot-native/usr/share/glib-2.0/codegen/dbustypes.py", line 22, in <module>
    from . import utils
  File "recipe-sysroot-native/usr/share/glib-2.0/codegen/utils.py", line 22, in <module>
    import distutils.version
ModuleNotFoundError: No module named 'distutils'
CMake Error at CMakeLists.txt:90 (message):
  Error in generating code for connman interface using gdbus-codegen

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 ...deprecated-distutils-module-to-the-p.patch | 34 +++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb |  1 +
 meta/recipes-core/glib-2.0/glib.inc           |  4 +--
 3 files changed, 36 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-Switch-from-the-deprecated-distutils-module-to-the-p.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Switch-from-the-deprecated-distutils-module-to-the-p.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-Switch-from-the-deprecated-distutils-module-to-the-p.patch
new file mode 100644
index 0000000000..50368ed22c
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-Switch-from-the-deprecated-distutils-module-to-the-p.patch
@@ -0,0 +1,34 @@
+From 05f0674c93d94fe6b29c1b707980aac469ddcd72 Mon Sep 17 00:00:00 2001
+From: Jordan Williams <jordan@jwillikers.com>
+Date: Fri, 1 Dec 2023 09:53:50 -0600
+Subject: [PATCH] Switch from the deprecated distutils module to the packaging
+ module
+
+The distutils module was removed in Python 3.12.
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/6ef967a0f930ce37a8c9b5aff969693b34714291]
+
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+---
+ gio/gdbus-2.0/codegen/utils.py | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/gio/gdbus-2.0/codegen/utils.py b/gio/gdbus-2.0/codegen/utils.py
+index 0204610..08f1ba9 100644
+--- a/gio/gdbus-2.0/codegen/utils.py
++++ b/gio/gdbus-2.0/codegen/utils.py
+@@ -19,7 +19,7 @@
+ #
+ # Author: David Zeuthen <davidz@redhat.com>
+ 
+-import distutils.version
++import packaging.version
+ import os
+ import sys
+ 
+@@ -166,4 +166,4 @@ def version_cmp_key(key):
+         v = str(key[0])
+     else:
+         v = "0"
+-    return (distutils.version.LooseVersion(v), key[1])
++    return (packaging.version.Version(v), key[1])
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb
index 42814ba544..6c3e99c641 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb
@@ -14,6 +14,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://0001-Do-not-write-bindir-into-pkg-config-files.patch \
            file://0001-meson-Run-atomics-test-on-clang-as-well.patch \
            file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch \
+           file://0001-Switch-from-the-deprecated-distutils-module-to-the-p.patch \
            file://memory-monitor.patch \
            file://native-gtkdoc.patch \
            "
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 5a57549d85..fac8875d84 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -144,9 +144,7 @@ do_install:append:mingw32() {
         rm -f ${D}${bindir}/gtester-report
 }
 
-# remove setuptools dependency when usage of distutils is dropped in
-# https://gitlab.gnome.org/GNOME/glib/-/blob/main/gio/gdbus-2.0/codegen/utils.py
-CODEGEN_PYTHON_RDEPENDS = "python3 python3-setuptools python3-xml"
+CODEGEN_PYTHON_RDEPENDS = "python3 python3-packaging python3-xml"
 CODEGEN_PYTHON_RDEPENDS:mingw32 = ""
 
 RDEPENDS:${PN}-codegen += "${CODEGEN_PYTHON_RDEPENDS}"
-- 
2.43.2


