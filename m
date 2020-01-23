Return-Path: <danismostlikely@gmail.com>
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
	[209.85.222.174])
	by mail.openembedded.org (Postfix) with ESMTP id 1FF137FDBE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 20:31:08 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id 21so4850811qky.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 12:31:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=Ea5m40il2y/mSIN4dt3Iv2UuqA0CygkWkyLKJSWONoY=;
	b=AbaZh8CO4OwOuX2QxWMTpHbyw9REfxu/+iJIIx5WGPbNgPzTduAmLQzBxBvyEDgfxy
	LBKFXLUrmZS9uJ4LpT/lIm4kKuYx9rx5RrrH8Nrz6RHYM7IP9tVtIAFib4W/f+B9sFtF
	GPgN+ndVy5R2vUVNbAv6COCjaxY9ZIQWr4ATi78xNnbwX5mLc+1BNV3LX1oOXpKPmFjI
	Xp0RNZA2l8AN0uvpu8aNzlK/Pfr/A7esUT3P6ygA2m/DL++iu0dS6OFT37k8IPyikZAJ
	S7g2AQYHrvjOyBcBcyOcKigsEmFlV39xoGF9sXHQCpPFKjoIsSmlv8+atzLl3raMoYyx
	DbDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Ea5m40il2y/mSIN4dt3Iv2UuqA0CygkWkyLKJSWONoY=;
	b=jlKERGdzh2EoWRgE+D1nCQfzAX+oNqB2X3Bq9V5LNyS6yTndgwTQ2TdHG1DA70c22z
	kxxBabDHpCeDfDjt28IAFtUPEOUUiMm4IWfKn9JZnoL4vKhW+ambhUsfQYee77HyJHiF
	8qthtrJlKpueNlL/fQpj1v5iMcGpAXOpwbFWsp+OtA3+5fM19cljFIuzNfY4HE/B7b97
	ipmhdf/ZRgFfPXD5oeMjbQXBpYxB0QUWgywNyQUbAkOrej4ZszVr8Gi9N0QD0zkoUiOs
	QcHNhRf+6wMJTllr3mbCwz0Xkcwn8m6NX7akYw1rgQH0LZ7QZqVeGRL50p9Bdp6mYZmF
	5wIg==
X-Gm-Message-State: APjAAAWvAgf/iOTYjVureb1PGtSTDpqJ/XXPxhWERky9cKdlP4iDDln7
	S55AOSsQPx5Mvf50lZY1LYmq5TNF
X-Google-Smtp-Source: APXvYqxQS1QU8Y7NNlIlHpvi89IsE5iqJgfyQiDZtWSbclrhJPwJQhe/pxXAkOrT4pisBJtPODaDmA==
X-Received: by 2002:a05:620a:16d1:: with SMTP id
	a17mr17594575qkn.49.1579811469504; 
	Thu, 23 Jan 2020 12:31:09 -0800 (PST)
Received: from mediabox.local ([2001:470:30f3:1:922b:34ff:fe5d:d4b3])
	by smtp.gmail.com with ESMTPSA id
	w60sm1584244qte.39.2020.01.23.12.31.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 23 Jan 2020 12:31:08 -0800 (PST)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Jan 2020 14:30:36 -0600
Message-Id: <20200123203037.693694-2-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200123203037.693694-1-danismostlikely@gmail.com>
References: <20200123203037.693694-1-danismostlikely@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] cmake: prefer CMAKE_BUILD_PARALLEL_LEVEL
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
X-List-Received-Date: Thu, 23 Jan 2020 20:31:09 -0000
Content-Transfer-Encoding: 8bit

From: Daniel McGregor <daniel.mcgregor@vecima.com>

cmake 3.12 introduced this environment variable. Prefer it to passing
PARALLEL_MAKE and PARALLEL_MAKEINST on the cmake command line, because
it gets passed to second stage cmake invocations while command-line
arguments do not (for example, multi-stage clang builds)

Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
---
 meta/classes/cmake.bbclass |  5 +++--
 meta/lib/oe/utils.py       | 11 +++++++----
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index a046daa6ea..d91cf20130 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -63,8 +63,9 @@ OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM_class-native = "BOTH"
 
 EXTRA_OECMAKE_append = " ${PACKAGECONFIG_CONFARGS}"
 
-EXTRA_OECMAKE_BUILD_prepend_task-compile = "${PARALLEL_MAKE} "
-EXTRA_OECMAKE_BUILD_prepend_task-install = "${PARALLEL_MAKEINST} "
+export CMAKE_BUILD_PARALLEL_LEVEL
+CMAKE_BUILD_PARALLEL_LEVEL_task-compile = "${@oe.utils.parallel_make(d, False)}"
+CMAKE_BUILD_PARALLEL_LEVEL_task-install = "${@oe.utils.parallel_make(d, True)}"
 
 OECMAKE_TARGET_COMPILE ?= "all"
 OECMAKE_TARGET_INSTALL ?= "install"
diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 652b2be145..e350b05ddf 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -169,7 +169,7 @@ def any_distro_features(d, features, truevalue="1", falsevalue=""):
     """
     return bb.utils.contains_any("DISTRO_FEATURES", features, truevalue, falsevalue, d)
 
-def parallel_make(d):
+def parallel_make(d, makeinst=False):
     """
     Return the integer value for the number of parallel threads to use when
     building, scraped out of PARALLEL_MAKE. If no parallelization option is
@@ -177,7 +177,10 @@ def parallel_make(d):
 
     e.g. if PARALLEL_MAKE = "-j 10", this will return 10 as an integer.
     """
-    pm = (d.getVar('PARALLEL_MAKE') or '').split()
+    if makeinst:
+        pm = (d.getVar('PARALLEL_MAKEINST') or '').split()
+    else:
+        pm = (d.getVar('PARALLEL_MAKE') or '').split()
     # look for '-j' and throw other options (e.g. '-l') away
     while pm:
         opt = pm.pop(0)
@@ -192,7 +195,7 @@ def parallel_make(d):
 
     return None
 
-def parallel_make_argument(d, fmt, limit=None):
+def parallel_make_argument(d, fmt, limit=None, makeinst=False):
     """
     Helper utility to construct a parallel make argument from the number of
     parallel threads specified in PARALLEL_MAKE.
@@ -205,7 +208,7 @@ def parallel_make_argument(d, fmt, limit=None):
     e.g. if PARALLEL_MAKE = "-j 10", parallel_make_argument(d, "-n %d") will return
     "-n 10"
     """
-    v = parallel_make(d)
+    v = parallel_make(d, makeinst)
     if v:
         if limit:
             v = min(limit, v)
-- 
2.24.1


