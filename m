Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64A74C369DC
	for <webhook@archiver.kernel.org>; Wed, 30 Apr 2025 04:44:18 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.9673.1745988253423973334
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Apr 2025 21:44:13 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=72153bdf48=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53U4Ikn4025780
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 04:44:12 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46b6ug0bbt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 04:44:12 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 29 Apr 2025 21:44:10 -0700
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Tue, 29 Apr 2025 21:44:10 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [walnascar][PATCH 2/2] syslinux: improve isohybrid to process extra sector count for ISO 9660 image
Date: Wed, 30 Apr 2025 12:44:08 +0800
Message-ID: <20250430044408.3908197-2-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250430044408.3908197-1-hongxu.jia@windriver.com>
References: <20250430044408.3908197-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=Xf6JzJ55 c=1 sm=1 tr=0 ts=6811aa9c cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=Gz7s5_CCAAAA:8 a=oGMlB6cnAAAA:8 a=t7CeM3EgAAAA:8 a=P-IC7800AAAA:8 a=ag1SF4gXAAAA:8
 a=ao50Rt7OrhGA5-BBdtEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=NdAtdrkLVvyUPsUoGJp4:22 a=FdTzh2GWekK77mhwV6Dw:22 a=d3PnA9EDa4IxuAV0gXij:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-GUID: POMPoQ-v5wUyJJXdvbOA4lWo9icipA2l
X-Proofpoint-ORIG-GUID: POMPoQ-v5wUyJJXdvbOA4lWo9icipA2l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDAzMCBTYWx0ZWRfX2LyZxpAYVMGR QOcT5chVUBUpqpH5J/M8mjzikiFeZ/SDZB8r1+IntGrvfigH4ra4wLDayz1q9k2i7T5Qnz+XlfO c6+jdG0qmTaON3Z7RjFckDyEFjpdoIzi5JNidWu+Fgih+1ozDRo6wl2FJmDQak6VShlRJ0QaKdX
 xQGM4VGvFaaJ0Kg8XhST+prOPJhYQolfG9R+zOxZEm6jRACROCFY6pTJRoljNlp332e8EVjsunN QjlSwhNPyzXXtTfP84cIvE5L12rSiEOCk2tz6suUuv9dHnc6U/Wt+gnhpETLJLiLUzb9BjKA69R ZNoSBd1LenS9buyJtJZUmDLKJNasnydjeQTA7+9liKE+V9s1QjGHX0dboFqHjHR2bahsnBRamIz
 Ya1LPUnt5jHKjelRVi2c7kpTqly+Pyf5h1Kx6vC2q3x6fgblu6tmZ1p9gFj65BPhQr+9lKaR
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 adultscore=0 suspectscore=0 spamscore=0 mlxscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2504300030
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 53U4Ikn4025780
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 04:44:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215723

Due to commit [cdrtools-native: fix booting EFI ISO live failed]
applied to improve mkisofs to fix nsectors exceeds 0xffff situation
which set selection criteria type =3D 2 and save extra nsectors to
vendor unique selection criteria

In following case, add 64MB extra space to bootable image efi.img,
and the partition table of EFI is truncated to 32M

$ echo 'IMAGE_FSTYPES:pn-core-image-minimal =3D " live"' >> conf/local.co=
nf
$ echo 'MACHINE_FEATURES:append =3D " efi pcbios"' >> conf/local.conf
$ echo '# 64MB extra space to bootable image efi.img' >> conf/local.conf
$ echo 'BOOTIMG_EXTRA_SPACE =3D "65535"' >> conf/local.conf
$ bitbake core-image-minimal
$ fdisk -l tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.roo=
tfs.iso
...
Device                                                                 Bo=
ot Start    End Sectors  Size Id Type
tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.rootfs.iso1 * =
       0 376831  376832  184M  0 Empty
tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.rootfs.iso2   =
     120  65654   65535   32M ef EFI (FAT-12/16/32)

After applying this patch to process extra sector count, the partition
table of EFI is 90.3M

$ fdisk -l tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.roo=
tfs.iso
...
Device                                                                 Bo=
ot Start    End Sectors  Size Id Type
tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.rootfs.iso1 * =
       0 376831  376832  184M  0 Empty
tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.rootfs.iso2   =
     120 185151  185032 90.3M ef EFI (FAT-12/16/32)

[1]https://pdos.csail.mit.edu/6.828/2017/readings/boot-cdrom.pdf

(From OE-Core rev: b4e112ed7e6ba5a6c6df530d696485a588831851)

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...-count-from-section-entry-for-EFI-ca.patch | 104 ++++++++++++++++++
 .../syslinux/syslinux_6.04-pre2.bb            |   1 +
 2 files changed, 105 insertions(+)
 create mode 100644 meta/recipes-devtools/syslinux/syslinux/0001-Add-extr=
a-sector-count-from-section-entry-for-EFI-ca.patch

diff --git a/meta/recipes-devtools/syslinux/syslinux/0001-Add-extra-secto=
r-count-from-section-entry-for-EFI-ca.patch b/meta/recipes-devtools/sysli=
nux/syslinux/0001-Add-extra-sector-count-from-section-entry-for-EFI-ca.pa=
tch
new file mode 100644
index 00000000000..5422d9b2dea
--- /dev/null
+++ b/meta/recipes-devtools/syslinux/syslinux/0001-Add-extra-sector-count=
-from-section-entry-for-EFI-ca.patch
@@ -0,0 +1,104 @@
+From 79a26046d178ae132cb88ba75de7141bd169ff16 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Sat, 26 Apr 2025 10:45:08 +0800
+Subject: [PATCH] Add extra sector count from section entry for EFI catal=
ogue
+
+According to page 11: `Figure 5 - Section Entry' in El Torito Bootable
+CD-ROM Format Specification [1]. The sector count tooks 2 byte which
+means max sector count is 0xffff (65535), for 512-byte sector, the
+size of bootable image is no more than 32MB (65536 * 512 / 1024 / 1024)
+
+If the size of efi.img > 32MB, the partition table will be truncated
+in ISO, which caused UEFI system or grub-efi read efi.img broken
+occasionally.
+
+This patch extend efi_count, mac_count and count to 4 byte int, if
+Yocto defines `Selection criteria type =3D 2', add extra sector count
+to original sector count as total count; for other situation, still use
+original sector count as usual
+
+[1]https://pdos.csail.mit.edu/6.828/2017/readings/boot-cdrom.pdf
+
+Upstream-Status: Inappropriate [Yocto specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ utils/isohybrid.c | 48 ++++++++++++++++++++++++++++++++++++++++++-----
+ 1 file changed, 43 insertions(+), 5 deletions(-)
+
+diff --git a/utils/isohybrid.c b/utils/isohybrid.c
+index a9e38d4..1bbfd45 100644
+--- a/utils/isohybrid.c
++++ b/utils/isohybrid.c
+@@ -76,7 +76,7 @@ uint32_t de_lba =3D 0;
+ uint16_t de_seg =3D 0, de_count =3D 0, de_mbz2 =3D 0;
+ uint8_t de_boot =3D 0, de_media =3D 0, de_sys =3D 0, de_mbz1 =3D 0;
+ uint32_t efi_lba =3D 0, mac_lba =3D 0;
+-uint16_t efi_count =3D 0, mac_count =3D 0;
++uint32_t efi_count =3D 0, mac_count =3D 0;
+ uint8_t efi_boot =3D 0, efi_media =3D 0, efi_sys =3D 0;
+=20
+ int apm_parts =3D 3;
+@@ -552,17 +552,55 @@ read_efi_section(const uint8_t *buf)
+ }
+=20
+ int
+-read_efi_catalogue(const uint8_t *buf, uint16_t *count, uint32_t *lba)
++read_efi_catalogue(const uint8_t *buf, uint32_t *count, uint32_t *lba)
+ {
++    uint16_t _count =3D 0;
++
++    // Jump to offset 6 byte
+     buf +=3D 6;
+=20
+-    memcpy(count, buf, 2);
+-    *count =3D lendian_short(*count);
++    *count =3D 0;
++
++    // Offset     : 6-7 byte
++    // Type       : Word
++    // Description: Sector Count, the number of virtual/emulated sector=
s
++    // the system will store at Load Segment during the initial boot pr=
ocedure
++    memcpy(&_count, buf, 2);
++    _count =3D lendian_short(_count);
+     buf +=3D 2;
+=20
++    // Offset     : 8-0B byte
++    // Type       : D Word
++    // Description: Load RBA. This is the start address of the virtual =
disk. CD=E2=80=99s use
++    // Relative/Logical block addressing.
+     memcpy(lba, buf, 4);
+     *lba =3D lendian_int(*lba);
+-    buf +=3D 6;
++    buf +=3D 4;
++
++    // Offset     : 0C byte
++    // Type       : Byte
++    // Description: Selection criteria type. This defines a vendor uniq=
ue format
++    // for bytes 0D-1F.
++    // The following formats have currently been assigned:
++    // 0 - No selection criteria
++    // 1 - Language and Version Information (IBM)
++    // 2 - Save extra sector count to vendor unique selection criteria =
(Yocto)
++    // 3-FF - Reserved
++    unsigned char slection_criteria_type =3D *buf;
++    buf +=3D 1;
++
++    // Offset     : 0D-0E-0F-10 byte
++    // Type       : D Word
++    // Description: Selection criteria type =3D 2, reserved by Yocto,
++    // save extra sector count to vendor unique selection criteria
++    if (slection_criteria_type =3D=3D 2) {
++        memcpy(count, buf, 4);
++        *count =3D lendian_int(*count);
++        buf +=3D 4;
++    }
++
++    // total count =3D sector count + extra sector count
++    *count +=3D _count;
+=20
+     return 0;
+ }
+--=20
+2.34.1
+
diff --git a/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb b/meta/=
recipes-devtools/syslinux/syslinux_6.04-pre2.bb
index 7cf737170c3..2522205fa1c 100644
--- a/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
+++ b/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
@@ -23,6 +23,7 @@ SRC_URI =3D "https://www.zytor.com/pub/syslinux/Testing=
/6.04/syslinux-${PV}.tar.xz
            file://0013-remove-clean-script.patch \
            file://0014-Fix-reproducibility-issues.patch \
            file://0001-ext2_fs.h-do-not-carry-an-outdated-copy.patch \
+           file://0001-Add-extra-sector-count-from-section-entry-for-EFI=
-ca.patch \
            "
=20
 SRC_URI[md5sum] =3D "2b31c78f087f99179feb357da312d7ec"
--=20
2.34.1


