Return-Path: <prvs=7777a5c19a=alexandru.vasiu@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id 4FC2178EEC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Aug 2018 15:42:46 +0000 (UTC)
Received: from pps.filterd (m0098780.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
	w7REKQr7032587 for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Aug 2018 09:31:16 -0500
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mx0a-00010702.pphosted.com with ESMTP id 2m34mw6gmk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Aug 2018 09:31:15 -0500
Received: from us-aus-exch1.ni.corp.natinst.com
	(us-aus-exch1.ni.corp.natinst.com [130.164.68.11])
	by us-aus-skprod2.natinst.com (8.16.0.22/8.16.0.22) with ESMTPS id
	w7REVEhs016524
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Aug 2018 09:31:14 -0500
Received: from us-aus-exch3.ni.corp.natinst.com (130.164.68.13) by
	us-aus-exch1.ni.corp.natinst.com (130.164.68.11) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Mon, 27 Aug 2018 09:31:14 -0500
Received: from us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) by
	us-aus-exch3.ni.corp.natinst.com (130.164.68.13) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Mon, 27 Aug 2018 09:31:14 -0500
Received: from avasiuPC.natinst.com (130.164.49.7) by
	us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP
	Server
	id 15.0.1156.6 via Frontend Transport; Mon, 27 Aug 2018 09:31:13 -0500
From: Alexandru Vasiu <alexandru.vasiu@ni.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 27 Aug 2018 17:31:05 +0300
Message-ID: <20180827143105.30059-3-alexandru.vasiu@ni.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180827143105.30059-1-alexandru.vasiu@ni.com>
References: <20180827143105.30059-1-alexandru.vasiu@ni.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2018-08-27_06:, , signatures=0
X-Proofpoint-Spam-Reason: safe
Subject: [PATCH 3/3] image_types_wic: Add variable WIC_EXTENSION
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
X-List-Received-Date: Mon, 27 Aug 2018 15:42:46 -0000
Content-Type: text/plain

Used to specify what extention will have the image file which
is created using wic. The default value is wic. For creating an
ISO image, WIC_EXTENSION will be iso.

Signed-off-by: Alexandru Vasiu <alexandru.vasiu@ni.com>
---
 meta/classes/image.bbclass           | 2 ++
 meta/classes/image_types_wic.bbclass | 3 ++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 024d2d4c96..c6833a6770 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -607,6 +607,8 @@ python create_symlinks() {
     if not link_name:
         return
     for type in subimages:
+        if type == 'wic':
+            type = d.getVar('WIC_EXTENSION')
         dst = os.path.join(deploy_dir, link_name + "." + type)
         src = img_name + imgsuffix + type
         if os.path.exists(os.path.join(deploy_dir, src)):
diff --git a/meta/classes/image_types_wic.bbclass b/meta/classes/image_types_wic.bbclass
index 5b40a9e919..77cde5763c 100644
--- a/meta/classes/image_types_wic.bbclass
+++ b/meta/classes/image_types_wic.bbclass
@@ -9,6 +9,7 @@ WKS_FILE ??= "${IMAGE_BASENAME}.${MACHINE}.wks"
 WKS_FILES ?= "${WKS_FILE} ${IMAGE_BASENAME}.wks"
 WKS_SEARCH_PATH ?= "${THISDIR}:${@':'.join('%s/wic' % p for p in '${BBPATH}'.split(':'))}:${@':'.join('%s/scripts/lib/wic/canned-wks' % l for l in '${BBPATH}:${COREBASE}'.split(':'))}"
 WKS_FULL_PATH = "${@wks_search(d.getVar('WKS_FILES').split(), d.getVar('WKS_SEARCH_PATH')) or ''}"
+WIC_EXTENSION ??= "wic"
 
 def wks_search(files, search_path):
     for f in files:
@@ -30,7 +31,7 @@ IMAGE_CMD_wic () {
 	fi
 
 	BUILDDIR="${TOPDIR}" wic create "$wks" --vars "${STAGING_DIR}/${MACHINE}/imgdata/" -e "${IMAGE_BASENAME}" -o "$out/" ${WIC_CREATE_EXTRA_ARGS}
-	mv "$out/$(basename "${wks%.wks}")"*.direct "$out${IMAGE_NAME_SUFFIX}.wic"
+	mv "$out/$(basename "${wks%.wks}")"*.direct "$out${IMAGE_NAME_SUFFIX}.${WIC_EXTENSION}"
 	rm -rf "$out/"
 }
 IMAGE_CMD_wic[vardepsexclude] = "WKS_FULL_PATH WKS_FILES TOPDIR"
-- 
2.18.0


