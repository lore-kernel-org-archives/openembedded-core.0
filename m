Return-Path: <zhe.he@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91975C433EF
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 03:16:36 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.1844.1641870995358193397
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jan 2022 19:16:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=aQunjj0p;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=80108da5ee=zhe.he@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 20B35SE3004654
	for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jan 2022 19:16:34 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-type : mime-version; s=PPS06212021;
 bh=wnyGx3Z+/5YyziUkHfX1cEfigkfmxksj+65Ea6FU544=;
 b=aQunjj0pThQy6Rj0xJnPVEy8pbPsIlKemTiAaVz4yspiGszqQ2KYsTMSwtS5VZXsNt+e
 qdw5XpLK4OtwSxt7ULd2y80/U6Ub9pbUvlLBbZDmCUWrrUHRlXQximcIDkLfDxkzJE50
 LdyDG5FCEfpWb8T1gfRLuGuQLVzL3ldXjMxDQ2RC6hdH0ZYpd9QMPinTz59lt/WDD/y3
 WpwW2ZWhPCVaoNRZlmz39WuvsISh3skKvqxugrSguW/EawvVQSpQfmlq24kVaQsHpbK0
 qZtnpFUS/NDuSMeePj0sgoGceNbvufzrcZUaANuWynz8v42lfV8i+Jkin3uYMpBvKjob Wg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dggv38mu0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jan 2022 19:16:34 -0800
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 20B3GXHl003423
	for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jan 2022 19:16:33 -0800
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2047.outbound.protection.outlook.com [104.47.66.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dggv38mty-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jan 2022 19:16:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ns9x1+M+Rz7c/N/SeppfsdGw89m39ysqKyLEXQvWAVQi128bXfUQVocoeYSMmA2li6abgZQlg0ZyB+Chu7Vv2bszTtRHRryxGE4JdaWZbLtFxMtATtnKrMW1N//moALaLx0FsCxW5uPeCm87shfD0Tab/mfOKlf+YPRXkVQ67C7KY3hqFgRrwdEBaEudnBa6O1LuNcN8yfryAYnIlJepzWzcdZUfwIhOfqg8JTRiT/5K3FbRjxA0fp4pDdk56q8KavkpTylrLK3oXMfq3rk81maA3xz+abEXRAhsm4AP+TYZJ3I02ER/HWsSz5Re08vYKb4oA7vGGj7nKbycFPif4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wnyGx3Z+/5YyziUkHfX1cEfigkfmxksj+65Ea6FU544=;
 b=iBoPmJFk0NfQe8DQzaTVf0HtKHi0m+Gig1vygqgkert6V/FKY5Y5kP6039wrxbDTy70+xJeiBKh00KWC7FLFHFn7v6H8yWm1c80xpcTykTb1J80uaHcXyD8HSQJDkZvOTL57zNzQk9b1/fzbwxJBD4A/L3Nl3hUj13EGbTjLGpCZaVw4hu7nMf031zC2gHa6i7Ga4lG8jgb51uM04zKXMUEjwIDmMulT38JMqXu0+RqV2oN6DWYMLM+8YFL0LKo0ICwPnGmhR0mP3UDPfdE4QDx/+zCr2ZiZ4aY1uEQBendAR10xF3QN7xyhvaeoFlOHsSd0F6Xlm8R5/Q22HgqcTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MWHPR11MB1358.namprd11.prod.outlook.com (2603:10b6:300:23::8)
 by MWHPR11MB0013.namprd11.prod.outlook.com (2603:10b6:301:67::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Tue, 11 Jan
 2022 03:16:32 +0000
Received: from MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::a917:745f:993c:1e9d]) by MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::a917:745f:993c:1e9d%6]) with mapi id 15.20.4867.012; Tue, 11 Jan 2022
 03:16:32 +0000
From: He Zhe <zhe.he@windriver.com>
To: bruce.ashfield@gmail.com, openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-yocto-dev: Set KBRANCH with =
Date: Tue, 11 Jan 2022 11:16:16 +0800
Message-Id: <20220111031616.43536-1-zhe.he@windriver.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: HK2PR06CA0005.apcprd06.prod.outlook.com
 (2603:1096:202:2e::17) To MWHPR11MB1358.namprd11.prod.outlook.com
 (2603:10b6:300:23::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6fcf177a-c323-4c03-9c3e-08d9d4b0c438
X-MS-TrafficTypeDiagnostic: MWHPR11MB0013:EE_
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB0013B216F3ACAF13A4A16B338F519@MWHPR11MB0013.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	eKMwQxy/M31xEt+hL2O90dV6Ht6krY4RFUg7t9CgniaUR1re2hQzlSAuiN+T39kVH6j0vBi6/kU3GPq9hIVDaHEMi9LJdRROZRzmxHhGUe5np6waHsm52nGvwQ3x889U3gZG+WkrlP5nKnHCzQPgGZiXmgijDSxwHyQDnZTV4IHe+hE3G9LNRSUbvF/UhmvJEoIDhIip7Zb8aeh8eI3OuirTFqkwCbVZ0xzh14QxAC+NOEwAgEejEaKBiqIBrpXqxFoxEEuUTsE1lO2NztPwe3hajo+EPirLcASdR7V5Jm/02SMCV9xwPBaVSJeTIn/BUBizO6bvZmsa/NbcuS9an+5mSlwtnh0PZOs7Ec2rSQph7iMR4WHBpduUFDGj7uQ/yrAkRBdrOpt5iSA3CgSZpKK7WVxjeIulKQvY6E68UjqnV4Xr8uUpYlDInOy++BU3URUWNfx6774QU6gvQ25A0tFWYMoFhGjcpEFPiBbdPVXCuP82ovHzHmwsalSDxI5UatnA75xSuLlOZ18Kh6pNan9oOvf1SjWLb0Wpo3tfKVlIYfOGVunqJXtvVlywew9RkSfs3gI+VBsgh5zK5K2XdxW1rHsu18vtax7v07cGF4XVsokACbxakTRBBDKmC39TmI+9tBUZy8TSPnG7IRM7fhr+KRis7uRqAMBPcKB6fQQM1gFz4Vi1ADY6xqHKADT4DwZyDQ5/9YJVm3GSqESoRQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR11MB1358.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(186003)(2616005)(66476007)(66556008)(52116002)(5660300002)(6486002)(6506007)(36756003)(508600001)(316002)(38350700002)(1076003)(38100700002)(83380400001)(6666004)(26005)(66946007)(4744005)(86362001)(6512007)(8936002)(2906002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?qsj1U+sVhbvEcqvgs6X2qimnC22Wo9eysaBBDQiGb+EQUldTe3X4SxowbtWe?=
 =?us-ascii?Q?aAiqWq7HLye1S5m47kJGKLS5yco/BCIGOevvTDAkNUlrveSv6wWaGtqQlCzK?=
 =?us-ascii?Q?N3dRoeH36Sr0tvS7kW/EyCL3/wNFzwrirQ+mS7yRdBk+xQ1eESO3xqw3jLwT?=
 =?us-ascii?Q?UClUMKkaMQ4+pL+kC/GyyRzros34TWHEGzwk3BbklD16mKBBiU59JE1xSJuj?=
 =?us-ascii?Q?BbMu0Zo19tW5FJHkMYtdr6dqE2UfWSaAY/663tq9OXP5XzziNRsLyOb9QO6r?=
 =?us-ascii?Q?CbSSwXVTKtQx64s3mBIoQ3qK8bgJBvj6isgQnZ4gbD1geZnkA90KUpSpgk07?=
 =?us-ascii?Q?8Wlu+1ShNmtLf9mO8V/+IGlEsDmR5W7WJtjNcquO81WKkQqgiaHuM8JD+HCL?=
 =?us-ascii?Q?nzoo8Xe1H8H4lUlTuH7Og4W77w5Rl0wZ3ru8ACNBWndtbPZXOyiOLNsFYfNq?=
 =?us-ascii?Q?wUXyFtFW/CdTqFHWfGMS5h1A2qoi7X4rb+7TXdzzmLFigr5y9B8BGivWn5gP?=
 =?us-ascii?Q?p70n9V5PuQhEYs/jYL1cqsKLABGonrug+/uaFYESG8e9xTffEpaHkKW9WZrS?=
 =?us-ascii?Q?wX7h/BUkAweAtB4IEVNUf0O5py46w/q2bYBFkac0wi5iqYO4zln+UNJUIv27?=
 =?us-ascii?Q?T4rplnphukp9IJyTNh5MfcmBO/cfjehP2Z0BwKLqNA3yQasTxVW1nxEhVUjV?=
 =?us-ascii?Q?kc5Rd578CvMWm91QcA+hw6wfaf0svHXBUZU9rM0A87gEbrUnNKZjv/pVkpS/?=
 =?us-ascii?Q?nBgLby1Ka2wGCQX78+cSBuAzoCuX2hnQoGYEusQ09UOltaV4A0fT5T2qpWO1?=
 =?us-ascii?Q?wAe2KQFG6UG/Ko617owQuXN6vbrzI+JJvBtIteWw+xFV2y/eBuR7I02baeTI?=
 =?us-ascii?Q?7ATTYEdLPoBvMqw5UUXVb1/wgTfYaYQnWrDUxDXsEfOK6V5p/tmSMXL0p/+e?=
 =?us-ascii?Q?7dfottMw3yV9/dHZ/fVrN7bQX8MWtD0oDKa4E2On12s6PLya7qGBXNvswJnS?=
 =?us-ascii?Q?3UFjNjt4FjGKZJL6BRuQZalIDPYG7BLY1i4ovKOQz9Smm8C7xhK1LFU0tXBx?=
 =?us-ascii?Q?uqv08c0LEAtQyVH4ypfVbqpuULCT/BYRi0v/Kuk3DCsboV0miLpdlmG1pVAw?=
 =?us-ascii?Q?frnVGgmg64vvuPmPlyVWrQS3E1IIeY4Ky+jxZU3lPmJp1scvr4KuiPyy/oOc?=
 =?us-ascii?Q?IexwVqYOslehXLxgkvovSbCpUvfBw8xGKAErmBh6aP8nd7Z9JHJx8uiIHOoF?=
 =?us-ascii?Q?auUF4lqgwAgNR/WOYeO3ETp8AiErRefLH3+T5/BPhwPQVlmRVMRfom+E1CT3?=
 =?us-ascii?Q?n+Z9J8RCWddDjJDMIW2zlGa0lBoCOGdFjrnorGU9Zy/Qm3LrEOHqbDhi3tpS?=
 =?us-ascii?Q?D80/0aVe2nK77+cgJkp/txHmKXI3vws9R2uVkvFDI1ggbsMW5J6Cz940XSmQ?=
 =?us-ascii?Q?B3BVPnwsxSI4MD0DYE5Ug0lMzfKfkY71FdJwicvAnNB7k6NIRXGuX/6AN8qD?=
 =?us-ascii?Q?xzeGrmohIYAyn7ew+id6sA54eh+aRj8rPXRun+wArzs7zCgNIevLLGK1YaoR?=
 =?us-ascii?Q?Bn0MEAbufQU7elBoCeQq5VmpObmH5nIKobmc8iBkLU+j/bggnI3TbJYMgxNM?=
 =?us-ascii?Q?epJzdcYA84PDXVQzeGt2iIg=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6fcf177a-c323-4c03-9c3e-08d9d4b0c438
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2022 03:16:32.4450
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 lTu5rIButD9nq2v5pGh6IhgJw1tAbbbLouwMkUveqJD5PnSP78OhKUyr9/cGSIj0DNsKVlYWe4vmAsHQbiNeYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB0013
X-Proofpoint-ORIG-GUID: rWyZ5y9CLwfk2ApqXZ29i8dXRDCKo3Kj
X-Proofpoint-GUID: Ebx9z3iia8DHgokLzghRqBsX45FSDvyu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-11_01,2022-01-10_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 suspectscore=0 phishscore=0 mlxlogscore=692 priorityscore=1501
 spamscore=0 clxscore=1011 mlxscore=0 malwarescore=0 impostorscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201110010
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jan 2022 03:16:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160385

The "?=" assignment to KBRANCH in kernel-yocto.bbclass is selected prior to
the one in this recipe and makes it "master" as a result.

Change the KBRANCH assignment back to "=" as how it was done before.

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-dev.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index 80f62a0412..0d94637352 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -16,7 +16,7 @@ inherit pkgconfig
 # provide this .inc to set specific revisions
 include recipes-kernel/linux/linux-yocto-dev-revisions.inc
 
-KBRANCH ?= "v5.16/standard/base"
+KBRANCH = "v5.16/standard/base"
 KMETA = "kernel-meta"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name=machine \
-- 
2.17.1


