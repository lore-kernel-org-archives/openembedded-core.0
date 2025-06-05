Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F188C5B543
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 08:52:18 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.2727.1749113531251710202
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jun 2025 01:52:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=82513ac62d=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5555s9oe014557
	for <openembedded-core@lists.openembedded.org>; Thu, 5 Jun 2025 01:52:10 -0700
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2041.outbound.protection.outlook.com [40.107.243.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 471g9rurww-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 01:52:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BfoqHWf46g/m+p5eHhUnCP87iwJTkrzb6v0WyJu8/e1OQZSwSCWfYFMEYfupv10kft7xm4m+mTFXrmSTiZsBKJRf+J6AaSSMoDkTnWDP0makKvoCR7NctQZnKlor6I5CB417oDLSYIso1uSdKMuRT5LRGRAGwMOYyNMSzmpftD64DE1nCfv697XnRPib0vqvXvq6ciq0AVHK00Kvu0Rr8loaqj0Em97Fjq7/8PMc54w1tOYvEDIMbneOIe92IKnnp/q/mwql48PGc4igYTsjwE9d6lVloRXysqVb46zirtdPNb27ec2v4ksuw+Ffx8ynBsNt7Q1/AYRFBVTE9X5uHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qRWeOgAb3/5W22Tz1x9PPXrdOhZE4fGHjVXJXnxXP/A=;
 b=hKoRqssZct4doezQvgjaVSk+2w0lXLum8FrUfx+rsRyJg0xSjx6g4ZPE+qRlI3VOWwap76CpDr3Cqygp0qjws4y06GzMsjvTo8WNR+VxJ86DKTw8wJUQrG2SNWfKo/xaJICQDIp3U++RE0QukF364XH9jjpfJGRGYLX9rpdw3KBGzmnwTVU0MlHk4YbFcqNbn3BS45AtGD2Q6IJ/9IiQwVlbRuHCXbBpty42lDN6xNXXfOXQAfvNmnQp+QBy00Gu3X5gXOLSKdNVkmTB81XJPltmHAjf97PkQ+FwVi3ilG8Yyjinrm1vTR4esCgdWsrCqaEiYuqvNQrjS8WZZxdItg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by SA3PR11MB8021.namprd11.prod.outlook.com (2603:10b6:806:2fd::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Thu, 5 Jun
 2025 08:52:06 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%3]) with mapi id 15.20.8813.020; Thu, 5 Jun 2025
 08:52:06 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [walnascar][PATCH] binutils: Fix CVE-2025-5244
Date: Thu,  5 Jun 2025 01:51:56 -0700
Message-ID: <20250605085156.338776-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0713.namprd03.prod.outlook.com
 (2603:10b6:408:ef::28) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|SA3PR11MB8021:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c6ee034-b365-400a-1f74-08dda40e3fbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?2mXAZJ3PjTQtm4CflqJPNq/T8CxNDbXiuwif0HFUQtiLu/R3WhqClO2B0HxH?=
 =?us-ascii?Q?6gvZbWXlxuh3OOf44YN2Alo1S0LbBDi92O7RSntdkekGk3ph4l6UnQGVlUEu?=
 =?us-ascii?Q?vnEXngTgTFd7h/3vAQhSmMC+B0YJgE0Vr1votCO7SzS1mTGPuAWvWGHLOVXj?=
 =?us-ascii?Q?JaP2WySfDFmf8G69p/Pn6wxu5xD8ZXHQyPmzXtwLK8LWP+NFSluSHF4J67hP?=
 =?us-ascii?Q?biFhxR4eT8cG9T52PAt+K/Oeh4kI3NvzGkP2SGhyDcC6LZnnfLbtcwdJj92w?=
 =?us-ascii?Q?VXq2sZvegkVX38QYWLdgILCiqwE51SF51CIKuzQHvoyBT5GescDbwuS0qvA0?=
 =?us-ascii?Q?mmc6/BcR3/QYsmGvXr/6ZuNmBpQH+xMqmLAh1KUtZs65HLJiXtgJ8wLzwO2T?=
 =?us-ascii?Q?67rYC7KsZvmE1In9cCiU8qm+6gxJxIJReuKIey6ImiTIURQ12k0wIB36wO2M?=
 =?us-ascii?Q?mLYGhyEWdarDv/OE6cFhSafVBVr+mHQ2sbcZB5VQEzsBouM4SOZcAu0f1Rr2?=
 =?us-ascii?Q?IXt6I5xX1UFMYm2blne195djhZR9BNEV5hTUbr+2kGTYpYPKiP5kX+i3Rris?=
 =?us-ascii?Q?8Zzl/iw0q6zzOHnQZ5JBDwqaAJatZCJjCA58MOGv2JyomrK4aZUE/bqdFnto?=
 =?us-ascii?Q?YIzskw/1MOcaLU0UjIfhySUIRLHsZPcKyjZhmKG3EgDY5n3NcDOKeHBQldjV?=
 =?us-ascii?Q?52X0PQOIOYud6a7oU2FYoPr7oa8xFcVuDX3BlWHMqo42sQyzWu7btpaBF69u?=
 =?us-ascii?Q?0Ku1AMLp3LMAjE801Kp/woIgSHFI8B3bQv7badu81q3egDpngCDKHGAcyiZf?=
 =?us-ascii?Q?dVoVqnot9FrtBnL/rk7RaTOaNLvSOGNbtPv6+7OsoMXn/fCuJg93bRR4U+QB?=
 =?us-ascii?Q?ukhx0ivDHTEGiuLDyugz8dGsUKNGbg+S4eRfZUodiEzqUYeDqkYdW0KRtrlm?=
 =?us-ascii?Q?uA9T2YW4sMBor7oeqv8Vngr5lqdMUNosdcHJK1BtVWdX57kZUjymxr057B/x?=
 =?us-ascii?Q?BIIu52tJpMlve2Nto1Wc6JhHtk4yG+w3Afuo3kud6SuaMRsDroDk/hy9U8S7?=
 =?us-ascii?Q?K+ptRXbQG9JFRvuoU9h7BGUs/5p2SJ9k/bG4JhKC9+hv6M1OiGgzCzQjrpx0?=
 =?us-ascii?Q?Ug/0VAK6ddOH+f13ot/ZcMoNONaD8p3dnqtuB08tW/kDfvvH+MfAHV86aWxJ?=
 =?us-ascii?Q?uJgQ1vjDI2CMBPCa9n9ZdssnPbOsIOAwScpiCv9T/6mJt2M4JA1VLLivxqWl?=
 =?us-ascii?Q?RcHEnBJftmAoqgUxFoceN5N1Keq1+1jGAKGud49get6qhmqbYOCzZ76KRzwr?=
 =?us-ascii?Q?qcZc/WrjvcAPm3T8pwGbt2wWb0RKGU3umtet5YS8vAPR7U9bTprncUqwYGc0?=
 =?us-ascii?Q?uJnIIcWiMc5R0Qich3PU95M7iEsKlIaCqXgeevgAunk3NrshbmC28fyKZFva?=
 =?us-ascii?Q?DoWX0j169TU=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VHkHBIBK4JYOV55hQssMdZCyK4uswrja8Q4Cwfrq7NJ68ac0/1kagcje2lRH?=
 =?us-ascii?Q?dNPbAUGddTb9Osx92nXK64qMYE1tzMqgY03oJzTPdbPyah3SLRGEcZdUpVCW?=
 =?us-ascii?Q?ySteFUYl1UtrVHnNo114KjnA7P7Qtvd5ZzxQNyQlZX0a5bjXaZvD1/pIBF7X?=
 =?us-ascii?Q?52VNn1Lbfp0lnBUSigpT12z7XYFLBMLnhCNZZab90EuBEVpmN4Kdy3hbWlYZ?=
 =?us-ascii?Q?1izVssNyCk13tcABRoaZfAWXbOZz25sMC4M9ek8/Mz66uEqrUYRcStsClDV9?=
 =?us-ascii?Q?zCY6ZnC4FwnkwEDGfZuDT5qIUWXJ1J3RlUUjBEI9+rGKYXlqoQK5rhHHQbyU?=
 =?us-ascii?Q?RRrMgtKTdHWsHKAe5YC5FxdLkzGwJzb+BukFqpOmGcrCiVdRP3R3G9F+p9gs?=
 =?us-ascii?Q?ipTIIXrUsNe9uPC8GHqWg+5dXqNTObndjjpCKE+TKCcwoBp0AEuTbmjOEjzA?=
 =?us-ascii?Q?hnmaU7CFtqtTN9OJo+xzf5LN9rSR9vH8zqoW4TXK54rmN03gmR/58mZS/ueE?=
 =?us-ascii?Q?y+/xsP2nE99Wizj77nMt6G3GFu4RbkpdqnDqG3EdFXRttkAcVEJOUipWV+Pr?=
 =?us-ascii?Q?yuV8BVLsON1eDtatKvjMSDeRXgB64zTW1cLm0I/H0L9bCKI8Tww+mit22SFx?=
 =?us-ascii?Q?MZLoGv+AQ/1nOpxtSy6ZtUnqgFaddUb+7v6cR/zzR4LVc/QnZ6K0w4g+CzVx?=
 =?us-ascii?Q?z202eUppsRFzBN+bkwcMiVsaVdz2qmHhFKJeLtqcul8UqgDXGAA73WcU0ZMZ?=
 =?us-ascii?Q?MVLnMFEDctGSDbfqdLhBXRt7ZRl8UkFB8dNbtwLYqOSDZ0UcIljPXU74AjJE?=
 =?us-ascii?Q?x8qCXyNhhh7JfFWkeCLqAsqaCeWkCEnnJ+czNXp4xbKhyist7XQRn+iqdg0t?=
 =?us-ascii?Q?qh7XbJNP3ssDIpVabkrLbRKEMIuE9i2c/m7yRZfVtMDIKFEz9/L7WC1kSdXe?=
 =?us-ascii?Q?4ToKs1WRSf8WoS6gmYIvLF6QPxXXLHZVKdSW/m2l0CJGk/G/p/nMPLpE3+8l?=
 =?us-ascii?Q?1rZ25G5Lp6N6G7jct63ezPIBT4seUlFNit8KXXbaibOY15hltm4xusWjWNvd?=
 =?us-ascii?Q?tV+SsmBqlfSNKJOHyiyie5V+qQFBjqbiPHNk2/j+pNgmCimbtXkCkrlAs8PL?=
 =?us-ascii?Q?LrTbX5T+IbOgVcQn3DraEsQ33fss+8/uI1BmcOLY2NH9mhbBGk26NlRtuHla?=
 =?us-ascii?Q?RuqfBprc9zJNk5SFbo9ZvWJj4yCn2+DGl4NdCROGxK++14ZmHQThsZRhoIBZ?=
 =?us-ascii?Q?YphgmDLRycJC2yfyoRkhEKDu9OCsXLHoqXQT9VR519aWFwo1xmfT8IYzXPsm?=
 =?us-ascii?Q?jYMydeCAmtRv/7Etq+jA5wr8kjW4sONUycrkYyvSBPMdfiWGn6mGJG7HaaNQ?=
 =?us-ascii?Q?w1WBngc1ndt2F/onIBXyaEaOU7ukAN1yswVTsYhTW9snApx5JcappSNuaJNK?=
 =?us-ascii?Q?SJ0uZG68PBvQcC+biW7e2T8powQrLmi7eXdqS1Napeukdkg89RCpoTXypvF8?=
 =?us-ascii?Q?/EXof+tlW8Cbe8wSP3qwY0CqI+hUa39oDVfgpuL/ZSFfH2hgK9m0iNND20M7?=
 =?us-ascii?Q?iywwmJsu1OmK9UZsu16ccjKUKG3oB2OvWb31S3eSMG4ueaw6YxtOavSSe9pU?=
 =?us-ascii?Q?LfMXa2HD6nkwIjJM4bsYNJQ=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c6ee034-b365-400a-1f74-08dda40e3fbd
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 08:52:06.4311
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q4lfBQvsLixFXfshwAuG47DkAX+H/V61AYeSl5VWzj321uql0h2BrOu/OL84AKJ1GB4snpfkKoIoD24gmvEbmqKiQ69FRm3KkAz3vgb5arAh+AlK7gmbekdxhtTlJE7D
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8021
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDA3NyBTYWx0ZWRfX+2qOF4FAYZvt zMpAFElM91ILyvMoitdcFSzLFSNTUsHDBppqV3ipJQdrhBk+1qQXzz5Kx6Ens1TYI8BparnV0ds bRAUkIFgBOT56snVt+B738qEm6/0n0T+SUdcMWj5QfgonFnnLWpI5XOJPUYCQ5snGUQGp/BbD6E
 sSaa2G930GkN7YuJ1jxJt3WXCHGDEI3s0gcU6RcUrJXBxifih7LBp8iM8W7UxfPKJ9ipURSGUmS jiDDEg9siEdRerKmBK3Te7Miqc9VX1nLtZYCQK5Pth2lzV8Te/HTpW9Jhut9QysNeYxUPdnVeck AP/RSkJk8pjiVmvwzk6ZPiGy83QDbkPWL8CPemyl5hozKyNCEr93kOlmb1aXLy/Gf9qqU8jwEBS
 Jwh8uAMccRYaUqjTZNaKoVtjcz9pb0LDgbKj/JejrUJE0qGiE2JMPWXtbdOLWDkpA+1maEnJ
X-Authority-Analysis: v=2.4 cv=PvyTbxM3 c=1 sm=1 tr=0 ts=68415aba cx=c_pps a=yMw74TNnxrJwEHXjDMcs+g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=SF8dohJSsYIBP11I8NgA:9 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: kOXqgQWfPbSyOVye4O7k7v6rZYepCxF2
X-Proofpoint-ORIG-GUID: kOXqgQWfPbSyOVye4O7k7v6rZYepCxF2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_02,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 bulkscore=0 adultscore=0 mlxscore=0 mlxlogscore=999 impostorscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506050077
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 08:52:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217993

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

PR32858 ld segfault on fuzzed object
We missed one place where it is necessary to check for empty groups.

Backport a patch from upstream to fix CVE-2025-5244
Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=d1458933830456e54223d9fc61f0d9b3a19256f5]

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 .../binutils/binutils-2.44.inc                |  1 +
 .../binutils/0016-CVE-2025-5244.patch         | 25 +++++++++++++++++++
 2 files changed, 26 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0016-CVE-2025-5244.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.44.inc b/meta/recipes-devtools/binutils/binutils-2.44.inc
index 6906ab3efb..38a49598ba 100644
--- a/meta/recipes-devtools/binutils/binutils-2.44.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.44.inc
@@ -37,5 +37,6 @@ SRC_URI = "\
      file://0014-Remove-duplicate-pe-dll.o-entry-deom-targ_extra_ofil.patch \
      file://0015-CVE-2025-1178.patch \
      file://CVE-2025-1180.patch \
+     file://0016-CVE-2025-5244.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0016-CVE-2025-5244.patch b/meta/recipes-devtools/binutils/binutils/0016-CVE-2025-5244.patch
new file mode 100644
index 0000000000..e8855a4b4b
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0016-CVE-2025-5244.patch
@@ -0,0 +1,25 @@
+From: Alan Modra <amodra@gmail.com>
+Date: Thu, 10 Apr 2025 19:41:49 +0930
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=d1458933830456e54223d9fc61f0d9b3a19256f5]
+CVE: CVE-2025-5244
+
+PR32858 ld segfault on fuzzed object
+We missed one place where it is necessary to check for empty groups.
+
+Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
+
+diff --git a/bfd/elflink.c b/bfd/elflink.c
+index a76e8e38da7..549b7b7dd92 100644
+--- a/bfd/elflink.c
++++ b/bfd/elflink.c
+@@ -14408,7 +14408,8 @@ elf_gc_sweep (bfd *abfd, struct bfd_link_info *info)
+ 	  if (o->flags & SEC_GROUP)
+ 	    {
+ 	      asection *first = elf_next_in_group (o);
+-	      o->gc_mark = first->gc_mark;
++	      if (first != NULL)
++		o->gc_mark = first->gc_mark;
+ 	    }
+ 
+ 	  if (o->gc_mark)
-- 
2.49.0


