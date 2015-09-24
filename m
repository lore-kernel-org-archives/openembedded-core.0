Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4ACDF74242
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Sep 2015 11:04:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t8OB4r4U013520
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Sep 2015 04:04:53 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.235.1;
	Thu, 24 Sep 2015 04:04:53 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 24 Sep 2015 07:04:51 -0400
Message-ID: <1443092691-216216-1-git-send-email-wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] glib-2.0: cleanup buildpaths from pkgconfig files
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
X-List-Received-Date: Thu, 24 Sep 2015 11:04:58 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

* gio-2.0.pc:
  -L/path/to/tmp/sysroots/qemux86-64/lib64 -> -L/lib64

* gobject-2.0.pc:
  -L/path/to/tmp/sysroots/qemux86-64/usr/lib64/../lib64
    -> -L/usr/lib64/../lib64

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 meta/recipes-core/glib-2.0/glib.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 072f790..4ccdb93 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -75,6 +75,12 @@ do_install_append () {
 	fi
 }
 
+do_install_append_class-target() {
+	# cleanup buildpaths from gio-2.0.pc, gobject-2.0.pc
+	sed -i -e 's#${STAGING_DIR_HOST}##g' ${D}${libdir}/pkgconfig/gio-2.0.pc
+	sed -i -e 's#${STAGING_DIR_HOST}##g' ${D}${libdir}/pkgconfig/gobject-2.0.pc
+}
+
 RDEPENDS_${PN}-ptest += "\
             gnome-desktop-testing \
             tzdata \
-- 
1.9.1


