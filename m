Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TBWBS-0001kc-HS
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 21:31:42 +0200
Received: from mail-we0-f175.google.com ([74.125.82.175])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 11 Sep 2012 12:19:09 -0700
Received: by weyr6 with SMTP id r6so507617wey.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2012 12:19:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=vSezyR6kxEWLg6vopff8BGVZmHIy9GjoRqGOZq0Pag4=;
	b=CBsohoItGqF1XeAKIvEQb+BktlOUIviuE9ygaQE7cXF4guTmmLv/VUMM8umo7+b8UW
	jy/tb/zGZ/Ye4kMrELTiWV7Pbpf0L2PqlsM8sN7zvEvyDNTB6jrpShzbSxb8YzdQqd+o
	PFEDdiekh09YF2RQbWLhNV4VxZYWXgEoqoCWcTbYQd9xvO/excK82VE+1KDSTe3DBxVW
	LAN+6dJE4QBmUUh7mVB9DnzMnZLu7vH8LUkZ+OW6Om8cG2ojpa9F4kgdNDv2TS4+r39I
	mO6h1u48vixh8d/g4nKbOO+k3yA4Y42mW8OMNBgcqlpJhmN85r6iVxXLY822wSRkZiJ/
	kNSA==
Received: by 10.180.20.11 with SMTP id j11mr27165161wie.12.1347391143480;
	Tue, 11 Sep 2012 12:19:03 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id t7sm5953150wix.6.2012.09.11.12.19.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 11 Sep 2012 12:19:02 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Sep 2012 20:17:55 +0100
Message-Id: <1347391088-30390-5-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1347391088-30390-1-git-send-email-ross.burton@intel.com>
References: <1347391088-30390-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQnhzIsXDXCDkfQeu7X4NaOc8hhUNjomEOMRbcc96ZHcr5sogTPx7Dy/NHA+AxlIkTCyQtdc
Subject: [RFC 05/18] libx11: move xcms disabling to PACKAGECONFIG in libx11.inc
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
X-List-Received-Date: Tue, 11 Sep 2012 19:31:42 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/xorg-lib/libx11-diet_1.5.0.bb |    2 +-
 meta/recipes-graphics/xorg-lib/libx11-trim_1.5.0.bb |    2 +-
 meta/recipes-graphics/xorg-lib/libx11.inc           |    6 +++++-
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/libx11-diet_1.5.0.bb b/meta/recipes-graphics/xorg-lib/libx11-diet_1.5.0.bb
index e6aa63f..dd9e7d9 100644
--- a/meta/recipes-graphics/xorg-lib/libx11-diet_1.5.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11-diet_1.5.0.bb
@@ -25,6 +25,6 @@ DEPENDS += "libxcb bigreqsproto xproto xextproto xtrans libxau xcmiscproto \
 
 FILESDIR = "${@os.path.dirname(d.getVar('FILE', True))}/libx11"
 
-EXTRA_OECONF += "--disable-xcms --disable-xlocale --with-keysymdefdir=${STAGING_INCDIR}/X11"
+EXTRA_OECONF += "--disable-xlocale --with-keysymdefdir=${STAGING_INCDIR}/X11"
 CFLAGS += "-D_GNU_SOURCE"
 
diff --git a/meta/recipes-graphics/xorg-lib/libx11-trim_1.5.0.bb b/meta/recipes-graphics/xorg-lib/libx11-trim_1.5.0.bb
index e8661f3..9e88d45 100644
--- a/meta/recipes-graphics/xorg-lib/libx11-trim_1.5.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11-trim_1.5.0.bb
@@ -19,4 +19,4 @@ RPROVIDES_${PN}-locale = "libx11-locale"
 SRC_URI[md5sum] = "78b4b3bab4acbdf0abcfca30a8c70cc6"
 SRC_URI[sha256sum] = "c382efd7e92bfc3cef39a4b7f1ecf2744ba4414a705e3bc1e697f75502bd4d86"
 
-EXTRA_OECONF += "--with-keysymdefdir=${STAGING_INCDIR}/X11/ --disable-xcms "
+EXTRA_OECONF += "--with-keysymdefdir=${STAGING_INCDIR}/X11/"
diff --git a/meta/recipes-graphics/xorg-lib/libx11.inc b/meta/recipes-graphics/xorg-lib/libx11.inc
index fb1daf2..22b26cc 100644
--- a/meta/recipes-graphics/xorg-lib/libx11.inc
+++ b/meta/recipes-graphics/xorg-lib/libx11.inc
@@ -9,7 +9,7 @@ require xorg-lib-common.inc
 inherit siteinfo
 
 PE = "1"
-INC_PR = "r2"
+INC_PR = "r3"
 
 PROVIDES = "virtual/libx11"
 
@@ -23,6 +23,10 @@ FILES_${PN} += "${datadir}/X11/XKeysymDB ${datadir}/X11/XErrorDB ${libdir}/X11/X
 FILES_${PN}-xcb += "${libdir}/libX11-xcb.so.*"
 FILES_${PN}-locale += "${datadir}/X11/locale ${libdir}/X11/locale"
 
+# Almost nothing uses XCMS
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[xcms] = "--enable-xcms,--disable-xcms"
+
 do_compile_prepend() {
 	cd ${S}/src/util
 	mv makekeys.c.orig makekeys.c || true
-- 
1.7.10



