Received: from mail-we0-f173.google.com ([74.125.82.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UNnx8-0000dy-LG
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Apr 2013 19:28:00 +0200
Received: by mail-we0-f173.google.com with SMTP id t57so2207513wey.18
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Apr 2013 10:10:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=+xHvN1UGvXb2z+NuwJ0A/dHPfDo7/KV2q44rjXYYXGo=;
	b=W/K6RQ9QJArNMUVBO6lvyAY0RAaq8xHoAfXsIsj0dREfxWgt3IoeuNWipRHc9dM3lA
	txJ7n/XZlB6mrFUs3ixGMDgFIOAoSEQg511gfOa5UUlYmw32f0WBGb79nQvpQheG4mO9
	ty6yyunuuW2lGyj7Ma5AYwpbTuGev1wyS6PUsA8msfnZ641rIEsbN5cPwsaMQX05IddE
	+0bXXynscQmcq77KaocjCKw2DQcsFh5oJV8JX4nHVRrW3ssghxatRtnr3zWEVjhaN0u8
	vzrYy6BGosn+MVqOk+OSWdwvp63dnRYViXpiuBcxaxfRiq5gELc5/eVRq9mbQOxpuqLW
	FHHQ==
X-Received: by 10.180.185.239 with SMTP id ff15mr30961469wic.2.1365095445538; 
	Thu, 04 Apr 2013 10:10:45 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id fv2sm17439788wib.6.2013.04.04.10.10.44
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 04 Apr 2013 10:10:44 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Apr 2013 18:07:59 +0100
Message-Id: <1365095280-13550-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQlcavvaCsqyPsCMktkIj7IgwMMprC/MCyiiHnmQ5LK6m8HB3glvcvR/TRCbb5AlWCu9zbKI
Subject: [PATCH 1/2] liberation-fonts: remove 1.06
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
X-List-Received-Date: Thu, 04 Apr 2013 17:28:07 -0000

1.06 requires fontforge-native to build, which as we don't have this version has
never been used.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../ttf-fonts/liberation-fonts_1.06.bb             |   45 --------------------
 1 file changed, 45 deletions(-)
 delete mode 100644 meta/recipes-graphics/ttf-fonts/liberation-fonts_1.06.bb

diff --git a/meta/recipes-graphics/ttf-fonts/liberation-fonts_1.06.bb b/meta/recipes-graphics/ttf-fonts/liberation-fonts_1.06.bb
deleted file mode 100644
index 6391f51..0000000
--- a/meta/recipes-graphics/ttf-fonts/liberation-fonts_1.06.bb
+++ /dev/null
@@ -1,45 +0,0 @@
-SUMMARY = "Liberation(tm) Fonts"
-DESCRIPTION = "The Liberation(tm) Fonts is a font family originally \
-created by Ascender(c) which aims at metric compatibility with \
-Arial, Times New Roman, Courier New."
-HOMEPAGE = "https://fedorahosted.org/liberation-fonts/"
-BUGTRACKER = "https://bugzilla.redhat.com/"
-
-SECTION = "x11/fonts"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
-RDEPENDS_${PN} = "fontconfig-utils"
-PE = "1"
-PR = "r3"
-
-FONTREV = "0.20100721"
-SRC_URI = "https://fedorahosted.org/releases/l/i/${BPN}/${BPN}-${PV}.${FONTREV}.tar.gz \
-           file://30-liberation-aliases.conf"
-
-S = "${WORKDIR}/${BPN}-${PV}.${FONTREV}"
-
-inherit allarch
-
-do_install () {
-	install -d ${D}${datadir}/fonts/ttf/
-	for i in *.ttf; do
-		install -m 0644 $i ${D}${prefix}/share/fonts/ttf/${i}
-	done
-
-	install -d ${D}${sysconfdir}/fonts/conf.d/
-	install -m 0644 ${WORKDIR}/30-liberation-aliases.conf ${D}${sysconfdir}/fonts/conf.d/
-
-	install -d ${D}${prefix}/share/doc/${BPN}/
-	install -m 0644 License.txt ${D}${datadir}/doc/${BPN}/
-}
-
-pkg_postinst_${PN} () {
-#!/bin/sh
-if [ "x$D" != "x" ] ; then
-	exit 1
-fi
-fc-cache
-}
-
-PACKAGES = "${PN}"
-FILES_${PN} += "${sysconfdir} ${datadir}"
-- 
1.7.10.4



