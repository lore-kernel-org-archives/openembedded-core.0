Return-Path: <christoph.lauer@email.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09902C77B73
	for <webhook@archiver.kernel.org>; Sun, 23 Apr 2023 08:14:24 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.15.4])
 by mx.groups.io with SMTP id smtpd.web11.23684.1682237656747649225
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Apr 2023 01:14:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=christoph.lauer@email.de header.s=s29768273 header.b=wIvtMCdn;
 spf=pass (domain: email.de, ip: 212.227.15.4, mailfrom: christoph.lauer@email.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=email.de;
	s=s29768273; t=1682237653; i=christoph.lauer@email.de;
	bh=8lIeLTlqXKfJ9O60usTE1KnLvLBCZ+Lx+mfxtGirWs8=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=wIvtMCdnbx5XynXwkd3t1N8aqG8p4iLtxHhX7N6dFAZf/uqMwFaiNGx/7bj/YqMCr
	 qbhgU74AANaU5Mdu0ZuuC1UPbINIH1ASvhCQ4L4hgg2GqO5YxdKtO0rl5SqvSZrcdR
	 yvU0fIeAts4m2HFFz5TJOknSRWnjpKtkDuhRbE2turEyNA13pC0blMM5I3NSAaqjzr
	 iuujhlW5x4mlvApxsC//FfqKCYf+MhnWqZ3Ub5GKQAK9HUFVJInW+MUOIBWa6i8+B0
	 vCMyTxF3o89d6P2k0JV1yhsB3jB0ybLuvTk5GfR0PIYf0ZBK04l70kEO/Ag9yNQPHb
	 XCB2r9NynsvTg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from xtr-acuyocto-p01.xtronic-net.com ([178.251.90.190]) by
 smtp.web.de (mrweb005 [213.165.67.108]) with ESMTPSA (Nemesis) id
 1M7Nii-1pw0dN0ukO-008FAz; Sun, 23 Apr 2023 10:14:13 +0200
From: Christoph Lauer <christoph.lauer@email.de>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Christoph Lauer <christoph.lauer@xtronic.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [kirkstone][PATCH] populate_sdk_base: add zip options
Date: Sun, 23 Apr 2023 10:14:08 +0200
Message-Id: <20230423081408.47397-1-christoph.lauer@email.de>
X-Mailer: git-send-email 2.17.1
X-Provags-ID: V03:K1:fWtsmm73gXZGVZftnshdXh+YhcoVkh1aqTVNTsULBk2GDp+XcNP
 tvdIGj+OgoPiNrMmxwy+Ix7hLEBQ7pGjlg/681A/PhYvUu2GEA0g1ExqBVXGYqOFkvHKR/Q
 YEselVgzoB1JfskdOSLVdiRnKQE9AV16s90yJD54zmDZevMDb01xMkV6cCIx07+z28cDSHY
 FzTn+9Pa6FEsrojtjlclQ==
UI-OutboundReport: notjunk:1;M01:P0:HfQD6LqobOQ=;qUiZwX73BTT1FVBIBJCXaZZl8fI
 sq43NsllZAxv1Bj9ooJSeZIGdHZ0+yIsLYKkRtd68NE9Be3+asCZhTv41hQUHO9rCErloOTRs
 jicXYkDIFrK8gx0eUILArosZdXAiB8B/O09BpGKqUVje4ffouDWZBTPpA4AolDQwkqScupSBs
 xJHu2Y9/m77FPRcRo5tjh/4ok2VpmWmPtiheTyTLr5mTNN6OyDpJ8PrZG1G30NmYd81GMhEiX
 FqVe8751YSHLPH0BfCGQWH4udjfqAa5soE8cyniXFvIpVBwI/RhcfN93yp0JenUV3nLJH17hh
 JR1Gjsnd2qZ9ihOvVpN1hU3AQTy14RHmpYi9k9XHS0vXx+17oKqsWs8eImjBjzv2kbGOzbHQ4
 baZ2RiqK7rqL78PTalgHoAOrNFm9W4Gv4PWYjayVTaVzvA+9bHTHDYMI63GVx8el0nZeX48mR
 B+H58GOg6LaD3/+0LCoXjFVdhUpohVI5dhhfm7pts4wtjdyTHV+oRo4hNWnA/kDLaSOtrog/F
 i+JEFVihiTuu/tvmBUDMZ/8aJ632dPJUl0K6J69Uo3qP8MBR6zUIX0f7cTfoiHANISLHLIKhs
 RKz29OHXzCcvpC+ehSOLJGVAjECRkYN2FY1CCOqNloxCOtKbYFLWUuBY+/aNNg3xvsnlujEWi
 bk43XCu+ZjSBecS+iZjCWEhPuF1Qk+Lga48Z5lUXzmSB0fCOEmw+LQKzrAmUR/RmKio6ofMg+
 mZcvMrt29l/ZYtiAfurEg+eiAG41ZwP3qW3RkdPH12uBBHv6FjZ8yMYj2uDJKJkvD8emlT8nG
 fzwmR6cYWm2ggJnGIxGcxMZCs8gQNxvEZbEjSIQzYRzZRjTZou8vhOwe4kJWP1Ct/b3FBtTVM
 rXOP848j3QIR9x+gq7N6g1AN/iIO485pGa34tLmmKP8msNEbmncJurlJ9iXTuPzMih0nmaE67
 8sFG5dQyFKvEmtzIQjjq6qJPkFg=
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 23 Apr 2023 08:14:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180329

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
index 16f929bf59..fb00460172 100644
=2D-- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -53,6 +53,8 @@ TOOLCHAIN_OUTPUTNAME ?=3D "${SDK_NAME}-toolchain-${SDK_V=
ERSION}"
 SDK_ARCHIVE_TYPE ?=3D "tar.xz"
 SDK_XZ_COMPRESSION_LEVEL ?=3D "-9"
 SDK_XZ_OPTIONS ?=3D "${XZ_DEFAULTS} ${SDK_XZ_COMPRESSION_LEVEL}"
+SDK_ZIP_OPTIONS ?=3D "-y"
+

 # To support different sdk type according to SDK_ARCHIVE_TYPE, now suppor=
t zip and tar.xz
 python () {
@@ -60,7 +62,7 @@ python () {
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


