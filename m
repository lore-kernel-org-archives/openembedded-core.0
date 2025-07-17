Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB95CC83F1B
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 12:04:14 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.46851.1752753851460106723
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Jul 2025 05:04:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9293950bdc=yash.shinde@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56H4ohvD035198
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 05:04:11 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47wdvdu1ve-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 05:04:10 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 56HC0B7D748240
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 05:04:10 -0700
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2062.outbound.protection.outlook.com [40.107.92.62])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47wdvdu1vb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 17 Jul 2025 05:04:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r8/TMgRAiDERYbrEhg9dYfsdmP9rHD2LBMQb7mj7cRB3LmOSUS2ts2Yf+Ig/ggmkyhz64xZNGsCxhDzbUmWEslSFCbq9x8j1J1mhbjj1vFtUwK7j36Vq07pUNEL9co8tFU2ld/hAFxwyLQl8RSm+Ytqx5k9IdsYj6TGWNuUps5BrL54wu8/RX0kClCJ5LNyoLMhni9y6ilfYXJBZFkI7fiyL+f6fA9jPasZ8TI+TcAoTl8CedImN8CV0JtElwVTPeWGpZV9xCXrbsL7aRgRpM3YBk7SD+vc9Vl+ZoeZ+Llw7soHqdK2VwlvNaKdXg3dXjzEmZavdytjsh2f0G0GSFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oshRDmzW+j6r0TvnW0+ZaTcoEnDAUDTMMTWTNV1s+/o=;
 b=Qr5Z2ebepIb26UYny79TOLurZV/+1G+txpGM4pFduVO/vbgCUJuUD6U/eiKE0quhKcfyScCfohedm4rMS6gE548qT2cNdNJSjsg5fAtvV43WIy8hYPSO3EWsuP6lAeg0oR/CqEERl4K+jVDD8dS8RWde+5uwRmqDlRBHYjzl6iPB56XTyKVnxjjYASLpYafAmelSogqL979toQIRK6Pt/mekXKKVnZYN/u2aoAO+u/rS3UY4BA2XfR7/M2YkK3/3tV90gnHnYnCJlAtKoGLvbCPbWnwlLSo76hzYawkbb5+tqD9dpL3h/9od1m5JNXX9bxd+WNhRRgw25jcWa36zVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by SN7PR11MB6604.namprd11.prod.outlook.com (2603:10b6:806:270::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Thu, 17 Jul
 2025 12:04:08 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%7]) with mapi id 15.20.8901.036; Thu, 17 Jul 2025
 12:04:08 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com, Randy.MacLeod@windriver.com,
        Sundeep.Kokkonda@windriver.com, Yash.Shinde@windriver.com
Subject: [scarthgap][PATCH] binutils: Fix CVE-2025-7546
Date: Thu, 17 Jul 2025 05:03:04 -0700
Message-ID: <20250717120304.3105743-1-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0060.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::35) To PH7PR11MB7593.namprd11.prod.outlook.com
 (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|SN7PR11MB6604:EE_
X-MS-Office365-Filtering-Correlation-Id: d260b311-6dab-4495-308a-08ddc52a0894
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?XcRW2Qq4qseGRzqUAubMowgoWx6LUhtpzC+rVlBUwL8GJ9Y2TCAb7Rpvwc2X?=
 =?us-ascii?Q?uRLjVHE1c0xkeNobIiICn5eFlQOspjlrVp/Ic5AxHsSlphQcPuyJKiT3KVxd?=
 =?us-ascii?Q?heoRkoei4SmJC45s+5k4OB+vry2Yj2efQsWZ8f61URKSpro1qAhmwCKEHR0e?=
 =?us-ascii?Q?6RNGGSLti1JG9WDqQ1yHAVKAMLhalt4ITjb7JLkTz7eWWWrZ8sOtacyB+a+h?=
 =?us-ascii?Q?X0IAEB38EExOBTnTjN+r0jtKxPIZmiFnt+SKNILNI7Omwjp5I2A9SHcUbGq7?=
 =?us-ascii?Q?ln4Bxxf5Wa4eJqxXsbQDG2blKHFjGHumhSlLBClB0wj4DRcbHmlCuZEVZUnj?=
 =?us-ascii?Q?9N57MVo6qTTG7LCzM69nY5P8p8uIps5TgTlzWb0cfaoTahcRFZrLsa97CmOq?=
 =?us-ascii?Q?Wr3R8uuXuk62Fy/i0ipBWY/XXIDUklwbV8oREVv7M0SXIUwxJQnzrbWgUvtf?=
 =?us-ascii?Q?cuixMGi4z808wbIIDbDAt1nR6jkoxvwDtmh8WALL9tMCmflAFicwfsUCFd97?=
 =?us-ascii?Q?Xve2cKv8JGixlTtf9nRud5F45LeuUoFL7OAzaAX6c9A5ikYETm+2LWM0gvxw?=
 =?us-ascii?Q?5uw93bMvoqkOVsa5LGJt55jplwd5GBWCWUSb+tvIdiIMQC+ClpBoTrn67pkm?=
 =?us-ascii?Q?Yq+EakfPFetA1uDaUZFfQzTdvcyvaeVDWSoagaWedtQFMUJX9AKJo2iZPMOE?=
 =?us-ascii?Q?+TLHvC+jF/gkz/1TUuc/zyW8HTAeJw+nyEYYFqw4fvmFzjAoOuGU2VvGj0Jx?=
 =?us-ascii?Q?LOkwDOPlAi+mhSY68IHWPJex9mDaiqFk5D8KnB3HGnC97U3qMb5TcjXmz+m+?=
 =?us-ascii?Q?MOPjodQnI4lgisn6nL4df3bZdP/krt8/T5pdDAGBWzJPxk1pZNxyXfb1/w78?=
 =?us-ascii?Q?C1zkNHYriPIe2Qr2LYgrke5FNYkjenuMVSWiOxjtCYE2ZqGdJLVoejphvIAe?=
 =?us-ascii?Q?r9ZYJWTTBVk10Q/RYg0ech1L2vfPkJIzlWHILCeWF4TrwjQxeDb2hmi1td4D?=
 =?us-ascii?Q?kiKdRzNHbQRRNrkxEn3TLNeX/5lAqFANSLs+u+iXw6PmadeTPJW2s3sVhvIk?=
 =?us-ascii?Q?uVnDKlmoR8CG2ffO4MDKzNaGJDdU0TAO3HmMQ85qfHm7kMhpIvJL0SxQYjOS?=
 =?us-ascii?Q?Lf5Oeq9KMvTpUHl/lRePbeLn/GYl1ldb5Ce4duxRfpVfl6ZpVJsAtpHEH82i?=
 =?us-ascii?Q?Kps1FMhzwoxl5j9TEWU547g1jAmFMio/mSrfO7Qxi9WTlpJaXD3TdcB+aPX7?=
 =?us-ascii?Q?+x6X4kcKz7S6u+aDe1+qoFpnbHtuh24FePf4uiNX6Wit4aYqoaeb6fsNzqtW?=
 =?us-ascii?Q?s39ZgwTqkbe5xBNQtEbZVDeQ1EuPXcJ+HPZncTwJJ8wOdGOBMPR85t2KPMYX?=
 =?us-ascii?Q?wWkaInUNeps2Ut71C5wYkFp7wCfbexAWZSLmaqEb9BCeL0ngePV90rhflHjn?=
 =?us-ascii?Q?BRHwPCWz970=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ReF5tCiXZYFQEV7+aOqUfJcZxUSokOGuAPg3aBpWI6CCJLmnoW7TWMsxnJqZ?=
 =?us-ascii?Q?zzv633WnNRiR60GGh4iKgQHLgYMazpNixMlbXMyeI0jbD11MsdXWEpFMGEz8?=
 =?us-ascii?Q?4p+if6TsveS2pVgyahk0PzxBD09bIadyP57EKtxPZGJ7q63zmdzCt505ICVu?=
 =?us-ascii?Q?pvQ2NZnSwyLX60ANRetX4aY4eGLMPajQLVyh7lyI7JcySuonfjpVK/2PVLPw?=
 =?us-ascii?Q?RgbjGsx5Yu+N2Eqm2X/xdOhYGBzhZcCpFDsGkZFEAP7TM2s8m2irVjz0a5Iv?=
 =?us-ascii?Q?8dcbMLeCC0XaH4YdIIdGukq3dlsV8KIjtkHxVgC8s16NBP7H232RmHsBAqrL?=
 =?us-ascii?Q?zaw/aIJWM7T/Q2/2cGgiykjOQDWNlULJzSAz26smpGyLNQ8rIVt0GFKyo+4K?=
 =?us-ascii?Q?K+6zXB/RtP5XOq+fMZZaWxFlbLcLGlBys0A/XuiOQ0WKWUIBb9qQ5/kc+Ttk?=
 =?us-ascii?Q?lHgjInj0xufeF9OZmCz2Ut7tOKXCx35gfYR0ASHJvAJ36TmI2DKuc3+r7YNe?=
 =?us-ascii?Q?jADcgslGO+tR/xpULDxE5onLARZ1n5KAXZ+b+DHV9iVmmbT/DggTtYhRoVic?=
 =?us-ascii?Q?szLNj0nHzN09C+Ve73qAVjB+TdiZfBGGJIJJ5ZH7Pqmj/6ReJ3Z6ahchyPKa?=
 =?us-ascii?Q?XY5JzasQqmv7bipxlH7GZkG4FO3hWcr4RQaDKPKkKwSWJip3ZCsOUK+SJ8L1?=
 =?us-ascii?Q?yfItz8adCroQc4aFtQBf6xshC60m8v6Cvu79dUFB8+59XKTtXvBpUsnBu+7j?=
 =?us-ascii?Q?Qh+tOuxJsTuIWcH1XeFmw/WhQ6G8c/g8owBvWNDs9BLR/IStWehbKY9ypfq5?=
 =?us-ascii?Q?tq+lw9Y5e0YK8qjrFEI0Ipfw/w4J6kgZ4KYYwnyUMKawrY2tKlgInMf7cjjs?=
 =?us-ascii?Q?g7kaXeDHnWiLdlvCkqmYS9/NYO8/z+U2UirC1o423FnYs1Bj4ItDCB8vBkwd?=
 =?us-ascii?Q?Z374djSnWyEpdb9mLbb+5VLeY0Xi8RQnMBeBl6CgD1ThGbTYyRRPmIUQhDcY?=
 =?us-ascii?Q?rKlR7KnvIo3ubeTsmhD1u7ngDuqEnOkW9S2tY8PsA0REamB85Y5MDa3KPpNN?=
 =?us-ascii?Q?a660LZV5cvK0L3fS3Zpxw9yD7+7xYIgDVlk0NZWIxFzP/VlDN/9nHgCwNQKA?=
 =?us-ascii?Q?xAXUhYn65EqcILVZQpKK8E1PlREtVRFt2ZEwXRJkpta7psJhZqPPpkF+sj/Y?=
 =?us-ascii?Q?UuHZv/RjG/dN+dD9gzMfNsm4myJOrqJYTI2pnBvH40a9UX3AB31On0qOHsCp?=
 =?us-ascii?Q?0abkEIsRjWGGpi9ZhjqnJOYk+5lRBK+Io+PoTy+xhWk7HfOKKtPWCRIx9uw7?=
 =?us-ascii?Q?4oofnhTmSAttBrmIOo+iNbPWU6SjWvab33QX7aIMtEp3kYDnqplDOOetxWQe?=
 =?us-ascii?Q?novwZcqA6EhlVc850koY+FP45bESn2X84lRPHYK/ZQylSJOzrl/6x8cfAIFk?=
 =?us-ascii?Q?6oSr4025laW9fsL7fK3ICzV3DDSvBLU/imOGLnkDOgPkOXAJMFSLerMDQzll?=
 =?us-ascii?Q?NRbye1HQTFLja7S/9YS+Ur7BIlR8qYtAV/w1UmBNmhJf0c8qoNu6Yf9E/tzD?=
 =?us-ascii?Q?Iqlon+c7prKh41/4tI1Tyf1cl04hAAHkUmClCcZ54PtE3yjhhY8RpeZ2maCs?=
 =?us-ascii?Q?uA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d260b311-6dab-4495-308a-08ddc52a0894
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 12:04:08.2315
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JhaP1Vtwgtspn+yqkH7mOV60XulQWF1ACXAPfHSQ34H8b3XDL3EKoIyaSgvEWcp/o7o8xc/9CgvESnvOCR8MPU1wiVRdhnD3p77Z9M18BW0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6604
X-Proofpoint-ORIG-GUID: 8vNKd8LliOdkUN7QJKvaINP76C9i_wbX
X-Authority-Analysis: v=2.4 cv=JbC8rVKV c=1 sm=1 tr=0 ts=6878e6ba cx=c_pps
 a=PuJdnknN+GvnnVP6qVLFMA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=Exh1YBhtDrDUxE-W6boA:9
 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 5a9HecbKDuLPWMzhT8dy0ofRCVMjUDsO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDAxNyBTYWx0ZWRfX0JA+ef5sdez5
 oi5FcqJ/7+MoTN+2o6EThcLh8ocXhgfrlkXlbejmQNeOvVYV74QrI/REpFbhWEjO7kpx5wYihK8
 fKqO/SSGcFelgAAtIzrJOeMi0zN4N+mxEDf9hqpy2PpOmsEmFCpJjJo3UYaN2/7bIrqCKbix6wu
 ImOGTVW/EytHBsDlMjxJBIJ+J0sOCko/XcxnXiVjr8c6jNW1bSRPtSq5ffnafWhwVQMY4V5Mu5U
 H8+oc0/1pyylpjwfASU4Af3yI/4NST3TFa/cQEmeV1DQeoKnprEfRVF/O9ftUxAcrnDj8TZckU8
 /BtDDCIz+K40+rUD++WZSmDoGPK7wvoH9Auq9KFCxMn7qj65FmyOMqk+8yepywutajksanAhayq
 gXQxi1uG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_01,2025-07-17_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2506270000 definitions=main-2507150017
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 12:04:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220536

From: Yash Shinde <Yash.Shinde@windriver.com>

Report corrupted group section instead of trying to recover.

CVE: CVE-2025-7546
Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=41461010eb7c79fee7a9d5f6209accdaac66cc6b]
PR  33050 [https://sourceware.org/bugzilla/show_bug.cgi?id=33050]

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 .../binutils/binutils-2.42.inc                |  1 +
 .../binutils/0023-CVE-2025-7546.patch         | 58 +++++++++++++++++++
 2 files changed, 59 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0023-CVE-2025-7546.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipes-devtools/binutils/binutils-2.42.inc
index ea018a48a3..2c61ac653a 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -53,5 +53,6 @@ SRC_URI = "\
      file://CVE-2025-1179.patch \
      file://0022-CVE-2025-5245.patch \
      file://0022-CVE-2025-5244.patch \
+     file://0023-CVE-2025-7546.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0023-CVE-2025-7546.patch b/meta/recipes-devtools/binutils/binutils/0023-CVE-2025-7546.patch
new file mode 100644
index 0000000000..23c38091a2
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0023-CVE-2025-7546.patch
@@ -0,0 +1,58 @@
+From 41461010eb7c79fee7a9d5f6209accdaac66cc6b Mon Sep 17 00:00:00 2001
+From: "H.J. Lu" <hjl.tools@gmail.com>
+Date: Sat, 21 Jun 2025 06:52:00 +0800
+Subject: [PATCH] elf: Report corrupted group section
+
+Report corrupted group section instead of trying to recover.
+
+	PR binutils/33050
+	* elf.c (bfd_elf_set_group_contents): Report corrupted group
+	section.
+
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=41461010eb7c79fee7a9d5f6209accdaac66cc6b]
+CVE: CVE-2025-7546
+
+Signed-off-by: H.J. Lu <hjl.tools@gmail.com>
+Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
+---
+ bfd/elf.c | 23 ++++++++++-------------
+ 1 file changed, 10 insertions(+), 13 deletions(-)
+
+diff --git a/bfd/elf.c b/bfd/elf.c
+index 14ce15c7254..ee894eb05f2 100644
+--- a/bfd/elf.c
++++ b/bfd/elf.c
+@@ -3971,20 +3971,17 @@ bfd_elf_set_group_contents (bfd *abfd, asection *sec, void *failedptrarg)
+ 	break;
+     }
+ 
+-  /* We should always get here with loc == sec->contents + 4, but it is
+-     possible to craft bogus SHT_GROUP sections that will cause segfaults
+-     in objcopy without checking loc here and in the loop above.  */
+-  if (loc == sec->contents)
+-    BFD_ASSERT (0);
+-  else
++  /* We should always get here with loc == sec->contents + 4.  Return
++     an error for bogus SHT_GROUP sections.  */
++  loc -= 4;
++  if (loc != sec->contents)
+     {
+-      loc -= 4;
+-      if (loc != sec->contents)
+-	{
+-	  BFD_ASSERT (0);
+-	  memset (sec->contents + 4, 0, loc - sec->contents);
+-	  loc = sec->contents;
+-	}
++      /* xgettext:c-format */
++      _bfd_error_handler (_("%pB: corrupted group section: `%pA'"),
++			  abfd, sec);
++      bfd_set_error (bfd_error_bad_value);
++      *failedptr = true;
++      return;
+     }
+ 
+   H_PUT_32 (abfd, sec->flags & SEC_LINK_ONCE ? GRP_COMDAT : 0, loc);
+-- 
+2.43.5
+
-- 
2.49.0


