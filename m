Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0175473AB8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2015 08:35:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t2B8Zjwo014626
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2015 01:35:45 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 11 Mar 2015 01:35:44 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 11 Mar 2015 01:35:41 -0700
Message-ID: <6b956e0a77a5606b750977917a80eb6428d3dc36.1426062917.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1426062917.git.liezhi.yang@windriver.com>
References: <cover.1426062917.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] pixbufcache.bbclass: add harfbuzz-native to PIXBUFCACHE_SYSROOT_DEP
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
X-List-Received-Date: Wed, 11 Mar 2015 08:35:44 -0000
Content-Type: text/plain

Fixed:
DEBUG: Executing shell function pixbufcache_sstate_postinst
g_module_open() failed for sysroots/x86_64-linux/usr/lib/gdk-pixbuf-2.0/2.10.0/loaders/libpixbufloader-svg.so: libharfbuzz.so.0: cannot open shared object file: No such file or directory

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/pixbufcache.bbclass |    7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/classes/pixbufcache.bbclass b/meta/classes/pixbufcache.bbclass
index b8d75bd..9e6ecc8 100644
--- a/meta/classes/pixbufcache.bbclass
+++ b/meta/classes/pixbufcache.bbclass
@@ -67,6 +67,11 @@ pixbufcache_sstate_postinst() {
 # Packages that use this class should extend this variable with their runtime
 # dependencies.
 PIXBUFCACHE_SYSROOT_DEPS = ""
-PIXBUFCACHE_SYSROOT_DEPS_class-native = "${@['gdk-pixbuf-native:do_populate_sysroot_setscene', '']['${BPN}' == 'gdk-pixbuf']} glib-2.0-native:do_populate_sysroot_setscene libffi-native:do_populate_sysroot_setscene libpng-native:do_populate_sysroot_setscene zlib-native:do_populate_sysroot_setscene"
+PIXBUFCACHE_SYSROOT_DEPS_class-native = "\
+    ${@['gdk-pixbuf-native:do_populate_sysroot_setscene', '']['${BPN}' == 'gdk-pixbuf']} \
+    glib-2.0-native:do_populate_sysroot_setscene libffi-native:do_populate_sysroot_setscene \
+    libpng-native:do_populate_sysroot_setscene zlib-native:do_populate_sysroot_setscene \
+    harfbuzz-native:do_populate_sysroot_setscene \
+    "
 do_populate_sysroot_setscene[depends] += "${PIXBUFCACHE_SYSROOT_DEPS}"
 do_populate_sysroot[depends] += "${@d.getVar('PIXBUFCACHE_SYSROOT_DEPS', True).replace('_setscene','')}"
-- 
1.7.9.5


