Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1Ti693-0001Qh-P9
	for openembedded-core@lists.openembedded.org;
	Mon, 10 Dec 2012 17:24:10 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 10 Dec 2012 08:08:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,252,1355126400"; d="scan'208";a="231728667"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by orsmga001.jf.intel.com with ESMTP; 10 Dec 2012 08:09:20 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Dec 2012 18:09:07 +0200
Message-Id: <5b86bb05d41072383cb1de31946e03f7e90edb31.1355154246.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1355154246.git.laurentiu.palcu@intel.com>
References: <cover.1355154246.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1355154246.git.laurentiu.palcu@intel.com>
References: <cover.1355154246.git.laurentiu.palcu@intel.com>
Subject: [PATCH 2/2] gdk-pixbuf: handle postinstall errors differently
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
X-List-Received-Date: Mon, 10 Dec 2012 16:24:15 -0000

Apparently gdk-pixbuf-query-loaders always returns 0 but writes any
errors to stderr. So, the conditional exit at the end of the command was
useless. Write the errors to a file and exit only if the file size is
greater than 0.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb |   20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb
index 2377d0e..33a43be 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb
@@ -63,12 +63,26 @@ if [ "x$D" != "x" ]; then
 # we trick the gdk-pixbuf-query-loaders into scanning the native shared
 # objects and then we remove the NATIVE_ROOT prefix from the paths in
 # loaders.cache.
-gdk-pixbuf-query-loaders $(find $D/${libdir}/gdk-pixbuf-2.0/${LIBV}/loaders \
-        -name *.so | sed -e "s:$D:$NATIVE_ROOT:g") > \
-        $D/${libdir}/gdk-pixbuf-2.0/${LIBV}/loaders.cache || exit 1
+gdk-pixbuf-query-loaders $(ls -d -1 $D/${libdir}/gdk-pixbuf-2.0/${LIBV}/loaders/*.so |\
+        sed -e "s:$D:$NATIVE_ROOT:g") > \
+        $D/${libdir}/gdk-pixbuf-2.0/${LIBV}/loaders.cache \
+        2>$D/${libdir}/gdk-pixbuf-2.0/${LIBV}/loaders.err
+
+# gdk-pixbuf-query-loaders always returns 0, so we need to check if loaders.err
+# has anything in it
+if [ -s $D/${libdir}/gdk-pixbuf-2.0/${LIBV}/loaders.err ]; then
+	echo "${PN} postinstall scriptlet failed:"
+	cat $D/${libdir}/gdk-pixbuf-2.0/${LIBV}/loaders.err
+	rm $D/${libdir}/gdk-pixbuf-2.0/${LIBV}/loaders.err
+	# we've got errors, postpone postinstall for first boot
+	exit 1
+fi
 
 sed -i -e "s:$NATIVE_ROOT:/:g" $D/${libdir}/gdk-pixbuf-2.0/${LIBV}/loaders.cache
 
+# remove the empty loaders.err
+rm $D/${libdir}/gdk-pixbuf-2.0/${LIBV}/loaders.err
+
 exit 0
 fi
 
-- 
1.7.9.5



