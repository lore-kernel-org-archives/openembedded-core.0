Return-Path: <Liyin.Zhang.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C505D65C78
	for <webhook@archiver.kernel.org>; Thu, 14 Nov 2024 11:18:58 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.35327.1731583133320061753
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Nov 2024 03:18:53 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=10486e7ac3=liyin.zhang.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AE9kIPH029927
	for <openembedded-core@lists.openembedded.org>; Thu, 14 Nov 2024 03:18:53 -0800
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42uwppbq9g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 14 Nov 2024 03:18:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R4laP7goPgYfCY0NAxhxuakJ9OGWnrkr0rESURrGQybfoPm0935XgqeSf70xEBh6sOsaELpuhPsL1arM3KJgqvVWYNOsqc9ja2+rNGBD1SR7zo5BwpJ0tSjv/PZF+5r5v7uwj9N/ToyGZot0amAv7nxMmM9SsKmltK3IgS9wTPdyZsmQQusJ2ZNmg5ffFXjBwuaOzr/T9eGxO+z2hz0uYTeYJjakMiird9nzoUKxuYaQOG4iTOVowuGnHV7V3pEe2WPh4DYdfpqWakt0y0C8al1051b0ZmrIR83kRf+hrU4rH8Ltm4wQEPaQ0YsWcqoxtu48gz0Dn/SbR/a7zeWk3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bvapJxXXQV7YwQksXW5SvLd0LIsJN/f/hjcE1kFRhRo=;
 b=Z3CJJy2OXkv+A6FZYXMha7COlt77Ip2UXvo3TXRTscNlyeBOw4Ki+Q5UgyTTRRD6W4+A8yiZvOj+V0ftkxOU0DqOUbDZPduaDluInWXAI9mMmCLWWFZUwVqUYSjgIe3cAsUwOs6fTGcMY63dHvpK0G3Km3BVP/POjMCNH4GF/mC202iEcUsfSX/SZT9t/m83AB8q4qPAupqOgLa5Mz3viw0e3hX5T6VBUbadfK1KXrKqDHGN8bSFbfl9xvjACjchzXkTQUZvogl142flE+RXZwdf2Cacvg4l/AAk1EvhPXt0/KDavwCHsf4DRF/0hxP+hZ0KDsU/P2lxyyY47M66iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SJ1PR11MB6226.namprd11.prod.outlook.com (2603:10b6:a03:45b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.26; Thu, 14 Nov
 2024 11:18:49 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%4]) with mapi id 15.20.8137.027; Thu, 14 Nov 2024
 11:18:49 +0000
From: liyin.zhang.cn@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] lttng-ust: backport patch to fix cmake-multiple-shared-libraries build error
Date: Thu, 14 Nov 2024 19:18:29 +0800
Message-Id: <20241114111829.1182716-1-liyin.zhang.cn@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0007.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::8)
 To CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SJ1PR11MB6226:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e0857d5-0e0a-4a60-08e9-08dd049e1ca1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?uShTxR0NY293TX10WunttHTFTMhrRaPyFlq8OpyMNWkkvnw+8wKD8QyccLuQ?=
 =?us-ascii?Q?ysh4Wswr9WBdT+/ddUGYRy0zlH53rmoQhweLJhA2/NNq0yNcDJwAiTwMxdgy?=
 =?us-ascii?Q?0SP7IkGWUfw/xUaOFlQso9/M9Kqeam7hYKAl87dqSp+fUiJXYAptMNCXHmJo?=
 =?us-ascii?Q?xjFlZc8KSPAe6kIg5hFGiCDvEKgACWNg+l0CNYPVkmrr6wOVrh33mgXubB0y?=
 =?us-ascii?Q?IVhPVTV+7mp3J/Z3OtisCiY8pGymm7XS5BUREoFHc5lHUYvaZf8l5Hkoeb2b?=
 =?us-ascii?Q?x2Oq8eXoGP4VV8TT1EWm5CpI0StBKNfrm3a+hSjNHwlbc7e2Zpk+IjadE2/0?=
 =?us-ascii?Q?FjVMCu7lkC/LFC+KE94gA0qsr9/S9rmuu4hIBc1G54zUik8y/YNRy/XEukbc?=
 =?us-ascii?Q?BgOYMvCIv7nbsB2XUBYDoucxb+1Yo891mo8oKNKXIf86rPMuSkzhCiTLx9e1?=
 =?us-ascii?Q?xnHTAKTi17sI7n8QpM5uHVjnc0w9wWddTVBnIXFlvInAMSh0QULdpVbbweuw?=
 =?us-ascii?Q?Dq+uvX0AMShgQ5enTptN/UUjcLZg8u0UIpNxpmHz1+mqI14UdxSpRnzBi/H1?=
 =?us-ascii?Q?UR3Wusi4wnYv0WWC9rY22oTEwCnMcbJmKmTzxZI+mZvmbfnP9KlJ7jJOTvJr?=
 =?us-ascii?Q?oc+4hvjLKGIuyw58bMw7y9NAx5C2GciVkui2JdeLuoUkXuVWg8nt2RT06Zh6?=
 =?us-ascii?Q?86qz1/QQ6C7r0qGDxVIejJBIHWCd6k0d6jQ80WbxN3oXm0B5NvlXlIhqRYoH?=
 =?us-ascii?Q?O9FGSd+nZThn7f/4z+j1oN6Of1ymjZaT7dKi26nvvbaAgomUscxHsPYep2iZ?=
 =?us-ascii?Q?csTsldEGwAjIyYJTZngkw5WwKYFIm+exAHPdkazDNS1UDLaF0+4YEY5G9G+8?=
 =?us-ascii?Q?R0yu3ENZyYPILpOzwwxFN8ZvYY+PUGfGcsR2M7Dn2pAgmVwRhtJSicPCxUzG?=
 =?us-ascii?Q?lqm7K0wo01TCyfpqgnn8YozVpAQQIuDAAsSaC/5Y2v1vqLS0R062BQepOwid?=
 =?us-ascii?Q?hPT6yXX8TJpx/njgdpI3yLFlAQ/PACIWQ6bqlk2KsdCeFuq5VWAZF9DZQqju?=
 =?us-ascii?Q?3rpxTQ/YuiNie+s1Ub03eosUEVx/5pRW/MSdvQvcqxAPBcb2g+8Lia4NRNBQ?=
 =?us-ascii?Q?l5whotnFBGUNGI7mGwIQE3g/0/JpyYNVDUYrf0su1w4vK67zcxIY47wR0zAX?=
 =?us-ascii?Q?mh12padRa/yxJzBOYooBg3IpQPiwtk1hznTTMZEs4H+tzanz5oBL7pEAPoPG?=
 =?us-ascii?Q?PFAyauH3ApfS14gQoHxjrp2ytthaFOzlQFpHbgPAFHd5yyUpnW96NL4Whjuy?=
 =?us-ascii?Q?g3YKxi2aiEGDMCZ4+XPEqX4bPN0manxYqTidDns3cEEMyg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CYYPR11MB8430.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?SprIvDUojO/44covYUDqfV7bUBJCj4lVoj6+XmsKdEJ8ZSSLZKZd9Ff5Z1j1?=
 =?us-ascii?Q?/6f0TPcSHHqdUig1Ij+xIy0XMKUiMtr3nyMPD1Q4mVJWvLVuJ2x4OTJ08b8L?=
 =?us-ascii?Q?y+gG3+sCIYBFpsOWfkPJZf7BZ5/9jm5zRNjc0PTAO3qaEp1dh7YlV54Z1a9N?=
 =?us-ascii?Q?y3SscMXp7IofHtcjNjQv0XI4DNaCd33iKy9/OMI6TDCAl3poEf0u2q52y5QD?=
 =?us-ascii?Q?cGgyu75ZuMU7li2d7Is1nPu3BCjM71hFv0MFsPJlY48f0nsQ1L+NBCmwVHrB?=
 =?us-ascii?Q?bYHvWvg1KOx+YdWf3GaxryKskCvA387he7Ke95nXyf7RK7j38VRJin/Udx85?=
 =?us-ascii?Q?CEoNKiqYufrsnsrEKvnHmm5DF9L05m1oGwvWi8YGJOBeVB2PAZnr8XBCCh1f?=
 =?us-ascii?Q?uknViVPLHxU6mlTbPfZq/wx61NjDBtehvh103loP65MKWt5yixZE4NPp9Eol?=
 =?us-ascii?Q?mrJUoQk7/KFaY4evt8ElTfZraJ7JCAHjutCv7hivSzUl2rs90ZCPKTO9HuiX?=
 =?us-ascii?Q?XJMiQSO8AO49sb2MzDejaFXghH374ozTTrbhDa0vl4H1P1t7C+gxKMS6MYdO?=
 =?us-ascii?Q?r6PJZqoMUJm/r5Knykzxfub8zFq3vSI8EAVC90PCHCmJkMce5CSpcKVKgC53?=
 =?us-ascii?Q?ztHsJIUNrFDnLdLzq4tK/jgqPGOMjwi+LsXZtdcO8QkzfXONvp4PcsW3CifQ?=
 =?us-ascii?Q?V/nxntxVIyb7fQB4Be7wJk83lkEaPlOPK1eQcUvHRk3QKb8upQ1/NhHBRSLf?=
 =?us-ascii?Q?je7G41Yn7liaa1p9sedgtwTQeP0ErTZCB1aKStcdxQbNkitMD0ld48Den1v4?=
 =?us-ascii?Q?Yxd4qfq6+jzb/Qd3kiWKFPClmEVjMa6D22vSCfDJeaEiVidgNwfIcYC0j14X?=
 =?us-ascii?Q?Dtfi7tULXnvSGeRnWDx3G7S3LtrVoMTsu/b+DKbvjrSwbSymn9et9u89K/xq?=
 =?us-ascii?Q?eDGu0hX8RuMiZi+uY5ozzUG5KX4V7JPX8KeqymvtmnGuSwKKlsMJNtOIaOcM?=
 =?us-ascii?Q?DCw0lWoiuRJrNNfKDPHNr4ow+wa8j0e4rROqtJ4z2LmS70pvJU9xCP/uxdAQ?=
 =?us-ascii?Q?2UpvFTiUZbW949mhmyxOHFvMnVNPE2S1BhdKrMzEGloynVAJRH2LB/CrOsH+?=
 =?us-ascii?Q?pC9lPWpy7IJQGeVwPTL7wMLEsAgHpT6CTcwzZM2UA6s7FthQizNTyoW6XHjq?=
 =?us-ascii?Q?X+Dz2shIFL4OOg4fdI6+xdpfMPH9WHhtfwV7nNe7emFR3qJo0DWJxOJY/ypZ?=
 =?us-ascii?Q?8GyrittOU6tLk44Og4fM4AulwHYa4C2UeIfeGANfzNX9Ytl2S7AVqH5RQkYU?=
 =?us-ascii?Q?nmIS34ch0/FhqH8cXtqNCFqFQ5weJApEyOiibml+nX7qGpSEfXPeXEaQo+L7?=
 =?us-ascii?Q?cOoZpDxuMjssyu6KXmSlUmmmVC33NLg8dnpfm/ebQNklo8LMpMlrZN0eM55q?=
 =?us-ascii?Q?tWU4mNdZZ0LiVRUQ2qtYFXzaAaDN1NbU2ioDfnUA6eG60XvpC8vDPtGxRzk1?=
 =?us-ascii?Q?19R58+wfm9SNBuMDXpMp/G6myXS/F7W45pbaLB9ixCOj3CPiQIAf2/OE8FJL?=
 =?us-ascii?Q?xz97gN96nLJENl/NB3pppwCFiI0aV7rt6RlNBfrEgA9U8UhBVKFCkZXrZ6NI?=
 =?us-ascii?Q?dw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e0857d5-0e0a-4a60-08e9-08dd049e1ca1
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 11:18:49.1602
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BTXuKxIO+uLhpdz89hnp0+A+z7mYMliQsHkAuVDc9y+/lPMbB0+ClNOcelof7rJdJSNNxj1za/xDaJp+e6RJ4Rfdb6FHV8TNqlivxkZfDlk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6226
X-Proofpoint-ORIG-GUID: 3uhVghCFVQBT9-WxKl9hODvy6v78cdgV
X-Proofpoint-GUID: 3uhVghCFVQBT9-WxKl9hODvy6v78cdgV
X-Authority-Analysis: v=2.4 cv=J4f47xnS c=1 sm=1 tr=0 ts=6735dc9c cx=c_pps a=MPHjzrODTC1L994aNYq1fw==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8
 a=ag1SF4gXAAAA:8 a=7d_E57ReAAAA:8 a=iGHA9ds3AAAA:8 a=NEAV23lmAAAA:8 a=a5LkSv8FAAAA:8 a=GWfQyvAXmN3mebG5HuYA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=Yupwre4RP9_Eg_Bd0iYG:22 a=jhqOcbufqs7Y1TYCrUUU:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=E2cWBXyb0kjxxB1PlMdk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-14_03,2024-11-13_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 bulkscore=0 clxscore=1015 mlxscore=0 suspectscore=0 malwarescore=0
 mlxlogscore=999 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2409260000 definitions=main-2411140088
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Nov 2024 11:18:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207152

From: Bin Lan <bin.lan.cn@windriver.com>

There are the following error when building doc/examples/cmake-multiple-shared-libraries:
ld: warning: liblttng-ust-common.so.1, needed by lttng-ust/2.13.8/build/src/lib/lttng-ust/.libs/liblttng-ust.so, not found (try using -rpath or -rpath-link)
ld: warning: liblttng-ust-tracepoint.so.1, needed by lttng-ust/2.13.8/build/src/lib/lttng-ust/.libs/liblttng-ust.so, not found (try using -rpath or -rpath-link)
ld: warning: liblttng-ust-common.so.1, needed by lttng-ust/2.13.8/build/src/lib/lttng-ust/.libs/liblttng-ust.so, not found (try using -rpath or -rpath-link)
ld: warning: liblttng-ust-tracepoint.so.1, needed by lttng-ust/2.13.8/build/src/lib/lttng-ust/.libs/liblttng-ust.so, not found (try using -rpath or -rpath-link)
ld: lttng-ust/2.13.8/build/src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_common_alloc_tls'
ld: lttng-ust/2.13.8/build/src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_urcu_after_fork_parent'
ld: lttng-ust/2.13.8/build/src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_urcu_after_fork_child'
ld: lttng-ust/2.13.8/build/src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_urcu_after_fork_parent'
ld: lttng-ust/2.13.8/build/src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_tp_probe_unregister_queue_release'
ld: lttng-ust/2.13.8/build/src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_cancelstate_disable_pop'
collect2: error: ld returned 1 exit status

This change set removes the old patch file 0001-Makefile.am-update-rpath-link.patch,
adds a new patch file 0001-Fix-Build-examples-when-rpath-is-stripped-from-in-bu.patch.

Signed-off-by: Bin Lan <bin.lan.cn@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

(From OE-Core rev: 89394da1cbe98652e1d0bd59c762ff7da2d6a113)

Signed-off-by: Liyin Zhang <liyin.zhang.cn@windriver.com>
---
 ...es-when-rpath-is-stripped-from-in-bu.patch | 161 ++++++++++++++++++
 .../0001-Makefile.am-update-rpath-link.patch  |  33 ----
 meta/recipes-kernel/lttng/lttng-ust_2.13.8.bb |   2 +-
 3 files changed, 162 insertions(+), 34 deletions(-)
 create mode 100644 meta/recipes-kernel/lttng/lttng-ust/0001-Fix-Build-examples-when-rpath-is-stripped-from-in-bu.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-ust/0001-Makefile.am-update-rpath-link.patch

diff --git a/meta/recipes-kernel/lttng/lttng-ust/0001-Fix-Build-examples-when-rpath-is-stripped-from-in-bu.patch b/meta/recipes-kernel/lttng/lttng-ust/0001-Fix-Build-examples-when-rpath-is-stripped-from-in-bu.patch
new file mode 100644
index 0000000000..6da675fa31
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-ust/0001-Fix-Build-examples-when-rpath-is-stripped-from-in-bu.patch
@@ -0,0 +1,161 @@
+From 5d10459b6b5182fcbc98240d9dace026c87a5037 Mon Sep 17 00:00:00 2001
+From: Kienan Stewart <kstewart@efficios.com>
+Date: Mon, 5 Aug 2024 15:41:34 -0400
+Subject: [PATCH] Fix: Build examples when rpath is stripped from in-build-tree
+ libs
+
+Observed issue
+==============
+
+Certain tool chains[1, 2] emit warnings or errors when building the
+example applications.
+
+```
+make[3]: Entering directory
+'/home/xxx/src/efficios/lttng/master/src/lttng-ust/doc/examples/easy-ust'
+CC       sample.o
+CC       tp.o
+CCLD     sample
+
+/usr/bin/ld: warning: liblttng-ust-common.so.1, needed by ../../../src/lib/lttng-ust/.libs/liblttng-ust.so, not found (try using -rpath or -rpath-link)
+/usr/bin/ld: warning: liblttng-ust-tracepoint.so.1, needed by ../../../src/lib/lttng-ust/.libs/liblttng-ust.so, not found (try using -rpath or -rpath-link)
+/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_add_fd_to_tracker'
+/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_urcu_after_fork_child'
+/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_common_ctor'
+/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_tp_init'
+/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_tp_probe_register_queue_release'
+/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_cancelstate_disable_pop'
+/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_urcu_synchronize_rcu'
+/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_urcu_register_thread'
+/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_tp_probe_prune_release_queue'
+/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_cancelstate_disable_push'
+/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_urcu_before_fork'
+/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_lock_fd_tracker'
+/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_trace_clock'
+/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_urcu_has_sys_membarrier'
+/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_unlock_fd_tracker'
+/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_tp_exit'
+/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_get_cpu_sym'
+/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_common_alloc_tls'
+/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_urcu_after_fork_parent'
+/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_delete_fd_from_tracker'
+/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_urcu_register'
+/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_urcu_reader'
+/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_urcu_gp'
+/usr/bin/ld: ../../../src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_tp_probe_unregister_queue_release'
+collect2: error: ld returned 1 exit status
+```
+
+=== Reproducer ===
+
+The easiest way to consistently reproduce this type of build failure
+is to perform the following steps:
+
+```
+./configure
+make -j$(nproc)
+find . -iname '*.so' -exec chrpath -d {} \;
+make -C doc/examples clean
+make -j$(nproc)
+```
+
+As the examples are not built with libtool, finding the libraries to
+link against depends on the shared objects having an rpath.
+
+E.g.
+
+```
+$ chrpath src/lib/lttng-ust/.libs/liblttng-ust.so.1.0.0
+src/lib/lttng-ust/.libs/liblttng-ust.so.1.0.0: RUNPATH=/home/xxx/src/efficios/lttng/master/src/lttng-ust/src/lib/lttng-ust-common/.libs:/home/xxx/src/efficios/lttng/master/src/lttng-ust/src/lib/lttng-ust-tracepoint/.libs:/home/xxx/src/efficios/lttng/master/usr/lib
+```
+
+The current examples build with `-Wl,-rpath`  for `liblttng-ust`, but
+not the dependencies of `liblttng-ust` (which would normally be found
+via it's own rpath). If the `rpath` is stripped from
+`liblttng-ust.so`, or if the tool chain ignores `rpath` explicitly,
+then the build with fail.
+
+In the case of a yocto build environment as in GitHub#61[1], the
+following commands reproduced the warnings and the errors seen in the
+above test case.
+
+```
+git clone git://git.yoctoproject.org/poky && cd poky/
+. oe-init-build-env
+echo "PACKAGECONFIG:pn-lttng-ust = 'examples'" >>conf/local.conf
+bitbake lttng-ust
+```
+
+=== Solution ===
+
+Explicitly add library search paths and set linker rpath-link are set
+for both the standard and cmake examples. Similar changes were
+proposed for each of those parts respectively in GitHub#61[1] and GitHub#63[2].
+
+=== Known issues ===
+
+While the `rpath-link` for the second order library dependencies will
+allow the builds to complete, the examples will not work at
+runtime even when using `rpath`. From `man ld.so`, the rpaths in an
+executable or shared object are only considered for direct
+dependencies. Therefore, without setting `LD_LIBRARY_PATH` or
+installing the libraries test applications will fail as follows:
+
+```
+$ ./doc/examples/easy-ust/sample
+./doc/examples/easy-ust/sample: error while loading shared libraries: liblttng-ust-common.so.1: cannot open shared object file: No such file or directory
+```
+
+References
+==========
+
+[1]: https://github.com/lttng/lttng-ust/pull/61
+[2]: https://github.com/lttng/lttng-ust/pull/63
+
+Change-Id: I273ccddd0d0b7a1b57b9e09ddf48d8b5b41e6f8e
+Signed-off-by: Kienan Stewart <kstewart@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+
+Upstream-Status: Backport [https://github.com/lttng/lttng-ust/commit/5d10459b6b5182fcbc98240d9dace026c87a5037]
+Signed-off-by: Bin Lan <bin.lan.cn@windriver.com>
+
+---
+ doc/examples/Makefile.am | 13 ++++++++++---
+ 1 file changed, 10 insertions(+), 3 deletions(-)
+
+diff --git a/doc/examples/Makefile.am b/doc/examples/Makefile.am
+index aebf63bd..79766ec0 100644
+--- a/doc/examples/Makefile.am
++++ b/doc/examples/Makefile.am
+@@ -169,7 +169,10 @@ all-local:
+ 				CFLAGS='$(CFLAGS)' \
+ 				AM_CFLAGS='$(AM_CFLAGS)' \
+ 				LDFLAGS="$(LDFLAGS)" \
+-				AM_LDFLAGS='$(AM_LDFLAGS) -L../../../src/lib/lttng-ust/.libs -Wl,-rpath="$(PWD)/../../src/lib/lttng-ust/.libs/" -Wl,-rpath-link="$(PWD)/../../src/lib/lttng-ust/.libs/"' \
++				AM_LDFLAGS='$(AM_LDFLAGS) -L../../../src/lib/lttng-ust/.libs -L../../../src/lib/lttng-ust-common/.libs -L../../../src/lib/lttng-ust-tracepoint/.libs \
++				-Wl,-rpath="$(abs_top_builddir)/src/lib/lttng-ust/.libs/" \
++				-Wl,-rpath-link="$(abs_top_builddir)/src/lib/lttng-ust-common/.libs/" \
++				-Wl,-rpath-link="$(abs_top_builddir)/src/lib/lttng-ust-tracepoint/.libs/"' \
+ 				LTTNG_GEN_TP_PATH="$$rel_src_subdir$(top_srcdir)/tools/" \
+ 				AM_V_P="$(AM_V_P)" \
+ 				AM_V_at="$(AM_V_at)" \
+@@ -222,10 +225,14 @@ all-local:
+ 					CXX="$(CXX)" \
+ 					$(CMAKE) \
+ 					-DCMAKE_INCLUDE_PATH="$(abs_top_srcdir)/include;$(abs_top_builddir)/include" \
+-					-DCMAKE_LIBRARY_PATH="$(abs_top_builddir)/src/lib/lttng-ust/.libs" \
++					-DCMAKE_LIBRARY_PATH="$(abs_top_builddir)/src/lib/lttng-ust/.libs;$(abs_top_builddir)/src/lib/lttng-ust-common/.libs;$(abs_top_builddir)/src/lib/lttng-ust-tracepoint/.libs" \
+ 					-DCMAKE_C_FLAGS="$(AM_CFLAGS) $(CPPFLAGS) $(CFLAGS)" \
+ 					-DCMAKE_CXX_FLAGS="$(AM_CXXFLAGS) $(CXXFLAGS) $(CPPFLAGS)" \
+-					-DCMAKE_EXE_LINKER_FLAGS="$(AM_LDFLAGS) $(LDFLAGS)" \
++					-DCMAKE_EXE_LINKER_FLAGS="$(AM_LDFLAGS) $(LDFLAGS) \
++					-L../../../src/lib/lttng-ust/.libs -L../../../src/lib/lttng-ust-common/.libs -L../../../src/lib/lttng-ust-tracepoint/.libs \
++					-Wl,-rpath=$(abs_top_builddir)/src/lib/lttng-ust/.libs/ \
++					-Wl,-rpath-link=$(abs_top_builddir)/src/lib/lttng-ust-common/.libs/ \
++					-Wl,-rpath-link=$(abs_top_builddir)/src/lib/lttng-ust-tracepoint/.libs/" \
+ 					.. && \
+ 				$(MAKE) \
+ 			) || exit 1; \
+-- 
+2.43.0
+
diff --git a/meta/recipes-kernel/lttng/lttng-ust/0001-Makefile.am-update-rpath-link.patch b/meta/recipes-kernel/lttng/lttng-ust/0001-Makefile.am-update-rpath-link.patch
deleted file mode 100644
index 6aca8f85fa..0000000000
--- a/meta/recipes-kernel/lttng/lttng-ust/0001-Makefile.am-update-rpath-link.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 7d053804ab3823d40ae10d90f4efc49dbfb4cb66 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Wed, 22 Sep 2021 16:33:10 +0800
-Subject: [PATCH] Makefile.am: update rpath link
-
-since commit 6339062 Move liblttng-ust to 'src/lib/',
-liblttng-ust.so/liblttng-ust-common.so/liblttng-ust-tracepoint.so
-'s location changed from one dir to multiple dirs. which make below
-error:
-ld: warning: liblttng-ust-common.so.1, needed by ../../../src/lib/lttng-ust/.libs/liblttng-ust.so, not found (try using -rpath or -rpath-link)
-ld: warning: liblttng-ust-tracepoint.so.1, needed by ../../../src/lib/lttng-ust/.libs/liblttng-ust.so, not found (try using -rpath or -rpath-link)
-
-Upstream-Status: Submitted [https://github.com/lttng/lttng-ust/pull/61]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
-
----
- doc/examples/Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/doc/examples/Makefile.am b/doc/examples/Makefile.am
-index 57782cc..d46caa6 100644
---- a/doc/examples/Makefile.am
-+++ b/doc/examples/Makefile.am
-@@ -167,7 +167,7 @@ all-local:
- 				CFLAGS='$(CFLAGS)' \
- 				AM_CFLAGS='$(AM_CFLAGS)' \
- 				LDFLAGS="$(LDFLAGS)" \
--				AM_LDFLAGS='$(AM_LDFLAGS) -L../../../src/lib/lttng-ust/.libs -Wl,-rpath="$(PWD)/../../src/lib/lttng-ust/.libs/" -Wl,-rpath-link="$(PWD)/../../src/lib/lttng-ust/.libs/"' \
-+				AM_LDFLAGS='$(AM_LDFLAGS) -L../../../src/lib/lttng-ust/.libs -Wl,-rpath="$(PWD)/../../src/lib/lttng-ust/.libs/" -Wl,-rpath-link="$(PWD)/../../src/lib/lttng-ust/.libs/:$(PWD)/../../src/lib/lttng-ust-tracepoint/.libs:$(PWD)/../../src/lib/lttng-ust-common/.libs/"' \
- 				LTTNG_GEN_TP_PATH="$$rel_src_subdir$(top_srcdir)/tools/" \
- 				AM_V_P="$(AM_V_P)" \
- 				AM_V_at="$(AM_V_at)" \
diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.13.8.bb b/meta/recipes-kernel/lttng/lttng-ust_2.13.8.bb
index dddd3a5004..bf2524bdc0 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_2.13.8.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.13.8.bb
@@ -31,7 +31,7 @@ PE = "2"
 SRC_URI = "https://lttng.org/files/lttng-ust/lttng-ust-${PV}.tar.bz2 \
            file://0001-python-lttngust-Makefile.am-Add-install-lib-to-setup.patch \
            file://0001-lttng-ust-common-link-with-liburcu-explicitly.patch \
-           file://0001-Makefile.am-update-rpath-link.patch \
+           file://0001-Fix-Build-examples-when-rpath-is-stripped-from-in-bu.patch \
            "
 
 SRC_URI[sha256sum] = "d4ef98dab9a37ad4f524ccafdfd50af4f266039b528dd5afabce78e49024d937"
-- 
2.25.1


