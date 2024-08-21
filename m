Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B25F7C52D6F
	for <webhook@archiver.kernel.org>; Wed, 21 Aug 2024 12:14:13 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.105])
 by mx.groups.io with SMTP id smtpd.web10.18172.1724242443439104683
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Aug 2024 05:14:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=0nQaLPoz;
 spf=pass (domain: navimatix.de, ip: 52.101.69.105, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lHgwwuHI5JSUypwqxhtuB/vdY7B9akYa2BUmk/gerauVMRDzyfzEi0px3Gfj0SpgUJr9aQeYyX9YW3h8se4SNbVyw0KfMrpa7XoxIZPc34WdbPhDfHgCoL6C931b2h3tDWouYJIIQjQabLkzHecuoyrg4DbGKtEcm0X0tBztdyn0UGP+0PtNsiw9HTDabtfO5oMl1zLhYawcXyFDrsxc/wd9+2FmhbQLDF8etX4NZ4Vtvg8IdNeuMZl2q9hf3HcKoI3HBzWfVsEdHdxm03rbUn21ammI+O8WVJhoz9GXlGcLVZiCYvq/OI40J3PK/xdx4DnCEMnELno4zCyXTaQJJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sNctrj5Xo6KPMKxR0XJJebLXx1FwP8TnHwSNFsuLUEk=;
 b=l4msvpaXtHafjxfwLOw0jJI2bS4z+YuJiGrYdzZRU/Ip2sEquU5zxrkqYdn+G72Ky9C6a61TgpH7LBxYzFpj0WAmJzcTETmH5ZLz8omdrdaT5igdUIEYCBK42fAipuBuqPNbr5YnzS/kU1lxB5hcKsVjkUjz3sVuugB4qyYiY5WnyTX73j1k8JcgcDxRBchXqfrhwmbx2yGmuTc7Yc1AqMXg180/bWycdUfYk7dzPmwlbBW5t6LsCbUq13+AGX8h5QWR4RcfR7BtwUwSxbXeqVGw7D1X0rAMitGSzLnYQrMPOo+1/7aBieIQXmDMq5vMHUIK/EgQJDlWn1qPGbyG6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sNctrj5Xo6KPMKxR0XJJebLXx1FwP8TnHwSNFsuLUEk=;
 b=0nQaLPoz3TjUjUvrHfiLr6ngWhjm9nqn12O0Dwve2r9YvyoKz+F/2abh9yX9POiITCsBk0HGvmTqJX+1M7sCv2QBuclsUkriftNicv8270J5O4NkK1f0tRU8kmDGauJ1h5AZ70X/Ds/WWhYrQ7apkTI5TQUf3r4s/PUlbrQpxcI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5) by VI0PR01MB10489.eurprd01.prod.exchangelabs.com
 (2603:10a6:800:20b::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Wed, 21 Aug
 2024 12:13:56 +0000
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7]) by DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7%4]) with mapi id 15.20.7897.014; Wed, 21 Aug 2024
 12:13:55 +0000
Date: Wed, 21 Aug 2024 14:13:54 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-core@lists.openembedded.org, joerg.sommer@navimatix.de
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH] ptest-runner: Update 2.4.4 -> 2.4.5
Message-ID: <f34931a8db35583eec12c70acbfea37400275412.1724242433.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0250.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8b::17) To DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR01MB8293:EE_|VI0PR01MB10489:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f78c7b3-82aa-4c51-f8dd-08dcc1daba98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?s910gkfJDaufUuTy774IDIT/nwB7xKcqCm3b2D95nIDwZAJZvYOCNATgucWX?=
 =?us-ascii?Q?9HJkMZvKlFry4Ah3KlP12kdzRAnApLQXXLPqrp0qNO1zGENw339H5X5bI2sB?=
 =?us-ascii?Q?kueMWC9Praaihyw/zUFplOvr6Ws3PHHNbjiQh/NTOGtSqODmspjCDZTu1/mf?=
 =?us-ascii?Q?/VlhwnXbEWRsAt4uJtC5RTTdengTVD8EK5dovgKwfV2h5E+lUKLraBmTAkTo?=
 =?us-ascii?Q?oXbpRBmO2oxghF/s9pBcgXVMBTkuUH1nOBWhQqwSG2pdyIw6VjeCLkkgk6V/?=
 =?us-ascii?Q?MMW1whaeKV+0Z36OzAELFGK/sxf0bRUU24kF5G3j2DYbJTSLp7cZVLHAvfbY?=
 =?us-ascii?Q?3HvUPPLR9FbobTB+2Hr0gPG/PEUL0r29Eu/0PX2Yl1VbltlwItO1Vqf1nLtQ?=
 =?us-ascii?Q?rPI61FwBeLrmCQNrhiEpAJRZAk3DoLueGcPEQ1awaJUfChv/vEdcdzygl9zY?=
 =?us-ascii?Q?nc6Rgbdg6v51gWl0pQBanuouzOI8QF3K5/P6kJasYRLox1wscYZ0ScAzGIbS?=
 =?us-ascii?Q?1UYiZ+V4u9ZuXQCAgrEFuOoV3bRfVIBvE8H5OMMZ0jtSzNZP2vxE0UHz7hVB?=
 =?us-ascii?Q?eUPgR0P4ZluAPwVDYVSPoHq3VT2mBvn2MuNLY+MW5fmwt9Oqv4Q4R9JsbzxY?=
 =?us-ascii?Q?YuhhFYeHtxy3JLUZmzWGxOHd+m2I5MeInYTZm8OmXEHb988xZmKrWc6wgTcE?=
 =?us-ascii?Q?nImkvJTz1iOiZKrGXLXl7bbqJcyYq3yKiaJIA0jGSZrM7YORDpIWEO7gRj1z?=
 =?us-ascii?Q?g0eMmto/HyOyLnG//XFv2+OMqaJPTnGYfYo+aOPU9BiaW9amyKdLgBf6dUJd?=
 =?us-ascii?Q?MM1soyVMPb7GjRw2HpiirUPnrPwqy+eVW9wnH66tTL4ABiN9P0w7NwpL2EEm?=
 =?us-ascii?Q?uujJkBFHv4Gv5CZ2YWOIUwHW/Rui1AQJQa3Hh8eh0kmh9mYUhamQOQPCiayG?=
 =?us-ascii?Q?DMJXNCHxjtKN5gGTaHBeQk5rJ+SXkO7pM/6pAyDq2t/oUEK6CSFwyAFsl7Gl?=
 =?us-ascii?Q?spqTjWK99ajqahjdhbUF1D9tvlclUUHBUsX7sEGiLGoJCrcgSlHKlV+hmarg?=
 =?us-ascii?Q?LurRITQCtCiLlYhuUIzuI5i40fpMwYCu6C9fV6znR+6Zb20aT2cVbkJhiQtW?=
 =?us-ascii?Q?Ts45NWVNOsxyzOytdzkgqKO6DuFmum7gd+xukvHhugUK2lQ3I8zKRlJ2YwRq?=
 =?us-ascii?Q?8GY8BQSQps8gjpEC3ebx/SzVjDGOZDn5fofhdAoND+xB7ba72ciSb+oYeM3m?=
 =?us-ascii?Q?Q1h0dnJB09F1I5Hnu47TczXIbTHUZPfgeoxXp7luOVEa2Q3PbHe/9eAX1tF4?=
 =?us-ascii?Q?gbo=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR01MB8293.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?JoR8TP1KIeYPMv8Kgdsk5JzqiI618E0zQZ0eSvR8a4CSNfGR6qi6FIY9/vEB?=
 =?us-ascii?Q?yzFIht/v5kDDeqY5XDce/dyU5Qbtk5WqzezrH1Kz0GkgMoVODyYCmgyeE6He?=
 =?us-ascii?Q?No1WLYe/y0tMfZb7LTRADCCzlEpoJ3//eTL5UUqa5z+IkgQ0T5ZSx72o72dw?=
 =?us-ascii?Q?nfkotHoK8sAFPtAr61C/1OyzGC61r0UiSSoIvSmRNJ6avXv3btZxRUa1P9jq?=
 =?us-ascii?Q?Y3Oh4kf1dooi3FMkc9wx3vnZCtZQ1BtqLrQNJNAsYEJqusFmmPAiwXBndhdu?=
 =?us-ascii?Q?Sq6sykGUDFr8FcCumTFOLb+NtgVnmTjGd8Ps3ohtJ9p8hGno0GZzsvxgxeeR?=
 =?us-ascii?Q?3+p8Jq1Z3a5FdpjAxTUo1vSrjEdhdiemblE9Ld6zpm5/C7U4LU8rn376eiup?=
 =?us-ascii?Q?BJadegWrYRJA54W2UbUiFNTTBKGO2L7bbDxPDhuTY2W6C/BdrD2rgw4OJeYD?=
 =?us-ascii?Q?xX+3RMBNGGvSjCnvDWyKkN6Dm2HuXv/wEA+FjR27GTEup+ZmxW0RHX0lHWWu?=
 =?us-ascii?Q?EM3tJOYSEAORO/2DuFuLNvljY8ni2Cvpk93AAyBnp9J5XDYgK2yU6FHGjm1x?=
 =?us-ascii?Q?T0PltOO5JkzlHs29UTyMEUakCjoYR/CBLtcxSvWL5uitkpQ5BLfjXnfFzKDv?=
 =?us-ascii?Q?QNcoZN/ZYB0lAQ00xVG0UQA/OWQFXl/l3WNFgFvSI3kiZWecRjri2OtSptY1?=
 =?us-ascii?Q?ZBZg5ZiKqDe3EP/QQJnm0ZATuNsPORXXj+TR351jzCqFxauXCItbH3kVfYk9?=
 =?us-ascii?Q?XW+KNAR1bCPMuwMrdRVRGYwmhNLuoCJUsy/ZYDDRMv6Rvkw+yhIShRDi9lxp?=
 =?us-ascii?Q?LKXTbVcQJGEWCqDOzjtQ8JoTG/qV3sTUPH3jsVfwoLHMf2fxzSQZtzcIFYdo?=
 =?us-ascii?Q?qAKQG4s9RhLYAEbibnlksh014VS3jx/x6p+Q/Fh5dcdtfykbjV40Bdn/BcYn?=
 =?us-ascii?Q?8uVbFTnZJdXJONCx0Ycg0YaNxX8NI3ppBLbZ2T84xnf2pmwaKCXt9xiudVAE?=
 =?us-ascii?Q?cn8+1JFe0S30aRqb3cCgchvsr02XC7KyQbW9w0nOdprbimlHPlJKPQwPfvwk?=
 =?us-ascii?Q?E1y8LJjzv30yjEvUdbqcRBcXsfukuNoiGFoVlaT4iCdPrEOin/z8ed8/09Ga?=
 =?us-ascii?Q?A4w3YXYNdEFTcpn+6x9WLAjZBuOyd9BvumcZmfnU0K/MTxl/pe3mQBRuHlMa?=
 =?us-ascii?Q?N81Yqxd7ep2V2VYMNm0nbFeSqO+dzAGRZpadVYc/qfZCdTpo4rYjiDr4m0Aj?=
 =?us-ascii?Q?TLSoJtxowEXQrypZwRkknKTFzZgEHa9LLjGuukPFk2wp33VrwIh8mSjl0UPh?=
 =?us-ascii?Q?w06vBRO1QcMPujQm6hhjrue34SW86Yfs9Nr1h3SehiHIdo/3VUtAEiWLxufe?=
 =?us-ascii?Q?p7fXr1uiurfjchSDKNZ6pkK0H+1F+7ktlMmZr1sTWY64KikzGFGm7O9EI5YS?=
 =?us-ascii?Q?anOcRyZfLC1vGd1U5oOHcMfiMN/xAD6LCoQ6xfv/ciWesQEbaaThz7a/O5hW?=
 =?us-ascii?Q?1ysZyVwUFGd5kEp6E7WLjz8VzKzToy1/CC7T8n0H+NaVsYLtH7UEtteCh5G/?=
 =?us-ascii?Q?dmdecH9J3fzu7OxLpL6K/UDJ/T4Jgx9EXXh1mvQ2crOvOJvFrdHLJ8F+LG5m?=
 =?us-ascii?Q?JA=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f78c7b3-82aa-4c51-f8dd-08dcc1daba98
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8293.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 12:13:55.8369
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pkeawEw47VMqrciiMRAuF2PtIRp3rsNR842y6DVXbMr5WSoFWF/xSRTFGMoxju7QRAaiHP82XpEU0Fn4MXdHZz6S4R/M3KQalcgSUnf0szo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR01MB10489
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Aug 2024 12:14:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203586

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

Changelog:

aea9f42 ptest_list_remove: Fix pointer adjustment of prev and next

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 .../{ptest-runner_2.4.4.bb =3D> ptest-runner_2.4.5.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/ptest-runner/{ptest-runner_2.4.4.bb =3D> ptest=
-runner_2.4.5.bb} (95%)

diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb b/meta=
/recipes-support/ptest-runner/ptest-runner_2.4.5.bb
similarity index 95%
rename from meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb
rename to meta/recipes-support/ptest-runner/ptest-runner_2.4.5.bb
index 2263e07280..d28ae7ca91 100644
--- a/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb
+++ b/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.bb
@@ -7,7 +7,7 @@ HOMEPAGE =3D "http://git.yoctoproject.org/cgit/cgit.cgi/pte=
st-runner2/about/"
 LICENSE =3D "GPL-2.0-or-later"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D751419260aa954499f7abaabaa882bb=
e"
=20
-SRCREV =3D "95f528cff0bc52903b98c292d4a322fcffa74471"
+SRCREV =3D "aea9f42f87f2a78a973ae22cade8e45259f754e1"
 PV .=3D "+git"
=20
 SRC_URI =3D "git://git.yoctoproject.org/ptest-runner2;branch=3Dmaster;prot=
ocol=3Dhttps \
--=20
2.34.1


