Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1RqZr5-0000pB-LC
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Jan 2012 01:39:51 +0100
Received: by eekd41 with SMTP id d41so318213eek.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2012 16:32:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=K0GQZ1GSyLmRLee/eqPfmAfy5T1Sa0nR5Mg1KhP9qMk=;
	b=hHr+3EfAoOtzPS/gSgzRKGg855Tx9SQ8ZhrNJuM1/FeG+KewBUi0e9X3rPdULS80EO
	xA0hZG1/EPssY8R8z1/3AUsZz3KzlcBTnI8jgPxPj2FNJj9UB79Mv9EY0EUCgV3uHKuN
	mIhP+FSK4zyl9Gw7AflG/C9TK2xBzY8NGul/o=
Received: by 10.14.50.206 with SMTP id z54mr1390444eeb.127.1327624319691;
	Thu, 26 Jan 2012 16:31:59 -0800 (PST)
Received: from localhost.localdomain (p5B0A28B8.dip.t-dialin.net.
	[91.10.40.184])
	by mx.google.com with ESMTPS id y12sm22086386eeb.11.2012.01.26.16.31.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 26 Jan 2012 16:31:59 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jan 2012 01:33:53 +0100
Message-Id: <1327624433-27864-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
Subject: [PATCH] atk: add native support / disable introspection / merge atk.inc -> recipe
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
X-List-Received-Date: Fri, 27 Jan 2012 00:39:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Native support currently is appended in meta-oe. Native build failed with:

| /usr/share/gir-1.0/GLib-2.0.gir:9:1: error: Unsupported version '1.1'
| /usr/share/gir-1.0/GLib-2.0.gir:9:39: error: Unsupported version '1.1'
| error parsing file Atk-1.0.gir: Failed to parse included gir GLib-2.0
| make[3]: *** [Atk-1.0.typelib] Error 1

build tested in meta-oe / angstrom environment

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta/recipes-support/atk/atk.inc      |   13 -------------
 meta/recipes-support/atk/atk_2.2.0.bb |   17 +++++++++++++----
 2 files changed, 13 insertions(+), 17 deletions(-)
 delete mode 100644 meta/recipes-support/atk/atk.inc

diff --git a/meta/recipes-support/atk/atk.inc b/meta/recipes-support/atk/atk.inc
deleted file mode 100644
index 6a4fef6..0000000
--- a/meta/recipes-support/atk/atk.inc
+++ /dev/null
@@ -1,13 +0,0 @@
-DESCRIPTION = "An accessibility toolkit for GNOME."
-HOMEPAGE = "http://live.gnome.org/GAP/"
-BUGTRACKER = "https://bugzilla.gnome.org/"
-
-LICENSE = "LGPLv2 & LGPLv2+"
-
-SECTION = "x11/libs"
-
-DEPENDS = "glib-2.0 gtk-doc-native"
-
-inherit autotools pkgconfig
-
-EXTRA_OECONF = "--disable-glibtest"
diff --git a/meta/recipes-support/atk/atk_2.2.0.bb b/meta/recipes-support/atk/atk_2.2.0.bb
index 0d657b5..daa7931 100644
--- a/meta/recipes-support/atk/atk_2.2.0.bb
+++ b/meta/recipes-support/atk/atk_2.2.0.bb
@@ -1,14 +1,23 @@
-require atk.inc
+DESCRIPTION = "An accessibility toolkit for GNOME."
+HOMEPAGE = "http://live.gnome.org/GAP/"
+BUGTRACKER = "https://bugzilla.gnome.org/"
+SECTION = "x11/libs"
 
-PR = "r1"
+LICENSE = "LGPLv2 & LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
                     file://atk/atkutil.c;endline=20;md5=db21b0bdbef9da4dc6eb122debc9f9bc \
                     file://atk/atk.h;endline=20;md5=c58238d688c24387376d6c69d06248a7"
+PR = "r2"
 
-SRC_URI = "http://download.gnome.org/sources/atk/2.2/${BPN}-${PV}.tar.bz2"
+DEPENDS = "glib-2.0 gtk-doc-native"
+
+inherit autotools pkgconfig
 
+SRC_URI = "http://download.gnome.org/sources/atk/2.2/${BPN}-${PV}.tar.bz2"
 SRC_URI[md5sum] = "4894e9b04f0a9f1c37a624a1e8d6d73f"
 SRC_URI[sha256sum] = "d201e3f5808aef0b1aec2277bfa61074f68863e405428adb57a73aab5c838450"
 
+BBCLASSEXTEND = "native"
 
-
+EXTRA_OECONF = "--disable-glibtest \
+                --disable-introspection"
-- 
1.7.4.4



