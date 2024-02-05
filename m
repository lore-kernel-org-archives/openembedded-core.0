Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F35E6C48291
	for <webhook@archiver.kernel.org>; Mon,  5 Feb 2024 07:20:43 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.58271.1707117638096599168
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Feb 2024 23:20:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ptp9ZPw6;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2765e3e443=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4156HGUB018722
	for <openembedded-core@lists.openembedded.org>; Sun, 4 Feb 2024 23:20:37 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=bhgA3kxn7CNS70s63Y
	Tu70CUI31y72puB+7eP8gUlzw=; b=ptp9ZPw6PhSXpzHHLWL5XpW3RoOg4FBaaV
	8R2TFzvxEmadd6lg2b7j9+7Y04zKURbTq33A6qbbLGhSybB+ocFhgFAtwWaWfegj
	nz1xd7pq7h1nniVX31GoBLFD+kaCqPqa6V1COTEt7FmeRm2kaFX1QSUBKVI7NJIZ
	FrvLsb1ciJRRbY6EwhJcZ+Gr8i7I7itswOpTLOG/zLoFlm3kInk/PM5+VLHncSs4
	uMVucbtko+bD8oKx3/quCUuihQi6SxmABDcc0bCJuoobM1L7ixgAhEsYcHUOkk3q
	2B+3QZpWRgJK8RyNv5732Kl/1BIsRRI9XmYJch3lr3P1VerGM6oQ==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3w1hn3sbu8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 04 Feb 2024 23:20:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f42C9qM6px43kBeuDYCExquXRhBKCxGpuUIP2WXaMucKz0Zy+7BpfiN1LTDJrKmM5pWorLjvcz6I9rzpLy7lq/DP1wqViPgXSDHbApqMzDd+J0AgfKr/vs9gRUEswa9T8mGgwU1r6TBXh7rDx/ou961pL2r+BeyVqDwEGx3rpP0hdpUVFPKgIQtvWZOfJTu0SgX4zEqLN7OuXi41+/JuCspQpMdXXxFB2sU8+Na6x0mAlWWwdqp6KLSgVE50rSpehX2I+BO1lbk70WZHz4ZameGqg0cHiLoAfW/whNofxrwBMgf/z1SMYEcCACg4pCYD/s7F2LA+3Apxsd3coUjL2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bhgA3kxn7CNS70s63YTu70CUI31y72puB+7eP8gUlzw=;
 b=ehMBNsYqGQ0qPrIZeT2OvbMHkcEaKT1uYHGiIcn51q7LATX9GIsQjCviCg3agGaQyH7HRr8gGlf8CqK+Ug9YznRuSc1EQnVx4GGyWJekVAOm3YZ1NQYZf/G22N11zwFD8pQPImYMiXOTB1DVwjWaTmS9N7jIeVga9xnpfql3v0ztGr59/YG5E8MfSu0ujfLUuEcAv/Lohu3oCoozJZ0pM3k8P+ID8AJonTIPcbJokIijvRnKA/GycEqPlRi9ElNFue7DObtycLCF07kLSErB1/bo2FGxP41G8QdUOtWP3hTLbyCossC64aMwnkDzZTpKmvFQsZLbXdNwYg56YIAiLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by PH0PR11MB5191.namprd11.prod.outlook.com (2603:10b6:510:3e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Mon, 5 Feb
 2024 07:20:35 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::c66:ddc4:3908:5994]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::c66:ddc4:3908:5994%3]) with mapi id 15.20.7249.032; Mon, 5 Feb 2024
 07:20:35 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] multilib_global.bbclass: fix parsing error with no kernel module split
Date: Mon,  5 Feb 2024 15:20:01 +0800
Message-Id: <20240205072001.3043963-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0080.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::10) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5611:EE_|PH0PR11MB5191:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e1eb634-cee3-44d6-7909-08dc261ae9e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Z5hFaD0EHPZi67cpedSL3fZE70uEJBnyWVfOfEUgaVShDR+qEKM72V/Tz4YsAjOlUfmZ8TLTZx3iAgK6Amk5xgqZNy3VMkE6fx/3+UzuprKj2Je3B5wWNVmTIyIv0fdesHX1n0Ool4y8kzpCw8+C2wxuh8FXR6O0DYlYJ5nYqeJEqR5UWkyY4lojv+xeCKKjvAHDATzCJEu5ykgvWnDkI3+4t+8tVAKR3HH0wUtkF7Ud8FiKcyRKqUhhOvlUhLSdVmg17Lpn55rAIH4kkGcdX/aszSgIrd+azeGTXJUp0l7CRT1tJQPzaWf3fowMnVoFacZ47Ps56ktsN3OL7uMszE7jw0DGJTN6eJ04f0p3hZeyeQh65j8uYVxpd0Ld4DBK3lTPakT7l3PvAnl0FBOLoyVMHloY7RTuKWQOIkMmrYhPyQBLm4mUJaLOlVY0cmze8fy1cbDH9WE6vf3vZNs2PeGRTlFE2ZN+XC7GrjTex0GXmMOGtKjsON3XdsNEnPKQiOiU8JfjLwdcSEbHtn2SDh3hxD93hEMqIsxhuNEVwhgNKF143tSINR5JtTdskWgahlDohx9zSjcHisavPF5KMV2ZRwYz7ypjfMn5oXfXee8KbnDVCjAQ/6/4mE/scIoA
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(366004)(346002)(39840400004)(376002)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(41300700001)(1076003)(2616005)(26005)(86362001)(6486002)(5660300002)(478600001)(2906002)(38350700005)(6916009)(66476007)(66556008)(66946007)(8936002)(8676002)(36756003)(9686003)(6512007)(6506007)(52116002)(6666004)(38100700002)(316002)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?jourGygnodoFP6OGRL0pA0Qr2zR3eWVHfHuPPJWVl3ZsKCkciEMLxmgacza3?=
 =?us-ascii?Q?igJTTA5fTwKRQvULfeCQCPdMT4zuzf6t0LQ2p/ukAWCyxktCi8dp3/sf9ytR?=
 =?us-ascii?Q?e5gZi/O6ZM/dEVvYtUHdVXdvNk2FFT0JAulm6abnDvTL+mR4Wwhqj8G39ANj?=
 =?us-ascii?Q?YUxQZocB+9662BtGHi83enqdIyEUhB133izZRVG/Y13qVL6sHaAyXxIhwgA+?=
 =?us-ascii?Q?0mkkuVOJkHpu2mlkpFQFBpChVDa9V6mptp/ZNpwuVqS7GEStSDdNTi9vSnVu?=
 =?us-ascii?Q?kW3xoOB4WXWByZFdI2xnhbwDcMI7caaRfkLqmcVFOXuDqi1MKm9I4RzawoYw?=
 =?us-ascii?Q?DxFSeEcKucTfzk3z4nV2IbzYpH/X/h2MeqHpZr8M+Q4pje8gTcoAwstN3gmc?=
 =?us-ascii?Q?QuWJCgKcRayx00DknWCKJtCldnvAQbLAI48xZIqyheuQeoUJTQZC2vDcyOB4?=
 =?us-ascii?Q?Pie5v3OqDVinW3pw2qL4YBMgQuzXLdZRqLIV1JTbHJ0fvZkVhpE8YChcyq6l?=
 =?us-ascii?Q?r+8iOiXEwbscDajx4Vuyhtnp/cCzqaCS+Ylz92gAi5Vk2UqP2gKLGp6LLkZ5?=
 =?us-ascii?Q?tMQ1ZWs5inG9u03Drrv2umwGJCcqMAGsw9olBxm9Elsywpol0fE3BgZBV8Dj?=
 =?us-ascii?Q?/LWcHvtEbly2yp2DkAcqYWV07XQM/zLvbW97QIqzPec/LKqO33sQGglmXoNT?=
 =?us-ascii?Q?Tb4W96KXkGmzIaEg+Jf5R0LuwOW7i2nUeHROt0KM+6HHimxEyg8FKHg5dGYE?=
 =?us-ascii?Q?j9geQq3iWCu6eW6ktgNWs54veg6ntSjUmAEWpdn9SF0UhOtgHH18FX/X7Dov?=
 =?us-ascii?Q?0XTvUJoilLeGxoVwOMz2USg2aWAyP5K/E8OQ4BsGU2ggxVz+WBl/8yXbjvW2?=
 =?us-ascii?Q?P/i15TRPYvGyHSLqMv5XVClA0SAPd8TZn7LziwPWw4bnEiXgR6DyZa2lRETS?=
 =?us-ascii?Q?bFid6+zXu5+8UrE2pcfRpHm8+3K8Wgq/GAV8Z5xMcHuYXiNd7bFDb+8yGoKS?=
 =?us-ascii?Q?SkJ1XHgfsXibuqO0m0TBloeKDilLRnBfbrSi9hLDwDEdq5ePqgYBze7H2IH3?=
 =?us-ascii?Q?zqsQsLnLGe+r4g3z2rX5LAsTiGBbf8LCaxV5eWjjZ3io1uMSg/UyEl/tVMgB?=
 =?us-ascii?Q?+9N3Mdwuk4pzq6WYOsE771vFpCfLkdd3k23WIZ00/TMoydIIWGTWLRGM9jKI?=
 =?us-ascii?Q?Wg7Tu2moeXzY1rJGWmMFvdlISBbYLWnBBSC6kMrPLXYs67zFqdBnqRTFXaiD?=
 =?us-ascii?Q?bnV8nIO2Bc7jC2SCuRmIZGauWmV/bHBtA11ejf0FibnQR/uvcKwOV214SEJq?=
 =?us-ascii?Q?pkUoFhe/SLT6NYAH/J+6e1h43Ei9yJeQR5CAnIteHirdvVZTqcn4k57Sa9xi?=
 =?us-ascii?Q?5rqpNqtOMsl/N7ToWnf9KDkiMzwRh/3jahuid2fNzTmMLQ1ZkWmfxMkwdJ9K?=
 =?us-ascii?Q?on6SWwcDO7t1g9A4UeU5dvdu1R/gMqfx8S0PN6JNtTI12E98ZUUYmWCrKkXs?=
 =?us-ascii?Q?R0f7qcwUgJG7i5wO/fkGAPFXBRCYsgH8Bo8IKFU/vakuXvAuZ4UHFx6yDeoi?=
 =?us-ascii?Q?DCxx0S3/IobZ3xINuBLzVIpKfhyYVlERfh1O4OSs?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e1eb634-cee3-44d6-7909-08dc261ae9e6
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2024 07:20:35.1169
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1MnMBrjHBa4RL3YK3WdSDcBokNycjMCDHJLZ6OAQVY3gR1VoaNhajPBe/P/V5807wUC7im1a7L97TwBgceo35g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5191
X-Proofpoint-GUID: rbUjCjKjqYRy309xAaxB8atZOC605fz8
X-Proofpoint-ORIG-GUID: rbUjCjKjqYRy309xAaxB8atZOC605fz8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-05_02,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 clxscore=1015 mlxlogscore=999 suspectscore=0 mlxscore=0 bulkscore=0
 impostorscore=0 phishscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402050055
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Feb 2024 07:20:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194920

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
such situation. We'll also need to delete KERNEL_VERSION_PKG_NAME
to avoid this parsing error.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/multilib_global.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/multilib_global.bbclass b/meta/classes/multilib_global.bbclass
index dcd89b2f63..6095d278dd 100644
--- a/meta/classes/multilib_global.bbclass
+++ b/meta/classes/multilib_global.bbclass
@@ -195,6 +195,7 @@ python multilib_virtclass_handler_global () {
             # from a copy of the datastore
             localdata = bb.data.createCopy(d)
             localdata.delVar("KERNEL_VERSION")
+            localdata.delVar("KERNEL_VERSION_PKG_NAME")
 
             variants = (e.data.getVar("MULTILIB_VARIANTS") or "").split()
 
-- 
2.34.1


