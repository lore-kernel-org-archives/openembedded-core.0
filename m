Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C64D3C4828F
	for <webhook@archiver.kernel.org>; Sun,  4 Feb 2024 05:59:36 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.33691.1707026373578858706
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Feb 2024 21:59:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Gr/rjdUA;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=276424a97d=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4145UL3e003070
	for <openembedded-core@lists.openembedded.org>; Sun, 4 Feb 2024 05:59:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=vnm5+7D/IvAdJTtPMA
	GSWO+cXqSEQyqdNyQgoHdUf6A=; b=Gr/rjdUA7w54OqTg1/g4DsyfhZ7ydnGO3v
	K92IsrGyY/T1vQXPGbtydyl3nQ+vcfvQztgJZD55keWw/mx3MoZ0MugnbsU8FjOy
	gXKYEXnVU4DQbjWdUqC5T4aMyMZKZrmYegS1GwwWKfKpB3aGV/q/h60njLy+Vi4g
	2QsI58+eafdYkYmxl1a0zMP1eA919mcXmTIXeROgwanxe3vcJM81Gwh/qWT5sl4f
	wblkeVHyZ0+zGFcP4UHJ+yj43evb2z3bTOzt4Sr+Dd4XFkJDfWa+3iKrfSWi+vKM
	Pk+my43jTILQ6sRcoVkdGfzoJ1NAO7GeZ8B9UmiYu85IBr+0pjBw==
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2040.outbound.protection.outlook.com [104.47.51.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3w1cq0gtax-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 04 Feb 2024 05:59:32 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IL30wdCycb2ZPBz4McqOmRrKcSewCiXKkv+9clTa2uRXPG+iuRtlYcAZn+Pq3AF63Ch9VyA6M1YE79F/UhGEtairzyMBUV2Key3SuFqh0Yr49K18cgSwvAKncqYfWg8g4boTeNTFaZuJ5vhd1RBM9JmXv6R2IkWA6ThFnq0BvF6n4msJ/FxZLCiWKzJ0/5ahQHjM2TBx2yPdm0+O9QqOQMQtYYn8LbpYfcvLNLI5mRLHaAyKdRhqt/Mei31nJv1xxXbxTavi6AGrF6pAxtDQWMOYw28XHMVKYbvc4qJe2yhhznHw91CCH08z35bER4SAWB6Z+JC80ObvCnG6B4lIVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vnm5+7D/IvAdJTtPMAGSWO+cXqSEQyqdNyQgoHdUf6A=;
 b=PqXKjuRzDQCt4cdud/geSHZbW2o45PkF0UFOhm3Ty2/BLKGBg3fzJ4m7M3oG4uvE8p0Bn8AyExPVRMRNdYZ2fgJGQBdmDkQBUhH3lacrr1k8xTaZHMXw/67/AzMIQfmEAmbIidFz0Y3epnFj2jP1bqTd8KnjPsmwv5PAoWiQHQ+EVatpczVjTzat0O2er6eevyerNReQzdnrbkBp3V0cX0ZEeWwH76pU4Z06JJCioradO93BAX699Sjx+192MI0LX/m0SFlxA4NXc+PlyFmBH5iyXfaCflU8D1ca/D8Wp4VO+9GQx7QN5LwG6XBDU8ibi4lXEVPFxJi84XTXe7RGsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by IA0PR11MB7284.namprd11.prod.outlook.com (2603:10b6:208:438::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.32; Sun, 4 Feb
 2024 05:59:29 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5d84:2b01:5029:9315]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5d84:2b01:5029:9315%7]) with mapi id 15.20.7249.032; Sun, 4 Feb 2024
 05:59:28 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH V2] kernel.bbclass: fix parsing error with no module split in multilib
Date: Sun,  4 Feb 2024 13:58:38 +0800
Message-Id: <20240204055838.1288467-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP301CA0020.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::13) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|IA0PR11MB7284:EE_
X-MS-Office365-Filtering-Correlation-Id: df822dc0-416c-4a83-1a60-08dc25467291
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	TbOS9DZXx/77fLCxFqL97vX5y3tGb2QzlwRehWqaRR45HCIaLZqb55dvknlL109RoOzGkYufNqCkDeHqeS+nZJAPJHPIs3PhfUrdwLxwLxRN1FC+iYUSKIGBEdU/7NUPYmd/XJk5Op3akVaCFI2wfLenpTnNo21nxCFiuo6LOy3BtFdQwa2ohImPCv24Kd11UlrxNKxMp25riIu408FqSsaLH62+mzaOfwWiQDrLUvnYUNgVU2zl0a5dUr916r7GSYLNwbTN7qSHZ58GSCX6T+yQx066W8F5M5NWZsuXO1C4wIgDYjGW9ZottHBjphiHhPumW8/4y3hOC1ctUHNJ51xhsG+3losqlGNaWjxWHn35NBNMQ2qaIJ03F6kfa9DJOpBKzftqVlnfsPv8eHK1fz0k/v72u2Uv5XATvAnRshndaYMZ6hwcjSagmTUQ2XLGHWUr0Wn8aADw3aAM+6aUeemC2y7tqJFhRbw6lx/AJwKdj+dVv9zD2V9sr7rwm4lfg8u8wIp5UOI9nP/OvPnJjY6YhrAA1IqpFayudwjAMXmiK2qHoy84nRS9eZBcTKh5P907Bd/5nE5ykBHxqrsfJKw6/nMO9Bzthabsm59gGuArnSECszzSg8DlmC06zV/u
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(346002)(376002)(396003)(136003)(366004)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(2616005)(26005)(1076003)(41300700001)(36756003)(38350700005)(6916009)(316002)(66556008)(66476007)(478600001)(6486002)(6512007)(52116002)(6506007)(9686003)(83380400001)(6666004)(38100700002)(66946007)(2906002)(5660300002)(86362001)(8676002)(8936002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?k6dEBrK0pAkoW7WD/NS0pm3VKVmhzAJ3RnPIZYL6Kd3PB1gnpgyfjCfhqJ6s?=
 =?us-ascii?Q?PKGDXWpWWG9V4URvEW6Ve+cJmx5vHB5ohYrcskgV5/BvX3Ja7wUs6Sjwk2XF?=
 =?us-ascii?Q?Hjm6ValJycRMD35zpJlCKh5VTc/FKSRHuWy9IyoDr8v5ymhUZEaabwlJRprl?=
 =?us-ascii?Q?FuzVQL1O9Guz9hnoOmvdsFLFLvW7CQHlIGqzSaIcZssflEaIvg7rJlWnlTfW?=
 =?us-ascii?Q?budWr0QLf9hpGunVVfgeC9zNZYdz+AV/fVpBFV+252qbOeYxT+a/QNSFMb/k?=
 =?us-ascii?Q?qGeKeqK65K58sM78mBdQkRpHP1gBueXuaf0oZj+bBaHIfCGVbFUKNMwUA7k3?=
 =?us-ascii?Q?llbs65cPsZYqpQw4bYt0cQP0bQCM4DRh77aLh2LdyUQdHx4O8Ona2IsXILJ6?=
 =?us-ascii?Q?haMU2UO1nmFwDLU3gggUBKen24JPFTTE7dcQCt8DF7uZoUPFnqAVKEBTnTZF?=
 =?us-ascii?Q?Befk23pmL3GoByk7UNMV6ir2GqTJZRWSFepglcxpWApmsaS3Oz7wJc9L010n?=
 =?us-ascii?Q?ukjhGQxjd1PA+k60gXUxRMUtZYaa+4VZ2AC79QbC3lWdaH1mofRzdNPsfrTX?=
 =?us-ascii?Q?FTaJt0t7CDyLMJkYc9+z+D0Y1MaoCgTc6yflsRMnPmpjs9CUs8Vxi0kWAYnE?=
 =?us-ascii?Q?eK6aR5ZdKue5103SPvRdpjygwe/ruj+l9ISIAtJ7qU4Eoi4Lcyo0a9pHVdgt?=
 =?us-ascii?Q?BuF5vhGLJwGsDNPOs5OESG+j17XZ/7NecaOq0j8m+EQWNM24JQUEA/iJc6KR?=
 =?us-ascii?Q?ggxqM/JFmM5miKog0CAR3vxZ+QYVNh1DPCVN1SD/PI3VL+ZahoJFaXOkx6RL?=
 =?us-ascii?Q?wWqv9rHkPT8Mn/Yh7OzuL00m0JQIRHXHKbIcFFkzQdUfSkFzcRMZAAtt79UY?=
 =?us-ascii?Q?1xLYMQKklnJSEmYlbHinlEGbPdAI3OrugtKTlsVje+vT7pW84JioorWTINSL?=
 =?us-ascii?Q?rBK56ZdM883kfZsVnIxOJmW78UWMJ/167Jlt9XB74db1yjaeScVIb3Mqo0JM?=
 =?us-ascii?Q?3K8AcU8/V/hrePxGNdlyWHHUA4L9fIs9nuQYmlKAp916Z+HNr7VOhxA/FGhC?=
 =?us-ascii?Q?GPtksH3peZCkR2EmsuUqL79ZZOi7OIvZ94M9FBFNlHD7/AcFUkB1toqnafAu?=
 =?us-ascii?Q?Fzb5tevcXi0H4v/XhY2ael7izOAYB+spe6VZxL63fIRFETF0l5M1mWVY43eo?=
 =?us-ascii?Q?E7MipAlAWCL03e+WMA+/O5SDfo0NZ9Bu9USu62jsH0TaLYse9/wtphMXM+2K?=
 =?us-ascii?Q?JYx5sNKuOAJWgm3/JfVyqu6YRxAIOxWzb+ojbBADWlSSPwO7QH9KTmDLVl5w?=
 =?us-ascii?Q?ZoiuvZur2Eu++HQWdGI6wugkpFsVYqek9UiW1muKpP8ASB5JQDMBqKsXOSj6?=
 =?us-ascii?Q?JsRHuAnoz/Njq0M3tN4XSKQmaFYGzubH3UeNGNTagryPsJT7euXquUHqbTi0?=
 =?us-ascii?Q?KHo0xjbG7zRu+MKMZLSGvj5PXjCEr+G8UypvfwJ5muoY3u/6A1gnQ+FJI/7i?=
 =?us-ascii?Q?Bu3F470XjMQWoGmnFdDBp2XfO/m4ntUMXAicyIbzz7CSz9KPrrz6NcNhd36X?=
 =?us-ascii?Q?RZyTDXCpt5lsb8yoOESOI/NIQMGR4kfqZCxtJ/IQ?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df822dc0-416c-4a83-1a60-08dc25467291
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2024 05:59:28.1364
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VY1Es9Rekn1vMLswl/KE1g4SGv1HtCxAg8IKIN6CwCaqdUgFFuYiJQSzIJ9s7TcArPcDElPa1GLY+g2koaqvtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7284
X-Proofpoint-ORIG-GUID: zDqeTyuupap7sajnaRMmzl9FBOnq97a8
X-Proofpoint-GUID: zDqeTyuupap7sajnaRMmzl9FBOnq97a8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-04_03,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 phishscore=0 mlxscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 spamscore=0 mlxlogscore=999 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2401310000
 definitions=main-2402040044
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Feb 2024 05:59:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194875

From: Chen Qi <Qi.Chen@windriver.com>

The problem could be reproduced with the following settings:
MACHINE = "qemux86-64"
KERNEL_SPLIT_MODULES = "0"
require conf/multilib.conf
MULTILIBS ?= "multilib:lib32"
DEFAULTTUNE:virtclass-multilib-lib32 ?= "core2-32"

The error message is as below:
  bb.data_smart.ExpansionError: Failure expanding variable KERNEL_VERSION_PKG_NAME, expression was ${@legitimize_package_name(d.getVar('KERNEL_VERSION'))} which triggered exception TypeError: expected string or bytes-like object
  The variable dependency chain for the failure is: KERNEL_VERSION_PKG_NAME -> RPROVIDES:kernel-modules

This is because multilib_virtclass_handler_global function in
multilib_global.bbclass deletes KERNEL_VERSION. So we need to handle
such situation.

The KERNEL_VERSION is defined as:
KERNEL_VERSION = "${@get_kernelversion_headers('${B}')}"
So in a clean build directory, its initial value is "None". We should
sync other settings to this value. If we use '', then what we'll get
error like below with the above settings:

  ERROR: Required build target 'core-image-minimal' has no buildable providers.
  Missing or unbuildable dependency chain was: ['core-image-minimal', 'virtual/kernel', 'kernel-modules-none']

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes-recipe/kernel.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index a76aaee5ba..7c1cb0ec77 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -44,9 +44,9 @@ INITRAMFS_MULTICONFIG ?= ""
 # number and cause kernel to be rebuilt. To avoid this, make
 # KERNEL_VERSION_NAME and KERNEL_VERSION_PKG_NAME depend on
 # LINUX_VERSION which is a constant.
-KERNEL_VERSION_NAME = "${@d.getVar('KERNEL_VERSION') or ""}"
+KERNEL_VERSION_NAME = "${@d.getVar('KERNEL_VERSION') or 'None'}"
 KERNEL_VERSION_NAME[vardepvalue] = "${LINUX_VERSION}"
-KERNEL_VERSION_PKG_NAME = "${@legitimize_package_name(d.getVar('KERNEL_VERSION'))}"
+KERNEL_VERSION_PKG_NAME = "${@legitimize_package_name(d.getVar('KERNEL_VERSION') or 'None')}"
 KERNEL_VERSION_PKG_NAME[vardepvalue] = "${LINUX_VERSION}"
 
 python __anonymous () {
-- 
2.34.1


