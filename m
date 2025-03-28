Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FE3CC28B20
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 13:02:56 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.10622.1743166970627439210
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Mar 2025 06:02:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6182aa6777=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52SBndZO016321
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 13:02:50 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45hje1q8qr-14
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
Subject: [PATCH 2/2] image-live.bbclass: fix booting EFI ISO live failed
Date: Fri, 28 Mar 2025 06:02:42 -0700
Message-ID: <20250328130242.929372-2-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250328130242.929372-1-hongxu.jia@windriver.com>
References: <20250328130242.929372-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=KPVaDEFo c=1 sm=1 tr=0 ts=67e69df9 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=Vs1iUdzkB0EA:10 a=t7CeM3EgAAAA:8 a=9uaPRWX3WSNLSLU4ZXAA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: NN8XzP73NuySH70CFXmF46ffyyLBYQ4y
X-Proofpoint-ORIG-GUID: NN8XzP73NuySH70CFXmF46ffyyLBYQ4y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-28_06,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 adultscore=0 impostorscore=0 mlxlogscore=684 malwarescore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503280090
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 13:02:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213837

In ISO live, if the size of efi.img >= 32MB, and copy EFI application
(bootx64.efi) to efi.img behind of kernel and initrd, UEFI system
could not find EFI application bootx64.efi

In UEFI shell:
...
Shell> ls FS0:\
Directory of: FS0:\
04/05/2011  23:00          12,985,344  bzImage
04/05/2011  23:00 <DIR>         2,048  EFI
04/05/2011  23:00          20,494,696  initrd
04/05/2011  23:00                  26  startup.nsh
          3 File(s)  33,480,066 bytes
          1 Dir(s)

Shell> ls FS0:\EFI
Directory of: FS0:\EFI
          0 File(s)           0 bytes
          0 Dir(s)
...

The fs type of efi.img is FAT, it seems UEFI system only know
first 32MB in efi.img, due to kernel and initrd take the most
disk space, in order to make sure EFI application bootx64.efi could
be detected by UEFI system, copy EFI BOOT and other configuration
first, and then kernel and initrd at last

As comparing, after applying this commit, for the same project,
EFI application bootx64.efi was found
In UEFI shell:
...
Shell> ls FS0:\
Directory of: FS0:\
04/05/2011  23:00          12,985,344  bzImage
04/05/2011  23:00 <DIR>         2,048  EFI
04/05/2011  23:00          20,494,696  initrd
04/05/2011  23:00                  26  startup.nsh
          3 File(s)  33,480,066 bytes
          1 Dir(s)
Shell> ls FS0:\EFI\BOOT
Directory of: FS0:\EFI\BOOT\
04/05/2011  23:00 <DIR>         2,048  .
04/05/2011  23:00 <DIR>         2,048  ..
04/05/2011  23:00             655,360  bootx64.efi
04/05/2011  23:00                 281  grub.cfg
          2 File(s)     655,641 bytes
          2 Dir(s)
...

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes-recipe/image-live.bbclass | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/image-live.bbclass b/meta/classes-recipe/image-live.bbclass
index d2e95ef51c..40ee86b822 100644
--- a/meta/classes-recipe/image-live.bbclass
+++ b/meta/classes-recipe/image-live.bbclass
@@ -211,7 +211,24 @@ build_fat_img() {
 	fi
 
 	# Copy FATSOURCEDIR recursively into the image file directly
-	mcopy -i ${FATIMG} -s ${FATSOURCEDIR}/* ::/
+	fat_source_dirs="$(ls ${FATSOURCEDIR}/* -d)"
+	fat_sources=""
+	for source_dir in $fat_source_dirs; do
+		# Skip kernel and initrd
+		if [ ${source_dir%${KERNEL_IMAGETYPE}} = "$source_dir" -a \
+		     ${source_dir%initrd} = "$source_dir" ];then
+			fat_sources="$fat_sources $source_dir"
+		fi
+	done
+	# Copy EFI BOOT and other configuration at first
+	mcopy -i ${FATIMG} -s $fat_sources ::/
+	# Copy kernel and initrd at last if available
+	if [ -e ${FATSOURCEDIR}/${KERNEL_IMAGETYPE} ];then
+		mcopy -i ${FATIMG} ${FATSOURCEDIR}/${KERNEL_IMAGETYPE} ::/
+	fi
+	if [ -e ${FATSOURCEDIR}/initrd ]; then
+		mcopy -i ${FATIMG} ${FATSOURCEDIR}/initrd ::/
+	fi
 }
 
 build_hddimg() {
-- 
2.25.1


