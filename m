Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RvJQb-0001yc-0l
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Feb 2012 03:08:05 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 08 Feb 2012 17:59:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="104740500"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.14.207])
	by azsmga001.ch.intel.com with ESMTP; 08 Feb 2012 17:59:58 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Feb 2012 17:59:53 -0800
Message-Id: <572b10ac20dcd821cd517074492b3f7545643003.1328752455.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1328750092.git.josh@linux.intel.com>
References: <cover.1328750092.git.josh@linux.intel.com>
In-Reply-To: <cover.1328752455.git.josh@linux.intel.com>
References: <cover.1328752455.git.josh@linux.intel.com>
Subject: [PATCH 3/5] mx: ensure gettext and dbus are present
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
X-List-Received-Date: Thu, 09 Feb 2012 02:08:05 -0000

Upstream informs me that D-bus isn't really optional as it's required
to make some of the API work such as the single instance MxApplication.
Therefore ensure we're building with it enabled.

Gettext macros are used in the configure.ac so inherit gettext to
ensure the required dependencies are present.

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 meta/recipes-graphics/mx/mx_1.4.2.bb |    8 +++++---
 1 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/mx/mx_1.4.2.bb b/meta/recipes-graphics/mx/mx_1.4.2.bb
index 91eca29..c50bc0f 100644
--- a/meta/recipes-graphics/mx/mx_1.4.2.bb
+++ b/meta/recipes-graphics/mx/mx_1.4.2.bb
@@ -1,9 +1,11 @@
 DESCRIPTION = "Clutter based widget library"
 LICENSE = "LGPLv2.1"
 
-DEPENDS = "clutter-1.8"
+PR = "r1"
 
-inherit autotools
+DEPENDS = "clutter-1.8 dbus-glib"
+
+inherit autotools gettext
 
 SRC_URI = "http://source.clutter-project.org/sources/mx/1.4/mx-${PV}.tar.bz2 \
 	   file://introspection-m4.patch"
@@ -14,5 +16,5 @@ SRC_URI[sha256sum] = "9d40dd48a8e3d098cc75c05163f77305ffb83439783dc91be50681c950
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=fbc093901857fcd118f065f900982c24 \
                     file://mx/mx-widget.c;beginline=8;endline=20;md5=13bba3c973a72414a701e1e87b5ee879"
 
-EXTRA_OECONF = "--disable-introspection --disable-gtk-widgets"
+EXTRA_OECONF = "--disable-introspection --disable-gtk-widgets --with-dbus"
 
-- 
1.7.7.6



