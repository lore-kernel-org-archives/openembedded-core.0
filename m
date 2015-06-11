Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id CF856758E6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jun 2015 22:03:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t5BM3i4d001387 for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jun 2015 23:03:44 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id O2xNfmMNN1Kt
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jun 2015 23:03:44 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t5BM3Sj1001384
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jun 2015 23:03:40 +0100
Message-ID: <1434060208.28975.242.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 11 Jun 2015 23:03:28 +0100
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: [PATCH] wayland: Fix hardlink corruption issue
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
X-List-Received-Date: Thu, 11 Jun 2015 22:03:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The way this code was working, the m4 file is hardlinked to the 
copies which would be packaged and could lead to the native m4
file being used in the target packages.

By removing the file first the hardlink is broken and this avoids
corruption (since cp uses open to change the file contents).

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-graphics/wayland/wayland_1.6.0.bb b/meta/recipes-graphics/wayland/wayland_1.6.0.bb
index 00713bf..6413a0a 100644
--- a/meta/recipes-graphics/wayland/wayland_1.6.0.bb
+++ b/meta/recipes-graphics/wayland/wayland_1.6.0.bb
@@ -36,5 +36,6 @@ do_install_append_class-native() {
 }
 
 sysroot_stage_all_append_class-target () {
+	rm ${SYSROOT_DESTDIR}/${datadir}/aclocal/wayland-scanner.m4
 	cp ${STAGING_DATADIR_NATIVE}/aclocal/wayland-scanner.m4 ${SYSROOT_DESTDIR}/${datadir}/aclocal/
 }



