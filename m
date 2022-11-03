Return-Path: <christoph.lauer@email.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EB75C4332F
	for <webhook@archiver.kernel.org>; Thu,  3 Nov 2022 19:41:25 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.15.4])
 by mx.groups.io with SMTP id smtpd.web08.2888.1667504481996775856
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Nov 2022 12:41:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@email.de header.s=s29768273 header.b=Occyb8Ps;
 spf=pass (domain: email.de, ip: 212.227.15.4, mailfrom: christoph.lauer@email.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=email.de;
	s=s29768273; t=1667504479;
	bh=dvMdCY7e+g8sv2rmNtKi2f++YJEcdTF9cpN/aUoCvTs=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=Occyb8PscQVA68xEz/mFTzPVYV2KPOMQfZJFYkqZVJlHwrFUzkMyICXWbdEZ0H48U
	 Fm8hlnb5OdojjhjSGWJ6UbT7VySZcHcbQYCxplDi9tJlb/JAot9tmYs8fB8BPmwANb
	 PcSN9nRPLB/7eNBSiU/CNieWL8V4O9670JNnNeT5NRN/eNNc2f99fh0WeurL9yKFnF
	 rUzo81UF2V2I8glK+Vdi/JI7Tlz6Ez5fhQiVsFSuIuGed/R+pDkqzLts7RXAmBNSt5
	 VjazSzz/Li23OY3h/j1qHNFZtd9OjN6fWF1FxiBnYoPP1SynEuLmnOQX99WhxzcCto
	 /FbRPMEcB5rkw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from xtr-acuyocto-p01.xtronic-net.com ([178.251.90.190]) by
 smtp.web.de (mrweb006 [213.165.67.108]) with ESMTPSA (Nemesis) id
 1MumJD-1p9JEa3CRX-00rrPg; Thu, 03 Nov 2022 20:41:19 +0100
From: Christoph Lauer <christoph.lauer@email.de>
To: openembedded-core@lists.openembedded.org
Cc: Christoph Lauer <christoph.lauer@xtronic.de>
Subject: [PATCH] populate_sdk_base: add zip options
Date: Thu,  3 Nov 2022 19:41:06 +0000
Message-Id: <20221103194106.51489-1-christoph.lauer@email.de>
X-Mailer: git-send-email 2.17.1
X-Provags-ID: V03:K1:MLJmx+qF9Mw8bNscgNKvvqD5xLTzxJNCc5m4th75jayIO0MJEhI
 VUzXdhnWX7H8KiJ3XdFTV3aJiUL3kJK6R9Dc1dDJnMhTtgv4w0Yv7vT/gxS8Vbdk22jN8Oj
 oraRcLLBreCuG+AtcgZTpeJtixjDngxH/XyaJ8aeWBrumwY84BMDWBHTD7M6VJt4PwL1ij6
 JCgFudMVsNGEQ0D4UQrzQ==
UI-OutboundReport: notjunk:1;M01:P0:JyzO+mdcRw4=;N/N+rUOWSRdXAIeWFS5fXSv9tsy
 +vdZeH29VnlQ7hjcyBYKYvR93sGUrah3TLIVpE9XPl3rUsdvE7PXCijZUrRKA/Y+hRkR/eIaR
 N3NEeom174LVpWczUJou0alzfG+i+08p8btZIJdKSfh6llXPyreqihvOmJTkR2k4OT8sA9Ab4
 a6o8H7PPTZv+0a55Hni0JlnYdadmoZVYKHRmNpl2985oiPP+RFWlYHUyIlk8GPTZ1WNpqYZpj
 mL8Z9NJs0vfDkMnoEz+O2Avldfa4WgNvND3j/gDMufzU3sJhpPBXxeXVgsE5U2zVbgl6DwThv
 TIXuvxFdRfs9aIer6pHsmaPt/0OAOPBEradElKeBJPQTprEFKPEWcnuZF/gHDJi62fderxcDE
 LAItmMghGpHC7+vVRaQFt37VH0LA2OuiYXCvXq5lReByDpwvsSH+ukdKUrIv546evV5Fgifcs
 0H64QXJyXsb32JcxsDYTejsvWkwgdPz+cqjA6D+LmHAEm3YTrvvpcXBnEQ5ymGYF4IFSzPwu+
 BGXbtOu0JqASbhdXHFJO67v0qiJsY8SUdtwn7Z/3FeeUFDJZtWrwNN41n07lcu3JswDLh82Ea
 PK7+BNA4+d2o/06no09yyVDwgL5uyNPg3geXyDil4Dpvcz1/9Fw6c/AxNVyLvLiTBwBg+gO7K
 P6S3bNatyXgItc6ScS9HQE19PeSjyYVnl3gXUPeUoj33hMM/TQGizo0Kb6xh5fwytK/E8w4N1
 jh1xD7Owta1Ams6F6IQ7kifYa0xdMAR8Sm8HiDAz49xAvimwxsmhTbQIMPHWxmdPYmK7rwxrm
 RYoaI3rG0ifGi2RVSiUb9OVCvZrNIoc9oa0F1CGCZTGK8dcjYkco9I6LqWq80+pl2U8wlS0VU
 VnLY8w98JqOg0E0Iq7r+umoqz3rrhWa6iCHTfugi2CLeWRwP0pfkUstDz1i/3AQgplccjihYF
 0SDMv2Co4Q7wGub2BnGZzFjJ7RE=
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 19:41:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172653

From: Christoph Lauer <christoph.lauer@xtronic.de>

Add SDK_ZIP_OPTIONS to remove symbolic link creation in zip archive or add=
 options, e.g. for encryption of the zip archive.

Signed-off-by: Christoph Lauer <christoph.lauer@xtronic.de>
=2D--
 meta/classes-recipe/populate_sdk_base.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/populate_sdk_base.bbclass b/meta/classes-=
recipe/populate_sdk_base.bbclass
index 64a4a58bef..917619962c 100644
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


