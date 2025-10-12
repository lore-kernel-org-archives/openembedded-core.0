Return-Path: <kavinaya@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D59FCCCD187
	for <webhook@archiver.kernel.org>; Sun, 12 Oct 2025 17:17:02 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.22688.1760289415328031307
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Oct 2025 10:16:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Or6zTkHw;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qti.qualcomm.com, ip: 205.220.168.131, mailfrom: kavinaya@qti.qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59CFjWLK001298
	for <openembedded-core@lists.openembedded.org>; Sun, 12 Oct 2025 17:16:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GHVvWQMgYqdDmz92Bukklc
	1hhtU+lyUebbRr2DijeuE=; b=Or6zTkHwInxNuTUzusF7PbsW/OrccmDZ5Xg1JS
	78uPi6MIsvZkfFy9Baeb+gI1ytqLhJQsj4iH/efFjqdZmiFpDfeLfgFQBA/uMeR6
	Q2ph2yn8egZ03Kxnmwl+QgUeNCQh3S3nGfbusT5NXbVYuTUbfjCp0HgzK5NVoMpp
	FmawF/ddNj0UBFLllFs2T6eNrK+2z3OLgs1vObsxhlbJZsI29GArATZYIRS5jO6v
	WYgZUDNn//YuY/ASlZLu6bKkw6Fd0KQT2Rb6wR8UM2WdPLmIehbePvV8aYE9VXBg
	mi6XtaEFGn3NTuWIag8stFJwuhaXLKo0uQT6VFeOfYC2ayAw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qgdft7xr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 12 Oct 2025 17:16:54 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 59CHGs1a031772
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 12 Oct 2025 17:16:54 GMT
Received: from hu-kavinaya-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Sun, 12 Oct 2025 10:16:52 -0700
From: Kavinaya S <kavinaya@qti.qualcomm.com>
To: <openembedded-core@lists.openembedded.org>
CC: Kavinaya S <kavinaya@qti.qualcomm.com>
Subject: [PATCH] kernel-fit-image: enable compatible string for kernel built-in DTBs
Date: Sun, 12 Oct 2025 22:46:34 +0530
Message-ID: <20251012171634.2110563-1-kavinaya@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyNSBTYWx0ZWRfXwo2xFoNjayZg
 bbRU9htpkPMnvjzg2i/Go2Gz814vR659VUhbjcI77t5oBTAirRfgW3c8ioF0PQXGU1CzZ4eBGFL
 63YGf3Wq1TYixmSnf1r2KQGab5bMnPlBL05lubBE4Jra1vAklGYGzUPDAYhW+cC4102gChGmty0
 HlYzhGGmpMflQwIHKQmGFHQ9gT5CrzzKvY3OL8FLRxfcZr+ZTSS6QPh7zRZVOv1nI7TkQQYjuOr
 bNQd87T55lGAv3vN2VzCQzBj0BzOiUa5n/D1C9q9Ps2T2Ykeepke989C2YjbpYB3jmlDAOxmjWV
 ukLtBkkkjhmLgkVlZkyuM2bZZxKLpL2zZHT7HOBsVZpHP2Cp65ajyJ2n1WbkJyf6F7jGzOHIpaw
 UA8FcYm9TFi/Tatjx6+ywukLooDDVg==
X-Proofpoint-GUID: QyAS99WJyOEA0pnQJIirqOocRcDMIOgJ
X-Proofpoint-ORIG-GUID: QyAS99WJyOEA0pnQJIirqOocRcDMIOgJ
X-Authority-Analysis: v=2.4 cv=J4ynLQnS c=1 sm=1 tr=0 ts=68ebe286 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=6cRAjit5A-7ZIy2jTxoA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-12_06,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110025
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Oct 2025 17:17:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224743

At present, the kernel-fit-image bbclass is adding compatible strings only
for external DTBs, omitting them for DTBs built from the kernel tree. This
behavior is limiting the ability to clearly identify the DTBs in FIT image
that includes multiple kernel built-in DTBs and possibly mix of in tree and
external ones, due to lack of consistent compatible strings.

To fix this, introduce a new BitBake variable, FIT_DTB_ADD_COMPATIBLE
when set to "True", the bbclass will extract and include the compatible
string from kernel-built DTBs also in the .its file, just like it does
for external DTBs.

Signed-off-by: Kavinaya S <kavinaya@qti.qualcomm.com>
---
 meta/classes-recipe/kernel-fit-image.bbclass | 3 ++-
 meta/conf/image-fitimage.conf                | 3 +++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/kernel-fit-image.bbclass b/meta/classes-recipe/kernel-fit-image.bbclass
index f04aee1807..0e6764cb17 100644
--- a/meta/classes-recipe/kernel-fit-image.bbclass
+++ b/meta/classes-recipe/kernel-fit-image.bbclass
@@ -85,7 +85,8 @@ python do_compile() {
             # Copy the dtb or dtbo file into the FIT image assembly directory
             shutil.copyfile(os.path.join(kernel_deploydir, dtb_name), dtb_name)
             root_node.fitimage_emit_section_dtb(dtb_name, dtb_name,
-                d.getVar("UBOOT_DTB_LOADADDRESS"), d.getVar("UBOOT_DTBO_LOADADDRESS"))
+                d.getVar("UBOOT_DTB_LOADADDRESS"), d.getVar("UBOOT_DTBO_LOADADDRESS"),
+                add_compatible = d.getVar("FIT_DTB_ADD_COMPATIBLE"))
 
     if external_kernel_devicetree:
         # iterate over all .dtb and .dtbo files in the external kernel devicetree directory
diff --git a/meta/conf/image-fitimage.conf b/meta/conf/image-fitimage.conf
index 090ee148f4..35e0459d09 100644
--- a/meta/conf/image-fitimage.conf
+++ b/meta/conf/image-fitimage.conf
@@ -47,6 +47,9 @@ FIT_LINUX_BIN ?= "linux.bin"
 # Allow user to select the default DTB for FIT image when multiple dtb's exists.
 FIT_CONF_DEFAULT_DTB ?= ""
 
+# Allow user to choose if DTB in FIT image can have compatible strings.
+FIT_DTB_ADD_COMPATIBLE ?= "False"
+
 # length of address in number of <u32> cells
 # ex: 1 32bits address, 2 64bits address
 FIT_ADDRESS_CELLS ?= "1"

