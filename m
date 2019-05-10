Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 127467E0FA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 May 2019 22:27:11 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id v80so3934399pfa.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 May 2019 15:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ekwllWUr6fFFUewIYy1MCZmdSr7EVZLiuHy89vzvzjQ=;
	b=viJO88DpDOcGXba7q+7FrsmBPb/0/CmYAVffNkhZIdeYjg0rJRlQgWiAprDExuJOUL
	Q45w/BdMcqVZuBr31BuxjWdkg89HDyYNXkYgB3nYwzrqeAjHTJjMGDHnLDKRXf+Lj80K
	yJy2Isvazq2jfDHqT26/XIy3zi2w/x3CtcogKoLJpGtmelToavIGy4vQ5q7Ce3J/ny6m
	beH+puXuCKECTsM3J9la0Rm7wbthX6VuT6xMP7VOPClEhGz2YlC1I+BRysR4mvmfUFz/
	SgC40BEpjFEgaLpcPf7IKfBcVzhK38Q7cUMnnEzqGy4uFqg4DfcXSJJ/JwaViWkuOv2F
	9qjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ekwllWUr6fFFUewIYy1MCZmdSr7EVZLiuHy89vzvzjQ=;
	b=I0Z5SLQkv8Gfm59UzrAvzcubGCQCUm2eBmDtdRsdlpLN3bBS8gHtp4iQLOgI6k7i0t
	UZaXFhvbOfdBYHoxdKJGVukqg13wqc2PCDt3vXOkJELU48o1DFEVvHjiljGNUk+mUsir
	IoOE1OH+K0/V1XxvwvukRuTEqV4PCn6/saWDu2XsIj5VjkNuV+KPfh0elABFbWb+8eRy
	XE8OzSmSatlvRJEgYA/od3tmEoVmc0CJ0f+jdY3q+VCjcdukJ0maV1VKUfrVrmpCnrnI
	aDHdhijSuyT/UXtvhWQMWWzldx+421batpeLOc9qiZ5+QKSV+qhfe1y4tva0E2o8bemt
	eqBQ==
X-Gm-Message-State: APjAAAW9XFkjYAKaTaibzs7IZ1LmDwL77OojamWbZIozLmzXQTf7rVjT
	Wi7NDU6kqte+W8vN+0ygTfgMd3jNTY0=
X-Google-Smtp-Source: APXvYqxfvlL9lyOcOpUo9tglXMRfap1LV/9LKTMykpUld9Z4mrA3pPm4Eo49l2/CVuvY6HRO+XLN/A==
X-Received: by 2002:a62:6b44:: with SMTP id g65mr17480678pfc.27.1557527232647; 
	Fri, 10 May 2019 15:27:12 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::592a])
	by smtp.gmail.com with ESMTPSA id n7sm8385370pff.45.2019.05.10.15.27.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 May 2019 15:27:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 May 2019 15:26:53 -0700
Message-Id: <20190510222653.41487-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH V2 2/2] epiphany: Do not bypass initialization of variable with __attribute__((cleanup))
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
X-List-Received-Date: Fri, 10 May 2019 22:27:12 -0000
Content-Transfer-Encoding: 8bit

This is reported with clang e.g.
../../../../../../../workspace/sources/epiphany/lib/ephy-web-app-utils.c:391:5: error: cannot jump from this goto statement to its label
    goto out;
    ^
../../../../../../../workspace/sources/epiphany/lib/ephy-web-app-utils.c:398:20: note: jump bypasses initialization of variable with __attribute__((cleanup))
  g_autofree char *app_file = g_build_filename (profile_dir, ".app", NULL);
                   ^
../../../../../../../workspace/sources/epiphany/lib/ephy-web-app-utils.c:385:5: error: cannot jump from this goto statement to its label
    goto out;
    ^
../../../../../../../workspace/sources/epiphany/lib/ephy-web-app-utils.c:398:20: note: jump bypasses initialization of variable with __attribute__((cleanup))                                                                                                                     g_autofree char *app_file = g_build_filename (profile_dir, ".app", NULL);
                   ^

Ensure that the initialization is deterministic for goto to work reliably

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Backport a patch instead of doing own

 .../epiphany/epiphany_3.32.1.2.bb             |  1 +
 ...Clean-up-ephy_web_application_create.patch | 79 +++++++++++++++++++
 2 files changed, 80 insertions(+)
 create mode 100644 meta/recipes-gnome/epiphany/files/0001-web-app-utils-Clean-up-ephy_web_application_create.patch

diff --git a/meta/recipes-gnome/epiphany/epiphany_3.32.1.2.bb b/meta/recipes-gnome/epiphany/epiphany_3.32.1.2.bb
index ba2e851bb6..49631d92d7 100644
--- a/meta/recipes-gnome/epiphany/epiphany_3.32.1.2.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_3.32.1.2.bb
@@ -12,6 +12,7 @@ REQUIRED_DISTRO_FEATURES = "x11 opengl"
 
 SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive \
            file://0002-help-meson.build-disable-the-use-of-yelp.patch \
+           file://0001-web-app-utils-Clean-up-ephy_web_application_create.patch \
            "
 SRC_URI[archive.md5sum] = "93faec353e9f62519859e6164350fd5d"
 SRC_URI[archive.sha256sum] = "a8284fb9bbc8b7914a154a8eac1598c8b59ae421e0d685146fb48198427926be"
diff --git a/meta/recipes-gnome/epiphany/files/0001-web-app-utils-Clean-up-ephy_web_application_create.patch b/meta/recipes-gnome/epiphany/files/0001-web-app-utils-Clean-up-ephy_web_application_create.patch
new file mode 100644
index 0000000000..ea644fb985
--- /dev/null
+++ b/meta/recipes-gnome/epiphany/files/0001-web-app-utils-Clean-up-ephy_web_application_create.patch
@@ -0,0 +1,79 @@
+From 49f435217873e679b142f64d3e7def919fb642bb Mon Sep 17 00:00:00 2001
+From: Michael Catanzaro <mcatanzaro@igalia.com>
+Date: Wed, 8 May 2019 15:58:32 +0000
+Subject: [PATCH] web-app-utils: Clean up ephy_web_application_create()
+
+Fixes #764
+
+(cherry picked from commit 4e998d45e4cc549a7ca561a33895b0fbcf7ba6bb)
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/epiphany/commit/a6a022c9c498ad5dcf7f2220644a7520df74ca31]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/ephy-web-app-utils.c | 24 ++++++++++--------------
+ 1 file changed, 10 insertions(+), 14 deletions(-)
+
+diff --git a/lib/ephy-web-app-utils.c b/lib/ephy-web-app-utils.c
+index 97f3f24..fc68a96 100644
+--- a/lib/ephy-web-app-utils.c
++++ b/lib/ephy-web-app-utils.c
+@@ -374,46 +374,42 @@ ephy_web_application_create (const char *id,
+                              const char *name,
+                              GdkPixbuf  *icon)
+ {
+-  char *profile_dir;
+-  char *desktop_file_path = NULL;
++  g_autofree char *app_file = NULL;
++  g_autofree char *profile_dir = NULL;
++  g_autofree char *desktop_file_path = NULL;
+ 
+   /* If there's already a WebApp profile for the contents of this
+    * view, do nothing. */
+   profile_dir = ephy_web_application_get_profile_directory (id);
+   if (g_file_test (profile_dir, G_FILE_TEST_IS_DIR)) {
+     g_warning ("Profile directory %s already exists", profile_dir);
+-    goto out;
++    return NULL;
+   }
+ 
+   /* Create the profile directory, populate it. */
+   if (g_mkdir_with_parents (profile_dir, 488) == -1) {
+     g_warning ("Failed to create directory %s", profile_dir);
+-    goto out;
++    return NULL;
+   }
+ 
+   /* Skip migration for new web apps. */
+   ephy_profile_utils_set_migration_version_for_profile_dir (EPHY_PROFILE_MIGRATION_VERSION, profile_dir);
+ 
+   /* Create an .app file. */
+-  g_autofree char *app_file = g_build_filename (profile_dir, ".app", NULL);
++  app_file = g_build_filename (profile_dir, ".app", NULL);
+   int fd = g_open (app_file, O_WRONLY|O_CREAT|O_TRUNC, 0644);
+   if (fd < 0) {
+-    LOG ("Failed to create .app file: %s", g_strerror (errno));
+-    goto out;
+-  } else {
+-    close (fd);
++    g_warning ("Failed to create .app file: %s", g_strerror (errno));
++    return NULL;
+   }
++  close (fd);
+ 
+   /* Create the deskop file. */
+   desktop_file_path = create_desktop_file (id, name, address, profile_dir, icon);
+   if (desktop_file_path)
+     ephy_web_application_initialize_settings (profile_dir);
+ 
+- out:
+-  if (profile_dir)
+-    g_free (profile_dir);
+-
+-  return desktop_file_path;
++  return g_steal_pointer (&desktop_file_path);
+ }
+ 
+ char *
+-- 
+2.21.0
+
-- 
2.21.0


