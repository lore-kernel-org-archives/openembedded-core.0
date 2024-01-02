Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EEE3C47077
	for <webhook@archiver.kernel.org>; Tue,  2 Jan 2024 15:06:58 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.30758.1704208016193793955
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jan 2024 07:06:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=OmicLpgr;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1731eb5038=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 402CfGOL003864
	for <openembedded-core@lists.openembedded.org>; Tue, 2 Jan 2024 07:06:56 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	PPS06212021; bh=VgZzKazbAj83V1rOoVtzN+eXlDMzXxq3Ph1VhusPi1U=; b=
	OmicLpgrsNFzVIaYBTAwise8fYiBN4ChENXzEC7Wk8SAFJY8XCg468+TiXMg2EIo
	CIlJCVImnQtlnhTfPlJP/MxQgE5ZAfSJWrM7n5/jwceNdQWd2Es3yyneUygyOJEG
	gtquGv19EItibwNuWljwH9okYrOZIti1Ai1SZPHI4nea1XOoZtFesc5dkYFkdKXv
	K4cbDT/V4n5QC6JVtx4Qy7jbPW5KVN2S24/9+nkSVMP4DA05n1UrjvgWDBBDA2VT
	GX8vYYO/rPUcr94shfCr6eG8Fznyt4cWtiQxmQXUhAwUXl+BYDxdWcdTYAOJNcxK
	oCRKb+B0xKB2lMwF5bvBGA==
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2040.outbound.protection.outlook.com [104.47.74.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vafc4apw2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 07:06:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FU3iNPSV4mgmTO+kSds/m0n55aA/p7xqEruUKEgo8fQ4sOLhqC/w+X5ATATuTjafSyyOEkx0vP7b3T7vKClVnsT24nKRtVLk0Dptv2UhqOqa9/ppAX2KWlt/S1NbECGc4Ty3pK2WwV2TDJt1xe6m1eP1tObTqMEF1KEoCFWoAyf/NnjgqqnVadBy8BV5PpxNNelr4e7wE+IkFrkUFqNvTnSoH/qwd03uf//9DiE7Df+UkhC/dOMUWOTS0Gx/UM9rn7r0MJlY/kguIJFCxnQWOakjywsnQ7UbNTxavq1xQpLo73aTZbycafxuz7zY4i4l0aauNr3Hd2f0kfk6FY0iwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VgZzKazbAj83V1rOoVtzN+eXlDMzXxq3Ph1VhusPi1U=;
 b=AX10vDnsBfhBt4XX0t2q25W5viOiIMA0AryL7PNhito2lhi2rGfsbsHvJZoFJrh2ebF2C903UJfjWhOefJxFqCK5FJxVWzyqRxrTqyss6dkkd4VkJxKH0wpKix2HwH0zUkNsoHDJfQpDgM6hxwNVzT1gRVN7KYMimG7sMSn3PQ4uE61Nm8onLjO0JIqU6ivGJhu50hTUhLcSG9kGWdOych9T1COBDBfRDKaEvGuU82f2ysHR+H3FQfC4/97vVkfGFloJ288gLdpZZNRS+uVb1GQ8a7OTCWG2IPCI1yKSp59ZGEw29/1/xOBZd8Uigx2OsNDEjy8ynlyRxJFhafWBEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7484.namprd11.prod.outlook.com (2603:10b6:8:14c::10)
 by DS0PR11MB8135.namprd11.prod.outlook.com (2603:10b6:8:155::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.25; Tue, 2 Jan
 2024 15:06:52 +0000
Received: from DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::c56:aece:e7ef:6cb3]) by DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::c56:aece:e7ef:6cb3%3]) with mapi id 15.20.7135.026; Tue, 2 Jan 2024
 15:06:52 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] libcap-ng-python: upgrade 0.8.3 -> 0.8.4
Date: Tue,  2 Jan 2024 23:06:41 +0800
Message-Id: <20240102150641.865548-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240102150641.865548-1-yi.zhao@windriver.com>
References: <20240102150641.865548-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYAPR03CA0017.apcprd03.prod.outlook.com
 (2603:1096:404:14::29) To DS0PR11MB7484.namprd11.prod.outlook.com
 (2603:10b6:8:14c::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7484:EE_|DS0PR11MB8135:EE_
X-MS-Office365-Filtering-Correlation-Id: c9aef1a5-38cd-483c-3664-08dc0ba473a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PqH7GLHA7E3+oisEgkzGzj7eOGJ27pHaQw0abNp7gSvLM+Dp63sSfiCBfNqQoAQ/wQnneHDXukImfMCN+MaiYha6FDGoiofLN3lukWl62YQ1zZ28SCwYgSs/Sqeou5d5Fk2EhHfuBa7J+vevUQS+6jx4NrVDywaBqWkO82S8MdGo/VklxaIBcfJGaIhe9FrxIDikqdjgWZbsrWh3I+j5cYa5FQiTHvVyQC4YsfIjbN1l8EDWpfxKDrc5og3UjjpiGphr+qtd4VQVikMO+3QW/mr3PMvohXj32+5w+h77vOpN0fVW1XU5h6aRUEX3uV6pGZ903IVOIPWkzdmJ2EJK7l2sGRstav2HveqpuK+BSleFZ7VyKtxIugFd8XWjTvu/TPZ7qSHp4qqVoC1tVyDC1aFVRW2h47NLfB0UPuAKMNv6X0kV0n+Xm9sL/R/JXx4eAt3kkIgCrvR2BAE/s/ZbzhgI2691Y0EYbIcHntLMkRWW65VhzU+yO5n2+iFaUSqEqRHMssTwLZJCegB+j1Yog4OL5+f5xY+9xOQSpdCjx3dsJym7+Dpooi9z9F1ofCWjnI0CuCsi8/ZobYtw6Wsgpnb1VVn72+PZO7dztPozTMSrdvKL2Qdb95sBLQhYZjbT
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7484.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(376002)(136003)(366004)(346002)(396003)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(26005)(41300700001)(1076003)(83380400001)(2616005)(38100700002)(316002)(8936002)(8676002)(2906002)(44832011)(5660300002)(478600001)(6666004)(6916009)(66556008)(52116002)(66476007)(6506007)(6512007)(6486002)(66946007)(86362001)(38350700005)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?br7/8x/V3OmFpMr1nrVIyYhmeF916D313GZFlMaH+q79REj+qgUtZPffYKjQ?=
 =?us-ascii?Q?h2vVyG566wjTPoobj+Yhze6mRI5A+ONQjdR1Tt4iHjsxAZsI1GrpHG+CpQtr?=
 =?us-ascii?Q?Bkm9C5F14Y7HBQuqufYu8SeNur0v/nHDHlE99wuXDwDAvOf2KAsldg/zeaGC?=
 =?us-ascii?Q?Y6vRdQpecWY+ADeILIvbd5rxsn9M14Fk7+kZg1iOMtxdU9Hc8B4A2Kg22crb?=
 =?us-ascii?Q?0k0Mzk0eoD8GKXA0s7cNFifV3Jqxh3pgsIILDw0BhKsQRTGy7tWt6M79RA8k?=
 =?us-ascii?Q?a4xV4P7Jx2nshWO/Ceri0H7Fsn+CqWvZTXCQUZ/rLoNXzb04gpRb+GhSPSg3?=
 =?us-ascii?Q?3XuoXBNKNl6CMQwf4k4tK7R22TPWf8MyOL+yKpYR1xFKivKljEUPK+9d17U3?=
 =?us-ascii?Q?0vmerH64yjb1wLOaQBt4N1+6N3K+iKeoEg/kmbcBceeyQds9nsBjhlPOI4na?=
 =?us-ascii?Q?MbJQHfkLzO3K2W0kBoUL58drSBmRoftaXIAeBDWBLx+/b6mZEBvgkap4pF9v?=
 =?us-ascii?Q?tmqDXiGmLc/W5HUfIEBwremrPbKNXqunfZChp4196CDjqOuq910e0KoZnYNn?=
 =?us-ascii?Q?DpZ6JqSA+JH1BckrZw3KiK5NVlWoZktKq5yC91EWRIvfu2nnZD54uvqEZ5X5?=
 =?us-ascii?Q?Szm1kAi0JNQxQ4W+IT1WPln2bqPqwEUEheO7mJF5AhBT2nFGXvLXseijIDvP?=
 =?us-ascii?Q?xrFaDhxIqa01KuW79ZuPzBzILYPDsr7Wckr1g/W0RzyU14lKsbts0xNVotco?=
 =?us-ascii?Q?T6zKe6C+hGyRJ26lbFk/j1c6NJ53d/wS71puUHuD8eeP/1kxFxMo0Z0IUa8A?=
 =?us-ascii?Q?5vfETpzwx+/89sbkrBlSb5mXW5SUyr/YmctsiB09ch/MHMlLdRaJXFayWmxw?=
 =?us-ascii?Q?Ya6/+YMbi3WFglRvFPdvrumUY8rBMnEiKsp/Ynsx9XTFvkCvnscITEAsQ2DC?=
 =?us-ascii?Q?hCUePGw129p0k0wMz75UHJ677uM2qFFO+/B0/tn2r50NvHxIDs67FR0hwnat?=
 =?us-ascii?Q?cnwc082zyi9NkcBxu/i/StEMVz4l5MhypYUYwcQx9fvT98JH+jiSMfoxq9xk?=
 =?us-ascii?Q?T915kgmZksGiX4ut+tMz9WeBYjwvtbk0JH6YUzYh8Xe3F+RlvGPjjbaSgRKO?=
 =?us-ascii?Q?sJ4S155osWR/PjXYSYc6oElfxZSFNvfgLInmTN9d9iustsYz5TeGq35/joSq?=
 =?us-ascii?Q?OX+lkOsYW3eefaMxNB/D5WcV+fmd2nGoNMShscNtsyNdvcwXZEsmO4sB62uY?=
 =?us-ascii?Q?l/x3o1zHcuA1zkS192/ldEm0AzkUl57VKtEiXIdI3nFld9iWwIuXHvCDqtVQ?=
 =?us-ascii?Q?clNSbMxTpRfdOz01Ss2ytxnuvGgUm/6vAviWV7n6s7OjCuWCD9hVymLVS8y0?=
 =?us-ascii?Q?Bq6DUZtEQpOfcclWaMW4No/hP0PkuYwVFVBNDlwNk+At9NRyaVndFWebavSV?=
 =?us-ascii?Q?Meio1uzOyadPiF2Z4bB0XYrnl6RFA+2CPkYvgTak+KYhZIsZ/P1K/rUEWvM6?=
 =?us-ascii?Q?3/nDClhotyRtSbUheftom5FRmspcRzHNEwchM2H+bIGPSQ62vxqMweDJwgLA?=
 =?us-ascii?Q?5fooRievzwav540lLktXt8UG6O0cAkpq6CjU69mY?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9aef1a5-38cd-483c-3664-08dc0ba473a5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7484.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2024 15:06:52.5679
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OP0JMeMq3TeNMMJneeghDTruojxoUsi3/8Pj0GUo9S4PK+7TFLZK2BxZOVEi3DwZd2Z3ANNP/sIqTBw7VhhRVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8135
X-Proofpoint-GUID: RMHkrmh4yq-eC4O93cWpSnJTJAnrSX9L
X-Proofpoint-ORIG-GUID: RMHkrmh4yq-eC4O93cWpSnJTJAnrSX9L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=851
 mlxscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 adultscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401020116
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 15:06:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193237

ChangeLog:
  - In capng_change_id, clear PR_SET_KEEPCAPS if returning an error
  - pscap: add -p option for reporting a specified process
  - Annotate function prototypes to warn if results are unused
  - Drop python2 support

* Remove "--with-python" option as python2 support was dropped.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../{libcap-ng-python_0.8.3.bb => libcap-ng-python_0.8.4.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libcap-ng/{libcap-ng-python_0.8.3.bb => libcap-ng-python_0.8.4.bb} (93%)

diff --git a/meta/recipes-support/libcap-ng/libcap-ng-python_0.8.3.bb b/meta/recipes-support/libcap-ng/libcap-ng-python_0.8.4.bb
similarity index 93%
rename from meta/recipes-support/libcap-ng/libcap-ng-python_0.8.3.bb
rename to meta/recipes-support/libcap-ng/libcap-ng-python_0.8.4.bb
index 9e0ccd55e3..4790134ae9 100644
--- a/meta/recipes-support/libcap-ng/libcap-ng-python_0.8.3.bb
+++ b/meta/recipes-support/libcap-ng/libcap-ng-python_0.8.4.bb
@@ -11,7 +11,7 @@ DEPENDS += "libcap-ng python3 swig-native python3-setuptools-native"
 
 S = "${WORKDIR}/libcap-ng-${PV}"
 
-EXTRA_OECONF += "--with-python --with-python3"
+EXTRA_OECONF += "--with-python3"
 
 do_install:append() {
     rm -rf ${D}${bindir}
-- 
2.25.1


