Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E9C9F71E12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2017 22:53:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0JMrUqa005765; Thu, 19 Jan 2017 22:53:32 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id OTvoPiZs5PJ5; Thu, 19 Jan 2017 22:53:32 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0JMrNQr005652
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 19 Jan 2017 22:53:24 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cULa7-0004hG-J6; Thu, 19 Jan 2017 22:53:23 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jan 2017 22:52:46 +0000
Message-Id: <1484866395-17971-4-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1484866395-17971-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1484866395-17971-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 04/33] gtk-icon-cache: Add PACKAGE_WRITE_DEPS for postinst
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
X-List-Received-Date: Thu, 19 Jan 2017 22:53:37 -0000

gdk-pixbuf-native and gtk-icon-utils-native are needed by the postinstall
scripts so mark the dependency. The utils may be needed at icon build
time too so DEPENDS is unchanged.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/gtk-icon-cache.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/gtk-icon-cache.bbclass b/meta/classes/gtk-icon-cache.bbclass
index c5d8d7c..d87167a 100644
--- a/meta/classes/gtk-icon-cache.bbclass
+++ b/meta/classes/gtk-icon-cache.bbclass
@@ -2,6 +2,8 @@ FILES_${PN} += "${datadir}/icons/hicolor"
 
 DEPENDS += "${@['hicolor-icon-theme', '']['${BPN}' == 'hicolor-icon-theme']} gtk-icon-utils-native"
 
+PACKAGE_WRITE_DEPS += "gtk-icon-utils-native gdk-pixbuf-native"
+
 gtk_icon_cache_postinst() {
 if [ "x$D" != "x" ]; then
 	$INTERCEPT_DIR/postinst_intercept update_icon_cache ${PKG} \
-- 
2.7.4


