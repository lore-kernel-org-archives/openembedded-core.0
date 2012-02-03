Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RtEli-0000tT-EP
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Feb 2012 09:45:18 +0100
Received: by mail-pz0-f47.google.com with SMTP id n34so83755dal.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Feb 2012 00:37:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=g1kP2F8m1s++Az0fivxIQlRTu4x5YTKdj6wgWVD49HY=;
	b=pMLYgX/BnVxzpVCEEZQr99cXYlnnRke1raSwDScF/fU5POmVd28ic247vrIYf+CKwV
	LOadeonNYBo6mmaLZAkZ/msCpM/oTe87etY0NLRafzdBImHbJ7JAjH7lf2PmT3Uq/5YV
	fPwD7CSB6f6wegV3WYU2Mgepvlqjc8pawX2+I=
Received: by 10.68.227.198 with SMTP id sc6mr15604037pbc.131.1328258243155;
	Fri, 03 Feb 2012 00:37:23 -0800 (PST)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id z5sm11478262pbc.5.2012.02.03.00.37.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 03 Feb 2012 00:37:22 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Feb 2012 00:36:12 -0800
Message-Id: <151948a832e661d8e801b6ba5be5912862ae5dfa.1328257913.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <a6d38499fa7010e3e96d9a36d9b88231d911a3c8.1328257913.git.raj.khem@gmail.com>
References: <a6d38499fa7010e3e96d9a36d9b88231d911a3c8.1328257913.git.raj.khem@gmail.com>
In-Reply-To: <cover.1328257913.git.raj.khem@gmail.com>
References: <cover.1328257913.git.raj.khem@gmail.com>
Subject: [PATCH 07/14] kmod: Add recipes
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
X-List-Received-Date: Fri, 03 Feb 2012 08:45:18 -0000

kmod is replacement for module-init-tools

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-kernel/kmod/kmod-native_git.bb        |   16 +++
 meta/recipes-kernel/kmod/kmod.inc                  |   35 +++++++
 ...001-depmod-Dont-use-errno-unconditionally.patch |  101 ++++++++++++++++++++
 meta/recipes-kernel/kmod/kmod/depmod-search.conf   |    6 +
 meta/recipes-kernel/kmod/kmod_git.bb               |   62 ++++++++++++
 5 files changed, 220 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-kernel/kmod/kmod-native_git.bb
 create mode 100644 meta/recipes-kernel/kmod/kmod.inc
 create mode 100644 meta/recipes-kernel/kmod/kmod/0001-depmod-Dont-use-errno-unconditionally.patch
 create mode 100644 meta/recipes-kernel/kmod/kmod/depmod-search.conf
 create mode 100644 meta/recipes-kernel/kmod/kmod_git.bb

diff --git a/meta/recipes-kernel/kmod/kmod-native_git.bb b/meta/recipes-kernel/kmod/kmod-native_git.bb
new file mode 100644
index 0000000..904af20
--- /dev/null
+++ b/meta/recipes-kernel/kmod/kmod-native_git.bb
@@ -0,0 +1,16 @@
+# Copyright (C) 2012 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+require kmod.inc
+inherit native
+
+PR = "${INC_PR}.0"
+
+# EXTRA_OECONF_append = " --disable-shared"
+
+do_install_append (){
+	for tool in depmod insmod lsmod modinfo modprobe rmmod
+	do
+		ln -s kmod ${D}${bindir}/$tool
+	done
+}
diff --git a/meta/recipes-kernel/kmod/kmod.inc b/meta/recipes-kernel/kmod/kmod.inc
new file mode 100644
index 0000000..a425a3a
--- /dev/null
+++ b/meta/recipes-kernel/kmod/kmod.inc
@@ -0,0 +1,35 @@
+# Copyright (C) 2012 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+DESCRIPTION = "kmod is a set of tools to handle common tasks with Linux kernel modules like \
+insert, remove, list, check properties, resolve dependencies and aliases."
+HOMEPAGE = "http://packages.profusion.mobi/kmod/"
+LICENSE = "GPL-2.0+ & LGPL-2.1+"
+LICENSE_libkmod = "LGPL-2.1+"
+SECTION = "base"
+PV = "4+gitr${SRCREV}"
+INC_PR = "r0"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
+                    file://libkmod/COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
+                   "
+inherit autotools
+
+SRC_URI = "git://git.profusion.mobi/kmod.git;protocol=git;branch=master \
+           file://0001-depmod-Dont-use-errno-unconditionally.patch \
+           file://depmod-search.conf \
+          "
+
+SRCREV = "7bede7b6a8a75841a09478e59efbc39677b8d1d2"
+
+S = "${WORKDIR}/git"
+
+EXTRA_AUTORECONF += "--install --symlink"
+EXTRA_OECONF +="--enable-debug --enable-logging --enable-tools"
+
+do_configure_prepend () {
+        gtkdocize --docdir ${S}/libkmod/docs || touch ${S}/libkmod/docs/gtk-doc.make
+}
+
+INHIBIT_PACKAGE_STRIP = "1"
+BUILD_CFLAGS += "-O -g"
diff --git a/meta/recipes-kernel/kmod/kmod/0001-depmod-Dont-use-errno-unconditionally.patch b/meta/recipes-kernel/kmod/kmod/0001-depmod-Dont-use-errno-unconditionally.patch
new file mode 100644
index 0000000..b7d8aac
--- /dev/null
+++ b/meta/recipes-kernel/kmod/kmod/0001-depmod-Dont-use-errno-unconditionally.patch
@@ -0,0 +1,101 @@
+From 8d59b591cc75fd5258a3a04aa768d9f34460494a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 2 Feb 2012 20:55:53 -0800
+Subject: [PATCH] depmod: Dont use errno unconditionally
+
+fopen() will not reset errno if it succeeds so we should
+make sure that we only use errno in error cases.
+
+Also fix the diagnostic messages to not use strerror
+when there is no error since strerror will not return
+anything useful in this case
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tools/kmod-depmod.c |   29 ++++++++++++++++-------------
+ 1 files changed, 16 insertions(+), 13 deletions(-)
+
+diff --git a/tools/kmod-depmod.c b/tools/kmod-depmod.c
+index 0721daf..01bca2a 100644
+--- a/tools/kmod-depmod.c
++++ b/tools/kmod-depmod.c
+@@ -941,7 +941,7 @@ static int cfg_files_list(struct cfg_file ***p_files, size_t *p_n_files,
+ 	}
+ 
+ 	closedir(d);
+-	DBG("parsed configuration files from %s: %s\n", path, strerror(-err));
++	DBG("parsed configuration files from %s\n", path);
+ 	return err;
+ }
+ 
+@@ -2293,13 +2293,15 @@ static int depmod_load_symvers(struct depmod *depmod, const char *filename)
+ 	char line[10240];
+ 	FILE *fp;
+ 	unsigned int linenum = 0;
+-	int err;
++	int err = 0;
+ 
+ 	fp = fopen(filename, "r");
+-	err = -errno;
+-	DBG("load symvers: %s: %s\n", filename, strerror(-err));
+-	if (fp == NULL)
++	if (fp == NULL) {
++		err = -errno;
++		DBG("load symvers: %s: %s\n", filename, strerror(-err));
+ 		return err;
++	}
++	DBG("load symvers: %s\n", filename);
+ 
+ 	/* eg. "0xb352177e\tfind_first_bit\tvmlinux\tEXPORT_SYMBOL" */
+ 	while (fgets(line, sizeof(line), fp) != NULL) {
+@@ -2329,7 +2331,7 @@ static int depmod_load_symvers(struct depmod *depmod, const char *filename)
+ 	}
+ 	depmod_add_fake_syms(depmod);
+ 
+-	DBG("loaded symvers: %s: %s\n", filename, strerror(-err));
++	DBG("loaded symvers: %s\n", filename);
+ 
+ 	fclose(fp);
+ 	return err;
+@@ -2342,14 +2344,15 @@ static int depmod_load_system_map(struct depmod *depmod, const char *filename)
+ 	char line[10240];
+ 	FILE *fp;
+ 	unsigned int linenum = 0;
+-	int err;
++	int err = 0;
+ 
+ 	fp = fopen(filename, "r");
+-	err = -errno;
+-	DBG("load System.map: %s: %s\n", filename, strerror(-err));
+-	if (fp == NULL)
++	if (fp == NULL) {
++		err = -errno;
++		DBG("load System.map: %s: %s\n", filename, strerror(-err));
+ 		return err;
+-
++	}
++	DBG("load System.map: %s\n", filename);
+ 	/* eg. c0294200 R __ksymtab_devfs_alloc_devnum */
+ 	while (fgets(line, sizeof(line), fp) != NULL) {
+ 		char *p, *end;
+@@ -2381,7 +2384,7 @@ static int depmod_load_system_map(struct depmod *depmod, const char *filename)
+ 	}
+ 	depmod_add_fake_syms(depmod);
+ 
+-	DBG("loaded System.map: %s: %s\n", filename, strerror(-err));
++	DBG("loaded System.map: %s\n", filename);
+ 
+ 	fclose(fp);
+ 	return err;
+@@ -2673,7 +2676,7 @@ static int do_depmod(int argc, char *argv[])
+ 	} else if (system_map != NULL) {
+ 		err = depmod_load_system_map(&depmod, system_map);
+ 		if (err < 0) {
+-			CRIT("could not load %s: %s\n", module_symvers,
++			CRIT("could not load %s: %s\n", system_map,
+ 			     strerror(-err));
+ 			goto cmdline_failed;
+ 		}
+-- 
+1.7.5.4
+
diff --git a/meta/recipes-kernel/kmod/kmod/depmod-search.conf b/meta/recipes-kernel/kmod/kmod/depmod-search.conf
new file mode 100644
index 0000000..527c0bb
--- /dev/null
+++ b/meta/recipes-kernel/kmod/kmod/depmod-search.conf
@@ -0,0 +1,6 @@
+#
+# /etc/depmod.d/depmod.conf
+#
+
+search updates extramodules built-in
+
diff --git a/meta/recipes-kernel/kmod/kmod_git.bb b/meta/recipes-kernel/kmod/kmod_git.bb
new file mode 100644
index 0000000..eaab47b
--- /dev/null
+++ b/meta/recipes-kernel/kmod/kmod_git.bb
@@ -0,0 +1,62 @@
+# Copyright (C) 2012 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+require kmod.inc
+
+PR = "${INC_PR}.0"
+
+PROVIDES_${PN} += "module-init-tools-insmod-static module-init-tools-depmod module-init-tools"
+RPROVIDES_${PN} += "module-init-tools-insmod-static module-init-tools-depmod module-init-tools"
+CONFLICTS_${PN} += "module-init-tools-insmod-static module-init-tools-depmod module-init-tools"
+
+# autotools set prefix to /usr, however we want them in /bin and /sbin
+bindir = "${base_bindir}"
+sbindir = "${base_sbindir}"
+libdir = "${base_libdir}"
+
+SRC_URI += " \
+            file://depmod-search.conf \
+           "
+
+do_install_append () {
+        install -dm755 ${D}${base_bindir}
+        install -dm755 ${D}${base_sbindir}
+        # add symlinks to kmod
+        ln -s ..${base_bindir}/kmod ${D}${base_bindir}/lsmod.kmod
+        for tool in {ins,rm,dep}mod mod{info,probe}; do
+                ln -s ..${base_bindir}/kmod ${D}${base_sbindir}/${tool}.kmod
+        done
+        # configuration directories
+        install -dm755 ${D}${base_libdir}/depmod.d
+        install -dm755 ${D}${base_libdir}/modprobe.d
+        install -dm755 ${D}${sysconfdir}/depmod.d
+        install -dm755 ${D}${sysconfdir}/modprobe.d
+
+        # install depmod.d file for search/ dir
+        install -Dm644 "${WORKDIR}/depmod-search.conf" "${D}${base_libdir}/depmod.d/search.conf"
+}
+
+pkg_postinst_kmod() {
+        for f in sbin/insmod sbin/modprobe sbin/rmmod sbin/modinfo; do
+                bn=`basename $f`
+                update-alternatives --install /$f $bn /$f.kmod 60
+        done
+        update-alternatives --install /bin/lsmod bin-lsmod /bin/lsmod.kmod 60
+        update-alternatives --install /sbin/lsmod lsmod /bin/lsmod.kmod 60
+        update-alternatives --install /sbin/depmod depmod /sbin/depmod.kmod 60
+}
+
+pkg_prerm_kmod() {
+        for f in sbin/insmod sbin/modprobe sbin/rmmod sbin/modinfo; do
+                bn=`basename $f`
+                update-alternatives --remove $bn /$f.kmod
+        done
+        update-alternatives --remove bin-lsmod /bin/lsmod.kmod
+        update-alternatives --remove lsmod /bin/lsmod.kmod
+        update-alternatives --remove depmod /sbin/depmod.kmod
+}
+
+PACKAGES =+ "libkmod"
+
+FILES_libkmod = "${base_libdir}/libkmod*${SOLIBS}"
+FILES_${PN} += "${base_libdir}/depmod.d ${base_libdir}/modprobe.d"
-- 
1.7.5.4



