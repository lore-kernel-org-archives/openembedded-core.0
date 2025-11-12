Return-Path: <vudupa@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B83D2CCFA1A
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 11:28:45 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11199.1762946919352907604
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Nov 2025 03:28:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=ke7D4pVx;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.180.131, mailfrom: vudupa@qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AC9hUtO907571
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Nov 2025 11:28:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=eVF43qWDZ9CH4lljH7e3RtUYWVvT6sLF7N6
	JLN7NUQ4=; b=ke7D4pVxhocxanIhzN+fQALA5+UOt5A4ab/R6ybfsgDmtdjR5FQ
	/d3uG7UOrPt3iLPWqbzoTd+y9WgFh1lj7i/5O0xGM2AnAa+35GxB1J4eL3I3jw6x
	wnkL7+W3WHz/NnF+OfXX4iVNwp3euyR5tYbIs2LSWzhEh2E+8gIo7L2fhsudRMmZ
	9L3qSFo3rFfX7Th3uzVWMa48JZsEbApjWfZdSvWR227QgPk/dI4dRCgNBZ081l0K
	Xb3oeu8THoa8RByy+kCyvvnXkGAS8AxLkZWoDtfte/5fla4Sh3xuM28iI9eAQ8w6
	L/65Qyzjrs4vcKJ47GZZPh+GiPknej8mryA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acqur89xh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Nov 2025 11:28:38 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5ACBSZTN015580
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Nov 2025 11:28:35 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4a9xxm7d2b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Nov 2025 11:28:35 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5ACBSYY4015575
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Nov 2025 11:28:35 GMT
Received: from hyd-e160-a01-2-03.qualcomm.com (hyd-e160-a01-2-03.qualcomm.com [10.147.154.239])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 5ACBSYPc015574
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Nov 2025 11:28:34 +0000
Received: by hyd-e160-a01-2-03.qualcomm.com (Postfix, from userid 3978420)
	id 8C5174C28; Wed, 12 Nov 2025 16:58:33 +0530 (IST)
From: Vishwas Udupa <vudupa@qti.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: anuj.mittal@oss.qualcomm.com, Vishwas Udupa <vudupa@qti.qualcomm.com>
Subject: [PATCH v2] findutils:/var is populated by base-files, so no need to repack empty dir
Date: Wed, 12 Nov 2025 16:58:23 +0530
Message-Id: <20251112112823.1834531-1-vudupa@qti.qualcomm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDA5MiBTYWx0ZWRfX0IhtMQjv+Vs8
 EpvTRK/YbnjpEIKFaWI0k4YNbQeUupsCmhjemIvs+wG6hSV1InONMX9iI1ocugVtDbFHNbmd+0u
 Xov61bD/+cGYE7xf3cXqgJMdB8lT/O92OQeS9ntLp3Ib8i4MdcGRUxqhuvO++jqR9xFarTdQvwN
 rZ2KRP3Yuy2kdzXhpfdqQK3pZEpaHHRFI2ckz8IShNp+3ijvdYTL/cUCDnTiOX/heUJ5nKU5sf6
 iWWC34n1ImKGxid2wvBnOUyKRm6crkIb+mik1zeSLDSPOsmvy0+WXDzKV1xXWGpchRvSUxHf6Vt
 0exBB9Wd3KzQkpwuxKTkTlVwCc8qJJtHUvEkrfeW71q586TVGPmM7Lg8r2tPqk0iOSGjwpuKh/S
 xcH2Vk5RAttuzZuhxMipZqf2ZQvvhg==
X-Proofpoint-GUID: v_gUI86gGd82DUQelMVGcJSk1kIjmuQF
X-Authority-Analysis: v=2.4 cv=bbBmkePB c=1 sm=1 tr=0 ts=69146f66 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=MHo1wMy07wiU54WxFgcA:9
X-Proofpoint-ORIG-GUID: v_gUI86gGd82DUQelMVGcJSk1kIjmuQF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_03,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511120092
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Nov 2025 11:28:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226204

findutils installs an empty /var which is already created
by base-files. It doesn't need to be packaged by findutils.
this helps to align towards stateless
system expectations or when updates are done via meta-updater.

Signed-off-by: Vishwas Udupa <vudupa@qti.qualcomm.com>
---
 meta/recipes-extended/findutils/findutils_4.10.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-extended/findutils/findutils_4.10.0.bb b/meta/recipes-extended/findutils/findutils_4.10.0.bb
index 29ad6c7350..91bb1be170 100644
--- a/meta/recipes-extended/findutils/findutils_4.10.0.bb
+++ b/meta/recipes-extended/findutils/findutils_4.10.0.bb
@@ -15,6 +15,10 @@ EXTRA_OECONF += "ac_cv_path_SORT=${bindir}/sort"
 # need od from coreutils for -t option
 RDEPENDS:${PN}-ptest += "bash sed grep coreutils"
 
+do_install:append() {
+	rmdir ${D}${localstatedir}
+}
+
 do_install_ptest:class-target() {
 	mkdir -p ${D}${PTEST_PATH}/tests/
 	cp ${S}/init.cfg ${D}${PTEST_PATH}
-- 
2.25.1


