Return-Path: <kexin.hao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E09F7C433F5
	for <webhook@archiver.kernel.org>; Wed, 12 Jan 2022 09:11:41 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.20815.1641978700392696533
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jan 2022 01:11:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=S6DQntEK;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=8011b17de3=kexin.hao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 20C8a0qL001085
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Jan 2022 09:11:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=334hFDOZ5jTS1pay2CggVV9EcPzUImuYPtjp0pEJSYE=;
 b=S6DQntEKBqu6tY7w/F38FGTxk12u+6WDZSAODt/6+N9IdkljVkbO4A+u99N8//DUbZvp
 HvkVqls2WZMxiYbbni+G1RB8rLmaQOVk8GueWBOdOiyvIVZClPyX2BdMzVeG1hRWIrfr
 UlGqHfRh+OvDJZDQUWS1AkntxOkDPhid6NTNB7S4WWwMNiZdHPgFb5OkynYyrUYe+Ugd
 /YD+dyPSkJrx8wGH0cTwqlL0c+b08K+9+Q5LJM0OfMITNX70+JuY2IBBiCb5rCWk1g8V
 Jx6wa5kHmQLcznK4A9IPKR9efcgGzjYWgEep80Q7+NVlICT4IIDfdGaRsQEBJIz48C9M fg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dhtf001xg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jan 2022 09:11:39 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 20C9BcUL002101
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Jan 2022 09:11:39 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dhtf001xe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jan 2022 09:11:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gqmFbdlMRGdU9hD+RWd3grMEAtB+Uni8MbyNAJhZ4qKCFYuQORoIBV5IKHBDdjusgn36agHk1fJ+wpdSc0bq+lVEOTudpUyynyS6wQ6CIG2maziTRoBo+kASi8hyegfJQduzJKwpSxi1o02+1JcM7E60kxxmdo5UjYf4UcVYNj8RC+QBkygktosGjKBpmoNhp/mIZRBL03gMKa4gQJ/WbaXxAHPFR9TeRQuTj+LyebHTs3n0QRe5PQKl7VWNnjBEhPy+PYcVzEIXcSd7ODHtkEImSTmwgC8mkz+1ts2fJW2HgzjuYOlSFANBnq3VaMbsKlMyTGoRdcgxeRLXJpkEsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=334hFDOZ5jTS1pay2CggVV9EcPzUImuYPtjp0pEJSYE=;
 b=G1p9PjzZOF05kDW4SP9W6l8gPRSzqwA9bEEcVM99s9dHekxphhkHtzzMDjH8+Ni8QQz/TrhsFjzLkzX3YhfNqGMmkg5im+BeqVfKC79hncyeLVAvTaa7v62pR7bnrrX/DN0CkSkBDUUJAU325cnrHiu2NpOrxma/ZJ5/ksr25v7L93Ce5w814cQ7EdO54IrBzs+6RckFvV+VgVWLQGKyKlSb5DzuotQy1TozSbqRl7mww5OHsQ3WUrUFp69BjtEZt1A+06joWoYsnmIQhtpQfQh+jtVmxP6JQGKpe1Tm3oryieuaLSZpAb0VZ5oa9kvHDBuAVDIxs00AjdMr+efQwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SA1PR11MB5899.namprd11.prod.outlook.com (2603:10b6:806:22a::18)
 by PH0PR11MB5643.namprd11.prod.outlook.com (2603:10b6:510:d5::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9; Wed, 12 Jan
 2022 09:11:35 +0000
Received: from SA1PR11MB5899.namprd11.prod.outlook.com
 ([fe80::ec6a:319f:6956:24ce]) by SA1PR11MB5899.namprd11.prod.outlook.com
 ([fe80::ec6a:319f:6956:24ce%8]) with mapi id 15.20.4888.009; Wed, 12 Jan 2022
 09:11:34 +0000
From: Kevin Hao <kexin.hao@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH] tune-cortexa72: Enable the crc extension by default for
 cortexa72
Date: Wed, 12 Jan 2022 17:07:08 +0800
Message-Id: <20220112090708.1597301-1-kexin.hao@windriver.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0015.APCP153.PROD.OUTLOOK.COM (2603:1096::25) To
 SA1PR11MB5899.namprd11.prod.outlook.com (2603:10b6:806:22a::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e90612e1-1d56-4d8d-cddd-08d9d5ab87df
X-MS-TrafficTypeDiagnostic: PH0PR11MB5643:EE_
X-Microsoft-Antispam-PRVS: 
	<PH0PR11MB56438194685648260752E5ECE2529@PH0PR11MB5643.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vTvO3PpgkhLAY947xvlWhU0UCJ1f1Tab+VOXJ732SgACmG8m05dvk4IToyTuOXIcx7mpBLFdQg/hP2ioBUbt1XkNrym06UTebQQXqpF9Hn/AkX7fK37Utovo+g/T5gAJZqYWw4Qz2jLHoSiPwjwyiPi2awz3364ieRLmbO1HIdRAkbSpsP+/DL+5yKoxLd+4oKixHXcWB/hfe1gzDJRmLS1567JXU5NRutIkMWGupNPoGAmyX7dXLW1mk2cnndDfbMo67WcngGIfK7FWdDS8YsQSm7BYNThUQi4h5M4W9uTKUvVEU+Hg1M9fTYdvZi0TQZ9K/D4V5UmIxhw/UwduuNjwNTdF96UyjkXJB1YLvGXatNjk+yjMJjoDCFUxlwW/pBA5Oq1vplYzwKuPx09mvO0mITDH7/AhuzPc+lgDdMQ5swqhpgNW0xbL33Ac4BdlUqdA/RWGuQQyacIO2uLVRR5sh5VLMidP9S7XpZylL6w21OZcL2Gun+4HEwHdaSTIrEp1446DAAZgxS7wmVZ2JSIgFyhgSHbYDE2jGQBNu+tazXr7JeXa5bkKzaN88MY1+xAGChFgMkmgefNsGk4K6V9tmYKAHMgX5XMzL4zdymJrhUWZ+7qJAQ8AS8hRI/5QUiKCBZU9l+QJOsCAzw29wVG7x6a+91z1AHg/Ymszit5i79UmWeisrRM03lTkmPZmTdB4L/wO1nFgPpGHSTakiA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB5899.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6916009)(86362001)(2906002)(6512007)(36756003)(38100700002)(1076003)(38350700002)(2616005)(6666004)(66556008)(6486002)(83380400001)(6506007)(4326008)(186003)(5660300002)(26005)(52116002)(66946007)(66476007)(508600001)(8676002)(316002)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?uSWmVWPVZIxbW17Xeh5pB60O1ecMFTVQfprTFC566BXevV0IZbbe4YSMu+Bg?=
 =?us-ascii?Q?iVNEvHpAMhJ979bCtduELaz26CbCofH4pA5gde+YANfOT20gqsyp0KtAQ2+B?=
 =?us-ascii?Q?kEizCYiQE59UNsxDqGv4bnRK+TXPHvVAJlYSF0oKmO4GH23VNU5cHcalDNPS?=
 =?us-ascii?Q?oR2Va8pnK9Zm/5/27ZcQNLHgUjNmDyNFK0sIsuh07HKBZFSMPPRMQmYrsptr?=
 =?us-ascii?Q?yVvFK5ZB8AIELT2WBPNLW/Og00L1QoR5vpC8jbys6yvEaeMmSF/kXqY28Lt1?=
 =?us-ascii?Q?ykDi+xQDy+J1lZGoLLY6PvPAh4Lp5uQ0IY/9/K/Hn7StvK1yKeoRM8+8kFbm?=
 =?us-ascii?Q?EH6dPeUSs6S0tvSHCp9hOlDvBZvm2R3kdhy7lotZUkuAWygnT5qPrJked8lC?=
 =?us-ascii?Q?bqv9acGl++lq+7gceC7/htYj9twOiaAhVA759K3m4ZDH9u6X8OaLythrdw61?=
 =?us-ascii?Q?SFqibYh8qXBeHsbh8T4woIqSS8qycLgcth0KktPYDlZSGis/8M4NnGOYGJjU?=
 =?us-ascii?Q?2l1ObhzaI5OlDujJUE87NwEBnPjeAht7FbhMbfg4EPmPL4geKkXB14WY7xtn?=
 =?us-ascii?Q?9GIF0Sp0jbrgDrfJHpkE/OAN9ZvLP/i2Y5crgrguU5rvkJnbAx07STCIu4fe?=
 =?us-ascii?Q?wMTIddWkwpt/wm+iTdVrC5PI9spHSREzRJXvtdqiF4KwX3OnuUTIoxfQmMbL?=
 =?us-ascii?Q?NELtsq2HeJMfDM/3C/gx4y00WxEHKZziqllVrwkbDRkGnphXG2ZzHm7EF73+?=
 =?us-ascii?Q?edFRsSleM7p23xRX9h9h5GsLTUt8V2b79tu/NXrk4CQG7/6yfGKWNp1q9oPQ?=
 =?us-ascii?Q?Kbx8NkXnJdlUNz9deOQtOVHWBtuI201zk6OXY/sjI0a7CPaz6e72gsfGRvQ6?=
 =?us-ascii?Q?vtJFnK+KYpgNnoClhNoINH6xW3G600ObKcoIsx9iVLa8YMxUQSGHcE14DEuU?=
 =?us-ascii?Q?b8n5ZEmrMzSdT9qAg/lyzbRDGZInvAB7mv6wO7PKfwPP5YD+lZkNl45QRP4D?=
 =?us-ascii?Q?Na6HUNHct8TjEUu31T+cSgSbEbD8SVWx8ql7yh2uXN+QLjQ/D0wdxKQadE93?=
 =?us-ascii?Q?JcspxiHunUuGe8xSRd/Sq6WXAlbls48fbJZnHrfEwHFjnpaxe1wxDr+ifpsK?=
 =?us-ascii?Q?GjVI/J1vXp5laOcGmw09ig/WMT7/094FU09XbZOrHkuAot4WzPsCuUp5BTnc?=
 =?us-ascii?Q?qfxXNRe0jH4M6uj1ymIbrgdCuYRVEaCW+sJm1CXWCR5iPSt2CmjEtF5JBGjs?=
 =?us-ascii?Q?o8bhFxeY7K8QqcIwyh7TE2EJ/DCU7HTxoGgkHp/irIG3Ip5j5IvhjJzk+ycS?=
 =?us-ascii?Q?kwKz2SnhL4AM9vNPPN7LN80H+BPSJ0qJ9IsonyFadx54sH0SHGI29Zrd7vB7?=
 =?us-ascii?Q?kcVQzzciDClb43066hKJfLgRZm7zSFhdD1ufbP38Kihsx8jhS3GVxBHlaqKS?=
 =?us-ascii?Q?x5XOwuO3NYme17US4fzFoMuszKHJSR0p7ev2YyQseHg9YlxIP6qTWWkzPoOu?=
 =?us-ascii?Q?AoA/XxzFWVZfw0g5kMtFdFfWY4YwBgKkFeUW5kxFXDRSrrSVvj6uqpW3smoG?=
 =?us-ascii?Q?6yFqTskd3yBbQT6Y5ZY3kNLjPCcbjqTHiA867xLKydzqI16SJYDH3Iri0ZCj?=
 =?us-ascii?Q?7fznJGbrr848Cc7q+EsEDxU=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e90612e1-1d56-4d8d-cddd-08d9d5ab87df
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB5899.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2022 09:11:34.8787
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 /3h9QulW2W/46BRvMp6ue5qJlJVRC1Fv+PLqvyig8U316fBX6fQLA6/L4gAmSkGa9QC7t9Z1vZ4LC0dzKQPoSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5643
X-Proofpoint-ORIG-GUID: JBN8WdKov3fMdHCd3VVZGe1GaUsZ-058
X-Proofpoint-GUID: N1ber5YktecfP_ZDnSHW9UzA0jOL2q2E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-12_03,2022-01-11_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 spamscore=0
 clxscore=1015 mlxlogscore=844 adultscore=0 impostorscore=0 bulkscore=0
 mlxscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201120059
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jan 2022 09:11:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160480

The crc extension is optional for the ARMv8.0 but is mandatory for the
cortexa72, so there is no reason not to enable it for the cortexa72
tune. With this change, the cortexa72-crc seems redundant. But we
had better to keep it to be compatible with the BSP which already used
that tune.

Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
---
 .../machine/include/arm/armv8a/tune-cortexa72.inc    | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc
index 3651cf6e802b..4c9add32f5f5 100644
--- a/meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc
+++ b/meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc
@@ -10,12 +10,12 @@ AVAILTUNES += "cortexa72 cortexa72-crc cortexa72-crc-crypto"
 ARMPKGARCH:tune-cortexa72             = "cortexa72"
 ARMPKGARCH:tune-cortexa72-crc         = "cortexa72"
 ARMPKGARCH:tune-cortexa72-crc-crypto  = "cortexa72"
-TUNE_FEATURES:tune-cortexa72          = "${TUNE_FEATURES:tune-armv8a} cortexa72"
-TUNE_FEATURES:tune-cortexa72-crc      = "${TUNE_FEATURES:tune-cortexa72} crc"
-TUNE_FEATURES:tune-cortexa72-crc-crypto   = "${TUNE_FEATURES:tune-cortexa72} crc crypto"
-PACKAGE_EXTRA_ARCHS:tune-cortexa72        = "${PACKAGE_EXTRA_ARCHS:tune-armv8} cortexa72"
-PACKAGE_EXTRA_ARCHS:tune-cortexa72-crc    = "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc} cortexa72 cortexa72-crc"
-PACKAGE_EXTRA_ARCHS:tune-cortexa72-crc-crypto    = "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc-crypto} cortexa72 cortexa72-crc cortexa72-crc-crypto"
+TUNE_FEATURES:tune-cortexa72          = "${TUNE_FEATURES:tune-armv8a-crc} cortexa72"
+TUNE_FEATURES:tune-cortexa72-crc      = "${TUNE_FEATURES:tune-cortexa72}"
+TUNE_FEATURES:tune-cortexa72-crc-crypto   = "${TUNE_FEATURES:tune-cortexa72} crypto"
+PACKAGE_EXTRA_ARCHS:tune-cortexa72        = "${PACKAGE_EXTRA_ARCHS:tune-armv8-crc} cortexa72"
+PACKAGE_EXTRA_ARCHS:tune-cortexa72-crc    = "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc} cortexa72"
+PACKAGE_EXTRA_ARCHS:tune-cortexa72-crc-crypto    = "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc-crypto} cortexa72 cortexa72-crc-crypto"
 BASE_LIB:tune-cortexa72            = "lib64"
 BASE_LIB:tune-cortexa72-crc        = "lib64"
 BASE_LIB:tune-cortexa72-crc-crypto = "lib64"
-- 
2.31.1


