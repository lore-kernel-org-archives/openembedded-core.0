Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rvlyc-0001XA-5P
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Feb 2012 09:37:06 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 10 Feb 2012 00:28:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="116213855"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.208])
	by fmsmga001.fm.intel.com with ESMTP; 10 Feb 2012 00:28:58 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Feb 2012 00:28:44 -0800
Message-Id: <c4a2060425708e9c40be6c60c1686e477b789442.1328862318.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1328862318.git.sgw@linux.intel.com>
References: <cover.1328862318.git.sgw@linux.intel.com>
In-Reply-To: <cover.1328862318.git.sgw@linux.intel.com>
References: <cover.1328862318.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 09/20] mx: ensure gettext and dbus are present
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
X-List-Received-Date: Fri, 10 Feb 2012 08:37:06 -0000

From: Joshua Lock <josh@linux.intel.com>

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
1.7.6.5



