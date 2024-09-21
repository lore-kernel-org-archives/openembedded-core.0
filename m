Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EE14CF9C5B
	for <webhook@archiver.kernel.org>; Sat, 21 Sep 2024 10:05:53 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.92.89.62])
 by mx.groups.io with SMTP id smtpd.web10.6831.1726913145121235100
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Sep 2024 03:05:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=aCaU2AyS;
 spf=pass (domain: outlook.com, ip: 40.92.89.62, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qBg5te0MzkWSKgk+QLOv2hTjV0gRs3rEkxqpwf5JN8quyE5giWKBFLUfXRW/kKZEvyVktoHImj7tUp7bXK9wb7mA9+OIJ8TX8SwR6MDGy50PAiGznJv+wmt+CfyqLvznR5bUJ+jNPifL7BoVrzwCedXbNWxbWxRlQvtxC/oPvJBe+dZ5BKCOlkkO9PqtJslurxr4hTdYtMHCqcyD0oXgc41Ki+Bzc6m69uFxA1RA15HMYrrOY/R4FhbEF1wq7KbRT/jEi4BsB/Ak1NIDOZKLR+/MoYGOe7gqtgknvNx3UMceVBGoqBEB2GYt/UApYk1mAharCPSWFs2NI7KeuE0j+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lbgD0NSXMny7qpIC7WRM7h56nY38UYzSbapJmqtwKTM=;
 b=hGFbnaCi+izu2fJc0yBYwz5sQ9aMGW6/DSt5tOKm2ITWl3fy5wIQqYunu5ShQeHP+prYmD+W75gYARISZuyNpIeR6MPl6hjUMBE0obGmGbPGHzox42UA2PVjud5Gi8vzF4cZOEGs0YxCHp2F5dLU6VvTFxBSyMa/ex+zsvdF+70Ab+EbhM7RimHjh6SwKb6ICaC1Z2ZNs9Ff1sDemQ5C8MC2Duhxn99H+q/rb74OVU0Dj0+kH++R5NwL+hyDrvmDvXTbloVkefnDwlem4uC11RCFHTgX5uodiii7JYVmCBQByTc5Cny1NbXXCFGXZJMUKyvvimmu3Aep+6HulVNXDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lbgD0NSXMny7qpIC7WRM7h56nY38UYzSbapJmqtwKTM=;
 b=aCaU2AyS5Myeo4UMwHy+ms5MUCsIjtAcjJdIyuedTDTLr9GvyP81YQLi8z+hbAxP5cv6f7vZ2cDTSW6ZYAZmeVePr9VqDzfxzrW0Kry+YWbT2Ky53eAhm4W9twqhu/WR1fRBDSYgUItbIMoBhIVPl/XeTVTwo7SAiS3YG7zLMlIZIV/PdeRsKBez9AgEV8Z62qIhQHfT+AU6vK4rh3So8v9LEsxxI81iknhDK9SfQS1AXkgD/ijol4Hv+BJi3FBNXDnKUCZya9RNewwuK1lvcOFUPTAiVMYT7QExh4A7b9hNvMnJiVynMqgZDA1ktRLV9aqmLmTZ0pokbrc7GcY6aA==
Received: from GV1PR07MB9120.eurprd07.prod.outlook.com (2603:10a6:150:80::7)
 by AM7PR07MB6246.eurprd07.prod.outlook.com (2603:10a6:20b:139::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.23; Sat, 21 Sep
 2024 10:05:41 +0000
Received: from GV1PR07MB9120.eurprd07.prod.outlook.com
 ([fe80::a630:7019:63e4:a48a]) by GV1PR07MB9120.eurprd07.prod.outlook.com
 ([fe80::a630:7019:63e4:a48a%6]) with mapi id 15.20.7982.022; Sat, 21 Sep 2024
 10:05:41 +0000
From: Konrad Weihmann <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: steve@sakoman.com,
	Konrad Weihmann <kweihmann@outlook.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [kirkstone][PATCH 2/3] testimage: fallback for empty IMAGE_LINK_NAME
Date: Sat, 21 Sep 2024 10:04:43 +0000
Message-ID: <GV1PR07MB9120A11725015A30A050194FA86D2@GV1PR07MB9120.eurprd07.prod.outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240921100444.377583-1-kweihmann@outlook.com>
References: <20240921100444.377583-1-kweihmann@outlook.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0045.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::14) To GV1PR07MB9120.eurprd07.prod.outlook.com
 (2603:10a6:150:80::7)
X-Microsoft-Original-Message-ID: <20240921100444.377583-2-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR07MB9120:EE_|AM7PR07MB6246:EE_
X-MS-Office365-Filtering-Correlation-Id: b2fa3dc2-55e2-4484-dd5e-08dcda24f2f7
X-Microsoft-Antispam: 
	BCL:0;ARA:14566002|5072599009|8060799006|7092599003|19110799003|15080799006|461199028|440099028|3412199025|1710799026;
X-Microsoft-Antispam-Message-Info: 
	TteFV9IJrIRbDyjU1X/hFsIT49qxUAW09BxtabAApETTciy4M1BB3LxQt6KhhH7NCfp6zC5fPbsN1bRabnrtJ93Skwc5TNc6FgN+a5mDqr6PYHWprlJeTDGI/r5QF6IS3FjDqq2e3AwCgCkDpzeS7TptKl9bAErNtSEXriC7hnenc+A0ciOdiPz0zzE4pvKGmkK/njZ1Pxha5U5wvEgvAIN6WcIE0sKZM6uLogLe1g2UYrnZgD8LlRmEt5X4nImEsMIe9ZwQGPtgFnr5WBrhy3QlRYE8WhOulb2r2Fb1UkF6CJr0l/9AcGRp3HV9tX8AmiPt75ua+75lDPiR3OYZZwdK1GMeUKQTUz7yK8UFTpFX7G+49pQwX006NsI9GtUd5QrFjrfjl7oKduYtJ2cu/RY5YQXoYf3mbZQy6z9+MXZaafhN9ALBmQXjEcRmp6CgcrlNltn4LQDR/pmjeNGX7N/JkQP/U57Yw3l8UI/jdC2jC17zvKYkfvf60Kog611VReT8FrokL1H5lc6rYrssVfKCY9ELmVluE/f51Mmq9zbH61WmCEzDGnfFjsiCUFf4xl8hxM9xgyjBoTED89T7dC26uBvfAW1cB6przluqgID7n8m/vq8i92ksTXLg5hGJkFOqDZDvfGBoLiUrkq+K9ywvjC2CTSYjmdHg663otsIgXWRhqSnTCGJ4vyLSLbyVN7Jqx8Uu30+mjPZHVsZgWQ/gDZfh3Zp24IinjH2JMkG+IRpsGl7n/1ZglMbiuUl++X8rF99uPpn2dEx3BHbBqQ==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?MytAdH+ne19ouBukIFKFjaNyxIp3rrdW6jROtEFnjIOuLDXVKOJ5IZiq8uAw?=
 =?us-ascii?Q?XHXHS40ihP28E93aFV0tCms1okOOhR1QZH6eQSChO9YejZ55+yBRunP6m4Nf?=
 =?us-ascii?Q?5K8Pjb7VHJs4/p8bTxTfjp3MeYVFHrkAndW2xyGxrtppkzlOYCRbK0XRK1DR?=
 =?us-ascii?Q?sP2d5MAmHBzcdBwo4QcuR9XjlLt2Xg25mUGeWVDHVDWLT2lGaALzz0CDZhEN?=
 =?us-ascii?Q?uOaEbjjg5+QmyAfwlvzA1fxIuGs/8Q2b97f5pSGcZxyZRWjBWk7h7zTbPkgE?=
 =?us-ascii?Q?FGd2VDDfumIHABEVTzVm4IrR8Xx5OF+oxfFsx2IIySPlD0SGpHuO3p8XnDJW?=
 =?us-ascii?Q?h7WAaY1kUMTXzdk4xPjufK1J01hUad0g1oGEeEBcuC/tgvWsJEn4bCLkVplc?=
 =?us-ascii?Q?KabSyY4j53crD6qq0YuGFSs4gCeO3C32vZumIRpRhbG53Taopv9M/M92dHdG?=
 =?us-ascii?Q?+F/fhYmNyhr2Y4hNFngT8sDwmvRm2H8oQtcq3woaeGisiNfuaQeZN1MmBZZV?=
 =?us-ascii?Q?+HsBduJhwSO7MqKw4kI24UWiFdvC4K9qtPlDm0osn7jqBzpPEZEl1brKz7bK?=
 =?us-ascii?Q?i/d60LaIlM6tpbEVquSSnffA/zzzL42+6zCLTyyUMHMgsez8W+jaxi4s1jlH?=
 =?us-ascii?Q?5xK0XzkPE4RBnvkuD3+6g+0KarbaSWi1sTdxEYIPhH1Ji+EGaDe/hffkZ/l5?=
 =?us-ascii?Q?lJiFaDyEFYOdtPM6hq/e46QVcMrZrlGGFRb9iFsAEUMPT3fSyCjrBeVtwMm3?=
 =?us-ascii?Q?7Pp0mUt4+/Pw6fTqoctywNYS3Ulhh3ZW0gkityldYk54s9aVGV0LFlgJuuyv?=
 =?us-ascii?Q?QrQHxSWPm18BkTLUzMjCNDI01Ol59cqNmDmBeadTO2YcmUhPBHDthbtnvGzu?=
 =?us-ascii?Q?g+hmlQ+g6/bpAr3svyiS81zJxbHrWPsY7GEyZT3YYh9JnHzIvnx7SW4Iyysa?=
 =?us-ascii?Q?VItSuRcn6xlSpSEVCXL1SczC64XE4dTkAPxXhmV093y7y5GrZmtZNUT9qlf0?=
 =?us-ascii?Q?qqkKDmOHthzN79mGfeQFICTPoLOdMRlcuGOF4MOcQJSb2Ing7A0g+lySB4rK?=
 =?us-ascii?Q?iccg746gfhKkOgqo+FpdvrNyVUnLl6mqeyLaJuH/VcyBJFg2E8lRFVfOc8s5?=
 =?us-ascii?Q?8vRLi2N6qWGsQw48/oZrwaedd9xbRkGW4hiud2FzSNU8NmFSZX+NfvC+F5pG?=
 =?us-ascii?Q?EUv56OUW7a5oySHbw8SlTEjXazMJiiMEUlA0N4i2pikORrwdEIZWvgXmi5Q/?=
 =?us-ascii?Q?F7iI1QYUdawhNN5kjAoWKZSqJZ3tE0eYQgoFHilGXnEa1Pu/DgEcHGoBmOAU?=
 =?us-ascii?Q?xDM=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2fa3dc2-55e2-4484-dd5e-08dcda24f2f7
X-MS-Exchange-CrossTenant-AuthSource: GV1PR07MB9120.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2024 10:05:41.1857
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR07MB6246
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Sep 2024 10:05:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204764

if IMAGE_LINK_NAME is set empty to disable the symlinking
for image artifacts in deploy, testimage fails, as the path assembly
is incorrect.
In that case fallback to IMAGE_NAME

(From OE-Core rev: c7a4e7e294992acc589c62adcaf6cd32659f2f9b)

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/testimage.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclas=
s
index 0241f29dfb..a91cdb9a1f 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -98,7 +98,7 @@ TESTIMAGELOCK:qemuall =3D ""
=20
 TESTIMAGE_DUMP_DIR ?=3D "${LOG_DIR}/runtime-hostdump/"
=20
-TESTIMAGE_UPDATE_VARS ?=3D "DL_DIR WORKDIR DEPLOY_DIR"
+TESTIMAGE_UPDATE_VARS ?=3D "DL_DIR WORKDIR DEPLOY_DIR IMAGE_LINK_NAME"
=20
 testimage_dump_target () {
 }
@@ -209,7 +209,7 @@ def testimage_main(d):
     bb.utils.mkdirhier(d.getVar("TEST_LOG_DIR"))
=20
     image_name =3D ("%s/%s" % (d.getVar('DEPLOY_DIR_IMAGE'),
-                             d.getVar('IMAGE_LINK_NAME')))
+                             d.getVar('IMAGE_LINK_NAME') or d.getVar('IMAG=
E_NAME')))
=20
     tdname =3D "%s.testdata.json" % image_name
     try:
--=20
2.34.1


