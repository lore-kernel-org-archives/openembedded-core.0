Return-Path: <adrian.ratiu@ni.com>
X-Greylist: delayed 2014 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 15 Dec 2016 17:56:19 UTC
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id CD3A8772E9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2016 17:56:19 +0000 (UTC)
Received: from us-aus-exch2.ni.corp.natinst.com
	(us-aus-exch2.ni.corp.natinst.com [130.164.68.12])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTPS id
	uBFHMk4R032213
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2016 11:22:46 -0600
Received: from us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) by
	us-aus-exch2.ni.corp.natinst.com (130.164.68.12) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Thu, 15 Dec 2016 11:22:46 -0600
Received: from adi-pc-linux.natinst.com (130.164.49.7) by
	us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP
	Server
	id 15.0.1156.6 via Frontend Transport; Thu, 15 Dec 2016 11:22:45 -0600
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 15 Dec 2016 19:20:59 +0200
Message-ID: <20161215172059.17115-1-adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.10.2
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-12-15_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	suspectscore=1
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
	definitions=main-1612150263
Subject: [PATCH] grub: split grub-editenv in both grub and grub-efi
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
X-List-Received-Date: Thu, 15 Dec 2016 17:56:21 -0000
Content-Type: text/plain

We also need to split grub-editenv in grub-efi not just in grub, so move
the logic from grub_2.00.bb to the .inc file where it's inherited by both.

(grub-editenv is useful for editing the grub environment at runtime)

Doing this also reduces packaging differences between grub and grub-efi.

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 meta/recipes-bsp/grub/grub2.inc    | 6 ++++++
 meta/recipes-bsp/grub/grub_2.00.bb | 6 +-----
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index b69de9f..b8a2bb2 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -71,3 +71,9 @@ do_configure_prepend() {
 # grub and grub-efi's sysroot/${datadir}/grub/grub-mkconfig_lib are
 # conflicted, remove it since no one uses it.
 SYSROOT_DIRS_BLACKLIST += "${datadir}/grub/grub-mkconfig_lib"
+
+RDEPENDS_${PN} = "grub-editenv"
+
+PACKAGES =+ "grub-editenv"
+
+FILES_grub-editenv = "${bindir}/grub-editenv"
diff --git a/meta/recipes-bsp/grub/grub_2.00.bb b/meta/recipes-bsp/grub/grub_2.00.bb
index 07e1d10..778074a 100644
--- a/meta/recipes-bsp/grub/grub_2.00.bb
+++ b/meta/recipes-bsp/grub/grub_2.00.bb
@@ -1,6 +1,6 @@
 require grub2.inc
 
-RDEPENDS_${PN} = "diffutils freetype grub-editenv"
+RDEPENDS_${PN} = "diffutils freetype"
 PR = "r1"
 
 EXTRA_OECONF = "--with-platform=pc --disable-grub-mkfont --program-prefix="" \
@@ -8,10 +8,6 @@ EXTRA_OECONF = "--with-platform=pc --disable-grub-mkfont --program-prefix="" \
 
 EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'largefile', '--enable-largefile', '--disable-largefile', d)}"
 
-PACKAGES =+ "grub-editenv"
-
-FILES_grub-editenv = "${bindir}/grub-editenv"
-
 do_install_append () {
     install -d ${D}${sysconfdir}/grub.d
 }
-- 
2.10.2


