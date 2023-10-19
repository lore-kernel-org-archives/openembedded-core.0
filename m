Return-Path: <eero.aaltonen@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A505CDB483
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 11:12:50 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.54])
 by mx.groups.io with SMTP id smtpd.web10.25019.1697713967999050969
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Oct 2023 04:12:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=IjVvGPJE;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 40.107.21.54, mailfrom: eero.aaltonen@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Orf0D662Lf0Fduq66o2L3I8VWxzm7MyjB7Fc1pK/fU8w3sYYMbN8KAX6smycXjv896nFFScNsfPDg3MKV9UuU7tBj/ULKvjxotk1t9wUoQRyUMw5FI3Q9NTmJptIiRKQ4w+76rDAGQXbfimsuwfT2lPzntr/7eqfoTXs2agwhLrWEvCeF+h3pkNXgBPuBm+CdE1YZFum70x9g+sWdAFiWiQkLBshYSKCZWDB5z2y7qpQuxswSN8n8wBjZ3I1M25d/a2uiuUKSbZtHCbrd+EoylufWmgxY/64Yw6jViGcRQdb+FrCLjMobwBVoHESTIcfm1m0EJM+vZffscqP11rdrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ieX3XEf5+mVrSkABm2gSP/HmWQuf+7bWZHDjKlGElg=;
 b=QnGxXpv3CLVMM5C9hDrozQi8JoWBSg4OTnkJoOo0CJwiybnv3P2H/LBlikicuIqBClTcPO8ec1DZhgfii407HvM9M2cxjAVxz/8JHSgC9JevmnK6RivvA4KtxAEgvT88DBVaLI+AXIhhBD1evOUvYWjpZBGm7JexPqxbnbGuVSbGnZ/vPdRrAtnTH3EFL/pGrbYrknUITYQ/nDPRd4ENEym1Kb1yDxGZS9qSfjsjgow9wDL1ITIGqFsW80pEplWLY+MlVNmB53oadqQlNri3+Kq19P9Oa6DJCvccP5IcZksHo/n1X/wuUO8NBnZWPBZl3p5Yjsc8/ZoZfewvaMSPdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ieX3XEf5+mVrSkABm2gSP/HmWQuf+7bWZHDjKlGElg=;
 b=IjVvGPJE3iVme7iwFLYhpzdYZD6wZITDOlejhvFaYn34/R4WiBSeazg85tDJH0fm/eqYQ6dDJLc7SHzs8qOiDinOssRn49C5GDvOx6t/MFENdoRN5LgNv5k3DyVLxCFMKruByOjjRfDJsJ9yR79rFKYt83Xx9JTIoMJRhctegRrjrCoh7snXd3JYvy9VuByhDg+qsr0JPkzhwFWfG6mPIGBHEbKeuz0LkO/D4T3EXKoKCQZl/ptqvoCb0HTu3LjAV793ZjYZQp3QgDtqIViao2cSWZCGhdSzA/3I0ZIT7sXlrhqhWxxST975ZNIN+rYVIPMSxrYT1maZn0WUMOEEig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS1PR06MB8515.eurprd06.prod.outlook.com (2603:10a6:20b:4dd::22)
 by PR3PR06MB6636.eurprd06.prod.outlook.com (2603:10a6:102:69::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.21; Thu, 19 Oct
 2023 11:12:44 +0000
Received: from AS1PR06MB8515.eurprd06.prod.outlook.com
 ([fe80::e32:a91b:d0c6:e877]) by AS1PR06MB8515.eurprd06.prod.outlook.com
 ([fe80::e32:a91b:d0c6:e877%7]) with mapi id 15.20.6907.022; Thu, 19 Oct 2023
 11:12:44 +0000
From: eero.aaltonen@vaisala.com
To: openembedded-core@lists.openembedded.org
CC: Eero Aaltonen <eero.aaltonen@vaisala.com>
Subject: [OE-core][PATCH 0/2] DNS resolution using systemd-resolved
Date: Thu, 19 Oct 2023 14:11:50 +0300
Message-ID: <20231019111152.23880-1-eero.aaltonen@vaisala.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0091.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:8::25) To AS1PR06MB8515.eurprd06.prod.outlook.com
 (2603:10a6:20b:4dd::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS1PR06MB8515:EE_|PR3PR06MB6636:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fe3208f-8ea5-4a55-30c4-08dbd0945196
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/AwpEIwU94f3rGRmZ/K3IccRNa9MLHbC4OfUBnJsufzP4ykSAu4fLcSKZ75naqi8ChdKh87sNIFAN0HIPNuA242BSeaHF7U61Lp4j+/V4vb7hdaHJvJsero5j9D+Efk+zH/2PVmanMp1cdUZRIjxDwg2UDptC1pMM4JgX6W0h6nGE7eK9vjxd3XmGOEhZ0BnvkOHtn+e0b4dkeL6hVl6JaP3chDKrbWC0JvOofBnCBnNQ3Z3pAkX0Sr0VbNCw5gQhgL7DPTR3r9meXstG+L82rp3CXbFkbHz3oFd96E+narnXMKIOMzJN7MyMOHHwD/zjLwr5zQAWxFrESwKmHh1UyDPRkL4CS2geNfYrkXuy1tP8Rjpi0wNe+fdUbNabqp97Sj4FBb9fZrVm/xVjst6nA67Gp3p2Tvcs8t0PF/6s51497/bFFo5algZLljv2YUP6ecwHflPKd2ipbFcq45ctQh9ebx199nUCx5qq6RaSf4zUDUpsn0U35eOywMcbKOuLubuxhS/OELsvd5e8ENqMk2YmGOx2HPshre69v07mGwvZr5jmznXhvOJRmhAh/JZUuP6My8q4fXoHOOUxEAPvk4KCJyvHh0P4oACHMp7z5kuWgIDW0QoxeAU3moO3wo1
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR06MB8515.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(136003)(346002)(376002)(396003)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(66556008)(66476007)(6916009)(66946007)(316002)(6486002)(6666004)(2906002)(478600001)(36756003)(4744005)(8936002)(86362001)(5660300002)(4326008)(8676002)(41300700001)(1076003)(83380400001)(38100700002)(107886003)(2616005)(26005)(52116002)(6506007)(9686003)(38350700005)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?430usdqHBDP67NJvpzMVp0azGkhXH5oBmE6fn1RmitFWQGLVcTW60nRoweXc?=
 =?us-ascii?Q?uTh9z55fHhEmdLEAIafANHB4nQ3BB58hOaTwjh6jjUg72HrY+E9rGFzXEXbl?=
 =?us-ascii?Q?cbXzEi6RNz9vuHQsxEXBsWPk1xUHiyKWQaYBv1sCaNABs6lWwDAbWluSC8y7?=
 =?us-ascii?Q?Dly5vDPs5Uz+9oA8UHh4jeMYGUgnY/ah8obSuRA14L1CdFbfx9+s71kxACqo?=
 =?us-ascii?Q?WqTuxrR8PkW/k/lEGUk1SGm5CU3t3HkH5Yv7azDumVzVyiFI35AT2EYLYGQ9?=
 =?us-ascii?Q?WwbxQJ/yB//1VlN/kZMdw5taL8LOshN2SRFuUmD1ltwcutu9u90wg4CGeJqs?=
 =?us-ascii?Q?Jy9N1CRwJAtT7O/TUjJX3Ml9hR8yH3Ukh03uPO3KmOLeBmyyCALISLJkPt0e?=
 =?us-ascii?Q?N6A8eYplviC1zHndb09S97RNEasEHLU26n5F9uNq2n7ZH2gKWjaAFcQxEygU?=
 =?us-ascii?Q?kcD2t/KOeIZ0dwK8wSa4LcXzAvp903C0OI+Jhky/UbkHbTIXbbkiqNPCZOQx?=
 =?us-ascii?Q?RLhkMjsI7BvQRtwLi4fRyQhVsQIZyX7vAQjd7zCXR/Luf1e6E181USJmRoRF?=
 =?us-ascii?Q?g3nYBfnNdOnYA6Kg7fac/Ftmd+1iYKuBk5xHLxAnrhj2XhOWIsz9h/YL922f?=
 =?us-ascii?Q?IJatGqaBqYPIUauA0oYJ4fJXfbUj1Bb85ubBi8uRbklfOix1iAr1RVKEnHXY?=
 =?us-ascii?Q?yi/x4T13pixY0Bdq+PBHZoI5AsTVgLRHcaZK1nwi9/NKWTakOBKdcQYD79Qy?=
 =?us-ascii?Q?oIMUZwbOp+8Q9238pE+O9sOejOV1Sq8aEZUL0AE3mi/UUV+B0cbUfFyAEjGx?=
 =?us-ascii?Q?pJ+Cd391m7DBteR2HHhsOTsHaWGc5QvF0yWt1oQYdp15ODPk367rNLNSI9aD?=
 =?us-ascii?Q?wg1BG1rtv0CbUzW1+E8ggVpRNGhSjXKZu0R5mddTbtGCJIQjdgwHX6wP6c9X?=
 =?us-ascii?Q?jBWXED2evqcSl3xkNmdp2nc7g49mPj8jt560kDMOwAwpWRSjL+uhGID1XD3T?=
 =?us-ascii?Q?vSJOkhQgE++xi7UDPVLmXtYwRtMdUrUC/P2xy7ZuTb0PI3/zYEp1nRaJvdXy?=
 =?us-ascii?Q?DmaDYGoIBs1y1wFNmHqdvQQbTAMpqQuySY1/3CK/ayiurgKNYoXfCIqpGstg?=
 =?us-ascii?Q?rVGMFN4tV3tM/LIeEeIlFlEMTsnc1QdSYJBmYaUs4ASGHY5YJgrzh69OBCys?=
 =?us-ascii?Q?Zx05h2UYtYDcFl1j5Rf8s7umUWvFZVMK9tv8XqVYA9kMyzUf01L11/h2VUXy?=
 =?us-ascii?Q?SHzDCXY6c32xFgy1yd5JDVqkkxiqaaEI28WWuaKWfzP8sdTwR1Q/PjXMZtNT?=
 =?us-ascii?Q?9LuclIgFK30AbDfVZOM/0ge6cpkNbMD786DI1WhJsjWk3zICWJz2JNbVeOT/?=
 =?us-ascii?Q?UHpOzsGjm2Tqjft4exANQ1GePp4cChMZFev+fAbDXYPYEFdFxpLdV53APBRe?=
 =?us-ascii?Q?EPGdHhzAF34Id7jtKVLz1VfYCWP6ntq+sOJ6hsl/V7VgtS0ITfSj3C/trODT?=
 =?us-ascii?Q?3lghLr6menHya12+Wr6+ftr6LJ72EPK8ibDvOdearCbBKb56KboGHrE06cDp?=
 =?us-ascii?Q?l3j/ZZiTjcVwUYPIkmIww7VtncgbfyBfp3a6VDE4NMyXWGgYGpsVQksW/2qU?=
 =?us-ascii?Q?4A=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fe3208f-8ea5-4a55-30c4-08dbd0945196
X-MS-Exchange-CrossTenant-AuthSource: AS1PR06MB8515.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 11:12:44.7245
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RbSYWzfOPMwVekEIAdFcBJlL31Lychfmxk+RpprATdfIVvDDJTr9GTpeQMPixvm3kxQ6W0egAV9SDBjXnxLMImCLvdxUCohv8RUPIyXBj6c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR06MB6636
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Oct 2023 11:12:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189444

From: Eero Aaltonen <eero.aaltonen@vaisala.com>

Enable DNS resolution features from systemd-resolved, such as Multicast DNS=
 for distros using systemd.

The first commit enables systemd-resolved via glibc nsswitch.conf, which is=
 one of the interfaces recommended by systemd upstream.
The second commit enables mDNS resolution for executables that do not use n=
sswitch, notably including busybox.

Eero Aaltonen (2):
  base-files, systemd: add nss-resolve plugin
  systemd: add option to use stub-resolv.conf

 .../0001-add-nss-resolve-to-nsswitch.patch    | 31 +++++++++++++++++++
 .../base-files/base-files_3.0.14.bb           |  2 ++
 meta/recipes-core/systemd/systemd_254.bb      | 10 ++++--
 3 files changed, 41 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/base-files/base-files/0001-add-nss-re=
solve-to-nsswitch.patch

--=20
2.25.1


