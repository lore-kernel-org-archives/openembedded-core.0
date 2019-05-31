Return-Path: <chee.yang.lee@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id EC1557CFA4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2019 08:10:59 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	31 May 2019 01:11:01 -0700
X-ExtLoop1: 1
Received: from pgsmsx113.gar.corp.intel.com ([10.108.55.202])
	by orsmga001.jf.intel.com with ESMTP; 31 May 2019 01:11:00 -0700
Received: from pgsmsx103.gar.corp.intel.com ([169.254.2.93]) by
	pgsmsx113.gar.corp.intel.com ([169.254.6.39]) with mapi id
	14.03.0415.000; Fri, 31 May 2019 16:10:51 +0800
From: "Lee, Chee Yang" <chee.yang.lee@intel.com>
To: "Lee, Chee Yang" <chee.yang.lee@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [meta-intel][PATCH v2] wic: add image-installer.wks.in
Thread-Index: AQHVF4hEYLs5dZN0kUCaphanEcpNeaaE4Yqg
Date: Fri, 31 May 2019 08:10:50 +0000
Message-ID: <231DEE2556DE094BBC743089035D8B2A1F2588D7@PGSMSX103.gar.corp.intel.com>
References: <1559290184-54222-1-git-send-email-chee.yang.lee@intel.com>
In-Reply-To: <1559290184-54222-1-git-send-email-chee.yang.lee@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiYTFhNjFhMTQtMGVlNC00ZGVkLWIyMTctNTdjYTMyZGQwYmNkIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiVml2MGN3allFSzlEcFpCUW13aW5ncXk1MW5qbWcrSFNyd2lzZDJ2S1lrdktqOTFDZlpuak93U0JpUU5DR25YNyJ9
dlp-product: dlpe-windows
dlp-version: 11.0.600.7
dlp-reaction: no-action
x-originating-ip: [172.30.20.205]
MIME-Version: 1.0
Subject: Re: [meta-intel][PATCH v2] wic: add image-installer.wks.in
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 31 May 2019 08:11:00 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

PLEASE IGNORE THIS EMAIL

-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org <openembedded-core-b=
ounces@lists.openembedded.org> On Behalf Of chee.yang.lee@intel.com
Sent: Friday, May 31, 2019 4:10 PM
To: openembedded-core@lists.openembedded.org
Subject: [OE-core] [meta-intel][PATCH v2] wic: add image-installer.wks.in

From: Chee Yang Lee <chee.yang.lee@intel.com>

This wks.in create image that perform installation similar to hddimg.
Partition in ext4 format allow rootfs size to be greater than hddimg limit =
which is  4GB.

To build simple installer image, add below configuration to local.conf:

WKS_FILE =3D "image-installer.wks.in"
IMAGE_FSTYPES_append =3D " ext4"
IMAGE_TYPEDEP_wic =3D "ext4"
INITRD_IMAGE_LIVE=3D"core-image-minimal-initramfs"
do_image_wic[depends] +=3D "${INITRD_IMAGE_LIVE}:do_image_complete"
do_rootfs[depends] +=3D "virtual/kernel:do_deploy"
IMAGE_BOOT_FILES_append =3D "\
    ${KERNEL_IMAGETYPE} \
    microcode.cpio \
    systemd-bootx64.efi;EFI/BOOT/bootx64.efi \
    ${IMAGE_ROOTFS}/boot/loader/loader.conf;loader/loader.conf \
    ${IMAGE_ROOTFS}/boot/loader/entries/boot.conf;loader/entries/boot.conf =
\
    ${IMGDEPLOYDIR}/${IMAGE_BASENAME}-${MACHINE}.ext4;rootfs.img \
    "

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
---
 wic/image-installer.wks.in | 8 ++++++++
 1 file changed, 8 insertions(+)
 create mode 100644 wic/image-installer.wks.in

diff --git a/wic/image-installer.wks.in b/wic/image-installer.wks.in new fi=
le mode 100644 index 0000000..58bcfd5
--- /dev/null
+++ b/wic/image-installer.wks.in
@@ -0,0 +1,8 @@
+# create an installer disk image
+# populate content to install using IMAGE_BOOT_FILES
+
+part /boot --source bootimg-efi=20
+--sourceparams=3D"loader=3D${EFI_PROVIDER},title=3Dinstall,label=3Dinstall=
-efi,
+initrd=3D${INITRD_IMAGE_LIVE}-${MACHINE}.${INITRAMFS_FSTYPES}" --ondisk=20
+sda --label install --active --align 1024 --use-uuid
+
+part / --source bootimg-partition --ondisk sda --fstype=3Dext4 --label=20
+image --use-uuid --align 1024
+
+bootloader --ptable gpt --timeout=3D5 --append=3D"rootwait ${APPEND}"
--
2.7.4

--
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core

