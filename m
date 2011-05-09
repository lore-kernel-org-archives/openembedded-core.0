Received: from mail-px0-f172.google.com ([209.85.212.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QJVQQ-0005fq-O9
	for openembedded-core@lists.openembedded.org;
	Mon, 09 May 2011 20:43:25 +0200
Received: by pxi6 with SMTP id 6so3954525pxi.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 May 2011 11:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=Q5xJZe/iE9uFzQmvrWWIAAMdNku4sGpmr24xSPUypVE=;
	b=quYLCMta/Ev117Z+mTwsb4ZhiAOVpysdZtmRQtA7/w7XkgtwBQOuwKtSf8pPTBilMt
	cqJ4EknFchkLXlm+vm6moCqeAxHtPm4Czq/yTOuTZhOSmX8WxDeABZQsVoeFmpwr3VMQ
	U6wsTMwJfLaqvgFfwJfN4TqobX/XE5BtEsnIA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=Pq6m7+Ovme0ur8wRBiWvrfDZ2JluaKAlDU1nT2sA/2cbd2fIm41N4+wHoYkCPuTNmJ
	O3d4/gRUoSHxAQWV/JbRI/6DXdsGDpD4OIyN9h58yRPMS7yH/19CXyWIv1M/uLIlsPB0
	g4vZLk1CmtC47xvykmL1Dcu0nPFuCDQWMArGw=
Received: by 10.68.29.9 with SMTP id f9mr10159435pbh.350.1304966436542;
	Mon, 09 May 2011 11:40:36 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id u1sm4262205pbm.41.2011.05.09.11.40.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 09 May 2011 11:40:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Mon,  9 May 2011 11:40:29 -0700
Message-Id: <cc8f8da47fc3811a35a4fb4d31ef415668ec0a11.1304966147.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1304966147.git.raj.khem@gmail.com>
References: <cover.1304966147.git.raj.khem@gmail.com>
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH 1/6] recipes: Replace gconf-dbus with gconf
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
X-List-Received-Date: Mon, 09 May 2011 18:43:27 -0000

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
index 586d76f..b24fc9e 100644
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



