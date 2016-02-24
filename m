Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 8D532772D4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 14:52:38 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP; 24 Feb 2016 06:52:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,494,1449561600"; d="scan'208";a="893686006"
Received: from jlock-mobl1.gar.corp.intel.com ([10.252.7.109])
	by orsmga001.jf.intel.com with ESMTP; 24 Feb 2016 06:52:38 -0800
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Feb 2016 14:52:08 +0000
Message-Id: <e96c73ddca5842aded17c274991f2bc9bf4f1757.1456325292.git.joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1456325292.git.joshua.g.lock@intel.com>
References: <cover.1456325292.git.joshua.g.lock@intel.com>
In-Reply-To: <cover.1456325292.git.joshua.g.lock@intel.com>
References: <cover.1456325292.git.joshua.g.lock@intel.com>
Subject: [PATCH 04/10] swupd-client: Add recipe
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
X-List-Received-Date: Wed, 24 Feb 2016 14:52:40 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

This commit adds the Clear Linux client updater.
This is experimental and bleeding edge, including the comments on the recipe.

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 .../0001-Tolerate-quotes-in-os-release-files.patch | 59 ++++++++++++++++++++++
 ...hange-systemctl-path-to-OE-systemctl-path.patch | 31 ++++++++++++
 .../swupd-client/Fix-build-failure-on-Yocto.patch  | 36 +++++++++++++
 .../Right-usage-of-AC_ARG_ENABLE-on-bzip2.patch    | 38 ++++++++++++++
 meta/recipes-devtools/swupd/swupd-client_2.87.bb   | 49 ++++++++++++++++++
 5 files changed, 213 insertions(+)
 create mode 100644 meta/recipes-devtools/swupd/swupd-client/0001-Tolerate-quotes-in-os-release-files.patch
 create mode 100644 meta/recipes-devtools/swupd/swupd-client/Change-systemctl-path-to-OE-systemctl-path.patch
 create mode 100644 meta/recipes-devtools/swupd/swupd-client/Fix-build-failure-on-Yocto.patch
 create mode 100644 meta/recipes-devtools/swupd/swupd-client/Right-usage-of-AC_ARG_ENABLE-on-bzip2.patch
 create mode 100644 meta/recipes-devtools/swupd/swupd-client_2.87.bb

diff --git a/meta/recipes-devtools/swupd/swupd-client/0001-Tolerate-quotes-in-os-release-files.patch b/meta/recipes-devtools/swupd/swupd-client/0001-Tolerate-quotes-in-os-release-files.patch
new file mode 100644
index 0000000..49c71ae
--- /dev/null
+++ b/meta/recipes-devtools/swupd/swupd-client/0001-Tolerate-quotes-in-os-release-files.patch
@@ -0,0 +1,59 @@
+From 586e7b927461f6604ee3a3159cd7a6d4ac22ef30 Mon Sep 17 00:00:00 2001
+From: Dmitry Rozhkov <dmitry.rozhkov@intel.com>
+Date: Thu, 11 Feb 2016 13:29:57 +0200
+Subject: [PATCH 1/2] Tolerate quotes in os-release files
+
+Some systems like Yocto or OpenSUSE prefer to wrap values in
+/etc/os-release file with quotes always and that still conforms
+to the format defined in systemd.
+
+This patch removes quotes from the values before trying to
+transform them into integer version id.
+
+Signed-off-by: Dmitry Rozhkov <dmitry.rozhkov@intel.com>
+
+Upstream-Status: Backport (v3.0.0+)
+
+---
+ src/version.c | 18 +++++++++++++++++-
+ 1 file changed, 17 insertions(+), 1 deletion(-)
+
+diff --git a/src/version.c b/src/version.c
+index 0e09cd9..83d6ad4 100644
+--- a/src/version.c
++++ b/src/version.c
+@@ -88,6 +88,7 @@ int read_version_from_subvol_file(char *path_prefix)
+ 	FILE *file;
+ 	int v = -1;
+ 	char *buildstamp;
++	char *src, *dest;
+ 
+ 	string_or_die(&buildstamp, "%s/usr/lib/os-release", path_prefix);
+ 	file = fopen(buildstamp, "rm");
+@@ -106,7 +107,22 @@ int read_version_from_subvol_file(char *path_prefix)
+ 			break;
+ 		}
+ 
+-		if (strncmp(line,"VERSION_ID=", 11) == 0) {
++		if (strncmp(line, "VERSION_ID=", 11) == 0) {
++			src = &line[11];
++
++			/* Drop quotes and newline in value */
++			dest = src;
++			while (*src) {
++				if (*src == '\'' || *src == '"' || *src == '\n') {
++					++src;
++				} else {
++					*dest = *src;
++					++dest;
++					++src;
++				}
++			}
++			*dest = 0;
++
+ 			v = strtoull(&line[11], NULL, 10);
+ 			break;
+ 		}
+-- 
+2.5.0
+
diff --git a/meta/recipes-devtools/swupd/swupd-client/Change-systemctl-path-to-OE-systemctl-path.patch b/meta/recipes-devtools/swupd/swupd-client/Change-systemctl-path-to-OE-systemctl-path.patch
new file mode 100644
index 0000000..5ca6373
--- /dev/null
+++ b/meta/recipes-devtools/swupd/swupd-client/Change-systemctl-path-to-OE-systemctl-path.patch
@@ -0,0 +1,31 @@
+From 259d86e64146c3156eccfcce0351a9cdc4714766 Mon Sep 17 00:00:00 2001
+From: Jaska Uimonen <jaska.uimonen@intel.com>
+Date: Thu, 14 Jan 2016 10:17:43 +0200
+Subject: [PATCH] change systemctl path to OE systemctl path
+
+Upstream-Status: Inappropriate
+
+---
+ src/scripts.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/scripts.c b/src/scripts.c
+index e426272..9bec0f5 100644
+--- a/src/scripts.c
++++ b/src/scripts.c
+@@ -84,10 +84,10 @@ static void update_triggers(void)
+ 	int ret;
+ 	LOG_INFO(NULL, "calling systemd trigger", class_scripts, "");
+ 
+-	ret = system("/usr/bin/systemctl daemon-reload");
++	ret = system("/bin/systemctl daemon-reload");
+ 	if (ret != 0)
+ 		LOG_ERROR(NULL, "systemd daemon reload failed", class_scripts, "%d", ret);
+-	ret = system("/usr/bin/systemctl restart update-triggers.target");
++	ret = system("/bin/systemctl restart update-triggers.target");
+ 	if (ret != 0)
+ 		LOG_ERROR(NULL, "systemd update triggers failed", class_scripts, "%d", ret);
+ }
+-- 
+2.5.0
+
diff --git a/meta/recipes-devtools/swupd/swupd-client/Fix-build-failure-on-Yocto.patch b/meta/recipes-devtools/swupd/swupd-client/Fix-build-failure-on-Yocto.patch
new file mode 100644
index 0000000..73f1728
--- /dev/null
+++ b/meta/recipes-devtools/swupd/swupd-client/Fix-build-failure-on-Yocto.patch
@@ -0,0 +1,36 @@
+From ccce73a2d703e6789ded87ca5aa9f3b7c506892a Mon Sep 17 00:00:00 2001
+From: Amarnath Valluri <amarnath.valluri@intel.com>
+Date: Thu, 7 Jan 2016 16:19:34 +0200
+Subject: [PATCH] Fix build failure on Yocto
+
+On install phase certificate files are being installed twice as included in
+_DATA twice. We can use EXTRA_DIST than dist_.
+
+Upstream-Status: Inappropriate
+
+Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
+---
+ Makefile.am | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 1e65d3d..4d15c55 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -111,11 +111,11 @@ SWUPD_CERTS = certs/157753a5.0 \
+ 	certs/d6325660.0 \
+ 	certs/d6325660.1
+ swupdcerts_DATA = $(SWUPD_CERTS)
+-dist_swupdcerts_DATA = $(SWUPD_CERTS)
+ 
+ EXTRA_DIST += \
+ 	data/check-update.service \
+-	data/check-update.timer
++	data/check-update.timer \
++	$(SWUPD_CERTS)
+ 
+ DISTCHECK_CONFIGURE_FLAGS = \
+         --with-systemdsystemunitdir=$$dc_install_base/$(systemdunitdir)
+-- 
+2.1.4
+
diff --git a/meta/recipes-devtools/swupd/swupd-client/Right-usage-of-AC_ARG_ENABLE-on-bzip2.patch b/meta/recipes-devtools/swupd/swupd-client/Right-usage-of-AC_ARG_ENABLE-on-bzip2.patch
new file mode 100644
index 0000000..e5b53ef
--- /dev/null
+++ b/meta/recipes-devtools/swupd/swupd-client/Right-usage-of-AC_ARG_ENABLE-on-bzip2.patch
@@ -0,0 +1,38 @@
+From d80ae9954c5e5b720766274249dbf5309b7c70a9 Mon Sep 17 00:00:00 2001
+From: Amarnath Valluri <amarnath.valluri@intel.com>
+Date: Wed, 13 Jan 2016 15:46:19 +0200
+Subject: [PATCH] Right usage of AC_ARG_ENABLE on bzip2
+
+Upstream-Status: Pending[Not submitted]
+
+Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
+---
+ configure.ac | 12 +++++++-----
+ 1 file changed, 7 insertions(+), 5 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index f94a17d..b11ef0a 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -20,11 +20,13 @@ AC_CONFIG_HEADERS([config.h])
+ PKG_CHECK_MODULES([lzma], [liblzma])
+ PKG_CHECK_MODULES([zlib], [zlib])
+ AC_ARG_ENABLE(
+-	bzip2,
+-	AS_HELP_STRING([--disable-bzip2],[Do not use bzip2 compression (uses bzip2 by default)]),
+-	AC_DEFINE(SWUPD_WITHOUT_BZIP2,1,[Do not use bzip2 compression]) ,
+-	AC_DEFINE(SWUPD_WITH_BZIP2,1,[Use bzip2 compression])
+-	AC_CHECK_LIB([bz2], [BZ2_bzBuffToBuffCompress], [], [AC_MSG_ERROR([the libbz2 library is missing])])
++	[bzip2],
++	AS_HELP_STRING([--disable-bzip2],[Do not use bzip2 compression (uses bzip2 by default)])
++)
++AS_IF([test "x$enable_bzip2" = "xyes" ],
++  [AC_DEFINE(SWUPD_WITH_BZIP2,1,[Use bzip2 compression])
++	 AC_CHECK_LIB([bz2], [BZ2_bzBuffToBuffCompress], [], [AC_MSG_ERROR([the libbz2 library is missing])])],
++  [AC_DEFINE(SWUPD_WITHOUT_BZIP2,1,[Do not use bzip2 compression])]
+ )
+ 
+ AC_ARG_WITH([systemdsystemunitdir], AS_HELP_STRING([--with-systemdsystemunitdir=DIR],
+-- 
+2.1.4
+
diff --git a/meta/recipes-devtools/swupd/swupd-client_2.87.bb b/meta/recipes-devtools/swupd/swupd-client_2.87.bb
new file mode 100644
index 0000000..a5afdd6
--- /dev/null
+++ b/meta/recipes-devtools/swupd/swupd-client_2.87.bb
@@ -0,0 +1,49 @@
+SUMMARY = "swupd sofware update from Clear Linux - client component"
+LICENSE = "GPL-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=04d0b48662817042d80393e7511fa41b \
+                    file://bsdiff/LICENSE;md5=0dbe7a50f028269750631fcbded3846a"
+
+SRC_URI = "\
+    https://download.clearlinux.org/releases/5700/clear/source/SRPMS/${BPN}-${PV}-105.src.rpm;extract=${BP}.tar.gz \
+    file://Fix-build-failure-on-Yocto.patch \
+    file://Right-usage-of-AC_ARG_ENABLE-on-bzip2.patch \
+    file://Change-systemctl-path-to-OE-systemctl-path.patch \
+    file://0001-Tolerate-quotes-in-os-release-files.patch \
+"
+
+SRC_URI[md5sum] = "5d272c62edb8a9c576005ac5e1182ea3"
+SRC_URI[sha256sum] = "45df259a7dc2fed985ee9961e112120fc46670dd75476c3262fc6804b1c66fb8"
+
+DEPENDS = "glib-2.0 curl zlib bzip2 xz openssl"
+RDEPENDS_${PN} = "gzip bzip2 tar xz"
+# swupd requires at least an update-triggers target, should it be part of the
+# swupd-client package?
+RDEPENDS_${PN} = "swupd-units"
+# We check /etc/os-release for the current OS version number
+RRECOMMENDS_${PN} = "os-release"
+
+inherit pkgconfig autotools-brokensep systemd
+
+EXTRA_OECONF = "--with-systemdsystemunitdir=${systemd_system_unitdir}"
+
+#TODO: create and install /var/lib/swupd/{delta,staged/download}
+do_install_append () {
+    # swupd-client 2.87 doesn't (succesfully) create these and fails to update
+    # should they not exist. This is due to a bash-specific shell command
+    # called to create the directories 'mkdir -p /var/lib/{delta,staged,download}'
+    install -d ${D}/var/lib/swupd/delta
+    install -d ${D}/var/lib/swupd/download
+    install -d ${D}/var/lib/swupd/staged
+
+    # TODO: This should be a less os-specific directory and not hard-code datadir
+    install -d ${D}/usr/share/clear/bundles
+}
+
+FILES_${PN} += "\
+    /usr/share/clear \
+    ${systemd_system_unitdir}/multi-user.target.wants* \
+    /var/lib/swupd \
+"
+
+SYSTEMD_SERVICE_${PN} = "check-update.timer check-update.service"
+SYSTEMD_AUTO_ENABLE_${PN} = "disable"
-- 
2.5.0


