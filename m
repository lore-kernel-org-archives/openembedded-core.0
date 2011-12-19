Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RchMp-0001gc-Gr
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Dec 2011 18:51:15 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 19 Dec 2011 09:44:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="89158329"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.37])
	by orsmga002.jf.intel.com with ESMTP; 19 Dec 2011 09:44:08 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Dec 2011 17:43:22 +0000
Message-Id: <213394d20dfff3710de9e9c8953a85303a226c9b.1324316137.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1324316137.git.paul.eggleton@linux.intel.com>
References: <cover.1324316137.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1324316137.git.paul.eggleton@linux.intel.com>
References: <cover.1324316137.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/2] scripts/contrib: add a script to create a psplash image header
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
X-List-Received-Date: Mon, 19 Dec 2011 17:51:15 -0000

Adds a convenience script for converting an image file to a header
suitable for use in psplash, as well as a comment pointing to the
script in the default OpenEmbedded psplash image header.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-core/psplash/files/psplash-img.h |    5 ++++-
 scripts/contrib/make-psplash-img-header.sh    |   22 ++++++++++++++++++++++
 2 files changed, 26 insertions(+), 1 deletions(-)
 create mode 100755 scripts/contrib/make-psplash-img-header.sh

diff --git a/meta/recipes-core/psplash/files/psplash-img.h b/meta/recipes-core/psplash/files/psplash-img.h
index 1c85a72..9530131 100644
--- a/meta/recipes-core/psplash/files/psplash-img.h
+++ b/meta/recipes-core/psplash/files/psplash-img.h
@@ -1,4 +1,7 @@
-/* OpenEmbedded logo image for psplash */
+/* OpenEmbedded logo image for psplash
+ *
+ * Created using scripts/contrib/make-psplash-img-header.sh
+ */
 
 /* GdkPixbuf RGBA C-Source image dump 1-byte-run-length-encoded */
 
diff --git a/scripts/contrib/make-psplash-img-header.sh b/scripts/contrib/make-psplash-img-header.sh
new file mode 100755
index 0000000..23a825d
--- /dev/null
+++ b/scripts/contrib/make-psplash-img-header.sh
@@ -0,0 +1,22 @@
+#!/bin/sh
+# Creates a header file from an image suitable for building into psplash
+# Derived from make-image-header.sh from the psplash project
+
+if [ "$1" = "" ] || [ ! -f $1 ] ; then
+	echo "Please specify an input image"
+	exit 1
+fi
+
+res=`which gdk-pixbuf-csource 2>/dev/null`
+if [ $? -ne 0 ] ; then
+	echo "Please install gdk-pixbuf-csource (e.g. libgdk-pixbuf2.0-dev package on Ubuntu/Debian)"
+	exit 1
+fi
+
+imageh="psplash-img.h"
+name="POKY_IMG"
+echo "Writing psplash image header to $imageh"
+gdk-pixbuf-csource --macros $1 > $imageh.tmp
+sed -e "s/MY_PIXBUF/${name}/g" -e "s/guint8/uint8/g" $imageh.tmp > $imageh && rm $imageh.tmp
+
+
-- 
1.7.5.4



