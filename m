Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id E18B16004D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 May 2019 20:50:10 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id p15so3349677pll.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 May 2019 13:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=ppsxKO8xblriy2JBFqE5R90yyrME2ecLnMDuOUDpa98=;
	b=LDOnxMNXil5BoujrONoNK9B5XMtu+JFabrKQdES5Ud1s4vsPcIYHMapEFPn+Llqw7o
	eBxemmVEJHRN15mtmAvJ0EJPpnfGH4YGPo24DzcZ+TfaYze5cFjyOX5vDMDi4TqZr+wf
	bb/hZLGvXRfwGO0V2r+i6wkSXOwkAY6J9yph8G1bkogl+J1QAkTdDhKlQGaNz0BPG8J4
	EuRtPZhZFEchmXzPHGu7OilCr+4A95ana3DZIR74Osd1jfmfQGpgqyb64KdAlPxJuzwq
	57dnSXKqkB512TP1ZYP7QGYAfUq3WPQtxMjRpkisvvffLsJ6DeMo1MHoiEyVtx6cSNTf
	o6Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ppsxKO8xblriy2JBFqE5R90yyrME2ecLnMDuOUDpa98=;
	b=iOrHy7ulLTNulnqp8gCRYa8MgubMtBJtZLCn7sVAMm/f5mMTYV377Mt0LqxSm2pkOf
	+5k2jec8zJiakbtaVxVpgEii1FLxE2/2jil5f5yJO7CEAwQDqutsDqUIcBHEpxKghlrI
	rpFhLtJF6FOIvl3kSdWU4q7g/OB0lmjR/U5VVf08j7fD6RZllqe31qM6xMc3gsmGIdcr
	xVGkYtBjFGDZ9TDrVczsi7ZeFOaypllfkVSrYhkBWLEhuu7lzxExQLdees5VXv59+K4G
	pAWduDvWq6Dq4ENeoTAFLfsJcxqgAJVFVl9FdukHdRw48+sqk1oizaQLDM2Xfcw1w3tW
	qHCw==
X-Gm-Message-State: APjAAAX4KqX05yGL9tuplVyxEcDpo++81lmSZqtOF1nf7rzVlgN77rNO
	RRyL7CM5L0NDi1yYFqnzgqFM2lkgclM=
X-Google-Smtp-Source: APXvYqxJ5k6jwC0swneeQ6ERKvkNNaZc9Mr/Etri9aQyrQSiMfK2GCisDUVs94tVzy5cVlsPcGq4gg==
X-Received: by 2002:a17:902:2962:: with SMTP id
	g89mr15649914plb.190.1557521411591; 
	Fri, 10 May 2019 13:50:11 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::592a])
	by smtp.gmail.com with ESMTPSA id l1sm7477044pgp.9.2019.05.10.13.50.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 May 2019 13:50:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 May 2019 13:49:54 -0700
Message-Id: <20190510204954.33591-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190510204954.33591-1-raj.khem@gmail.com>
References: <20190510204954.33591-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] epiphany: Fix build with clang
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
X-List-Received-Date: Fri, 10 May 2019 20:50:11 -0000
Content-Transfer-Encoding: 8bit

This patch is upstreamable, issue is not caught by gcc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../epiphany/epiphany_3.32.1.2.bb             |  1 +
 ...itialization-of-variable-with-__attr.patch | 54 +++++++++++++++++++
 2 files changed, 55 insertions(+)
 create mode 100644 meta/recipes-gnome/epiphany/files/0001-Do-not-bypass-initialization-of-variable-with-__attr.patch

diff --git a/meta/recipes-gnome/epiphany/epiphany_3.32.1.2.bb b/meta/recipes-gnome/epiphany/epiphany_3.32.1.2.bb
index ba2e851bb6..fc26a878d6 100644
--- a/meta/recipes-gnome/epiphany/epiphany_3.32.1.2.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_3.32.1.2.bb
@@ -12,6 +12,7 @@ REQUIRED_DISTRO_FEATURES = "x11 opengl"
 
 SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive \
            file://0002-help-meson.build-disable-the-use-of-yelp.patch \
+           file://0001-Do-not-bypass-initialization-of-variable-with-__attr.patch \
            "
 SRC_URI[archive.md5sum] = "93faec353e9f62519859e6164350fd5d"
 SRC_URI[archive.sha256sum] = "a8284fb9bbc8b7914a154a8eac1598c8b59ae421e0d685146fb48198427926be"
diff --git a/meta/recipes-gnome/epiphany/files/0001-Do-not-bypass-initialization-of-variable-with-__attr.patch b/meta/recipes-gnome/epiphany/files/0001-Do-not-bypass-initialization-of-variable-with-__attr.patch
new file mode 100644
index 0000000000..35821e3c06
--- /dev/null
+++ b/meta/recipes-gnome/epiphany/files/0001-Do-not-bypass-initialization-of-variable-with-__attr.patch
@@ -0,0 +1,54 @@
+From 1c35833385f5a193513888ba40791ceaa64d575b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 10 May 2019 13:41:52 -0700
+Subject: [PATCH] Do not bypass initialization of variable with
+ __attribute__((cleanup))
+
+This is reported with clang e.g.
+../../../../../../../workspace/sources/epiphany/lib/ephy-web-app-utils.c:391:5: error: cannot jump from this goto statement to its label
+    goto out;
+    ^
+../../../../../../../workspace/sources/epiphany/lib/ephy-web-app-utils.c:398:20: note: jump bypasses initialization of variable with __attribute__((cleanup))
+  g_autofree char *app_file = g_build_filename (profile_dir, ".app", NULL);
+                   ^
+../../../../../../../workspace/sources/epiphany/lib/ephy-web-app-utils.c:385:5: error: cannot jump from this goto statement to its label
+    goto out;
+    ^
+../../../../../../../workspace/sources/epiphany/lib/ephy-web-app-utils.c:398:20: note: jump bypasses initialization of variable with __attribute__((cleanup))                                                                                                                     g_autofree char *app_file = g_build_filename (profile_dir, ".app", NULL);
+                   ^
+
+Ensure that the initialization is deterministic for goto to work
+reliably
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/ephy-web-app-utils.c | 7 ++++---
+ 1 file changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/lib/ephy-web-app-utils.c b/lib/ephy-web-app-utils.c
+index 97f3f24..fb1f732 100644
+--- a/lib/ephy-web-app-utils.c
++++ b/lib/ephy-web-app-utils.c
+@@ -376,7 +376,8 @@ ephy_web_application_create (const char *id,
+ {
+   char *profile_dir;
+   char *desktop_file_path = NULL;
+-
++  g_autofree char *app_file = NULL;
++  int fd;
+   /* If there's already a WebApp profile for the contents of this
+    * view, do nothing. */
+   profile_dir = ephy_web_application_get_profile_directory (id);
+@@ -395,8 +396,8 @@ ephy_web_application_create (const char *id,
+   ephy_profile_utils_set_migration_version_for_profile_dir (EPHY_PROFILE_MIGRATION_VERSION, profile_dir);
+ 
+   /* Create an .app file. */
+-  g_autofree char *app_file = g_build_filename (profile_dir, ".app", NULL);
+-  int fd = g_open (app_file, O_WRONLY|O_CREAT|O_TRUNC, 0644);
++  app_file = g_build_filename (profile_dir, ".app", NULL);
++  fd = g_open (app_file, O_WRONLY|O_CREAT|O_TRUNC, 0644);
+   if (fd < 0) {
+     LOG ("Failed to create .app file: %s", g_strerror (errno));
+     goto out;
-- 
2.21.0


