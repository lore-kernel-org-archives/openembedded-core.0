Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90A14C19F2E
	for <webhook@archiver.kernel.org>; Thu, 27 Feb 2025 13:44:19 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.10746.1740663857049658076
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Feb 2025 05:44:17 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=41537a6821=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51R7kZc6010311
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 05:44:16 -0800
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2176.outbound.protection.outlook.com [104.47.56.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 451ptmj630-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 05:44:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QytyoaY1XnbfiBum9nhOKW0w0Mkyz/uqacQ5DMNXsVo+umJaCRj3ah2o61JzjuKFPs4jrvhxnqIhZx3+Vjav7X55XZlGAyVL997dZtctlyrqQKINpD4jJsIlHwnYl6WRl889SfauJVh4sBTkCTyIwAMIQsFX57hy/QXcxdCpBlyP2Mw18ayYnz5ZtHuI9QC5XaPT4hhc5sjE0AinGY9FAaPUAgsEWYXLqxuPOJwo6Ej4x45FL75F/258vq6BgBsTyRVl7ZlkiwiFNAymYXyu/QLN/6jdhTVf5NbpJD0RFWvvJVtMR/Zz92D3lUghou8AdOAhuWPNonNRk1r7qpNL8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/n1RaDGdtsgdQZVfaPpAUru4DouJr4Sf2JX+4rhviI0=;
 b=mfxgfClO4DeFpw5884O7hYhTvfi/VYdc8x7fh5Ry+Ctl8wVOVfmRvnrY3M4H3IaIasS+vDYmgBD+RFFZX0aVr2CP2BxJ9PFT9bjcuHa9c9pRVfjXFtH9lTwaiL6KScOPKQNllK/3moYkbuSkYfbcDKP5OyPk0HVCKknfam5W81bNngK0o7UZGj9fPFGX+2UBeT2YS0DJVw66KXzHeKFlOVwl6C9H4EGCI38XjVxBnm0xtjRyPC1QYKol4iealvDqNSi33+nHrm7ct6vO44Cph1/9XNMYTqvenPk9KbG76Gp+MY+hMta5rhww30QG9H+OCIsUJjvBJBC1nhgZJSewww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by SJ2PR11MB7518.namprd11.prod.outlook.com (2603:10b6:a03:4c5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Thu, 27 Feb
 2025 13:44:07 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%6]) with mapi id 15.20.8445.017; Thu, 27 Feb 2025
 13:44:07 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com,
        Deepesh.Varatharajan@windriver.com
Subject: [PATCH 3/3] selftest-ed: Upgrade 1.14.1 -> 1.14.2
Date: Thu, 27 Feb 2025 05:43:36 -0800
Message-ID: <20250227134340.144081-3-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250227134340.144081-1-Deepesh.Varatharajan@windriver.com>
References: <20250227134340.144081-1-Deepesh.Varatharajan@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0170.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::25) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|SJ2PR11MB7518:EE_
X-MS-Office365-Filtering-Correlation-Id: 365cc858-b3a6-4e02-9f38-08dd5734cec0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?d1GevY/uE4RA/jmqxNUfTlfsiM+//lHBINJjmXS3H2ONpEc3Aj/OXXhHOIJW?=
 =?us-ascii?Q?Fra1tzIASoE1ytqY+c9BME/MqMRhg1IKT+4GE5Uw5pCYdDLgj4jOQj/z5xzj?=
 =?us-ascii?Q?04kzt6WDsbw/lZcPJB0H8O8nvbr3i7nt2qqJYP3WY/ny6v0AtzRRnU8qs4E5?=
 =?us-ascii?Q?XQPrNqwpI3M8NuBj5G9cY2a82ckuT1Atn73Mto7p8LQWIXBsa9r04YWA74jO?=
 =?us-ascii?Q?C1hkOnUd0BssviPNixk3ByXRK+Wnul3Z1WBSpVogP4Ya8yHZo+qH6B6bjw7e?=
 =?us-ascii?Q?pZrU4s68vodonN/NJ5n0SuJvIdfpsCMItNpOAuzxpe7pMDUyBga8Wt3tOk+K?=
 =?us-ascii?Q?INZY3KuPedMW/9r0mlgghMROPDACeWg3FuVlZb0MZLcs49tNw6maixepigMV?=
 =?us-ascii?Q?MpAVAuPEZ6aFN4F8F6AY4R1ls/vik1bmmG2Z61uPS22+hifbbzmzf/hMwYuc?=
 =?us-ascii?Q?GuOw/wmBpEXYvz8SMeY/KwvKeXF4MtjabaYtcRFKZZiyWs2Go+oifgfHpOp+?=
 =?us-ascii?Q?Zf4BVygcTDCTx9hjqBuzRwV8qsacMjJb1rL7Gw+99r20vTu7DhVo+zb6MYqb?=
 =?us-ascii?Q?Z9VGdPirs6ofkQLuhi/JzT18V2iSGRtDMFp4rL8qnzP9z9JVYgevzPPD4u4H?=
 =?us-ascii?Q?iuKguYCf38s7wotj9uKQzLaRBbOPQ5Gpj50NrJ8WfgRMm+wzgH1jTAaiMel/?=
 =?us-ascii?Q?8j9GH2HaNfrqPbT2D3DlIauWlpMDPuBtLF2g7VvLF06s/TkCaN20OrA4+RTa?=
 =?us-ascii?Q?47cnvUIveN81UXMqAnrUK4EvcNyNSwOCua4xGnCh1qXcguZbvlnREFCh0Vfr?=
 =?us-ascii?Q?2cGQRRsxk9DuDUSvIjjDp0mLep4BAGLJUmM1mcgzpJLJQ91WJI/TR5Zgqbqq?=
 =?us-ascii?Q?pYQ3DooJh7PaE77cu7FEvP9h0cr+sB3DuWoyxLt4Q+aQhRYRXYBiERhX5UFe?=
 =?us-ascii?Q?L/Jx+TQOx90pTdxbyr1xQ6zjFou6aEw1yUO2DjU8ftUb8rr9pocNvmBEsUB/?=
 =?us-ascii?Q?C1sY3faEaI4IbeU+rFmWnfnm+3uYkyJMWpCXwqGumT3eaw6SYKbS11Rrw+IY?=
 =?us-ascii?Q?e+6XUtUNoo6cyeKwAO3NmP2WpA059hbzKLeOoE8NsNDK1VIzmBmPeS1CMngg?=
 =?us-ascii?Q?08pAxjsqdyAVmU9KmK+csoHv3P+qC0mUtBoV3hXcjn4djE1KDusZrWbZrrjr?=
 =?us-ascii?Q?AZGSFs0RGhfdC2hZxaNhO0VQ6XvtMlsu3uhQxsp2ndUJpQirhI41O6Oe7oXE?=
 =?us-ascii?Q?0Ot46fc0SqX3EIjiuJ2IuN8BOALZBZ1zh6Q/PbbSkw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2ZBveUFYRRM1ac6Nruyc2sk4oWG+G7cwwGueQtUoddg3/KZhA8lIIQ6s4yix?=
 =?us-ascii?Q?f3tLuuoQFF+CVaHe5VTlfuc94Iy1KX8gKiBO9lSVa5SdGRu0W4me75OsDYfe?=
 =?us-ascii?Q?xUPF9VuFvP8WN7x7nX/LSOTiHB9LE9JMegOKiRcsrThuDBr21DdH8e+VawFU?=
 =?us-ascii?Q?SwXLI1ldRw4QsQ7ttUm9rrdHd25GYxFUdb4SQCbCGf6sP2QDtKLVIxO+n4DH?=
 =?us-ascii?Q?E++5vT4nr5GWlF2hkZ2+FS5QIoxRxEvRqXdoFzdCjBSv9cBcqlcqq2er3jzS?=
 =?us-ascii?Q?wsq0Wv7Z1OGRsuh6VpbLrUGBhg0Th1fEPqLxjh7+8BvB4vDgAUCBdKqRfWO6?=
 =?us-ascii?Q?eUWL/fwetUuMgegUt42AD2ZPdush7uMApEYOtm4pcsLu8FIfdq76qPsYK9NY?=
 =?us-ascii?Q?Qynln/K1iRi5/69/d9EPQ7U/F2gXKip8v9lLfcveh8J/1xDYUIJlBiaEAkJR?=
 =?us-ascii?Q?ba9s6ajvOFAStDBQLdwR+CY/rLkejOdZu8XUV6G3Tbb13ucDQExqcATNfj1u?=
 =?us-ascii?Q?F6saeamFB+Z6SIb1GJNVCD7DYAB/Ihb/H25GITx7mErA/8XMLQgb6w3jY7Hk?=
 =?us-ascii?Q?4mnG2GlZZkbne/YfwC7mOFWtFawiuXovthxKSq2DPbSwPQ+XQbzvtrxUVAN2?=
 =?us-ascii?Q?yY4S12MPyJTspWQTgJYH6a+ozlAO5xSEsMgpkueh+aUAo0QmNIKJJlGX+pYP?=
 =?us-ascii?Q?u4PAShmmvXRWpy2/oHSUA4qSTnDphUW9KdIPL4mUm+E7hs4NKrdpXtVfARIM?=
 =?us-ascii?Q?S5u6p65vaOW+GXgIYl1Dk94Refz0Ks0U7ckbc2nE9QzoVLr6yq0e8et6vWaS?=
 =?us-ascii?Q?KRTYJmofTynsd42/ZAuSeIp+rcLWeHJRBphwCGKve7s0Tt68yvzBedfubEqX?=
 =?us-ascii?Q?gkENhgC6z+uBHa+s9R7NFeCt+8OV2gu9ucFwJ3QYwtLRWUOeCjBavPSNzmND?=
 =?us-ascii?Q?QfzmlTi/WFU3nG9zADP/YGPtTndtLtB84r/+QHPzmCBTthuinl4Rz93cOPDC?=
 =?us-ascii?Q?w83ep290q3SAICXx95Lt5IZUTRQQzKEUQGDT/3SlHFmnTVbu10fm+8k8QCCJ?=
 =?us-ascii?Q?PZqOyz6BaF/71DaA9/9+r+Dvze6ElagjbH6YRRuZnt7I8jywzVDaiFkJlxxs?=
 =?us-ascii?Q?+maPKqZYi3gOLGffmPUNPIA9YvXQMFPNW7jLDeqMf013sl8Qm7ueICEWaZ/8?=
 =?us-ascii?Q?CAjUb2LwdtrUkChg2YmL4oD1aMUthR34tBzABhPR+MyyD7ZHgKMt+M9zOJkh?=
 =?us-ascii?Q?DcdVS2rUZadlXkmEg6vIu3tHozl7wp5dcm3mb+gQC/FPWxG8b5enYTrQiX/+?=
 =?us-ascii?Q?Gz9mQu7eRtPVhXKwLbpXIB8XtsYU8N5WjU0iQ5syBt/Rotz7+lFoV2M59nZ0?=
 =?us-ascii?Q?xSsZZg9YvraOUXENpKcV/XjSxl5z+R6oLf+2ZaDDiDytPGKal8oZWkSPUGkI?=
 =?us-ascii?Q?PsMx3kLzf0vRgbscuRBjZxhRD64ZiytJYKpz8II6gUe10fAAMeibWt4/42bn?=
 =?us-ascii?Q?lOc1iUivB9qzrp83t0tGPKvbeRr1K427JVZuIKhkoCbXKt7RzUq2y6koVweF?=
 =?us-ascii?Q?yvIOyXok1MgbuY8rSxvfWEKwItnK+pvorfUuDpOGMTAghK+czOzrKCdNn43X?=
 =?us-ascii?Q?l/Ki5cAhEjvbwBgXK6eoCHI=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 365cc858-b3a6-4e02-9f38-08dd5734cec0
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 13:44:07.6375
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Jee6DLzwdNS2WfvlGzzLLKzgb1U4HthbMVDSFUmm/8915DOp0Reg3vYpy8jMESVPofVI8RPyD+MWsDHwMEfFBzfa4DxPsJVwUuL8aIlZpmxi6/aWNlxROixDk2Wihu/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7518
X-Proofpoint-GUID: sTGPbN2qGxCfXjT60RCABBJuk-j7SR3e
X-Authority-Analysis: v=2.4 cv=TuEchCXh c=1 sm=1 tr=0 ts=67c06c30 cx=c_pps a=/1KN1z/xraQh0Fnb7pnMZA==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=T2h4t0Lz3GQA:10 a=mDV3o1hIAAAA:8 a=t7CeM3EgAAAA:8
 a=8Ybfd2U00S_-cJUA1v8A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: sTGPbN2qGxCfXjT60RCABBJuk-j7SR3e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-27_06,2025-02-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 adultscore=0 phishscore=0 spamscore=0 mlxlogscore=954 priorityscore=1501
 clxscore=1015 impostorscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2502270104
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 13:44:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212007

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Upgrading selftest-ed because the current PV version is not available
in https://ftp.gnu.org/gnu/ed/ . Hence updated to latest stable version.

-----------------------------------------------------------------------
ERROR: selftest-ed-1.14.1-r0 do_fetch: Bitbake Fetcher
Error: FetchError ('Unable to fetch URL from any source.',
'https://ftp.gnu.org/gnu/ed/ed-1.14.1.tar.lz')
-----------------------------------------------------------------------

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 .../{selftest-ed_1.14.1.bb => selftest-ed_1.14.2.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-selftest/recipes-test/selftest-ed/{selftest-ed_1.14.1.bb => selftest-ed_1.14.2.bb} (86%)

diff --git a/meta-selftest/recipes-test/selftest-ed/selftest-ed_1.14.1.bb b/meta-selftest/recipes-test/selftest-ed/selftest-ed_1.14.2.bb
similarity index 86%
rename from meta-selftest/recipes-test/selftest-ed/selftest-ed_1.14.1.bb
rename to meta-selftest/recipes-test/selftest-ed/selftest-ed_1.14.2.bb
index b92740de32..8acff71009 100644
--- a/meta-selftest/recipes-test/selftest-ed/selftest-ed_1.14.1.bb
+++ b/meta-selftest/recipes-test/selftest-ed/selftest-ed_1.14.2.bb
@@ -14,8 +14,8 @@ bindir = "${base_bindir}"
 SRC_URI = "${GNU_MIRROR}/ed/ed-${PV}.tar.lz"
 RECIPE_NO_UPDATE_REASON = "This recipe is used in selftest and shouldn't be updated otherwise"
 
-SRC_URI[md5sum] = "7f4a54fa7f366479f03654b8af645fd0"
-SRC_URI[sha256sum] = "ffb97eb8f2a2b5a71a9b97e3872adce953aa1b8958e04c5b7bf11d556f32552a"
+SRC_URI[md5sum] = "273d04778b2a51f7c3cbfcd2001876bf"
+SRC_URI[sha256sum] = "f57962ba930d70d02fc71d6be5c5f2346b16992a455ab9c43be7061dec9810db"
 
 S = "${WORKDIR}/ed-${PV}"
 
-- 
2.43.0


