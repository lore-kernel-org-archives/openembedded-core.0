Return-Path: <sundeep.kokkonda@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70CD9C54ED0
	for <webhook@archiver.kernel.org>; Fri, 23 May 2025 04:50:17 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.41328.1747975807633180686
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 21:50:07 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7238a0dc07=sundeep.kokkonda@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54N4m3Yx026324
	for <openembedded-core@lists.openembedded.org>; Fri, 23 May 2025 04:50:06 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46rwfwuecf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 23 May 2025 04:50:06 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54N4o5tg030939
	for <openembedded-core@lists.openembedded.org>; Fri, 23 May 2025 04:50:06 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04on2055.outbound.protection.outlook.com [40.107.100.55])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46rwfwuecd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 May 2025 04:50:05 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hMX5ZHMdiJ7I4o5j/GQLy7wqKxOeGhaleEC/L5md2fvWhb7w7nZ0hrC2ZRmitMXodO6JClTyCHBl244h9jsGzyohsNT3Nw2Ay9jU8rxqam0ESiaGWfm6p8BXdBSD/MYqsYCXLFT2mDcR1oXtudfVPPepmRvKTp5sg8BMJHy5SaKiMHV4QdP+L8NbjFVNEhv+RHfyCb/HCWXmzNGO6pfQyZzTE40GVIrfaY/tHeJLCGwEr/KM22wtrQxslTqQw8Sjcn7BjVhcwOlIejp8HoAP0z7naVHk1/+Daq8sjXYbG50Ho3XoXkE7gRFIzAmuMM0jEUummZDhPRkn4+BuZ/vlfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s5fPyh+julRo0r6Q+aKkywR/o5qRLIAtL0k5VKLqZn8=;
 b=hNk13B4YGip66YwsNeJz5yToCSgwLcndg5s4/wzNhwYbR7szZqG0Ri84VwBX0mH6rv3fBdL8ahNoJ+UvBtIbyFmnegY09RDknB4KV4AHSeshrxdz23s9Lu7bgv96v4ZUYJP2mnSb7bcRkotcbB6ti3Ko9K061XiyxSFHkFPnyEhYhGd8Rw02C5DUXY8xqTEdjCpEMlH89X9GIJX9pgLgCJr0CVALpRwe2lv5n0fmfRddrfDTy2zTimDW8gUOpCctkSxfjjaf8X5JgkplI0MF3k2+WfI83Mmur4uoSosUvg7DxiFcr8jwGo3yInQjOUhOMpo0R1fts9zB4Q9fQpzF3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8443.namprd11.prod.outlook.com (2603:10b6:610:1bd::15)
 by PH8PR11MB6660.namprd11.prod.outlook.com (2603:10b6:510:1c3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Fri, 23 May
 2025 04:50:03 +0000
Received: from CH3PR11MB8443.namprd11.prod.outlook.com
 ([fe80::7cb0:dd30:85d3:8f69]) by CH3PR11MB8443.namprd11.prod.outlook.com
 ([fe80::7cb0:dd30:85d3:8f69%4]) with mapi id 15.20.8769.019; Fri, 23 May 2025
 04:49:56 +0000
From: sundeep.kokkonda@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: randy.macleod@windriver.com, steve@sakoman.com, skandigraun@gmail.com
Subject: [kirkstone][PATCH v3] gcc: AArch64 - Fix strict-align cpymem/setmem
Date: Thu, 22 May 2025 21:49:35 -0700
Message-ID: <20250523044935.207680-1-sundeep.kokkonda@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR04CA0013.namprd04.prod.outlook.com
 (2603:10b6:208:d4::26) To CH3PR11MB8443.namprd11.prod.outlook.com
 (2603:10b6:610:1bd::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8443:EE_|PH8PR11MB6660:EE_
X-MS-Office365-Filtering-Correlation-Id: 32547830-6408-4a4a-ed5d-08dd99b543fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?65iBl6rrdY40rMzdo5ksEh2b5FQqUdi+W22uH3upGaWonUKnzA0C6/fGAeW/?=
 =?us-ascii?Q?Cro3ySyb2hGsNCvtKDfRoAS1ZnQtWeEBt++ClLLJ42ZBNOgcT7bo9r2KQ6eV?=
 =?us-ascii?Q?oUCypfoSvnzAEnxxe8CTjjIH3Q8I1d4zFM2jb03i7VFlJ9qJAes3DgF1HQyy?=
 =?us-ascii?Q?WCAqFZtj9WNbS77iHQiMtkB8dAm65cJJZYizmSgiZ+J+Z3k6G1sOWFwKiEfn?=
 =?us-ascii?Q?5gbY431nF40XNu3Mpda5r37SbyoXRJ9bXwxRoBrRRByqYuj95XkOQO2hQrSC?=
 =?us-ascii?Q?3Iz8oYsZfb7xbfQkgVO0V8TOi7mE809HbAJnwTHJQRLG7OetaeG6+AHKe9b7?=
 =?us-ascii?Q?f5cp5ubtQeGm3zP85p3yAyoBExB9FofjPMV3ACpqo+ULw8Ij+ew3coz/Yw0U?=
 =?us-ascii?Q?nWJtAGdYu5nf+6zK80EeX7KuKQek4+5mH2fBOTGpZNG1hh6WMCF4sD36OU2h?=
 =?us-ascii?Q?VkQ+zq2osZTbjL0qJobsCQ+P2RlAksGQtUO/+vcDLUvgDEdVeusOkdraGG8s?=
 =?us-ascii?Q?cbBMrkOYxDkzXzAc2FwPRIznjF9AxpjiM4MijiO3xXw8Pg0iMQ7c9n2mClos?=
 =?us-ascii?Q?NYwzfJf+W13XRyu/YSeejnKHjv0VGmloNXgAS70J9hX6J+9nMxEeRCMIAFpO?=
 =?us-ascii?Q?PytGukpk17cVDdUsps28qK9laitLZUdutZC/IiawadCQnB3OfbUgFP1LsNT5?=
 =?us-ascii?Q?vVM3FghiEpCSc0rjaVJ/zDpr10yavIQewV2zQPlEmCtBIL4NhLf9iojvSUxs?=
 =?us-ascii?Q?ouKsT/WZfr0x57TjTS594+c9u5/NJhieeY4VZgi/2g7BEKCgujpUQb9TYxsh?=
 =?us-ascii?Q?KgbYTwF+c4CCYN9Y9Pxu8DBC/UqxezPI0Ck1ZnG0+piNWsLqvhjBn8jucylT?=
 =?us-ascii?Q?QgX4aG/iPIEk+wUb/b/Y2qB+ZxDBus0dGLIJY+i8P014hPfewgxJ8OY1xcKu?=
 =?us-ascii?Q?1puyLuT/UDcC+gMFoYOgKNjZP1QVXxAeb4nPqiOdBcjyrHFiOKDZgy+9B3kk?=
 =?us-ascii?Q?/Oq7hsQOcoFw7pZR6YaJGWwbaNv0wVt1UJTDskIJXi7aPdE+LWMlkA05f2AT?=
 =?us-ascii?Q?QG1fPzieEma2kouxykhpVAAsYEfKmm6KFAl6r6BKhV6o78SBGhRP+ThVfFC1?=
 =?us-ascii?Q?bFSTTqeA7awVPW+wz7ct/KYmemElN8EwTLMl/KTMVHwW6EpThoS7rP3BLxBV?=
 =?us-ascii?Q?zt+JpUfTBBlsjnX3CsyCSpFdJbLXtog/2YB1+7vCo26s/I3NzeZlDtQMiXao?=
 =?us-ascii?Q?xA8jsHg8SnBfH6UQZrIyocIvDabQlC0pUyZiVJpIrqU0dpxUoSVAY7nEgryK?=
 =?us-ascii?Q?0PH2u7zcfRYmUazRjpMJ+RCr3HIbke++uP0mLPSjBxewX1qftBc5hcM9FCrY?=
 =?us-ascii?Q?gZzaPaa9bmU4C0cdEy849+ksO3JIN2it1VEO+RaPfHCoBbvW5vNAB7/e+IwQ?=
 =?us-ascii?Q?H303Z2ZThxk=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8443.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?kyIOCiGauuAhLGWzMXJYzqZxsY02hlOCbOmzCMiy57C2azuF5jT80JxYC6Dx?=
 =?us-ascii?Q?RxNfce/lL9Ve+Y49dbambFmak3kz9rMS8/y5Pye5UEAngxnncIWDwWRifWA4?=
 =?us-ascii?Q?mGTLxUySt01YXf4tPds6MF7XTpQybKzHCR44AXbA2RJSc+UIBmsdrmJXyqrj?=
 =?us-ascii?Q?FVNqmdhtj2kT5J/7b5E6AF47FmhVpBhPLwLQgtD/apLsYLqSus2U3R8I0by4?=
 =?us-ascii?Q?a7yi0+ryu5Nlkh22yr66htpNKiC2RZHbziUZXGhon91pR+IJtGAQIBpcQwQy?=
 =?us-ascii?Q?zZEcGSlWY0i7HaB2MyLaBi9eLSEQwxdwawJXwDrbImqi50llrtHT75nyPVal?=
 =?us-ascii?Q?OHtDVr6HG+5fy5xyzjkkqPSlNca7yx6Q0oGN+8LXht7GbIugpaaY8IYBtcGV?=
 =?us-ascii?Q?f3GCO+maHaasQrGoA44uV/hfy0bDs8iwcNGD2nuwdryszuXgAoMzvPHxXx1K?=
 =?us-ascii?Q?fED1F8hF+yk361NN58Alst+ySVp01tkDua8D7VYQv9AwPDcaaX4FYVAOv4ef?=
 =?us-ascii?Q?NwvSEDY3ysCTmvgGY7Z3058sl+K2RkkAzLNTiSlz393KZGMMwGyMtpau47mL?=
 =?us-ascii?Q?OUC/lCRypEkYJmxLUsmRes/qAwnmGCigMtKw3Uw7HKB+S99ddQzgBZ2/6lbL?=
 =?us-ascii?Q?j8sEH0HdkOYGbgasY9X2VoTO4aEYF/Yn1FFv0shM6O1348ku6nAxu7OgY+30?=
 =?us-ascii?Q?eK/2zAHFRzFlR/QDEWUiC7Y19zXOFP2b6JGElEbYHBJDizO+MJhT90v1GKDg?=
 =?us-ascii?Q?VT7nLKoE0Dll1e9cKrG1eg0MqiQHPk+HymC1acTegp8va2hOf0ms5tLx/eYA?=
 =?us-ascii?Q?hqU/P2YUvCxU2tuMut7vEr5LIzHAFhtia+aA62H1PogW6ImBDR0HPR7aUzm2?=
 =?us-ascii?Q?s9heuk9Y54gR6HeidZSo3/MRywngnyDUYr/YAwjDfxEgEwky2qcBwmoPa/CP?=
 =?us-ascii?Q?gtiUkNmzZWGY1vbi16DeSvCtgnXxLksAhleVYu9nhpjW9gzzptdByTQZgS/2?=
 =?us-ascii?Q?prrxi5h1Zwb9h8qpcM5HnNFgSV+YFrL3lxJ7Cfpha5D+S1Xi5dfhV/A4lnLr?=
 =?us-ascii?Q?BbZAwHsO0d2E3oBATSCzW0kLvm6xfJeVpTGTMr1KYvoAHdMh20oPBmc3WwAn?=
 =?us-ascii?Q?UXl0mUIGglhd6j557lam+ZW0d37OmuoStjn3Qmqtwz/uIKDNdf/B7by+DZYt?=
 =?us-ascii?Q?1UM9ymx7iPQ+SBNrsf7in2kiQpsXa+xJEGcGF769YXJhFXzRgTGVQ/tGkw38?=
 =?us-ascii?Q?W1EvJa2ItHnxmXcKL/RAUY6rxUTGgVOL0b9U658yrZd8Pabcld31ddCytCBT?=
 =?us-ascii?Q?+knlVIcj8LBIoJUbLwNk2AAV5XiWYrjBCqoCjHQLpHi5ISL2hmAy7DZcMgYV?=
 =?us-ascii?Q?mBtl3Vyo2WTL7V5R5/ebLo5pJftV3CAgMAIZxG/bFrhpXabPcKXWzAyyO/N0?=
 =?us-ascii?Q?8xzLwYm3wgwkLk5lPMk5zNByDEkoZxXo8qrq/tls4/7y8ioFCBs/gUJOLfyt?=
 =?us-ascii?Q?4fYPtUo9976bMvv+B6DfD5AR1UlUNvUp6foLMeejQqIYlg6ZKp0547BSB3Yc?=
 =?us-ascii?Q?3sylncPXXl0AZkmMkkevjQrKIcLSeoRk/QuL+zOvDeIZJry5qg3emFakLWR4?=
 =?us-ascii?Q?fg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32547830-6408-4a4a-ed5d-08dd99b543fb
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8443.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2025 04:49:56.7525
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8tduUWggrNK6Ux5t2r00JziqzsFerz4vjbTsedeEayWXnYP0PacUB+TOi0pfID4njOhlD30sAD6nGy/3sOYw+6LdLzGg1qcVyUo5Ly3enwc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6660
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDA0MSBTYWx0ZWRfX7QE2iWx3l8nL jgI/UW8sFlIbb3OSSt79u/hGgjHhSuQXl+TK1nhEuu9yZ5toImZ/KBb/v/8lPMZgrZZJpD2jcjW 0I7c9tClGmmIPZnNIyjgLXmyGIWDkItMshRdZzQPtA1bSC9QTCaGDaKuGqdFE2jgYJKiQ5sTuHL
 IJKTHx7kK5EqZTIgQILncNWWetfRnEEvljn81qFTZZgFwN346Da6KP0J0G+A1Rsov1l2d6rU0ce ZY7vZpEJZOkXTbQGyHcPCdXFOgzYJF4n4qFNSeXAJs4/VXk+OBFQugj4kAQ6vWNSedk13SPqX5W M+CCdftkZU+M+gJLK26qbdvKJ6PGjGjEeTKmrRRuCXzlXIGqJLr36RSIE6dJKa21M8CYedotQ5y
 O1O8y5hCyPlRrIw0yfqzymwtA/Q4fCRrDNPVcpNo0b/7Qmnlq4s7oF7y2Jauwja/3hJ4Xjq2
X-Proofpoint-ORIG-GUID: llI3HE-VPb8eo44AfNUd8KlEtyuH-v6E
X-Proofpoint-GUID: GhEN04BPrf-qxO2-031B-BGkoRpXldI0
X-Authority-Analysis: v=2.4 cv=b6Cy4sGx c=1 sm=1 tr=0 ts=682ffe7e cx=c_pps a=7vtyjtHNWIjm7SETg3ckJg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=mDV3o1hIAAAA:8 a=t7CeM3EgAAAA:8 a=7CQSdrXTAAAA:8 a=k-rYuIw9_J0oyTT2qzgA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_02,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 spamscore=0 mlxscore=0 mlxlogscore=907 impostorscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 phishscore=0
 priorityscore=1501 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2505160000 definitions=main-2505230041
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 May 2025 04:50:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217174

From: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>

The cpymemdi/setmemdi implementation doesn't fully support strict alignment.
Block the expansion if the alignment is less than 16 with STRICT_ALIGNMENT.
Clean up the condition when to use MOPS. (PR103100)

The original patch for GCC 12 removed MOPS & SIMD conditionals for setmem and
cpymem expansions in aarch64.md file. However, this version for GCC 11 does not
backport the SIMD & MOPS-related changes and retains the conditions in aarch64.md
file to preserve correctness and compatibility with the GCC 11 backend.

All changes and outputs have been verified by the author.

Upstream-Status: Backport [https://gcc.gnu.org/cgit/gcc/commit/?id=b9d16d8361a9e3a82a2f21e759e760d235d43322]

Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-11.5.inc        |  1 +
 ...rch64-fix-strict-align-cpymem-setmem.patch | 45 +++++++++++++++++++
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0032-gcc-aarch64-fix-strict-align-cpymem-setmem.patch

diff --git a/meta/recipes-devtools/gcc/gcc-11.5.inc b/meta/recipes-devtools/gcc/gcc-11.5.inc
index f17ec9da5c..1e8371b2bd 100644
--- a/meta/recipes-devtools/gcc/gcc-11.5.inc
+++ b/meta/recipes-devtools/gcc/gcc-11.5.inc
@@ -60,6 +60,7 @@ SRC_URI = "\
            file://0029-Fix-install-path-of-linux64.h.patch \
            file://0030-rust-recursion-limit.patch \
            file://0031-gcc-sanitizers-fix.patch \
+           file://0032-gcc-aarch64-fix-strict-align-cpymem-setmem.patch \
            file://0001-CVE-2021-42574.patch \
            file://0002-CVE-2021-42574.patch \
            file://0003-CVE-2021-42574.patch \
diff --git a/meta/recipes-devtools/gcc/gcc/0032-gcc-aarch64-fix-strict-align-cpymem-setmem.patch b/meta/recipes-devtools/gcc/gcc/0032-gcc-aarch64-fix-strict-align-cpymem-setmem.patch
new file mode 100644
index 0000000000..4c2d827799
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0032-gcc-aarch64-fix-strict-align-cpymem-setmem.patch
@@ -0,0 +1,45 @@
+gcc: AArch64 - Fix strict-align cpymem/setmem
+
+The cpymemdi/setmemdi implementation doesn't fully support strict alignment.
+Block the expansion if the alignment is less than 16 with STRICT_ALIGNMENT.
+Clean up the condition when to use MOPS.
+
+Upstream-Status: Backport [https://gcc.gnu.org/cgit/gcc/commit/?id=b9d16d8361a9e3a82a2f21e759e760d235d43322]
+
+Signed-off-by: Wilco Dijkstra <wilco.dijkstra@arm.com>
+Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
+---
+--- a/gcc/config/aarch64/aarch64.c	2025-05-08 20:40:10.969865898 -0700
++++ b/gcc/config/aarch64/aarch64.c	2025-05-13 23:11:07.006796627 -0700
+@@ -23621,14 +23621,15 @@
+   int mode_bits;
+   rtx dst = operands[0];
+   rtx src = operands[1];
++  unsigned align = UINTVAL (operands[3]);
+   rtx base;
+   machine_mode cur_mode = BLKmode;
+ 
+   /* Only expand fixed-size copies.  */
+-  if (!CONST_INT_P (operands[2]))
++  if (!CONST_INT_P (operands[2]) || (STRICT_ALIGNMENT && align < 16))
+     return false;
+ 
+-  unsigned HOST_WIDE_INT size = INTVAL (operands[2]);
++  unsigned HOST_WIDE_INT size = UINTVAL (operands[2]);
+ 
+   /* Inline up to 256 bytes when optimizing for speed.  */
+   unsigned HOST_WIDE_INT max_copy_size = 256;
+@@ -23750,11 +23751,12 @@
+   unsigned HOST_WIDE_INT len;
+   rtx dst = operands[0];
+   rtx val = operands[2], src;
++  unsigned align = UINTVAL (operands[3]);
+   rtx base;
+   machine_mode cur_mode = BLKmode, next_mode;
+ 
+   /* We can't do anything smart if the amount to copy is not constant.  */
+-  if (!CONST_INT_P (operands[1]))
++  if (!CONST_INT_P (operands[1]) || (STRICT_ALIGNMENT && align < 16))
+     return false;
+ 
+   bool speed_p = !optimize_function_for_size_p (cfun);
-- 
2.49.0


