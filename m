Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QIcNC-0006sR-1D
	for openembedded-core@lists.openembedded.org;
	Sat, 07 May 2011 09:56:22 +0200
Received: by mail-pv0-f175.google.com with SMTP id 30so1799429pvc.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 07 May 2011 00:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=Q5xJZe/iE9uFzQmvrWWIAAMdNku4sGpmr24xSPUypVE=;
	b=tZWwbbLCRzh+WWZdDFtDbpJiZ3RmT84ZI/CCcdTtBJ9y3csjS335/zeonirI1AcPd1
	OWcUxgWG7nwwB9e0K1nz/jzZZPVMua/J5rzxXtF6RxTlMh7NQTF34Y5EwGoyWhOaNTcQ
	8CpNyZymKcxq8kXD7Ism+Fqq2r/XBFMRzBI7A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=pcT59AyF683dLplLz8Byzp5FHtWQcwvuEic97+FRzJKE7QTYx3rAiTpqwCgBlDNT7j
	DnZjOE/b58DJckeSQELneHgPRZWkr5gbSGFR7lnOfnAvkErSYNWgSFUdA3+rCyd2WOb3
	fcA2Bd5TvX+OQpJSXXoYKsbtbkQhlHLPVnDXs=
Received: by 10.68.29.230 with SMTP id n6mr6394289pbh.130.1304754820782;
	Sat, 07 May 2011 00:53:40 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id i7sm2678890pbs.19.2011.05.07.00.53.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 07 May 2011 00:53:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Sat,  7 May 2011 00:53:36 -0700
Message-Id: <d48976754e086a5477459e50ea4043d199073469.1304754527.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1304754527.git.raj.khem@gmail.com>
References: <cover.1304754527.git.raj.khem@gmail.com>
Subject: [PATCH 1/8] recipes: Replace gconf-dbus with gconf
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
X-List-Received-Date: Sat, 07 May 2011 07:56:22 -0000

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



