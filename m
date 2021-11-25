Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C334C433EF
	for <webhook@archiver.kernel.org>; Thu, 25 Nov 2021 03:02:04 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.7476.1637809322760553229
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 19:02:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=bDa6O6d6;
 spf=pass (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=6963faa46c=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1AP304xs026378
	for <openembedded-core@lists.openembedded.org>; Thu, 25 Nov 2021 03:02:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=lsVm61ctiYHj09Csnqx9VFMv8sZQ517OXigqoDJdOn8=;
 b=bDa6O6d6BNbR2sHTI9etZEBe4c7+i7jzTnNTKuL8jyROV84/vm9jD7FFrvrDtE8Jd4db
 x1ezilGtwNVSn7+UxhpAfMvISJE4FgOm9fZ9uwSqjZEXtXoYcWMsfdys4ZbkxBx6zH0V
 QfKN3JYW4kFrf/KvgjLrF7D6Dz9oIqS+VP41RCoXMq3vMcxvh5vwdxFZPiKadMtNncd5
 gk9QCeXM25U4BznjniEI8TG/xtgCAIdmHnVKWyjMK9WFfC+TTR15EZ5bpgi1/2McWORb
 8VlCZeaqLiaHk9W2kgtX82pNjsTp77ZrXGBf4MomFV1dYw+BSoiD5ZRfM1hgpq7FidF3 Aw==
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2103.outbound.protection.outlook.com [104.47.58.103])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3chg500v4v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 03:02:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KagrkHOtgxrJSUQhIcZOALlQCZZGbXP/h81eQv26WPxVjQHJZTVI/93xrg3w21z3tNCFOh6bniIHxOQukYIajRhyCBCvXG0dJq6VoR1sCWWGJsOF0y/duUQDmYY8hb1LGTrkVwiJBAtINbe9e2mxl0MUN/SDzZKQAgZ7b3BIgwudnCOGs7vczXiJ6nA8tyvvAJEwOynKonDIk0iJKtZbk2qNaVPxGO8hfxaZDaOtivt2gh+RQCUj9ZbOyL/pnMbN8+4GT9TGiNnVjLshxlB8Tz6h8OJCb4EJsCnJxL39gdV9NGQYUByAbxEYmrpFn4EMHSCBo/23QuxB8SuDHZ4C8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lsVm61ctiYHj09Csnqx9VFMv8sZQ517OXigqoDJdOn8=;
 b=W9LSV4EhZ0Y3NDIsTkkdgQGczdLTuZng8oFs7KP9EfQmQqmLxtkzdK5kUU+9arFy+4PfQ9Zec6sCvhMq6NCsJrvo4bR/v+V9et6w/F61qQG10QdJpamqzL8fAJJCIm/zx99eESc5qSCGEwR+TV33CRlf9FromKA4FcOCdC5Mk4k+56537fFzSRxGIHKwPff+ocAfIQasu4SqxokCg3MSGbQbRk2HwpPHbPJSTg7zxvhPWHEMWZlleqZrEgKh03130EWlQwaXoxod1G2NT9lOIbuLkQ0K63OexEGLaL5AlVSliV99ym9PISOCkVkidXk7FQZiHPvCr7p7YmD5Maho6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MWHPR11MB1680.namprd11.prod.outlook.com (2603:10b6:301:d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Thu, 25 Nov
 2021 03:01:59 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::455e:9cfb:d106:4480]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::455e:9cfb:d106:4480%9]) with mapi id 15.20.4713.022; Thu, 25 Nov 2021
 03:01:59 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] meta-skeleton: fix warnings for append operators combined
 with +=
Date: Thu, 25 Nov 2021 11:01:48 +0800
Message-Id: <20211125030148.145284-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0190.apcprd02.prod.outlook.com
 (2603:1096:201:21::26) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by
 HK2PR02CA0190.apcprd02.prod.outlook.com (2603:1096:201:21::26) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.20 via Frontend
 Transport; Thu, 25 Nov 2021 03:01:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 777dac9d-b845-48f1-6bd0-08d9afbff240
X-MS-TrafficTypeDiagnostic: MWHPR11MB1680:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB1680CFCE3CD1D67A1ADE61D3F9629@MWHPR11MB1680.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:626;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	THu0mW6a5zcNfWTiQsE6d2EmROSpm62oV7ZoksKYuduUvlvX9gvshWwnkAl7HpSIZBK/MkhZMlobOsg5l3F+ZHHWHIkU5pWwZ8RZWAmZdoCwAFdJ5ia4DGQM436lrnRJwBMputb+JEsxMwn7pdXXgmZtQXV9muNf1L36lsrIm5wB5inDsQcvYFc4iqqc6xv7+BR7QiXbMrSRF3rWp2wSpYRdghtIISJAVtpOotHFNJPJB0DOjd0tjik8undHgLSYkwVAm4gkb36IWCzYNmsVw94q6oPxIS0aBlVCjR7ZOR5RIBLN76wVIJ4gdf/YvsR5CjbSVsg5LSTvv0BMTor5upqWkwO+E93CUepMNTiL2XWr9EqDjsm17grVJSYMBGa3dhw4pPfOZf2CxSCboGk6BrpQw8k2fEkTXInCnkZhkGF2Hme8IzyXgeseEQisEPs/hKqkIyzRFAOW9x3k8ZbnSH9esvS5xR3fqzj2RTeICuKhua32aqvZ1ywVPyyJA3BbkM6MhgNmlfg+2acMMEoe6wXSJtNbehsNWKSnNtyRlKZQxTBltIhOMKouM7XxcIgTaqJidsvz54UBhtMgAQ2IXeWaqrI0pZpFO2hIAV0SdIvbd9MnV9U/Yf6ALTnhE+TEFMAdp8i/GaRMttn3R4WhXjqMBDY641w9qxariSgUY0aQxlNwmD4J5jt+ssMcK0JHTcbhcVrgy4gdUJcj8FOVNiWtkhNIpJH3G7dJ86FGOcqr4UHjfZIbb1PQrsGisrhI+H/6tG/1u3hf6srjIuJ0yHVIMypgPoXeTLY4fOs10wc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(508600001)(5660300002)(956004)(4744005)(6916009)(8936002)(316002)(6512007)(966005)(1076003)(6486002)(66946007)(52116002)(8676002)(66556008)(38350700002)(38100700002)(2906002)(86362001)(36756003)(66476007)(6506007)(44832011)(186003)(6666004)(83380400001)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?XcKq+Q368Zc9CgJxJQ5VhEyJH2dXsk5bDilA08SmuBZm/LmPL+o/QCn8/uPY?=
 =?us-ascii?Q?IeqbdXjjcnSfpL0kYkq7Ynf32g3lJVqil8hbeJoBHFNCtzD3pwF5nTRjV7hC?=
 =?us-ascii?Q?Q5eq+T1xaynz5I8rDyV7oyxqFZTLGR5cNyKlgyqGZ6SvL/YnB2p9wFswsrNG?=
 =?us-ascii?Q?M/HlmA7IkABICK/98KNTEeeRKaXOPOGwgZLEevOVvU/Urh9QJl77VTTwlFnv?=
 =?us-ascii?Q?UpInRq32jfYnVwCp68ETRl7jKYo2mcJQOiFLk7nabEQWK7zdPs19c5jko+ko?=
 =?us-ascii?Q?AuonCZ8hhx4IXO4gcqXjm9PotbhJneoB+8cwN/8VjlbVIN7hLShAqV4oHJSD?=
 =?us-ascii?Q?40dmdSHLir1MIPyTWuiCQiNPu4mVZFvOjArnF/YlE8NngY4AYuG2adPj5EbY?=
 =?us-ascii?Q?M8Dc3amuVb9YAXYerRkaAjhpWYRcR4YMmSoRF33CMlY782di86YOxbf7U1SI?=
 =?us-ascii?Q?kUuZg4EZtua181KM6h875bq7Kez6um63x+cxFjS7bI8CvpEu2C+qmJPjCoEV?=
 =?us-ascii?Q?gsUl6qxpOj4Vh99JovXeDgOetzE+eVO18sZFUebL/9xc/nwg5I7e7V2sTQ04?=
 =?us-ascii?Q?IJ+iz7I4BDOoe4NyaglmMmlyg+PCWOPi71iTPRr7QsxqgpY9rXFEeDiYFAhw?=
 =?us-ascii?Q?K0lfOHyRh5ggLaGEtvdZ2MLKSHt5kIx5IKngiIL0RdAUcEvsw7aMHAZz98x8?=
 =?us-ascii?Q?xxXDqkhthenbGb/Hl6900bZFcJ/AatkYGsVZ9NZ0VsAfK8qlKmI3hUdukiGp?=
 =?us-ascii?Q?aT6mol3yX8L+afSkVfjaNd5n4D8ZEKIeGbbK64BGB+paKd+kYTlMidNSzRlV?=
 =?us-ascii?Q?BWigm1XuVnCgwH3kJjbhqpv09rqkDEcIhYPdgbaLTYt78nF7jIrKhCMvxu2N?=
 =?us-ascii?Q?NVoMps59vc7eLqTzQAAINLfjlclAHfrICKEraAwN6kWzpBBAnovA/M2A7Fot?=
 =?us-ascii?Q?5NketgH45lpMdgdgXv7yasPUBb2caqO/UIQvAUv1iY75Mcf6Nn8zS5BEjmXB?=
 =?us-ascii?Q?rcpCm+4lnycaWpa9OzsyajrZEl+05gL5yA2TxrAqX5mdce+uqWK1K1iBbnJv?=
 =?us-ascii?Q?IMizIGryS1TWFFT+MSsSLdGaoVX3WQIKD/s2bCFfYnmORCXAJi64Xp7hnZRl?=
 =?us-ascii?Q?J5URlM5WebQilhcACDLYhnUqsq7e2jHOsh96+A7BybmGOrP0vC1Wlnh9BW5a?=
 =?us-ascii?Q?cBm8CWSc/mpIf9bNwQQDRl+d2V9eNF/RWSbfKNiDNtfYNUw5m2PSPuxgl6ic?=
 =?us-ascii?Q?30v3d/CK8WhjWXWdFxb33wDYnfzpDQNUe4bsNlaopWOaJbQSq1wpcMhY79S6?=
 =?us-ascii?Q?fVswKY5+ekrHI1C+Bdv9TkwUhl9Pa7qkxRzN5UPWusIxMdk4eU706lq1XVGi?=
 =?us-ascii?Q?Yp4EUb0bm5SAaRFJtnHJQUtO3ckU6qjVR4dd2m+gKSymEp+8gZQLhN1RC7ij?=
 =?us-ascii?Q?+3fF2hQJQxR6WodvzerVjpXE8d+x8tTnbBL1Q440Y9xVs65M+xkS5bjIs0j3?=
 =?us-ascii?Q?vKsyrw8/OQ2C1u4ZHz1vFnkqrN7pdekuRTpVVE0xMnKSbAtPq39NLwig/p5L?=
 =?us-ascii?Q?Q7X4i9Et7cw3XA4yqMLDSw7AkdvMb6KloofkA794I8lSdwP0BuvPtZSRB2Y5?=
 =?us-ascii?Q?9jH1TY1GiAcqAPQzk+6Ahig=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 777dac9d-b845-48f1-6bd0-08d9afbff240
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2021 03:01:59.0575
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 40gCFGhv/IFjM5DKO6aVJlCMkQRwtnKPA37sTNupQyFFcCm6FbS6+UBJtBW6GFL9eIVygnTpUzrq/k4pozyYkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1680
X-Proofpoint-ORIG-GUID: g0M0nLhJBNVpXdUgcVe3V0SWuwL60mfa
X-Proofpoint-GUID: g0M0nLhJBNVpXdUgcVe3V0SWuwL60mfa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-24_06,2021-11-24_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 bulkscore=0 mlxscore=0
 mlxlogscore=604 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2111250015
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Nov 2021 03:02:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158773

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-skeleton/recipes-core/busybox/busybox_%.bbappend | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-skeleton/recipes-core/busybox/busybox_%.bbappend b/meta-skeleton/recipes-core/busybox/busybox_%.bbappend
index 621c94f651..3c936eb713 100644
--- a/meta-skeleton/recipes-core/busybox/busybox_%.bbappend
+++ b/meta-skeleton/recipes-core/busybox/busybox_%.bbappend
@@ -8,6 +8,6 @@
 # http://www.yoctoproject.org/docs/current/kernel-dev/kernel-dev.html#changing-the-configuration
 FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
 
-SRC_URI:append:mydistro += " \
+SRC_URI:append:mydistro = " \
 	    file://no_rfkill.cfg \
            "
-- 
2.25.1


