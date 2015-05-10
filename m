Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2555A60043
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 May 2015 11:30:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t4ABUUU1027800 for <openembedded-core@lists.openembedded.org>;
	Sun, 10 May 2015 12:30:30 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id CdNUKG3h9JWm
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 May 2015 12:30:30 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t4ABUCsM027794
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 May 2015 12:30:26 +0100
Message-ID: <1431257412.30971.23.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sun, 10 May 2015 12:30:12 +0100
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: [PATCH] dbus: Fix do_install files outside ${D}
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
X-List-Received-Date: Sun, 10 May 2015 11:30:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

do_install should not access the sysroot directly. Add missing ${D}
reference.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index fb5d017..01066cb 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -143,12 +143,12 @@ do_install_class-native() {
 	autotools_do_install
 
 	# for dbus-glib-native introspection generation
-	install -d ${STAGING_DATADIR_NATIVE}/dbus/
+	install -d ${D}${STAGING_DATADIR_NATIVE}/dbus/
 	# N.B. is below install actually required?
-	install -m 0644 bus/session.conf ${STAGING_DATADIR_NATIVE}/dbus/session.conf
+	install -m 0644 bus/session.conf ${D}${STAGING_DATADIR_NATIVE}/dbus/session.conf
 
 	# dbus-glib-native and dbus-glib need this xml file
-	./bus/dbus-daemon --introspect > ${STAGING_DATADIR_NATIVE}/dbus/dbus-bus-introspect.xml
+	./bus/dbus-daemon --introspect > ${D}${STAGING_DATADIR_NATIVE}/dbus/dbus-bus-introspect.xml
 	
 	# dbus-launch has no X support so lets not install it in case the host
 	# has a more featured and useful version



