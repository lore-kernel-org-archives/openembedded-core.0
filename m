Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C096ECA0FED
	for <webhook@archiver.kernel.org>; Fri,  5 Sep 2025 14:29:43 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.18819.1757070142464949718
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Sep 2025 04:02:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=pyX+c3T5;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qti.qualcomm.com, ip: 205.220.168.131, mailfrom: kavinaya@qti.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5856ekhG022145;
	Fri, 5 Sep 2025 11:02:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4hJud3PGMrWNJM0HYTAPu648qKzQw97Za3Zk22zAJPI=; b=pyX+c3T5e4og4fP3
	8hyCZoXFw8OjPhZcX/mO4Oniofh0xc0t4RuS66rm0L0FYP7MGwCHkf2dSnhRT+6l
	vDTdKJX3rAJHbBkDNsu9m1kNi3bYBszZKQZ5lvfo3J+haPpHVSsDZ3IAi9TFEsLT
	+bcZX4fqoNzlXve9aXqTGRA5tbqH7QbcczMGZM3gp2q+szS9EpWtnQNEDtMIIT/L
	ALelonoUwkfBvta0HVZGKu0//tb6xlBiwbyLufVJGsQ7TF6m2lfJjq8dDjXx6GbA
	HOKe6u2qsgZHwKPQWCl5EV1aaBwk+02kLiis6cuTYmUY4thMsnmeLoI3Ddd6eE+W
	cYz7gQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48utk9ar4x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Sep 2025 11:02:22 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 585B2LW2024685
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 5 Sep 2025 11:02:21 GMT
Received: from hu-kavinaya-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Fri, 5 Sep 2025 04:02:19 -0700
From: Kavinaya S <kavinaya@qti.qualcomm.com>
To: <openembedded-core@lists.openembedded.org>
CC: Kavinaya S <kavinaya@qti.qualcomm.com>,
        Adrian Freihofer
	<adrian.freihofer@siemens.com>
Subject: [PATCH v3 2/2] image-fitimage: add FIT_LINUX_BIN variable
Date: Fri, 5 Sep 2025 16:31:52 +0530
Message-ID: <20250905110152.552108-3-kavinaya@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250905110152.552108-1-kavinaya@qti.qualcomm.com>
References: <20250905110152.552108-1-kavinaya@qti.qualcomm.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: IEqmUdyIWQuzXNIvUpzIf_7FIafYVnJX
X-Proofpoint-ORIG-GUID: IEqmUdyIWQuzXNIvUpzIf_7FIafYVnJX
X-Authority-Analysis: v=2.4 cv=ccnSrmDM c=1 sm=1 tr=0 ts=68bac33e cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=yJojWOMRYYMA:10 a=a_U1oVfrAAAA:8 a=EUspDBNiAAAA:8
 a=jW03O2A4tmCh_9XdCpkA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDA0MiBTYWx0ZWRfX/6ZEvOSMbt2r
 Mc+x/63kwN/AZ2qgtCsZnoiyHY2Ip8vO23wzXhLjjHpkjNK9zERSvNfXRK4YvYCL8lr1Q5kqBS5
 avdM6wkgxkmZVMoUWuWzT21ASO1Vh7AR0NHavXcASheLpzOUb09iKMPHSoaUASNUschwrcDLjkA
 MPW6ChN3UoihX35Y8yDph0iUoWAHiF5FjD7GVYUFBb8TNzOjr1iLlanfAnhznUvIGvcwQTLwnl8
 QBBD3O7XeQ2WnZoVhjyRUe2oIMo6rMocp7PvCZQ4iUPISGmgDusaBzkMiVU109UaPVzjr9wCJq9
 KRVkt3m9GkegcMx5i/n1B87IQA2H0I9nuwMOJBgoiYvUBORO4DDb9UbfG5P0RTFfq9Go16U7xHN
 gKmRL5wT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_03,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300042
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Sep 2025 14:29:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223007

Add FIT_LINUX_BIN variable to image-fitimage.conf to allow control over
kernel section inclusion.

Suggested-by: Adrian Freihofer <adrian.freihofer@siemens.com>
Signed-off-by: Kavinaya S <kavinaya@qti.qualcomm.com>
---
 meta/conf/image-fitimage.conf | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/conf/image-fitimage.conf b/meta/conf/image-fitimage.conf
index 9be7e45238..090ee148f4 100644
--- a/meta/conf/image-fitimage.conf
+++ b/meta/conf/image-fitimage.conf
@@ -37,6 +37,13 @@ FIT_CONF_PREFIX[doc] = "Prefix to use for FIT configuration node name"
 
 FIT_SUPPORTED_INITRAMFS_FSTYPES ?= "cpio.lz4 cpio.lzo cpio.lzma cpio.xz cpio.zst cpio.gz ext2.gz cpio"
 
+# Allow user to support special use cases where the kernel binary is
+# not included in the FIT image itself.
+# This is particularly useful for UKI-based setups, where the kernel
+# and initramfs are bundled into a Unified Kernel Image (UKI), and
+# DTBs are provided separately in a FIT image.
+FIT_LINUX_BIN ?= "linux.bin"
+
 # Allow user to select the default DTB for FIT image when multiple dtb's exists.
 FIT_CONF_DEFAULT_DTB ?= ""
 
-- 
2.34.1


