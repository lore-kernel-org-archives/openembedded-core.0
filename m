Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3DBFC98338
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 16:50:47 +0000 (UTC)
Received: from mail-wr2-f32.google.com (mail-wr2-f32.google.com [74.125.225.96])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39766.1790527845301370350
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Sep 2026 09:50:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZaOkqGXv;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.225.96, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr2-f32.google.com with SMTP id ffacd0b85a97d-482f6350f91so1298908f8f.1
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 09:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1790527843; x=1791132643; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1YKTlNHBDx8fsqTgSHhKH8xumaEqmA2yeU/+Yb6O208=;
        b=ZaOkqGXv1UZlDnPlPxLIK4b0rORggCwwskaBwuekzFfMTdg/fAMWPNksCiZwHvABrF
         z68iRP5wfKJnRGwsRPekHqM1P+ktcsZyzVyClccvbFPBOUFRTVMBisSCFxKkaa+O7GP+
         QFuWGP/hlsu5HBOZB340Ys1X/Y9d0aUFD3LKk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790527843; x=1791132643;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1YKTlNHBDx8fsqTgSHhKH8xumaEqmA2yeU/+Yb6O208=;
        b=x6u8YF3QoLFovqlKPthg8nBVQPxwNPBWgDdYF8RRvXBKWKKYwnVXm77baUogJyUlpt
         Ga2FHnD+28OKkVWwu/AxVHgiDSNfubTEFTBHVDWHRoX8UlCUR6D/UON6t1anuCmXIbPp
         W8ZSZOiv5I9Md4kHMBlErrOe9Gxe7fzicCKbeclQlKxY4mW9S1tsoP6kOozPgkmKyz9g
         VkYLzETAnHBvvxleXwblrjojcr26kE/AHGcHRvXFVfcoiv7LxCAQRdXlhice8wR5MIov
         pUu6Y+4JUk5WaQbje1V2tzWV1e5OF3yjFE22lvfyo65DNY6spJZ6WUE3YNPML43yVqp0
         3KfA==
X-Gm-Message-State: AFq9FYL0JZHngtUuEw8lkDi8BF9VYRP1bCia4ApjbmuCZvJCZBya0GEZ
	6EYUZGcM8qvZvaDiOJdRYYYc9Fz8ouBk7og2Bzs6EscQlwCvPl/01meRY2giqzg0HbViWBUCogl
	Zj6JO9c8=
X-Gm-Gg: AYBFou2qgoBKKau8/C1zlfohc3BOiGtmgWb2ika5ITbFYR8L9SHIa/QGIqzolj+xn3V
	rFrsfYB63eamr3x0AAbPejy0CbuDPxsYwzywwcp+SqnZnOK4rwgkfGa+VY5VmzA6LNQnqYa20Ka
	y+O5bYDupo7mkZxUiNDx5/+4WjQVF1ZkKO2KtAsaE0XZLAMAnOPRd1EZJKX22kJXj+e1m5942RD
	R7VSSc8wtu7VcNNXagqPfypEBC5VlvRRxjAuz+yb9FnuDCvXRn1hftRuLE5luD8BCx5q3CYGjSw
	lIr3cOiy1+cutHhVgeyr9D3wo5ZEM0I7amNOAyNSX5ElAyumYxIXrNXkHh50vvmDB1dgsZD33BV
	LLc/vDT5ywDJICBy8RB0IzHsBif+DeYsYcf2k+YHNyabwRQ3VokDBNKtqLER42P9crpDi2lXOGL
	eB9Ps4EVBe9KDnH3nZOBi8Yl5zo9VOLeXa3teuinuaIZ0GLFaRpjmvI6e5XY6mCMTZpd9/r6PpD
	KE6ChCmfwOtPJ745JKBqGt7tK8=
X-Received: by 2002:a05:6000:61a:b0:487:106f:ee31 with SMTP id ffacd0b85a97d-4887db2ce4dmr12212043f8f.27.1790527843432;
        Sun, 27 Sep 2026 09:50:43 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:6474:fa9a:9a9b:3f85])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a74538asm20798235f8f.34.2026.09.27.09.50.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 09:50:42 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] gtk-doc: upgrade 1.36.1 -> 1.37.0
Date: Sun, 27 Sep 2026 17:50:39 +0100
Message-ID: <20260927165040.2525950-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 16:50:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246699

- Don't annotate get_type() functions with G_GNUC_CONST.
- Build: add an option to not check for runtime dependencies at build time.
- Translation updates.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...code-paths-to-perl-python-in-scripts.patch |  2 +-
 ...an-option-to-not-check-for-runtime-d.patch | 56 -------------------
 .../gtk-doc/files/no-clobber.patch            |  2 +-
 .../gtk-doc/files/pkg-config-native.patch     |  2 +-
 .../{gtk-doc_1.36.1.bb => gtk-doc_1.37.0.bb}  |  3 +-
 5 files changed, 4 insertions(+), 61 deletions(-)
 delete mode 100644 meta/recipes-gnome/gtk-doc/files/0001-meson.build-add-an-option-to-not-check-for-runtime-d.patch
 rename meta/recipes-gnome/gtk-doc/{gtk-doc_1.36.1.bb => gtk-doc_1.37.0.bb} (90%)

diff --git a/meta/recipes-gnome/gtk-doc/files/0001-Do-not-hardocode-paths-to-perl-python-in-scripts.patch b/meta/recipes-gnome/gtk-doc/files/0001-Do-not-hardocode-paths-to-perl-python-in-scripts.patch
index c9d78145ff6..1203b7e6ce7 100644
--- a/meta/recipes-gnome/gtk-doc/files/0001-Do-not-hardocode-paths-to-perl-python-in-scripts.patch
+++ b/meta/recipes-gnome/gtk-doc/files/0001-Do-not-hardocode-paths-to-perl-python-in-scripts.patch
@@ -1,4 +1,4 @@
-From 00a3a827aca9e053cb0d69bea50a61fece341f0f Mon Sep 17 00:00:00 2001
+From e069b394874be4a8ce55ee0e50b08deb5633b358 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 31 Aug 2016 16:44:46 +0300
 Subject: [PATCH] Do not hardocode paths to perl/python in scripts.
diff --git a/meta/recipes-gnome/gtk-doc/files/0001-meson.build-add-an-option-to-not-check-for-runtime-d.patch b/meta/recipes-gnome/gtk-doc/files/0001-meson.build-add-an-option-to-not-check-for-runtime-d.patch
deleted file mode 100644
index 88ec64cdb32..00000000000
--- a/meta/recipes-gnome/gtk-doc/files/0001-meson.build-add-an-option-to-not-check-for-runtime-d.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From ffa3ed38663cc806f914691c63ca7d8fab959eef Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Sun, 21 Jun 2026 11:11:04 +0200
-Subject: [PATCH] meson.build: add an option to not check for runtime
- dependencies at build time
-
-pygments and parametrized are run-time dependencies, and should
-not be enforced at build time as they are never actually used then.
-
-This is especially useful in cross-compilation, as the modules
-are checked in the python installation on the build host, and that
-has no relevance to the target environment that the build outputs
-will be executed in.
-
-https://gitlab.gnome.org/GNOME/gtk-doc/-/merge_requests/105
-Upstream-Status: Backport [link above]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- meson.build       | 9 ++++++---
- meson_options.txt | 6 ++++++
- 2 files changed, 12 insertions(+), 3 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index 30f1520..e087cff 100644
---- a/meson.build
-+++ b/meson.build
-@@ -8,9 +8,12 @@ fs = import('fs')
- gnome = import('gnome')
- python = import('python')
- 
--required_python_modules = ['pygments']
--if get_option('tests')
--  required_python_modules += ['parameterized']
-+required_python_modules = []
-+if get_option('check_runtime_deps')
-+  required_python_modules = ['pygments']
-+  if get_option('tests')
-+    required_python_modules += ['parameterized']
-+  endif
- endif
- 
- python3 = python.find_installation('python3', modules: required_python_modules)
-diff --git a/meson_options.txt b/meson_options.txt
-index d44dbb4..84463b2 100644
---- a/meson_options.txt
-+++ b/meson_options.txt
-@@ -21,3 +21,9 @@ option(
-   type: 'boolean', value: true,
-   description: 'Build the test suite (requires glib and the parameterized python module)'
- )
-+
-+option(
-+  'check_runtime_deps',
-+  type: 'boolean', value: true,
-+  description: 'Check for runtime dependencies during build configuration'
-+)
diff --git a/meta/recipes-gnome/gtk-doc/files/no-clobber.patch b/meta/recipes-gnome/gtk-doc/files/no-clobber.patch
index a9c7154fc41..6c92920b551 100644
--- a/meta/recipes-gnome/gtk-doc/files/no-clobber.patch
+++ b/meta/recipes-gnome/gtk-doc/files/no-clobber.patch
@@ -1,4 +1,4 @@
-From 01a52d8cf076e2692d947c8ed2681cb794eaa3c0 Mon Sep 17 00:00:00 2001
+From b2607b8ed3a3468fe3bae3b24577406feca1004f Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Wed, 21 Mar 2018 14:47:29 +0000
 Subject: [PATCH] gtk-doc: don't regenerate gtk-doc in do_install
diff --git a/meta/recipes-gnome/gtk-doc/files/pkg-config-native.patch b/meta/recipes-gnome/gtk-doc/files/pkg-config-native.patch
index de16ea0cc6f..a3bef8af8e3 100644
--- a/meta/recipes-gnome/gtk-doc/files/pkg-config-native.patch
+++ b/meta/recipes-gnome/gtk-doc/files/pkg-config-native.patch
@@ -1,4 +1,4 @@
-From 0800f184cffc837276ea65b86e4efc7942eb1d7e Mon Sep 17 00:00:00 2001
+From 2d704126396de04b99a4090e1f36ef7479748a81 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Mon, 5 Sep 2016 22:25:44 +0100
 Subject: [PATCH] Use native pkg-config when looking for gtk-doc.
diff --git a/meta/recipes-gnome/gtk-doc/gtk-doc_1.36.1.bb b/meta/recipes-gnome/gtk-doc/gtk-doc_1.37.0.bb
similarity index 90%
rename from meta/recipes-gnome/gtk-doc/gtk-doc_1.36.1.bb
rename to meta/recipes-gnome/gtk-doc/gtk-doc_1.37.0.bb
index dcdeebe258a..52746a01f11 100644
--- a/meta/recipes-gnome/gtk-doc/gtk-doc_1.36.1.bb
+++ b/meta/recipes-gnome/gtk-doc/gtk-doc_1.37.0.bb
@@ -15,10 +15,9 @@ PACKAGECONFIG[tests] = "-Dtests=true,-Dtests=false,glib-2.0"
 
 EXTRA_OEMESON = "-Dyelp_manual=false -Dcheck_runtime_deps=false"
 
-SRC_URI[archive.sha256sum] = "0e517a5f97069831181be177516bde8aa8b3922398f2bdb09e265d22aecadbc5"
+SRC_URI[archive.sha256sum] = "2facfb530ddcd20c03ed4758ef934e832626c393e2cacd23fc1249b7ed0e4246"
 SRC_URI += "file://0001-Do-not-hardocode-paths-to-perl-python-in-scripts.patch \
            file://no-clobber.patch \
-           file://0001-meson.build-add-an-option-to-not-check-for-runtime-d.patch \
            "
 SRC_URI:append:class-native = " file://pkg-config-native.patch"
 

