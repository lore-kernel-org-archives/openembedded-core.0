Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SrAQ6-0001Id-3m
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jul 2012 18:14:42 +0200
Received: by mail-bk0-f47.google.com with SMTP id ik5so446616bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2012 09:03:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=nwIBtyDxNtVkHPQ6LURZ81CvdZYLpYzcwzF2FW5WNOg=;
	b=C+gZAvUpxCLYgkLhQw7LeFanwXbRhjaAdauI7zM7WddomMeIYvvelZIVMRE2EaDicd
	YBXwN6DqiWjNXkyfleMbHiR+tqgtzCQ1PazEqHXeX4zQR3ycdQDQxNbFJoh8alGx+BP5
	ujZKuSOeT2+GJoyn1xs/42i5e8pP3j2OfkPQe5zeGGueQLLmsIIMevc/JlFxHp1QpMJW
	6rrzjveJVFW8q1O9T74GDrOxW+EqCc8aEpUVVNf5a0+7w6vWwcWgrc1xcGCUpy9WD7jU
	Er1sK7M/w4CITSb5dBl82P7RNZjupH5lEioQ8yRJ4qfwOYQNjtF4i87+EfrdMB4R8MVs
	BoqA==
Received: by 10.205.130.17 with SMTP id hk17mr1658239bkc.76.1342541004695;
	Tue, 17 Jul 2012 09:03:24 -0700 (PDT)
Received: from otp-agherzan-l1.corp.ad.wrs.com ([89.121.200.106])
	by mx.google.com with ESMTPS id 25sm10326092bkx.9.2012.07.17.09.03.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Jul 2012 09:03:23 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jul 2012 19:03:09 +0300
Message-Id: <e7c36cdedb56c561d5bd5b53cee95ca4818a238d.1342540673.git.andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <8afb1ea6ef0d40d68203d164a6ad1d0cf45793fd.1342540673.git.andrei@gherzan.ro>
References: <a>
	<8afb1ea6ef0d40d68203d164a6ad1d0cf45793fd.1342540673.git.andrei@gherzan.ro>
In-Reply-To: <cover.1342540673.git.andrei@gherzan.ro>
References: <cover.1342540673.git.andrei@gherzan.ro>
X-Gm-Message-State: ALoCoQn+VXX5r4XsJtb0W00PDFXB562P1eQc1+dy9fGaIsKnKvNOv1ffgU/vln92BVIoG1Oezrrx
Subject: [PATCH V2 3/3] connman: Add patches to fix connman on fs with no d_type support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Jul 2012 16:14:42 -0000

When there is not d_type avalaible on filesystem, fstatat (stat)
can be used to check if path is directory.
storage.c and timezone.c were modified accordingly.

Signed-off-by: Andrei Gherzan <andrei.gherzan@windriver.com>
---
 ....c-If-there-is-no-d_type-support-use-stat.patch |   44 +++++++++++++++
 ....c-If-there-is-no-d_type-support-use-stat.patch |   56 ++++++++++++++++++++
 meta/recipes-connectivity/connman/connman_1.3.bb   |    6 ++-
 3 files changed, 104 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-connectivity/connman/connman/0001-storage.c-If-there-is-no-d_type-support-use-stat.patch
 create mode 100644 meta/recipes-connectivity/connman/connman/0002-timezone.c-If-there-is-no-d_type-support-use-stat.patch

diff --git a/meta/recipes-connectivity/connman/connman/0001-storage.c-If-there-is-no-d_type-support-use-stat.patch b/meta/recipes-connectivity/connman/connman/0001-storage.c-If-there-is-no-d_type-support-use-stat.patch
new file mode 100644
index 0000000..c542867
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman/0001-storage.c-If-there-is-no-d_type-support-use-stat.patch
@@ -0,0 +1,44 @@
+From c167bfd6b5edd01dbbb4794f3851933b2650db0e Mon Sep 17 00:00:00 2001
+From: Andrei Gherzan <andrei@gherzan.ro>
+Date: Tue, 17 Jul 2012 16:07:17 +0300
+Subject: [PATCH V3 1/2] storage.c: If there is no d_type support use stat()
+
+This is usefull for filesystems where d_type is always DT_UNKNOWN.
+In this case use stat() function.
+---
+ src/storage.c |   19 +++++++++++++++++++
+ 1 file changed, 19 insertions(+)
+
+diff --git a/src/storage.c b/src/storage.c
+index 47bd0cb..0cffa0a 100644
+--- a/src/storage.c
++++ b/src/storage.c
+@@ -206,6 +206,25 @@ gchar **connman_storage_get_services()
+ 
+ 			g_string_append_printf(result, "%s/", d->d_name);
+ 			break;
++		case DT_UNKNOWN:
++			/*
++			 * If there is no d_type support use stat()
++			 * to check if directory
++			 */
++			ret = fstatat(dirfd(dir), d->d_name, &buf, 0);
++			if (ret < 0)
++				continue;
++			if (!buf.st_mode & S_IFDIR)
++				continue;
++			str = g_strdup_printf("%s/%s/settings", STORAGEDIR,
++							d->d_name);
++			ret = stat(str, &buf);
++			g_free(str);
++			if (ret < 0)
++				continue;
++
++			g_string_append_printf(result, "%s/", d->d_name);
++			break;
+ 		}
+ 	}
+ 
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-connectivity/connman/connman/0002-timezone.c-If-there-is-no-d_type-support-use-stat.patch b/meta/recipes-connectivity/connman/connman/0002-timezone.c-If-there-is-no-d_type-support-use-stat.patch
new file mode 100644
index 0000000..b8da25a
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman/0002-timezone.c-If-there-is-no-d_type-support-use-stat.patch
@@ -0,0 +1,56 @@
+From 4fcb5991362ed0473572d1d8e17d77c067ad98a9 Mon Sep 17 00:00:00 2001
+From: Andrei Gherzan <andrei@gherzan.ro>
+Date: Tue, 17 Jul 2012 17:27:39 +0300
+Subject: [PATCH V3 2/2] timezone.c: If there is no d_type support use stat()
+
+This is usefull for filesystems where d_type is always DT_UNKNOWN.
+In this case use stat() function.
+---
+ src/timezone.c |   24 ++++++++++++++++++++++++
+ 1 file changed, 24 insertions(+)
+
+diff --git a/src/timezone.c b/src/timezone.c
+index 173d658..73aefbd 100644
+--- a/src/timezone.c
++++ b/src/timezone.c
+@@ -157,6 +157,8 @@ static char *find_origin(void *src_map, struct stat *src_st,
+ 	DIR *dir;
+ 	struct dirent *d;
+ 	char *str, pathname[PATH_MAX];
++	struct stat buf;
++	int ret;
+ 
+ 	if (subpath == NULL)
+ 		strncpy(pathname, basepath, sizeof(pathname));
+@@ -205,6 +207,28 @@ static char *find_origin(void *src_map, struct stat *src_st,
+ 				return str;
+ 			}
+ 			break;
++		case DT_UNKNOWN:
++			/*
++			 * If there is no d_type support use stat()
++			 * to check if directory
++			 */
++			ret = fstatat(dirfd(dir), d->d_name, &buf, 0);
++			if (ret < 0)
++				continue;
++			if (!buf.st_mode & S_IFDIR)
++				continue;
++			if (subpath == NULL)
++				strncpy(pathname, d->d_name, sizeof(pathname));
++			else
++				snprintf(pathname, sizeof(pathname),
++						"%s/%s", subpath, d->d_name);
++
++			str = find_origin(src_map, src_st, basepath, pathname);
++			if (str != NULL) {
++				closedir(dir);
++				return str;
++			}
++			break;
+ 		}
+ 	}
+ 
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-connectivity/connman/connman_1.3.bb b/meta/recipes-connectivity/connman/connman_1.3.bb
index 1e3d138..a9faf74 100644
--- a/meta/recipes-connectivity/connman/connman_1.3.bb
+++ b/meta/recipes-connectivity/connman/connman_1.3.bb
@@ -5,6 +5,8 @@ SRCREV = "3c0fa84091524c7cd6237744f2088ffee2f1d5ad"
 SRC_URI  = "git://git.kernel.org/pub/scm/network/connman/connman.git \
             file://0001-plugin.h-Change-visibility-to-default-for-debug-symb.patch \
             file://add_xuser_dbus_permission.patch \
-            file://connman"
+            file://connman \
+            file://0001-storage.c-If-there-is-no-d_type-support-use-stat.patch \
+            file://0002-timezone.c-If-there-is-no-d_type-support-use-stat.patch"
 S = "${WORKDIR}/git"
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
-- 
1.7.9.5



