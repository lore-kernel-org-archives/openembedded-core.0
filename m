Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TjAzt-0004BK-2y
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Dec 2012 16:46:53 +0100
Received: from mail-lb0-f197.google.com ([209.85.217.197])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 13 Dec 2012 07:32:15 -0800
Received: by mail-lb0-f197.google.com with SMTP id go10so1568765lbb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2012 07:32:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=UQQJkDMKS/Rc6OZwp8/4ppTY1wWPEHIYxC7Zgvtc0FI=;
	b=jOYk0v6WbVBmWhg34jCJx27cnutL/C3RhhwpZ2vhN89ZZluAjN4AwU4gZtEYgwRscx
	AeuJvv3UoFlyXTiqpVnY7xEakciKmPj43Iyg3lRkSwML2NCDO0MrfYd6HccTPrSRQc4n
	nSXd0TKT0Si98J1K8Nc/ebYB5szH4AqX9FfWii1lyAkurMVx9gjP4LPBpXM6qLLg1grM
	YGNL2W2sjdc8VJBj584HWxITTsiZ/en8UmduvbmhjVpiREvz/un4B3BcfJvT1iZUki/I
	SpNYdHnuLYfPYbCaleybnaXkAXaWzujvRQz1cjamC0GcVu/bTldZCJWf234xaplHyjZh
	2VAA==
Received: by 10.180.86.39 with SMTP id m7mr29805147wiz.1.1355412732495;
	Thu, 13 Dec 2012 07:32:12 -0800 (PST)
Received: by 10.180.86.39 with SMTP id m7mr29805142wiz.1.1355412732424;
	Thu, 13 Dec 2012 07:32:12 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id ec3sm8233311wib.10.2012.12.13.07.32.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 13 Dec 2012 07:32:11 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Dec 2012 15:30:31 +0000
Message-Id: <1355412631-29499-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQkUvHn5eMyTLwl3WYwV3rq45bdiHNLWf+LXLPAi4L/2iDWG0ZfEP2SOPktaYcZCqmuNqIuf9C3G5cpMICmqxDUte+qe7lTup2rYupiO7iRn/WvJmAxIqic9u0WlAT2spZmLZHjxa1SMaz953yBWi6LyHLnMBT8dtzrwFLmfukpyJWAuHNBTIjw+keVdp84w6Tp/mz7F
Subject: [PATCH] mesa: remove dependency on mesa-dri in mesa-dri-dev
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
X-List-Received-Date: Thu, 13 Dec 2012 15:46:53 -0000

Move /etc/drirc to libdricommon so mesa-dri is empty, and remove the automatic
dependency on mesa-dri in mesa-dri-dev.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/mesa/mesa-common.inc |    8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-common.inc b/meta/recipes-graphics/mesa/mesa-common.inc
index 1d3655f..70957eb 100644
--- a/meta/recipes-graphics/mesa/mesa-common.inc
+++ b/meta/recipes-graphics/mesa/mesa-common.inc
@@ -12,7 +12,7 @@ SECTION = "x11"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://docs/license.html;md5=03ccdc4c379c4289aecfb8892c546f67"
 
-INC_PR = "r8"
+INC_PR = "r9"
 PE = "2"
 
 DEPENDS = "libxml2-native makedepend-native flex-native bison-native"
@@ -37,6 +37,9 @@ PACKAGECONFIG[x11] = "--enable-glx-tls,--disable-glx,${X11_DEPS}"
 # Multiple virtual/gl providers being built breaks staging
 EXCLUDE_FROM_WORLD = "1"
 
+# Remove the mesa-dri dependency on mesa-dri-dev, as mesa-dri is empty
+RDEPENDS_${PN}-dev = ""
+
 PACKAGES =+ "libegl-mesa libegl-mesa-dev \
              libosmesa libosmesa-dev \
              libgl-mesa libgl-mesa-dev \
@@ -79,8 +82,7 @@ python __anonymous() {
         d.appendVar("RCONFLICTS_" + fullp, pkgs)
 }
 
-FILES_${PN} = "${sysconfdir}/drirc"
-FILES_libdricore = "${libdir}/libdricore*.so.*"
+FILES_libdricore = "${sysconfdir}/drirc ${libdir}/libdricore*.so.*"
 FILES_libegl-mesa = "${libdir}/libEGL.so.*"
 FILES_libgbm = "${libdir}/libgbm.so.*"
 FILES_libgles1-mesa = "${libdir}/libGLESv1*.so.*"
-- 
1.7.10



