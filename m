Return-Path: <egyszeregy@freemail.hu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33A73C4332F
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 13:32:22 +0000 (UTC)
Received: from smtp-out.onbox.hu (smtp-out.onbox.hu [46.107.16.227])
 by mx.groups.io with SMTP id smtpd.web12.3253.1667827931876729728
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 05:32:13 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@freemail.hu header.s=20181004 header.b=Sg3craRK;
 spf=pass (domain: freemail.hu, ip: 46.107.16.227, mailfrom: egyszeregy@freemail.hu)
Received: from localhost.localdomain (catv-178-48-208-198.catv.fixed.vodafone.hu [178.48.208.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.onbox.hu (Postfix) with ESMTPSA id 4N5XG03W7fzvvK;
	Mon,  7 Nov 2022 14:32:08 +0100 (CET)
From: egyszeregy@freemail.hu
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Benjamin=20Sz=C5=91ke?= <egyszeregy@freemail.hu>
Subject: [master][PATCH v3] image_types: Add 7-Zip support in conversion types and commands
Date: Mon,  7 Nov 2022 14:31:54 +0100
Message-Id: <20221107133154.77-1-egyszeregy@freemail.hu>
X-Mailer: git-send-email 2.38.1.windows.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvgedrvdekgdehvdculddtuddrgedvuddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucggtfgfnhhsuhgsshgtrhhisggvpdcuhfftgffgofetkffnnecuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffogggtgfesthekredtredtjeenucfhrhhomhepvghghihsiigvrhgvghihsehfrhgvvghmrghilhdrhhhunecuggftrfgrthhtvghrnhepveeuieeijeeileeuveekffevtdfhueetjeevuddvveffkeeuhfffiedvgeelvdeunecukfhppedujeekrdegkedrvddtkedrudelkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhephhgvlhhopehlohgtrghlhhhoshhtrdhlohgtrghlughomhgrihhnpdhinhgvthepudejkedrgeekrddvtdekrdduleekpdhmrghilhhfrhhomhepvghghihsiigvrhgvghihsehfrhgvvghmrghilhdrhhhupdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=simple/relaxed; t=1667827928;
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 13:32:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172841

	s=20181004; d=freemail.hu;

	h=From:To:Cc:Subject:Date:MIME-Version:Content-Type:Content-Transfer-Encoding;

	l=3481; bh=+ocFnAYqLBywMTwhkTYb/Xxz94g3hCtks9qoRJO2p8Y=;

	b=Sg3craRKzxS0UQpEPMQUeceNd92g0jd1xy3k0UlWUCzgMfVgG4GeI9zWxr3QuqSH

	vdhKuSMB5NPjHlxYczYYGDWnRj/ge7dK1/0AmZFgMDzc8gkA8BUHfmeD+ANjapvFY3P

	1nPkhGR44eQHhnUuvnfL5bvBRehXWGFvVSQ4RfkkuBclQm0kw+IhIRyreMM4qB8BTOx

	HBbjkPwVtFEyq3ksoybARxzLJJ8Iacy5YIbzSaBbKUQPoo7ZKqQpek3mAtwf4OTzKVK

	RHI7bXj1ZotV1IDrC6BwVFzUhTVzNZ0phrX+/jtyXpq8VdcD27jcBO5DqaBGYF8O6rM

	6T/RfGgquQ==
Content-Transfer-Encoding: quoted-printable

From: Benjamin Sz=C5=91ke <egyszeregy@freemail.hu>

Add 7-Zip support in conversion types and commands. Default arguments of =
7-Zip are compression level: 9, method: BZip2, extension: 7z. All these a=
re overridable from local.con for any other use case in user side. First =
goal was to make an alternative zip conversion which can operate faster i=
n multi-thread systems (on many CPU cores), normal zip is just a single t=
hread compression. 7-Zip can do a compression in multi-thread processing,=
 so it is fine to use and speed up it and 7-Zip is supported also in many=
 platform to use.

Signed-off-by: Benjamin Sz=C5=91ke <egyszeregy@freemail.hu>
---
 meta/classes-recipe/image_types.bbclass | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/image_types.bbclass b/meta/classes-recip=
e/image_types.bbclass
index 764e6a5574..ae00728a74 100644
--- a/meta/classes-recipe/image_types.bbclass
+++ b/meta/classes-recipe/image_types.bbclass
@@ -59,6 +59,10 @@ XZ_INTEGRITY_CHECK ?=3D "crc32"
=20
 ZIP_COMPRESSION_LEVEL ?=3D "-9"
=20
+7ZIP_COMPRESSION_LEVEL ?=3D "9"
+7ZIP_COMPRESSION_METHOD ?=3D "BZip2"
+7ZIP_EXTENSION ?=3D "7z"
+
 ZSTD_COMPRESSION_LEVEL ?=3D "-3"
=20
 JFFS2_SUM_EXTRA_ARGS ?=3D ""
@@ -304,7 +308,7 @@ IMAGE_TYPES:append:x86-64 =3D " hddimg iso"
 # CONVERSION_CMD/DEPENDS.
 COMPRESSIONTYPES ?=3D ""
=20
-CONVERSIONTYPES =3D "gz bz2 lzma xz lz4 lzo zip zst sum md5sum sha1sum s=
ha224sum sha256sum sha384sum sha512sum bmap u-boot vmdk vhd vhdx vdi qcow=
2 base64 gzsync zsync ${COMPRESSIONTYPES}"
+CONVERSIONTYPES =3D "gz bz2 lzma xz lz4 lzo zip 7zip zst sum md5sum sha1=
sum sha224sum sha256sum sha384sum sha512sum bmap u-boot vmdk vhd vhdx vdi=
 qcow2 base64 gzsync zsync ${COMPRESSIONTYPES}"
 CONVERSION_CMD:lzma =3D "lzma -k -f -7 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}=
.${type}"
 CONVERSION_CMD:gz =3D "gzip -f -9 -n -c --rsyncable ${IMAGE_NAME}${IMAGE=
_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.gz"
 CONVERSION_CMD:bz2 =3D "pbzip2 -f -k ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$=
{type}"
@@ -312,6 +316,7 @@ CONVERSION_CMD:xz =3D "xz -f -k -c ${XZ_COMPRESSION_L=
EVEL} ${XZ_DEFAULTS} --check=3D
 CONVERSION_CMD:lz4 =3D "lz4 -9 -z -l ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$=
{type} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.lz4"
 CONVERSION_CMD:lzo =3D "lzop -9 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type=
}"
 CONVERSION_CMD:zip =3D "zip ${ZIP_COMPRESSION_LEVEL} ${IMAGE_NAME}${IMAG=
E_NAME_SUFFIX}.${type}.zip ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
+CONVERSION_CMD:7zip =3D "7za a -mx=3D${7ZIP_COMPRESSION_LEVEL} -mm=3D${7=
ZIP_COMPRESSION_METHOD} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.${7ZIP_=
EXTENSION} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
 CONVERSION_CMD:zst =3D "zstd -f -k -T0 -c ${ZSTD_COMPRESSION_LEVEL} ${IM=
AGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}=
.${type}.zst"
 CONVERSION_CMD:sum =3D "sumtool -i ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${t=
ype} -o ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sum ${JFFS2_SUM_EXTRA_A=
RGS}"
 CONVERSION_CMD:md5sum =3D "md5sum ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${ty=
pe} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.md5sum"
@@ -337,6 +342,7 @@ CONVERSION_DEPENDS_xz =3D "xz-native"
 CONVERSION_DEPENDS_lz4 =3D "lz4-native"
 CONVERSION_DEPENDS_lzo =3D "lzop-native"
 CONVERSION_DEPENDS_zip =3D "zip-native"
+CONVERSION_DEPENDS_7zip =3D "p7zip-native"
 CONVERSION_DEPENDS_zst =3D "zstd-native"
 CONVERSION_DEPENDS_sum =3D "mtd-utils-native"
 CONVERSION_DEPENDS_bmap =3D "bmap-tools-native"
--=20
2.38.1.windows.1


