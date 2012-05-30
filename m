Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1SZf0q-0001E7-RU
	for openembedded-core@lists.openembedded.org;
	Wed, 30 May 2012 11:16:17 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 30 May 2012 02:05:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="146136464"
Received: from yocto-build3.sh.intel.com ([10.239.48.5])
	by orsmga001.jf.intel.com with ESMTP; 30 May 2012 02:05:38 -0700
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 May 2012 17:08:28 +0800
Message-Id: <2255c64e0eb4a2b5b7f063dbc5ff421e606458c8.1338368508.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1338368508.git.edwin.zhai@intel.com>
References: <cover.1338368508.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1338368508.git.edwin.zhai@intel.com>
References: <cover.1338368508.git.edwin.zhai@intel.com>
Subject: [PATCH 1/1] webkit-gtk: Use glib as unicode backend to avoid browser crash
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
X-List-Received-Date: Wed, 30 May 2012 09:16:17 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

webkit-gtk depends on ICU for the unicode, but ICU is not safe when build and
target system owns different endian. ICU's community is not responsive to make
a patch for this, so glib is used as work around here.

[YOCTO #1570] got fixed

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 meta/recipes-sato/webkit/webkit-gtk_svn.bb |   10 +++++++++-
 1 files changed, 9 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-sato/webkit/webkit-gtk_svn.bb b/meta/recipes-sato/webkit/webkit-gtk_svn.bb
index 7db573d..9381486 100644
--- a/meta/recipes-sato/webkit/webkit-gtk_svn.bb
+++ b/meta/recipes-sato/webkit/webkit-gtk_svn.bb
@@ -10,12 +10,13 @@ LIC_FILES_CHKSUM = "file://Source/WebCore/rendering/RenderApplet.h;endline=22;md
 DEPENDS = "zlib enchant gnome-keyring libsoup-2.4 curl icu libxml2 cairo libxslt libxt libidn gnutls gtk+ gstreamer gst-plugins-base flex-native gperf-native perl-native-runtime sqlite3"
 DEPENDS += " ${@base_contains('DISTRO_FEATURES', 'opengl', 'virtual/libgl', '', d)}"
 DEPENDS_darwin8 = "curl icu libxml2 cairo libxslt libidn gnutls gtk+ gstreamer flex-native gperf-native perl-native-runtime sqlite3"
+DEPENDS_append_qemuppc += "pango"
 
 SRCREV_FORMAT = "source"
 
 SRCREV = "101488"
 PV = "1.7.2+svnr${SRCPV}"
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "\
   svn://svn.webkit.org/repository/webkit/trunk/;module=Source;proto=http;name=source \
@@ -47,6 +48,13 @@ EXTRA_OECONF = "\
                 UNICODE_CFLAGS=-D_REENTRANT \
                "
 
+#default unicode backend icu breaks in cross-compile when target and host owns different endian type
+EXTRA_OECONF_append_qemuppc += "--with-unicode-backend=glib"
+
+CPPFLAGS_append_qemuppc += "-I${STAGING_INCDIR}/pango-1.0 \
+                            -I${STAGING_LIBDIR}/glib-2.0/include \
+                            -I${STAGING_INCDIR}/glib-2.0"
+
 EXTRA_AUTORECONF = " -I Source/autotools "
 
 
-- 
1.7.1



