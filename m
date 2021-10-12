X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Zoltan Boszormenyi" <zboszor@pr.hu>
Subject: [PATCH] libpam: Fix build with DISTRO_FEATURES usrmerge
Date: Tue, 12 Oct 2021 13:17:26 +0200
Message-Id: <20211012111726.493810-1-zboszor@pr.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>

From: Zoltán Böszörményi <zboszor@gmail.com>

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/recipes-extended/pam/libpam_1.5.2.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/pam/libpam_1.5.2.bb b/meta/recipes-extended/pam/libpam_1.5.2.bb
index a3c4a50cb3..ee3a84a3b6 100644
--- a/meta/recipes-extended/pam/libpam_1.5.2.bb
+++ b/meta/recipes-extended/pam/libpam_1.5.2.bb
@@ -147,8 +147,10 @@ do_install() {
 	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
 		echo "session optional pam_systemd.so" >> ${D}${sysconfdir}/pam.d/common-session
 	fi
-        install -d ${D}/${libdir}/
-	mv ${D}/${base_libdir}/pkgconfig ${D}/${libdir}/
+	if ${@bb.utils.contains('DISTRO_FEATURES','usrmerge','false','true',d)}; then
+		install -d ${D}/${libdir}/
+		mv ${D}/${base_libdir}/pkgconfig ${D}/${libdir}/
+	fi
 }
 
 do_install_ptest() {
-- 
2.31.1

