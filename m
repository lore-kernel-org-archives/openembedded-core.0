Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 931CAC3600C
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 13:02:56 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.10601.1743166970134262371
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Mar 2025 06:02:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6182aa6777=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52SBndZN016321
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 13:02:49 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45hje1q8qr-13
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 13:02:49 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Fri, 28 Mar 2025 06:02:42 -0700
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Fri, 28 Mar 2025 06:02:42 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/2] live-vm-common.bbclass: conditionally to add kernel and initrd to efi.img of ISO live
Date: Fri, 28 Mar 2025 06:02:41 -0700
Message-ID: <20250328130242.929372-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=KPVaDEFo c=1 sm=1 tr=0 ts=67e69df9 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=Vs1iUdzkB0EA:10 a=t7CeM3EgAAAA:8 a=p7NiMKIif9kejdmeTTUA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: bDtuEDMosTlSwpv9TcgLAFxoym84twTt
X-Proofpoint-ORIG-GUID: bDtuEDMosTlSwpv9TcgLAFxoym84twTt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-28_06,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 adultscore=0 impostorscore=0 mlxlogscore=999 malwarescore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503280090
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 13:02:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213836

Add var-EFI_ISO_KERNEL, if ${EFI_ISO_KERNEL} != "1", do not add kernel and
initrd to efi.img of ISO live.

For grub-efi's ISO live, the kernel and initrd is not necessary in efi.img,
because grub-efi's bootx64.efi sets `search.file ($cmdpath)/EFI/BOOT/grub.cfg root'
to locate kernel and initrd in ISO live image.

It helps while the size of initrd is big to break the limit of efi.img in which
the filesystem type is FAT

Also clean up ${EFIIMGDIR} before populating

Set EFI_ISO_KERNEL ??= "1" by default which adds kernel and initrd to efi.img
as usual

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes-recipe/live-vm-common.bbclass | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/live-vm-common.bbclass b/meta/classes-recipe/live-vm-common.bbclass
index d90cc67ebc..f087d9e236 100644
--- a/meta/classes-recipe/live-vm-common.bbclass
+++ b/meta/classes-recipe/live-vm-common.bbclass
@@ -48,18 +48,25 @@ efi_populate_common() {
         printf 'fs0:%s\%s\n' "$EFIPATH" "${EFI_BOOT_IMAGE}" >${DEST}/startup.nsh
 }
 
+# Kernel(with initrd) image in efi.img of ISO live
+EFI_ISO_KERNEL ??= "1"
+
 efi_iso_populate() {
         iso_dir=$1
         efi_populate $iso_dir
+
+        rm -rf ${EFIIMGDIR}
         # Build a EFI directory to create efi.img
         mkdir -p ${EFIIMGDIR}/${EFIDIR}
         cp $iso_dir/${EFIDIR}/* ${EFIIMGDIR}${EFIDIR}
-        cp $iso_dir/${KERNEL_IMAGETYPE} ${EFIIMGDIR}
+        if [ "${EFI_ISO_KERNEL}" = "1" ]; then
+                cp $iso_dir/${KERNEL_IMAGETYPE} ${EFIIMGDIR}
+        fi
 
         EFIPATH=$(echo "${EFIDIR}" | sed 's/\//\\/g')
         printf 'fs0:%s\%s\n' "$EFIPATH" "${EFI_BOOT_IMAGE}" >${EFIIMGDIR}/startup.nsh
 
-        if [ -f "$iso_dir/initrd" ] ; then
+        if [ -f "$iso_dir/initrd" -a "${EFI_ISO_KERNEL}" = "1" ] ; then
                 cp $iso_dir/initrd ${EFIIMGDIR}
         fi
 }
-- 
2.25.1


