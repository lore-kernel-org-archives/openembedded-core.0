Return-Path: <Deepthi.Hemraj@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79F83CE8D75
	for <webhook@archiver.kernel.org>; Thu, 19 Sep 2024 10:23:12 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.16343.1726741385806683679
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Sep 2024 03:23:05 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=999241a6fe=deepthi.hemraj@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48J5rjdr002641
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 10:23:05 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2175.outbound.protection.outlook.com [104.47.58.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41myq1wdjr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 10:23:04 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ao/KslqgRXHsu3qQnLS6gBvb6m1jYr/jbXacHkXd/87z2lU/luw0zd3pslEq1SsPdVSgAzuyiC8nEDjAiH3lsUrJGJjvBRGT5Y/+hFJP1tcpmEO8ByLKSZ+E4PZLFf+0tHv/+lyYqNe9Bn9M3u9JPtM3zgwJqgVHI2wjo/MAw0xPlMsv2xuJjPbAzo6G5GaSGNKWalQ0ynUM8Y64cx1eEzEGi6ENGVIL705mPxi8K4whXfHWBCuzgssd3UQJKXGdsxP4xZuzisiOY+tm3su0OZ+kbNTtmo1F6mP8YzEvVAs1fKpuJzBH/l0qm+9R/WRVSetr/r+/K9WhAY6go8mdlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GKedqg7DOFimi4H9Vh/nFh7Txxgh2pVHhh1XMhc6W/M=;
 b=dnce2C4KOh12aGD0DsH81gJG1a/P7nXdh2Zeh7+5BCWSZH4qu8hWCvg9WgJiiOXYvq1OpkCimbQN+nrRwekE3KOufXqj+DY1gpetpIbg3+teo63H+1Cyx4Di2gMdICkIerH8NY/skTFaOp2mS423v7qdcg8nDFhTLGfCW8BGpIHBcDafleMdUPmMhHGzv07ky7ehYNTDmZ6kPq9ggIzps7h3o1OHTpgpYic8FwV2clg85nlh7LsYhX8nZ1RrGtQHgUwKSBUUsmy81RrKL5nEjZnpnLRH2PJ+rZc8EVcT3TH1Swe2NG8Tg5l+WYPZBmzPArO2y+e8TYC0DmzqF1nSzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8602.namprd11.prod.outlook.com (2603:10b6:408:1b3::11)
 by MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Thu, 19 Sep
 2024 10:23:01 +0000
Received: from LV3PR11MB8602.namprd11.prod.outlook.com
 ([fe80::5e20:4508:a523:df39]) by LV3PR11MB8602.namprd11.prod.outlook.com
 ([fe80::5e20:4508:a523:df39%6]) with mapi id 15.20.7982.016; Thu, 19 Sep 2024
 10:23:01 +0000
From: Deepthi.Hemraj@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com
Subject: [scarthgap][PATCH] gcc-target.inc: Add RPROVIDES to resolve gcc-symlinks & lib32-gcc-symlinks file conflicts
Date: Thu, 19 Sep 2024 03:22:41 -0700
Message-ID: <20240919102241.178655-1-Deepthi.Hemraj@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0194.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::19) To LV3PR11MB8602.namprd11.prod.outlook.com
 (2603:10b6:408:1b3::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8602:EE_|MW4PR11MB6909:EE_
X-MS-Office365-Filtering-Correlation-Id: e91000b9-c52e-4545-54d0-08dcd8950a26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?oaWpE5H+Ni9dfkHZMH2gKxKhmQdXOEWwj/xzbmbxABpyewimCWiu0uN9kLUd?=
 =?us-ascii?Q?IOHRfTqDD1WhJZiLDVaG8peBWIFsCh6PgChqtg8kErnNNhPfimS9sOphN0oB?=
 =?us-ascii?Q?9ei/WqWjXUHbROg7o0xdiC41UcQwm58i5I+eZlBF8qc8BHFw0nLg1imDDER9?=
 =?us-ascii?Q?28SW9brRq5sI/NUaoqaUR9R046iitgHLIfiLULQVoKV5mWQcZL3vuQd0eWPW?=
 =?us-ascii?Q?BWEENcalf2+Fk5j6R1SisnVY7auebjBRc7Q/M6aYelZ41kWiOaEOETHICk21?=
 =?us-ascii?Q?hcQ+MyXOvDgZrIUgAte+SGzlHNKF+j4nF2tmsaheJJslKV8U3MYNdzLWn3TR?=
 =?us-ascii?Q?EjM4X8ztGdQto62En6GuvjeHUBZ+jXXrI9SsVlpMmi3OcsP3B82OqokzyGnX?=
 =?us-ascii?Q?nC4C+lFBzQGN4c9Tkz2hvtYRZbI/xIVbSL712quykh5Lzb5DcwFe07NeoDMz?=
 =?us-ascii?Q?j1HyRdv5gXiF9048uESkheV2xa/Q/R5+9elAAYTpWR3gej1ggVWMo+lGCYlz?=
 =?us-ascii?Q?sZdevCaQzO1rBjKnPZC0k31ONYoKrR3clYKhwTvL9VpL57Zd9/JzN4vkglTa?=
 =?us-ascii?Q?CdcQgHk4H0DTbOjG5Stjh8TTgch7eT5LDsRrMBv9y1rOSX1vJqt6sCAYC+gV?=
 =?us-ascii?Q?vGLJ+qVhp7FBESi3MT+TvZkX2y+ryj4TTDFgEPsUT6xBvNugdWM4Q9r5rdw0?=
 =?us-ascii?Q?IdtcGRT2ApBrhlrsFlwUCxaydn2tQL910ZpQnHA/LoYUT9sowAZ64lChNlcg?=
 =?us-ascii?Q?8SXcWsjxmulmNgxDgW1bSEM5iErQ63jjLO6k1GF8OwPjPOq6qcCDbZ5ObpVD?=
 =?us-ascii?Q?Hfq9d/qG6o5RJ8ADk4h9cqNQy5VRzGl8x5c7jX5l3PTZ9ySrGEKzCVMljfEN?=
 =?us-ascii?Q?n+/SfMXhQMdBSQdiU83Rvgt0kwk5Fyo50ZhNYjD5NVs+4+hZ3BA8H4N9SzWx?=
 =?us-ascii?Q?qPGd/KHqkaFb+5162utLQGuxuzNBU1d7YmfBqZhBGwA8xn5FkX9ShlNlNc9H?=
 =?us-ascii?Q?ms9WyoBhC7dfPWwHDhg+IGbjSxvop8H/ypulcn+m6k1sN+pT/fi2gXJ2EYVw?=
 =?us-ascii?Q?KuwMGaowmOITF/cSSgxsvByUMtzPTb5MRIwa89nfHqSbym9j3pOriPzWrYuj?=
 =?us-ascii?Q?yu8K7L6TbVC8C1ZG6Wi+8GsOUv0zz8jyyXTANwLndCLiVLcKOt/+YHbZv375?=
 =?us-ascii?Q?A3RtdtEiE0jIsFeUgQva7xWipyMtng8swCAb/YHjlwktPCyPSjmLF2yN6b0B?=
 =?us-ascii?Q?WPcBlEaa+nx91iKyK71JOP9+UqpPVHQg8xcFQcVuJRHvX0eEMZZGMqVdbdoM?=
 =?us-ascii?Q?VLZ5WzKKnlNw8ubES8r9pRnQEGSs6+jf+B+da+MCaRON8NRag/mO4Sw9s/fP?=
 =?us-ascii?Q?dx15fwCVre0Qx0zyk4zRFTIHNhi8i8F89VRiiEFKW9X+a0WTKQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?xRzvjX5/A/QAkbqfgY49BHwXp2CqFYfLPqphjvz0+7pW6W+/iVx83rqO574M?=
 =?us-ascii?Q?r6/XwQUlbwYSK+hrnVTO00RYdod91BoXR1W3UrfHKyqtzPcDEKN6g1xqv2ST?=
 =?us-ascii?Q?jNrI0lPIA8UR/GDcWUCyZPyOt0bA3I4J1O0R7J2KQ0rUsoSYt6mVt4vArENG?=
 =?us-ascii?Q?DkeVpa6HYEg19DkLQR2ynf/45oXgLX5nWnDxgiW2kBOZik3BXbQOFsNhEhoo?=
 =?us-ascii?Q?4OiuJI0bZeehE2tnZw2PGUMmqBPzz/uqfNIJYhhYnPJAfAIfisgYIOBuLvos?=
 =?us-ascii?Q?sb6dd+BiTHLjV105WNs7jbiZY8kHRTaHOyn2ivqjRbKykoyC4shR5ySRSQ+Q?=
 =?us-ascii?Q?G9j+vSQWpfBjmdhOyKWM/7WK9wpPkxD4RD6M0Kx59vdn7o2lcOBiczp+1NXf?=
 =?us-ascii?Q?8YhGsIf4f9gX3yEv973HmZr6Ki594qo6Jlg77pkDCrDocN/9AnBi5xU2fANf?=
 =?us-ascii?Q?EdHVMYNdw+2L1bOTBH5YEiguB4ptmCwkx8mrrz9JBh29fFNymxucmfqzq3E5?=
 =?us-ascii?Q?Dfymx1GezyZ6ZtYYODbp/K4SAPoUdotsuVLWaFogBfjPezznx80iUPtuDR3U?=
 =?us-ascii?Q?wYyakkMg1e/pl0+oPGbahwanaJNIP4gPdqi2WnFEUEN6dar/ECY+z2ql3QmS?=
 =?us-ascii?Q?f0zieDYGVi9eylflWewVPB6PCY+eQonzsBUIma/2E7uD06dOpiJ4wpbp3hso?=
 =?us-ascii?Q?ETB+UaIg1oqPKLJYRvwS8NE8u6/c+KaRLw59+xFRFqeQ/epcYKlfa1Sg0SL2?=
 =?us-ascii?Q?uuIYuC6oCj5IAL/5bJWknc1RBtte38xqKyXNlL78rUAtaU5b0tGVZe5iISTq?=
 =?us-ascii?Q?jSH3NfzTFiDrdgmqr2wmrsKEYGsJ6dxGSJQAPy06VdPp+bXuAsZzOH7RrEiI?=
 =?us-ascii?Q?Izfq62km3z0vYfoy7KPbjAEpOJ6jhpCq57sJhEguAVZFsF6iQFL0LXSQPh1y?=
 =?us-ascii?Q?QHpn98I1PJaNkaFLqmnh+cj2GOU/d5wo3OLA2RTwHlHRn8RcmXA5ta9RiLGU?=
 =?us-ascii?Q?JgIxNbCXr/N61qzFFTmce7JKXYnR0WHI6uNkfn2JYfm/9ieG31Hlz5X0k1Dc?=
 =?us-ascii?Q?NrycJ1ODlpmu+CSX7Ve841MgaTAfjyDssyZPMpFbQLO/4acCKb8tZdtPp73h?=
 =?us-ascii?Q?REeDrpmPY1axYj5nDMIyt7Y5UQ8nuDtXn0i7FQs6p83LbWvbLuu6BXBw0YqS?=
 =?us-ascii?Q?hEnPZnNiMyTANmbSBgDytyPpNrr7tVqeZ71eEq5SYx+sSjBoQUYV70kghQpL?=
 =?us-ascii?Q?uQN659iHQwKBCx1+lG+HJGRe0mRlmr6RVXISLLBCZr6xza8gAU3lnT4eCEcf?=
 =?us-ascii?Q?SIXQK6CqRvXky4FewjwN4e9wi+ljZN68zrjrLyPu8ku96ZJ6LOYUPx93fjFw?=
 =?us-ascii?Q?gvjo6yCukjMM7NLNPYYvvR1XX5i+kvWhruXEu0BncrblTFbHOceeA9PGTT7E?=
 =?us-ascii?Q?5pOvOM1EEZ3SZhGebxRENM8SCuJaAIPu9UJlOznYd2W7rVKxhOYFR0fZ4812?=
 =?us-ascii?Q?b4Nm6mRvX73r6ME0u+0LjAljLb4gpIjfM/EqLu/BxYBGoP221etyZLbrFe2S?=
 =?us-ascii?Q?UWC9z1wq5xhacGKmd5NcgI8VR4ALAuV7Jmw+e6TcOJ0eyWkFmwCjcRWoQ9Mz?=
 =?us-ascii?Q?yQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e91000b9-c52e-4545-54d0-08dcd8950a26
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2024 10:23:01.2647
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gVv2t+5LuHvVCPpOF81kpQyg5BEYRgfpsh/gG6mxPPEgBod6FbtangIz7SofE9DgFHLvqUkVMVIqP7pPRUD4cl+wdsI30er773s6dK6IiE8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6909
X-Authority-Analysis: v=2.4 cv=MYM+uI/f c=1 sm=1 tr=0 ts=66ebfb88 cx=c_pps a=6L7f6dt9FWfToKUQdDsCmg==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=EaEq8P2WXUwA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=ChAV8wARzTRz9Pgtn_8A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: goF7-OsevTEmFh_qeOJFppr5NvcAMDzm
X-Proofpoint-ORIG-GUID: goF7-OsevTEmFh_qeOJFppr5NvcAMDzm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-19_07,2024-09-18_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 mlxlogscore=835 adultscore=0
 spamscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2408220000 definitions=main-2409190066
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 10:23:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204670

From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>

Enabling multilib support and adding both lib32-gcc-symlinks and gcc-symlinks
to the image installation results in a conflict between
gcc-symlinks-13.3.0-r0.corei7_64 and lib32-gcc-symlinks-13.3.0-r0.corei7_32.
Following error occurs because of the conflict:
"file /usr/bin/gcc conflicts between attempted installs of gcc-symlinks-13.3.0-r0.corei7_64 and lib32-gcc-symlinks-13.3.0-r0.corei7_32"

The conflict occurs because both packages try to install files in the same location,
causing installation errors during the build process.

By using the RPROVIDES, gcc package can satisfy the dependencies for both `gcc-symlinks` and `lib32-gcc-symlinks`.
This prevents the conflict, while ensuring that both 32-bit and 64-bit symlink packages can co-exist.

Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-target.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-devtools/gcc/gcc-target.inc
index 7dac3ef422..f31ea15740 100644
--- a/meta/recipes-devtools/gcc/gcc-target.inc
+++ b/meta/recipes-devtools/gcc/gcc-target.inc
@@ -27,6 +27,7 @@ EXTRA_OECONF:append:x86-64:class-target = " ${@get_gcc_x86_64_arch_setting(bb, d
 export gcc_cv_objdump = "${TARGET_PREFIX}objdump"
 
 EXTRA_OECONF_GCC_FLOAT = "${@get_gcc_float_setting(bb, d)}"
+RPROVIDES:${PN} += "gcc-symlinks lib32-gcc-symlinks"
 
 PACKAGES = "\
     ${PN} ${PN}-plugins ${PN}-symlinks \
-- 
2.43.0


