Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id F1FFA6CE7B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Oct 2013 16:17:58 +0000 (UTC)
Received: by mail-wi0-f177.google.com with SMTP id hq15so1069379wib.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Oct 2013 09:18:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=NtOtMevgrmMAK4u7u7t0NbUcAxSXv2tRPrXOC7fhato=;
	b=YQ0E//BrqCBw8/1D0FUHCRSCuk2yxVRjeaqJWjVXVAlgL2Xo+C0PT9Wb65ahzxEap/
	o+ZhG12eVDODQczdgXvOP5J7w4cY3kkxbXSYQi42d82x2qAQlcT9uEs7v7ZgM8tjtA5d
	XrXh+qDNvjH/76u1z8VKdvnYcaKpfW4E4HjmvQrjMDc+oCCXbPtVHq1x5FXii3NyP4Ja
	26aX0ImQbkXTNn58cs8YmK69gW38qLx1RlIT/F2zZo1JzBQsLon4LsIOkdCyBtfr7xSd
	f2IM5AEoKc/+TUNkCssEYL6Oq8OwdIpkMVwknd0+n8C2x/9MkWvJhioMTOU5tCG7M/H3
	782g==
X-Gm-Message-State: ALoCoQlUSFvjFrMO5/wu+vUccyyEtaImwypYYtb3TYXeBippZ4xoQGBWuHTt/PHH3adVmLXajfMi
X-Received: by 10.180.39.212 with SMTP id r20mr24503420wik.13.1381249080072;
	Tue, 08 Oct 2013 09:18:00 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id k4sm2953038wic.0.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Oct 2013 09:17:59 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Oct 2013 17:17:54 +0100
Message-Id: <1381249074-15302-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] glib-networking: upgrade to 2.38.0 and PACKAGECONFIGise
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
X-List-Received-Date: Tue, 08 Oct 2013 16:18:00 -0000

Use PACKAGECONFIG to add options for ca-certificates, gnutls, and libproxy.

Enable ca-certificates by default as all it needs to know is the right path,
ca-certificates not being installed isn't fatal.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../glib-networking/glib-networking_2.36.2.bb      |   26 ----------------
 .../glib-networking/glib-networking_2.38.0.bb      |   31 ++++++++++++++++++++
 2 files changed, 31 insertions(+), 26 deletions(-)
 delete mode 100644 meta/recipes-core/glib-networking/glib-networking_2.36.2.bb
 create mode 100644 meta/recipes-core/glib-networking/glib-networking_2.38.0.bb

diff --git a/meta/recipes-core/glib-networking/glib-networking_2.36.2.bb b/meta/recipes-core/glib-networking/glib-networking_2.36.2.bb
deleted file mode 100644
index 5200b94..0000000
--- a/meta/recipes-core/glib-networking/glib-networking_2.36.2.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-DESCRIPTION = "glib-networking contains the implementations of certain GLib networking features that cannot be implemented directly in GLib itself because of their dependencies."
-HOMEPAGE = "http://git.gnome.org/browse/glib-networking/"
-BUGTRACKER = "http://bugzilla.gnome.org"
-
-LICENSE = "LGPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
-
-SECTION = "libs"
-DEPENDS = "glib-2.0 gnutls intltool-native"
-
-SRC_URI = "${GNOME_MIRROR}/${BPN}/2.36/${BPN}-${PV}.tar.xz"
-
-SRC_URI[md5sum] = "fb9121742ed36d1723f296eea19dbb3c"
-SRC_URI[sha256sum] = "2108d55b0af3eea56ce256830bcaf1519d6337e0054ef2eff80f2c0ef0eb23f9"
-
-PACKAGECONFIG ??= ""
-PACKAGECONFIG[pkcs11] = "--with-pkcs11,--without-pkcs11,p11-kit"
-
-EXTRA_OECONF = "--without-ca-certificates --without-gnome-proxy --without-libproxy"
-
-inherit autotools pkgconfig
-
-FILES_${PN} += "${libdir}/gio/modules/libgio*.so ${datadir}/dbus-1/services/"
-FILES_${PN}-dbg += "${libdir}/gio/modules/.debug/"
-FILES_${PN}-dev += "${libdir}/gio/modules/libgio*.la"
-FILES_${PN}-staticdev += "${libdir}/gio/modules/libgio*.a"
diff --git a/meta/recipes-core/glib-networking/glib-networking_2.38.0.bb b/meta/recipes-core/glib-networking/glib-networking_2.38.0.bb
new file mode 100644
index 0000000..ad9ad64
--- /dev/null
+++ b/meta/recipes-core/glib-networking/glib-networking_2.38.0.bb
@@ -0,0 +1,31 @@
+DESCRIPTION = "glib-networking contains the implementations of certain GLib networking features that cannot be implemented directly in GLib itself because of their dependencies."
+HOMEPAGE = "http://git.gnome.org/browse/glib-networking/"
+BUGTRACKER = "http://bugzilla.gnome.org"
+
+LICENSE = "LGPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
+
+SECTION = "libs"
+DEPENDS = "glib-2.0 intltool-native"
+
+GNOME_COMPRESS_TYPE = "xz"
+
+SRC_URI[archive.md5sum] = "a22907deed3d956860d83aa3233e86ff"
+SRC_URI[archive.sha256sum] = "a43eacbf721b475cf6ba0cd2eab02a332014f71a4c41d0b44bd7bbf8ed1f840d"
+
+PACKAGECONFIG ??= "ca-certificates gnutls"
+
+# No explicit dependency as it works without ca-certificates installed
+PACKAGECONFIG[ca-certificates] = "--with-ca-certificates=${sysconfdir}/ssl/certs/ca-certificates.crt,--without-ca-certificates"
+PACKAGECONFIG[gnutls] = "--with-gnutls,--without-gnutls,gnutls"
+PACKAGECONFIG[libproxy] = "--with-libproxy,--without-libproxy,libproxy"
+PACKAGECONFIG[pkcs11] = "--with-pkcs11,--without-pkcs11,p11-kit"
+
+EXTRA_OECONF = "--without-gnome-proxy"
+
+inherit gnomebase
+
+FILES_${PN} += "${libdir}/gio/modules/libgio*.so ${datadir}/dbus-1/services/"
+FILES_${PN}-dbg += "${libdir}/gio/modules/.debug/"
+FILES_${PN}-dev += "${libdir}/gio/modules/libgio*.la"
+FILES_${PN}-staticdev += "${libdir}/gio/modules/libgio*.a"
-- 
1.7.10.4


