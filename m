Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SrBPN-0003LX-MT
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jul 2012 19:18:01 +0200
Received: by mail-bk0-f47.google.com with SMTP id ik5so511967bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2012 10:06:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=LmSdT0ZmzU9EELwBFlsosew9Ze8oO/ORt1egTIAZbOs=;
	b=YD7fEU4IXfC8xDAlFCeF5Snh0s4AYoUSRNrLohOfZUo63OBXwHGcFFdhkwpeqRbO1h
	Gb6Znyeg4Y5nPFldi7m4IrFx22PGod7EkUyfadep3RToUafVRGNqkhPhmYGKTQwDPN/t
	XpdM4dOjW0Hpws6yXFCmnG8Yv/3XGOttkNQSgHGQ0oYAZEOIhkq/PsntQX0qGKBjSI/X
	7ADXodND6N1+WL+fjC9Cfwhc7+vyPK9SmsgXhJeBnRIP9JW4GUJhUkss//lVsP4F+Ihu
	DSIfd/KzUriFlf6lqcqbeIc5VBRMwunYUnw/PcqKOJk2nz0TN3HhJ3XvqshhGGdnbmzP
	Qyeg==
Received: by 10.204.145.88 with SMTP id c24mr1729670bkv.24.1342544804200;
	Tue, 17 Jul 2012 10:06:44 -0700 (PDT)
Received: from otp-agherzan-l1.corp.ad.wrs.com ([89.121.200.106])
	by mx.google.com with ESMTPS id t23sm10438506bks.4.2012.07.17.10.06.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Jul 2012 10:06:43 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jul 2012 20:06:31 +0300
Message-Id: <e969330666db04439a57a1bada8a315c1f71445a.1342544558.git.andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <8afb1ea6ef0d40d68203d164a6ad1d0cf45793fd.1342544558.git.andrei@gherzan.ro>
References: <8afb1ea6ef0d40d68203d164a6ad1d0cf45793fd.1342544558.git.andrei@gherzan.ro>
In-Reply-To: <cover.1342544558.git.andrei@gherzan.ro>
References: <cover.1342544558.git.andrei@gherzan.ro>
X-Gm-Message-State: ALoCoQkrZcqJRXfXJPA/UW8Key1lfHTDMErv0SpduR3n06AG07n5dT6v0BlifHeBwZhTkutnvHx3
Subject: [PATCH V4 3/4] connman: Add patches to fix connman on fs with no d_type support
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
X-List-Received-Date: Tue, 17 Jul 2012 17:18:02 -0000

When there is not d_type avalaible on filesystem, fstatat (stat)
can be used to check if the path is a directory.
storage.c and timezone.c were modified accordingly.

Signed-off-by: Andrei Gherzan <andrei.gherzan@windriver.com>
---
 ...If-there-is-no-d_type-support-use-fstatat.patch |   57 ++++++++++++++++++++
 ...If-there-is-no-d_type-support-use-fstatat.patch |   45 ++++++++++++++++
 meta/recipes-connectivity/connman/connman_1.3.bb   |    6 ++-
 3 files changed, 106 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-connectivity/connman/connman/0001-timezone.c-If-there-is-no-d_type-support-use-fstatat.patch
 create mode 100644 meta/recipes-connectivity/connman/connman/0002-storage.c-If-there-is-no-d_type-support-use-fstatat.patch

diff --git a/meta/recipes-connectivity/connman/connman/0001-timezone.c-If-there-is-no-d_type-support-use-fstatat.patch b/meta/recipes-connectivity/connman/connman/0001-timezone.c-If-there-is-no-d_type-support-use-fstatat.patch
new file mode 100644
index 0000000..2e2f615
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman/0001-timezone.c-If-there-is-no-d_type-support-use-fstatat.patch
@@ -0,0 +1,57 @@
+From f2094e6b2e4542adf458d8fa58d7bccd5edb762e Mon Sep 17 00:00:00 2001
+From: Andrei Gherzan <andrei@gherzan.ro>
+Date: Tue, 17 Jul 2012 17:27:39 +0300
+Subject: [PATCH V3 1/2] timezone.c: If there is no d_type support use
+ fstatat()
+
+This is useful for filesystems where d_type is always DT_UNKNOWN.
+In this case use fstatat() function.
+---
+ src/timezone.c |   24 ++++++++++++++++++++++++
+ 1 file changed, 24 insertions(+)
+
+diff --git a/src/timezone.c b/src/timezone.c
+index 173d658..f951f6b 100644
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
++			if (!(buf.st_mode & S_IFDIR))
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
diff --git a/meta/recipes-connectivity/connman/connman/0002-storage.c-If-there-is-no-d_type-support-use-fstatat.patch b/meta/recipes-connectivity/connman/connman/0002-storage.c-If-there-is-no-d_type-support-use-fstatat.patch
new file mode 100644
index 0000000..0103e60
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman/0002-storage.c-If-there-is-no-d_type-support-use-fstatat.patch
@@ -0,0 +1,45 @@
+From 7007ef32a959ac4717c19339a24fd90a68638a19 Mon Sep 17 00:00:00 2001
+From: Andrei Gherzan <andrei@gherzan.ro>
+Date: Tue, 17 Jul 2012 16:07:17 +0300
+Subject: [PATCH V3 2/2] storage.c: If there is no d_type support use
+ fstatat()
+
+This is useful for filesystems where d_type is always DT_UNKNOWN.
+In this case use fstatat() function.
+---
+ src/storage.c |   19 +++++++++++++++++++
+ 1 file changed, 19 insertions(+)
+
+diff --git a/src/storage.c b/src/storage.c
+index 47bd0cb..0491a52 100644
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
++			if (!(buf.st_mode & S_IFDIR))
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
diff --git a/meta/recipes-connectivity/connman/connman_1.3.bb b/meta/recipes-connectivity/connman/connman_1.3.bb
index 1e3d138..a98b46c 100644
--- a/meta/recipes-connectivity/connman/connman_1.3.bb
+++ b/meta/recipes-connectivity/connman/connman_1.3.bb
@@ -5,6 +5,8 @@ SRCREV = "3c0fa84091524c7cd6237744f2088ffee2f1d5ad"
 SRC_URI  = "git://git.kernel.org/pub/scm/network/connman/connman.git \
             file://0001-plugin.h-Change-visibility-to-default-for-debug-symb.patch \
             file://add_xuser_dbus_permission.patch \
-            file://connman"
+            file://connman \
+            file://0002-storage.c-If-there-is-no-d_type-support-use-fstatat.patch \
+            file://0001-timezone.c-If-there-is-no-d_type-support-use-fstatat.patch"
 S = "${WORKDIR}/git"
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
-- 
1.7.9.5



