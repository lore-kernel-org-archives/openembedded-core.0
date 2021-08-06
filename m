Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web08.2725.1628242213509794889
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Aug 2021 02:30:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: qi.chen@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 1769UBZ2015075
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Fri, 6 Aug 2021 02:30:12 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 6 Aug 2021 02:30:11 -0700
Received: from ala-lpggp7.wrs.com (147.11.105.171) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Fri, 6 Aug 2021 02:30:11 -0700
From: "Chen Qi" <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH] meta: use new override syntax in comments
Date: Fri, 6 Aug 2021 02:30:11 -0700
Message-ID: <20210806093011.100737-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/conf/bitbake.conf                           | 4 ++--
 meta/conf/machine/qemuppc64.conf                 | 4 ++--
 meta/recipes-core/dbus/dbus-glib_0.112.bb        | 2 +-
 meta/recipes-devtools/elfutils/elfutils_0.185.bb | 2 +-
 meta/recipes-devtools/qemu/qemu.inc              | 2 +-
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 1d5f5b7fcd..e5b31d0b8b 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -236,8 +236,8 @@ DESCRIPTION ?= "${SUMMARY}."
 # The following two are commented out because they result in a recursive
 # definition of the variable in some corner cases.  These are left in
 # to illustrate the intended behavior.
-#SUMMARY_${PN} ?= "${SUMMARY}"
-#DESCRIPTION_${PN} ?= "${DESCRIPTION}"
+#SUMMARY:${PN} ?= "${SUMMARY}"
+#DESCRIPTION:${PN} ?= "${DESCRIPTION}"
 
 SUMMARY:${PN}-src ?= "${SUMMARY} - Source files"
 DESCRIPTION:${PN}-src ?= "${DESCRIPTION}  \
diff --git a/meta/conf/machine/qemuppc64.conf b/meta/conf/machine/qemuppc64.conf
index 0682e752be..a5270e98ed 100644
--- a/meta/conf/machine/qemuppc64.conf
+++ b/meta/conf/machine/qemuppc64.conf
@@ -18,7 +18,7 @@ QB_KERNEL_CMDLINE_APPEND = "console=hvc0"
 QB_OPT_APPEND = "-usb -device usb-tablet"
 
 #prelink broken on ppc64
-#USER_CLASSES_remove = "image-prelink"
-#IMAGE_PREPROCESS_COMMAND_remove = "prelink_image;"
+#USER_CLASSES:remove = "image-prelink"
+#IMAGE_PREPROCESS_COMMAND:remove = "prelink_image;"
 
 MACHINE_EXTRA_RRECOMMENDS += " kernel-modules"
diff --git a/meta/recipes-core/dbus/dbus-glib_0.112.bb b/meta/recipes-core/dbus/dbus-glib_0.112.bb
index a03b2addfd..99b0a20004 100644
--- a/meta/recipes-core/dbus/dbus-glib_0.112.bb
+++ b/meta/recipes-core/dbus/dbus-glib_0.112.bb
@@ -20,7 +20,7 @@ SRC_URI[sha256sum] = "7d550dccdfcd286e33895501829ed971eeb65c614e73aadb4a08aeef71
 inherit autotools pkgconfig gettext bash-completion gtk-doc
 
 #default disable regression tests, some unit test code in non testing code
-#PACKAGECONFIG_pn-${PN} = "tests" enable regression tests local.conf
+#PACKAGECONFIG:pn-${PN} = "tests" enable regression tests local.conf
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[tests] = "--enable-tests,,,"
 
diff --git a/meta/recipes-devtools/elfutils/elfutils_0.185.bb b/meta/recipes-devtools/elfutils/elfutils_0.185.bb
index 5031ab97e7..7a88c5259f 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.185.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.185.bb
@@ -127,7 +127,7 @@ FILES:libdw  = "${libdir}/libdw-${PV}.so ${libdir}/libdw.so.* ${libdir}/elfutils
 FILES:libdebuginfod = "${libdir}/libdebuginfod-${PV}.so ${libdir}/libdebuginfod.so.*"
 # Some packages have the version preceeding the .so instead properly
 # versioned .so.<version>, so we need to reorder and repackage.
-#FILES_${PN} += "${libdir}/*-${PV}.so ${base_libdir}/*-${PV}.so"
+#FILES:${PN} += "${libdir}/*-${PV}.so ${base_libdir}/*-${PV}.so"
 #FILES_SOLIBSDEV = "${libdir}/libasm.so ${libdir}/libdw.so ${libdir}/libelf.so"
 
 # The package contains symlinks that trip up insane
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 4de8a9098b..0bbc4b1187 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -110,7 +110,7 @@ export LIBTOOL="${HOST_SYS}-libtool"
 
 B = "${WORKDIR}/build"
 
-#EXTRA_OECONF_append = " --python=${HOSTTOOLS_DIR}/python3"
+#EXTRA_OECONF:append = " --python=${HOSTTOOLS_DIR}/python3"
 
 do_configure:prepend:class-native() {
 	# Append build host pkg-config paths for native target since the host may provide sdl
-- 
2.30.2

