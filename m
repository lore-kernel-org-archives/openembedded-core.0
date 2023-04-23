Return-Path: <christoph.lauer@email.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 202A2C77B73
	for <webhook@archiver.kernel.org>; Sun, 23 Apr 2023 08:13:24 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.17.11])
 by mx.groups.io with SMTP id smtpd.web11.23675.1682237594367661806
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Apr 2023 01:13:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=christoph.lauer@email.de header.s=s29768273 header.b=Y2ytxIir;
 spf=pass (domain: email.de, ip: 212.227.17.11, mailfrom: christoph.lauer@email.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=email.de;
	s=s29768273; t=1682237590; i=christoph.lauer@email.de;
	bh=nyErMOK3BN3QeiugDbJAgLxFTOkb60j6CZkebek5w5Q=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=Y2ytxIirMpgMWPHjam7d2gHChxtDjI3sUvXOb/lSEvfyUFd6dNgB4/iFVvCXkCvmU
	 UTi38cu9Bg/hlH8BHak9MbrSaQLRxseBiLXDunjBFHwobTmIm46NyGRc+ruIscSESC
	 6CpyqlQnCBzVGa4BlCkPDI54ViEkVIaVWTYv0rUodvktFS51y67ZSTOJBbvp3GpOJu
	 iqUjI4nbvXcijfYjnjzy/rdi8MklhbvP4WPTZ1ommpsRlYg7TReorjxjsgmggT3eI9
	 d0t3YhLlVklRT8bWCJHJMmJBMqhN8Ug38krOorBRcuT+GH5mjD6u+7cRJdHkNbtl/Y
	 8yIsBcevJEI/w==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from xtr-acuyocto-p01.xtronic-net.com ([178.251.90.190]) by
 smtp.web.de (mrweb106 [213.165.67.124]) with ESMTPSA (Nemesis) id
 1MUCuv-1piQFx1c7X-00R2z2; Sun, 23 Apr 2023 10:13:10 +0200
From: Christoph Lauer <christoph.lauer@email.de>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Christoph Lauer <christoph.lauer@xtronic.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [dunfell][PATCH] populate_sdk_base: add zip options
Date: Sun, 23 Apr 2023 10:12:04 +0200
Message-Id: <20230423081204.47276-1-christoph.lauer@email.de>
X-Mailer: git-send-email 2.17.1
X-Provags-ID: V03:K1:TSBsJNMdoEQQ6eW4kSX1B1qy45bL5RkrL/tiqV0Y53z0W0OUu5V
 HDKSGq0PgRT2+4k8vs5MlcSuk2TYEtWvnBVebFwDvti16OeSFsrj4wBz00TtS1Fa1qqcTaw
 f4V4iucSvX3MHcOhx/sn5I1C2AjgoxTOP+ywWGVZGOu7H6mjSCsscvec75QXhm3pw/v0Ayv
 gZDknu4AyFn4XXzZU4rdQ==
UI-OutboundReport: notjunk:1;M01:P0:cXyXfI6OPA0=;jD1HnbuUEnDcaWEc+ho4qejoBGT
 MpHBEI+bD/viWldq5va1Ppk3MzHLp4ZFadjHDqFzfS8VZUoLC8Nv0etrF53O4u/NY021zt2KY
 1OJhJQHDJl52WoAlocDuRWPaLnJWX/Jq1yrKzMLDrn6tBmVz9196CB8cFBH3UlSCwZ6CYZ9Gl
 UGo68aBHg/AqLvckkbmA+Qllbg3fMQFesgBe5cXb8rlZqc5EcYqbHYU3xwSfKUhQfqcEhinuW
 nhMW42acvPwMEAQxLcgj3I5aDrzgmDK1313wkul7pNGkIIHMEVWsj/xaSXA3UAOl5s9ZEvMBO
 RQ7tQQvMkYB43GVhyWdzVwL6rHEDM45hYW6rOR6cn1scRg2NKkaxLemr5aPoYNEKfgyNk1DN9
 OoW2tC0luDvyz65ixqhdrjf2MqDWCiCoHQXLV6zg7GzhlMVIG70/6X+FqfNNRJzB4SDkIkgfQ
 uTxm7cYM3KLUKnlc1N9VF4vI7AYteFZFZgGVGf/aEeADOghHVZe1/5/QfLAYCPSiuV/18kKwi
 SxbfXTI8k6vAw/VycKaUvyi/y2MazzDgomAzHiXRYtOQ4eW8O2EjNlCk1aBnBHPYOajnioI0W
 ds/zQy/H5xACBxC0iKkwiRmHXBkelLyGm3SsKyAkj6LmE31LeL1UNTsWt7a7MxRttX8o+rYV+
 S6Hmxf0u+r9X18z7qlhQoYFcBuF6Ol5LeqHsbtut8Ey5CeekNdLzHTqOwhc/1SpTvxjF/c8x8
 vbn32nb+82lp/KXIuY42y5g9DC/XUk6gKmX1Ei5mOM4TBjEBFI0TFvb7JsqYo3k5AZFyhzMkZ
 VgpQckZb7jmwbzXMQf6DDO2uHtKpgQz8qMAc+4AZoP3RLidc4mxUq1rl/yGbolb/sctE9kRcY
 ZBRgY66wcGdCVPWIKLDCDpNAy8qn7aE01puQeQ8GfJu4Krr/BFKwmLnlizLirYbdTDf+8Jf9Y
 c4Bo2w==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 23 Apr 2023 08:13:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180328

From: Christoph Lauer <christoph.lauer@xtronic.de>

Add SDK_ZIP_OPTIONS to remove symbolic link creation in zip archive or add=
 options, e.g. for encryption of the zip archive.

(From OE-Core rev: 04b62f9459b401c276255f166d0738b6f902a576)

Signed-off-by: Christoph Lauer <christoph.lauer@xtronic.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
=2D--
 meta/classes/populate_sdk_base.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populat=
e_sdk_base.bbclass
index 396792f0f7..49fdfaa93d 100644
=2D-- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -51,6 +51,8 @@ TOOLCHAIN_OUTPUTNAME ?=3D "${SDK_NAME}-toolchain-${SDK_V=
ERSION}"
 SDK_ARCHIVE_TYPE ?=3D "tar.xz"
 SDK_XZ_COMPRESSION_LEVEL ?=3D "-9"
 SDK_XZ_OPTIONS ?=3D "${XZ_DEFAULTS} ${SDK_XZ_COMPRESSION_LEVEL}"
+SDK_ZIP_OPTIONS ?=3D "-y"
+

 # To support different sdk type according to SDK_ARCHIVE_TYPE, now suppor=
t zip and tar.xz
 python () {
@@ -58,7 +60,7 @@ python () {
        d.setVar('SDK_ARCHIVE_DEPENDS', 'zip-native')
        # SDK_ARCHIVE_CMD used to generate archived sdk ${TOOLCHAIN_OUTPUT=
NAME}.${SDK_ARCHIVE_TYPE} from input dir ${SDK_OUTPUT}/${SDKPATH} to outpu=
t dir ${SDKDEPLOYDIR}
        # recommand to cd into input dir first to avoid archive with build=
path
-       d.setVar('SDK_ARCHIVE_CMD', 'cd ${SDK_OUTPUT}/${SDKPATH}; zip -r -=
y ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.${SDK_ARCHIVE_TYPE} .')
+       d.setVar('SDK_ARCHIVE_CMD', 'cd ${SDK_OUTPUT}/${SDKPATH}; zip -r $=
{SDK_ZIP_OPTIONS} ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.${SDK_ARCHIVE_TY=
PE} .')
     else:
        d.setVar('SDK_ARCHIVE_DEPENDS', 'xz-native')
        d.setVar('SDK_ARCHIVE_CMD', 'cd ${SDK_OUTPUT}/${SDKPATH}; tar ${SD=
KTAROPTS} -cf - . | xz ${SDK_XZ_OPTIONS} > ${SDKDEPLOYDIR}/${TOOLCHAIN_OUT=
PUTNAME}.${SDK_ARCHIVE_TYPE}')
=2D-
2.17.1


