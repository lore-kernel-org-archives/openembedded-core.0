Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2E000608B7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Sep 2015 22:33:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8NMX010020201 for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Sep 2015 23:33:00 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id U5obxY7YqURw
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Sep 2015 23:33:00 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8NMWjU2020197
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Sep 2015 23:32:56 +0100
Message-ID: <1443047565.19044.44.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 23 Sep 2015 23:32:45 +0100
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Subject: [PATCH] gdk-pixbuf: Avoid rebuild failures
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
X-List-Received-Date: Wed, 23 Sep 2015 22:33:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

If gdkpixbuf-native rebuilds and there are stale (broken) modules lying around,
it can fail to run the postinst. E.g. svg links to harfbuzz and if harfbuzz is
removed from the sysroot but the svg loader isn't, we get a symbol linking issue.

The reproducer is along the lines of build gdk-pixbuf-native along
with harfbuzz-native and librsvg-native, then make a small change to the
gdk-pixbuf recipe that would cause it to rebuild, clean harfbuzz-native
and then build gdk-pixbuf.

To fix this, when we install gdk-pixbuf, we wipe out any previous loaders.
The idea is that gdk would always come first and anything else installing
itself will come later and rerun the postinst if needed. We can therefore
just remove any other loaders.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.8.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.8.bb
index bdf173a..35bb192 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.8.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.8.bb
@@ -94,3 +94,12 @@ do_install_append_class-native() {
 		GDK_PIXBUF_MODULEDIR=${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/${LIBV}/loaders
 }
 BBCLASSEXTEND = "native"
+
+SSTATEPREINSTFUNCS_append_class-native = " gdkpixbuf_sstate_preinst"
+SYSROOT_PREPROCESS_FUNCS_append_class-native = " gdkpixbuf_sstate_preinst"
+
+gdkpixbuf_sstate_preinst() {
+	if [ "${BB_CURRENTTASK}" = "populate_sysroot" -o "${BB_CURRENTTASK}" = "populate_sysroot_setscene" ]; then
+		rm -rf ${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/${LIBV}/*
+	fi
+}



