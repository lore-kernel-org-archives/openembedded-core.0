Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CD93D713A5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Nov 2014 10:52:15 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sABAqEo6017636
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 11 Nov 2014 02:52:15 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 11 Nov 2014 02:52:14 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Tue, 11 Nov 2014 18:52:05 +0800
Message-ID: <c64f74580ae6c165ea9f989c05898c2b0127e2e5.1415699201.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1415699201.git.hongxu.jia@windriver.com>
References: <cover.1415699201.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] postinst-intercept: rename recipe for nativesdk only
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
X-List-Received-Date: Tue, 11 Nov 2014 10:52:16 -0000
Content-Type: text/plain

The recipe postinst-intercept is only used for nativesdk, so we rename
it from postinst-intercept to nativesdk-postinst-intercept.

It avoids unnecessary build of postinst-intercept.

[YOCTO #6937]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...ostinst-intercept_1.0.bb => nativesdk-postinst-intercept_1.0.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/postinst-intercept/{postinst-intercept_1.0.bb => nativesdk-postinst-intercept_1.0.bb} (83%)

diff --git a/meta/recipes-devtools/postinst-intercept/postinst-intercept_1.0.bb b/meta/recipes-devtools/postinst-intercept/nativesdk-postinst-intercept_1.0.bb
similarity index 83%
rename from meta/recipes-devtools/postinst-intercept/postinst-intercept_1.0.bb
rename to meta/recipes-devtools/postinst-intercept/nativesdk-postinst-intercept_1.0.bb
index 41b9a6e..7dc45c6 100644
--- a/meta/recipes-devtools/postinst-intercept/postinst-intercept_1.0.bb
+++ b/meta/recipes-devtools/postinst-intercept/nativesdk-postinst-intercept_1.0.bb
@@ -2,12 +2,12 @@ SUMMARY = "Postinstall scriptlets"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
-FILES_${PN}_append_class-nativesdk = " ${datadir}/postinst-intercepts/*"
+FILES_${PN}_append = " ${datadir}/postinst-intercepts/*"
 
 do_configure[noexec] = "1"
 do_compile[noexec] = "1"
 
-do_install_append_class-nativesdk() {
+do_install() {
 	install -d ${D}${datadir}/postinst-intercepts
 	install -m 755 ${COREBASE}/scripts/postinst-intercepts/postinst_intercept ${D}${datadir}/postinst-intercepts/
 	install -m 755 ${COREBASE}/scripts/postinst-intercepts/update_font_cache ${D}${datadir}/postinst-intercepts/
@@ -15,5 +15,5 @@ do_install_append_class-nativesdk() {
 	install -m 755 ${COREBASE}/scripts/postinst-intercepts/update_pixbuf_cache ${D}${datadir}/postinst-intercepts/
 }
 
-BBCLASSEXTEND = "nativesdk"
+inherit nativesdk
 INHIBIT_DEFAULT_DEPS = "1"
-- 
1.9.1


