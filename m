Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B35CEC47DDF
	for <webhook@archiver.kernel.org>; Mon, 29 Jan 2024 06:55:44 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.9094.1706511341392399711
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Jan 2024 22:55:41 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=275898095e=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40T6pC3B028387
	for <openembedded-core@lists.openembedded.org>; Sun, 28 Jan 2024 22:55:41 -0800
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vw27ks6w2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 28 Jan 2024 22:55:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b9bMrgJ4Yd3d1pGxveLbk846V+RyBMvezey6Weyqi4gEwRujd64tU61J+xBY0Qx1KNE8qMkKqut2ENMG7/C/guBjHkLXPZ10MJNHvlAjifpVHg/uGUkHD42vai4SWxU0qJc1pfDn6fBbQ6wUD8a9MFSxOQ9Aa5oD7oClaAip6P5k/WMpjIO9b5EHBmCxN9ncf8LftNyM7Sqle/agihiQ6DikrD4q3DE0oxw3UVYFPQ1JaXc8uVVwniwHNSCpSSECFzW8SWhANZK72HTBSfCTOJklyPrhIPbX+yZJsPAM1iKUaRw7isfiQHQ/6+hs/9VfbFMfPyFJCaZCF/E2+4h3zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qxLWZ0UO6giYZQ+4VeZO108fkum/3hz0+TxfM+21PmI=;
 b=KxhBk7cKueicCNtKrKxDQa/RVBosCBVktWtv+F1T7B4O+8yAFtBhP6VuXTsnoKDqWwky0Qf+DYkDWRRCPPJ74x4B7K8FZCm7i+PsecFi0X3gxhfFKYMBWE5t7Rf7VWcAPP5spO33lsi0EUBEMFvTiOPxJmLoVcgZ92rWFtIxxOzoTOkuQ8KN87SzdeQbghs2sbw7mHDSW6A3vY/qyqRanF2DznmhxfiF+TpIO7KWKZzk3IW11H1ehyBFhItcG/0J5Te9cCV+qZSILN4qS6SJNqulPjk+OSc6A6DYudrfXv+NwaKd0C23b67NNwscjig6BeuFDF869QLAx919QUkWwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by PH0PR11MB4968.namprd11.prod.outlook.com (2603:10b6:510:39::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.32; Mon, 29 Jan
 2024 06:55:37 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::f816:c534:1377:b673]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::f816:c534:1377:b673%4]) with mapi id 15.20.7228.029; Mon, 29 Jan 2024
 06:55:37 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] grub2: Exclude CVE-2023-4001 from cve-check
Date: Mon, 29 Jan 2024 14:55:22 +0800
Message-Id: <20240129065522.860058-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0019.apcprd02.prod.outlook.com
 (2603:1096:4:195::13) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|PH0PR11MB4968:EE_
X-MS-Office365-Filtering-Correlation-Id: 2478500d-f051-4958-3b89-08dc20974c7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lp1AVDNIRclF8Q5jj/tkbx8EfUjt4Tg2f2bG0ufi9ltIQUrvo92kXY8or6wYY2t9GoGuBPv1UDBnzATt26hyecaUC8ulKJUlH0d94oncNdRUweArcQJtBRvF5rKjZAj7hInxe9YOXkI5lYZjagFHfNc3CDMnBmrjV5FNfj5+74pAS/HaxMYFhtxFzohAFrOH1fHxUs6Csu0jgao5Bsbh2x1KLYknJadAA2qeu3P4HoajMr24s455t3lQRsGZd2NpLfIquyHDis64EHhsvWOPu/NNTSCkRZZsnKptqJg4M1lCCUeWQkMK+0wuVQhyqrKZtt9uddgWGUYkqLnZQQ+ZIFXgkcfqlnGA6z9aHHPuUY2muSCWvIsSEJalbZh5MFF/IDEXUH+6IuoCC3IY+581IzvQY0jt6BeIgh3wmaB8c10ybs6UBGaD7ghgYOcs9I43Xq2NnMG3F/L9l0caf4Mq4b+hnR2HQPZWDAKYbfZFXbUsVorw3G0IK4V0j/hB9KQ4Dozt9HRz53zLYszY0JzbNRJ3nlnwByrcHWwcP85jLsFKaMZVqIdrEB3JorQKSg1J6lCuD5+uPaZ2GniBR3K9ZpzyO45TdV7EezIkJxD0Ra4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39840400004)(376002)(396003)(366004)(346002)(136003)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(1076003)(26005)(52116002)(6666004)(6506007)(6512007)(2616005)(38100700002)(5660300002)(44832011)(8676002)(8936002)(41300700001)(2906002)(4744005)(966005)(6486002)(478600001)(316002)(6916009)(66476007)(66556008)(66946007)(83170400001)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?oQ796wEmshwZmSnNq0gzIF1qekHqN2pJSn++KKwecFo0CSIOfRlGew4KCRM8?=
 =?us-ascii?Q?FoWw8UO78cCeyaVAPObuluGVoyvLdgj0eE/DAPAg1O0Ou2faEj8dtOMFvcpH?=
 =?us-ascii?Q?muHl7fkaGM8gQWDLdU76QWFXHc9pl+USdwrxYV1R91pCdR7mUtxCsAx2Muhw?=
 =?us-ascii?Q?2mUS9D6MpA4/cj1GSKwIspYxXkhRI4Lv1DDqzrYE2BVbHLXQEbP/EOHLBpOB?=
 =?us-ascii?Q?R9HJuMUiNiFW6uyExYFVK11zCcmMT2xEJEegefSnlczANoWRActYikfTjc7C?=
 =?us-ascii?Q?X7Yu6xGGhs7bBzgOhFz/9cxuAd35J3dL32Gqye0hX3oTD8jyKbbXPFNGrdLd?=
 =?us-ascii?Q?xkbaGGOvdF/MOGS8l3aiYfXS10Sqv7GTnyFDm8o9T9BTd5vVgxuc0kPVNAbu?=
 =?us-ascii?Q?r3Ch/IIlFXJ8xI9St2rjv0ZvnhMls7eiXsctEfON3xic5CY1+/c2UkLvXLNQ?=
 =?us-ascii?Q?Hpd2WBLD7yqEkPBREecqzKCR24PWxiJ08Y0hm2WdskUHxKhqsp/toLRnak6I?=
 =?us-ascii?Q?jymsaqhCFnw+Gm+MxvE6ZokDVIC+ewAY5zK5o+UNLLL2n/bNYxcawrVWQyV9?=
 =?us-ascii?Q?8BLFFrYsy3eGbJE9NJYmmMaIYO4++ETiLcKIhAf8mzBSjeoADooWHkZEhhuk?=
 =?us-ascii?Q?FNz2gqWUCPE7mCQ3Khh+kDWdeu+uAXIYRIJNjMYLzyIyGmyBiG7uWAXn3ZkF?=
 =?us-ascii?Q?eJJy5SLJg2x27TpKpzb/f9JajB+HSbnvPj0nBuIcSpWsQnF4IaX3rxR+/jRm?=
 =?us-ascii?Q?kd1F4uZgA1lWITh+pmqYTDJJ7MYoLp5DS8ay6Ol0JW75PTB93OeHEsbbo1aM?=
 =?us-ascii?Q?mRRBGzWgXvqQBGUwJIYYDaXKhI6c7al3P9f3447fFYo7Nu1A4dSp2e9gRDPo?=
 =?us-ascii?Q?SCeA70L9eGECZyFX9W2geCwvMq29M31Obgho0fERbWBuoG67BO2N4h7LUyUI?=
 =?us-ascii?Q?y+Yrx92nEeSvwUNTN+B9kYr0yoFpXRcjtkwg2zhcusekjigNJjRSdKhHMSAW?=
 =?us-ascii?Q?oJgU5vr3Fj9yuh9aGtsTlpsDqciaTziGcoEKrF0++bEvvkqgP+6rnl2xEcqp?=
 =?us-ascii?Q?4P9KWmh0yIv81MBAAzaav4GtTabv5Am8NmNAg/HNm4lsHbzBEMpQZqEzBW01?=
 =?us-ascii?Q?frcgOrStW4WyoJ4dtdvHIDn+7HRRcdvnB4bb96Hb/eDDobC0EwMjzw3YQ4ka?=
 =?us-ascii?Q?RQ5w253HLvNcUZYe+k+OvdRc1h3AMXFAZKikDIQRamiKXPhXBYSj5XAF6ulq?=
 =?us-ascii?Q?skKbP/G2OkXPtRpY1+ZDBixKTkXE53Nzk3CgdE2Co/oGJai/A/saPhvlFB3q?=
 =?us-ascii?Q?CXRyVE2l0DGuf2YW1W4tGNMkIp9Do1aPF8PYojt4FkoSuPyBeliZOBn5is5t?=
 =?us-ascii?Q?c62t7CFIoqF/2HLUdXuRLNha1d2f1u1y8PD5hMJwKTTqANTjDkEoNbDJ7Y53?=
 =?us-ascii?Q?B6WmiUAVBhVm/7Lbi95P3Lhkvdr6HhdPpKCPLk7PnvZGMyTvN+XQxEK4sC8W?=
 =?us-ascii?Q?LJpSQx79Q7Fl7Eyt+BjP/JoAYv7BmJhY9e8gdY4oqFZAWvI+PnPxvbHGFI5+?=
 =?us-ascii?Q?LaukTZYfWYHr7lY8FFLCBf5ZXwC2582JsK92WRVO4HBlf+yWZYjzoa6sOp+6?=
 =?us-ascii?Q?QQ=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2478500d-f051-4958-3b89-08dc20974c7a
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2024 06:55:37.7658
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hmm+Px8b4aRcHznAGxW1Bh4aqVjXHxst6Du8kGYHfsVYawp52kvipLr5x2kj7sMJDqc9eLeBIUhTCpJpHyQlfhZDimyw90S2pV2GNy/Zoyc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4968
X-Proofpoint-GUID: LA30HBeiNEh0MRK8qs-bwlpN_jTyamv5
X-Proofpoint-ORIG-GUID: LA30HBeiNEh0MRK8qs-bwlpN_jTyamv5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-29_03,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 mlxlogscore=775 mlxscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401290048
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jan 2024 06:55:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194452

From: Xiangyu Chen <xiangyu.chen@windriver.com>

This issue was introduced in a downstream patch in
Red Hat's version of grub2 and does not affect the upstream package.

Ref:
https://nvd.nist.gov/vuln/detail/CVE-2023-4001

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 meta/recipes-bsp/grub/grub2.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 5685cae0ab..18046c26bc 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -24,6 +24,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
 SRC_URI[sha256sum] = "b30919fa5be280417c17ac561bb1650f60cfb80cc6237fa1e2b6f56154cb9c91"
 
 CVE_STATUS[CVE-2019-14865] = "not-applicable-platform: applies only to RHEL"
+CVE_STATUS[CVE-2023-4001] = "not-applicable-platform: applies only to RHEL"
 CVE_STATUS[CVE-2021-46705] = "not-applicable-platform: Applies only to SUSE"
 
 DEPENDS = "flex-native bison-native gettext-native"
-- 
2.34.1


