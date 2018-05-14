Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D3C1D770FA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 May 2018 05:57:54 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w4E5vuKC017866
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 May 2018 22:57:56 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Sun, 13 May 2018 22:57:55 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 14 May 2018 13:59:23 +0800
Message-ID: <658c7611718e2a71ceee96abee46ae15d4092f5e.1526277424.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1526277424.git.Qi.Chen@windriver.com>
References: <cover.1526277424.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/6] dbus: upgrade to 1.12.8
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
X-List-Received-Date: Mon, 14 May 2018 05:57:55 -0000
Content-Type: text/plain

Remove instrospection related tweaks as dbus-glib no longer needs
this xml file.

Remove the installation of session.conf. This file is installed into
recipe-sysroot-native directory, which makes no sense.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/dbus/{dbus_1.12.2.bb => dbus_1.12.8.bb} | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)
 rename meta/recipes-core/dbus/{dbus_1.12.2.bb => dbus_1.12.8.bb} (92%)

diff --git a/meta/recipes-core/dbus/dbus_1.12.2.bb b/meta/recipes-core/dbus/dbus_1.12.8.bb
similarity index 92%
rename from meta/recipes-core/dbus/dbus_1.12.2.bb
rename to meta/recipes-core/dbus/dbus_1.12.8.bb
index fb5b69a..b3ddaaf 100644
--- a/meta/recipes-core/dbus/dbus_1.12.2.bb
+++ b/meta/recipes-core/dbus/dbus_1.12.8.bb
@@ -18,8 +18,8 @@ SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
            file://clear-guid_from_server-if-send_negotiate_unix_f.patch \
 "
 
-SRC_URI[md5sum] = "3361456cadb99aa6601bed5b48964254"
-SRC_URI[sha256sum] = "272bb5091770b047c8188b926d5e6038fa4fe6745488b2add96b23e2d9a83d88"
+SRC_URI[md5sum] = "2764bf150e5aa8005b7bc0d6c388756a"
+SRC_URI[sha256sum] = "e2dc99e7338303393b6663a98320aba6a63421bcdaaf571c8022f815e5896eb3"
 
 inherit useradd autotools pkgconfig gettext update-rc.d upstream-version-is-even
 
@@ -153,14 +153,6 @@ do_install() {
 do_install_class-native() {
 	autotools_do_install
 
-	# for dbus-glib-native introspection generation
-	install -d ${D}${STAGING_DATADIR_NATIVE}/dbus/
-	# N.B. is below install actually required?
-	install -m 0644 bus/session.conf ${D}${STAGING_DATADIR_NATIVE}/dbus/session.conf
-
-	# dbus-glib-native and dbus-glib need this xml file
-	./bus/dbus-daemon --introspect > ${D}${STAGING_DATADIR_NATIVE}/dbus/dbus-bus-introspect.xml
-	
 	# dbus-launch has no X support so lets not install it in case the host
 	# has a more featured and useful version
 	rm -f ${D}${bindir}/dbus-launch
-- 
1.9.1


