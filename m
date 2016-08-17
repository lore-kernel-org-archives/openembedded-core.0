Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id EDFD370018
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2016 11:53:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u7HBqLtX003056; Wed, 17 Aug 2016 12:53:19 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Yki2XiPr1DoI; Wed, 17 Aug 2016 12:53:18 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u7HBrGBh003122
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 17 Aug 2016 12:53:17 +0100
Message-ID: <1471434796.20391.161.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Aug 2016 12:53:16 +0100
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] gobject-introspection: Ensure prelink config file exists to avoid build failures
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
X-List-Received-Date: Wed, 17 Aug 2016 11:53:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

gobject-introspection relies upon prelink-rtld. In order to function correctly,
we generate an ld.so.conf file which is generated before users of prelink-rtld 
are called.

There is currently a race in gobject-introspection since the configuration file
may not have been created. This adds in code to ensure that regardless of codepath
(new build, existing build, from sstate), we trigger the creation of the configuration
file and avoid build failures.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.48.0.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.48.0.bb
index 6948aff..eca6ce0 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.48.0.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.48.0.bb
@@ -158,3 +158,16 @@ gi_binaries_sysroot_preprocess() {
            -e "s|g_ir_compiler=.*|g_ir_compiler=${bindir}/g-ir-compiler-wrapper|" \
            ${SYSROOT_DESTDIR}${libdir}/pkgconfig/gobject-introspection-1.0.pc
 }
+
+# Need to ensure ld.so.conf exists so prelink-native works
+# both before we build and if we install from sstate
+do_configure[prefuncs] += "gobject_introspection_preconfigure"
+python gobject_introspection_preconfigure () {
+    oe.utils.write_ld_so_conf(d)
+}
+
+SSTATEPOSTINSTFUNCS += "gobject_introspection_postinst"
+python gobject_introspection_postinst () {
+    if d.getVar("BB_CURRENTTASK", True).startswith("populate_sysroot"):
+        oe.utils.write_ld_so_conf(d)
+}



