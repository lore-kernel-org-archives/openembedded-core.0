Return-Path: <mac@mcrowe.com>
Received: from avasout04.plus.net (avasout04.plus.net [212.159.14.19])
	by mail.openembedded.org (Postfix) with ESMTP id E19377F315
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2019 11:00:40 +0000 (UTC)
Received: from deneb ([80.229.24.9]) by smtp with ESMTP
	id sPrzhPuFPgqhnsPs0hBhec; Tue, 30 Jul 2019 12:00:41 +0100
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=QO4WuTDL c=1 sm=1 tr=0
	a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
	a=0o9FgrsRnhwA:10 a=Q4-j1AaZAAAA:8 a=-An2I_7KAAAA:8
	a=zfsyhjqJE9yDCR_Y3ecA:9
	a=GPveDQdtJCUA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=Sq34B_EcNBM9_nrAYB9S:22
Received: from mac by deneb with local (Exim 4.92)
	(envelope-from <mac@mcrowe.com>)
	id 1hsPry-0006ct-GR; Tue, 30 Jul 2019 12:00:38 +0100
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Jul 2019 12:00:35 +0100
Message-Id: <20190730110035.4806-1-mac@mcrowe.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfL86ckcLYFpmBkOtEACgR6yYP07hhaDd9t/zPBUGZOP3I/iUR//zNvU71iCd8KbA+tREu7nhu667ii/tYkarPYQP7QAu5fA0OScRbfOYEdKzz2x8QIJe
	/7XsALYCCvwHC5stL8PY2aNdFS74a7kzjOkpDxkZYED9JhXbm0gE0fCO
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [PATCH] glib-networking: Support building with USE_NLS=no
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
X-List-Received-Date: Tue, 30 Jul 2019 11:00:41 -0000
Content-Transfer-Encoding: 8bit

As reported in
http://lists.openembedded.org/pipermail/openembedded-core/2019-February/279344.html
, glib-networking no longer configures successfully if USE_NLS="no":

| po/meson.build:1:5: ERROR:  Can not do gettext because xgettext is not installed.

In the current absence of anything better, it seems that this can be
overcome by telling Meson not to look in the po/ directory.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 .../glib-networking/glib-networking_2.60.2.bb          | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/recipes-core/glib-networking/glib-networking_2.60.2.bb b/meta/recipes-core/glib-networking/glib-networking_2.60.2.bb
index 4d4fe64916..fa7fddfe44 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.60.2.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.60.2.bb
@@ -30,3 +30,13 @@ FILES_${PN} += "\
                 "
 FILES_${PN}-dev += "${libdir}/gio/modules/libgio*.la"
 FILES_${PN}-staticdev += "${libdir}/gio/modules/libgio*.a"
+
+# meson lacks support for --disable-nls.
+disable_nls() {
+    sed -i "/subdir('po')/d" ${S}/meson.build
+}
+
+do_unpack_append() {
+    if d.getVar('USE_NLS') == 'no':
+        bb.build.exec_func('disable_nls', d)
+}
-- 
2.20.1


