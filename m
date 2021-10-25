Return-Path: <randy.li@synaptics.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 316A7C433F5
	for <webhook@archiver.kernel.org>; Mon, 25 Oct 2021 03:38:19 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.46])
 by mx.groups.io with SMTP id smtpd.web09.27532.1635133097896671238
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Oct 2021 20:38:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@synaptics.onmicrosoft.com
 header.s=selector2-synaptics-onmicrosoft-com header.b=mEPFyExF;
 spf=pass (domain: synaptics.com, ip: 40.107.236.46,
 mailfrom: randy.li@synaptics.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bgFLRx+m3oaTU988cOe0FAgswpTl2xRLz1ZGwr//aZf4xyWItfGxCxqYxHIWAGHy0x6fr5DKvaLmF4NRaiLBRFGO8AevStkWOlh+CmAqsxzvDDJMW2nSk75fcEnPxka0KLo2PqMKah+4pj96davOQkQE2Ly89Fyz4euAvY+1BBOuFRWit5YXb2So8Uwr4ZlRoqCpCwU4HjoLtkfLRa+T1uRVKye7sWwTOsEaaCAEtR8yqYJMhEw1TGxUH70ZiOQTz5iJlrZw0qoKoMaFZkWnaAxXl8ufFDkkFrAVMuaU41fQHPMaVixqIfwFiUumezuLwi0xTqKdGkVpf2P9MsPj+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N8ABKD0vjvu6dB1px9Sv8487vEfYC9SBJXMrVGGhh2U=;
 b=B/iGF5J62pA39kuZ/P6ljwFrrMHyvCERGQsUWu2Gly18Fc9xEM2w6kms96ZXr3P9sSPtQN8K2CatK25D1+N5sXVtYMQKsaO1x3agAxohhiZgwSxBqKLnnAc7IWxOaTXI8v+0eYj1yAdetc9yvYhtlfo6Vdw84raT5w6+0O2sGV5zjOoK0GKCk9DgmoLoW+E0h6PicuFJk67dqNO9FpPcO+XJdRwuzN7a6XE3GIOzQrkC/FC2llvlPMogEwN3lrNVBNXk7ClbSp2MK6M7USPcKJAnkYxaTJ8pKLehhgiTPASdaIDHkHLGPnOHYNNtJkDB9Mbwwd5WC2ptPoVU8gWNTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N8ABKD0vjvu6dB1px9Sv8487vEfYC9SBJXMrVGGhh2U=;
 b=mEPFyExFcfh6fvrDeKpAsvVwpeC+i9mT4XSSOVuJgyh8n8oJs9VP3jCCyZDO+x5xhoU7hL9C82wEea3mPuLsxMbDPykASqxSpUDnpSJKwRoPfivdZy4p9QlEcoHzNjYcG8z4JJchvnoUkDIunZ96X95/D0xttFuW4+nmDHizyo0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=synaptics.com;
Received: from DM6PR03MB5196.namprd03.prod.outlook.com (2603:10b6:5:24a::19)
 by DM6PR03MB4427.namprd03.prod.outlook.com (2603:10b6:5:10d::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.20; Mon, 25 Oct
 2021 03:38:15 +0000
Received: from DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::1994:3844:6596:1d13]) by DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::1994:3844:6596:1d13%8]) with mapi id 15.20.4628.020; Mon, 25 Oct 2021
 03:38:15 +0000
From: Hsia-Jun Li <randy.li@synaptics.com>
To: openembedded-core@lists.openembedded.org
CC: "Hsia-Jun(Randy) Li" <randy.li@synaptics.com>
Subject: [PATCH v2 0/2] fix environmemt files in SDK
Date: Mon, 25 Oct 2021 11:37:42 +0800
Message-ID: <20211025033744.753260-1-randy.li@synaptics.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0094.namprd03.prod.outlook.com
 (2603:10b6:a03:333::9) To DM6PR03MB5196.namprd03.prod.outlook.com
 (2603:10b6:5:24a::19)
MIME-Version: 1.0
Received: from randy-t14s.synaptics.com (192.147.44.15) by
 SJ0PR03CA0094.namprd03.prod.outlook.com (2603:10b6:a03:333::9) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18 via Frontend
 Transport; Mon, 25 Oct 2021 03:38:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7c657e3a-0cb8-4649-6633-08d99768e05a
X-MS-TrafficTypeDiagnostic: DM6PR03MB4427:
X-Microsoft-Antispam-PRVS: 
	<DM6PR03MB4427F8091BF28FFA7AAD48CA86839@DM6PR03MB4427.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZPooEhCcnWsFEkq06iLECkUnRDgbxMDwR2M0om35Hu3+HFRIdkBdRbE1w+b51R/fasL8xyZ4yLl7e57foaR4/PpX3AoB+L/X+c7WDTsSllrxEAg65vTK4A3r5VmAyFDhv4so39MPy7CA4+Py+mSl1zFrtVgTfe2GA+BcnrCDzaAEerhxmBvk3s9yRNXNMhPpWeDS6U7x03ZolDkgSayPBt1lM/7dEo6ZWDe0Kr+9CcCzOCid4WoV3m14gaMqS84b00d5xvtcY9JTAj7bLDX+ah1mhVvp2OBHxyd5LJDQHBNdGt5bI0y7jtsd1WRvuuj9OaI+T1RcHGgIwJmXbr0BXZidFOJOrxj6qZxpMNh4v3scbKU58YFfQS6/nZt/SOE9c+qYU64c3OQRlyp3YxOTuoQ4ZxVwHbXjcyHN/sPTJ81xhQhwxwbFhxDyT296Y9lL+dgemtt0D/G6vYpGc4BeflYDY9VEqYFEsSOq0zeF6BuEWuMeZ/X3Afq5WCmBLQhq7R8nMyqwWikwY1JhbiixhjvDX5WHpWn2qt1dZTX9ZyMHwX2dsI61+PPR5oEFKmMTs7vdwa7uWBtb/HRF/yoihVOQ1YioDvSRFU6NqQ8VxLlhJgjej6lEMAzQPRRQZzz3y+RQDXjJEKSqMnot6f4cNScaML3JSLmX+JodyaSBfa6uxexgqrJgQiaPrItr8Y7CbHmY5TSUXJuZaSVs4aISxw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5196.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38100700002)(38350700002)(52116002)(8676002)(956004)(107886003)(8936002)(7696005)(36756003)(6486002)(316002)(2616005)(186003)(26005)(1076003)(4326008)(5660300002)(83380400001)(4744005)(6916009)(6666004)(66476007)(66946007)(2906002)(66556008)(508600001)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?D+21nvBp+VMJlueKlAZsahDvgPktBf71nMrcpriJKCV1Fp1UMTn5DUzBzbWd?=
 =?us-ascii?Q?Aeb2T/15icewHQk6nW6tifgnsBaug7s9v0e3sOz38D8uKJixOizoRxTmOwOy?=
 =?us-ascii?Q?LiR6v/lG6ABkbhr/FHCThRlUGeY5wtS5gTzO/Yg6eyr7W1zR538MVQ4F0V3s?=
 =?us-ascii?Q?1IzL5xOo/a3NGHkvBsxGkLKs+Ugp4O+fw+b+mVetTkK5WqUM8fFg/Nj3ReVh?=
 =?us-ascii?Q?I4dfpvmKnSXeSd90HDvVM0JaraBKQUb7huf6rG92G/VAryA8i9YcPoRIn2y1?=
 =?us-ascii?Q?OeC65MSyRKN92tQXBJF38Fxuki0+7m8wRA2M8E464kqqjvwB1qaXjomavsyg?=
 =?us-ascii?Q?saZz4L+6Ljs78PxxEyam+WC3xv9XeBwxxQMovs0kLnbykEiffsEy+Wlzi4a5?=
 =?us-ascii?Q?aq/wWgXJ56WUuHvu43HxoPpkF8M/Vcavox4nqQEgYbMFIAia2v6E3FAgxxjv?=
 =?us-ascii?Q?b7AiCFt+So6ucZ3koEu8Dh4XJmTa7sVvBJsF7XhInWWN+BaVISJSAsZYvUhF?=
 =?us-ascii?Q?lZuA3DeQ2WdYMPUVhF2DHbKHEL0jnaA0lYASnn8JIzjy/8vL8dpQv47Ey9GA?=
 =?us-ascii?Q?2+zAd8lvlLJqcTNCUcPG+8plLNE3iOqgwNwIa0EdNUyKtztOxUNSK2vCUEse?=
 =?us-ascii?Q?E67s1uWLJZkSpiy83JeV2bBnbS0cUe4vaFHhvQJBvoIjUxFgfv5mPqoDe+UK?=
 =?us-ascii?Q?fCFNtMd49oGoC0cYiXnHh2Wk/3SA7GZ6zxFLC7WjV3c2kXrmeMvTSZnobmw7?=
 =?us-ascii?Q?kiblJiLTXJZMOXcU1ivuRpbZIPQEPOJtauiepDtyVn71iQMp82wk0zDGLvgN?=
 =?us-ascii?Q?8QqgDYCsoy4Bx8SMeBrlebGxY42ZmnIZVMMowwKkzgIco+gBTrz0qtLMFdxz?=
 =?us-ascii?Q?AhWPgc4smaUynsO+SDiS4DXbgWsIYmK3UJ8lj3ewgPJ/kN2FdBUlGYEHdIJs?=
 =?us-ascii?Q?sTVQI8kaYcEYLP2yHrk3m8payTvsz/GL4h2mQSZZlHDMEoKRxqGY4bNrNhWW?=
 =?us-ascii?Q?xn2rYjpGCzwEBxTbuk+pcglz6xnjBBQg2yp2HfJD5dBs7S/p8wQQFqUn6j+n?=
 =?us-ascii?Q?YWyLzPAlnu+jaRrDXz1rgwyAqKYaJczjFluxF4l4RHT9+Q8qJg/T3W8lhOqJ?=
 =?us-ascii?Q?qWSCuPLnAGPBYaJUMy/HgJiCnAJGxiz2NgUtWqng6xmIXvkcLWpavTtRERUS?=
 =?us-ascii?Q?q8b3HOlYngKZUgpWL2BNqWQvCHvhfovVbTpIpcG8zr4lV7sqJav602gg10sE?=
 =?us-ascii?Q?Z/QUw4mthdyxg+/1PopvKWLuMTQ7K4F739uA8rUYzWHovGSgQZfgpuBEyq7f?=
 =?us-ascii?Q?kKx2vEQUCgS2/pwPOfapqikkgHKNHAmBhr9Z/etqX34QBJdZXtAbhoztQdDZ?=
 =?us-ascii?Q?HQorRHB6Zb0XzjR/W4heWCbBpSUjgZ4Zth6iCSKDYr3WsIP+XtLM572fubPP?=
 =?us-ascii?Q?lZixRlpYjpk4KzN2VsZQM3U11BYn0c9tj5nqZsfNk6qdu1OXoqko0keEwcPJ?=
 =?us-ascii?Q?5lCQou+HXAYxL/I8K6/ztPRGHv+G9TDUdDcVmAVoRPcaWoojMEZfB2s9Xawo?=
 =?us-ascii?Q?Pw74CZSO51ojIa0mJkmUuHSFIgwtgIv9ZxPaSpfx63fSEOC8HYYm8aPBPoS6?=
 =?us-ascii?Q?URbFeRHPM6SA3eMzLttBLfA=3D?=
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7c657e3a-0cb8-4649-6633-08d99768e05a
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5196.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2021 03:38:14.9106
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Ggsx0MkigaD4u7B5r8VT6dU5bbOMIbpNdG48MmCpGXILwyoGY31Ng1e8xmNlNX0zih6H6/BAcwvCOjT+mgRsuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4427
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Oct 2021 03:38:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157329

From: "Hsia-Jun(Randy) Li" <randy.li@synaptics.com>

I am sorry I am very busy recently, so I don't have time
to add an QA test class this time. Thoses patches were
verified two days from mail last time, I just don't have
time to send them.

Changelog:
v2
The script generates native file in nativesdk should work now.

Hsia-Jun(Randy) Li (1):
  meson: install native file in sdk

Randy Li (1):
  meson: move lang args to the right section

 meta/recipes-devtools/meson/meson/meson-setup.py   |  8 ++++
 meta/recipes-devtools/meson/meson/meson-wrapper    |  1 +
 .../meson/nativesdk-meson_0.59.2.bb                | 52 ++++++++++++++++++=
+++-
 3 files changed, 59 insertions(+), 2 deletions(-)

--=20
2.7.4


