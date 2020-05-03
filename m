Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web12.26075.1588523198472104091
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 May 2020 09:26:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NTlZTCBB;
 spf=pass (domain: gmail.com, ip: 209.85.221.68, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f68.google.com with SMTP id l18so7252776wrn.6
        for <openembedded-core@lists.openembedded.org>; Sun, 03 May 2020 09:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lByorvlEDjuwJY/z1f3dw+6oOROlDnV08xAjcpARKtc=;
        b=NTlZTCBBF6dlHToeeH1iV8Sv/ampSFzUg9+x1OpSEMLr8s235nQAyofQ1k05XIZb+M
         YIcRP8/iiEXBqsQGUW6taP38vDH1MbfHZv2M3VzCnnZVAudVvpSXZqtIqJnJl9YtscUL
         XSMDI0E0gpZsWuUyIQmLlCfcsKyBigtn74ZTNl/F6cYIeWzB6nOdOFk36pD5xsIh9/Ud
         aCzsPZibPKERlgr881SXoDhTVkHo/TAvC+BZ1whBgW56HUumGaomnjwrGPAwEUkb1teV
         v2gmrXFL2hr5mTQSJ3PQ+e7uSOjwX6dX1UYdm8Lz4OhN52nAI4pv9r83wrdOVOESJxX8
         i6WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lByorvlEDjuwJY/z1f3dw+6oOROlDnV08xAjcpARKtc=;
        b=VdKODqjyIxpU6JyPRq6uYVHlG4EE1OEql2P1/D8K8R5tV3RMrhxU2Rht6HKQvImZmx
         /8cuBxaGwJ2VX9Zdy0aze2YcvfvU2P0dwz9uvv9WkeSKLeCbc8dY703Bu3eO4/EDYcUV
         qn7aFRDZMOgr9EYDVoV4thqJgQQSz/0OqnBAmkC54dr3fHOuY5/LDn1CjqTaUn+6bIvb
         czGRpvm4xBDc6dNGNO+x8BIavjwhxKcrKzpKx243mczG5a4uTFDtD+xjvt8izelZjVCn
         ydal4KWFY6nPzegem0SI+Pe2SocGI4EEn75V8wAXS8ZLIGS/0PkzMKyLs8hD/UQFuFTb
         t4nQ==
X-Gm-Message-State: AGi0PuYX5HZ0SclSbC6srGqhwM7rnGVYRwSTBdFGNrsNdciNRloQpo4F
	SklvHanc69ncQ2jMcCV5Xg3+AQoG
X-Google-Smtp-Source: APiQypIzWr9LLm3spuqwoXcT9IRaGJzWzqMTkJG6xQP7sletkaift8om5kXW9hw/xtI05vdAaLWvKQ==
X-Received: by 2002:adf:ecc5:: with SMTP id s5mr13273169wro.261.1588523196765;
        Sun, 03 May 2020 09:26:36 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.69.65])
        by smtp.gmail.com with ESMTPSA id q18sm9079532wmj.11.2020.05.03.09.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2020 09:26:36 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 09/17] avahi: update to 0.8
Date: Sun,  3 May 2020 18:25:51 +0200
Message-Id: <20200503162559.946-9-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200503162559.946-1-alex.kanavin@gmail.com>
References: <20200503162559.946-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../avahi/{avahi_0.7.bb => avahi_0.8.bb}      | 20 ++++----
 .../avahi/files/fix-CVE-2017-6519.patch       | 48 -------------------
 2 files changed, 9 insertions(+), 59 deletions(-)
 rename meta/recipes-connectivity/avahi/{avahi_0.7.bb => avahi_0.8.bb} (95%)
 delete mode 100644 meta/recipes-connectivity/avahi/files/fix-CVE-2017-6519.patch

diff --git a/meta/recipes-connectivity/avahi/avahi_0.7.bb b/meta/recipes-connectivity/avahi/avahi_0.8.bb
similarity index 95%
rename from meta/recipes-connectivity/avahi/avahi_0.7.bb
rename to meta/recipes-connectivity/avahi/avahi_0.8.bb
index b25cffa3cd..f4924fa1cb 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.7.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
@@ -20,12 +20,15 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2d5025d4aa3495befef8f17206a5b0a1 \
                     file://avahi-client/client.h;endline=23;md5=f4ac741a25c4f434039ba3e18c8674cf"
 
 SRC_URI = "https://github.com/lathiat/avahi/releases/download/v${PV}/avahi-${PV}.tar.gz \
-           file://fix-CVE-2017-6519.patch \
+           file://00avahi-autoipd \
+           file://99avahi-autoipd \
+           file://initscript.patch \
+           file://0001-Fix-opening-etc-resolv.conf-error.patch \
            "
 
 UPSTREAM_CHECK_URI = "https://github.com/lathiat/avahi/releases/"
-SRC_URI[md5sum] = "d76c59d0882ac6c256d70a2a585362a6"
-SRC_URI[sha256sum] = "57a99b5dfe7fdae794e3d1ee7a62973a368e91e414bd0dfa5d84434de5b14804"
+SRC_URI[md5sum] = "229c6aa30674fc43c202b22c5f8c2be7"
+SRC_URI[sha256sum] = "060309d7a333d38d951bc27598c677af1796934dbd98e1024e7ad8de798fedda"
 
 DEPENDS = "expat libcap libdaemon glib-2.0 intltool-native"
 
@@ -37,12 +40,15 @@ PACKAGECONFIG[dbus] = "--enable-dbus,--disable-dbus,dbus"
 PACKAGECONFIG[gtk] = "--enable-gtk,--disable-gtk,gtk+"
 PACKAGECONFIG[gtk3] = "--enable-gtk3,--disable-gtk3,gtk+3"
 PACKAGECONFIG[libdns_sd] = "--enable-compat-libdns_sd --enable-dbus,,dbus"
+PACKAGECONFIG[libevent] = "--enable-libevent,--disable-libevent,libevent"
+PACKAGECONFIG[qt5] = "--enable-qt5,--disable-qt5,qtbase"
 
 inherit autotools pkgconfig gettext gobject-introspection
 
 EXTRA_OECONF = "--with-avahi-priv-access-group=adm \
              --disable-stack-protector \
              --disable-gdbm \
+             --disable-dbm \
              --disable-mono \
              --disable-monodoc \
              --disable-qt3 \
@@ -59,8 +65,6 @@ EXTRA_OECONF_SYSVINIT = "${@bb.utils.contains('DISTRO_FEATURES','sysvinit','--wi
 EXTRA_OECONF_SYSTEMD = "${@bb.utils.contains('DISTRO_FEATURES','systemd','--with-systemdsystemunitdir=${systemd_unitdir}/system/','--without-systemdsystemunitdir',d)}"
 
 do_configure_prepend() {
-    sed 's:AM_CHECK_PYMOD:echo "no pymod" #AM_CHECK_PYMOD:g' -i ${S}/configure.ac
-
     # This m4 file will get in the way of our introspection.m4 with special cross-compilation fixes
     rm "${S}/common/introspection.m4" || true
 }
@@ -85,12 +89,6 @@ FILES_libavahi-compat-libdnssd = "${libdir}/libdns_sd.so.*"
 
 RPROVIDES_libavahi-compat-libdnssd = "libdns-sd"
 
-SRC_URI += "file://00avahi-autoipd \
-           file://99avahi-autoipd \
-           file://initscript.patch \
-           file://0001-Fix-opening-etc-resolv.conf-error.patch \
-           "
-
 inherit update-rc.d systemd useradd
 
 PACKAGES =+ "libavahi-gobject avahi-daemon libavahi-common libavahi-core libavahi-client avahi-dnsconfd libavahi-glib avahi-autoipd avahi-utils avahi-discover avahi-ui"
diff --git a/meta/recipes-connectivity/avahi/files/fix-CVE-2017-6519.patch b/meta/recipes-connectivity/avahi/files/fix-CVE-2017-6519.patch
deleted file mode 100644
index 7461fe193d..0000000000
--- a/meta/recipes-connectivity/avahi/files/fix-CVE-2017-6519.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-Upstream-Status: Backport [https://github.com/lathiat/avahi/commit/e111def]
-
-CVE: CVE-2017-6519
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
-
-From e111def44a7df4624a4aa3f85fe98054bffb6b4f Mon Sep 17 00:00:00 2001
-From: Trent Lloyd <trent@lloyd.id.au>
-Date: Sat, 22 Dec 2018 09:06:07 +0800
-Subject: [PATCH] Drop legacy unicast queries from address not on local link
-
-When handling legacy unicast queries, ensure that the source IP is
-inside a subnet on the local link, otherwise drop the packet.
-
-Fixes #145
-Fixes #203
-CVE-2017-6519
-CVE-2018-1000845
----
- avahi-core/server.c | 8 ++++++++
- 1 file changed, 8 insertions(+)
-
-diff --git a/avahi-core/server.c b/avahi-core/server.c
-index a2cb19a8..a2580e38 100644
---- a/avahi-core/server.c
-+++ b/avahi-core/server.c
-@@ -930,6 +930,7 @@ static void dispatch_packet(AvahiServer *s, AvahiDnsPacket *p, const AvahiAddres
- 
-     if (avahi_dns_packet_is_query(p)) {
-         int legacy_unicast = 0;
-+        char t[AVAHI_ADDRESS_STR_MAX];
- 
-         /* For queries EDNS0 might allow ARCOUNT != 0. We ignore the
-          * AR section completely here, so far. Until the day we add
-@@ -947,6 +948,13 @@ static void dispatch_packet(AvahiServer *s, AvahiDnsPacket *p, const AvahiAddres
-             legacy_unicast = 1;
-         }
- 
-+        if (!is_mdns_mcast_address(dst_address) &&
-+            !avahi_interface_address_on_link(i, src_address)) {
-+
-+            avahi_log_debug("Received non-local unicast query from host %s on interface '%s.%i'.", avahi_address_snprint(t, sizeof(t), src_address), i->hardware->name, i->protocol);
-+            return;
-+        }
-+
-         if (legacy_unicast)
-             reflect_legacy_unicast_query_packet(s, p, i, src_address, port);
- 
-- 
2.26.1

