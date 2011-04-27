Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QF7dg-0002G4-VK
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Apr 2011 18:30:57 +0200
Received: by pvc30 with SMTP id 30so1323609pvc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Apr 2011 09:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=HY2gf0fa0KruGLFN9ox2ec4TnmMW4qUyZ2jTGf5MK2o=;
	b=wQDESP906u0fOb2HGFWYQI5R2bkYdFSPWvPL/sU6ybiJtIzrwNZZMFqW2a/f6jQG+V
	HpzDtNLCYavxdNLaKFS2trI23/Lxe91FyMsrp+Lc548owtdveofpN0L+MGzoUSOfkd8W
	MAAylvic3gEPQFQiFCzboUUhRv16cmY8c7y7A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=UX42ycju3TglzjiUJsy4K9ZCX1RQ2NRu8A1sbJWAgc5sXFKc7yaLxrptQ3Bi/cVaps
	k3ZNRztLvlqkqf7gpw5lcDG86r4qgoSpt1aVeR/GEmZBAbRMRLxnMU4aJ/YiABRz3L1I
	iW82d4r8uMLxY5LXSTNJJo890GoNC1tgpreog=
Received: by 10.68.33.41 with SMTP id o9mr2494706pbi.174.1303921704727;
	Wed, 27 Apr 2011 09:28:24 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id b4sm642599pbo.80.2011.04.27.09.28.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 27 Apr 2011 09:28:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Wed, 27 Apr 2011 09:28:08 -0700
Message-Id: <1303921688-610-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH] recipes: Replace gconf-dbus with gconf
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
X-List-Received-Date: Wed, 27 Apr 2011 16:30:57 -0000

Some distributions e.g. angstrom do not support gconf-dbus
anymore since its now provided by gconf and in oe-core we
have PREFERRED_PROVIDER_gconf tunable, here we replace all
dependencies on gconf-dbus with gconf, which should work
in both cases where poky defines
PREFERRED_PROVIDER-gconf = "gconf-dbus" and for angstrom
it is simply gconf

Without this meta-toolchain-sdk ends up with conflicts in
runqueue and does not build

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-gnome/gnome/libgnomekbd_2.26.0.bb      |    2 +-
 meta/recipes-gnome/gnome/gnome-desktop.inc         |    2 +-
 meta/recipes-gnome/gthumb/gthumb_2.12.2.bb         |    2 +-
 meta/recipes-gnome/tasks/task-sdk-gmae.inc         |    2 +-
 meta/recipes-support/libproxy/libproxy_0.4.6.bb    |    2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-demoapps/recipes-gnome/gnome/libgnomekbd_2.26.0.bb b/meta-demoapps/recipes-gnome/gnome/libgnomekbd_2.26.0.bb
index f2e4ec5..68e4eee 100644
--- a/meta-demoapps/recipes-gnome/gnome/libgnomekbd_2.26.0.bb
+++ b/meta-demoapps/recipes-gnome/gnome/libgnomekbd_2.26.0.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "GNOME keyboard library"
 LICENSE = "LGPL"
 
-DEPENDS = "gconf-dbus dbus libxklavier gtk+"
+DEPENDS = "gconf dbus libxklavier gtk+"
 
 inherit gnome
 
diff --git a/meta/recipes-gnome/gnome/gnome-desktop.inc b/meta/recipes-gnome/gnome/gnome-desktop.inc
index 123f82d..336b87f 100644
--- a/meta/recipes-gnome/gnome/gnome-desktop.inc
+++ b/meta/recipes-gnome/gnome/gnome-desktop.inc
@@ -1,7 +1,7 @@
 DESCRIPTION = "GNOME library for reading .desktop files"
 SECTION = "x11/gnome"
 LICENSE = "GPLv2 & LGPLv2"
-DEPENDS = "gconf-dbus libxrandr virtual/libx11 gtk+ glib-2.0 gnome-doc-utils"
+DEPENDS = "gconf libxrandr virtual/libx11 gtk+ glib-2.0 gnome-doc-utils"
 
 EXTRA_OECONF = "--disable-scrollkeeper --disable-desktop-docs"
 
diff --git a/meta/recipes-gnome/gthumb/gthumb_2.12.2.bb b/meta/recipes-gnome/gthumb/gthumb_2.12.2.bb
index 0b3bd1a..258f2d5 100644
--- a/meta/recipes-gnome/gthumb/gthumb_2.12.2.bb
+++ b/meta/recipes-gnome/gthumb/gthumb_2.12.2.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "gThumb is an image viewer and browser for the GNOME Desktop"
 SECTION = "x11/gnome"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
-DEPENDS = "glib-2.0 gtk+ libxml2 gnome-doc-utils libunique gconf-dbus libpng gstreamer jpeg tiff gst-plugins-base"
+DEPENDS = "glib-2.0 gtk+ libxml2 gnome-doc-utils libunique gconf libpng gstreamer jpeg tiff gst-plugins-base"
 PR = "r0"
 
 EXTRA_OECONF = "--disable-gnome-keyring --disable-libsoup --disable-exiv2 --disable-clutter"
diff --git a/meta/recipes-gnome/tasks/task-sdk-gmae.inc b/meta/recipes-gnome/tasks/task-sdk-gmae.inc
index 2071089..0bf9d8b 100644
--- a/meta/recipes-gnome/tasks/task-sdk-gmae.inc
+++ b/meta/recipes-gnome/tasks/task-sdk-gmae.inc
@@ -4,7 +4,7 @@ SDK-GMAE = " \
     gtk+-dev \
     gstreamer-dev \
     bluez4-dev \
-    gconf-dbus-dev \
+    gconf-dev \
     avahi-dev \
     telepathy-glib-dev \
     eds-dbus-dev \
diff --git a/meta/recipes-support/libproxy/libproxy_0.4.6.bb b/meta/recipes-support/libproxy/libproxy_0.4.6.bb
index 255cd5b..2e18065 100644
--- a/meta/recipes-support/libproxy/libproxy_0.4.6.bb
+++ b/meta/recipes-support/libproxy/libproxy_0.4.6.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7d7044444a7b1b116e8783edcdb44ff4 \
                     file://utils/proxy.c;beginline=1;endline=18;md5=55152a1006d7dafbef32baf9c30a99c0"
 
 
-DEPENDS = "virtual/libx11 xmu gconf-dbus"
+DEPENDS = "virtual/libx11 xmu gconf"
 
 SRC_URI = "http://libproxy.googlecode.com/files/libproxy-${PV}.tar.gz"
 
-- 
1.7.4.1



