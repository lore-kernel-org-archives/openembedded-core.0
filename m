Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web12.9525.1608629889065962207
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Dec 2020 01:38:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UzgWJ3TA;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id i24so12301994edj.8
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Dec 2020 01:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pOkC/7S6Aiinn5gze/krGPOJirNpC8iMciiRoMp+p4I=;
        b=UzgWJ3TAIIzxlr1W0xcWfJxGpciXeZgmfloWwyMHAx7ZHaFjf27Sd6Ken/g0SyrgQB
         peHMdoH2Sf89lBV6c0XvYxorKpZ3v5HwbOC578E0UX3egGYjj/sB3twfOQThT+Doi59A
         Mx//EBgAkZPNW6dH8E9Gx5mGQn4Tq0MNOm/VIxYTFDqvAiiI6EDeQG9AY6GUDlETfUsT
         swm89xxwZlSPq1JTLngtUIAL95PQdMdasAkd0lJrcs2tGv0NBVBd+ofSpBoudwsaGl+V
         unf/q4f+0r+dupoSfm+7vpaPrGhQi51DGBkNv6GrKJltsGfaAg99i+ZFfqPym2xONUXm
         t3iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pOkC/7S6Aiinn5gze/krGPOJirNpC8iMciiRoMp+p4I=;
        b=O5yCy1+5arQAth3Ls/fihQk3wc7k18GQgKeU7EjyZsKdYBilKLrq1LlGOUKBdP/xp4
         qGc2WkVFQgk8dcF08ZU4SJ4ay4Xdj3Q1m6cUwpMXGUbnP4tf4dG7N3Yr12FlVRkFvvh7
         C5qI+kdkkDM5XWL8Jl3QjcwvR6SJywjKVJ0ouPRPCXQKUmcsqi2BXtzk0sLz0Qo6Aibn
         iPIabMjeUAibEYoCWz91Cv25TZwS6n7ZOBEyAywHEnTGQ3luGISyfN9w92WEp5lsx+1k
         Kz7l2osOzkzjlwAaU8pJB6GlcN2uZS39ONZaQkQ2CtyekmLjLxKr9N62MERlFk7w0FHj
         GqMA==
X-Gm-Message-State: AOAM533kwBEQvkpdZbu2UvzKVL02x05WjO9AReW6aGE7r2Bkhcyzr3Tb
	xYgcciBm4OzB+gw1iaufTdpG99jD+6A=
X-Google-Smtp-Source: ABdhPJwZdYX8CfjwwgsEPVYnEUCRSSHLbth/Mj/XkDa1++uuwozNkYib2qgnIITNIoRP+2IAd6HSpA==
X-Received: by 2002:a05:6402:2070:: with SMTP id bd16mr18901906edb.107.1608629887578;
        Tue, 22 Dec 2020 01:38:07 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id m7sm30151576eds.73.2020.12.22.01.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Dec 2020 01:38:07 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH] glib-2.0: add a patch to increase a test timeout
Date: Tue, 22 Dec 2020 10:37:57 +0100
Message-Id: <20201222093758.19030-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There have been intermittent ptest failures in this test;
I couldn't reproduce the failures in isolation, and
this is the only reason I can think of from reading code.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...degen.py-bump-timeout-to-100-seconds.patch | 26 +++++++++++++++++++
 .../glib-2.0/glib-2.0/relocate-modules.patch  |  2 +-
 meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb |  1 +
 3 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-codegen.py-bump-timeout-to-100-seconds.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-codegen.py-bump-timeout-to-100-seconds.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-codegen.py-bump-timeout-to-100-seconds.patch
new file mode 100644
index 0000000000..508c8c3bad
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-codegen.py-bump-timeout-to-100-seconds.patch
@@ -0,0 +1,26 @@
+From b833254bcc9fcf4cdc2572027b1154d799535ca4 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Sun, 20 Dec 2020 22:01:43 +0100
+Subject: [PATCH] gio/tests/codegen.py: bump timeout to 100 seconds
+
+This may be necessary on overloaded CI systems.
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ gio/tests/codegen.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gio/tests/codegen.py b/gio/tests/codegen.py
+index 51de0ed..ca98c9d 100644
+--- a/gio/tests/codegen.py
++++ b/gio/tests/codegen.py
+@@ -51,7 +51,7 @@ class TestCodegen(unittest.TestCase):
+     cwd = ''
+ 
+     def setUp(self):
+-        self.timeout_seconds = 10  # seconds per test
++        self.timeout_seconds = 100  # seconds per test
+         self.tmpdir = tempfile.TemporaryDirectory()
+         self.cwd = os.getcwd()
+         os.chdir(self.tmpdir.name)
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
index 2b8e930511..4cbcc29a50 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
@@ -1,4 +1,4 @@
-From 85931fbb981b5aae38f1c1370d5d3c091cb862b8 Mon Sep 17 00:00:00 2001
+From 011c9f024b6475d31e7d5432a38d00fb67eaea40 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Fri, 11 Mar 2016 15:35:55 +0000
 Subject: [PATCH] glib-2.0: relocate the GIO module directory for native builds
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb
index 1f83660856..01ed54d06a 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb
@@ -16,6 +16,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://0001-Do-not-write-bindir-into-pkg-config-files.patch \
            file://0001-meson-Run-atomics-test-on-clang-as-well.patch \
            file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch \
+           file://0001-gio-tests-codegen.py-bump-timeout-to-100-seconds.patch \
            "
 
 SRC_URI_append_class-native = " file://relocate-modules.patch"
-- 
2.29.2

