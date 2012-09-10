Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TB7s1-0003ND-1v
	for openembedded-core@lists.openembedded.org;
	Mon, 10 Sep 2012 19:34:01 +0200
Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 10 Sep 2012 10:21:29 -0700
Received: by wibhn17 with SMTP id hn17so2045122wib.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2012 10:21:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=36dU3WntV33U63QlWiJEtWhebWhFtEDwOsbCdWrXIPg=;
	b=NawCjyL+bb/ypH1VLkcnERrMVk2bM6b85aDU4tqzvmhY6wjGK4jWlOYysA+6A9O3XF
	VWjSy4kS05DjOC96o1O7RNUK9cCKgUZJfNrR5lX2CKJUdqGnU4rZ0zeyUE/Kj9RdRUMx
	GC0r9JdGZ0RVBUId9uUColJNWokl/CC7I/flO3MX06Kf/lCHhKJu+a81o+YizTBfOcGB
	riATMlzNbEi1Og+Cleqawd7Svu1u2D99tuzTZv5EUZrOTuPugkZ626l4pu3YTD0VldPX
	9vng90WRVjFjvqzU5I/baBuiaYPAXtH2CsCtOKvIFMcv8ugTZ66rfufbZUkt+MbdZquW
	6Ojw==
Received: by 10.180.99.196 with SMTP id es4mr18526601wib.18.1347297687121;
	Mon, 10 Sep 2012 10:21:27 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id r9sm26684729wia.2.2012.09.10.10.21.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 10 Sep 2012 10:21:25 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Sep 2012 18:20:31 +0100
Message-Id: <1347297632-16529-3-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1347297632-16529-1-git-send-email-ross.burton@intel.com>
References: <1347297632-16529-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQllvDs6n2P7KvXhbPhitWKkYgF7XF4hdWWhehwdBWtf1oufIoasRRI64Sob5vC3boC/Q8VT
Subject: [PATCH 3/4] libx11: don't split libX11-xcb out into a libx11-xcb package
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
X-List-Received-Date: Mon, 10 Sep 2012 17:34:01 -0000

As XCB is a hard requirement for libX11, and libX11-xcb.so is a deprecated 3KB
.so, it's not worth splitting it into a separate package.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/xorg-lib/libx11-trim_1.5.0.bb |    2 +-
 meta/recipes-graphics/xorg-lib/libx11.inc           |    3 ---
 meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb      |    2 +-
 3 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/libx11-trim_1.5.0.bb b/meta/recipes-graphics/xorg-lib/libx11-trim_1.5.0.bb
index 3d5a306..c39b859 100644
--- a/meta/recipes-graphics/xorg-lib/libx11-trim_1.5.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11-trim_1.5.0.bb
@@ -5,7 +5,7 @@ DESCRIPTION += " Support for XCMS is disabled in this version."
 LICENSE = "MIT & MIT-style & BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=172255dee66bb0151435b2d5d709fcf7"
 
-PR = "r1"
+PR = "r2"
 
 DEPENDS += "libxcb xproto xextproto xtrans libxau kbproto inputproto xf86bigfontproto xproto-native"
 
diff --git a/meta/recipes-graphics/xorg-lib/libx11.inc b/meta/recipes-graphics/xorg-lib/libx11.inc
index 592f116..bbbb29c 100644
--- a/meta/recipes-graphics/xorg-lib/libx11.inc
+++ b/meta/recipes-graphics/xorg-lib/libx11.inc
@@ -18,10 +18,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=172255dee66bb0151435b2d5d709fcf7"
 
 EXTRA_OECONF += "--with-groff=no --with-ps2pdf=no --with-fop=no --disable-specs"
 
-PACKAGES =+ "${PN}-xcb"
-
 FILES_${PN} += "${datadir}/X11/XKeysymDB ${datadir}/X11/XErrorDB ${libdir}/X11/Xcms.txt"
-FILES_${PN}-xcb += "${libdir}/libX11-xcb.so.*"
 FILES_${PN}-locale += "${datadir}/X11/locale ${libdir}/X11/locale"
 
 do_compile_prepend() {
diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb b/meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb
index a65ab1f..e78d707 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb
@@ -1,7 +1,7 @@
 require libx11.inc
 inherit gettext
 
-PR = "r1"
+PR = "r2"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
1.7.10



