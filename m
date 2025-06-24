Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAE91C77B7C
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 10:42:27 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.5341.1750761738213828164
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Jun 2025 03:42:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=827047d704=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55O508Xr027766
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 03:42:18 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2061.outbound.protection.outlook.com [40.107.237.61])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47dr14ttyb-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 03:42:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yX91/cxTjEHXcf6wZBMTLAcmmhyssSf0XIMOmp4HbKlsiRUfYWouiWb9Z87T4Re3qTaZ8Jz6pAqLxZ6mxAmcRBIANXX5FCuShgV40Y34IJUVUKNyyouQipUknQVZdgYEwURRwKmDzNVXJCNuntBOc3vqQEM55uQZb0Wjnhgql3qmh7tUDCwY+ZOd1+8i+mk1ZL6tiYLuIXCQThuSzEehCInxvy2rJL2AHTOo1hsASjmBRduTDBCvd/E6FLtLwhkMIL0NNe/6pUhjnrUEQewOMVOJOWLPyAn+cD7Li+CQYf9L6N3O/DbzchgdDfdabUX04HBsy/8iC9gukJ6mr8aoBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OKjd1/l+yatH/99j4yALitqYRUOMjC0QHXvg0XvyAdE=;
 b=rgVtaSwPAz2p+iOx6UiQOAbfkyaOyCuKX1IUFcvp7CHBfcg/kp83DmBDm4mlPavKiUU4F5ZSRMexm+8tawpxxd5YMcdiv9ihTyf2qot27ipf1EXnBYefTKDCh1X4tlRCwGBP9SobTmIkzdS/hN7AxxN/2ljHkLpQ9C3wG4jkGGNVqa3vHyVN80TW7iAngA4NlB60CN09d28m8CkdbBe5IEj9YoYqQTlUUGV4tMnymv5fgjNSnnz5hG2m91SGVat3wakYMYN9oJNhIdwJdR8srzOgZCyq9ZVGekKfQkxaNIm6NVujrq6yfEg8yf2IPC5KyBpkYK74+Ko0EU4lcGoqMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 DS0PR11MB8083.namprd11.prod.outlook.com (2603:10b6:8:15e::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8857.30; Tue, 24 Jun 2025 10:42:16 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 10:42:16 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/8] libassuan: drop -unknown suffix from version number
Date: Tue, 24 Jun 2025 18:41:52 +0800
Message-Id: <20250624104155.559827-6-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250624104155.559827-1-yi.zhao@windriver.com>
References: <20250624104155.559827-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0116.jpnprd01.prod.outlook.com
 (2603:1096:405:4::32) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|DS0PR11MB8083:EE_
X-MS-Office365-Filtering-Correlation-Id: c1148fbf-2170-4d87-ffe6-08ddb30bc979
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?LsBwAxxokGszF43zfQpp8KM1N7p4EGAIdcFyz7ULk02BI9VI5/F+/qimYWFR?=
 =?us-ascii?Q?0W81BYgx7rcZJcxKlwSfEaNExshfp4i6blwVokPchzJ876qJUmV+TIx0IGXo?=
 =?us-ascii?Q?WaUH96HjcwgqRbweK45jErC9fF1jX4UqW1wZYCZRWvSyssL/lHIjsQcgD1NX?=
 =?us-ascii?Q?9VT71JN7tDJPQCXHhxdr0uq5I071qSK2PxXiUs/p9fa0grDzgHQ+ToJEPZ2z?=
 =?us-ascii?Q?KuADbphnoMxg+Nqv7BWsLbe1Zo2OtZxTMTQPrSIKKFFw++3PpMcHa7ysWb7H?=
 =?us-ascii?Q?btEDfI3mQDgLbGf0oKig3JR3xzD72bNsQXWcvl9RVrlGAG35zU+WdISM4Kpv?=
 =?us-ascii?Q?KpUjEy/xE+dbNaEDfLzyhVjyp6bjN/HQUwQTaQh7BljmKHUbm6G7IT8icMz2?=
 =?us-ascii?Q?vi4LOWrlknHjyWfyxi9YNlIOQN2q+SeYa/Os6kNMMyYg7kdYV35pjJmUf1CT?=
 =?us-ascii?Q?2HKK/MFrkAAF7Azr4gtFHlHl4YlFlaJD9kmVsLS8o3jELicqtBIGVNYWD/Xt?=
 =?us-ascii?Q?2dVjUtmwnxO65qjdyXFuTYUR9Az51mmRXFmBwLK0JuHxk+7XYHZeJUISufit?=
 =?us-ascii?Q?z1fgD++EsGMS1WJeOjbwP3Af6DxFK81L8Qh2W6ORmfpa88YpYMaahkC1aGLa?=
 =?us-ascii?Q?85EnyuHlNfnnaZdyRW+H63U2znu5IUVZRvtJsqwxa+wFSTq9oBZjrHrDPM1f?=
 =?us-ascii?Q?uv3SAu2SiNW9DS66ZtKqh6DFNIswN8yG3TTBDOkSN1GBRCeVB6zteSJGL1Eh?=
 =?us-ascii?Q?doHxgW4XpYrNTgI5ad42dymaPzvxnxSHjNNkY/2SEt4IzL2i1HZnT5j8IUnW?=
 =?us-ascii?Q?YiyzPKr8n5yPHtBENSmYgeYN5o0GYoADmXe6BE/Zg5fRBd/kXutL2FjBpGEE?=
 =?us-ascii?Q?Z7yDvqbkYIka90V589yD3SaNU+SE/OGeXBcIPUxLk1rbZdQih4wLh+NMJkYf?=
 =?us-ascii?Q?fgGu6xwpzPJrTkIA6LBPppDqlA8e/OX1FyX1i8x8WR/w5oMUj4uahjopdWll?=
 =?us-ascii?Q?qt1v5ot7H6cC/DB1+yEM5ZO9RJhnuQxU8XSqS1YvUe2BXm1GJ84W2X6Ko1EZ?=
 =?us-ascii?Q?k/0IJzSZS1PrhcnY2YLCPmbh5n+r6oNRVsgIEdMYPQz7hR6PS7752N9/eqwO?=
 =?us-ascii?Q?fhREST/s6vC8g3ZK5elekAemHx/elzl/LTPyJhLFqJINKjYvJLijbxE0CmBZ?=
 =?us-ascii?Q?Xm4klsKxygVCEAPa72PZAYK5RZwT1HWKiHYSXzwQjAAZQZDskMpFGCDYRAuL?=
 =?us-ascii?Q?I5lnwCa1bU8pBvJzYqP5wWUM7MZV51glbUvEfLHXjzrq4sGdqqRthGrM9Zy8?=
 =?us-ascii?Q?ZhARdZfAOV3yM63fI5EkFK4+932yyonmTf0LZ8WE8CWwiM0IQ0IrkSksIyK3?=
 =?us-ascii?Q?39vEWGNH/RqQuU5eAh9QpMl+MlAYkP6sAr0XuQD5ZdKhqYDQsvy+W/58PHZY?=
 =?us-ascii?Q?fUl5L8vN6iE=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?TcXP6XJMRwy734pOzDl2FISS+vjKgLrY42fC8NtSmP1pkSs9XuAGgZQrNfDy?=
 =?us-ascii?Q?RgdJeOMfPEE5IOL2psxBs44KbEQBIin1KOVnBQNOm1b1qqmlteHw6MhpQSAU?=
 =?us-ascii?Q?/0h2STLfuf8Jf6CHcSjIZVkGjPQhE1OQHBQqN8oxNS2t0MadwNz+VW8EFjvW?=
 =?us-ascii?Q?A+xFkL6BU5AZ7QF5Lh/sjnJHDu9h4L5NbThGTny4vr9BQBPDo2LFm0hNXsCw?=
 =?us-ascii?Q?wY2sgFHcKfpMB7HrporNEkHqWVnn4zw8wAutDFAXvp4M6NPlpneODW0MLuLY?=
 =?us-ascii?Q?CGGwOxhNOSIfRrBykauxIHhnWVlJ0Lkl2BH2Cqly2I8+8rnSNm5wKUq6DrJD?=
 =?us-ascii?Q?iBS3IT7jhsgrf9hK5A2oM9ZlFGDlOpMWLWDeBTTBjcjT6vaoTITXLVORSvPH?=
 =?us-ascii?Q?nYZaewsXLvJk5kVEl6yH2t+B3I4qaK+wrUZ+0puWfDpGR50PVzzVkZzaaEOu?=
 =?us-ascii?Q?/YFsBry5x5NZxWJAf1JP8JY3e6ZcFVPI7xDUuM6z2sBiuGJSW4Xw2fwQAVnx?=
 =?us-ascii?Q?1eWUEpKzFWO+Zi5cMIRoA9WTxrWO+Rl1K32YByzzz91+231PxboAeiM5uKhl?=
 =?us-ascii?Q?vMP4pEvHXjFpb8r5EgaROltGZ8n40Gi1kG4iA5nYZb1GoFuKY/FNfHf8T9ZB?=
 =?us-ascii?Q?OqU9SV56XTgGEj3JQX1KPEbIy29yQxZBBdH/z+1/qss7z48PSlTZvVQ2Skoc?=
 =?us-ascii?Q?sIG1xiIHxkAFr4VyRhGN2vf/H+Z4i384TSIrtFwlCzkccHnG0/t7o3Kutx3f?=
 =?us-ascii?Q?NzllkWDiEn/BIXAwfl2WFYQ23HyUpzr73bWv1Ky+Rbgp3CzBbVqIzuuKSxjv?=
 =?us-ascii?Q?ZD50VZa3qQisFxrUHCb/cwTKztvqxizlb//ttQbLfgEzlGit7hIKdBP6XGxq?=
 =?us-ascii?Q?ovP0PAMOZ+yhevFjnu9Dd/8IsOA+m4+wrsWvUSgnhjkZvuloFAYG4n19VUHR?=
 =?us-ascii?Q?ZaGKAvTDrOeiyu/WoEZlmwccJfvow+gdVRBhP6XiU0dCazJFIWwLU2zPhSV/?=
 =?us-ascii?Q?aU5p1mJkID7fBHTW8j6rbvOesVY1Yey7FgiYMIq0DWVpqub3ijp6pYUQCyPl?=
 =?us-ascii?Q?jAuDjQzHJExrRCI6BuFK7+SONTdsGRLtT4Pb0Y0wh7kJ8c1YOU1BpJy4y8UR?=
 =?us-ascii?Q?XQSsdkbjk5EnuljFN7MEOCidOzqISujgi78PifsaC4Sspm29xYwLzq8YJDrW?=
 =?us-ascii?Q?oaieAWaS7fVkbK59uwSqq7tfGiN7OFuJTxIVEfRuOpDTP4244T4daGBs16So?=
 =?us-ascii?Q?060rS9oiHHjT8ErhKAKIaqVm9hpKskO1Y2gpzjwvpP2g5gedQikJ/AJuN7CD?=
 =?us-ascii?Q?kUmi2p10sZ2JUIXGx96pMMlzL/Z8x/ibkx8talxGO02sIoixn9hQ5y/l7N0S?=
 =?us-ascii?Q?++vs7wcFcZkdyQSEg9zZBQHBS6zFwqJaXR7sjsG4Ee/QZUoi4aMpkgIWiipq?=
 =?us-ascii?Q?6NCTU8oQQn79KkHZqVj9wseH8cB59FKHOdyFBbT8LiVQfvvG26K3lWdgrPRR?=
 =?us-ascii?Q?4BVypzTN620BTg5oiJp4mg0oL09YVCX0thnzDWF0mP2lqmNV8nsiNhuCs0s8?=
 =?us-ascii?Q?uChIVnq4qjPTx/jf69hlLId9PuQi0q1IfZr7GkvF?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1148fbf-2170-4d87-ffe6-08ddb30bc979
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 10:42:16.4546
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ot/dhLLcbCO+gp5g8//kLyc+EoXhc1HXKc4x3r+zeroo7DCsfRpKidmVrgAnkL7t/w8PrvDrzN2TPfzybPqHyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8083
X-Proofpoint-ORIG-GUID: TMcq4sdLEqpsHjxEB2Y54FIeh_gEezOc
X-Proofpoint-GUID: TMcq4sdLEqpsHjxEB2Y54FIeh_gEezOc
X-Authority-Analysis: v=2.4 cv=XYKJzJ55 c=1 sm=1 tr=0 ts=685a8109 cx=c_pps a=JVdHkOrRnBzWLs0TqoS/Hw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GwUem0DFAAAA:8 a=t7CeM3EgAAAA:8 a=99BbB_j3FNS7aohJxzYA:9 a=4f0m0rT7cLEA:10 a=r0dl5i_q2XGqDZkti5dn:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDA5MCBTYWx0ZWRfXyYaydgGS4yJ/ 4W7icnt4EeHjrvTKOKSRiIdBg2KkUzaU04IU737znx4KcqOYcqAMhJNxhMnSFEo5Bt+SRxiLwqm 7gUojgwxHXreGNfZ9Cpis2YFoOl0ncz0YKf85sF6nRKZpfxb06S7MMOGBGCyqV+K8AaA16TBNeP
 LmZnd0M7o7B/EZNmBFWMxx1HX1XgBJ+w5DC7g3fKv0qZ0L91XkrtLudLkFn88q8UYDVZdEheElD GW7SiZYXhCGw95y1N1rZP5YykAQwmP4xVQGV/DwTSnpWkPlXuJ2T+RYywd07UqvD+VE94YkIK7g U/nesQodgk9Z+dCYqE3aPJnJ0236zHBsvOBWkmqQbswQJrdpy6dVsMMKAlP9s014+XDOTikjrfi
 /kaCRSM3yU69Gi/CPUr4dkzovkvmn7MB1jeZQA0Guqcs47X3YdpH0SStQBdf8ojdUqHWTFLS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_04,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 mlxscore=0 impostorscore=0 phishscore=0 mlxlogscore=999
 malwarescore=0 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506240090
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 10:42:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219246

If autogen.sh is run outside of a git repo, the find-version function
always assumes that libassuan is a beta version and adds the suffix
'-unknown' to the version number.

Befor the fix:
$ cat /usr/lib/pkgconfig/libassuan.pc
[snip]
Name: libassuan
Description: IPC library for the GnuPG components
Requires.private: gpg-error
Version: 3.0.2-unknown
Cflags: -I${includedir}
[snip]

After the fix:
$ cat /usr/lib/pkgconfig/libassuan.pc
[snip]
Name: libassuan
Description: IPC library for the GnuPG components
Requires.private: gpg-error
Version: 3.0.2
Cflags: -I${includedir}
[snip]

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...p-unknown-suffix-from-version-number.patch | 35 +++++++++++++++++++
 .../libassuan/libassuan_3.0.2.bb              |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-support/libassuan/libassuan/0001-autogen.sh-drop-unknown-suffix-from-version-number.patch

diff --git a/meta/recipes-support/libassuan/libassuan/0001-autogen.sh-drop-unknown-suffix-from-version-number.patch b/meta/recipes-support/libassuan/libassuan/0001-autogen.sh-drop-unknown-suffix-from-version-number.patch
new file mode 100644
index 0000000000..5aff687e97
--- /dev/null
+++ b/meta/recipes-support/libassuan/libassuan/0001-autogen.sh-drop-unknown-suffix-from-version-number.patch
@@ -0,0 +1,35 @@
+From ecf05e7794edd56c6ff1cd7b14154e647dd0d787 Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Tue, 15 Apr 2025 15:32:58 +0800
+Subject: [PATCH] autogen.sh: drop '-unknown' suffix from version number
+
+If autogen.sh is run outside of a git repo, the find-version function
+always assumes that libassuan is a beta version and adds the suffix
+'-unknown' to the version number. This should not work for users who use
+tarball and re-run autoconf in build directory.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ autogen.sh | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/autogen.sh b/autogen.sh
+index 0b08e8b..0c5e425 100755
+--- a/autogen.sh
++++ b/autogen.sh
+@@ -284,8 +284,8 @@ if [ "$myhost" = "find-version" ]; then
+       rvd=$((0x$(echo ${rev} | dd bs=1 count=4 2>/dev/null)))
+     else
+       ingit=no
+-      beta=yes
+-      tmp="-unknown"
++      beta=no
++      tmp=""
+       cid="0000000"
+       rev="0000000"
+       rvd="0"
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libassuan/libassuan_3.0.2.bb b/meta/recipes-support/libassuan/libassuan_3.0.2.bb
index f0b7746284..e4e903366f 100644
--- a/meta/recipes-support/libassuan/libassuan_3.0.2.bb
+++ b/meta/recipes-support/libassuan/libassuan_3.0.2.bb
@@ -18,6 +18,7 @@ DEPENDS = "libgpg-error"
 UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
 SRC_URI = "${GNUPG_MIRROR}/libassuan/libassuan-${PV}.tar.bz2 \
            file://libassuan-add-pkgconfig-support.patch \
+           file://0001-autogen.sh-drop-unknown-suffix-from-version-number.patch \
           "
 
 SRC_URI[sha256sum] = "d2931cdad266e633510f9970e1a2f346055e351bb19f9b78912475b8074c36f6"
-- 
2.34.1


