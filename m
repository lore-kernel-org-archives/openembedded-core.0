Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SPgn8-0000e4-WB
	for openembedded-core@lists.openembedded.org;
	Wed, 02 May 2012 23:08:55 +0200
Received: by pbbrq2 with SMTP id rq2so1388721pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 May 2012 13:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=9p5pL3w/kZlfPCuuGIipzzXUGEFjTnFn1JgN83laBD4=;
	b=IfOwZDfTENdEAI4t+pnz3NoBSswTS04rzt+GJsPHWOctVCsOYvse0uCVzFdejfi44f
	bqBvwT+sQ3X/Wq7I1XtZmdHL+iMWCOCN4+bnUJsYM81aUkZD1Luy6OOSEh1x/4EUbgAK
	O8zj+AyfnS9M0aK0R7jus7Q5U7+vx4VaU5tslrFPpn6lTk23Cs4hjP18qtNnSLcvwL81
	DM39+OOPCbjFyArVFRaOwrKCEJ29e5i7fMoL7wToDM34/l9yTLbQ7zWrM04CBdA8kNLH
	p7W2HKhIrrDcWqlO13LPvhc0nzj9GlbxXwMsnHYt93ZDcClAy9T65aJKHeiSSaU1nzYn
	TlAA==
Received: by 10.68.221.227 with SMTP id qh3mr952264pbc.43.1335992349609;
	Wed, 02 May 2012 13:59:09 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id vl10sm2960290pbc.37.2012.05.02.13.59.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 May 2012 13:59:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 May 2012 13:58:12 -0700
Message-Id: <907b74f1035fcd569920630c6fc68751cfb8ca14.1335992192.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1335992192.git.raj.khem@gmail.com>
References: <cover.1335992192.git.raj.khem@gmail.com>
Subject: [PATCH 1/3] kmod: Add recipes
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
X-List-Received-Date: Wed, 02 May 2012 21:08:55 -0000

kmod is replacement for module-init-tools

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-kernel/kmod/kmod-native_git.bb      |   14 +++++
 meta/recipes-kernel/kmod/kmod.inc                |   31 +++++++++++
 meta/recipes-kernel/kmod/kmod/depmod-search.conf |    6 ++
 meta/recipes-kernel/kmod/kmod_git.bb             |   62 ++++++++++++++++++++++
 4 files changed, 113 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-kernel/kmod/kmod-native_git.bb
 create mode 100644 meta/recipes-kernel/kmod/kmod.inc
 create mode 100644 meta/recipes-kernel/kmod/kmod/depmod-search.conf
 create mode 100644 meta/recipes-kernel/kmod/kmod_git.bb

diff --git a/meta/recipes-kernel/kmod/kmod-native_git.bb b/meta/recipes-kernel/kmod/kmod-native_git.bb
new file mode 100644
index 0000000..96de8b8
--- /dev/null
+++ b/meta/recipes-kernel/kmod/kmod-native_git.bb
@@ -0,0 +1,14 @@
+# Copyright (C) 2012 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+require kmod.inc
+inherit native
+
+PR = "${INC_PR}.0"
+
+do_install_append (){
+	for tool in depmod insmod lsmod modinfo modprobe rmmod
+	do
+		ln -s kmod ${D}${bindir}/$tool
+	done
+}
diff --git a/meta/recipes-kernel/kmod/kmod.inc b/meta/recipes-kernel/kmod/kmod.inc
new file mode 100644
index 0000000..940a317
--- /dev/null
+++ b/meta/recipes-kernel/kmod/kmod.inc
@@ -0,0 +1,31 @@
+# Copyright (C) 2012 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+DESCRIPTION = "kmod is a set of tools to handle common tasks with Linux kernel modules like \
+               insert, remove, list, check properties, resolve dependencies and aliases."
+HOMEPAGE = "http://packages.profusion.mobi/kmod/"
+LICENSE = "GPL-2.0+ & LGPL-2.1+"
+LICENSE_libkmod = "LGPL-2.1+"
+SECTION = "base"
+PV = "7+git${SRCREV}"
+INC_PR = "r0"
+DEPENDS += "gnome-doc-utils-native"
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
+                    file://libkmod/COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
+                   "
+inherit autotools
+
+SRC_URI = "git://git.profusion.mobi/kmod.git;protocol=git;branch=master \
+           file://depmod-search.conf \
+          "
+
+SRCREV = "02629fa02e96763db7460a930239cc93649a52f8"
+
+S = "${WORKDIR}/git"
+
+EXTRA_AUTORECONF += "--install --symlink"
+EXTRA_OECONF +="--enable-debug --enable-logging --enable-tools"
+
+do_configure_prepend () {
+        gtkdocize --docdir ${S}/libkmod/docs || touch ${S}/libkmod/docs/gtk-doc.make
+}
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
index 0000000..928fa88
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
+# libdir = "${base_libdir}"
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



