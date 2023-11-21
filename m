Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 416BBC61D93
	for <webhook@archiver.kernel.org>; Tue, 21 Nov 2023 01:35:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web11.24989.1700530494336755570
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Nov 2023 17:35:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=M/+5Bs8y;
 spf=pass (domain: intel.com, ip: 134.134.136.24, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700530502; x=1732066502;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=1B1r2KiIqMQihjm5optX9H75HwhmUaLwIzEWUPUEg1Q=;
  b=M/+5Bs8yMvlDU3MhEg7IJmyllM6jAZPg2HY+7gxDnBrwhqQNq2pAl60P
   gTx3F5KCtgWx26o0PCsOACABq1yQvcOQQzek2se24tJEd2s9xc/3JglET
   uHsPxpEauecHVlTa8wuzEEHVyUq7XJd6AJDk8c20k6PD9FjecB2mZArIs
   8iL7n2eNrmha13syGQJUwK+6OnNNDV0jZ1aD38rgj20sCIEk5pZm6uhr9
   tssrAeZ3ASCNYVj+J7cdrN/dqLZAKnjm6lIuV5SsFp3BhQD92XPJUcN2o
   VPi9IPPDPqjTWp4zNppYZYfNjLTQAqouMJKtzCBhBY0Dp+wAr2Hl7QqHE
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="394584386"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="394584386"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 17:35:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="939952181"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="939952181"
Received: from unknown (HELO anmitta2-mobl3.png.intel.com) ([10.107.4.247])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 17:35:01 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 09/11] shared-mime-info: upgrade 2.3 -> 2.4
Date: Tue, 21 Nov 2023 09:34:46 +0800
Message-ID: <20231121013448.8478-9-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231121013448.8478-1-anuj.mittal@intel.com>
References: <20231121013448.8478-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 01:35:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190948

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../0001-Fix-literal-as-per-c-11.patch        | 279 ------------------
 ...001-Fix-string-literal-concatenation.patch |  39 ---
 .../shared-mime-info/shared-mime-info_git.bb  |   9 +-
 3 files changed, 3 insertions(+), 324 deletions(-)
 delete mode 100644 meta/recipes-support/shared-mime-info/shared-mime-info/0001-Fix-literal-as-per-c-11.patch
 delete mode 100644 meta/recipes-support/shared-mime-info/shared-mime-info/0001-Fix-string-literal-concatenation.patch

diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info/0001-Fix-literal-as-per-c-11.patch b/meta/recipes-support/shared-mime-info/shared-mime-info/0001-Fix-literal-as-per-c-11.patch
deleted file mode 100644
index 25f409c206e..00000000000
--- a/meta/recipes-support/shared-mime-info/shared-mime-info/0001-Fix-literal-as-per-c-11.patch
+++ /dev/null
@@ -1,279 +0,0 @@
-From 157c16b09f54741aefbc4be6a3507455f0378389 Mon Sep 17 00:00:00 2001
-From: Biswapriyo Nath <nathbappai@gmail.com>
-Date: Sun, 8 Oct 2023 13:26:43 +0000
-Subject: [PATCH] Fix missing sentinel warning with clang
-
-This fixes the compiler warnings similar as following.
-
-../src/update-mime-database.cpp:393:50: warning: missing sentinel in function call [-Wsentinel]
-  393 |                         g_strconcat(namespaceURI, " ", localName, NULL),
-      |                                                                       ^
-      |                                                                       , nullptr
-
-Upstream-Status: Backport [https://gitlab.freedesktop.org/xdg/shared-mime-info/-/commit/157c16b09f54741aefbc4be6a3507455f0378389]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/update-mime-database.cpp | 58 ++++++++++++++++++------------------
- 1 file changed, 29 insertions(+), 29 deletions(-)
-
---- a/src/update-mime-database.cpp
-+++ b/src/update-mime-database.cpp
-@@ -390,7 +390,7 @@ static void add_namespace(Type *type, co
- 	}
- 
- 	g_hash_table_insert(namespace_hash,
--			g_strconcat(namespaceURI, " ", localName, NULL),
-+			g_strconcat(namespaceURI, " ", localName, nullptr),
- 			type);
- }
- 
-@@ -1023,7 +1023,7 @@ static void write_out_type(gpointer key,
- 	char *lower;
- 
- 	lower = g_ascii_strdown(type->media, -1);
--	media = g_strconcat(mime_dir, "/", lower, NULL);
-+	media = g_strconcat(mime_dir, "/", lower, nullptr);
- 	g_free(lower);
- #ifdef _WIN32
- 	fs::create_directory(media);
-@@ -1032,7 +1032,7 @@ static void write_out_type(gpointer key,
- #endif
- 
- 	lower = g_ascii_strdown(type->subtype, -1);
--	filename = g_strconcat(media, "/", lower, ".xml.new", NULL);
-+	filename = g_strconcat(media, "/", lower, ".xml.new", nullptr);
- 	g_free(lower);
- 	g_free(media);
- 	media = NULL;
-@@ -1622,7 +1622,7 @@ static Magic *magic_new(xmlNode *node, T
- 			magic_free(magic);
- 			magic = NULL;
- 			(*error)->message = g_strconcat(
--				_("Error in <match> element: "), old, NULL);
-+				_("Error in <match> element: "), old, nullptr);
- 			g_free(old);
- 		} else if (magic->matches == NULL) {
- 			magic_free(magic);
-@@ -1843,7 +1843,7 @@ static TreeMagic *tree_magic_new(xmlNode
- 			tree_magic_free(magic);
- 			magic = NULL;
- 			(*error)->message = g_strconcat(
--				_("Error in <treematch> element: "), old, NULL);
-+				_("Error in <treematch> element: "), old, nullptr);
- 			g_free(old);
- 		}
- 	}
-@@ -1960,7 +1960,7 @@ static void delete_old_types(const gchar
- 
- 	for (i = 0; i < G_N_ELEMENTS(media_types); i++)
- 	{
--		const fs::path media_dir = g_strconcat(mime_dir, "/", media_types[i], NULL);
-+		const fs::path media_dir = g_strconcat(mime_dir, "/", media_types[i], nullptr);
- 
- 		if (!fs::is_directory(fs::status(media_dir)))
- 			continue;
-@@ -1973,13 +1973,13 @@ static void delete_old_types(const gchar
- 				continue;
- 
- 			char *type_name = g_strconcat(media_types[i], "/",
--						dir_entry.path().filename().string().c_str(), NULL);
-+						dir_entry.path().filename().string().c_str(), nullptr);
- 			type_name[strlen(type_name) - 4] = '\0';
- 			if (!g_hash_table_lookup(types, type_name))
- 			{
- 				char *path;
- 				path = g_strconcat(mime_dir, "/",
--						type_name, ".xml", NULL);
-+						type_name, ".xml", nullptr);
- #if 0
- 				g_warning("Removing old info for type %s",
- 						path);
-@@ -2002,7 +2002,7 @@ static void add_ns(gpointer key, gpointe
- 	Type *type = (Type *) value;
- 
- 	g_ptr_array_add(lines, g_strconcat(ns, " ", type->media,
--					   "/", type->subtype, "\n", NULL));
-+					   "/", type->subtype, "\n", nullptr));
- }
- 
- /* Write all the collected namespace rules to 'XMLnamespaces' */
-@@ -2038,7 +2038,7 @@ static void write_subclass(gpointer key,
- 
- 	for (l = list; l; l = l->next)
- 	{
--		line = g_strconcat (static_cast<const gchar *>(key), " ", l->data, "\n", NULL);
-+		line = g_strconcat (static_cast<const gchar *>(key), " ", l->data, "\n", nullptr);
- 		fwrite(line, 1, strlen(line), stream);
- 		g_free (line);
- 	}
-@@ -2061,7 +2061,7 @@ static void add_alias(gpointer key, gpoi
- 	
- 	g_ptr_array_add(lines, g_strconcat(alias, " ", type->media,
- 					   "/", type->subtype, "\n", 
--					   NULL));
-+					   nullptr));
- }
- 
- /* Write all the collected aliases */
-@@ -2092,7 +2092,7 @@ static void add_type(gpointer key, gpoin
- {
- 	GPtrArray *lines = (GPtrArray *) data;
- 	
--	g_ptr_array_add(lines, g_strconcat((char *)key, "\n", NULL));
-+	g_ptr_array_add(lines, g_strconcat((char *)key, "\n", nullptr));
- }
- 
- /* Write all the collected types */
-@@ -2127,7 +2127,7 @@ static void write_one_icon(gpointer key,
- 	FILE *stream = (FILE *)data;
- 	char *line;
- 
--	line = g_strconcat (mimetype, ":", iconname, "\n", NULL);
-+	line = g_strconcat (mimetype, ":", iconname, "\n", nullptr);
- 	fwrite(line, 1, strlen(line), stream);
- 	g_free (line);
- }
-@@ -2168,7 +2168,7 @@ static void check_in_path_xdg_data(const
- 		dirs[n] = g_strdup(env);
- 	else
- 		dirs[n] = g_build_filename(g_get_home_dir(), ".local",
--						"share", NULL);
-+						"share", nullptr);
- 	n++;
- 
- 	for (i = 0; i < n; i++)
-@@ -3588,7 +3588,7 @@ newest_mtime(const char *packagedir)
- 	while ((name = g_dir_read_name(dir))) {
- 		char *path;
- 
--		path = g_build_filename(packagedir, name, NULL);
-+		path = g_build_filename(packagedir, name, nullptr);
- 		retval = g_stat(path, &statbuf);
- 		g_free(path);
- 		if (retval < 0)
-@@ -3609,7 +3609,7 @@ is_cache_up_to_date (const char *mimedir
- 	char *mimeversion;
- 	int retval;
- 
--	mimeversion = g_build_filename(mimedir, "/version", NULL);
-+	mimeversion = g_build_filename(mimedir, "/version", nullptr);
- 	retval = g_stat(mimeversion, &version_stat);
- 	g_free(mimeversion);
- 	if (retval < 0)
-@@ -3694,7 +3694,7 @@ int main(int argc, char **argv)
- 		}
- 	}
- 
--	package_dir = g_strconcat(mime_dir, "/packages", NULL);
-+	package_dir = g_strconcat(mime_dir, "/packages", nullptr);
- 
- 	if (!fs::exists(mime_dir) && !fs::is_directory(fs::status(mime_dir)))
- 	{
-@@ -3747,7 +3747,7 @@ int main(int argc, char **argv)
- 
- 		g_hash_table_foreach(globs_hash, collect_glob2, &glob_list);
- 		glob_list = g_list_sort(glob_list, (GCompareFunc)compare_glob_by_weight);
--		globs_path = g_strconcat(mime_dir, "/globs.new", NULL);
-+		globs_path = g_strconcat(mime_dir, "/globs.new", nullptr);
- 		globs = fopen_gerror(globs_path, error);
- 		if (!globs)
- 			goto out;
-@@ -3761,7 +3761,7 @@ int main(int argc, char **argv)
- 			goto out;
- 		g_free(globs_path);
- 
--		globs_path = g_strconcat(mime_dir, "/globs2.new", NULL);
-+		globs_path = g_strconcat(mime_dir, "/globs2.new", nullptr);
- 		globs = fopen_gerror(globs_path, error);
- 		if (!globs)
- 			goto out;
-@@ -3782,7 +3782,7 @@ int main(int argc, char **argv)
- 		FILE *stream;
- 		char *magic_path;
- 		int i;
--		magic_path = g_strconcat(mime_dir, "/magic.new", NULL);
-+		magic_path = g_strconcat(mime_dir, "/magic.new", nullptr);
- 		stream = fopen_gerror(magic_path, error);
- 		if (!stream)
- 			goto out;
-@@ -3807,7 +3807,7 @@ int main(int argc, char **argv)
- 		FILE *stream;
- 		char *ns_path;
- 
--		ns_path = g_strconcat(mime_dir, "/XMLnamespaces.new", NULL);
-+		ns_path = g_strconcat(mime_dir, "/XMLnamespaces.new", nullptr);
- 		stream = fopen_gerror(ns_path, error);
- 		if (!stream)
- 			goto out;
-@@ -3823,7 +3823,7 @@ int main(int argc, char **argv)
- 		FILE *stream;
- 		char *path;
- 		
--		path = g_strconcat(mime_dir, "/subclasses.new", NULL);
-+		path = g_strconcat(mime_dir, "/subclasses.new", nullptr);
- 		stream = fopen_gerror(path, error);
- 		if (!stream)
- 			goto out;
-@@ -3839,7 +3839,7 @@ int main(int argc, char **argv)
- 		FILE *stream;
- 		char *path;
- 		
--		path = g_strconcat(mime_dir, "/aliases.new", NULL);
-+		path = g_strconcat(mime_dir, "/aliases.new", nullptr);
- 		stream = fopen_gerror(path, error);
- 		if (!stream)
- 			goto out;
-@@ -3855,7 +3855,7 @@ int main(int argc, char **argv)
- 		FILE *stream;
- 		char *path;
- 		
--		path = g_strconcat(mime_dir, "/types.new", NULL);
-+		path = g_strconcat(mime_dir, "/types.new", nullptr);
- 		stream = fopen_gerror(path, error);
- 		if (!stream)
- 			goto out;
-@@ -3871,7 +3871,7 @@ int main(int argc, char **argv)
- 		FILE *stream;
- 		char *icon_path;
- 
--		icon_path = g_strconcat(mime_dir, "/generic-icons.new", NULL);
-+		icon_path = g_strconcat(mime_dir, "/generic-icons.new", nullptr);
- 		stream = fopen_gerror(icon_path, error);
- 		if (!stream)
- 			goto out;
-@@ -3887,7 +3887,7 @@ int main(int argc, char **argv)
- 		FILE *stream;
- 		char *icon_path;
- 
--		icon_path = g_strconcat(mime_dir, "/icons.new", NULL);
-+		icon_path = g_strconcat(mime_dir, "/icons.new", nullptr);
- 		stream = fopen_gerror(icon_path, error);
- 		if (!stream)
- 			goto out;
-@@ -3903,7 +3903,7 @@ int main(int argc, char **argv)
- 		FILE *stream;
- 		char *path;
- 		int i;
--		path = g_strconcat(mime_dir, "/treemagic.new", NULL);
-+		path = g_strconcat(mime_dir, "/treemagic.new", nullptr);
- 		stream = fopen_gerror(path, error);
- 		if (!stream)
- 			goto out;
-@@ -3928,7 +3928,7 @@ int main(int argc, char **argv)
- 		FILE *stream;
- 		char *path;
- 		
--		path = g_strconcat(mime_dir, "/mime.cache.new", NULL);
-+		path = g_strconcat(mime_dir, "/mime.cache.new", nullptr);
- 		stream = fopen_gerror(path, error);
- 		if (!stream)
- 			goto out;
-@@ -3944,7 +3944,7 @@ int main(int argc, char **argv)
- 		FILE *stream;
- 		char *path;
- 
--		path = g_strconcat(mime_dir, "/version.new", NULL);
-+		path = g_strconcat(mime_dir, "/version.new", nullptr);
- 		stream = fopen_gerror(path, error);
- 		if (!stream)
- 			goto out;
diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info/0001-Fix-string-literal-concatenation.patch b/meta/recipes-support/shared-mime-info/shared-mime-info/0001-Fix-string-literal-concatenation.patch
deleted file mode 100644
index 7825c39312b..00000000000
--- a/meta/recipes-support/shared-mime-info/shared-mime-info/0001-Fix-string-literal-concatenation.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From ccf704a606625bc62e70dbe815b309c22a0bda05 Mon Sep 17 00:00:00 2001
-From: Tobias Mayer <tobim@fastmail.fm>
-Date: Sun, 8 Oct 2023 00:11:49 +0200
-Subject: [PATCH] Fix string literal concatenation
-
-Clang is not able to disambiguate between multiple string literatals
-and C++11 user defined literals. Spaces help.
-
-Upstream-Status: Backport [https://gitlab.freedesktop.org/xdg/shared-mime-info/-/commit/12a3a6b1141c704fc594379af1808bb9008d588c]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/update-mime-database.cpp | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/update-mime-database.cpp b/src/update-mime-database.cpp
-index 733ba06..29d82a9 100644
---- a/src/update-mime-database.cpp
-+++ b/src/update-mime-database.cpp
-@@ -2158,7 +2158,7 @@ static void check_in_path_xdg_data(const char *mime_path)
- 
- 	env = getenv("XDG_DATA_DIRS");
- 	if (!env)
--		env = "/usr/local/share/"PATH_SEPARATOR"/usr/share/";
-+		env = "/usr/local/share/" PATH_SEPARATOR "/usr/share/";
- 	dirs = g_strsplit(env, PATH_SEPARATOR, 0);
- 	g_return_if_fail(dirs != NULL);
- 	for (n = 0; dirs[n]; n++)
-@@ -2170,7 +2170,7 @@ static void check_in_path_xdg_data(const char *mime_path)
- 		dirs[n] = g_build_filename(g_get_home_dir(), ".local",
- 						"share", NULL);
- 	n++;
--	
-+
- 	for (i = 0; i < n; i++)
- 	{
- 		if (stat(dirs[i], &dir_info) == 0 &&
--- 
-2.42.0
-
diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb b/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb
index cae00643332..937428221ef 100644
--- a/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb
+++ b/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb
@@ -8,12 +8,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 DEPENDS = "libxml2 itstool-native glib-2.0 shared-mime-info-native xmlto-native"
 
-SRC_URI = "git://gitlab.freedesktop.org/xdg/shared-mime-info.git;protocol=https;branch=master \
-           file://0001-Fix-string-literal-concatenation.patch \
-           file://0001-Fix-literal-as-per-c-11.patch \
-           "
-SRCREV = "8e80a317f5c61a7f410330abea441e0b0b9280b5"
-PV = "2.3"
+SRC_URI = "git://gitlab.freedesktop.org/xdg/shared-mime-info.git;protocol=https;branch=master"
+SRCREV = "9a6d6b8e963935f145f3a1ef446552de6996dada"
+PV = "2.4"
 S = "${WORKDIR}/git"
 
 inherit meson pkgconfig gettext python3native mime
-- 
2.42.0


