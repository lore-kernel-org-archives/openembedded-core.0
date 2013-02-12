Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1U5Iix-0000zN-Nk
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Feb 2013 17:28:56 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 12 Feb 2013 08:11:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,650,1355126400"; d="scan'208";a="284742005"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by orsmga002.jf.intel.com with ESMTP; 12 Feb 2013 08:12:50 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Feb 2013 18:12:36 +0200
Message-Id: <f26bc1602de9c71650ad52d087fb6702ef8fb4f5.1360684306.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1360684306.git.laurentiu.palcu@intel.com>
References: <cover.1360684306.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1360684306.git.laurentiu.palcu@intel.com>
References: <cover.1360684306.git.laurentiu.palcu@intel.com>
Subject: [PATCH 01/11] Add separate directory for postinstall intercepts
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Feb 2013 16:29:35 -0000
X-List-Received-Date: Tue, 12 Feb 2013 16:29:35 -0000

The scripts/postinst-intercepts will contain all postinstall hooks that
we need to run after all packages have been installed.

If one wants to install such a postinst hook, all it needs to do is put
the hook in this directory and, from the package postinstall scriptlet,
call:
	postinst_intercept <hook_name> <package_name> <var1=...> ...

This will, practically, add the package_name in the list of packages
that need the hook to run and, also, set any variables that would be
needed in the hook. For example, variables like ${libdir}, ${bindir},
etc. that might depend on distribution can be passed on to the script in
this way.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 scripts/postinst-intercepts/postinst_intercept  |   37 +++++++++++++++++++++++
 scripts/postinst-intercepts/update_font_cache   |    7 +++++
 scripts/postinst-intercepts/update_icon_cache   |   12 ++++++++
 scripts/postinst-intercepts/update_pixbuf_cache |   10 ++++++
 4 files changed, 66 insertions(+)
 create mode 100755 scripts/postinst-intercepts/postinst_intercept
 create mode 100644 scripts/postinst-intercepts/update_font_cache
 create mode 100644 scripts/postinst-intercepts/update_icon_cache
 create mode 100644 scripts/postinst-intercepts/update_pixbuf_cache

diff --git a/scripts/postinst-intercepts/postinst_intercept b/scripts/postinst-intercepts/postinst_intercept
new file mode 100755
index 0000000..ed32f27
--- /dev/null
+++ b/scripts/postinst-intercepts/postinst_intercept
@@ -0,0 +1,37 @@
+#!/bin/sh
+#
+# This script is called from inside postinstall scriptlets at do_rootfs time. It
+# actually adds, at the end, the list of packages for which the intercept script
+# is valid. Also, if one wants to pass any variables to the intercept script from
+# the postinstall itself, they will be added immediately after the shebang line.
+#
+# Usage: postinst_intercept <intercept_script_name> <package_name> <var1=...> ... <varN=...>
+#  * intercept_script_name - the name of the intercept script we want to change;
+#  * package_name - add the package_name to list of packages the intercept script
+#                   is used for;
+#  * var1=... - var1 will have the value we provide in the intercept script. This
+#               is useful when we want to pass on variables like ${libdir} to
+#               the intercept script;
+#
+[ $# -lt 2 ] && exit 1
+
+intercept_script=$INTERCEPT_DIR/$1 && shift
+package_name=$1 && shift
+
+[ -f "$intercept_script" ] || exit 1
+
+chmod +x "$intercept_script"
+
+pkgs_line="$(cat $intercept_script|grep "##PKGS:")"
+if [ -n "$pkgs_line" ]; then
+	# line exists, add this package to the list only if it's not already there
+	if [ -z "$(echo "$pkgs_line" | grep " $package_name ")" ]; then
+		sed -i -e "s/##PKGS:.*/\0${package_name} /" $intercept_script
+	fi
+else
+	for var in $@; do
+		sed -i -e "\%^#\!/bin/.*sh%a $var" $intercept_script
+	done
+	echo "##PKGS: ${package_name} " >> $intercept_script
+fi
+
diff --git a/scripts/postinst-intercepts/update_font_cache b/scripts/postinst-intercepts/update_font_cache
new file mode 100644
index 0000000..562b5b3
--- /dev/null
+++ b/scripts/postinst-intercepts/update_font_cache
@@ -0,0 +1,7 @@
+#!/bin/sh
+
+PSEUDO_UNLOAD=1 qemuwrapper $D$(readelf -l $D${bindir}/fc-cache| grep "Requesting program interpreter"|sed -e 's/^.*\[.*: \(.*\)\]/\1/') \
+        --library-path $D/lib:$D/usr/lib $D${bindir}/fc-cache \
+        --sysroot=$D >/dev/null 2>&1
+
+
diff --git a/scripts/postinst-intercepts/update_icon_cache b/scripts/postinst-intercepts/update_icon_cache
new file mode 100644
index 0000000..8e17a6a
--- /dev/null
+++ b/scripts/postinst-intercepts/update_icon_cache
@@ -0,0 +1,12 @@
+#!/bin/sh
+
+set -e
+# update native pixbuf loaders
+gdk-pixbuf-query-loaders --update-cache
+
+for icondir in $D/usr/share/icons/*/ ; do
+    if [ -d $icondir ] ; then
+        gtk-update-icon-cache -fqt  $icondir
+    fi
+done
+
diff --git a/scripts/postinst-intercepts/update_pixbuf_cache b/scripts/postinst-intercepts/update_pixbuf_cache
new file mode 100644
index 0000000..64033dc
--- /dev/null
+++ b/scripts/postinst-intercepts/update_pixbuf_cache
@@ -0,0 +1,10 @@
+#!/bin/sh
+
+export GDK_PIXBUF_MODULEDIR=$D${libdir}/gdk-pixbuf-2.0/2.10.0/loaders
+
+PSEUDO_UNLOAD=1 qemuwrapper $D$(readelf -l $D${bindir}/gdk-pixbuf-query-loaders|grep "Requesting program interpreter"|sed -e 's/^.*\[.*: \(.*\)\]/\1/') \
+    --library-path $D/lib:$D/usr/lib $D${bindir}/gdk-pixbuf-query-loaders \
+    >$GDK_PIXBUF_MODULEDIR/../loaders.cache 2>/dev/null && \
+    sed -i -e "s:$D::g" $GDK_PIXBUF_MODULEDIR/../loaders.cache
+
+
-- 
1.7.9.5



