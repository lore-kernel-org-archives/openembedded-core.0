Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB6FDC71155
	for <webhook@archiver.kernel.org>; Fri, 20 Jun 2025 05:45:04 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.1236.1750398301727452887
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Jun 2025 22:45:02 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=82662e19f1=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55K3wcNv026549;
	Fri, 20 Jun 2025 05:44:56 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47c80gsdg9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 20 Jun 2025 05:44:56 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Thu, 19 Jun 2025 22:44:54 -0700
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Thu, 19 Jun 2025 22:44:53 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <Ross.Burton@arm.com>,
        <skandigraun@gmail.com>
Subject: [PATCH v3] image-live.bbclass: support disable isohybrid for EFI-only boot
Date: Fri, 20 Jun 2025 13:44:53 +0800
Message-ID: <20250620054453.1933700-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <10C273CD-2737-42A4-9061-22C1E4A4B684@arm.com>
References: <10C273CD-2737-42A4-9061-22C1E4A4B684@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: u1qSy8IAngmYtm8TZgQaIPmN_vs3Mt0J
X-Proofpoint-GUID: u1qSy8IAngmYtm8TZgQaIPmN_vs3Mt0J
X-Authority-Analysis: v=2.4 cv=WLp/XmsR c=1 sm=1 tr=0 ts=6854f558 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=6IFa9wvqVegA:10 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=m2-eACJewNDUDw4af68A:9 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDA0MCBTYWx0ZWRfX7q3Y2T/jhBGy MUPdfDCpEKHjaXi/EJYi4YfdoghGEqDzU5usg0gvpqhK7X7rk1ZkuJJi/oMlItLL5juGG5rlvTC na7wwQ1FR67fB9Eg7LEa7mNB3kQAQQmM35IxQt+QIhItnDkIPsbHXovBubQwlVS9PiVEFnS8UFx
 +Ok//ARWlqX0xfqlceQwDb+8+DFXflPlY7lZlYAfcWyx9ZhV0yQINwXLKlPj4DgWzhFoMPe0sV+ GldgPkmP+rlNSRg6jPyJHxM+ovHfjoVdYoan1Z9qCOYcU4qU5WfAW01ThDekaU2FpnTPSvGDWlI n3143qu5u/k+f+sfgZJZT9RzICEtdQtJ8eXT0tT73hxAW6cETyMhWYOFMYcvPUiGaVXj6zZAPpE
 LU+StbZDccDzc3QBIV41osMem0HRf2l9ePLcDZxgIJNG3EulNHaocWIicMBDYU6jfIb09R8n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_01,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 suspectscore=0 mlxscore=0 bulkscore=0 mlxlogscore=984 phishscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506200040
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jun 2025 05:45:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219096

While NO PCBIOS and EFI only for ISO 9660 image, burn the image
to SandDisk USB stick, plug it into laptop, then boot laptop and
enter UEFI mode, there are two boot options in UEFI system.

Here is the steps:

$ echo 'MACHINE = "genericx86-64"' >> conf/local.conf
$ echo 'MACHINE_FEATURES:remove = "pcbios"' >> conf/local.conf
$ echo 'IMAGE_FSTYPES:pn-core-image-minimal = " live"' >> conf/local.conf
$ bitbake core-image-minimal
$ sudo dd if=tmp/deploy/images/genericx86-64/core-image-minimal-genericx86-64.rootfs.iso of=/dev/sda

Boot laptop and entery UEFI mode
...
Boot mode is set to: UEFI

UEFI BOOT:
    UEFI: SanDisk
    UEFI: SanDisk 2
...

In this case, PCBIOS is not used, calling isohybrid for ISO 9660 image
is not necessary, and do not call isohybrid for ISO 9660 image could
remove duplicated boot option in UEFI mode.

According to [1][2], use `[ "${PCBIOS}" != "1" ] && [ "${EFI}" = "1" ]' as the
EFI-only condition, the revert condition is `[ "${PCBIOS}" = "1" ] || [ "${EFI}" != "1" ]'

[1] https://git.openembedded.org/openembedded-core/commit/?id=be3fc8c07e84c654f55c5d09934dfbdc7ff7e2b6
[2] https://git.openembedded.org/openembedded-core/commit/?id=be95f54495bf9e03062f86b929c66cab6e385a03
Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes-recipe/image-live.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/image-live.bbclass b/meta/classes-recipe/image-live.bbclass
index d2e95ef51c3..c3054be6301 100644
--- a/meta/classes-recipe/image-live.bbclass
+++ b/meta/classes-recipe/image-live.bbclass
@@ -147,7 +147,10 @@ build_iso() {
 		isohybrid_args="-u"
 	fi
 
-	isohybrid $isohybrid_args ${IMGDEPLOYDIR}/${IMAGE_NAME}.iso
+	# EFI only does not need isohybrid
+	if [ "${PCBIOS}" = "1" ]  || [ "${EFI}" != "1" ]; then
+		isohybrid $isohybrid_args ${IMGDEPLOYDIR}/${IMAGE_NAME}.iso
+	fi
 }
 
 build_fat_img() {
-- 
2.34.1


