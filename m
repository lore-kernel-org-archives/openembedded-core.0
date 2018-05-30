Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0A76674C39
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2018 04:27:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w4U4RGNT003103
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 29 May 2018 21:27:16 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Tue, 29 May 2018 21:27:15 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 30 May 2018 12:27:13 +0800
Message-ID: <1527654433-263632-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] qemuwrapper-cross: fix postinst failed warning
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
X-List-Received-Date: Wed, 30 May 2018 04:27:20 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

1. some binary like udev-hwdb/pixbufcache/gio-module-cache/fontcache
uses qemu usermode by default,  but some architecture such as Intel
skylake does not support qemu usermode, this can lead to a build warning as below:
warning: %post(udev-hwdb-1:234-r0.skylake_64) scriptlet failed, exit status
"WARNING: The postinstall intercept hook 'update_pixbufcache' failed".
"WARNING: The postinstall intercept hook 'update_gio_module_cache' failed".
"WARNING: The postinstall intercept hook 'update_font_cache' failed".

Add judgement of qemu usermode in qemuwrapper-cross, when qemu usermode is
not supported, qemuwrapper exit 1 directly.

2. font is not arch related, but receipe like liberation-fonts inherit fontcache,
fontcache called update_font_cache, update_font_cache use qemuwrapper,
qemuwrapper is arch related, so update_font_cache will core dumped as below:

WARNING: The postinstall intercept hook 'update_font_cache' failed,
NOTE: Exit code 132. Output:
qemu: uncaught target signal 4 (Illegal instruction) - core dumped
qemuwrapper: line 5: 267705 Illegal instruction     (core dumped) qemu-x86_64 -r 3.2.0 -cpu core2duo "$@"

in update_font_cache, it runs:
qemuwrapper -L $D -E LD_LIBRARY_PATH=$D/${libdir}:$D/${base_libdir} -E ${fontconfigcacheenv} $D${bindir}/fc-cache --sysroot=$D --system-only

qemuwrapper sets LD_LIBRARY_PATH=$D/${libdir}:$D/${base_libdir} for fc-cache,
since fontcache inherit allarch, ${base_libdir} is "/lib", ${libdir} is "/usr/lib",
but in this case, fc-cache need /lib64 and /usr/lib64 to run,
So fc-cache doesn't work, and caused the warning.

so set the default arch related library path in qemuwrapper, not set in the update_font_cache,
if binary have extra library path,  it can still pass "-E LD_LIBRARY_PATH=", qemuwrapper will
append the default library path after it.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/classes/gobject-introspection.bbclass         |  2 +-
 meta/classes/qemu.bbclass                          |  6 +--
 .../qemu/files/qemuwrapperhelper.py                | 27 ++++++++++++
 .../recipes-devtools/qemu/qemuwrapper-cross_1.0.bb | 49 ++++++++++++++--------
 scripts/postinst-intercepts/update_font_cache      |  3 +-
 .../postinst-intercepts/update_gio_module_cache    |  3 +-
 scripts/postinst-intercepts/update_pixbuf_cache    |  3 +-
 7 files changed, 63 insertions(+), 30 deletions(-)
 create mode 100644 meta/recipes-devtools/qemu/files/qemuwrapperhelper.py

diff --git a/meta/classes/gobject-introspection.bbclass b/meta/classes/gobject-introspection.bbclass
index b6160b8..e4b510e 100644
--- a/meta/classes/gobject-introspection.bbclass
+++ b/meta/classes/gobject-introspection.bbclass
@@ -17,7 +17,7 @@ UNKNOWN_CONFIGURE_WHITELIST_append = " --enable-introspection --disable-introspe
 
 # Generating introspection data depends on a combination of native and target
 # introspection tools, and qemu to run the target tools.
-DEPENDS_append_class-target = " gobject-introspection gobject-introspection-native qemu-native prelink-native"
+DEPENDS_append_class-target = " gobject-introspection gobject-introspection-native qemu-native prelink-native qemuwrapper-cross"
 
 # Even though introspection is disabled on -native, gobject-introspection package is still
 # needed for m4 macros.
diff --git a/meta/classes/qemu.bbclass b/meta/classes/qemu.bbclass
index f5c5780..372d087 100644
--- a/meta/classes/qemu.bbclass
+++ b/meta/classes/qemu.bbclass
@@ -22,13 +22,9 @@ def qemu_target_binary(data):
 def qemu_wrapper_cmdline(data, rootfs_path, library_paths):
     import string
 
-    qemu_binary = qemu_target_binary(data)
-    if qemu_binary == "qemu-allarch":
-        qemu_binary = "qemuwrapper"
-
     qemu_options = data.getVar("QEMU_OPTIONS")    
 
-    return "PSEUDO_UNLOAD=1 " + qemu_binary + " " + qemu_options + " -L " + rootfs_path\
+    return "PSEUDO_UNLOAD=1 " + "qemuwrapper" + " " + qemu_options + " -L " + rootfs_path\
             + " -E LD_LIBRARY_PATH=" + ":".join(library_paths) + " "
 
 # Next function will return a string containing the command that is needed to
diff --git a/meta/recipes-devtools/qemu/files/qemuwrapperhelper.py b/meta/recipes-devtools/qemu/files/qemuwrapperhelper.py
new file mode 100644
index 0000000..967f5fd
--- /dev/null
+++ b/meta/recipes-devtools/qemu/files/qemuwrapperhelper.py
@@ -0,0 +1,27 @@
+import sys
+
+def qemu_get_parameters():
+    flag = 0
+    parameters=""
+
+    for i in sys.argv[1:-1]:
+        if "LD_LIBRARY_PATH=" in i:
+            flag = 1
+
+    if flag == 0:
+        for index, i in enumerate(sys.argv[1:-1]):
+            if sys.argv[index-1] == '-L':
+                parameters = parameters + "-E LD_LIBRARY_PATH=" + sys.argv[-1] + " " + i + " "
+            else:
+                parameters = parameters + i + " "
+    else:
+        for i in sys.argv[1:-1]:
+            if "LD_LIBRARY_PATH=" in i:
+                parameters = parameters + i + ":" + sys.argv[-1] + " "
+            else:
+                parameters = parameters + i + " "
+
+    print parameters
+
+if __name__ == '__main__':
+    qemu_get_parameters()
diff --git a/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb b/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb
index c983fba..3574286 100644
--- a/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb
+++ b/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb
@@ -1,6 +1,9 @@
 SUMMARY = "QEMU wrapper script"
 HOMEPAGE = "http://qemu.org"
 LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+SRC_URI = "file://qemuwrapperhelper.py" 
 
 S = "${WORKDIR}"
 
@@ -12,37 +15,47 @@ do_populate_sysroot[depends] = ""
 
 do_install () {
 	install -d ${D}${bindir_crossscripts}/
+	install qemuwrapperhelper.py ${D}${bindir_crossscripts}/
 
 	echo "#!/bin/sh" > ${D}${bindir_crossscripts}/qemuwrapper
-	qemu_binary=${@qemu_target_binary(d)}
-	qemu_options='${QEMU_OPTIONS}'
-	echo "$qemu_binary $qemu_options \"\$@\"" >> ${D}${bindir_crossscripts}/qemuwrapper
-	fallback_qemu_bin=
-	case $qemu_binary in
-		"qemu-i386")
-			fallback_qemu_bin=qemu-x86_64
-			;;
-		"qemu-x86_64")
-			fallback_qemu_bin=qemu-i386
-			;;
-		*)
-			;;
-	esac
-
-	if [ -n "$fallback_qemu_bin" ]; then
+
+        if ${@bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', 'true','false', d)}; then
+		qemu_binary=${@qemu_target_binary(d)}
+		qemu_options='${QEMU_OPTIONS}'
+		default_library_option='$D/${libdir}:$D/${base_libdir}'
+
+		echo "default_library_option=$default_library_option" >> ${D}${bindir_crossscripts}/qemuwrapper
+		echo "qemu_parameters=\`python ${D}${bindir_crossscripts}/qemuwrapperhelper.py \"\$@\" \$default_library_option \`" >> ${D}${bindir_crossscripts}/qemuwrapper
+		echo "$qemu_binary $qemu_options \$qemu_parameters" >> ${D}${bindir_crossscripts}/qemuwrapper
+		fallback_qemu_bin=
+		case $qemu_binary in
+			"qemu-i386")
+				fallback_qemu_bin=qemu-x86_64
+				;;
+			"qemu-x86_64")
+				fallback_qemu_bin=qemu-i386
+				;;
+			*)
+				;;
+		esac
+
+		if [ -n "$fallback_qemu_bin" ]; then
 
 		cat >> ${D}${bindir_crossscripts}/qemuwrapper << EOF
 rc=\$?
 if [ \$rc = 255 ]; then
-	$fallback_qemu_bin "\$@"
+	$fallback_qemu_bin \$qemu_parameters
 	rc=\$?
 fi
 exit \$rc
 EOF
-
+		fi
+	else
+		echo "exit 1" >>  ${D}${bindir_crossscripts}/qemuwrapper
 	fi
 
 	chmod +x ${D}${bindir_crossscripts}/qemuwrapper
+	chmod +x ${D}${bindir_crossscripts}/qemuwrapperhelper.py
 }
 
 SYSROOT_DIRS += "${bindir_crossscripts}"
diff --git a/scripts/postinst-intercepts/update_font_cache b/scripts/postinst-intercepts/update_font_cache
index bf65e19..e797c65 100644
--- a/scripts/postinst-intercepts/update_font_cache
+++ b/scripts/postinst-intercepts/update_font_cache
@@ -2,6 +2,5 @@
 
 set -e
 
-PSEUDO_UNLOAD=1 qemuwrapper -L $D -E LD_LIBRARY_PATH=$D/${libdir}:$D/${base_libdir} \
-					-E ${fontconfigcacheenv} $D${bindir}/fc-cache --sysroot=$D --system-only ${fontconfigcacheparams}
+PSEUDO_UNLOAD=1 qemuwrapper -L $D -E ${fontconfigcacheenv} $D${bindir}/fc-cache --sysroot=$D --system-only ${fontconfigcacheparams}
 chown -R root:root $D${fontconfigcachedir}
diff --git a/scripts/postinst-intercepts/update_gio_module_cache b/scripts/postinst-intercepts/update_gio_module_cache
index fc3f9d0..7ad9c5a 100644
--- a/scripts/postinst-intercepts/update_gio_module_cache
+++ b/scripts/postinst-intercepts/update_gio_module_cache
@@ -2,8 +2,7 @@
 
 set -e
 
-PSEUDO_UNLOAD=1 qemuwrapper -L $D -E LD_LIBRARY_PATH=$D${libdir}:$D${base_libdir} \
-	$D${libexecdir}/${binprefix}gio-querymodules $D${libdir}/gio/modules/
+PSEUDO_UNLOAD=1 qemuwrapper -L $D $D${libexecdir}/${binprefix}gio-querymodules $D${libdir}/gio/modules/
 
 [ ! -e $D${libdir}/gio/modules/giomodule.cache ] ||
 	chown root:root $D${libdir}/gio/modules/giomodule.cache
diff --git a/scripts/postinst-intercepts/update_pixbuf_cache b/scripts/postinst-intercepts/update_pixbuf_cache
index 5d44075..efb56fa 100644
--- a/scripts/postinst-intercepts/update_pixbuf_cache
+++ b/scripts/postinst-intercepts/update_pixbuf_cache
@@ -5,7 +5,6 @@ set -e
 export GDK_PIXBUF_MODULEDIR=$D${libdir}/gdk-pixbuf-2.0/2.10.0/loaders
 export GDK_PIXBUF_FATAL_LOADER=1
 
-PSEUDO_UNLOAD=1 qemuwrapper -L $D -E LD_LIBRARY_PATH=$D/${libdir}:$D/${base_libdir}\
-    $D${libdir}/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders \
+PSEUDO_UNLOAD=1 qemuwrapper -L $D $D${libdir}/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders \
     >$GDK_PIXBUF_MODULEDIR/../loaders.cache && \
     sed -i -e "s:$D::g" $GDK_PIXBUF_MODULEDIR/../loaders.cache
-- 
2.7.4


