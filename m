Return-Path: <sundeep.kokkonda@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79BFFC04FFE
	for <webhook@archiver.kernel.org>; Fri, 17 May 2024 16:19:55 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.153.1715962787652221373
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 May 2024 09:19:47 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=586761ae34=sundeep.kokkonda@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44HCiSJQ006232
	for <openembedded-core@lists.openembedded.org>; Fri, 17 May 2024 09:19:47 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3y23xynn3r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 17 May 2024 09:19:46 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 44HGIvTm006630
	for <openembedded-core@lists.openembedded.org>; Fri, 17 May 2024 09:19:46 -0700
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3y23xynn3p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 May 2024 09:19:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RWVDJcNkACsKrKelVTMOrmXCRv/b694h3dKys6VyfAAe/jiuaYQ5XnuTnyvfMy9S0naxiVV/PsBBTnHStx0bdFtdD4asXxOKV3SKObFQ2YGl14O9XmHXxGcoxocs0Q9b4wVV5gcluGtzJ9PqjFk2Y3xTCQpLMeFheKg6Zts1+xOti1wJuX17gfi1bzRYcrNT5LTkSmnU6/I5MLYtjapnyiEYWb8ulohZBu6dS3NiCBKUKJOQ0hJ1YaXhbR2NBlTTAC3P7ajm9BbLvVH/8GHuDJ78v5YAr1WMMWIw9UNeWXD31h3fX+c1fGG4fVCMjYUesIxGpKP4SIUo2/EP9O7IuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I0cBqH4ZuWXzx52cl7R7TeLKbFf0m9GdZx8wmVej7oY=;
 b=FJSYRvhwd1zmMrHBTWqDG3EgyUiTxpBmawLTiVRaHpErfGV/N9Bz2pcTVWXBXsWkTAEXYTRti3GQkBNRt6YoZGRv39kIJ07L8eBaXRHIBTjmIwRxtgsII4xuQpCs7GVOMWKU6lXVbsC04k1EesvW5Q91IdQaPC3SuHy6JkOU5Ve1cCVhR6F7WghNaao6NKpjxSwRMBPX5ZdaKPXeeQH8SQfNVyk0TMP5BrKeXZeJTWpXPqX8V1HQj5fpxGdXRYWBuU80GCUyAeazqxSJePogzloFU2jrAjkb9CZx7WlFOTseSE/LHoIkUi0yid1hNdNE1HMPbANkrBb9q/wpF3RZCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BYAPR11MB3063.namprd11.prod.outlook.com (2603:10b6:a03:89::11)
 by CO1PR11MB5140.namprd11.prod.outlook.com (2603:10b6:303:9e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.29; Fri, 17 May
 2024 16:19:44 +0000
Received: from BYAPR11MB3063.namprd11.prod.outlook.com
 ([fe80::25e9:e6a:756e:dc99]) by BYAPR11MB3063.namprd11.prod.outlook.com
 ([fe80::25e9:e6a:756e:dc99%6]) with mapi id 15.20.7587.028; Fri, 17 May 2024
 16:19:44 +0000
From: sundeep.kokkonda@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: randy.macleod@windriver.com, naveen.gowda@windriver.com,
        shivaprasad.moodalappa@windriver.com, yash.shinde@windriver.com,
        deepthi.hemraj@windriver.com, harish.sadineni@windriver.com,
        umesh.kallapa@windriver.com, raj.khem@gmail.com
Subject: [scarthgap][PATCH] binutils: stable 2.42 branch updates.
Date: Fri, 17 May 2024 09:19:26 -0700
Message-ID: <20240517161926.3936604-1-sundeep.kokkonda@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR21CA0027.namprd21.prod.outlook.com
 (2603:10b6:a03:114::37) To BYAPR11MB3063.namprd11.prod.outlook.com
 (2603:10b6:a03:89::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3063:EE_|CO1PR11MB5140:EE_
X-MS-Office365-Filtering-Correlation-Id: f9075e5d-59f5-450c-19ba-08dc768d29c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|52116005|1800799015|376005|366007|38350700005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?xwakixVinEEaCk2neUIxBWFE66FomJaq8CQVR1wwVBcwA1wqvba3YCkdqg1G?=
 =?us-ascii?Q?oeQ7HyW7o390gg1tEpRU27SxqJHouBiPIO1RtEf2a332BkoLnNOvlUZb9Mjj?=
 =?us-ascii?Q?FGV/qtzv6plFjkFBhgAgis6tD8CuLaHK07PWpe+P7zhTZ79jYIjXPRYdBPEq?=
 =?us-ascii?Q?U8utWHTOO7jsxIxWLnVvis8PMuxIiG8D1MJSCjK6vKqg02t4TfKZM4NT+9Gk?=
 =?us-ascii?Q?FjyR2n8OuruKJt9rXvHuwWfbPPWUZU0WYAAMxf1FqZdB6v3e2ejlweTvKU51?=
 =?us-ascii?Q?oEvquV7VEo9tRGUlK2kdOQVEy9dkzdLQZcCS29w3rNNpyyUpN735yL4ky9xh?=
 =?us-ascii?Q?fd0xqWfB7VadDrz9gVlIsX0BeCtFEtvAXUG3lvPJ5NnDBepQyWs9za96Cpe+?=
 =?us-ascii?Q?u5I7M6Mz0r2IJ4yNxRvOEjeyYp/zOIjoIO96vVTD9xyEzL24xebJfxt27WXa?=
 =?us-ascii?Q?roWPc+HbVMIjum2qe9/kqW1uIZ9G9buv3cPNQ0kBzpy+z/MmPZxGzvR1AMc7?=
 =?us-ascii?Q?HXkP561/JvCw2n/W8Xk5Y+MQC1L0BuBuVE+0c0CmjgEVWk8m47Fzm2IBwLSk?=
 =?us-ascii?Q?EyvShIFY8zo8SJs8NwL4vmCMuWVj3r0MLsWAbab2cO3dTGd+oclqb8NEUk2m?=
 =?us-ascii?Q?pFNDPVIlb0QBFB/gXYbj/qkh00Qwm45r2GfrdS3CRcqYlI80Lx4NhQ/raZF4?=
 =?us-ascii?Q?de+kxaqM47B0COWDWvKCWWP4rdZONQ0n54l7c2VO5xwkH1PtYL4ODQpVGRbd?=
 =?us-ascii?Q?Rn3LYeftPT6MNQCrUU0MFztSVHSUUa+DXxhN+0Q7LGMQ07zPDCCidlos/TCD?=
 =?us-ascii?Q?HUUTWoIBy7svgEheLV5Aj7UKxo30dYpwMheCZq/rrpL2hbJRb6oP7XPLqEO4?=
 =?us-ascii?Q?DFiRABLKR9gDzDLsTYJ8XSZh6xCd+VL3sPj4N0Mp69UOrpYahSnWeg5CObsu?=
 =?us-ascii?Q?LokiVACobV+t4l6UIRG2rqHHH511G6gur2p0pHVJwBgF02iRCKNy5JvYzI3/?=
 =?us-ascii?Q?JFu9HmbcBwYaJi4FOWBWXPg6+nlkMv/9grUUlIuwTtcIGQoCZJ1gUZan7P1h?=
 =?us-ascii?Q?PZ0bOeNmEUCXB2zjcMY+C1w1J8YLpdnWAZebRST5u/s6J9mTKqtw0yZ8npih?=
 =?us-ascii?Q?pscrA/cilpEhsKPBkM+bsM4Sa2DWYUApwogxzgS6YkQaShuAy99hlwK90rWi?=
 =?us-ascii?Q?bcNkCK3U4mF3wImeNF4RZd6x9uxXzaQixpJ2vt95+n+zgIHTws1hw2GNFYJ/?=
 =?us-ascii?Q?FKhN8xbl00LEiA8R5Gxs7jA5B3z23M1qcaxg0i+eNGrr9014Je+vH8arzGHs?=
 =?us-ascii?Q?jlhw1ggZFN6e1bnPQ5gc9ThyZNIU0IhntHvjuR462H1v6Q=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3063.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(52116005)(1800799015)(376005)(366007)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?AjQFEAlDgsIWPwMbrOavemvdQx2Ha2iDD2ssUJn5oBpmlAxG/w5qhH+xhXbN?=
 =?us-ascii?Q?wgEgsAh3CTo4EXekNfBY4MhbvHw5BM7vgJOou6hJxaDSsp6uCI+C0H99jJFm?=
 =?us-ascii?Q?b4ZII/5WYT7NbEie20DX/FD9C2hRcjH44XtG4eLbz8vQ7cRLrY+QLPT3sx6k?=
 =?us-ascii?Q?ceGYfQrtzAEthFsR06e0Cbh7nTHR4sJLpPuEoumXeFOsqhnoEq+qMH8dOXbp?=
 =?us-ascii?Q?CvgoF5jBsX1MSBo2/RZz4AyQaaXxkaHbrZkFFLAlgtrKDg35tCc99f+nk77t?=
 =?us-ascii?Q?OpOmbcxwnUCSKT+qAQa2DaHvp0gcDa4Em1B5Z8bqChZld3Gq3jnAQrC5TKxU?=
 =?us-ascii?Q?0pVK86uXLrT6iFHPBEqeNPEPZ/qkAX6J4fH1Jbpy/M7U8Vsbqc42JnVeomTc?=
 =?us-ascii?Q?GiMaQGq1DI7fFLQBpyWrzX2jZPah5urF/dybyC4t/dGH3WD0FW/DqXO1eAiU?=
 =?us-ascii?Q?n4h126+oVnOiutqBI+zt296rKyPaxgtO7vkjHo/NMke3mxymeCCBfBxaW046?=
 =?us-ascii?Q?w4d+uxFEM+73ifclJLNAipI+djIlFXYpBujtRGYI44JL0H40jSCJofyh42e8?=
 =?us-ascii?Q?5xlSzgoCNYvw0MgqzAPwhT/kriqQ7orSNF+dp8ADRbv4Ih/YDO5I6l+117Kv?=
 =?us-ascii?Q?N7vw3hMtNVGoJQLf73h14Vi0Yryx9i88cHiXzwW2o6p9/VpXhKtCrnaPAdMj?=
 =?us-ascii?Q?YvMscZuLgl+4a5a0FToLBx0slh6ShM2DRWNP8X25Cqg4PmXtL3XU6FBH7MrE?=
 =?us-ascii?Q?oQGBMHz31rRZkXNSyulNXnQIH15JRXkn/QzLsw8NdoEA/AiXhSc8SeiEABKW?=
 =?us-ascii?Q?x5ooBNuVZ//LGcU+4R7xukITY2iaAHiP5/G4FuIm54u1ungofGojW2JNTePD?=
 =?us-ascii?Q?AAtOhziOeMzX9VAr0Ck7M0bfKo4/5nvWjys32qO75hA2L2xGCMNtRjaBslW/?=
 =?us-ascii?Q?/H/KZAjvi6MPjAoRCqFePMz6IfK0m0Yg1C4pIpbVtoABf2o4GtD4ldGusSj5?=
 =?us-ascii?Q?znd2yQ1oujLYm7H2PsaU/0YuZ6WLj5fvB7LbOepyXKMjnK+6WO7o7KCe6pBy?=
 =?us-ascii?Q?dZi/9bxSdFn/Ng/xlCN2K8Ng5cKijcUk9cRf0R1sGD+rdlRwXNUc+tQQVhCB?=
 =?us-ascii?Q?UilszRPQ4AuFvSkevmUb8np+NLsUY5ex7b1oLTWk91CP3W2gj4FEL5QKMKbt?=
 =?us-ascii?Q?6xIOPJ3+UHySfSIHvg+9rI9yugRBRy9o6VYwxJ+8Cwxj+DwWCtvg1ax2aAb+?=
 =?us-ascii?Q?hGCP4uiNcui2MZYGk4+EOuQ+9mb16BRikA/BHwVDa5hz0te57vStFtWSickg?=
 =?us-ascii?Q?tbcGe7L10rg1/GvPjKk6fPR7AAsooLzkeMyd7oWm9dBN9qZ6p657vRjvs6Dd?=
 =?us-ascii?Q?OLWrP1deMDSFjaqFI+kgUEQAhi6aksnOrb8gz+dYa4/N/HGYU9nFIRb8I8fk?=
 =?us-ascii?Q?RmJ33dEA/ClGi7Q2MSKAFy8dhwxTvw/H1BcsEOpA4H6LK/Ya5nzabhV5v05n?=
 =?us-ascii?Q?vPeM3erQ7P/7TO4YO5YsBu0gMikDpaoCenuiq0j8uRae/Z3G9xcjPiVB2+lO?=
 =?us-ascii?Q?pbl8TxRPBPNfrgThNHrsGNmXm8Gnb/28agzGtT4BNnRg02lNIPX/6v/6uXVJ?=
 =?us-ascii?Q?mAq75ZRDUFb9SwWrNbwpMwI=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9075e5d-59f5-450c-19ba-08dc768d29c7
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3063.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2024 16:19:44.4016
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AL8E4GAD8qdZivlQzuGgPB2RTSXClgX17NgZYwDFVWjFk1m2C9S1H1sQhK+tQ5eotU1GPXOd88ZZszb/S8xWeK1423D//W3jGV0xHv12laU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5140
X-Proofpoint-GUID: FexDppYosLNhqtQSubWZZ1R_DLPfTFFt
X-Proofpoint-ORIG-GUID: Xz09Adjr3rql7Frg6CFnIlFFd0J1cHXx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-17_07,2024-05-17_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=632 mlxscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 spamscore=0 adultscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405010000
 definitions=main-2405170128
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 May 2024 16:19:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199517

From: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>

Below commits on binutils-2.42 stable branch are updated.
6224493e457 Re: PR26978, Inconsistency for strong foo@v1 and weak foo@@v1
d125f967537 hppa: Implement PA 2.0 symbolic relocations for long displacements
884fb5373a1 x86/APX: Remove KEYLOCKER and SHA promotions from EVEX MAP4
d816fda3cbd aarch64: Remove B16B16, SVE2p1 and SME2p1
cb11047e34a Re: Move bfd_init to bfd.c
818bcf40efb print cached error messages using _bfd_error_handler
831be495ef1 aarch64: Fix the 2nd operand in gcsstr and gcssttr instructions.

Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
---
 meta/recipes-devtools/binutils/binutils-2.42.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipes-devtools/binutils/binutils-2.42.inc
index 3b6f47d4ce..b4d273c9c3 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -20,7 +20,7 @@ UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
 CVE_STATUS[CVE-2023-25584] = "cpe-incorrect: Applies only for version 2.40 and earlier"
 
-SRCREV ?= "553c7f61b74badf91df484450944675efd9cd485"
+SRCREV ?= "73b22b4481e85635eb978585f405c4433bcc0174"
 BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=https"
 SRC_URI = "\
      ${BINUTILS_GIT_URI} \
-- 
2.43.0


