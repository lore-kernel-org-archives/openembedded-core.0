Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8513EC6FD19
	for <webhook@archiver.kernel.org>; Mon, 13 Mar 2023 01:57:41 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.10658.1678672654980807001
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Mar 2023 18:57:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2436e46f61=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32D1vYiR013449
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 01:57:34 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2043.outbound.protection.outlook.com [104.47.57.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3p8gma1c1y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 01:57:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h8w3PmKa5qleg8mV1pv8g+XuSZSrY2j+at3erF7kBIb2UbtybNtP4c2urBXIjnmDxAyMwbkbunAtFYcD/fsrm6BQEJdoga8yEllX5drBiBzwOOqIgH+DunHX5ks7OXg1XqdzgST2Qb6AJYbBXh7ByHMclWjxmtHE8krQujyfGp6T7oSwTxdfHyDAVap1Zjv7W8uxCwOCfhu8uzOfem6rX6mW8MF2cDir1CrOmxc6UdQtBbTBWCA1gvV9eyKpNdSsaAHVb4Ato+rPmym+IhgO1JRS4CT8Z5pAoSqWoVZO/2LDOzfyUn/1TgJscb4+M8mrct4b1duDi9NzdkM6sWAQTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mYNhHfqFQzsinEjYpNPWRNlFA7aIy0HQGvG5e8VU30A=;
 b=n2bfr+HaZCxfgOUniF8f+GHffd0nzzMkV5mY+SHeP9KVTT1vN/KvQK5mUyzAQBEpHeX2/LL/XblThEIRP/boehJgIwAB5j5t11SXd7+KsrsYcxfTVnf4U+1oXxJBMxzM3Qr3I7NVLuKOh0klawLWVXiKNvz7dDKz0z2ucZwVgtYfZO+wVJ54D8ZVjZDqaCasaU/DdAFNpIPXFlYo5cDDubq8dG4SK8yCOb99iaDdc4v5ZW23+KOIG/gTIlYlJM4nQnqD6QRyzsKxl80qKstjRd9ybu82AtUw2KktMPziFo061ZAOht1aL2nbXFGirXkaQB0tbmRukdqHKJ+InFtYtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by BN9PR11MB5467.namprd11.prod.outlook.com (2603:10b6:408:100::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 01:57:32 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::f952:3d02:d71:cc68]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::f952:3d02:d71:cc68%4]) with mapi id 15.20.6178.019; Mon, 13 Mar 2023
 01:57:32 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] sudo: update 1.9.12p2 -> 1.9.13p3
Date: Mon, 13 Mar 2023 09:57:14 +0800
Message-Id: <20230313015714.2470466-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYAPR03CA0021.apcprd03.prod.outlook.com
 (2603:1096:404:14::33) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|BN9PR11MB5467:EE_
X-MS-Office365-Filtering-Correlation-Id: b56b5d9b-d761-4ca6-e4f4-08db23664ec6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	RTTJWd+eDVbkDGoBVD4tMu1Md+02HGfD46alsWH2Zh4rk/bBhsstnkCKeBP2TwlLnfUmS8jxRfd4sZJ7+68AGkTmIuM50g1IB66nxHIwvAQr6DsUvdDXGT++jHLncJSi1J5b+KhB/4ACBc1s53f+IK4HcnmjC4pGpWRvlKwlKgTGeCYk7r8ydUmJAIoH2X3jb8C9j60vfkl7r60Ht4XIcBhG1jM520L6OA722Tvb417vaVB+uQwblHi6nQIEQ0sgIIjd5eaYFsuH4m1k8G9y020m4aGrrevifJyRBscvT2cteXiP4F2PAt7ynXq8ExBAXdqXeAY2AWCcRGB8ObKjG+O0jAHZDISVOK35tGxPBAYkgCKHxZ4Ny2DP5Lu+qg4Khqpe3QhgYd2LYNL6GsYBefs0U6QVSr3w7mr03eC339K3opy67AzNNlvax31Il4/3fTgWy6sRc0llch6iGSGYRRI0nSJ6P14xfKUSP9Ghs2j7/Wc6vTrtfyTTFsMwiKFpufUEnPEdRPLeZ1ZZnvjIx49Ev6mlH0sjeIoXt+rdBloZ3kdhRHVPszvHqwPFZvTkVvBvDejF6FYz2F1wWk6i6VWksvg8IVbry7cW9SY02mc2Q+UEsWMLvLGgdENsfGABIDHp3Fq/nnJAK+TyAUpehn2Re9igc8IHqeu0HovsauKnkDj6IeFyUSRY7m/0Whgr
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(136003)(366004)(396003)(346002)(39850400004)(451199018)(5660300002)(8936002)(6916009)(2616005)(41300700001)(186003)(6512007)(6506007)(26005)(1076003)(44832011)(83380400001)(2906002)(66946007)(6666004)(66556008)(66476007)(8676002)(6486002)(52116002)(316002)(478600001)(83170400001)(38100700002)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?eNRM1ovCkqeBGUUTW9WC6jjHcKMDfUKKdalZp8Q45m3JD04FGWoG9l8v+pRZ?=
 =?us-ascii?Q?8OYltWE/WlwwWBXNSpIEJmy5v+e5qYUwYS1zmFv4+YSKCEt5h/VEZEZZZOZK?=
 =?us-ascii?Q?sDXDHzRUwDn2mVtJQhD84vekMqvsu7CayDloIl+uj1JjeMYAwGltt3N7LgSw?=
 =?us-ascii?Q?djm/rvfjtqnMNQjGZIprbuQWQ3iG/bX/e2KuGMhNgW53yCAd0h+TyHUh6J/8?=
 =?us-ascii?Q?vQ/zffTQTyQrIwl70ciFrp0UQ8wRqzHVWIwxzBIFnQmsT1P1Kv5LnYoQaht+?=
 =?us-ascii?Q?1/niNtddZEdZOGlU+bOweTdrYeSJ5zXx6ahiwgsDixHzSKK3JckiLFXE5wEX?=
 =?us-ascii?Q?dc8+Cw/3KTpfjZLhmoZEBSsyKiI4YAdxtQBqwNQw8NVhbYqz1w0Gqageq/GW?=
 =?us-ascii?Q?S/LDhtl02/Qd7DozPhuN+HTVDV4CcJLoF4ilRyK/RJpiiQWbxAzFGQEyQ8xR?=
 =?us-ascii?Q?o52u0PsD6K3EUSCaxngUWUSEB4mIRXhKtiRoDZpgGy3GzgvCweEwK844Yb73?=
 =?us-ascii?Q?LcIdFyKetwreYiH3cBizu4NIBv4CaN6mIwIs9UZ3AG/6Bq6yAEAHfn5hk66B?=
 =?us-ascii?Q?t+GYBqiIg/CasMViSWCtaatIDS6WdSVKzzptndYebW1C8s0TX+81kWXEHCW+?=
 =?us-ascii?Q?ZII22dZaiuX4ydfJFM8MurNhcDpEToNIl+7bv8ZdHyKm1YBvbilbGMMcJdqW?=
 =?us-ascii?Q?oT4FDiA29GAWd8x2xReuqyMszC7Zugd0d9L5vZUof04t6eqYq55T0EpbMeax?=
 =?us-ascii?Q?iJaOfTe1vFOSBudu3rrZCt4bu8L0GuNBxw/RsYbt9Qip29EEc7lWhdN1dHlw?=
 =?us-ascii?Q?KALXjVlFqCONYf593SuByy2ZckoPN3bVxOEqY4oHRG2BLyRLX9UB9FMdpMfY?=
 =?us-ascii?Q?5lNjO8lsJCz5Wgo1ByvRA5VOxpJAq/Sre+96HFmeH4ar6tDZhVreuxGi89Tp?=
 =?us-ascii?Q?47Oq364MxO7lVFCjbvEc4QsvhceWakSj10xTNr/c7DroGQap7VaCtNMPaD1K?=
 =?us-ascii?Q?ylgBsNUXYRquDkTM2iy45H+f4CZpOAb2bEsFIXL/6Z5OQ8MVPBUrov7HWZJ3?=
 =?us-ascii?Q?WBfUX9z5itx9pw2fi9ALAPREe7b+hj0t0EGGSdHGI9rZD/b72NJ2p4nUIt+v?=
 =?us-ascii?Q?7jsW8TWFSpKeoPn7b9m8oSDXUjJ1DPncC45k3WzYLCrYNbw9ugL/l11hjsd4?=
 =?us-ascii?Q?lNKUYWA2SV1kDI4Lp1dNgSwmqtrRHJAi3QvLvbAvw1W9AWT/XB+CbU/nZ2Gc?=
 =?us-ascii?Q?JUDV2YWe8VmdqdPdFP+b5LLHkqQfTpfP73ZD2NEBrurUZ1Lq23yYoLx1TXLH?=
 =?us-ascii?Q?0OZtptwnWw5wLkndBnU/3uzUIxg8Je7DKbrYCN2ViIKxnWyOy1UcAqjJr+E9?=
 =?us-ascii?Q?TEI6xu7wA/LuRmOLVv22Th5+hCEzNBiQnCTPBI3IpjdhqLlHFTFOcHrbHFEG?=
 =?us-ascii?Q?8vlmyEp7O6BDYrNDRD2KNJo92eAjdHhFBZyQz8N5/5G95I6jDyzmnWEZvUYV?=
 =?us-ascii?Q?IqzK2xCMY7TJp6CdtBHevACTab+IvoTEQWnghNEOd7o8z806QWfeahqMhkv5?=
 =?us-ascii?Q?AUBSD/aYswA7fJ5+yDLYBsUnFzIIg8bWuN/iPcJqWRDCczDnjX/fN4fDI287?=
 =?us-ascii?Q?Pg=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b56b5d9b-d761-4ca6-e4f4-08db23664ec6
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2023 01:57:32.0226
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: waDjWo3nISsaPGPkBRLXaMV7ioCAUGajdPiF/0vhXz3V2EE/BEAP1/9Fp5BjaEFZ0tGBMushXu5D2/94uBy/l83nUOCQo8pHUZApx8GF3wI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5467
X-Proofpoint-GUID: C7P1FJE057v4GKOliPK_eDidSPDlgqOC
X-Proofpoint-ORIG-GUID: C7P1FJE057v4GKOliPK_eDidSPDlgqOC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-12_10,2023-03-10_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 bulkscore=0 mlxscore=0 priorityscore=1501 impostorscore=0 mlxlogscore=912
 lowpriorityscore=0 adultscore=0 spamscore=0 clxscore=1011 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303130014
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 01:57:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178406

From: Xiangyu Chen <xiangyu.chen@windriver.com>

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 .../sudo/{sudo_1.9.13p2.bb => sudo_1.9.13p3.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/sudo/{sudo_1.9.13p2.bb => sudo_1.9.13p3.bb} (96%)

diff --git a/meta/recipes-extended/sudo/sudo_1.9.13p2.bb b/meta/recipes-extended/sudo/sudo_1.9.13p3.bb
similarity index 96%
rename from meta/recipes-extended/sudo/sudo_1.9.13p2.bb
rename to meta/recipes-extended/sudo/sudo_1.9.13p3.bb
index a028bcc216..2e11739470 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.13p2.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.13p3.bb
@@ -8,7 +8,7 @@ SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[sha256sum] = "df2004fde4c1033b1fdca339958e0ec633d393d604fcff9d1513abef1f94574d"
+SRC_URI[sha256sum] = "92334a12bb93e0c056b09f53e255ccb7d6f67c6350e2813cd9593ceeca78560b"
 
 DEPENDS += " virtual/crypt ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS:${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
-- 
2.34.1


