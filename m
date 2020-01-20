Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
	[209.85.128.54])
	by mail.openembedded.org (Postfix) with ESMTP id B71E37FC8E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 17:25:23 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id m24so135272wmc.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 09:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=TIwiZjkV5X88MkYVgqGrpzt5H/A1Mm9jURuTtnuOeGE=;
	b=Lk8b/l8RlnD95ql7bxg5nfZW1JOV/P5MwoFLfEHyGAvRu6w+Q1cVDzO0KJOzjtA76X
	5HYwbjfTpi2Qyxh1m8Qb6lHcFcXEsv8YUPxtTDQN5R5zn0HGIy5sXg5xatq+hLkF0xGp
	N008KuR9O/l1Ru1wd41KcmyIoKUW2Mzc8FfLSezqgcRWqXrf/scKQ2jZZYBYBtsNm6e/
	skRWLma6isyh0rYOdqEma6Abmyriwfn9EYlG1yVo5BMaXlBJ4uWbUuxkS/oDwa2a37hE
	D4Mdmo4XaYaEOUGqJIkJ0nh6vTFt+k07RYy/TQ7vZtqb2KKxj7wrGnHoDrCdbOQRUVPY
	yGdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=TIwiZjkV5X88MkYVgqGrpzt5H/A1Mm9jURuTtnuOeGE=;
	b=CleCJafBywm+SJ3rtNpu1n+qFx69MzLHKFRUrMqQzUT04NXcM/dodM0mDNh2YMOUVg
	xaxdyPvcGidIXjPBYNkxW4fBBMLY5J2vPaY9+tFu2g/aYfNZtfNMTw1Dy9CkFz+blQLy
	NNSF//mwgMCtwa2TE/DDIJO/VUDeZONShvx9ziaI2ePDktNn41vcQIyXG6y4JxL9bb6M
	lLxrB9zrr0TUOEaPeRmQgHGCGyVp/jvn3XIxiZV/nkkZ5Ub5rL5+148ULRP7eyCiB75B
	z1J5MFZYma3Jjyl7rL/c17JZ2LoeV8Srwo6Ed+uGKFu9nGmF0LxNvPnxGTzTLatN9SmX
	v/tQ==
X-Gm-Message-State: APjAAAXQ3LAWJwdDeshcQ86SjIaQjlmFXjYhB3XulT+Lns1VxoiRbtv2
	KLs7PTGwqZh1LwkCd97vUy5BIqau
X-Google-Smtp-Source: APXvYqzgCPoyMBQZPtw1FNxjAQKn0tHIJrPM5ujIawpaKBOOCKVpb5P4lX9ZySvWUxOOBgE8r0KoSQ==
X-Received: by 2002:a1c:b603:: with SMTP id g3mr368480wmf.133.1579541124031;
	Mon, 20 Jan 2020 09:25:24 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id x11sm31526wmg.46.2020.01.20.09.25.23
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 20 Jan 2020 09:25:23 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Jan 2020 18:24:48 +0100
Message-Id: <20200120172510.22648-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200120172510.22648-1-alex.kanavin@gmail.com>
References: <20200120172510.22648-1-alex.kanavin@gmail.com>
Subject: [PATCH 02/24] python3: do not compile .pyc in parallel during do_install()
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 20 Jan 2020 17:25:24 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...file-do-not-compile-.pyc-in-parallel.patch | 58 +++++++++++++++++++
 ...fig-append-STAGING_LIBDIR-python-sys.patch |  2 +-
 ...tutils-prefix-is-inside-staging-area.patch |  2 +-
 meta/recipes-devtools/python/python3_3.8.1.bb |  1 +
 4 files changed, 61 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python3/0001-Makefile-do-not-compile-.pyc-in-parallel.patch

diff --git a/meta/recipes-devtools/python/python3/0001-Makefile-do-not-compile-.pyc-in-parallel.patch b/meta/recipes-devtools/python/python3/0001-Makefile-do-not-compile-.pyc-in-parallel.patch
new file mode 100644
index 00000000000..b1bceac512e
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0001-Makefile-do-not-compile-.pyc-in-parallel.patch
@@ -0,0 +1,58 @@
+From c501e121a872cbcef8ffe626c1de173a125be9f8 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Thu, 16 Jan 2020 12:34:20 +0100
+Subject: [PATCH] Makefile: do not compile .pyc in parallel
+
+This was found to break reproducibility, and produce strange file ownership
+races.
+
+The upstream commit introducing the change was:
+https://github.com/python/cpython/commit/1a2dd82f56bd813aacc570e172cefe55a8a41504
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ Makefile.pre.in | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/Makefile.pre.in b/Makefile.pre.in
+index 1241112..5dfdf44 100644
+--- a/Makefile.pre.in
++++ b/Makefile.pre.in
+@@ -1457,30 +1457,30 @@ libinstall:	build_all $(srcdir)/Modules/xxmodule.c
+ 	fi
+ 	-PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
+ 		$(PYTHON_FOR_BUILD) -Wi $(DESTDIR)$(LIBDEST)/compileall.py \
+-		-j0 -d $(LIBDEST) -f \
++		-d $(LIBDEST) -f \
+ 		-x 'bad_coding|badsyntax|site-packages|lib2to3/tests/data' \
+ 		$(DESTDIR)$(LIBDEST)
+ 	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
+ 		$(PYTHON_FOR_BUILD) -Wi -O $(DESTDIR)$(LIBDEST)/compileall.py \
+-		-j0 -d $(LIBDEST) -f \
++		-d $(LIBDEST) -f \
+ 		-x 'bad_coding|badsyntax|site-packages|lib2to3/tests/data' \
+ 		$(DESTDIR)$(LIBDEST)
+ 	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
+ 		$(PYTHON_FOR_BUILD) -Wi -OO $(DESTDIR)$(LIBDEST)/compileall.py \
+-		-j0 -d $(LIBDEST) -f \
++		-d $(LIBDEST) -f \
+ 		-x 'bad_coding|badsyntax|site-packages|lib2to3/tests/data' \
+ 		$(DESTDIR)$(LIBDEST)
+ 	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
+ 		$(PYTHON_FOR_BUILD) -Wi $(DESTDIR)$(LIBDEST)/compileall.py \
+-		-j0 -d $(LIBDEST)/site-packages -f \
++		-d $(LIBDEST)/site-packages -f \
+ 		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
+ 	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
+ 		$(PYTHON_FOR_BUILD) -Wi -O $(DESTDIR)$(LIBDEST)/compileall.py \
+-		-j0 -d $(LIBDEST)/site-packages -f \
++		-d $(LIBDEST)/site-packages -f \
+ 		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
+ 	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
+ 		$(PYTHON_FOR_BUILD) -Wi -OO $(DESTDIR)$(LIBDEST)/compileall.py \
+-		-j0 -d $(LIBDEST)/site-packages -f \
++		-d $(LIBDEST)/site-packages -f \
+ 		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
+ 	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
+ 		$(PYTHON_FOR_BUILD) -m lib2to3.pgen2.driver $(DESTDIR)$(LIBDEST)/lib2to3/Grammar.txt
diff --git a/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch b/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch
index 03719cafcdf..03f60088fe6 100644
--- a/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch
+++ b/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch
@@ -1,4 +1,4 @@
-From 14eecf00459c0af698ed811e4f8bea460aada681 Mon Sep 17 00:00:00 2001
+From 77b7af7859bb925c31c5bcbf33f30569a0bc1d40 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 31 Jan 2019 16:46:30 +0100
 Subject: [PATCH] distutils/sysconfig: append
diff --git a/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch b/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
index 3105f0d1760..6fe9839f776 100644
--- a/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
+++ b/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
@@ -1,4 +1,4 @@
-From 6ca960869738fc89041a2e672d8e28b51e73d3c6 Mon Sep 17 00:00:00 2001
+From b1f68fe102b289a10504fae716a9eaa8677e3c5b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 14 May 2013 15:00:26 -0700
 Subject: [PATCH] python3: Add target and native recipes
diff --git a/meta/recipes-devtools/python/python3_3.8.1.bb b/meta/recipes-devtools/python/python3_3.8.1.bb
index a798f9828a6..a71c207d9fa 100644
--- a/meta/recipes-devtools/python/python3_3.8.1.bb
+++ b/meta/recipes-devtools/python/python3_3.8.1.bb
@@ -28,6 +28,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-test_locale.py-correct-the-test-output-format.patch \
            file://0017-setup.py-do-not-report-missing-dependencies-for-disa.patch \
            file://0001-setup.py-pass-missing-libraries-to-Extension-for-mul.patch \
+           file://0001-Makefile-do-not-compile-.pyc-in-parallel.patch \
            "
 
 SRC_URI_append_class-native = " \
-- 
2.17.1


