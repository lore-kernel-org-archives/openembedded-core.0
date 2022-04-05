Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48CE2C3A59E
	for <webhook@archiver.kernel.org>; Tue,  5 Apr 2022 17:24:48 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.9143.1649177717285254749
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Apr 2022 09:55:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=MebN7KSy;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=1094e96206=saul.wold@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 235Gr0ZK013543
	for <openembedded-core@lists.openembedded.org>;
 Tue, 5 Apr 2022 09:55:16 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=Yqdswkmz3Erd6geuNHcuWVS6UzFeD0hX7BC6qjy/9P8=;
 b=MebN7KSydzq7Q8WZNEupRNvloC8q0b2JPZBWLxt/zkPVQzsC1eazdsCHIzrK4I8sLqcA
 J5UEptxAHjiUjObfimsALXNkbNAjtECJqNnTf8KNVtN9dVIUFMklYKHicOTrJMs98k7N
 yKhH+QN/M+Eb2JeCs8hvaWQWhW/xVGsGJ12EELadmVLkEiIaz1tlaIcTZj6iUfvtiWKu
 23u7+0Q2F00ikJIECWsFSUhkygZBMKqPI6tWYP0mGfJ/j0m5nEFJTT5ch0xc1fZlj3AZ
 /HEuow4IvnbBpcA51ReMOUozC8F27VLPdnc6Dr3IsnmAh3SQQGx0nY3b0giDWh7LFutx cA==
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2108.outbound.protection.outlook.com [104.47.58.108])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3f6hs3te02-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Apr 2022 09:55:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QYyIyQPW9aqLYMxuvNVzev4T52rewReqIjyh8hbkU4w0KRUYZ0fJiZPZTHaPH9ld4TM8nL0qD+zkaJ89KcOnSXjhInk39al+GGd2DwTZE2fqIiI/SITTTBKMhsc8ZAd2qvpRamDZViumnpyaXbMM80cAXoBvsR/6/eJSsYt9mTPhwX9w5SPOJRxDc68ibE0TuPBXVBVXV3DEcIfUFbymtxyxoO64HtV2J5jJS84sP0VHQoug1mvvqklWEII7afhPNY7mlp+o1IyaKiMkMTkCg5Fq1rXq1TGKzCTAkz+GswD8XupD9Qv7vNXh2wTBFGhNxmUSjMoONoUvqi2NOw3EKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yqdswkmz3Erd6geuNHcuWVS6UzFeD0hX7BC6qjy/9P8=;
 b=Q2wfDYmPX4q0uXB+NmA0TGpC22uGyQDwjxwPiq2QZYD0LxW6gUwdvvn93YViyq3HepOUMTOQVxW0kEUDdd7IlEepPJBLaDfl21WwncOXelmRzyb08mbsXkysyq5xwQjWwKJ8hxt8qQXpnnKUIolHsuhe/Ab+ZcwosiXHjPMuUL7SucgkSFY2qXqRDCUT+7Z5NkYyJyGmk1MmU767y+Ui94lMg8fVbanUEkfaG/9f1TgqvFBB2wpOm/5vtmHEjhRidPN5maddZZjnOQ/b73e2g37MwksACH0scHp1P6AcHsbF4JDdxETershuNwTzSYajkhIX7pmjOQ3w7oqKNBMa1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by BN6PR11MB1571.namprd11.prod.outlook.com (2603:10b6:405:d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Tue, 5 Apr
 2022 16:55:13 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::e581:b741:b80d:c8a2]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::e581:b741:b80d:c8a2%4]) with mapi id 15.20.5123.031; Tue, 5 Apr 2022
 16:55:13 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] depmodwrapper-cross: Fix missing $
Date: Tue,  5 Apr 2022 09:54:59 -0700
Message-Id: <20220405165459.1399498-1-saul.wold@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR03CA0228.namprd03.prod.outlook.com
 (2603:10b6:303:b9::23) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 63f2209c-0d5b-4239-9092-08da17250d1b
X-MS-TrafficTypeDiagnostic: BN6PR11MB1571:EE_
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB157157B99E110D00D95D7E06EEE49@BN6PR11MB1571.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	v0tUrD0v1rk8FHH+Lc662YjVwIPNEiOwWWuYC9momUTBxJ5CCKmNpQFtcJmzzNRjZB2g5u0nrHeHpzElsxh6ohuuDnQDOUmufsOnLoVkQT6OuwCbY51e+eUusbZOJZYGPNdNFry/HY6JFxn10XjHYKC3nRHaIZzWXdy9ZMN+VWmq7k1OvhMdl4eWTJDLZNlMmQEXzeU4uy+k1em5aXzrxlFmq62DVBbU2muoNW7w8WnFdqgRntIPuzd7uDLObearCdHWdEA1KB4fy/cy4ACVYFER+yKXxhMGKWYFchoyt47yQ6+IhhrpC3cpDgkQEw/u4KI0tKKWxlSdrawm0lYiH0ToXoS0UJfQkj+f5hbAOUOZpCk7xHMxOSCRfsGXaL3glH/JMDk+1kX7GK49DkWijpXwqjLIGhO01aDh/ig5HaluXWhCS3zT1PJtyd02bvaI+fiHco/0cVH+WLnbuvpq0UWNk4RIF2JyrFvo4PX3N4vJhgvhNFD0xFRuyW+AvHTd3pWWp2qCD3xFOBwphaCNvmt2tjybFPr+07Gc+hckhUcxCC4Fp2XFsEjQ7JNnDayIw1QB1XzkpzY+FEvr34zxF0zqDGSSZjWuRdnTv6Q2uzYqsmdCg6FQiZ3/eQi2gYcwF3QD05k210CrLkPs2W8ifXXEyTuH1dxAVYNo9ie7kPBhP933YkIdqzgUjLs3SpH153cD3Z9qi+M6AC89pEHP0g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2906002)(44832011)(86362001)(38350700002)(6486002)(38100700002)(2616005)(26005)(186003)(5660300002)(8936002)(6916009)(4744005)(316002)(83380400001)(66556008)(1076003)(6512007)(66946007)(66476007)(8676002)(36756003)(508600001)(6666004)(52116002)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?B2xY59yqQhuim9rYF5Sq1nhTPSTp1+mvDTkTn/tpRGPNPBSinlWi52CKjXN8?=
 =?us-ascii?Q?+Qf6VqnSg4YCOiG3WH4UltnCGAgJhRfBciKUX6iS0jnhcsjXlP1hu7LJRMjC?=
 =?us-ascii?Q?wKYDE31gLbdnncMiIf4MweCSInTmwD7gvZGa6nE6yQL8LMA+ggGmVo92n82u?=
 =?us-ascii?Q?YbwHk7EbMu3b6/89kyq4tU45oNgndCxHN+GAo67dvmySGQzntOF1E67qwB0b?=
 =?us-ascii?Q?H7qxqammJFMSWbeeA5MM2hlBTBoCf8WQjal3wvt2strqDgFUJ9Sceaf5Rhex?=
 =?us-ascii?Q?Z7OYQ5cwPSb3TDRfO2lrcq1Gc6IVGJTpr/m4VP/3YwZ7sqbkFHNAufaqKsm7?=
 =?us-ascii?Q?ISj3P1G0+WcIsL2HjNCY/BcnVOTFoyBbEF0pUldw895Ld+UKjyvc9KTMWHP+?=
 =?us-ascii?Q?cNVj8Iwv4V+WPP3Qrza3XHmyERsxYVTrrq3l00Y0jLCyrLCLMaTAjavpoulz?=
 =?us-ascii?Q?GNaInKni0xz/UMB+zH388v/Z4etXs7gSO/O29f3ouXTuPB/IONyri3ilEw6W?=
 =?us-ascii?Q?Pux5ZzzjJc/u4XYAr7CB2QAhPvAG6DYx9cVOwNjq1ndlH1sblbHkMRJ4LBW3?=
 =?us-ascii?Q?1ailZ+RCSUKXCNRyUbfgEgkxTXjXeEZlaru44mc0kRJVM8e99xveodwyFMhz?=
 =?us-ascii?Q?hnYgPJcWWusM+szQEgZNvCAUUpy/2adZNVYUPdkfAxK8xDPkI1N+QY8hdThy?=
 =?us-ascii?Q?5x0bdsq1W5J45qYPQiz+Y5lHyCwn0TJnnh0J0Om6DroV6R68gnsSUrgop34P?=
 =?us-ascii?Q?3U6gDzhKJiDJZf9bTgQ+3NMaR8cDBVvF64EJSf4Esv11PekSMcwZbuP93dKn?=
 =?us-ascii?Q?iUDlM4T9prJ+3DKJ/Rh8y1Y4auAYOCpfNkCnTrEje0gseHNWrzvatPNvriqO?=
 =?us-ascii?Q?+x9iap93RjYj3aW7CbMviKPg+9+rBQ7M7qbGnG6CXSzHieviAmKAyx6N14Bj?=
 =?us-ascii?Q?imZgcZrXS3u3DnzD6fcmRZaR8syd0HNZmGCnOM6fEw1gyTLBCHI4pw+B8thz?=
 =?us-ascii?Q?WWVw35/YVOwjBCMSuxJ8rKbvSuWIWrcmOeApfsFKOy1aX8ypK/j6bFTTTce3?=
 =?us-ascii?Q?wn0pYDwBi61aDUulQ2u9uGfJj7ibXUDm+x6718I9cMLo6EC1yMSEDYCko2ua?=
 =?us-ascii?Q?09y16Go68L9GoKijWw/ULChfwyETwtQ+yZ36/fJI0H5WWXutuc5iPbJkSvZd?=
 =?us-ascii?Q?E9UEU15EoRBwDYKDLNCEAfQ4Yf8Ex/U6W9V02WE+fn80VJjaJ4Z2JlLFHL41?=
 =?us-ascii?Q?ynuMx/GiQATz9YsCRKiMW7CBa58nzT5EhUt9dQXlHIctd5YUNYegykxg/O5R?=
 =?us-ascii?Q?aJiXtA1n4tAPjx2ihjUyGYsozIGJCqcHC6+kCO5SZ7NAksWJmN3GNrnhYYqq?=
 =?us-ascii?Q?6z8uQ/8rBpTuEaCLDgK8DTRSBI6r4d7GCgp6UUdMMbAZ3sSfNN6h1/y1E4oB?=
 =?us-ascii?Q?HJP2B/JOWtQALUmMiqmlNTC0AbXdepbdwkL8BdILmfrOrCIu8pjtIGfFvmqf?=
 =?us-ascii?Q?eZZB9k3W/Ash8zsoBol6mhkGe2YxwvS/6AFyT48adETJDTIJ8NJE+9XeOuoI?=
 =?us-ascii?Q?5A2KufmjpSSI+CN7Onwn9UJqTpfGVkyER9OoYs/HOys57/8F7h97KAHKC/4r?=
 =?us-ascii?Q?qFLIpTrHwjCM58awH7WZO0bCK1tqAqgn4yEAzthiJImV7Q3/iOCvFK2w12IZ?=
 =?us-ascii?Q?fEwFYnIdSYWu1/9T2JZVy2CTzmI2bGFIMn/ojFaFtaD8Y2yFhdSifs8XxsbP?=
 =?us-ascii?Q?WKJhR3sMxUvIvOupkHqAuCsF/Mrd6o8=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 63f2209c-0d5b-4239-9092-08da17250d1b
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2022 16:55:12.9672
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 NkuU1Hus9BM/Clcgk1Goka2tX5fE+8s7AIj5zCi9zdEKRQZFFhsGpWkuYronl+2zPeHB7AQ8eEZLZJzKCvGdbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1571
X-Proofpoint-GUID: nnKjgjCl9x_mguO05AB5yclNBb4taoc1
X-Proofpoint-ORIG-GUID: nnKjgjCl9x_mguO05AB5yclNBb4taoc1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-05_05,2022-04-05_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=674
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 suspectscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2202240000 definitions=main-2204050095
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Apr 2022 17:24:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164049

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb b/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
index 65068f02df8..303026ad789 100644
--- a/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
+++ b/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
@@ -30,7 +30,7 @@ if [ -r "${PKGDATA_DIR}/kernel-depmod/kernel-abiversion" ]; then
     kernelabi=\$(cat "${PKGDATA_DIR}/kernel-depmod/kernel-abiversion")
 fi
 
-if [ ! -e "\3${nonarch_base_libdir}/depmod.d/exclude.conf" ]; then
+if [ ! -e "\$3${nonarch_base_libdir}/depmod.d/exclude.conf" ]; then
     mkdir -p "\$3${nonarch_base_libdir}/depmod.d"
     echo "exclude .debug" > "\$3${nonarch_base_libdir}/depmod.d/exclude.conf"
 fi
-- 
2.25.1


