Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE142C61CE7
	for <webhook@archiver.kernel.org>; Mon,  9 Jun 2025 02:25:22 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.50117.1749435917294209310
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Jun 2025 19:25:17 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=82555dc36a=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5591pCNY022394;
	Mon, 9 Jun 2025 02:25:15 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 474cd91anq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 09 Jun 2025 02:25:15 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Sun, 8 Jun 2025 19:25:14 -0700
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Sun, 8 Jun 2025 19:25:13 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <skandigraun@gmail.com>
Subject: [PATCH V2] image-live.bbclass: support to enable/disable isohybrid
Date: Mon, 9 Jun 2025 10:25:12 +0800
Message-ID: <20250609022512.1657737-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <ef04783f-b3b2-432f-acf3-d3c826395264@gmail.com>
References: <ef04783f-b3b2-432f-acf3-d3c826395264@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=f+xIBPyM c=1 sm=1 tr=0 ts=6846460b cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=6IFa9wvqVegA:10 a=t7CeM3EgAAAA:8 a=m2-eACJewNDUDw4af68A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDAxOCBTYWx0ZWRfXzWi0WwmdjwCQ ABqQAx/ro+X0X7Jiw1tHVtzjSg6FICxJWtG68OTk7KhF9OHZIsikseJVRY/Aohu5FCBi2r16voB +XiLaE1jPbaCvotRBLAf+KrYM56nUfsgOLL8yhz/+kPyLchinNp6uYewXzvTgEfxprQk9cRVQBG
 DL0iWu99yjs908BjVcHMr+uGXfe+2llgJC4lqhdhdXLXs0oBhfHGW0n8qdvS+NeL4Att5EH3GLu xZoJ+JrlxpBsqr9pmO7DJEgNGs39nN/u04+ezMsXdOXTrS21dCcgaX5s64Tuh0gmmHrYqVnG6Bi YYbkxT9Taji/TSKVRQJ5hUzhiwJAMauYkxBLBbx+sgzs2TMLOFgsyJ2lwO4NGUG67OiqnVxVYUe
 vtNqdtKtFv4otn73+miHwuO/tGgjgdJ3Az6V1tm95wotn8EuEDurjtM6JCW1FFjWUOKMt0Nh
X-Proofpoint-ORIG-GUID: XQaDiB4I6qdVyEnzuf94b_IsV0j5Fn6X
X-Proofpoint-GUID: XQaDiB4I6qdVyEnzuf94b_IsV0j5Fn6X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_01,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=858
 suspectscore=0 clxscore=1011 bulkscore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 mlxscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2505280000 definitions=main-2506090018
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jun 2025 02:25:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218238

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

Add var-ENABLE_ISOHYBRID to disable or enable isohybrid, but still enable
isohybrid by default as usual. User could set ENABLE_ISOHYBRID = "0" in
local.conf to disable it

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes-recipe/image-live.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/image-live.bbclass b/meta/classes-recipe/image-live.bbclass
index d2e95ef51c3..cf8efb2c9b2 100644
--- a/meta/classes-recipe/image-live.bbclass
+++ b/meta/classes-recipe/image-live.bbclass
@@ -63,6 +63,8 @@ ISODIR = "${S}/iso"
 EFIIMGDIR = "${S}/efi_img"
 COMPACT_ISODIR = "${S}/iso.z"
 
+
+ENABLE_ISOHYBRID ??= "1"
 ISOLINUXDIR ?= "/isolinux"
 ISO_BOOTIMG = "isolinux/isolinux.bin"
 ISO_BOOTCAT = "isolinux/boot.cat"
@@ -147,7 +149,9 @@ build_iso() {
 		isohybrid_args="-u"
 	fi
 
-	isohybrid $isohybrid_args ${IMGDEPLOYDIR}/${IMAGE_NAME}.iso
+	if [ "${ENABLE_ISOHYBRID}" = "1" ]; then
+		isohybrid $isohybrid_args ${IMGDEPLOYDIR}/${IMAGE_NAME}.iso
+	fi
 }
 
 build_fat_img() {
-- 
2.34.1


