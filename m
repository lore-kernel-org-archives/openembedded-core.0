Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S8XZ9-0004xL-SI for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 14:51:36 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2GDgmxH003395
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Mar 2012 13:42:48 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02357-05 for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Mar 2012 13:42:44 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2GDgel0003388
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Mar 2012 13:42:41 GMT
Message-ID: <1331905360.18586.180.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 16 Mar 2012 13:42:40 +0000
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] xf86-input-synaptics: Fix QA warnings
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
X-List-Received-Date: Fri, 16 Mar 2012 13:51:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Remove the .pc file work around since it leads to incorrect paths being encoded and
places the files in the incorrect directory.

WARNING: For recipe xf86-input-synaptics, the following files/directories were installed but not shipped in any package:
WARNING:   /media
WARNING:   /media/build1
WARNING:   /media/build1/poky
WARNING:   /media/build1/poky/build
WARNING:   /media/build1/poky/build/tmp
WARNING:   /media/build1/poky/build/tmp/sysroots
WARNING:   /media/build1/poky/build/tmp/sysroots/qemux86
WARNING:   /media/build1/poky/build/tmp/sysroots/qemux86/usr
WARNING:   /media/build1/poky/build/tmp/sysroots/qemux86/usr/include
WARNING:   /media/build1/poky/build/tmp/sysroots/qemux86/usr/include/xorg
WARNING:   /media/build1/poky/build/tmp/sysroots/qemux86/usr/include/xorg/synaptics-properties.h
WARNING:   /media/build1/poky/build/tmp/sysroots/qemux86/usr/include/xorg/synaptics.h
WARNING:   /usr/share/X11
WARNING:   /usr/share/X11/xorg.conf.d
WARNING:   /usr/share/X11/xorg.conf.d/50-synaptics.conf

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.5.0.bb b/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.5.0.bb
index 57180a2..5e46567 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.5.0.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.5.0.bb
@@ -1,5 +1,7 @@
 require xorg-driver-input.inc
 
+#SRC_URI += "file://configurefix.patch"
+
 SUMMARY = "X.Org X server -- synaptics touchpad input driver"
 
 DESCRIPTION = "synaptics is an Xorg input driver for the touchpads from \
@@ -10,16 +12,11 @@ advanced features of the touchpad to become available."
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=e395e21f3c21d4fc3a243783e85e9ab5"
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.2"
 
 SRC_URI[md5sum] = "41ee749ecbfef98f7fba708cb2afae87"
 SRC_URI[sha256sum] = "95cc5399fc49c9a35b02c2272cd99b8438f4609b219278c66a79e74c916a1c4e"
 
 DEPENDS += "libxi"
 
-#
-# the xorg-synaptics.pc has hardcoded sdkdir=/usr/include/xorg, which is not correct
-# for cross compiling, so pass the correct sdkdir as include path
-#
-EXTRA_OEMAKE += " sdkdir=${STAGING_INCDIR}/xorg "
-
+FILES_${PN} += "${datadir}/X11/xorg.conf.d"




