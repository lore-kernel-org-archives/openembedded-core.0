Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id DB21D73694
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jul 2015 11:56:24 +0000 (UTC)
Received: by wgav7 with SMTP id v7so88782522wga.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jul 2015 04:56:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=LuZBdvCJ/sFqT3VEPpYC+gmSBVdvT0XSzyccRx7E+uU=;
	b=lopQqPtMGiR+AcKxeBYFwM4arqCBP9S0v1Xjkp5Xnwc7oB5U1L6PaYDUW2cZlFvELE
	yFEtkbaeL58TZbi/Q3zUecrVsPpKJzJ0RqMd2iJiLMtC3caJBAM5SJD1aDV4WKvECyAc
	sED4au1qf5KVlP9A7r2YqFTFi0Mi62rXX3iobXDN2iWTYSZuHbjEB+KCzPnya+wvt/Xn
	dmxp4ANbyputTNt9YqD+8jGzIsfihnV0ReTAo8LhXuLOlh2rf8yWG/Y8FFU3L5JJSXP/
	CBHqvzBSPzDjjQHTbOtpyZUl0Ap0CMlux2T/8g4nliuGjPKz2xFiegRodbUpr46sVmFT
	AgDA==
X-Gm-Message-State: ALoCoQljrKXqGre+tFFUtx2V1n/zngY9FOVVFdKRuIs2qZ+MouwicJqPyVDuaAciiK1jM3wWJzu+
X-Received: by 10.194.79.225 with SMTP id m1mr67416599wjx.8.1437479784100;
	Tue, 21 Jul 2015 04:56:24 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	eu2sm16499153wic.8.2015.07.21.04.56.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 21 Jul 2015 04:56:23 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Jul 2015 12:50:35 +0100
Message-Id: <1437479435-29924-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] gtk+3: fix Wayland-only builds
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Jul 2015 11:56:25 -0000

When configured with just the Wayland backend (no X11), not enough
Pango headers were included.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-gnome/gtk+/gtk+3/wayland-pango.patch | 28 +++++++++++++++++++++++
 meta/recipes-gnome/gtk+/gtk+3_3.16.4.bb           |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-gnome/gtk+/gtk+3/wayland-pango.patch

diff --git a/meta/recipes-gnome/gtk+/gtk+3/wayland-pango.patch b/meta/recipes-gnome/gtk+/gtk+3/wayland-pango.patch
new file mode 100644
index 0000000..1d6f12b
--- /dev/null
+++ b/meta/recipes-gnome/gtk+/gtk+3/wayland-pango.patch
@@ -0,0 +1,28 @@
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From 802b006b3768ddc8c8cdf0af27428e7042c36509 Mon Sep 17 00:00:00 2001
+From: nick <oavc-fujie@yandex.com>
+Date: Mon, 29 Jun 2015 20:37:26 +0100
+Subject: settings: Include pangofc-fontmap.h header on Wayland
+
+In case the X11 backend is not enabled, we still need to include the
+pangofc-fontmap.h header file, as we use the Pango/FontConfig API in
+both the X11 and Wayland case.
+
+https://bugzilla.gnome.org/show_bug.cgi?id=751625
+
+diff --git a/gtk/gtksettings.c b/gtk/gtksettings.c
+index 327faf5..a40cb84 100644
+--- a/gtk/gtksettings.c
++++ b/gtk/gtksettings.c
+@@ -41,6 +41,7 @@
+ 
+ #ifdef GDK_WINDOWING_WAYLAND
+ #include "wayland/gdkwayland.h"
++#include <pango/pangofc-fontmap.h>
+ #endif
+ 
+ #ifdef GDK_WINDOWING_BROADWAY
+-- 
+cgit v0.10.2
diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.16.4.bb b/meta/recipes-gnome/gtk+/gtk+3_3.16.4.bb
index 3a45afc..4bb6b0c 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.16.4.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.16.4.bb
@@ -5,6 +5,7 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar.xz \
            file://hardcoded_libtool.patch \
            file://Dont-force-csd.patch \
+           file://wayland-pango.patch \
           "
 
 SRC_URI[md5sum] = "c7497aaf6730524a127597b768a73bd7"
-- 
2.1.4


