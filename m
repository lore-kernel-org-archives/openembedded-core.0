Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 769F3CA1002
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 12:53:50 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.35311.1756980291613855935
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Sep 2025 03:04:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=BdR0G4y4;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qti.qualcomm.com, ip: 205.220.180.131, mailfrom: kavinaya@qti.qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5849Tjq3000848;
	Thu, 4 Sep 2025 09:31:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ttIcLgbg9gNFbluVLEZbk+PG166s2p9KS4K540x4SFY=; b=BdR0G4y4y1rAOS8k
	02sYDFSm1rsbnm5N2xHPdolcznZoFodwA51Rp/p0/guYfHaiY5k/Gy76kr+DS60p
	xbHWeVPysUycxDJT22PNaEdfpSlKf8Y4WpRMTUHFdii1wQXBvM9a7YmsFd+DkfOl
	1U3AgNg7mCscwZuBREQR+LBP9fUkJkKmN3JsO4dQUbnYKLGaV4hE1dM9dKPw/cti
	E0RSgNOuYMOj7MLectTFpkrXW4sXQDnyiMhPvLkdQc5nhKiXE0qo9dlWfAgR4wvm
	5Dno9+oCso1bJGaywpmOSzB6trNACDFKFnfcHSp2BzpGsfSenS2tkcTb/qSO0dwc
	ub9lig==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urmjpxh2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Sep 2025 09:31:58 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5849VvoU015115
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 4 Sep 2025 09:31:57 GMT
Received: from hu-kavinaya-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Thu, 4 Sep 2025 02:31:55 -0700
From: Kavinaya S <kavinaya@qti.qualcomm.com>
To: <openembedded-core@lists.openembedded.org>
CC: Kavinaya S <kavinaya@qti.qualcomm.com>,
        Adrian Freihofer
	<adrian.freihofer@siemens.com>
Subject: [PATCH v2 1/2] image-fitimage: add FIT_LINUX_BIN variable
Date: Thu, 4 Sep 2025 15:01:21 +0530
Message-ID: <20250904093122.593125-2-kavinaya@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250904093122.593125-1-kavinaya@qti.qualcomm.com>
References: <20250904093122.593125-1-kavinaya@qti.qualcomm.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=OemYDgTY c=1 sm=1 tr=0 ts=68b95c8e cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=a_U1oVfrAAAA:8
 a=qf8lhl36pIEOR6z7c9EA:9
X-Proofpoint-GUID: JLxgMA2zz8Nc8HxF9d0GTkjrumnN5GZD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNCBTYWx0ZWRfXzAfL4vjqqx2E
 BJAwcpQO3zKf+eEfZT4ufK//JfY1mb/E5P4si1sj7PZhai8l74QqgC/LFCth6BCjOvirypLKxS7
 FTFIV1ja7yzZSeZ/phBgSFjxOWKTbuvfY7oFzUmtnyAB8K0l2Z5bLCJce6sOdBdLOQhqvEVRrzD
 5lO3mAFi9VCIvkzsJy56Z28YO+0iGynS05LxM2MaNDVowYj1vwClwFVBe/WVnTUHYdSjvCf4lj5
 r/OACE1efgOz7ndioSYhkcgCuZa5aXAp4Nzr5Ta30OYDuuD1ENZZrXLkdsyeP3q2YesUlSb4JPA
 eee7TsnL2Hxhqq5IJwFd8edeXh0n5ISfv0Y+6uykpSABrwKKyTOU1Nqh9cWs/WY5UFpTIME0l4d
 x74vQzBz
X-Proofpoint-ORIG-GUID: JLxgMA2zz8Nc8HxF9d0GTkjrumnN5GZD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1011 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300024
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Sep 2025 12:53:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222925

Add FIT_LINUX_BIN variable to image-fitimage.conf to allow control over
kernel section inclusion.

Signed-off-by: Kavinaya S <kavinaya@qti.qualcomm.com>
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/conf/image-fitimage.conf | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/conf/image-fitimage.conf b/meta/conf/image-fitimage.conf
index 9be7e45238..f39af099ab 100644
--- a/meta/conf/image-fitimage.conf
+++ b/meta/conf/image-fitimage.conf
@@ -37,6 +37,10 @@ FIT_CONF_PREFIX[doc] = "Prefix to use for FIT configuration node name"
 
 FIT_SUPPORTED_INITRAMFS_FSTYPES ?= "cpio.lz4 cpio.lzo cpio.lzma cpio.xz cpio.zst cpio.gz ext2.gz cpio"
 
+# Allow user to support special use cases where the kernel binary is not included
+# in the FIT image itself.
+FIT_LINUX_BIN ?= "linux.bin"
+
 # Allow user to select the default DTB for FIT image when multiple dtb's exists.
 FIT_CONF_DEFAULT_DTB ?= ""
 
-- 
2.34.1


