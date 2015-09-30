Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A4D1A77010
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 08:09:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t8U893tL008825
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 01:09:03 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.235.1;
	Wed, 30 Sep 2015 01:09:02 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 30 Sep 2015 04:08:58 -0400
Message-ID: <bcac24a99fee9f86d5692e7a457e51c41c9208b7.1443600210.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1443600210.git.wenzong.fan@windriver.com>
References: <cover.1443600210.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3 v2] glib-2.0: cleanup buildpaths from pkgconfig files
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
X-List-Received-Date: Wed, 30 Sep 2015 08:09:05 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

For multilib build, PKG_CONFIG_SYSROOT_DIR will be injected in values
that are returned by 'pkg-config --libs xxx', such as for zlib:

  dev-shell# pkg-config --libs zlib
  -L/path/to/tmp/sysroots/qemux86-64/usr/lib64 -lz

The values used by configure to generate various files from templates.

For glib-2.0, the buildpaths should be cleaned up from:

* gio-2.0.pc:
  generated from gio-2.0.pc.in that includes @ZLIB_LIBS@

* gobject-2.0.pc:
  generated from gobject-2.0.pc.in that includes @LIBFFI_LIBS@

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 meta/recipes-core/glib-2.0/glib.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 072f790..fb42eac 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -75,6 +75,12 @@ do_install_append () {
 	fi
 }
 
+do_install_append_class-target() {
+	# cleanup buildpaths from gio-2.0.pc, gobject-2.0.pc
+	sed -i -e 's,${STAGING_DIR_HOST},,g' ${D}${libdir}/pkgconfig/gio-2.0.pc
+	sed -i -e 's,${STAGING_DIR_HOST},,g' ${D}${libdir}/pkgconfig/gobject-2.0.pc
+}
+
 RDEPENDS_${PN}-ptest += "\
             gnome-desktop-testing \
             tzdata \
-- 
1.9.1


