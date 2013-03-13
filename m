Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1UFhjJ-0002vh-K6
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Mar 2013 10:12:23 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r2D8tW9Z012466
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Mar 2013 01:55:32 -0700 (PDT)
Received: from pek-usp-3.wrs.com (128.224.163.124) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 13 Mar 2013 01:55:32 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 13 Mar 2013 16:58:21 +0800
Message-ID: <055756a16301a9a8d41701c48d30cf4bddc44617.1363154328.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.11.2
In-Reply-To: <cover.1363154328.git.liezhi.yang@windriver.com>
References: <cover.1363154328.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: qingtao.cao@windriver.com
Subject: [PATCH 1/1] cairo: add libpng to EXTRA_libcairo_la_DEPENDENCIES
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Mar 2013 09:12:26 -0000
Content-Type: text/plain

There is a build error when I update the git repo and build again:

x86_64-linux-libtool: link: cannot find the library `/path/to/sysroots/x86_64-linux/usr/lib/libpng15.la' or ...

This because libpng was 1.5 before I update the git repo, and it
is 1.6 now, libpng's include dir and lib dir are special, they are:

/usr/include/libpngXX/png.h
/usr/lib/libpngXX.la

The XX is the version, e.g, libpng15.la, cairo doesn't handle this
depends well, the configure finds that the lbpng is 1.6 after the
update, but it doesn't rebuild libcairo.la since this depends isn't in
the Makefile, it should have a file like cairo.def (cairo has this file,
but it is only used for windows) to record this dependency.  Add
libpng's includedir to EXTRA_libcairo_la_DEPENDENCIES as a quick fix.

[YOCTO #4002]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-graphics/cairo/cairo_1.12.14.bb | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/meta/recipes-graphics/cairo/cairo_1.12.14.bb b/meta/recipes-graphics/cairo/cairo_1.12.14.bb
index 16f9d7b..857cfa6 100644
--- a/meta/recipes-graphics/cairo/cairo_1.12.14.bb
+++ b/meta/recipes-graphics/cairo/cairo_1.12.14.bb
@@ -38,6 +38,19 @@ FILES_cairo-gobject = "${libdir}/libcairo-gobject.so.*"
 FILES_cairo-script-interpreter = "${libdir}/libcairo-script-interpreter.so.*"
 FILES_cairo-perf-utils = "${bindir}/cairo-trace ${libdir}/cairo/libcairo-trace.so.*"
 
+do_compile() {
+	# The libpng's include is special, it is usually
+	# usr/include/libpngXX, the XX is the version number, add it to
+	# libcairo.la's dependencies so that libcairo.la can be rebuilt
+	# when libpng upgrades.
+	if [ "${PN}" = "cairo-native" ]; then
+		libpng_DEPS="`pkg-config libpng --variable=includedir`"
+	else
+		libpng_DEPS="${STAGING_DIR_HOST}`pkg-config libpng --variable=includedir`"
+	fi
+	oe_runmake EXTRA_libcairo_la_DEPENDENCIES="$libpng_DEPS"
+}
+
 do_install_append () {
 	rm -rf ${D}${bindir}/cairo-sphinx
 	rm -rf ${D}${libdir}/cairo/cairo-fdr*
-- 
1.7.11.2



