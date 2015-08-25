Return-Path: <Noor_Ahsan@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 10F9265CCD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 17:46:10 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-02.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1ZUIIT-000425-Vb from Noor_Ahsan@mentor.com ;
	Tue, 25 Aug 2015 10:46:10 -0700
Received: from EU-MBX-01.mgc.mentorg.com ([169.254.1.194]) by
	SVR-IES-FEM-02.mgc.mentorg.com ([137.202.0.106]) with mapi id
	14.03.0224.002; Tue, 25 Aug 2015 18:46:09 +0100
From: "Ahsan, Noor" <Noor_Ahsan@mentor.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 12/17] image_types.bbclass: add wic image type
Thread-Index: AQHQ3xUrXGmiNLxFDkmuhqIfjfgPAp4c/WXQ
Date: Tue, 25 Aug 2015 17:46:08 +0000
Message-ID: <365E1805BC95084CBE82381A0B86999401095CC0C4@EU-MBX-01.mgc.mentorg.com>
References: <cover.1440492980.git.ed.bartosh@linux.intel.com>
	<5615adf8a3d194f11430dc722ae518698cb9b31c.1440492980.git.ed.bartosh@linux.intel.com>
In-Reply-To: <5615adf8a3d194f11430dc722ae518698cb9b31c.1440492980.git.ed.bartosh@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.202.0.76]
MIME-Version: 1.0
Subject: Re: [PATCH 12/17] image_types.bbclass: add wic image type
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
X-List-Received-Date: Tue, 25 Aug 2015 17:46:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Would it not be better approach if we don't hardcore the name and path and =
handle it using some variable?

Noor

-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Ed Bartosh
Sent: Tuesday, August 25, 2015 2:04 PM
To: openembedded-core@lists.openembedded.org
Subject: [OE-core] [PATCH 12/17] image_types.bbclass: add wic image type

wic image type is used to produce partitioned images.

Image configuration should be stored in either <recipe>.<machine>.wks or <r=
ecipe>.wks file.
.wks file should be put to the same location as image recipe and have the s=
ame name.

[YOCTO #7672]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/classes/image_types.bbclass | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bb=
class
index 8547574..cdd66ff 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -154,6 +154,16 @@ IMAGE_CMD_ubi =3D "multiubi_mkfs "${MKUBIFS_ARGS}" "${=
UBINIZE_ARGS}" "${UBI_VOLNAM
=20
 IMAGE_CMD_ubifs =3D "mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${DEPLOY_DIR_IMAGE}/=
${IMAGE_NAME}.rootfs.ubifs ${MKUBIFS_ARGS}"
=20
+IMAGE_CMD_wic () {
+	out=3D${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}
+	wks=3D${FILE_DIRNAME}/${IMAGE_BASENAME}.${MACHINE}.wks
+	[ -e $wks ] || wks=3D${FILE_DIRNAME}/${IMAGE_BASENAME}.wks
+	[ -e $wks ] || bbfatal "Kiskstart file $wks doesn't exist"
+	BUILDDIR=3D${TOPDIR} wic create $wks --vars ${STAGING_DIR_TARGET}/imgdata=
/ -e ${IMAGE_BASENAME} -o $out/
+	mv $out/build/${IMAGE_BASENAME}*.direct $out.rootfs.wic
+	rm -rf $out/
+}
+
 EXTRA_IMAGECMD =3D ""
=20
 inherit siteinfo
@@ -182,6 +192,7 @@ IMAGE_DEPENDS_elf =3D "virtual/kernel mkelfimage-native=
"
 IMAGE_DEPENDS_ubi =3D "mtd-utils-native"
 IMAGE_DEPENDS_ubifs =3D "mtd-utils-native"
 IMAGE_DEPENDS_multiubi =3D "mtd-utils-native"
+IMAGE_DEPENDS_wic =3D "parted-native"
=20
 # This variable is available to request which values are suitable for IMAG=
E_FSTYPES  IMAGE_TYPES =3D " \ @@ -201,6 +212,7 @@ IMAGE_TYPES =3D " \
     vdi \
     qcow2 \
     elf \
+    wic wic.gz wic.bz2 wic.lzma \
 "
=20
 COMPRESSIONTYPES =3D "gz bz2 lzma xz lz4 sum"
--
2.1.4

--
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core

