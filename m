Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QtZf9-0004F7-5V
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Aug 2011 08:31:39 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 16 Aug 2011 23:26:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="39163465"
Received: from unknown (HELO swold-MOBL.local) ([10.255.15.2])
	by orsmga001.jf.intel.com with ESMTP; 16 Aug 2011 23:26:58 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Aug 2011 23:26:49 -0700
Message-Id: <23dc421a0943b13259fe4d86086427bdde8c1ade.1313560883.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1313560883.git.sgw@linux.intel.com>
References: <cover.1313560883.git.sgw@linux.intel.com>
In-Reply-To: <cover.1313560883.git.sgw@linux.intel.com>
References: <cover.1313560883.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 26/27] ofono: conditionally enable bluetooth
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
X-List-Received-Date: Wed, 17 Aug 2011 06:31:39 -0000

From: Anders Darander <anders@chargestorm.se>

Use DISTRO_FEATURE to conditionally depend on bluez4, as well as enabling bluetooth.

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 meta/recipes-connectivity/ofono/ofono.inc     |    3 ++-
 meta/recipes-connectivity/ofono/ofono_0.50.bb |    1 +
 meta/recipes-connectivity/ofono/ofono_git.bb  |    4 ++++
 3 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-connectivity/ofono/ofono.inc b/meta/recipes-connectivity/ofono/ofono.inc
index a14b35a..ab233dc 100644
--- a/meta/recipes-connectivity/ofono/ofono.inc
+++ b/meta/recipes-connectivity/ofono/ofono.inc
@@ -7,7 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
 
 inherit autotools pkgconfig update-rc.d
 
-DEPENDS  = "dbus glib-2.0 udev bluez4"
+BLUEZDEPENDS = "bluez4"
+DEPENDS  = "dbus glib-2.0 udev ${@base_contains('DISTRO_FEATURES', 'bluetooth','${BLUEZDEPENDS}', '', d)}"
 
 INITSCRIPT_NAME = "ofono"
 INITSCRIPT_PARAMS = "defaults 22"
diff --git a/meta/recipes-connectivity/ofono/ofono_0.50.bb b/meta/recipes-connectivity/ofono/ofono_0.50.bb
index ef4fbf0..b679200 100644
--- a/meta/recipes-connectivity/ofono/ofono_0.50.bb
+++ b/meta/recipes-connectivity/ofono/ofono_0.50.bb
@@ -7,6 +7,7 @@ SRC_URI  = "${KERNELORG_MIRROR}/linux/network/ofono/${BPN}-${PV}.tar.bz2 \
 
 EXTRA_OECONF += "\
     --enable-test \
+    ${@base_contains('DISTRO_FEATURES', 'bluetooth','--enable-bluetooth', '--disable-bluetooth', d)} \
 "
 
 SRC_URI[md5sum] = "b2656fd0bbf33f926fc86c1e8915d697"
diff --git a/meta/recipes-connectivity/ofono/ofono_git.bb b/meta/recipes-connectivity/ofono/ofono_git.bb
index dbad5a1..f1770c2 100644
--- a/meta/recipes-connectivity/ofono/ofono_git.bb
+++ b/meta/recipes-connectivity/ofono/ofono_git.bb
@@ -10,6 +10,10 @@ PR = "r1"
 SRC_URI  = "git://git.kernel.org/pub/scm/network/ofono/ofono.git;protocol=git \
 	    file://ofono"
 
+EXTRA_OECONF += "\
+    ${@base_contains('DISTRO_FEATURES', 'bluetooth','--enable-bluetooth', '--disable-bluetooth', d)} \
+"
+
 do_configure_prepend () {
   ${S}/bootstrap
 }
-- 
1.7.6



