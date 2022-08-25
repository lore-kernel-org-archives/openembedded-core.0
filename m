Return-Path: <egyszeregy@freemail.hu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70492ECAA2B
	for <webhook@archiver.kernel.org>; Thu, 25 Aug 2022 19:59:41 +0000 (UTC)
Subject: [master][PATCH] image_types: add 7-Zip support in conversion types
 and commands
To: openembedded-core@lists.openembedded.org
From: "Livius" <egyszeregy@freemail.hu>
X-Originating-Location: =?utf-8?q?Stuttgart=2C_Baden-W=C3=BCrttemberg=2C_DE_?=
 =?utf-8?q?=28194=2E39=2E218=2E10=29?=
X-Originating-Platform: Windows Chrome 104
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 25 Aug 2022 12:59:34 -0700
Message-ID: <kqeP.1661457574119806544.v4b2@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="cEFV2BugEo1weHarP5t2"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Aug 2022 19:59:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169887

--cEFV2BugEo1weHarP5t2
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I added to support=C2=A07-Zip in conversion types/commands. It is fully con=
figurable in compression level, method and file extension.

From: "Benjamin Sz=C5=91ke"=C2=A0<egyszeregy@freemail.hu>
Date: Thu, 25 Aug 2022 21:45:55 +0200
Subject: [PATCH] image_types: add 7-Zip support in conversion types and=C2=
=A0commands

---
meta/classes-recipe/image_types.bbclass | 8 +++++++-
1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/image_types.bbclass b/meta/classes-recipe/=
image_types.bbclass
index a731e585b2..94aa1d9510 100644
--- a/meta/classes-recipe/image_types.bbclass
+++ b/meta/classes-recipe/image_types.bbclass
@@ -59,6 +59,10 @@ XZ_INTEGRITY_CHECK ?=3D "crc32"

ZIP_COMPRESSION_LEVEL ?=3D "-9"

+7ZIP_COMPRESSION_LEVEL ?=3D "9"
+7ZIP_COMPRESSION_METHOD ?=3D "BZip2"
+7ZIP_EXTENSION ?=3D "zip"
+
ZSTD_COMPRESSION_LEVEL ?=3D "-3"

JFFS2_SUM_EXTRA_ARGS ?=3D ""
@@ -296,7 +300,7 @@ IMAGE_TYPES:append:x86-64 =3D " hddimg iso"
# CONVERSION_CMD/DEPENDS.
COMPRESSIONTYPES ?=3D ""

-CONVERSIONTYPES =3D "gz bz2 lzma xz lz4 lzo zip zst sum md5sum sha1sum sha=
224sum sha256sum sha384sum sha512sum bmap u-boot vmdk vhd vhdx vdi qcow2 ba=
se64 gzsync zsync ${COMPRESSIONTYPES}"
+CONVERSIONTYPES =3D "gz bz2 lzma xz lz4 lzo zip 7zip zst sum md5sum sha1su=
m sha224sum sha256sum sha384sum sha512sum bmap u-boot vmdk vhd vhdx vdi qco=
w2 base64 gzsync zsync ${COMPRESSIONTYPES}"
CONVERSION_CMD:lzma =3D "lzma -k -f -7 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${=
type}"
CONVERSION_CMD:gz =3D "gzip -f -9 -n -c --rsyncable ${IMAGE_NAME}${IMAGE_NA=
ME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.gz"
CONVERSION_CMD:bz2 =3D "pbzip2 -f -k ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${ty=
pe}"
@@ -304,6 +308,7 @@ CONVERSION_CMD:xz =3D "xz -f -k -c ${XZ_COMPRESSION_LEV=
EL} ${XZ_DEFAULTS} --check=3D
CONVERSION_CMD:lz4 =3D "lz4 -9 -z -l ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${ty=
pe} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.lz4"
CONVERSION_CMD:lzo =3D "lzop -9 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
CONVERSION_CMD:zip =3D "zip ${ZIP_COMPRESSION_LEVEL} ${IMAGE_NAME}${IMAGE_N=
AME_SUFFIX}.${type}.zip ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
+CONVERSION_CMD:7zip =3D "7za a -mx=3D${7ZIP_COMPRESSION_LEVEL} -mm=3D${7ZI=
P_COMPRESSION_METHOD} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.${7ZIP_EXTE=
NSION} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
CONVERSION_CMD:zst =3D "zstd -f -k -T0 -c ${ZSTD_COMPRESSION_LEVEL} ${IMAGE=
_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${ty=
pe}.zst"
CONVERSION_CMD:sum =3D "sumtool -i ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type=
} -o ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sum ${JFFS2_SUM_EXTRA_ARGS}"
CONVERSION_CMD:md5sum =3D "md5sum ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}=
 > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.md5sum"
@@ -329,6 +334,7 @@ CONVERSION_DEPENDS_xz =3D "xz-native"
CONVERSION_DEPENDS_lz4 =3D "lz4-native"
CONVERSION_DEPENDS_lzo =3D "lzop-native"
CONVERSION_DEPENDS_zip =3D "zip-native"
+CONVERSION_DEPENDS_7zip =3D "p7zip-native"
CONVERSION_DEPENDS_zst =3D "zstd-native"
CONVERSION_DEPENDS_sum =3D "mtd-utils-native"
CONVERSION_DEPENDS_bmap =3D "bmap-tools-native"
--
2.35.1.windows.2

--cEFV2BugEo1weHarP5t2
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>I added to support&nbsp;7-Zip in conversion types/commands. It is full=
y configurable in compression level, method and file extension.</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>From: "Benjamin Sz=C5=91ke"&nbsp;&lt;egyszeregy@freemail.hu&gt;</div>
<div>Date: Thu, 25 Aug 2022 21:45:55 +0200</div>
<div>Subject: [PATCH] image_types: add 7-Zip support in conversion types an=
d&nbsp;commands</div>
<div>&nbsp;</div>
<div>---</div>
<div>&nbsp;meta/classes-recipe/image_types.bbclass | 8 +++++++-</div>
<div>&nbsp;1 file changed, 7 insertions(+), 1 deletion(-)</div>
<div>&nbsp;</div>
<div>diff --git a/meta/classes-recipe/image_types.bbclass b/meta/classes-re=
cipe/image_types.bbclass</div>
<div>index a731e585b2..94aa1d9510 100644</div>
<div>--- a/meta/classes-recipe/image_types.bbclass</div>
<div>+++ b/meta/classes-recipe/image_types.bbclass</div>
<div>@@ -59,6 +59,10 @@ XZ_INTEGRITY_CHECK ?=3D "crc32"</div>
<div>&nbsp;</div>
<div>&nbsp;ZIP_COMPRESSION_LEVEL ?=3D "-9"</div>
<div>&nbsp;</div>
<div>+7ZIP_COMPRESSION_LEVEL ?=3D "9"</div>
<div>+7ZIP_COMPRESSION_METHOD ?=3D "BZip2"</div>
<div>+7ZIP_EXTENSION ?=3D "zip"</div>
<div>+</div>
<div>&nbsp;ZSTD_COMPRESSION_LEVEL ?=3D "-3"</div>
<div>&nbsp;</div>
<div>&nbsp;JFFS2_SUM_EXTRA_ARGS ?=3D ""</div>
<div>@@ -296,7 +300,7 @@ IMAGE_TYPES:append:x86-64 =3D " hddimg iso"</div>
<div>&nbsp;# CONVERSION_CMD/DEPENDS.</div>
<div>&nbsp;COMPRESSIONTYPES ?=3D ""</div>
<div>&nbsp;</div>
<div>-CONVERSIONTYPES =3D "gz bz2 lzma xz lz4 lzo zip zst sum md5sum sha1su=
m sha224sum sha256sum sha384sum sha512sum bmap u-boot vmdk vhd vhdx vdi qco=
w2 base64 gzsync zsync ${COMPRESSIONTYPES}"</div>
<div>+CONVERSIONTYPES =3D "gz bz2 lzma xz lz4 lzo zip 7zip zst sum md5sum s=
ha1sum sha224sum sha256sum sha384sum sha512sum bmap u-boot vmdk vhd vhdx vd=
i qcow2 base64 gzsync zsync ${COMPRESSIONTYPES}"</div>
<div>&nbsp;CONVERSION_CMD:lzma =3D "lzma -k -f -7 ${IMAGE_NAME}${IMAGE_NAME=
_SUFFIX}.${type}"</div>
<div>&nbsp;CONVERSION_CMD:gz =3D "gzip -f -9 -n -c --rsyncable ${IMAGE_NAME=
}${IMAGE_NAME_SUFFIX}.${type} &gt; ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type=
}.gz"</div>
<div>&nbsp;CONVERSION_CMD:bz2 =3D "pbzip2 -f -k ${IMAGE_NAME}${IMAGE_NAME_S=
UFFIX}.${type}"</div>
<div>@@ -304,6 +308,7 @@ CONVERSION_CMD:xz =3D "xz -f -k -c ${XZ_COMPRESSIO=
N_LEVEL} ${XZ_DEFAULTS} --check=3D</div>
<div>&nbsp;CONVERSION_CMD:lz4 =3D "lz4 -9 -z -l ${IMAGE_NAME}${IMAGE_NAME_S=
UFFIX}.${type} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.lz4"</div>
<div>&nbsp;CONVERSION_CMD:lzo =3D "lzop -9 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX=
}.${type}"</div>
<div>&nbsp;CONVERSION_CMD:zip =3D "zip ${ZIP_COMPRESSION_LEVEL} ${IMAGE_NAM=
E}${IMAGE_NAME_SUFFIX}.${type}.zip ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type=
}"</div>
<div>+CONVERSION_CMD:7zip =3D "7za a -mx=3D${7ZIP_COMPRESSION_LEVEL} -mm=3D=
${7ZIP_COMPRESSION_METHOD} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.${7ZIP=
_EXTENSION} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"</div>
<div>&nbsp;CONVERSION_CMD:zst =3D "zstd -f -k -T0 -c ${ZSTD_COMPRESSION_LEV=
EL} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} &gt; ${IMAGE_NAME}${IMAGE_NAM=
E_SUFFIX}.${type}.zst"</div>
<div>&nbsp;CONVERSION_CMD:sum =3D "sumtool -i ${IMAGE_NAME}${IMAGE_NAME_SUF=
FIX}.${type} -o ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sum ${JFFS2_SUM_E=
XTRA_ARGS}"</div>
<div>&nbsp;CONVERSION_CMD:md5sum =3D "md5sum ${IMAGE_NAME}${IMAGE_NAME_SUFF=
IX}.${type} &gt; ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.md5sum"</div>
<div>@@ -329,6 +334,7 @@ CONVERSION_DEPENDS_xz =3D "xz-native"</div>
<div>&nbsp;CONVERSION_DEPENDS_lz4 =3D "lz4-native"</div>
<div>&nbsp;CONVERSION_DEPENDS_lzo =3D "lzop-native"</div>
<div>&nbsp;CONVERSION_DEPENDS_zip =3D "zip-native"</div>
<div>+CONVERSION_DEPENDS_7zip =3D "p7zip-native"</div>
<div>&nbsp;CONVERSION_DEPENDS_zst =3D "zstd-native"</div>
<div>&nbsp;CONVERSION_DEPENDS_sum =3D "mtd-utils-native"</div>
<div>&nbsp;CONVERSION_DEPENDS_bmap =3D "bmap-tools-native"</div>
<div>--&nbsp;</div>
<div>2.35.1.windows.2</div>
<div>&nbsp;</div>

--cEFV2BugEo1weHarP5t2--

