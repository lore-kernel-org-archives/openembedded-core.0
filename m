Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03F25CDB465
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 17:44:32 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.34641.1697737467552103789
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Oct 2023 10:44:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=T0IDT6Bc;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1c9b7c234a7so72230355ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Oct 2023 10:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697737467; x=1698342267; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DFDAjLX0sZDK9s7JvkdAl94+E0kquSNsV3plqg+RIi0=;
        b=T0IDT6Bc+75qq7nrKqzps+9+ZLgspcyr/NJqaZyC7s7b0XsPzNxD0QmoVdV0lWyuW4
         rrKffNA+VulbbvKggTtl1vj3f+s56yIyVST2Svz5GINXQYEpAcmklLApbG3BnbUWAg9s
         noSbcdwG492Xc/a0aHu+XcqwoqkLXl2E1ml9MF4dKvw4Lshc6zGnLkV+89Xc1033pqmK
         fcp07l+fJAyLdYRrMuieNFVbhg97Zu58hYu/KstpSApN8tryJVEl4zWYiLw4ygcdPYc5
         lwPNDVH8tsGn5krMEm39L0yqTz9LXXdtSH2OsGyldUpZB25x0H4fjAZZD0o+AC6l+iMT
         MzfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697737467; x=1698342267;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DFDAjLX0sZDK9s7JvkdAl94+E0kquSNsV3plqg+RIi0=;
        b=LyOeVNrrtjBUyIxtTFvA0+AAZcFXTPBi0MIBeGgAWVqz6W/lQcVWZ5pVR8+oMmZKNJ
         rgnRVW0XdgPJEYv6HptVJ1GR/RIKzyGXUR1uraRV0ektKQuwMHAOhX+tIf16ex2Ql7RN
         jCQ/j3EHjMj+92b3J5/wa9FD10VXklDNZpQNkC09sZozfCSMWghreD4L0EwGHSfK4sWG
         VXKPzPglVInRWXbSL96A2S4Ipwad0GkQHy9Y3OKXB9M7rwEsmGWWSk397phryzxnUf5i
         k4BFgaDYXvON0UJk9HXANRoc+qlKuGDdyM+t4OFZyqPX4lXUbZ1Ex2/RZ8wDOznCnLMY
         41cA==
X-Gm-Message-State: AOJu0Yw7uD6XJ6p38fKLxAOkQHkVzcswbHMqumCvgCbjrRe38zAvKxCR
	+TpmMGrF2M9oOS7yIPyx+hKNCd/J29A=
X-Google-Smtp-Source: AGHT+IESSZ+pbtQ3qA7Nln0W8q1/y6FlFCJo3V5cK52ZA2WtW4x3fKOLj9g+GZQWmtP8ta+Zw1i2Lw==
X-Received: by 2002:a17:902:f095:b0:1ca:b26a:9729 with SMTP id p21-20020a170902f09500b001cab26a9729mr2647795pla.38.1697737466536;
        Thu, 19 Oct 2023 10:44:26 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::7f07])
        by smtp.gmail.com with ESMTPSA id e1-20020a17090301c100b001c9bc811d59sm2214989plh.307.2023.10.19.10.44.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 10:44:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] shared-mime-info: Fix missing sentinel warning
Date: Thu, 19 Oct 2023 10:44:23 -0700
Message-ID: <20231019174423.2873569-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Oct 2023 17:44:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189477

Clang finds it, gcc does not.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Some more warnings fixed with clang
 .../0001-Fix-literal-as-per-c-11.patch        | 279 ++++++++++++++++++
 ...001-Fix-string-literal-concatenation.patch |  39 +++
 .../shared-mime-info/shared-mime-info_git.bb  |   5 +-
 3 files changed, 322 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/shared-mime-info/shared-mime-info/0001-Fix-literal-as-per-c-11.patch
 create mode 100644 meta/recipes-support/shared-mime-info/shared-mime-info/0001-Fix-string-literal-concatenation.patch

diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info/0001-Fix-literal-as-per-c-11.patch b/meta/recipes-support/shared-mime-info/shared-mime-info/0001-Fix-literal-as-per-c-11.patch
new file mode 100644
index 00000000000..25f409c206e
--- /dev/null
+++ b/meta/recipes-support/shared-mime-info/shared-mime-info/0001-Fix-literal-as-per-c-11.patch
@@ -0,0 +1,279 @@
+From 157c16b09f54741aefbc4be6a3507455f0378389 Mon Sep 17 00:00:00 2001
+From: Biswapriyo Nath <nathbappai@gmail.com>
+Date: Sun, 8 Oct 2023 13:26:43 +0000
+Subject: [PATCH] Fix missing sentinel warning with clang
+
+This fixes the compiler warnings similar as following.
+
+../src/update-mime-database.cpp:393:50: warning: missing sentinel in function call [-Wsentinel]
+  393 |                         g_strconcat(namespaceURI, " ", localName, NULL),
+      |                                                                       ^
+      |                                                                       , nullptr
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xdg/shared-mime-info/-/commit/157c16b09f54741aefbc4be6a3507455f0378389]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/update-mime-database.cpp | 58 ++++++++++++++++++------------------
+ 1 file changed, 29 insertions(+), 29 deletions(-)
+
+--- a/src/update-mime-database.cpp
++++ b/src/update-mime-database.cpp
+@@ -390,7 +390,7 @@ static void add_namespace(Type *type, co
+ 	}
+ 
+ 	g_hash_table_insert(namespace_hash,
+-			g_strconcat(namespaceURI, " ", localName, NULL),
++			g_strconcat(namespaceURI, " ", localName, nullptr),
+ 			type);
+ }
+ 
+@@ -1023,7 +1023,7 @@ static void write_out_type(gpointer key,
+ 	char *lower;
+ 
+ 	lower = g_ascii_strdown(type->media, -1);
+-	media = g_strconcat(mime_dir, "/", lower, NULL);
++	media = g_strconcat(mime_dir, "/", lower, nullptr);
+ 	g_free(lower);
+ #ifdef _WIN32
+ 	fs::create_directory(media);
+@@ -1032,7 +1032,7 @@ static void write_out_type(gpointer key,
+ #endif
+ 
+ 	lower = g_ascii_strdown(type->subtype, -1);
+-	filename = g_strconcat(media, "/", lower, ".xml.new", NULL);
++	filename = g_strconcat(media, "/", lower, ".xml.new", nullptr);
+ 	g_free(lower);
+ 	g_free(media);
+ 	media = NULL;
+@@ -1622,7 +1622,7 @@ static Magic *magic_new(xmlNode *node, T
+ 			magic_free(magic);
+ 			magic = NULL;
+ 			(*error)->message = g_strconcat(
+-				_("Error in <match> element: "), old, NULL);
++				_("Error in <match> element: "), old, nullptr);
+ 			g_free(old);
+ 		} else if (magic->matches == NULL) {
+ 			magic_free(magic);
+@@ -1843,7 +1843,7 @@ static TreeMagic *tree_magic_new(xmlNode
+ 			tree_magic_free(magic);
+ 			magic = NULL;
+ 			(*error)->message = g_strconcat(
+-				_("Error in <treematch> element: "), old, NULL);
++				_("Error in <treematch> element: "), old, nullptr);
+ 			g_free(old);
+ 		}
+ 	}
+@@ -1960,7 +1960,7 @@ static void delete_old_types(const gchar
+ 
+ 	for (i = 0; i < G_N_ELEMENTS(media_types); i++)
+ 	{
+-		const fs::path media_dir = g_strconcat(mime_dir, "/", media_types[i], NULL);
++		const fs::path media_dir = g_strconcat(mime_dir, "/", media_types[i], nullptr);
+ 
+ 		if (!fs::is_directory(fs::status(media_dir)))
+ 			continue;
+@@ -1973,13 +1973,13 @@ static void delete_old_types(const gchar
+ 				continue;
+ 
+ 			char *type_name = g_strconcat(media_types[i], "/",
+-						dir_entry.path().filename().string().c_str(), NULL);
++						dir_entry.path().filename().string().c_str(), nullptr);
+ 			type_name[strlen(type_name) - 4] = '\0';
+ 			if (!g_hash_table_lookup(types, type_name))
+ 			{
+ 				char *path;
+ 				path = g_strconcat(mime_dir, "/",
+-						type_name, ".xml", NULL);
++						type_name, ".xml", nullptr);
+ #if 0
+ 				g_warning("Removing old info for type %s",
+ 						path);
+@@ -2002,7 +2002,7 @@ static void add_ns(gpointer key, gpointe
+ 	Type *type = (Type *) value;
+ 
+ 	g_ptr_array_add(lines, g_strconcat(ns, " ", type->media,
+-					   "/", type->subtype, "\n", NULL));
++					   "/", type->subtype, "\n", nullptr));
+ }
+ 
+ /* Write all the collected namespace rules to 'XMLnamespaces' */
+@@ -2038,7 +2038,7 @@ static void write_subclass(gpointer key,
+ 
+ 	for (l = list; l; l = l->next)
+ 	{
+-		line = g_strconcat (static_cast<const gchar *>(key), " ", l->data, "\n", NULL);
++		line = g_strconcat (static_cast<const gchar *>(key), " ", l->data, "\n", nullptr);
+ 		fwrite(line, 1, strlen(line), stream);
+ 		g_free (line);
+ 	}
+@@ -2061,7 +2061,7 @@ static void add_alias(gpointer key, gpoi
+ 	
+ 	g_ptr_array_add(lines, g_strconcat(alias, " ", type->media,
+ 					   "/", type->subtype, "\n", 
+-					   NULL));
++					   nullptr));
+ }
+ 
+ /* Write all the collected aliases */
+@@ -2092,7 +2092,7 @@ static void add_type(gpointer key, gpoin
+ {
+ 	GPtrArray *lines = (GPtrArray *) data;
+ 	
+-	g_ptr_array_add(lines, g_strconcat((char *)key, "\n", NULL));
++	g_ptr_array_add(lines, g_strconcat((char *)key, "\n", nullptr));
+ }
+ 
+ /* Write all the collected types */
+@@ -2127,7 +2127,7 @@ static void write_one_icon(gpointer key,
+ 	FILE *stream = (FILE *)data;
+ 	char *line;
+ 
+-	line = g_strconcat (mimetype, ":", iconname, "\n", NULL);
++	line = g_strconcat (mimetype, ":", iconname, "\n", nullptr);
+ 	fwrite(line, 1, strlen(line), stream);
+ 	g_free (line);
+ }
+@@ -2168,7 +2168,7 @@ static void check_in_path_xdg_data(const
+ 		dirs[n] = g_strdup(env);
+ 	else
+ 		dirs[n] = g_build_filename(g_get_home_dir(), ".local",
+-						"share", NULL);
++						"share", nullptr);
+ 	n++;
+ 
+ 	for (i = 0; i < n; i++)
+@@ -3588,7 +3588,7 @@ newest_mtime(const char *packagedir)
+ 	while ((name = g_dir_read_name(dir))) {
+ 		char *path;
+ 
+-		path = g_build_filename(packagedir, name, NULL);
++		path = g_build_filename(packagedir, name, nullptr);
+ 		retval = g_stat(path, &statbuf);
+ 		g_free(path);
+ 		if (retval < 0)
+@@ -3609,7 +3609,7 @@ is_cache_up_to_date (const char *mimedir
+ 	char *mimeversion;
+ 	int retval;
+ 
+-	mimeversion = g_build_filename(mimedir, "/version", NULL);
++	mimeversion = g_build_filename(mimedir, "/version", nullptr);
+ 	retval = g_stat(mimeversion, &version_stat);
+ 	g_free(mimeversion);
+ 	if (retval < 0)
+@@ -3694,7 +3694,7 @@ int main(int argc, char **argv)
+ 		}
+ 	}
+ 
+-	package_dir = g_strconcat(mime_dir, "/packages", NULL);
++	package_dir = g_strconcat(mime_dir, "/packages", nullptr);
+ 
+ 	if (!fs::exists(mime_dir) && !fs::is_directory(fs::status(mime_dir)))
+ 	{
+@@ -3747,7 +3747,7 @@ int main(int argc, char **argv)
+ 
+ 		g_hash_table_foreach(globs_hash, collect_glob2, &glob_list);
+ 		glob_list = g_list_sort(glob_list, (GCompareFunc)compare_glob_by_weight);
+-		globs_path = g_strconcat(mime_dir, "/globs.new", NULL);
++		globs_path = g_strconcat(mime_dir, "/globs.new", nullptr);
+ 		globs = fopen_gerror(globs_path, error);
+ 		if (!globs)
+ 			goto out;
+@@ -3761,7 +3761,7 @@ int main(int argc, char **argv)
+ 			goto out;
+ 		g_free(globs_path);
+ 
+-		globs_path = g_strconcat(mime_dir, "/globs2.new", NULL);
++		globs_path = g_strconcat(mime_dir, "/globs2.new", nullptr);
+ 		globs = fopen_gerror(globs_path, error);
+ 		if (!globs)
+ 			goto out;
+@@ -3782,7 +3782,7 @@ int main(int argc, char **argv)
+ 		FILE *stream;
+ 		char *magic_path;
+ 		int i;
+-		magic_path = g_strconcat(mime_dir, "/magic.new", NULL);
++		magic_path = g_strconcat(mime_dir, "/magic.new", nullptr);
+ 		stream = fopen_gerror(magic_path, error);
+ 		if (!stream)
+ 			goto out;
+@@ -3807,7 +3807,7 @@ int main(int argc, char **argv)
+ 		FILE *stream;
+ 		char *ns_path;
+ 
+-		ns_path = g_strconcat(mime_dir, "/XMLnamespaces.new", NULL);
++		ns_path = g_strconcat(mime_dir, "/XMLnamespaces.new", nullptr);
+ 		stream = fopen_gerror(ns_path, error);
+ 		if (!stream)
+ 			goto out;
+@@ -3823,7 +3823,7 @@ int main(int argc, char **argv)
+ 		FILE *stream;
+ 		char *path;
+ 		
+-		path = g_strconcat(mime_dir, "/subclasses.new", NULL);
++		path = g_strconcat(mime_dir, "/subclasses.new", nullptr);
+ 		stream = fopen_gerror(path, error);
+ 		if (!stream)
+ 			goto out;
+@@ -3839,7 +3839,7 @@ int main(int argc, char **argv)
+ 		FILE *stream;
+ 		char *path;
+ 		
+-		path = g_strconcat(mime_dir, "/aliases.new", NULL);
++		path = g_strconcat(mime_dir, "/aliases.new", nullptr);
+ 		stream = fopen_gerror(path, error);
+ 		if (!stream)
+ 			goto out;
+@@ -3855,7 +3855,7 @@ int main(int argc, char **argv)
+ 		FILE *stream;
+ 		char *path;
+ 		
+-		path = g_strconcat(mime_dir, "/types.new", NULL);
++		path = g_strconcat(mime_dir, "/types.new", nullptr);
+ 		stream = fopen_gerror(path, error);
+ 		if (!stream)
+ 			goto out;
+@@ -3871,7 +3871,7 @@ int main(int argc, char **argv)
+ 		FILE *stream;
+ 		char *icon_path;
+ 
+-		icon_path = g_strconcat(mime_dir, "/generic-icons.new", NULL);
++		icon_path = g_strconcat(mime_dir, "/generic-icons.new", nullptr);
+ 		stream = fopen_gerror(icon_path, error);
+ 		if (!stream)
+ 			goto out;
+@@ -3887,7 +3887,7 @@ int main(int argc, char **argv)
+ 		FILE *stream;
+ 		char *icon_path;
+ 
+-		icon_path = g_strconcat(mime_dir, "/icons.new", NULL);
++		icon_path = g_strconcat(mime_dir, "/icons.new", nullptr);
+ 		stream = fopen_gerror(icon_path, error);
+ 		if (!stream)
+ 			goto out;
+@@ -3903,7 +3903,7 @@ int main(int argc, char **argv)
+ 		FILE *stream;
+ 		char *path;
+ 		int i;
+-		path = g_strconcat(mime_dir, "/treemagic.new", NULL);
++		path = g_strconcat(mime_dir, "/treemagic.new", nullptr);
+ 		stream = fopen_gerror(path, error);
+ 		if (!stream)
+ 			goto out;
+@@ -3928,7 +3928,7 @@ int main(int argc, char **argv)
+ 		FILE *stream;
+ 		char *path;
+ 		
+-		path = g_strconcat(mime_dir, "/mime.cache.new", NULL);
++		path = g_strconcat(mime_dir, "/mime.cache.new", nullptr);
+ 		stream = fopen_gerror(path, error);
+ 		if (!stream)
+ 			goto out;
+@@ -3944,7 +3944,7 @@ int main(int argc, char **argv)
+ 		FILE *stream;
+ 		char *path;
+ 
+-		path = g_strconcat(mime_dir, "/version.new", NULL);
++		path = g_strconcat(mime_dir, "/version.new", nullptr);
+ 		stream = fopen_gerror(path, error);
+ 		if (!stream)
+ 			goto out;
diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info/0001-Fix-string-literal-concatenation.patch b/meta/recipes-support/shared-mime-info/shared-mime-info/0001-Fix-string-literal-concatenation.patch
new file mode 100644
index 00000000000..7825c39312b
--- /dev/null
+++ b/meta/recipes-support/shared-mime-info/shared-mime-info/0001-Fix-string-literal-concatenation.patch
@@ -0,0 +1,39 @@
+From ccf704a606625bc62e70dbe815b309c22a0bda05 Mon Sep 17 00:00:00 2001
+From: Tobias Mayer <tobim@fastmail.fm>
+Date: Sun, 8 Oct 2023 00:11:49 +0200
+Subject: [PATCH] Fix string literal concatenation
+
+Clang is not able to disambiguate between multiple string literatals
+and C++11 user defined literals. Spaces help.
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xdg/shared-mime-info/-/commit/12a3a6b1141c704fc594379af1808bb9008d588c]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/update-mime-database.cpp | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/update-mime-database.cpp b/src/update-mime-database.cpp
+index 733ba06..29d82a9 100644
+--- a/src/update-mime-database.cpp
++++ b/src/update-mime-database.cpp
+@@ -2158,7 +2158,7 @@ static void check_in_path_xdg_data(const char *mime_path)
+ 
+ 	env = getenv("XDG_DATA_DIRS");
+ 	if (!env)
+-		env = "/usr/local/share/"PATH_SEPARATOR"/usr/share/";
++		env = "/usr/local/share/" PATH_SEPARATOR "/usr/share/";
+ 	dirs = g_strsplit(env, PATH_SEPARATOR, 0);
+ 	g_return_if_fail(dirs != NULL);
+ 	for (n = 0; dirs[n]; n++)
+@@ -2170,7 +2170,7 @@ static void check_in_path_xdg_data(const char *mime_path)
+ 		dirs[n] = g_build_filename(g_get_home_dir(), ".local",
+ 						"share", NULL);
+ 	n++;
+-	
++
+ 	for (i = 0; i < n; i++)
+ 	{
+ 		if (stat(dirs[i], &dir_info) == 0 &&
+-- 
+2.42.0
+
diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb b/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb
index 81a9259d7b5..cae00643332 100644
--- a/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb
+++ b/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb
@@ -8,7 +8,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 DEPENDS = "libxml2 itstool-native glib-2.0 shared-mime-info-native xmlto-native"
 
-SRC_URI = "git://gitlab.freedesktop.org/xdg/shared-mime-info.git;protocol=https;branch=master"
+SRC_URI = "git://gitlab.freedesktop.org/xdg/shared-mime-info.git;protocol=https;branch=master \
+           file://0001-Fix-string-literal-concatenation.patch \
+           file://0001-Fix-literal-as-per-c-11.patch \
+           "
 SRCREV = "8e80a317f5c61a7f410330abea441e0b0b9280b5"
 PV = "2.3"
 S = "${WORKDIR}/git"
-- 
2.42.0


