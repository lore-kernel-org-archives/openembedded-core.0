Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2966C4167B
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 18:33:49 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.86])
 by mx.groups.io with SMTP id smtpd.web10.41050.1701887623463782390
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Dec 2023 10:33:44 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=At3lwxNz;
 spf=pass (domain: navimatix.de, ip: 40.107.20.86, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nCMEZqHq1mu/9lazWiiqu/Miip4LS5jNpQbLwaTCh5VX9qgrEgdnDSyH/HJDByE7lGJAZoTHZ5vawLU3h26JGbByQEPP+5injMN8Vdd9k3YwSvjLKfBo8KIfjG4ClYth3ICQdPnvkjUzhqOm4li7PaIi7PW+VUb37sHLuT0gHTGzkV0Qefx61khrQobsSj84p6gWnpVzA7ty3TXBr0YJx61fRrID0KffEn/ZTduKHGL+UUDbBZAWoeD9cLXGMxb/ylotafmtlblqxQ79TP3W3dc88kE2DTYSO/av5QbINGy8Bo86E3PXT9DWXSQdm+MN95ZuPBatqGErOcXEcXEXcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GVMaqDt65Qjv9lstUTE1aTZCbmq3Bc4hOQ+u6kcDoO8=;
 b=LEROtYJGddFHhGFq+hHYAXzRTShFBefyNEpTSzAuaugZT1Ovky/F3dUJnKdQMXuAFTSQEaeHpabOewZCDF/ao7qwXVxECJ7mHXVyHJFfKv5rfxXm4DZrDrnvVLmnostNtdK2kc821fjeUr/LPuhrGwzPXNToCWKivkMRuezcKSGg0pEuXLpNa6HSTb6EkUyNwJ+IjA1UIeLwTw3tyiwv0BJmUJDw5gRYi1cw9NHjWmXFLwSgJV1mksVp6/FfuC8A2LInX4avEj3QadXF+dgD6w/Q6cKXBfEUcIqc/iXjJ5/IVIpbXuzlLNiWbikj5Jz4UMMoTXuBeO1T9/yhaqSfRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GVMaqDt65Qjv9lstUTE1aTZCbmq3Bc4hOQ+u6kcDoO8=;
 b=At3lwxNzj96baxR1Js6kdJVIBb42122L1kjZJrPD0KI2w4spBg5UN2Rc4PMs59kz/WP20SldN0jI55X6C9NxV0XH8bW91TF2LCUwiTAN9M2UdhUQzHc8feq8/yr3eWFSOYZ/4RfYumv2/QwnXr/qVneqxw0JPhk+nq9cXC2tnRk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:5::26) by DU0PR01MB9359.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:35f::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.26; Wed, 6 Dec
 2023 18:33:40 +0000
Received: from VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 ([fe80::7242:3e9c:3c24:bd10]) by
 VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 ([fe80::7242:3e9c:3c24:bd10%7]) with mapi id 15.20.7046.034; Wed, 6 Dec 2023
 18:33:40 +0000
From: joerg.sommer@navimatix.de
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?J=C3=B6rg=20Sommer?= <joerg.sommer@navimatix.de>
Subject: [PATCH] wic/DirectPlugin: don't update fstab if --no-fstab-update
Date: Wed,  6 Dec 2023 19:33:02 +0100
Message-ID: <25627265bc672f5a617f0e3319302dc80b655ca7.1701887581.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0363.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:82::23) To VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:5::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR0102MB3136:EE_|DU0PR01MB9359:EE_
X-MS-Office365-Filtering-Correlation-Id: 24f2ca8f-e9f9-439f-3ac3-08dbf689de2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Jo1Eg0WOGG9uxpXf2rxmAJCzRgCb0r2riWlYZnIhHsOxfw/M2Wo75tpD5e+7701xvnKyTL48D1UINLNg9X0cvG9oSoNVdlA5hyPQI8nCmeb7DJNnYymYZNeDiDgD+y7cxmBEd3CXiZGBO1MJO2yQaoiXtzmhhpHGRMTPUkyLDXYwWyLAQjEpbb5joDpqaMHooC6tHLmyHoto9LqB05s9CCONyY9speI1dCR25bHQp3QS3MDRRhOhQwViQYHa/dZ2B6HDT/VP3GptDXbYYaKKHjSL03mKcnQVtL+whCRBq5t8KSgiH8+DO4u9x/KjzINDoXZSdLtJh4Yocd2ulZHy8G862JDY5S9ZORYl3n+B9bVK3KuwEYR0HRuN3MhfE0sNeds3e3DMaFE27+iN+df+U+FCTbwr/Cn3QTmJPq2UrQphW0H+CUPyr/j3+SHSaHb5QEV0lcEkP+3Z5SuR+buYsj5rGMNzV1mLI/HiteLUqQSyoNTxkNl9xp29j3+EwcgFG6i4Cwxr/7mtXINiYGk2/yCMFLs50CsPw8vl3qhEkRUCJ+nDXgxJtLr9qlKsxldO7XBcXZJTHx6KTCNRyHPRymofi4c5K5PHCOocoj+Gag9ysjWiRCAwNmMvE2+tcibU
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0102MB3136.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(376002)(396003)(39840400004)(136003)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(6486002)(478600001)(6506007)(52116002)(5660300002)(6666004)(4326008)(66476007)(66946007)(66556008)(6916009)(316002)(8676002)(8936002)(86362001)(38350700005)(83380400001)(2616005)(107886003)(9686003)(6512007)(41300700001)(38100700002)(66574015)(26005)(2906002)(4744005)(36756003)(15650500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?oxLCXV+tWF7g3RmgZHiEgBa02XAqza8j3fGUUJttCHFCsBlybXd1lR3nikm/?=
 =?us-ascii?Q?KVUHYzuJfyZT2bzxbXGhCMnpyOUQdzoPCGpzwhYB0VS9kk7mUejJqTAlms5S?=
 =?us-ascii?Q?nS2bJXa8g/76Jx5MfvqRjjn5CYM7MgCGv6mstWhj3Rv0ZD8sKVt8omRItbqL?=
 =?us-ascii?Q?ThhvJs3on9lkd5otwVBG8UvgvARw9+/EIdL8lUe501rv/21iCTo2UDyyZkd1?=
 =?us-ascii?Q?ijboQIsW9zt7UURO6Eg5M+H7OwiPnPhXirC/MGFlq62PvVGmhwfygzbM0u/k?=
 =?us-ascii?Q?1/3SQypqBRwFWvWu31MXVxiuII6EA3aS5k0Y3UahZzlTv+LZznxQWAL2jogt?=
 =?us-ascii?Q?iMO4/l+uM7UCWA+qn7bWkgPfxkg5MCuj08yuwmLxRjOYot8P5TqLRStcgkw7?=
 =?us-ascii?Q?QDne7Pr0EGPttkTjgkQ3UHrZJTxbs3D3wutK/jTVaGVwZMzPPE4sTogjso3n?=
 =?us-ascii?Q?01f71FA5hZNsZUapG3PYnW/zvsYsfwHDpHswZATpw66s10g+8GJ6jJ+yT4mb?=
 =?us-ascii?Q?xqE/YIA2G8wQeU3mYNDicG1Dm/wCDEXtMyrWdkrHuq18fLAi0wo431Xovl6L?=
 =?us-ascii?Q?LEigsuXNztVR+e9KP/0wAK0/egogElwghpUEjP8RKGoRtg5i3fOZiUrDOK5v?=
 =?us-ascii?Q?wzRJZdG5hCrWg+0WNhDHSNmZT8RpxwPKU0yO3UbOkKCnDlIc+9bShSknFLHp?=
 =?us-ascii?Q?ENigUSpIuPWlphU2G86w2P9ZrHq4uBTKFtBe6YPTp2ueLR178r7Co9SYJwHk?=
 =?us-ascii?Q?7AgPFcLl9OQIjhh//x+xedutHOweotY4lq/cpgMeBI1FxrNm6+d4jyLFaI4E?=
 =?us-ascii?Q?Y7kC0LUnAMQkCIVbjiXvJIJehrWqybQSuTt32HX7HuU1WB9eaCA6RCQU/d2/?=
 =?us-ascii?Q?JNnDtaHJ9HKmk2fbvOZCT7mtY+Pk8t2HGuNsqAK+WMdMyy6XSgXVsY8IQFpW?=
 =?us-ascii?Q?uh8qS0KDRk0FIZwPpPdgl1TgqQAXFvGBzmWRsezos3pREglCZoezOWk+xYwA?=
 =?us-ascii?Q?FnQzDaWEyP8X/3drKBlIXuma6atgzVbWoDM7A2n3E6ycH61DaoPtlVxyFlpV?=
 =?us-ascii?Q?E5zsJQEEUb9VI7Navn5YhI56zc2PZMDQ2cAJiGu8evFpQ+YJZoKk40ahGq1E?=
 =?us-ascii?Q?4fmhzncnynnC9pu6l+APN8gFBWijMCJb3m3ML/RhKfL3mFWOHoYCQloGMcmp?=
 =?us-ascii?Q?dTPH0uiirQ2keOmm8NQNVJL/6dycg4FsBz7J6/KJm8hgc1u4trH6Tjto5D3q?=
 =?us-ascii?Q?RreIzXfM0zAZ9npPLdT7nYCr57vuK3Pakj44j+M9c08zU7lzpGgNv/kT+03f?=
 =?us-ascii?Q?GqUqsLJwiXekfjlZCOJqzgtJ4xgE+A44s08BnVmMweQD+hm6K1HZXiRA1ghU?=
 =?us-ascii?Q?HbpsSDRqJJP3PPVhOQ3o15wWgVCMrAc7DhX2CY9Fau86Jkr45IyV9mhFpwYT?=
 =?us-ascii?Q?K4bfdTUurgyfCb8K8f/0sE7mbs/5lfmXywAsmf/x6q4POirhHzHaiINN5cHl?=
 =?us-ascii?Q?iGkhpjSoATr3viyg/CHaTAXS0AZZLAhRbZH4EktuPZGZzKBRg38jKJnMR2fL?=
 =?us-ascii?Q?DN+Tcdxr6kUHKyb+mR907jQCInLJUsvSFuoawv0R5mkCCKDhW0e/WHVVSZGM?=
 =?us-ascii?Q?Xg=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 24f2ca8f-e9f9-439f-3ac3-08dbf689de2c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2023 18:33:40.2991
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xba9ELqq6vxKyBjiq16vkt/YQ1YkdP3O/UuvGKwP3c2HGuZOmF2UsLao1Neps0JUjJPUa3BY9l21zvW48iPRfPSieti+v/+GDUTc06glJEY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR01MB9359
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Dec 2023 18:33:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191906

From: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>

The function `update_fstab` should not touch the fstab for partitions with
`--no-fstab-update`.

Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
---
 scripts/lib/wic/plugins/imager/direct.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plu=
gins/imager/direct.py
index 9b619e41c1..013aa4255f 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -116,7 +116,7 @@ class DirectPlugin(ImagerPlugin):
=20
         updated =3D False
         for part in self.parts:
-            if not part.realnum or not part.mountpoint \
+            if not part.realnum or not part.mountpoint or part.no_fstab_up=
date \
                or part.mountpoint =3D=3D "/" or not (part.mountpoint.start=
swith('/') or part.mountpoint =3D=3D "swap"):
                 continue
=20
--=20
2.34.1


