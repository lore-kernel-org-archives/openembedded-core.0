Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 9D9616E85F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Mar 2014 13:58:16 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s2ODwBQq028471 for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Mar 2014 13:58:11 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id K20p6ltiH8OY
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Mar 2014 13:58:11 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s2ODw7Na028462
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Mar 2014 13:58:08 GMT
Message-ID: <1395669481.24232.59.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 24 Mar 2014 13:58:01 +0000
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] glib-2.0-native: Fix DEPENDS
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
X-List-Received-Date: Mon, 24 Mar 2014 13:58:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Address the error

| checking for ZLIB... no
| checking for inflate in -lz... no
| configure: error: *** Working zlib library and headers not found ***

by ensuring zlib-native is in DEPENDS.

[YOCTO #5773]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 33d30c1..cb07665 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -17,7 +17,7 @@ BBCLASSEXTEND = "native nativesdk"
 
 DEPENDS = "glib-2.0-native virtual/libiconv libffi zlib"
 DEPENDS_append_class-target = "${@base_contains('DISTRO_FEATURES', 'ptest', ' dbus', '', d)}"
-DEPENDS_class-native = "pkgconfig-native gettext-native libffi-native"
+DEPENDS_class-native = "pkgconfig-native gettext-native libffi-native zlib-native"
 DEPENDS_class-nativesdk = "nativesdk-libtool nativesdk-libffi nativesdk-zlib ${BPN}-native"
 
 PACKAGES =+ "${PN}-utils ${PN}-bash-completion ${PN}-codegen"



