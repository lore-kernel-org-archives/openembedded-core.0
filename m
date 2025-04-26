Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3B32C369CB
	for <webhook@archiver.kernel.org>; Sat, 26 Apr 2025 08:03:59 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.5569.1745654636834401144
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Apr 2025 01:03:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6211e5860b=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53Q5bXFc002565;
	Sat, 26 Apr 2025 08:03:55 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 468mq189tf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 26 Apr 2025 08:03:55 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Sat, 26 Apr 2025 01:03:53 -0700
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Sat, 26 Apr 2025 01:03:52 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
        <richard.purdie@linuxfoundation.org>, <hongxu.jia@windriver.com>
Subject: [PATCH v2 1/2] cdrtools-native: fix booting EFI ISO live failed
Date: Sat, 26 Apr 2025 16:03:51 +0800
Message-ID: <20250426080352.2358278-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=KsNN2XWN c=1 sm=1 tr=0 ts=680c936b cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=XR8D0OoHHMoA:10 a=Gz7s5_CCAAAA:8 a=FP58Ms26AAAA:8 a=t7CeM3EgAAAA:8 a=RQ0vb9vJ0td1Ij1Jc2YA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: ft4nPXsxmstwxfVjVhlzsvHpeyZrNPF5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI2MDA1MSBTYWx0ZWRfX1PW9SqtLFzJ1 oSJAXoOqkUt9eMrFbRCj9aRO+1pVc8Q22rvKgcFc0ywKGW9aKQ1VRBH1amM3E+cpLevjcannsng 5TTdENEp5ypDjocZtAlQ+voydbsQ1JBRRjEzewgnKchk0j2xGOppepKAcoudnhkVtDk7xyNb2e4
 Ca+zYPrmG4uld3y/SNJw+z4pVL03Rcq8K0DToPudm4Jap2l4WlUGhx7aVfJDfLc6c/3iSsNnUxV dJYWiLrADp13+jGjApF7Mz7XSfreWzUX50qwqv1fBy5Ag1jIpGMzPg/gvUVGXRMVbs009SO6FrS zJ9PLS42x2GazaE8ygEhJrik4WOiDXZRnwGVpd7vbB6GW14QMiZQEvt8ooZX6odyddEkp2Mnwfh
 F9dBRAQ/8mzQelzQXUhDnwvTtynxiL/x3XgJcPQt0ocjxgya8EVDeqkie95YUd43f6+SriKv
X-Proofpoint-GUID: ft4nPXsxmstwxfVjVhlzsvHpeyZrNPF5
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-26_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 spamscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 mlxscore=0 phishscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2504260051
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Apr 2025 08:03:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215513

In ISO live, if the size of efi.img > 32MB, and copy EFI application
(bootx64.efi) to efi.img behind of kernel and initrd, UEFI system
could not find EFI application bootx64.efi

Using QEMU+OVMF to boot ISO live image, press ESC to enter UEFI shell:
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

In following case, add 64MB extra space to bootable image efi.img,
and the partition table of EFI is truncated to 26.3M

$ echo 'IMAGE_FSTYPES:pn-core-image-minimal = " live"' >> conf/local.conf
$ echo 'MACHINE_FEATURES:append = " efi pcbios"' >> conf/local.conf
$ echo '# 64MB extra space to bootable image efi.img' >> conf/local.conf
$ echo 'BOOTIMG_EXTRA_SPACE = "65535"' >> conf/local.conf
$ bitbake core-image-minimal
$ fdisk -l tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.rootfs.iso
...
Device                                                                 Boot Start    End Sectors  Size Id Type
tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.rootfs.iso1 *        0 376831  376832  184M  0 Empty
tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.rootfs.iso2        120  54079   53960 26.3M ef EFI (FAT-12/16/32)

According to page 11: `Figure 5 - Section Entry' in El Torito Bootable
CD-ROM Format Specification [1]. The sector count takes 2 byte which
means max sector count is 0xffff (65535), for 512-byte sector, the
size of bootable image is no more than 32MB (65536 * 512 / 1024 / 1024)

This commit truncate to 32MB if image size larger than 32MB, and
report a warning, then save the extra image sector count to
vendor unique selection criteria

After apply this commit, the partition table of EFI is truncated to 32M
$ fdisk -l tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.rootfs.iso
...
Device                                                                 Boot Start    End Sectors  Size Id Type
tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.rootfs.iso1 *        0 376831  376832  184M  0 Empty
tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.rootfs.iso2        120  65654   65535   32M ef EFI (FAT-12/16/32)

[1]https://pdos.csail.mit.edu/6.828/2017/readings/boot-cdrom.pdf

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../cdrtools/cdrtools-native_3.01.bb          |  1 +
 ...ix-nsectors-exceeds-0xffff-situation.patch | 69 +++++++++++++++++++
 2 files changed, 70 insertions(+)
 create mode 100644 meta/recipes-devtools/cdrtools/cdrtools/0001-fix-nsectors-exceeds-0xffff-situation.patch

diff --git a/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb b/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb
index 085384064d0..428202c2585 100644
--- a/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb
+++ b/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb
@@ -15,6 +15,7 @@ SRC_URI = " \
 	file://0001-Don-t-set-uid-gid-during-install.patch \
 	file://riscv64-linux-gcc.rul \
 	file://gcc14-fix.patch \
+	file://0001-fix-nsectors-exceeds-0xffff-situation.patch \
 	"
 
 SRC_URI[md5sum] = "7d45c5b7e1f78d85d1583b361aee6e8b"
diff --git a/meta/recipes-devtools/cdrtools/cdrtools/0001-fix-nsectors-exceeds-0xffff-situation.patch b/meta/recipes-devtools/cdrtools/cdrtools/0001-fix-nsectors-exceeds-0xffff-situation.patch
new file mode 100644
index 00000000000..8b0fbb3fe6d
--- /dev/null
+++ b/meta/recipes-devtools/cdrtools/cdrtools/0001-fix-nsectors-exceeds-0xffff-situation.patch
@@ -0,0 +1,69 @@
+From ab6b5ee4c23099bf15ddd145fdf1ff4f5e34e802 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Sat, 26 Apr 2025 03:38:32 +0000
+Subject: [PATCH] fix nsectors exceeds 0xffff situation
+
+According to page 11: `Figure 5 - Section Entry' in El Torito Bootable
+CD-ROM Format Specification [1]. The sector count takes 2 byte which
+means max sector count is 0xffff (65535), for 512-byte sector, the
+size of bootable image is no more than 32MB (65536 * 512 / 1024 / 1024)
+
+If the size of efi.img > 32MB, the partition table will be truncated
+in ISO, which caused UEFI system or grub-efi read efi.img broken
+occasionally.
+
+In this patch, nsectors means sector count, if it exceeds 0xffff,
+truncate to 0xffff and set selection criteria type = 2, then save
+extra nsectors to vendor unique selection criteria
+
+[1]https://pdos.csail.mit.edu/6.828/2017/readings/boot-cdrom.pdf
+
+Upstream-Status: Inappropriate [upstream https://sourceforge.net/projects/cdrtools/ is not alive since 2019]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ mkisofs/eltorito.c | 28 ++++++++++++++++++++++++++++
+ 1 file changed, 28 insertions(+)
+
+diff --git a/mkisofs/eltorito.c b/mkisofs/eltorito.c
+index 5dd04bc..a391003 100644
+--- a/mkisofs/eltorito.c
++++ b/mkisofs/eltorito.c
+@@ -568,6 +568,34 @@ fill_boot_desc(boot_desc_entry, boot_entry)
+ 	fprintf(stderr, "Extent of boot images is %d\n",
+ 				get_733(de->isorec.extent));
+ #endif
++
++	// Boot sectors exceeds 0xffff
++	if (nsectors > 0xffff) {
++		unsigned int extra_nsectors = nsectors - 0xffff;
++
++		fprintf(stderr, "Warning: Boot sectors 0x%x(%u) exceeds 0xffff(65535), save extra %u to pad2\n",
++		    nsectors, nsectors, extra_nsectors);
++
++		// Set nsectors to maximum 0xffff(65535)
++		nsectors = 0xffff;
++
++		// Offset     : 0C byte
++		// Type       : Byte
++		// Description: Selection criteria type. This defines a vendor unique format
++		// for bytes 0D-1F.
++		// The following formats is reserved by Yocto:
++		// 2 - Save extra sector count to vendor unique selection criteria
++		boot_desc_entry->pad2[0] = 2;
++
++
++		// Offset     : 0D-0E-0F-10 byte
++		// Type       : D Word
++		// Description: Save extra sector count to vendor unique selection criteria.
++		// It takes 4 bytes in pad2, starting at pad2[1]
++		set_731(&boot_desc_entry->pad2[1], extra_nsectors);
++
++	}
++
+ 	set_721(boot_desc_entry->nsect, (unsigned int) nsectors);
+ 	set_731(boot_desc_entry->bootoff,
+ 		(unsigned int) get_733(de->isorec.extent));
+-- 
+2.44.1
+
-- 
2.34.1


