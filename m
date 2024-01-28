Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B142FC47258
	for <webhook@archiver.kernel.org>; Sun, 28 Jan 2024 08:34:58 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.92.90.78])
 by mx.groups.io with SMTP id smtpd.web10.33901.1706430891668096240
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Jan 2024 00:34:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=hKMISiIN;
 spf=pass (domain: outlook.com, ip: 40.92.90.78, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LhrOg1F4hPdMmHCi4413FHnOxQWvppFfIHVqJqUASE1NkLSNPmdwUuevw3A6kiTFb24FqpWn5U74ks70xTDzj1WCD/b6We6GDzPx+s/ev1zmdHk91hZqMEI66de0YwgUaUVZRoS9QuEa6EKIGB88OP99ATMstJzXwl7Xq1hHY7eJqbbGvhbH0/C3kLI6pu/5dSniPW9PA4YD+XDb/ZtEi4aNc275YTlPS42PuTRxeWyvYUTdbA4D6nh7gqaJajFUSv07+MhOEwqpOqojyu3QLFbXp3qdPJwbnElIhc0ICpgHMa/GIKN9TSByRK3P0XX246X/Mwoz1NH2J+Gdsp93nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=twg1I2+OzSraIrHiUOrGkNOw3mdIcGi2LEluaYul46U=;
 b=Gflls3ij9DQ77a4iDRL3WwsQszbPa7XbtRo3pJ1NwpoJossZwW16n1+T3TaitnK97xlz3GAQhMWihvYwjfvfbrk0vxCYO8DdiTMEplYmUazGng0/Y82sE0oJsVpOYCo7cnntD99t1+M4+Hl6jAmq3xIZYq4t8vw72BYUassrRtNX7sPf7xuzbyJmDmdqTQPk6GlIR40wRlE0bFqsul0dgitErFVNffqy1VYFrSrvAI5nFyq1cb0w4iK7QymVlK1jzgL+9WbplXOVVLxZeyyfvNOBLCQCbrtt2KsoE99jyi5czBnQaoyQTk89RUYESPKUrIXWJ9zDT65xHR8BG4EZSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=twg1I2+OzSraIrHiUOrGkNOw3mdIcGi2LEluaYul46U=;
 b=hKMISiIN06G5K9zeQ2KJZ917fHVLVIxQA7enYp9o0pKOoYFZlJSudinKJRnMMGFNQNPMu/jq2cvsRsqfQknx1Q8qTDa80bI00oNXpk9Hf/RSK1gfiLZdC2z+T3EeOOoNHueuMe9wgQymTHnveaZJJ/VFMbQtxMNGhhAGf7LzB3OtoDwBpuX7Yc/PK7ti/AcZtwkIUiNS2Umb9DwDmjanvalTqPGijZMFQXsURb9kPe3wQLKNOoQmqFoZNj6cKKTPEuYR3FlKosXOWkNqrlPNyZkyCYrgo5+2C2ePtmli/7Ssav1EwXMELCMkLNabbQuhTGhDQr5U0pSGyXy3tEM1yw==
Received: from PAXPR10MB5541.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:23f::20)
 by VE1PR10MB3872.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:162::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.31; Sun, 28 Jan
 2024 08:34:48 +0000
Received: from PAXPR10MB5541.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f002:846e:e7c9:ec18]) by PAXPR10MB5541.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f002:846e:e7c9:ec18%4]) with mapi id 15.20.7228.029; Sun, 28 Jan 2024
 08:34:48 +0000
From: Konrad Weihmann <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [PATCH] python3-yamllint: add missing dependency
Date: Sun, 28 Jan 2024 09:34:12 +0100
Message-ID: <PAXPR10MB554176C77DF00824968ECBC8A87F2@PAXPR10MB5541.EURPRD10.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-TMN: [QsGzljjuMMhX9QhgWdclgQuGCeLdm4oWl44VcAdFVbyrT73dE/YAC6wotIb4xzuF]
X-ClientProxiedBy: BE1P281CA0130.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7a::11) To PAXPR10MB5541.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:23f::20)
X-Microsoft-Original-Message-ID: <20240128083412.1076747-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR10MB5541:EE_|VE1PR10MB3872:EE_
X-MS-Office365-Filtering-Correlation-Id: 188b0a88-fae2-432b-cf59-08dc1fdbfcc1
X-MS-Exchange-SLBlob-MailProps: 
	AZnQBsB9XmpvZmz4TmgkoFXIvo1/QfBmA8NzjRqI/o9AqD0h0JiIoZ317nQW8A7p4fuQiDxQiBM2fYSdcxNQE26PbsmIzm6HWLafCBAvr/Vxq47ruRVU9a4ubBCI4kpJPymUR5GIhlRPHqB2F9NufXmTDIih45suvrTDX5Sxn7fb7uwTXhOs6e0eL5FxjVsCOgH87cBDFMFtZcS95ZsjXAe4w6Sh1w/8MWzfahstx51Kn7HrErYnL8pRMhdarCZ7f2vWiB2VtPFL0JrM1IU5r1wyWX8vlPI9Qf/B1S5Aefog3732v+W9emQIBYYiTs+gt7DAaRWd3BZrg+j4rVwX28qXOM1743ULt9cAPTHw6eSa7WEOankpIHBeMuHzuAqCukSLU03TIKzlLvXcskTGPpxdUK/7YQdeHHk7tgTjH6Q+l3XyXbfoPDvHAFYut4liM3yovoIZ87sW+aUP5iiftFES+l2Nkk2v3pyXBCC7Y2I13CzbOm8UgkN7AgJvE9aXx7Rk0OuzBMAMhHreiMJW/tu6+7UkxeWkA+MNPKZj0GffypVS9LfCC3FzBfaOGniDX+BiCwn3tdUl3d4dA98ZI8lM73iz2lkY7FH/SqErm8rEN7QvwQDuYSk2qP75b0ipB4GibfMJozQJ8skjSAOZk4VWbxUdePb+DopUi+DS2Eh7FS1YSEuyrx29cqrrnwKyJSRg8Zd2+aczWwxCPZOOxDtxXBgxLPCIXNWu4OiMauSceK6JeM/eHbt6tOSRtAfUxTIYAUgxF84=
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	n36KhLA4mPZ01oBrlWzSqtxUbvkCtjoRF915VwHIXZFCBXPy6ThjGAdatMIBEyCS05JwIjdQ0IwJZdOXdglX6Op1C7xIOhQmZmVsXsB7l1ihi8VpPw55Lv07YISt5aj5F8qv8r+NQvBRRMePkSifwXbh7uuVLkq8i2EFQsdHhq6cfG8LI1Vo37bPgIhHMoki8OL15oT3AELaILNHAZdIcJVJG1PidlG4WPPSrSZSUtn4oqxXSTuQqgDG26QYp+0YkgyJ0eQsvvFVrr3gJzCeA9pT/4iRULmTjm2H5fOV82qYt+53rWfpgASrlgUsgwXqOYXxMJJy+MJ/zHmBwRToQ18eFnnye05Ygk3xKliFhrhPQjgvXUgBdhU8zaeWcMtM8rMQFMEKyz8ehPlrPk0M4QEirISd3lUpfm2lC5uwJFWjk0CuBSwZB2GT/xhTktewzzbDiXU13Bg/3494tAERh12aiiguZEo88fF6oNUAf8cbU9ni/1dMUf/MqJicOKt/Pl0uu6wIEVoKJlgxOH2mmEC1sm38d95KEb0jXYtCdadkUJRxvDAdwKb/dgaIR/DeDXcAOnvtLSwwwJ8/VosbEEea/4mv2WLecs/ByMD6tYgkRiJVeBySKGEmfSTyNga8
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?0tr6bK0kSGchaa9D9FSLCUv5pb/wqCwzVjR2Em/NMjQSZIaRIf0tmvlBITxx?=
 =?us-ascii?Q?k5eJ+qsbu496CCxfbjAaHYY3QXYW5AvCTCcwMVkKB7kQqJkggSNrTv0BB3yG?=
 =?us-ascii?Q?+we1tuGAX4p2z6SCv7CaxcLqjTeN9XNKzI4+vR1Ym/oIqCs3bM9ir+YbexVm?=
 =?us-ascii?Q?x4qz4Fn/L9Iq27G1PzvIy2CjkflhIo2bNCef55+FpM0WJ0ZC8SWQVGkEPQ6z?=
 =?us-ascii?Q?DbTpkV0Vv4Tbka6jUgjRxIY30C3jk4vNZ17xqHZUAxZAIHsAP+HvRDWPapnv?=
 =?us-ascii?Q?IUImHrA0q24+e5Uy3Lm91qwS7xqTpzm8lpDBPqioQ4U4Yk4tRM/16c1JF0Kc?=
 =?us-ascii?Q?kX/sS32Rw756KEajL7zJmbOh044hBOLwgGaUzdM4PSkZjNHY6+p1dSRWdhEZ?=
 =?us-ascii?Q?06d+4cN2edeuanNHVFa4qG4SQhPMkxEHLuSMhf6mNmRETqF7QRbTH7/0BAC6?=
 =?us-ascii?Q?FbKQ2w5hFvkvnEzwrza/TXtVghnnXSb0VXj1xdIO1a0Zy7ZOQBnX4EQRrg/9?=
 =?us-ascii?Q?9KLrjxvqseZaXZ6OrkDuHLVlLWaL8PgVqyNW0o8+/niethXW6ruukmjiH+MA?=
 =?us-ascii?Q?c17kYvFaksvLQK7jb/gbeZX0cVceXte+ICP1KfEW6IpvyJKz4xLLDbfC+NgU?=
 =?us-ascii?Q?xCQFXwgHQvJdO0k/TiFbK59KGaNGGLgu2/GZZcvpZTTNxXNubVtCkzePIgCI?=
 =?us-ascii?Q?OUFiliYmt2cZNOe8Dod8sefuulcOrraqubyv7+Ri31/0XuT15tLnyKI5VveQ?=
 =?us-ascii?Q?D0peuBBz4OK2et+G7mfutaF7tRriPbfpsVLGRb3li3HNf7a13c0lrF0VcBcQ?=
 =?us-ascii?Q?EfXtnLFbE3+RtJtLNMC41l/aTAGbAyUbmUi91a3RK1hzbrkFfiWwZobbDIzV?=
 =?us-ascii?Q?gYfgW992hVoLQueHCouHlD9O1MTJIouRcKCg1RilaWZFWV0FS3c46XO4LKah?=
 =?us-ascii?Q?r0dRM0ATjueV8h4Jh3nhZhaCw7MGxf0+AZw5fHicNgpleqxHebXfh79bdSQY?=
 =?us-ascii?Q?oGQ6P+jjn1WRQ3ZNDspXit5WTlgeDwHXTGwCYsvzG0vb7Zf/vP+PqaGAULPN?=
 =?us-ascii?Q?Wwv6lwQFC+nrwCITEyMjMusyxWofGSm+Ilx2W49rgYsVwFNyi4t82i+7cLTz?=
 =?us-ascii?Q?lJREPf8TqglR3ef39Gr4oUvHFH3SDHrRzadoX94HCN/3oad86qzukdBL8xgn?=
 =?us-ascii?Q?CvZ5OuDq9E5RBpcQ7IAfao93nJeyUVrJqEbGeRhqTieBa/4mdD2amjcH216f?=
 =?us-ascii?Q?xb0RdwGmCvRleale2KXS1iWoN0snnNB37kxd5ubXcQ=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 188b0a88-fae2-432b-cf59-08dc1fdbfcc1
X-MS-Exchange-CrossTenant-AuthSource: PAXPR10MB5541.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2024 08:34:48.0972
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR10MB3872
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Jan 2024 08:34:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194438

yamllint requires pathspec module to be available

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta/recipes-devtools/python/python3-yamllint_1.33.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-yamllint_1.33.0.bb b/meta=
/recipes-devtools/python/python3-yamllint_1.33.0.bb
index 4b7bd065f9..7e51fc9395 100644
--- a/meta/recipes-devtools/python/python3-yamllint_1.33.0.bb
+++ b/meta/recipes-devtools/python/python3-yamllint_1.33.0.bb
@@ -10,6 +10,6 @@ PYPI_PACKAGE =3D "yamllint"
 SRC_URI[sha256sum] =3D "2dceab9ef2d99518a2fcf4ffc964d44250ac4459be1ba3ca31=
5118e4a1a81f7d"
=20
 DEPENDS +=3D "${PYTHON_PN}-setuptools-scm-native"
-RDEPENDS:${PN} +=3D "${PYTHON_PN}-pyyaml"
+RDEPENDS:${PN} +=3D "${PYTHON_PN}-pathspec ${PYTHON_PN}-pyyaml"
=20
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.34.1


