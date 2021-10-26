Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B098C43217
	for <webhook@archiver.kernel.org>; Tue, 26 Oct 2021 23:36:25 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.4594.1635291383923508233
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 16:36:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=eNJ2PAOy;
 spf=pass (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=59335ce822=saul.wold@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19QNZZfk021979
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Oct 2021 23:36:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=qmg2OgXzOjUpexLjUvjFC1o3tNut1w/706LSsQlV5i4=;
 b=eNJ2PAOyM0SR5Nfpw0z+sA41W6INrNK0B0B42bFpfLPIV4E1FpKspxNH115pLiYuRYY/
 RA9rqtVrZD9X9JBwGXoXERjr3KSQ6NttF4vmISWDDpd/CLKjYImcobyoIUN3DDP9Oq4V
 A17DSe4wk5ftShpGK7qYaHCaiXE/3k9TdszHIgaffT0WSDfHXSzhcjna954Tx7HWnR0y
 DaRNmOIRefMXeookd5h2lrFf0pqjZuNAlZEYq+Y3n2Rukrgc2y3Vb/TSj8D0Sv09NfJ4
 mqVG5L+Fhuom5UjWmvKNzUgrXHaJi+fhBmJXgGiBqaJRa+tIHviagRWZTzZhdjz9L7cK kg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3bx4egs185-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 23:36:22 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 19QNaLQt023500
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Oct 2021 23:36:22 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2107.outbound.protection.outlook.com [104.47.70.107])
	by mx0a-0064b401.pphosted.com with ESMTP id 3bx4egs17w-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Oct 2021 23:36:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q1avuav9KNTLwvQ/5ETHF0T7qEEQ+m611Y8zVp9bTo1tSmov/BJeXmU0ytjE3c1dgcaHCdKdu8fzDgIhl6o9UmqNXbyaGhEPrJy9x68nHMMI75n21V/ejzDkj2UlZxNzJYHETBVA5h3xes70p3fjo0PS7oGV+5jI9TgpizpCd97yRTP3kCrR3HbhQFz1plPm9qBK1GVjPcZyh5Qf/WA6FimSzL+zyNEH9uQskDO4t+Hkm7mm8gOQKywtxb94CTaMCbLlJq2K9botSjhTB1ezda01q5SmlQcs6F9gsWvfZFYMSYxikMezhoIyMMZ2riJa9eNHyXwZ9Bx7rwhiUlBDog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qmg2OgXzOjUpexLjUvjFC1o3tNut1w/706LSsQlV5i4=;
 b=Sgl5FDBMUOiMB+p7pz/X6UKrZaDLeHwSAGhTqIvyq7h4f6SdtP0zSyzyJcX+mvq/F8FfzEpKCSo2V3dzX7kcYYbuTmrDYUOp81Z8hLH7fhxp4/zKTPME6lA4s2fYKuU3Clek9GXRMFWHz1OhhTqiejHyOXEiz43/a+r7GmdGN42XjQPWewkWxSaLSuXBWuLUvMXwKThiXOk9P6rVYh2AkORgD1jLn59CR732VRX+jwM6rOhfCJ8FyltG9KijOXGWumCoOYfg55WC/6FvsqTqvxaAbRd/1YPLsLBkUATEpgYxkp+aV+HuWF3YtORsAzmRcDZB78nzbGEe8LVhd4i19w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by MW5PR11MB5881.namprd11.prod.outlook.com (2603:10b6:303:19d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Tue, 26 Oct
 2021 23:36:20 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::61b9:f111:c64:3c74]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::61b9:f111:c64:3c74%8]) with mapi id 15.20.4628.020; Tue, 26 Oct 2021
 23:36:20 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-core@lists.openembedded.org, jpewhacker@gmail.com
Cc: Saul Wold <saul.wold@windriver.com>
Subject: [PATCH 3/3] create-spdx: cross recipes are native also
Date: Tue, 26 Oct 2021 16:36:02 -0700
Message-Id: <20211026233602.71762-4-saul.wold@windriver.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211026233602.71762-1-saul.wold@windriver.com>
References: <20211026233602.71762-1-saul.wold@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0036.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::49) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
MIME-Version: 1.0
Received: from ala-lpggp3.wrs.com (147.11.105.124) by
 BYAPR05CA0036.namprd05.prod.outlook.com (2603:10b6:a03:c0::49) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.12 via Frontend
 Transport; Tue, 26 Oct 2021 23:36:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7cf83522-9a7c-4cbf-2314-08d998d96a16
X-MS-TrafficTypeDiagnostic: MW5PR11MB5881:
X-Microsoft-Antispam-PRVS: 
	<MW5PR11MB58810FF9E242799FF643F622EE849@MW5PR11MB5881.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:473;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	EOnkIBTuEjU0xQ5R+nG+IX/+NvpV+BUiOLkOi3tg6P/i6ZdYa9bOlmEM+CHMQoC8LVrpqAgIpSZsEpoayRxQqLdGPi0zv6eZrF9QeuEfS7UkktrwdREDL+KNMbri7HKLpQRYMeZXctYTbsVipQ/uuCHzrcuoD3aPplC8OLt+6604SSBRDrUquBYKQLqR2CDv4p4NxyqDBtypJLVTIThfBWpJGC0qGm6u3PZi4YXwVexA7vCC9Ry/Yo1p1ND2E2OI4U5cd9IdagnbIBWpjUyoERZdtJdFEmGxyNVvBhbQHhQK4yrz8dHDFPE+ZEHszY3C6kOQYWkP4OwLO0YWp/0Zmom1mi2Vpaq+3YmC8iHybChFSrb0dSkTRzcsJYfnf5z8Y4gdXwrkHYfyHuLNAgyAjr6o2Q3+XOHWMuiFcAVRo3tQ3XO2mM3taEraVNw47kehd6t92K/wQj0rMCo5mwmpiCtFAIauuypHkkeI83FHQYJOistAHP/FMhQgbPADh8mY3MbRMbHD3IGcFh18j/93XDrhgafNIylmbs/Ed6KFJiXPzKRsacZnDHtOqehjgCiRzKWSzWqip2P3QMHcR1GHnxQpRKlgjYBRczDgeC3vTOGew8eDyMVRAQ8b4aJQUmrn0oiUnBvpvyaQgsMVIaBzLYR44mVnOXv+eFYLk+O+D1KPm4eS9a5hN6cMHHEkYLttV0lWVJTZlqR2P1PlpDpUxw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(83380400001)(107886003)(26005)(38350700002)(8676002)(66946007)(66556008)(38100700002)(44832011)(6486002)(1076003)(66476007)(6666004)(6506007)(36756003)(2616005)(508600001)(186003)(956004)(4326008)(316002)(5660300002)(52116002)(6512007)(8936002)(86362001)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rV/DVgggSZ6HANYXmF78EIHQANFfI5t49zyO2+V7TeXAcs2e/XOcclXoJh0d?=
 =?us-ascii?Q?YtW/2Ke6BYYLdcA3ahi/XiJYd2Pn5Fy/Ysckafo9YTZUfGNfrJHx5gblaysm?=
 =?us-ascii?Q?rWlWJpPKhtlQMt2LeWNNeV6nzMsop5RmExFGYUHlMPDcboZTdzCJziefeOrt?=
 =?us-ascii?Q?uPuvUUoOYoeP3EaVZ+EUWCS1nhv1ulNKW7eudh9KbmIhAy0mBMhnAWukByT0?=
 =?us-ascii?Q?XGrXckK/VM6Nyex4Q+PAjB1GC5PRlnRMOdLu23SXF5K39o7/34X4FNN4+yCM?=
 =?us-ascii?Q?QoMtey9qUCxyIwOQyJAJS3xHYBXSshTkbsqceyH+o1miFhVdXqWtZCXVjOjp?=
 =?us-ascii?Q?9yleZLuZqxV2TPYUDMkaV+8SUY3Hs5lQ/5ZIpxDAkiiE0W123uO4okMq7yq8?=
 =?us-ascii?Q?1TJW2ALigBVpQrMLuhcxT26P6aHO7+htqlfupmi7KW6wrMKSB5csFYWThoml?=
 =?us-ascii?Q?hu/XW+SKMzcmZOwvnU4ayhDoevqMSH4Ab6ioIrbhFAdMlRM784fTsaJgT9Rx?=
 =?us-ascii?Q?XPQx9OJCXc1GtadFOuFTm2L8IvEz5bkbcorUCCEZg1YmLIwlRHIluSgZDuYD?=
 =?us-ascii?Q?2nemM3AW8FWabElj5jIMfWq7ZfjYJR0CrEz1AeakWZg4CrzkBO7b+XzZJEGn?=
 =?us-ascii?Q?pdFstXPuxUWz6lIyhxSTjnFZR8ig3EgRStR3jZvhCqUGe/UB+iiM4wRvwA/Y?=
 =?us-ascii?Q?zGrzbE5Imye85UUzNz/lN7yQe7wooJWFoR/KIykxaCbarXtrO3rja/M8x/HU?=
 =?us-ascii?Q?3FFOYLvhwzczbrc2OgyBILDVJEjvjr5UEATHR8SJobA4nQdWxeqOT9uyV7te?=
 =?us-ascii?Q?MbFGqf6gT7vvRYW7T3FWR5moafLZJhZ3HWPLfDSa9cYuK1Zu13EIiAuBPuhz?=
 =?us-ascii?Q?zrlIIPJVJ1DhOJR3o0ja/VSll5/H7GBJ4xO84MEGrLYN3oIHvzVzQ9iluQWr?=
 =?us-ascii?Q?OtO7ehlNo4xVCOS1T/nKkP/pTR4YCqnGf+tgCpfw8WXIkLfUB50x59vpFxTH?=
 =?us-ascii?Q?Kh1i3pEuFPsv7sjDk9P1yK9mx07ki/Dr6shAyKtCIFnAq3pt2/QYhgZS9RoE?=
 =?us-ascii?Q?GRUrdtU/rcyDCN0FihjjonfzdFzOMZRxeXLwSodNPHxDw9fR6QWK2kF3AP9X?=
 =?us-ascii?Q?PG3sY/3NUXfTT9AaA26aDAIZpZv6XzOrGZ0rMuOnymSifP2Cpq2IiHgL75//?=
 =?us-ascii?Q?JCmTqYI6OuujPFObVtolNS9sT48nAxhx76u7IIR9ZrOnZla+f7w5mCkSTPII?=
 =?us-ascii?Q?+xWxhp3iXjfrYua/b9nDUDxE9ii7savtaSlLtWB/8rBG0hCLbecP7kFxM4nc?=
 =?us-ascii?Q?4Pq1Lgq1lIg21145xk0i4coaZfR3X8EN1uoLi/irDhi2t5UFW+Y4g5LgvNc8?=
 =?us-ascii?Q?iBB3bnqKoCiV2AlLVNykVBYHOGYc5muyGcIS5pJGCM+eBKTl2Ppkga3yPBqZ?=
 =?us-ascii?Q?1t3Qi8EtyxYDPhQXLWFRRbz7ijP2grwrMPvRTHt/nDn1XnRPzxACxeDmQk3M?=
 =?us-ascii?Q?D4Bp8CjBNFRXVfzyZNAzll1ew4jsDDCqlzwzmPFVQi2UAqhT6JuJpYhfCQ2Y?=
 =?us-ascii?Q?4armyFXPAyUuUCxreNkdA7XM3YS5QLQOjr31Cn9I6+h3qnGn6lzoUfN2Zvln?=
 =?us-ascii?Q?fG+wXuQQIAbGOwQHT86k41s=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7cf83522-9a7c-4cbf-2314-08d998d96a16
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2021 23:36:20.6469
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 o6mWNlXf1ks+PbJXSFq4L+6M8FAqRaJO/SZJm1wFLeoRcmwj7ykBFw4xVb1R5r6fkcn4TfAcps3+JGpTgXX17A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5881
X-Proofpoint-GUID: qmMKo7iiNw3yXSgc2XzmAP0048JTNAqp
X-Proofpoint-ORIG-GUID: VL-I6l9O3AoaSh7SE6MxsCjn7-FCx5iP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-26_07,2021-10-26_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=945 suspectscore=0 clxscore=1015 phishscore=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2110260129
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Oct 2021 23:36:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157460

Recipes that inherit cross should also be categorized as isNative

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 classes/create-spdx.bbclass | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/classes/create-spdx.bbclass b/classes/create-spdx.bbclass
index 72a9b55..883bc23 100644
--- a/classes/create-spdx.bbclass
+++ b/classes/create-spdx.bbclass
@@ -418,8 +418,9 @@ python do_create_spdx() {
     recipe.name = d.getVar("PN")
     recipe.versionInfo = d.getVar("PV")
     recipe.SPDXID = oe.sbom.get_recipe_spdxid(d)
-    if bb.data.inherits_class("native", d):
+    if bb.data.inherits_class("native", d) or bb.data.inherits_class("cross", d):
         recipe.annotations.append(create_annotation(d, "isNative"))
+    recipe.annotations.append(create_annotation(d, "SPDXDIR:%s" % str(spdx_workdir).replace(str(top_dir) +'/', '')))
 
     for s in d.getVar('SRC_URI').split():
         if not s.startswith("file://"):
@@ -610,7 +611,7 @@ python do_create_runtime_spdx() {
 
     deploy_dir_spdx = Path(d.getVar("DEPLOY_DIR_SPDX"))
     spdx_deploy = Path(d.getVar("SPDXRUNTIMEDEPLOY"))
-    is_native = bb.data.inherits_class("native", d)
+    is_native = bb.data.inherits_class("native", d) or bb.data.inherits_class("cross", d)
 
     creation_time = datetime.now(tz=timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")
 
-- 
2.31.1


