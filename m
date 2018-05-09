Return-Path: <prvs=46671b9c34=haris.okanovic@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id B142A74912
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 May 2018 15:00:08 +0000 (UTC)
Received: from pps.filterd (m0098781.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
	w49Es77a031490; Wed, 9 May 2018 10:00:08 -0500
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mx0a-00010702.pphosted.com with ESMTP id 2hsa22mwte-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Wed, 09 May 2018 10:00:08 -0500
Received: from us-aus-exhub1.ni.corp.natinst.com
	(us-aus-exhub1.ni.corp.natinst.com [130.164.68.41])
	by us-aus-skprod3.natinst.com (8.16.0.22/8.16.0.22) with ESMTPS id
	w49F07vm022944
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Wed, 9 May 2018 10:00:07 -0500
Received: from us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) by
	us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Wed, 9 May 2018 10:00:06 -0500
Received: from harisdt.amer.corp.natinst.com (130.164.49.7) by
	us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) with Microsoft SMTP
	Server
	id 15.0.1156.6 via Frontend Transport; Wed, 9 May 2018 10:00:06 -0500
From: Haris Okanovic <haris.okanovic@ni.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 9 May 2018 09:59:58 -0500
Message-ID: <20180509145958.22528-1-haris.okanovic@ni.com>
X-Mailer: git-send-email 2.16.3
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2018-05-09_06:, , signatures=0
X-Proofpoint-Spam-Reason: safe
Cc: haris.okanovic@ni.com, ken.sharp@ni.com
Subject: [PATCH] depmodwrapper-cross: Add kmod-native to DEPENDS
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
X-List-Received-Date: Wed, 09 May 2018 15:00:08 -0000
Content-Type: text/plain

Add `DEPENDS += "kmod-native"` to ensure depmod utility is added to
recipe-sysroot-native during image build.

Without this dependency, image builds where BUILD_IMAGES_FROM_FEEDS=1
have depmodwrapper in recipe-sysroot-native but are missing depmod.
Kernel postinst scripts rely on depmod (via depmodwrapper) to index
newly installed modules.

Signed-off-by: Haris Okanovic <haris.okanovic@ni.com>
---
 meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb b/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
index 48f012918a..9a172675af 100644
--- a/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
+++ b/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
@@ -11,6 +11,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 SSTATE_SCAN_FILES += "depmodwrapper"
 EXTRA_STAGING_FIXMES += "PKGDATA_DIR"
 
+DEPENDS += "kmod-native"
 do_populate_sysroot[depends] = ""
 
 do_install() {
-- 
2.16.3


