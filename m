Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SrAgN-00021K-GV
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jul 2012 18:31:31 +0200
Received: by mail-bk0-f47.google.com with SMTP id ik5so466300bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2012 09:20:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=yr/Z7t/QPuRt2GxAj/XooTdysh3DcPTv8dk8nBiHqIE=;
	b=EQmRP2SyZ/txf5eSEXEM5qfwk4yBo18OL8FOEyKYgcGMaw7Btlfx+cVPc8tIQmimyL
	nvNlioVwXB/7NKOdhKz7oZmHG0wXRNCLDx0Fd5VzhQ3zXonh7HqDJciRxk0zi15/jZIv
	e6t+h4hbjDyEFu8+/89uWKVjoMXu5oKbuouYt4axR3ss8v5I5ePdVIA2pG0ooQG2E3aQ
	g7KNbi4EWASS9pu7hH6Uua+0b1DWhe69z7ymxDRa3VsdAMSA3pEPYS9zDxFv2eJOGnhx
	BlWDh+1mH7SU4sGIPsRPGjT9IypHpqVWJiN2qLYLzkzrOPCzXUnX2GJrHlJB/ofTt5zi
	dnKg==
Received: by 10.204.145.82 with SMTP id c18mr1608435bkv.133.1342542013901;
	Tue, 17 Jul 2012 09:20:13 -0700 (PDT)
Received: from otp-agherzan-l1.corp.ad.wrs.com ([89.121.200.106])
	by mx.google.com with ESMTPS id 14sm10358424bkq.12.2012.07.17.09.20.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Jul 2012 09:20:12 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jul 2012 19:20:02 +0300
Message-Id: <c4db8d73744178e9f99a2441f5137a3610c8b93d.1342541736.git.andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <8afb1ea6ef0d40d68203d164a6ad1d0cf45793fd.1342541736.git.andrei@gherzan.ro>
References: <8afb1ea6ef0d40d68203d164a6ad1d0cf45793fd.1342541736.git.andrei@gherzan.ro>
In-Reply-To: <cover.1342541736.git.andrei@gherzan.ro>
References: <cover.1342541736.git.andrei@gherzan.ro>
X-Gm-Message-State: ALoCoQm/oeU1y3Kb/68V/5m8MLAHuCWYCLPS3OO9dIs2H0VsZPssr95V9sbdFqjWBSlPDH9Bju3x
Subject: [PATCH V3 3/3] connman: Add patches to fix connman on fs with no d_type support
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
X-List-Received-Date: Tue, 17 Jul 2012 16:31:31 -0000

When there is not d_type avalaible on filesystem, fstatat (stat)
can be used to check if the path is a directory.
storage.c and timezone.c were modified accordingly.

Signed-off-by: Andrei Gherzan <andrei.gherzan@windriver.com>
---
 ....c-If-there-is-no-d_type-support-use-stat.patch |   42 ++++++
 ....c-If-there-is-no-d_type-support-use-stat.patch |   56 ++++++++
 meta/recipes-connectivity/connman/connman_1.3.bb   |    6 +-
 pull-5566/0000-cover-letter.patch                  |   60 ++++++++
 pull-5566/0001-connman-Update-to-version-1.3.patch |   34 +++++
 ...-Add-missing-dependencies-needed-by-some-.patch |   44 ++++++
 ...-patches-to-fix-connman-on-fs-with-no-d_t.patch |  152 ++++++++++++++++++++
 7 files changed, 392 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-connectivity/connman/connman/0001-storage.c-If-there-is-no-d_type-support-use-stat.patch
 create mode 100644 meta/recipes-connectivity/connman/connman/0002-timezone.c-If-there-is-no-d_type-support-use-stat.patch
 create mode 100644 pull-5566/0000-cover-letter.patch
 create mode 100644 pull-5566/0001-connman-Update-to-version-1.3.patch
 create mode 100644 pull-5566/0002-connman.inc-Add-missing-dependencies-needed-by-some-.patch
 create mode 100644 pull-5566/0003-connman-Add-patches-to-fix-connman-on-fs-with-no-d_t.patch

diff --git a/meta/recipes-connectivity/connman/connman/0001-storage.c-If-there-is-no-d_type-support-use-stat.patch b/meta/recipes-connectivity/connman/connman/0001-storage.c-If-there-is-no-d_type-support-use-stat.patch
new file mode 100644
index 0000000..cb98a27
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman/0001-storage.c-If-there-is-no-d_type-support-use-stat.patch
@@ -0,0 +1,42 @@
+Date: Tue, 17 Jul 2012 16:07:17 +0300
+Subject: [PATCH V3 1/2] storage.c: If there is no d_type support use fstatat()
+
+This is useful for filesystems where d_type is always DT_UNKNOWN.
+In this case use fstatat() function.
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
index 0000000..11924c1
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman/0002-timezone.c-If-there-is-no-d_type-support-use-stat.patch
@@ -0,0 +1,56 @@
+From 4fcb5991362ed0473572d1d8e17d77c067ad98a9 Mon Sep 17 00:00:00 2001
+From: Andrei Gherzan <andrei@gherzan.ro>
+Date: Tue, 17 Jul 2012 17:27:39 +0300
+Subject: [PATCH V3 2/2] timezone.c: If there is no d_type support use fstatat()
+
+This is useful for filesystems where d_type is always DT_UNKNOWN.
+In this case use fstatat() function.
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
diff --git a/pull-5566/0000-cover-letter.patch b/pull-5566/0000-cover-letter.patch
new file mode 100644
index 0000000..72e2412
--- /dev/null
+++ b/pull-5566/0000-cover-letter.patch
@@ -0,0 +1,60 @@
+From e7c36cdedb56c561d5bd5b53cee95ca4818a238d Mon Sep 17 00:00:00 2001
+Message-Id: <cover.1342540673.git.andrei@gherzan.ro>
+From: Andrei Gherzan <andrei@gherzan.ro>
+Date: Tue, 17 Jul 2012 18:57:53 +0300
+Subject: [PATCH V2 0/3] Update connman to v1.3, fix dependencies and runtime
+
+Update connman to v1.3.
+Fix dependencies needed for tests.
+Add patches to fix runtime segfault on mips and ppc.
+
+Machine tested: qemux86 / qemumips
+
+Tests done on connman-gnome
+        OnlineMode / OfflineMode
+        Enable / Disable Wired Networks
+        Set manual IP configuration
+
+Tests on connman v.1.3
+        addr-test
+        iptables-test
+        polkit-test
+        get-global-timeservers
+        get-proxy-autoconfig
+        get-services
+        get-state
+        list-services
+        show-introspection
+        test-clock
+        test-connman
+        test-counter
+        test-manager
+        test-session
+
+
+The following changes since commit 90ad663909c0c8a405b22a510c9f957007d02669:
+
+  upstream_tracking: update boost (2012-07-09 17:21:38 +0100)
+
+are available in the git repository at:
+
+  git://git.yoctoproject.org/poky-contrib ag/connman1.3
+  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ag/connman1.3
+
+Andrei Gherzan (3):
+  connman: Update to version 1.3
+  connman.inc: Add missing dependencies needed by some tests
+  connman: Add patches to fix connman on fs with no d_type support
+
+ meta/recipes-connectivity/connman/connman.inc      |    4 +-
+ ....c-If-there-is-no-d_type-support-use-stat.patch |   44 +++++++++++++++
+ ....c-If-there-is-no-d_type-support-use-stat.patch |   56 ++++++++++++++++++++
+ .../connman/{connman_1.0.bb => connman_1.3.bb}     |   10 ++--
+ 4 files changed, 108 insertions(+), 6 deletions(-)
+ create mode 100644 meta/recipes-connectivity/connman/connman/0001-storage.c-If-there-is-no-d_type-support-use-stat.patch
+ create mode 100644 meta/recipes-connectivity/connman/connman/0002-timezone.c-If-there-is-no-d_type-support-use-stat.patch
+ rename meta/recipes-connectivity/connman/{connman_1.0.bb => connman_1.3.bb} (47%)
+
+-- 
+1.7.9.5
+
diff --git a/pull-5566/0001-connman-Update-to-version-1.3.patch b/pull-5566/0001-connman-Update-to-version-1.3.patch
new file mode 100644
index 0000000..171a341
--- /dev/null
+++ b/pull-5566/0001-connman-Update-to-version-1.3.patch
@@ -0,0 +1,34 @@
+From 8afb1ea6ef0d40d68203d164a6ad1d0cf45793fd Mon Sep 17 00:00:00 2001
+Message-Id: <8afb1ea6ef0d40d68203d164a6ad1d0cf45793fd.1342540673.git.andrei@gherzan.ro>
+In-Reply-To: <cover.1342540673.git.andrei@gherzan.ro>
+References: <cover.1342540673.git.andrei@gherzan.ro>
+From: Andrei Gherzan <andrei.gherzan@windriver.com>
+Date: Thu, 12 Jul 2012 20:46:06 +0300
+Subject: [PATCH V2 1/3] connman: Update to version 1.3
+
+Signed-off-by: Andrei Gherzan <andrei.gherzan@windriver.com>
+---
+ .../connman/{connman_1.0.bb => connman_1.3.bb}     |    4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+ rename meta/recipes-connectivity/connman/{connman_1.0.bb => connman_1.3.bb} (82%)
+
+diff --git a/meta/recipes-connectivity/connman/connman_1.0.bb b/meta/recipes-connectivity/connman/connman_1.3.bb
+similarity index 82%
+rename from meta/recipes-connectivity/connman/connman_1.0.bb
+rename to meta/recipes-connectivity/connman/connman_1.3.bb
+index 926d22e..1e3d138 100644
+--- a/meta/recipes-connectivity/connman/connman_1.0.bb
++++ b/meta/recipes-connectivity/connman/connman_1.3.bb
+@@ -1,7 +1,7 @@
+ require connman.inc
+ 
+-# 1.0 tag
+-SRCREV = "6d6f312fb2b751b4cf7037f2a526c7785364732f"
++# 1.3 tag
++SRCREV = "3c0fa84091524c7cd6237744f2088ffee2f1d5ad"
+ SRC_URI  = "git://git.kernel.org/pub/scm/network/connman/connman.git \
+             file://0001-plugin.h-Change-visibility-to-default-for-debug-symb.patch \
+             file://add_xuser_dbus_permission.patch \
+-- 
+1.7.9.5
+
diff --git a/pull-5566/0002-connman.inc-Add-missing-dependencies-needed-by-some-.patch b/pull-5566/0002-connman.inc-Add-missing-dependencies-needed-by-some-.patch
new file mode 100644
index 0000000..4a9cc3c
--- /dev/null
+++ b/pull-5566/0002-connman.inc-Add-missing-dependencies-needed-by-some-.patch
@@ -0,0 +1,44 @@
+From eb7f8d63b38012eff32b77de87606c460e0772a8 Mon Sep 17 00:00:00 2001
+Message-Id: <eb7f8d63b38012eff32b77de87606c460e0772a8.1342540673.git.andrei@gherzan.ro>
+In-Reply-To: <cover.1342540673.git.andrei@gherzan.ro>
+References: <cover.1342540673.git.andrei@gherzan.ro>
+From: Andrei Gherzan <andrei.gherzan@windriver.com>
+Date: Thu, 12 Jul 2012 20:47:19 +0300
+Subject: [PATCH V2 2/3] connman.inc: Add missing dependencies needed by some
+ tests
+
+Some tests need:
+* gobject and optparse module (ex: test-session)
+* subprocess and fnctl module (ex: backtrace)
+* urllib module (ex: get-proxy-autoconfig)
+
+Signed-off-by: Andrei Gherzan <andrei.gherzan@windriver.com>
+---
+ meta/recipes-connectivity/connman/connman.inc |    4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
+index 12378e9..58cac0b 100644
+--- a/meta/recipes-connectivity/connman/connman.inc
++++ b/meta/recipes-connectivity/connman/connman.inc
+@@ -20,7 +20,7 @@ DEPENDS  = "dbus glib-2.0 ppp iptables gnutls \
+             ${@base_contains('DISTRO_FEATURES', '3g','ofono', '', d)} \
+             "
+ 
+-INC_PR = "r11"
++INC_PR = "r12"
+ 
+ TIST = "--enable-tist"
+ TIST_powerpc = ""
+@@ -113,7 +113,7 @@ PACKAGES =+ "${PN}-tools ${PN}-tests"
+ FILES_${PN}-tools = "${bindir}/wispr"
+ 
+ FILES_${PN}-tests = "${bindir}/*-test ${libdir}/${BPN}/test/*"
+-RDEPENDS_${PN}-tests = "python-dbus"
++RDEPENDS_${PN}-tests = "python-dbus python-pygobject python-textutils python-subprocess python-fcntl python-netclient"
+ 
+ FILES_${PN} = "${bindir}/* ${sbindir}/* ${libexecdir}/* ${libdir}/lib*.so.* \
+             ${libdir}/connman/plugins \
+-- 
+1.7.9.5
+
diff --git a/pull-5566/0003-connman-Add-patches-to-fix-connman-on-fs-with-no-d_t.patch b/pull-5566/0003-connman-Add-patches-to-fix-connman-on-fs-with-no-d_t.patch
new file mode 100644
index 0000000..f11727e
--- /dev/null
+++ b/pull-5566/0003-connman-Add-patches-to-fix-connman-on-fs-with-no-d_t.patch
@@ -0,0 +1,152 @@
+From e7c36cdedb56c561d5bd5b53cee95ca4818a238d Mon Sep 17 00:00:00 2001
+Message-Id: <e7c36cdedb56c561d5bd5b53cee95ca4818a238d.1342540673.git.andrei@gherzan.ro>
+In-Reply-To: <cover.1342540673.git.andrei@gherzan.ro>
+References: <cover.1342540673.git.andrei@gherzan.ro>
+From: Andrei Gherzan <andrei@gherzan.ro>
+Date: Tue, 17 Jul 2012 16:39:26 +0300
+Subject: [PATCH V2 3/3] connman: Add patches to fix connman on fs with no
+ d_type support
+
+When there is not d_type avalaible on filesystem, fstatat (stat)
+can be used to check if path is directory.
+storage.c and timezone.c were modified accordingly.
+
+Signed-off-by: Andrei Gherzan <andrei.gherzan@windriver.com>
+---
+ ....c-If-there-is-no-d_type-support-use-stat.patch |   44 +++++++++++++++
+ ....c-If-there-is-no-d_type-support-use-stat.patch |   56 ++++++++++++++++++++
+ meta/recipes-connectivity/connman/connman_1.3.bb   |    6 ++-
+ 3 files changed, 104 insertions(+), 2 deletions(-)
+ create mode 100644 meta/recipes-connectivity/connman/connman/0001-storage.c-If-there-is-no-d_type-support-use-stat.patch
+ create mode 100644 meta/recipes-connectivity/connman/connman/0002-timezone.c-If-there-is-no-d_type-support-use-stat.patch
+
+diff --git a/meta/recipes-connectivity/connman/connman/0001-storage.c-If-there-is-no-d_type-support-use-stat.patch b/meta/recipes-connectivity/connman/connman/0001-storage.c-If-there-is-no-d_type-support-use-stat.patch
+new file mode 100644
+index 0000000..c542867
+--- /dev/null
++++ b/meta/recipes-connectivity/connman/connman/0001-storage.c-If-there-is-no-d_type-support-use-stat.patch
+@@ -0,0 +1,44 @@
++From c167bfd6b5edd01dbbb4794f3851933b2650db0e Mon Sep 17 00:00:00 2001
++From: Andrei Gherzan <andrei@gherzan.ro>
++Date: Tue, 17 Jul 2012 16:07:17 +0300
++Subject: [PATCH V3 1/2] storage.c: If there is no d_type support use stat()
++
++This is usefull for filesystems where d_type is always DT_UNKNOWN.
++In this case use stat() function.
++---
++ src/storage.c |   19 +++++++++++++++++++
++ 1 file changed, 19 insertions(+)
++
++diff --git a/src/storage.c b/src/storage.c
++index 47bd0cb..0cffa0a 100644
++--- a/src/storage.c
+++++ b/src/storage.c
++@@ -206,6 +206,25 @@ gchar **connman_storage_get_services()
++ 
++ 			g_string_append_printf(result, "%s/", d->d_name);
++ 			break;
+++		case DT_UNKNOWN:
+++			/*
+++			 * If there is no d_type support use stat()
+++			 * to check if directory
+++			 */
+++			ret = fstatat(dirfd(dir), d->d_name, &buf, 0);
+++			if (ret < 0)
+++				continue;
+++			if (!buf.st_mode & S_IFDIR)
+++				continue;
+++			str = g_strdup_printf("%s/%s/settings", STORAGEDIR,
+++							d->d_name);
+++			ret = stat(str, &buf);
+++			g_free(str);
+++			if (ret < 0)
+++				continue;
+++
+++			g_string_append_printf(result, "%s/", d->d_name);
+++			break;
++ 		}
++ 	}
++ 
++-- 
++1.7.9.5
++
+diff --git a/meta/recipes-connectivity/connman/connman/0002-timezone.c-If-there-is-no-d_type-support-use-stat.patch b/meta/recipes-connectivity/connman/connman/0002-timezone.c-If-there-is-no-d_type-support-use-stat.patch
+new file mode 100644
+index 0000000..b8da25a
+--- /dev/null
++++ b/meta/recipes-connectivity/connman/connman/0002-timezone.c-If-there-is-no-d_type-support-use-stat.patch
+@@ -0,0 +1,56 @@
++From 4fcb5991362ed0473572d1d8e17d77c067ad98a9 Mon Sep 17 00:00:00 2001
++From: Andrei Gherzan <andrei@gherzan.ro>
++Date: Tue, 17 Jul 2012 17:27:39 +0300
++Subject: [PATCH V3 2/2] timezone.c: If there is no d_type support use stat()
++
++This is usefull for filesystems where d_type is always DT_UNKNOWN.
++In this case use stat() function.
++---
++ src/timezone.c |   24 ++++++++++++++++++++++++
++ 1 file changed, 24 insertions(+)
++
++diff --git a/src/timezone.c b/src/timezone.c
++index 173d658..73aefbd 100644
++--- a/src/timezone.c
+++++ b/src/timezone.c
++@@ -157,6 +157,8 @@ static char *find_origin(void *src_map, struct stat *src_st,
++ 	DIR *dir;
++ 	struct dirent *d;
++ 	char *str, pathname[PATH_MAX];
+++	struct stat buf;
+++	int ret;
++ 
++ 	if (subpath == NULL)
++ 		strncpy(pathname, basepath, sizeof(pathname));
++@@ -205,6 +207,28 @@ static char *find_origin(void *src_map, struct stat *src_st,
++ 				return str;
++ 			}
++ 			break;
+++		case DT_UNKNOWN:
+++			/*
+++			 * If there is no d_type support use stat()
+++			 * to check if directory
+++			 */
+++			ret = fstatat(dirfd(dir), d->d_name, &buf, 0);
+++			if (ret < 0)
+++				continue;
+++			if (!buf.st_mode & S_IFDIR)
+++				continue;
+++			if (subpath == NULL)
+++				strncpy(pathname, d->d_name, sizeof(pathname));
+++			else
+++				snprintf(pathname, sizeof(pathname),
+++						"%s/%s", subpath, d->d_name);
+++
+++			str = find_origin(src_map, src_st, basepath, pathname);
+++			if (str != NULL) {
+++				closedir(dir);
+++				return str;
+++			}
+++			break;
++ 		}
++ 	}
++ 
++-- 
++1.7.9.5
++
+diff --git a/meta/recipes-connectivity/connman/connman_1.3.bb b/meta/recipes-connectivity/connman/connman_1.3.bb
+index 1e3d138..a9faf74 100644
+--- a/meta/recipes-connectivity/connman/connman_1.3.bb
++++ b/meta/recipes-connectivity/connman/connman_1.3.bb
+@@ -5,6 +5,8 @@ SRCREV = "3c0fa84091524c7cd6237744f2088ffee2f1d5ad"
+ SRC_URI  = "git://git.kernel.org/pub/scm/network/connman/connman.git \
+             file://0001-plugin.h-Change-visibility-to-default-for-debug-symb.patch \
+             file://add_xuser_dbus_permission.patch \
+-            file://connman"
++            file://connman \
++            file://0001-storage.c-If-there-is-no-d_type-support-use-stat.patch \
++            file://0002-timezone.c-If-there-is-no-d_type-support-use-stat.patch"
+ S = "${WORKDIR}/git"
+-PR = "${INC_PR}.0"
++PR = "${INC_PR}.1"
+-- 
+1.7.9.5
+
-- 
1.7.9.5



