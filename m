Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id C43FC60125
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Mar 2019 00:37:05 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id w2so63909wrt.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Mar 2019 17:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=OMHZNOPSoFJlOOeZUo+qZ/nva0o207ySzgQ/0Ar0NGs=;
	b=JxW2pF4/IA09b+rhknmoSOWRugrLDfHYBxyfHwpFRczGiCfhrGxRZ6P4sxmlrNAb8U
	fJmwYjET1pd0KhYtpRQ47inePSqf6C3ig9HwodCrj3m+d7xNpg1Wb7ypwG6b8uLu6bhJ
	qOP4i59/rl9V27LXuRGWqCXphbWA0Hx+a2980uRH4Vh/d53H3ikMO2HGXVbB4sQNnxtU
	n29CqvIzjXuZTCXQX1mLeDkaEtYNgIeNcjyGSMKl/HZ9aCPuC1HgpWhfIIQZJ6CrThTh
	9ZzBg+6jPaEyKSym8Nkq5/Zg8kx6wK4rxQfUnZU6mY2ZQpCGx+gyBLq2OpxMS7UI7W7z
	voZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=OMHZNOPSoFJlOOeZUo+qZ/nva0o207ySzgQ/0Ar0NGs=;
	b=inVEnLdEL7wsQfofAwr2Sz20AVEibALDNVo1MQDqHA90ywGrirZjg94i+jeUzJhN8D
	AQLrr+hSJ8Requd5OVDRjxgcm5C106rF6T6+0xgmTaefyNXWebyjHwOmn0AzLvPj2yLB
	lO1nMGVM382HImbPiFarxRXuBuomtupItZx3OUduCSHPJVGM6Tp80n5wVzwpJOjsXNaU
	gqWdsaToIX9RohnHJVcdt0g9FvuqZ6EUUZgv2tt5fPetPdwumrt+inV5yoyWJiixCEsw
	yYNV4raawIK0qyMgNcLnI03PTqHVpnSbANPa0v5r2XHqH8ut4RN8g5fkbHQR+pAVRYf0
	VTrg==
X-Gm-Message-State: APjAAAXyodjaVXrwxpo3LlyGkim9S7WRbSJZ+RVNqRcKeiR3WvyWTdro
	w1kINZiFgdbfP6cr3qrUSuy/OGezh9Q=
X-Google-Smtp-Source: APXvYqyYVtPvzF29uC9v8krZTKM/tX+inBgFhx3wMZC3bkACz8Oa7pWeEgJlJOrIYaUmBJv5zJYWMw==
X-Received: by 2002:a5d:468d:: with SMTP id u13mr3006845wrq.132.1552437426310; 
	Tue, 12 Mar 2019 17:37:06 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	d15sm27038571wrw.36.2019.03.12.17.37.05
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Mar 2019 17:37:05 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Mar 2019 00:37:02 +0000
Message-Id: <20190313003702.24328-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] glib-2.0: clean up EXTRA_OEMESON
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
X-List-Received-Date: Wed, 13 Mar 2019 00:37:07 -0000

Instead of spreading the ptest enabling over the recipe, just add a
PACKAGECONFIG to enable the installed tests. Whether this is enabled respects
PTEST_ENABLED by default, so it always disabled in native and nativesdk builds.

This means we can remove the conditional dependency on dbus, all the conditional
enabling of installed tests, and clean up EXTRA_OEMESON.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/glib-2.0/glib.inc | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 3c2440db0e5..6f0ec1ad2e9 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -22,8 +22,7 @@ DEPENDS = "glib-2.0-native \
            virtual/libintl \
            virtual/libiconv \
            libffi \
-           zlib \
-           ${@bb.utils.contains('PTEST_ENABLED', '1', 'dbus', '', d)}"
+           zlib"
 
 PACKAGES += "${PN}-codegen ${PN}-utils"
 
@@ -43,19 +42,17 @@ unset _PYTHON_SYSCONFIGDATA_NAME
 
 S = "${WORKDIR}/glib-${PV}"
 
-PACKAGECONFIG ??= "system-pcre libmount"
+PACKAGECONFIG ??= "system-pcre libmount \
+                   ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
 # To use the system pcre it must be configured with --enable-unicode-properties
 PACKAGECONFIG[system-pcre] = "-Dinternal_pcre=false,-Dinternal_pcre=true,libpcre"
 PACKAGECONFIG[libmount] = "-Dlibmount=true,-Dlibmount=false,util-linux"
 PACKAGECONFIG[manpages] = "-Dman=true, -Dman=false, libxslt-native xmlto-native"
 # libelf is auto-detected without a configuration option
 PACKAGECONFIG[libelf] = ",,elfutils"
+PACKAGECONFIG[tests] = "-Dinstalled_tests=true,-Dinstalled_tests=false,dbus"
 
-CORECONF = "-Ddtrace=false -Dfam=false -Dsystemtap=false -Dselinux=false"
-
-EXTRA_OEMESON = "${CORECONF} ${@bb.utils.contains('PTEST_ENABLED', '1', '-Dinstalled_tests=true', '-Dinstalled_tests=false', d)}"
-EXTRA_OEMESON_class-native = "${CORECONF} -Dinstalled_tests=false"
-EXTRA_OEMESON_class-nativesdk = "${CORECONF} -Dinstalled_tests=false"
+EXTRA_OEMESON = "-Ddtrace=false -Dfam=false -Dsystemtap=false -Dselinux=false"
 
 do_configure_prepend() {
 	sed -i -e '1s,#!.*,#!${USRBINPATH}/env python3,' ${S}/gio/gdbus-2.0/codegen/gdbus-codegen.in
-- 
2.11.0


