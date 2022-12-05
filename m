Return-Path: <shruthi.ravichandran@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 148AEC47089
	for <webhook@archiver.kernel.org>; Mon,  5 Dec 2022 19:27:27 +0000 (UTC)
Received: from mx0a-00010702.pphosted.com (mx0a-00010702.pphosted.com [148.163.156.75])
 by mx.groups.io with SMTP id smtpd.web11.25478.1670268441920627481
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Dec 2022 11:27:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ni.com header.s=pps11062020 header.b=gt13LNCk;
 spf=pass (domain: ni.com, ip: 148.163.156.75, mailfrom: prvs=9338cfdb94=shruthi.ravichandran@ni.com)
Received: from pps.filterd (m0239462.ppops.net [127.0.0.1])
	by mx0b-00010702.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B5Het9q021483
	for <openembedded-core@lists.openembedded.org>; Mon, 5 Dec 2022 13:27:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS11062020;
 bh=SivqEHzJYAm1y5C3CqqOGhZIe0tNIg9rfPebipGPX7I=;
 b=gt13LNCkpW54g1VvcCYhGw3e315Sxql4a/iUlno7o4pz7bD+AVTSMF8z3EU2tKxvZAOq
 OaUBe5E9se9EmOwFg3X0cjpty1i7WEjgXjEo8mUkY7nSKbMOIx/JlBWqhfUPobjY+y68
 vBNTZBG8RP9sexyik+Un1L7aIVBjSHlxvjrLms4ygFmZ+fGDRD8vvXMJLvUhKNECRVbx
 Vxfcw2Zoo5MbbDQqzKWMIYwxwGGW6M2Pd6g8QoDUJs3HnTKDFor7oz8sD1mSwT0zWF3H
 ZWlAvMg/2qduUkQ66pSP0qI7aE+1Oml1a28cmYZuMucNAp8exR7Nyp0GDktwUOuVpbx+ mA== 
Received: from ni.com ([130.164.80.24])
	by mx0b-00010702.pphosted.com (PPS) with ESMTPS id 3m83dk3fhs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 05 Dec 2022 13:27:21 -0600
Received: from us-aus-excas-p2.ni.corp.natinst.com (us-aus-excas-p2.ni.corp.natinst.com [130.164.68.18])
	by us-aus-skprod3.natinst.com (8.16.1.2/8.16.1.2) with ESMTPS id 2B5JRIb5025541
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 5 Dec 2022 13:27:18 -0600
Received: from us-aus-excas-p2.ni.corp.natinst.com (130.164.68.18) by
 us-aus-excas-p2.ni.corp.natinst.com (130.164.68.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.7; Mon, 5 Dec 2022 13:27:18 -0600
Received: from ravich.amer.corp.natinst.com (172.18.68.32) by
 us-aus-excas-p2.ni.corp.natinst.com (130.164.68.18) with Microsoft SMTP
 Server id 15.2.1118.7 via Frontend Transport; Mon, 5 Dec 2022 13:27:18 -0600
From: Shruthi Ravichandran <shruthi.ravichandran@ni.com>
To: <openembedded-core@lists.openembedded.org>
CC: Shruthi Ravichandran <shruthi.ravichandran@ni.com>
Subject: [OE-core][hardknott][PATCH] binutils-cross-canadian: Add lib*.a files to the staticdev package
Date: Mon, 5 Dec 2022 11:26:30 -0800
Message-ID: <20221205192630.8814-1-shruthi.ravichandran@ni.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 6Hy73KzBbU_FB2XuVATw-qPPrkVQ6sye
X-Proofpoint-ORIG-GUID: 6Hy73KzBbU_FB2XuVATw-qPPrkVQ6sye
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-05_01,2022-12-05_01,2022-06-22_01
X-Proofpoint-Spam-Reason: orgsafe
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Dec 2022 19:27:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174300

This fixes the following QA issue when building an SDK for
x86_64-mingw32 machines.

ERROR: binutils-cross-canadian-x86-64-2.36.1-r0 do_package_qa: QA Issue: non -staticdev package contains static .a library: binutils-cross-canadian-x86-64 path '/usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-w64-mingw32/usr/lib/x86_64-nilrt-linux/bfd-plugins/libdep.dll.a' [staticdev]

Signed-off-by: Shruthi Ravichandran <shruthi.ravichandran@ni.com>
---
 meta/recipes-devtools/binutils/binutils-cross-canadian.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/binutils/binutils-cross-canadian.inc b/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
index e98f31f9c3..c38936db42 100644
--- a/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
+++ b/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
@@ -30,3 +30,5 @@ do_install () {
 }
 
 BBCLASSEXTEND = ""
+
+FILES_${PN}-staticdev:append = " ${libdir}/bfd-plugins/lib*.a"
-- 
2.20.1


