Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QHtTi-0002yt-5w
	for openembedded-core@lists.openembedded.org;
	Thu, 05 May 2011 10:00:06 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 05 May 2011 00:57:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,318,1301900400"; d="scan'208";a="688482725"
Received: from unknown (HELO localhost) ([10.255.13.11])
	by fmsmga002.fm.intel.com with ESMTP; 05 May 2011 00:57:24 -0700
Message-Id: <520699ca87e99a79590057041a454aae8aa2204f.1304581770.git.sgw@linux.intel.com>
In-Reply-To: <cover.1304581769.git.sgw@linux.intel.com>
References: <cover.1304581769.git.sgw@linux.intel.com>
Old-Date: Wed, 4 May 2011 10:36:19 -0700
Date: Thu, 05 May 2011  0:57:24 -0700
To: openembedded-core@lists.openembedded.org,bruce.ashfield@windriver.com
From: Saul Wold <sgw@linux.intel.com>
Cc: Kyle McMartin <kyle@redhat.com>, Greg Kroah-Hartman <gregkh@suse.de>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	Kang Kai <kai.kang@windriver.com>, Thomas Meyer <thomas@m3y3r.de>
Subject: [PATCH 18/26] gypsy_0.8.bb: Fix build with gcc 4.6
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
X-List-Received-Date: Thu, 05 May 2011 08:00:07 -0000

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../fix-unused-but-set-variable-warning.patch      |   16 ++++++++++++++++
 meta/recipes-connectivity/gypsy/gypsy_0.8.bb       |    7 ++++---
 2 files changed, 20 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-connectivity/gypsy/files/fix-unused-but-set-variable-warning.patch

diff --git a/meta/recipes-connectivity/gypsy/files/fix-unused-but-set-variable-warning.patch b/meta/recipes-connectivity/gypsy/files/fix-unused-but-set-variable-warning.patch
new file mode 100644
index 0000000..d826970
--- /dev/null
+++ b/meta/recipes-connectivity/gypsy/files/fix-unused-but-set-variable-warning.patch
@@ -0,0 +1,16 @@
+Index: gypsy-0.8/gypsy/gypsy-time.c
+===================================================================
+--- gypsy-0.8.orig/gypsy/gypsy-time.c
++++ gypsy-0.8/gypsy/gypsy-time.c
+@@ -156,10 +156,10 @@ get_property (GObject    *object,
+ 	      GParamSpec *pspec)
+ {
+ 	GypsyTimePrivate *priv;
+-
+ 	priv = GET_PRIVATE (object);
+ 	switch (prop_id) {
+ 	case PROP_PATH:
++		g_value_set_string (value, priv->object_path);
+ 		break;
+ 
+ 	default:
diff --git a/meta/recipes-connectivity/gypsy/gypsy_0.8.bb b/meta/recipes-connectivity/gypsy/gypsy_0.8.bb
index ab7f6b0..f3d3fa7 100644
--- a/meta/recipes-connectivity/gypsy/gypsy_0.8.bb
+++ b/meta/recipes-connectivity/gypsy/gypsy_0.8.bb
@@ -13,9 +13,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
 SECTION = "x11"
 DEPENDS = "glib-2.0 dbus bluez4 dbus-glib libxslt"
 
-SRC_URI = "http://gypsy.freedesktop.org/releases/gypsy-${PV}.tar.gz" 
-
-PR = "r0"
+SRC_URI = "http://gypsy.freedesktop.org/releases/gypsy-${PV}.tar.gz \
+           file://fix-unused-but-set-variable-warning.patch \
+          "
+PR = "r1"
 
 inherit autotools pkgconfig
 
-- 
1.7.1.1



