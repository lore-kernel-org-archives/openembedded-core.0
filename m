Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.2217.1592594910198039793
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jun 2020 12:28:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: ovidiu.panait@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 05JJRwlN030867
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2020 12:28:19 -0700
Received: from otp-linux01.wrs.com (128.224.126.17) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.40) with Microsoft SMTP Server id 14.3.487.0; Fri, 19 Jun 2020
 12:27:53 -0700
From: "Ovidiu Panait" <ovidiu.panait@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/2] dbus-test: Remove EXTRA_OECONF_X configs
Date: Fri, 19 Jun 2020 22:25:49 +0300
Message-ID: <20200619192550.12379-1-ovidiu.panait@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

X specific configs are already handled through PACKAGECONFIG:
PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd x11', d)}"
...
PACKAGECONFIG[x11] = "--with-x --enable-x11-autolaunch,--without-x
                      --disable-x11-autolaunch, virtual/libx11 libsm"

Remove duplicated EXTRA_OECONF_X args.

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
---
 meta/recipes-core/dbus/dbus-test_1.12.18.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus-test_1.12.18.bb b/meta/recipes-core/dbus/dbus-test_1.12.18.bb
index 0063dcce67..68fcdc847f 100644
--- a/meta/recipes-core/dbus/dbus-test_1.12.18.bb
+++ b/meta/recipes-core/dbus/dbus-test_1.12.18.bb
@@ -24,9 +24,6 @@ FILESEXTRAPATHS =. "${FILE_DIRNAME}/dbus:"
 
 inherit autotools pkgconfig gettext ptest upstream-version-is-even
 
-EXTRA_OECONF_X = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '--with-x', '--without-x', d)}"
-EXTRA_OECONF_X_class-native = "--without-x"
-
 EXTRA_OECONF = "--enable-tests \
                 --enable-modular-tests \
                 --enable-installed-tests \
@@ -37,7 +34,6 @@ EXTRA_OECONF = "--enable-tests \
                 --disable-doxygen-docs \
                 --disable-libaudit \
                 --with-dbus-test-dir=${PTEST_PATH} \
-                ${EXTRA_OECONF_X} \
                 --enable-embedded-tests \
              "
 
-- 
2.17.1

