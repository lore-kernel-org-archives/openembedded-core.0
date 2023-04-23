Return-Path: <christoph.lauer@email.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CA9EC77B73
	for <webhook@archiver.kernel.org>; Sun, 23 Apr 2023 08:15:04 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.15.4])
 by mx.groups.io with SMTP id smtpd.web10.23949.1682237699531250375
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Apr 2023 01:15:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=christoph.lauer@email.de header.s=s29768273 header.b=wk4uj0ym;
 spf=pass (domain: email.de, ip: 212.227.15.4, mailfrom: christoph.lauer@email.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=email.de;
	s=s29768273; t=1682237696; i=christoph.lauer@email.de;
	bh=Hv1nY0lUvknBP4Oxv5fvvIbTwq2DIfoB16SqICpQMQc=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=wk4uj0ymLy/qsYAXYG2vlnt3S2D/IyMMPO6xJyQETuxBwLr3L3q4a8x601yqk46Rd
	 Z0yLP7XCvgrBsGmokYmWFhakB1YueACza1CopGY6k61vEFW/xzKy14Zt7QmLwNQaNg
	 cB7tt9X4Tc3cXfPWk0cSWnJL2qdF+2Xlz/Ag7PAIBR7Nz98OySKHcoSgv0WNV02Amh
	 zUqj8rmUVF3D1e2c9KiEccy+rOEkjuNFg/dGWl1ODcMSjRxzzS/J2HYqZJIlP4Q4K1
	 vcPokUXbiuPW77QJ4VS3HhGGQc/P5fWfzJsHPAAq8tzLOecxCdmgpp6IL/5aQLQMsz
	 yCd2gKdbgvjHg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from xtr-acuyocto-p01.xtronic-net.com ([178.251.90.190]) by
 smtp.web.de (mrweb005 [213.165.67.108]) with ESMTPSA (Nemesis) id
 1MkElZ-1qamvR2Dxx-00kGUm; Sun, 23 Apr 2023 10:14:56 +0200
From: Christoph Lauer <christoph.lauer@email.de>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Christoph Lauer <christoph.lauer@xtronic.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [langdale][PATCH] populate_sdk_base: add zip options
Date: Sun, 23 Apr 2023 10:14:54 +0200
Message-Id: <20230423081454.47808-1-christoph.lauer@email.de>
X-Mailer: git-send-email 2.17.1
X-Provags-ID: V03:K1:PkncapjQTu972mGBYrMWNKDmIsMDGS5bnzzhAJFBHFvpsmJz8k0
 xBhLSdsbjzWUCeWh6GCHNRfQOYqN3DLUTgasJJsm5+xqSOEo4Ol4u4GLzK8j0JCZ6Lezuac
 8xuP7OVltmyY9NoR1xYKVWirETwLEeLGholclT288jKMOSSaj0CTnr51rIYevM+RtswbUq6
 8zJxDbrr4q6Mv/llMEUxw==
UI-OutboundReport: notjunk:1;M01:P0:i1Rqbd6lYnY=;5ROT9lYn7Ig52IvBLy4A2woDqhB
 WtHl52tHyvt17Celmg5YYOax8FIUbz3iM1jHEPUT57W/5anqs7gXS/ey5KG92OXzE2MATUrkM
 2FWrnZNgDkJRgn23Sp6imSm9pZhX5j9RKBlBhFTaZTouLx07mJ7qY3w0Jiv/yhbYi6Xe34lmr
 bkAbXkJeANWquZtLpWgx0u0wvpy/+JlpgVzeXm6oCvIWrszCwmRP6t4+VsApLeQnzVwINA7lm
 VCzV0a/1oDFDahXJ+KzcIWTjxPVn8lteQ1EGWAM8Y+oFjwEFhI9JqzdNmgqFpbNtb4a7QAB1c
 YLnkzx9CznKsl+3nIOHoXX7VmQkzzxx00yS4Lbk2SbORyHyREoFULa0lzX3LSon8ahtj5nfQp
 59/rRv2JnOdRo3SQDcbhiYk4NTRTNsStJRbqYUiv3vLyMxr9sn87txg8ept1JQ4pvN/YeO8oI
 x8Ja970OHyrX3C5o/ZRAPfuuV9wJrzq0YNA5oK1VD00OhMbLqXf2fHJJgByhAXM1FxNQKm7z4
 /XbsnS/rvgp1CiZ23mgYZMnyqh9S8r9JdpW5MdNqzJv9FdWAdA5ViUvkC3r46kSAXH54wgibL
 PH2RZYnn/prpb+3KmxflCo6Kjc6jdErDF2oDoQlpb7XB8wMsCH7V7JAxaVviQDMM4q5trTXmA
 FM2ejzCOyWh1ipMC/FRtpB55hcchaBroOWdJUShkTLOzJhmV9o5EmvBy9uw7dJoRdFUhctXMI
 vajMPTHYSAJGcWrHER8DAn2UV1xx5YEyWUoGEdbZhJm/RJ8hW20DksxGsbnlEN81zxX3vIfR6
 xlE/oa8RgvVL334Iz1V+ybWaOVm4+DZr1kmSvOr//aSsXogcz7BXcQ4zz9ORjglUauks3H+Eb
 1cWktejo5eF8LtU7fIu5VmUAgyMs5Wo954UL9KMfOJ/pTRFThxu38BY8+Bk2TrJMgvD1ZJtso
 7NS2yQ==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 23 Apr 2023 08:15:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180330

From: Christoph Lauer <christoph.lauer@xtronic.de>

Add SDK_ZIP_OPTIONS to remove symbolic link creation in zip archive or add=
 options, e.g. for encryption of the zip archive.

(From OE-Core rev: 04b62f9459b401c276255f166d0738b6f902a576)

Signed-off-by: Christoph Lauer <christoph.lauer@xtronic.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
=2D--
 meta/classes-recipe/populate_sdk_base.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/populate_sdk_base.bbclass b/meta/classes-=
recipe/populate_sdk_base.bbclass
index 70b3f1974e..6286d64233 100644
=2D-- a/meta/classes-recipe/populate_sdk_base.bbclass
+++ b/meta/classes-recipe/populate_sdk_base.bbclass
@@ -74,6 +74,8 @@ TOOLCHAIN_OUTPUTNAME ?=3D "${SDK_NAME}-toolchain-${SDK_V=
ERSION}"
 SDK_ARCHIVE_TYPE ?=3D "tar.xz"
 SDK_XZ_COMPRESSION_LEVEL ?=3D "-9"
 SDK_XZ_OPTIONS ?=3D "${XZ_DEFAULTS} ${SDK_XZ_COMPRESSION_LEVEL}"
+SDK_ZIP_OPTIONS ?=3D "-y"
+

 # To support different sdk type according to SDK_ARCHIVE_TYPE, now suppor=
t zip and tar.xz
 python () {
@@ -81,7 +83,7 @@ python () {
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


