Received: from mail-iy0-f171.google.com ([209.85.210.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QqJAg-00017D-7J
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Aug 2011 08:18:42 +0200
Received: by iyf13 with SMTP id 13so10283699iyf.16
	for <openembedded-core@lists.openembedded.org>;
	Sun, 07 Aug 2011 23:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=39U7W15+SNpGCgSCHe7q6wfGzH5hssqTSiSTSJ/q4Cc=;
	b=bR6NpXevwc50YsIxKbB7ded/xgToY1etsR3O2Nm+Ol4Cz6tRKBJkAHCDFvs0XVamsS
	zaWR6ZrUf5bSw1e83hbgMwl/S1Zv/37lFDE14eOSnOYbHTblrAwALbNVI06ebWuOS4M1
	F9qWahwKF0Df4kICrmH7DLPYuErJLqqoONzYc=
Received: by 10.42.146.129 with SMTP id j1mr5250010icv.173.1312784053743;
	Sun, 07 Aug 2011 23:14:13 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id n14sm1596913ibi.22.2011.08.07.23.14.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 07 Aug 2011 23:14:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  7 Aug 2011 23:14:02 -0700
Message-Id: <1312784043-3081-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 1/2] shared-mime-info, avahi, polkit: inherit perlnative
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
X-List-Received-Date: Mon, 08 Aug 2011 06:18:42 -0000

Otherwise we end up with configure errors like below

| checking for perl... /usr/bin/perl
| checking for perl >= 5.8.1... 5.12.4
| checking for XML::Parser... configure: error: XML::Parser perl module is required for intltool
| + bbfatal 'oe_runconf failed'
| + echo 'ERROR: oe_runconf failed'
| ERROR: oe_runconf failed

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-connectivity/avahi/avahi.inc          |    2 +-
 meta/recipes-connectivity/avahi/avahi_0.6.30.bb    |    2 +-
 meta/recipes-extended/polkit/polkit_0.101.bb       |    4 ++--
 .../shared-mime-info/shared-mime-info.inc          |    2 +-
 .../shared-mime-info/shared-mime-info_0.90.bb      |    2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-connectivity/avahi/avahi.inc b/meta/recipes-connectivity/avahi/avahi.inc
index dc7a5ae..5695403 100644
--- a/meta/recipes-connectivity/avahi/avahi.inc
+++ b/meta/recipes-connectivity/avahi/avahi.inc
@@ -21,7 +21,7 @@ SRC_URI = "http://avahi.org/download/avahi-${PV}.tar.gz \
           file://99avahi-autoipd \
           file://initscript.patch"
 
-inherit autotools pkgconfig update-rc.d gettext
+inherit autotools pkgconfig update-rc.d gettext perlnative
 
 EXTRA_OECONF = "--with-distro=debian \
              --with-avahi-priv-access-group=adm \
diff --git a/meta/recipes-connectivity/avahi/avahi_0.6.30.bb b/meta/recipes-connectivity/avahi/avahi_0.6.30.bb
index 05716d0..da40426 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.6.30.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.6.30.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2d5025d4aa3495befef8f17206a5b0a1 \
                     file://avahi-daemon/main.c;endline=21;md5=9ee77368c5407af77caaef1b07285969 \
                     file://avahi-client/client.h;endline=23;md5=f4ac741a25c4f434039ba3e18c8674cf"
 
-PR = "r4"
+PR = "r5"
 
 SRC_URI[md5sum] = "e4db89a2a403ff4c47d66ac66fad1f43"
 SRC_URI[sha256sum] = "f9e4316c2339d0020726edd846d01bee0c39980906db0c247479e5807457ff1f"
diff --git a/meta/recipes-extended/polkit/polkit_0.101.bb b/meta/recipes-extended/polkit/polkit_0.101.bb
index 06ca595..1dde885 100644
--- a/meta/recipes-extended/polkit/polkit_0.101.bb
+++ b/meta/recipes-extended/polkit/polkit_0.101.bb
@@ -11,12 +11,12 @@ SRC_URI = "http://hal.freedesktop.org/releases/polkit-${PV}.tar.gz \
            ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)}"
 
 PAM_SRC_URI = "file://polkit-1_pam.patch"
-PR = "r1"
+PR = "r2"
 DEPENDS = "libpam expat dbus-glib eggdbus intltool-native"
 RDEPENDS_${PN} = "libpam"
 EXTRA_OECONF = "--with-authfw=pam --with-os-type=moblin --disable-man-pages --disable-gtk-doc --disable-introspection"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig perlnative
 
 FILES_${PN} += "${libdir}/${PN}-1/extensions/*.so \
                 ${datadir}/${PN}-1/actions/* \
diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info.inc b/meta/recipes-support/shared-mime-info/shared-mime-info.inc
index 64eef9d..8b10535 100644
--- a/meta/recipes-support/shared-mime-info/shared-mime-info.inc
+++ b/meta/recipes-support/shared-mime-info/shared-mime-info.inc
@@ -10,7 +10,7 @@ DEPENDS_virtclass-native = "libxml2-native intltool-native glib-2.0-native"
 
 SRC_URI = "http://freedesktop.org/~hadess/shared-mime-info-${PV}.tar.bz2"
 
-inherit autotools pkgconfig gettext
+inherit autotools pkgconfig gettext perlnative
 
 EXTRA_OECONF = "--disable-update-mimedb"
 
diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info_0.90.bb b/meta/recipes-support/shared-mime-info/shared-mime-info_0.90.bb
index cbbd0fe..4c852fa 100644
--- a/meta/recipes-support/shared-mime-info/shared-mime-info_0.90.bb
+++ b/meta/recipes-support/shared-mime-info/shared-mime-info_0.90.bb
@@ -1,5 +1,5 @@
 require shared-mime-info.inc
-PR = "r0"
+PR = "r1"
 
 SRC_URI += "file://fix-parallel-build.patch \
             file://fix-parallel-build-backport.patch \
-- 
1.7.5.4



