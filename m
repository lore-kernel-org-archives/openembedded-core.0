Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ABC2D6ACF3
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 16:33:41 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.124])
 by mx.groups.io with SMTP id smtpd.web10.75808.1732725217855043715
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Nov 2024 08:33:38 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=czBTL7h6;
 spf=pass (domain: navimatix.de, ip: 40.107.247.124, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cdmXCJDZxfSiMJB9vwZRjbdzcrFxsHQQeaaSx2rSzjc2nuENOIZuAsdR1+m7sduS6BwMXm7CppvgdWMFanKboEjO0mLy8gBeLxJiO8VtRXxHVh7w+ZYjyn61iQbJ3QWoNazndQ6M20etIrHqDRHbB84eQo1FA7V2wXCYvrgBLPFAk+wcAKcmsdMY2LRA1m+gZXX1c6SHGImJnYNbIYxeoajmA+Gn7qsQw/vllVcVe9QlnAUkYCUxMeuiRNNaqatLp2twry0w++Dq9K67LAv32q+D6XslZ5pwfO93DoeQliEgJTbE0L1z8TuF+MzR73hqhhAKgCzMUmc6ksP3J6dpHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lgwb9a8jIr5u0GOhQVYbL3XM3LdmVMPL6pDJZDQvuwo=;
 b=rZywgDM7hQbpdtCkWzB/CFdYJIbu6t6iOhTN4Ua1qT4gkWSPg5XE/nNuuB0LSjRexUgcN1PaVO23C8u2FHWKe4CDAk2xko/erKeFUTp+Y20YAs1Qi1aY9hrIRSJvr4XQ8dXeCVhbnz1kt8tG6pu8NtVvPFT98qVP7jW3TppjhAKhm+V5oQCALESP/NFHPAzXa/J3+ltBRKXf9aLg3sYAgs/woIyLO4LhW2hSH7IkqSkPLfPQMYkW5meJI+KKiJa8sDB+bMoI2+WOhDhT5btlBa1pvb4Ev0UnQYHJyM4gEWuuJ6/WFXpFch8VNSaflUc5N1flTDFx7E/GofMNGfd2pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lgwb9a8jIr5u0GOhQVYbL3XM3LdmVMPL6pDJZDQvuwo=;
 b=czBTL7h6n3RQHM1yqu0yrZlYogWLuax0eDgMvXJ8UkNccXxI5fRA73K3pO74QUHaaNW4Hyim+W4yzpvCO7M51A+UdIeNL3gi02SMAHCcedkwfCzWTy48FFqaVbSNWB8WbCJ9VksvH+LhLr4ak/WvBeUgjLEMDyXDq6vmOMVEWyA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5) by DB9PR01MB9223.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:365::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.21; Wed, 27 Nov
 2024 16:33:33 +0000
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7]) by DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7%6]) with mapi id 15.20.8182.019; Wed, 27 Nov 2024
 16:33:32 +0000
Date: Wed, 27 Nov 2024 17:33:30 +0100
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-core@lists.openembedded.org, joerg.sommer@navimatix.de
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH] lib/oe/utils.cpu_count: Raise maximum count from 64 to 192
Message-ID: <7c42e340baae4038324e250583e9395fb8d90463.1732725209.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.45.2
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0217.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:88::20) To DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR01MB8293:EE_|DB9PR01MB9223:EE_
X-MS-Office365-Filtering-Correlation-Id: 25304874-0e14-4777-fb7d-08dd0f013b2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?88yam2bW++EBCNrxeZNZXuH2SQERI9umFs+aZ+4iSHZVu0r0dMDvilIDS2wE?=
 =?us-ascii?Q?CybaQpkNwS4Ixu8Mk7hml/czgusefTt/U8hw9OekvJ27N5lpFBhQwV2WhOj2?=
 =?us-ascii?Q?b+qPwJ9c6kiR0Dx1DrryYVbFWX3aummj8zI2SSLqVO+YFpQoiXy9TKEfEtbx?=
 =?us-ascii?Q?W74ERb9wekxBVr+LbM5S8qvSarkp3yz6KacvEwRElK1vUgojfXPNg9bm1l6/?=
 =?us-ascii?Q?gy1VnMHzlF3SaNIMltJRY9luuErzOjnBFcqgFuWYqo+e3f1/B2BXugqKDmP5?=
 =?us-ascii?Q?MHCXyiqc71sxZKJntGX98tTjt4RByj9zKA0LboNeUNCvps+WB6XFnk57xsDv?=
 =?us-ascii?Q?RDc3tjKvsqwdK9bxfUikmU//fN000Srnp5TOA3b+DoKNpIl2TVWnKsMm11Z6?=
 =?us-ascii?Q?/TlSQH/AWIvSOk78oAEy01otqKEbTP2y81NtldgV9p66D2s9GKTnkobDJYVF?=
 =?us-ascii?Q?vGdTQCLlYWM0xy7xamnZFVvoD88FJAJmnyvBzhydnssLBTk0pUxxzXmMY2v4?=
 =?us-ascii?Q?FC7XlyEFdfIbft5qcCFHhiVuRCeMzfv6r68SvIIc6BmsgNwHDU6naavyOawo?=
 =?us-ascii?Q?W/h1NYz+7vmVaX1g4dNOu77EGnmjjYPNtB4xRkWSKCC0c0lHh0ACUBjccMwM?=
 =?us-ascii?Q?Fl+uGYi3BmRaIah8tpNPTGa9Xdf+Nv6xotFb+O0DTyaxVUQ8OmteIcuf9t1x?=
 =?us-ascii?Q?EwW5ne2pGn4HUoJtpn1QC0VGDAMkF46igRqkbCag4XlWDhuZwPUyLZUcwHrL?=
 =?us-ascii?Q?D7z3I5Wu3D9KNf6G7ZB8jN+9+rPiZ4PqVXy4VPmt4CUIFWaWbJ9IM6VlV+Un?=
 =?us-ascii?Q?S5zLI5+LNYjf39DvLcHw8R0bzsjgWwmHfrEvOkqLxoZzAAdItQFC1C/Vi8eZ?=
 =?us-ascii?Q?Bcz3GnS03YMQpCZj5PwItu5PLdyn08Lf8yTEGnLeGSagO9BJWMMzGyxwP3SY?=
 =?us-ascii?Q?wzTMuG/uz70DiUZtk6RIeUmU6C5Fod8P+CxY5MedwzcADN19wlUhJZlXVw/u?=
 =?us-ascii?Q?1zB5JFtZWSi202PXVitMn0aaHlvv4WhBVgMiK7mx1dw0O+ulzB3PDBta3txg?=
 =?us-ascii?Q?yncKhpz8BkyADMeu4EfyPwFA3Zol+YZ8YhJU5HoXVPfo4OH+nF9t0KHbD/73?=
 =?us-ascii?Q?frx3D/JGfs5bVc8ileFFT/TVgv3P5ErXwvMBj87hNdGYKRIjtvY5zz0KSsf7?=
 =?us-ascii?Q?WhnG8CfArU2YyJ4hnJ/LZe3eYDOfm8knegGNuVbwJVhK1h1JvQRuL+/FcK/g?=
 =?us-ascii?Q?O2bv7JeYYehfhGD4zcht9i0Ky9ebqIgYfpE8MvTucI04iLsHRbBqFeOIToo9?=
 =?us-ascii?Q?VsXmMlGREsXB88tQukNwKc0lk19wjVsiPeSOGJ0gWN5oMg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR01MB8293.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?XJe5d8x5upyvT+IsXHwtarNNfEY+yYMNWsqWTmJRxqJxGkHq09nbB89/mkjS?=
 =?us-ascii?Q?GzcXwnhKpoK//OZjbZ2FnT8tzsYR6xtmhvlzecETVNbdRL3KBi5EX65/C/Xn?=
 =?us-ascii?Q?fpuJeC1xLfS6mu58jc7G7Ng1qJcI6CRN6dyz2mLCJDQ84aBIdDLaFmpx9wQr?=
 =?us-ascii?Q?OH+aIfp1QE/7R9cphNIn94FhGPUmsLtJLZHg183gL69jfzlBcCR51QkQId5+?=
 =?us-ascii?Q?1+CsYRLM7CGelwMVkoI+6SQN5Ef/8DOfDtoZM/vZORNIrCUw/S1r8ML6djzO?=
 =?us-ascii?Q?SOV5X7SLdbNcFSahmKSm0FnnxcXC6GENy+bbKmgJ0yimewjVHPGX14iAXJzL?=
 =?us-ascii?Q?ThXtFE7q22fbwBqEhkvr018WgIul+6unDw1nflqVfUpLCltZZTHjzYcJwe1x?=
 =?us-ascii?Q?1e7l/3xPj1wgk1bvq1DuseIHZf5lo/UkA87CUm+BdGCu3+yqKFeh6OigEbr/?=
 =?us-ascii?Q?OHrLxmkwF+PsA4SLOVbisy0EQkk6TXu6JvBsyA/VBvmqGT207riXGrVdFd/U?=
 =?us-ascii?Q?QP8c023nF/K/H7wzQU6fMTSIAkd67sGBNaM4QJk9sQTx+240q6mtU90Vh4+1?=
 =?us-ascii?Q?79atSvtEeaorCcGILL65NACzAna2s+N6WBaS22MSP91WrThuT+1f4AQS1nr1?=
 =?us-ascii?Q?RhDH/VrIDmgnowtdWjiDp4ZZnmQRHIHiGSCHhbrTz20pMNbhkc1m82DfZRI3?=
 =?us-ascii?Q?JFjGOiFHCJc0VwSYavojqrCTwdAb9TWdgc7TjAfgKxzxGT+8wpp0qbkBQHAB?=
 =?us-ascii?Q?4FommFa7P96Kq+tuQPJ4DT5Gearr2IThGzOD4cuyYHM3TfxjFXa0C1WN+Ngx?=
 =?us-ascii?Q?pDkYLQ7QSnIGvljWFpL4CXKUMw2EE/aG5aznCh6VQSI9iv4Wx2nG2smR2ifk?=
 =?us-ascii?Q?wgz4Hb6I683OQYu3QHzp4Wy9z19UkNciSCFUrr9f5ul1VsFPuER2t4k1WXFE?=
 =?us-ascii?Q?EIjAYzVzMbq+Gq59NdvfWESnhxJyl2xX2ZpnM/wc1gqkABUBsZGzoHFahvVW?=
 =?us-ascii?Q?ti/qvbKbb7JoCaITJImCTgZkXx4ohwRh7kq35rV0rGgufQ/qikBi6qfkSa1o?=
 =?us-ascii?Q?XjXnyQFsPif37QhmsXlCJjZOiWlaKhOWtiPLm0nVdb4QvurlTOm0thxE73SA?=
 =?us-ascii?Q?D1qIhJ11gZvjjxdphWzDCMXi1gc64oNybnUdIFjYI32jbvMVYaydOs+TjAYV?=
 =?us-ascii?Q?6TgWuw4/4+lqS44J8jUGBNUodCKZVwKCk1ueNnW+vw4/ospUEf6BYw4lTgqa?=
 =?us-ascii?Q?8K7tBN7zt6RdL1j9dmaBUEKusIRdtx4bz+npbBySWRAmOlbDR1xqzl6Ii2m7?=
 =?us-ascii?Q?SalsaGR+v3DX8S0ecV/eaHCKbPST1j0oSWZS8OmEtbjO+hDOEMStfmTGLKmL?=
 =?us-ascii?Q?yA6q/3DIN1WY8fD//GTtDuckQmA1qPOJfQ0Ph8Uj6N0EkkN96WPJQYuUArtS?=
 =?us-ascii?Q?vm/NDplcHYOG/YioglIwLjfX06BtSN2BrkAiBPeSEAK24Tz53JZHIdOJsbq0?=
 =?us-ascii?Q?iCuQ4uj8h0VJ9wtCDAefazbgKdglnSQCkr3IUVZQJONI30o7ZIV2awTpTWb7?=
 =?us-ascii?Q?7XKE0BmYeRCUp8Bjr6pu8/YL+ktoFtA/TeJv4Ir07HmvplhFOk6tbzXLe3kH?=
 =?us-ascii?Q?+A=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 25304874-0e14-4777-fb7d-08dd0f013b2f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8293.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2024 16:33:32.7124
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bKUZCRQoUJrSHvtxty0OcRUIveEeGh9eNIBEQJxVncoK3Xu6Y6THnCkhtcuQgrAMKFxcp04lUt8lPlHoOf6gg1GIR3bMS2+0cdfMTJnwyFg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR01MB9223
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 16:33:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207936

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

We have a system with 96 CPUs and 128 are not uncommon. The border of 64
limits the number of parallel tasks make or ninja spawns, because the value
goes into `PARALLEL_MAKE ?=3D "-j ${@oe.utils.cpu_count()}"`. If only a sin=
gle
recipe gets build (e.g. rust, due to dependencies) this leaves one third of
our CPUs idle.

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 meta/lib/oe/utils.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index c9c7a47041..354237b643 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -251,7 +251,7 @@ def trim_version(version, num_parts=3D2):
     trimmed =3D ".".join(parts[:num_parts])
     return trimmed
=20
-def cpu_count(at_least=3D1, at_most=3D64):
+def cpu_count(at_least=3D1, at_most=3D192):
     cpus =3D len(os.sched_getaffinity(0))
     return max(min(cpus, at_most), at_least)
=20
--=20
2.45.2


