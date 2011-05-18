Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QMc01-0000hY-Ko
	for openembedded-core@lists.openembedded.org;
	Wed, 18 May 2011 10:20:58 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 18 May 2011 01:18:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,230,1304319600"; 
   d="scan'208";a="228940"
Received: from unknown (HELO localhost) ([10.255.12.160])
	by orsmga001.jf.intel.com with ESMTP; 18 May 2011 01:18:01 -0700
Message-Id: <062db52f6eeb7a91033033a85915b4bf701b328e.1305702436.git.sgw@linux.intel.com>
In-Reply-To: <cover.1305702436.git.sgw@linux.intel.com>
References: <cover.1305702436.git.sgw@linux.intel.com>
Old-Date: Tue, 17 May 2011 23:11:58 -0700
Date: Wed, 18 May 2011  1:18:01 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Robert Yang <liezhi.yang@windriver.com>
Subject: [PATCH 15/15] gst-openmax: Add patch for GCC 4.6.0
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
X-List-Received-Date: Wed, 18 May 2011 08:20:58 -0000

From: Saul Wold <sgw@linux.intel.com>

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../gstreamer/gst-openmax/gcc_4.6.patch            |   18 ++++++++++++++++++
 .../gstreamer/gst-openmax_0.10.1.bb                |    6 ++++--
 2 files changed, 22 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-openmax/gcc_4.6.patch

diff --git a/meta/recipes-multimedia/gstreamer/gst-openmax/gcc_4.6.patch b/meta/recipes-multimedia/gstreamer/gst-openmax/gcc_4.6.patch
new file mode 100644
index 0000000..57a63b5
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gst-openmax/gcc_4.6.patch
@@ -0,0 +1,18 @@
+Upstream-Status: Pending
+
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
+
+Index: gst-openmax-0.10.1/omx/gstomx.c
+===================================================================
+--- gst-openmax-0.10.1.orig/omx/gstomx.c	2010-09-30 18:00:24.000000000 -0700
++++ gst-openmax-0.10.1/omx/gstomx.c	2011-05-17 23:08:08.794535872 -0700
+@@ -238,7 +238,8 @@
+     const gchar *element_name = gst_structure_nth_field_name (element_table, i);
+     GstStructure *element = get_element_entry (element_name);
+     const gchar *type_name, *parent_type_name;
+-    const gchar *component_name, *component_role, *library_name;
++    const gchar *component_name, *library_name;
++    const gchar __attribute__((__unused__)) *component_role;
+     GType type;
+     gint rank;
+ 
diff --git a/meta/recipes-multimedia/gstreamer/gst-openmax_0.10.1.bb b/meta/recipes-multimedia/gstreamer/gst-openmax_0.10.1.bb
index 5eb7e42..776ed1c 100644
--- a/meta/recipes-multimedia/gstreamer/gst-openmax_0.10.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-openmax_0.10.1.bb
@@ -4,13 +4,15 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24 \
                     file://util/sem.h;beginline=1;endline=20;md5=accce5550d5583b839b441a0623f09fc"
 
-SRC_URI = "http://gstreamer.freedesktop.org/src/gst-openmax/gst-openmax-${PV}.tar.bz2"
+SRC_URI = "http://gstreamer.freedesktop.org/src/gst-openmax/gst-openmax-${PV}.tar.bz2 \
+           file://gcc_4.6.patch \
+           "
 
 inherit autotools
 
 EXTRA_OECONF += "--disable-valgrind"
 
-PR = "r1"
+PR = "r2"
 
 FILES_${PN} += "${libdir}/gstreamer-0.10/libgstomx.so"
 FILES_${PN}-dev += "${libdir}/gstreamer-0.10/libgstomx.*a"
-- 
1.7.3.4



