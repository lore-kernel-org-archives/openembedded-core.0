Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83B88C3ABC3
	for <webhook@archiver.kernel.org>; Fri,  9 May 2025 04:30:21 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.7019.1746765019608218809
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 May 2025 21:30:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7224ab9c1d=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5493o2dg020278
	for <openembedded-core@lists.openembedded.org>; Thu, 8 May 2025 21:30:19 -0700
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46djnjxpy8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 08 May 2025 21:30:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AsHph3EQuwC9JjVowj8ExLRcSmpx8EJX/nd4lWABeaKyObRTxLecSGFUGGCjQBP1MV5rlEj++SGMFvnpl3WDOmR2BRygIDve+ksvSsURTRSoZ7QLGdsrMmq7T1nwYxE9nqHyEUwImRXqv/aVvLW2zU/+liFTMZKjeqoEUeFUQyMYPuz/8zvTfNUM8T8gogZBAvjoMV2tefueQq3cW9B3ZzWVh7kWmRMjPVNzECbg5DAEIdS8UtspHjc5B2110gLYfCh2xGatb2jU0u9UZVPuUObAdzPRVSWGC35XnytoBeT0x7eVg46MmWwiGbdYI1nRetxvSgvIe5FDYYMyrwSoAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vgksXOsQl8ubnlJBU7/ZfOpSce2x0ampMSQpo8d90Mw=;
 b=WzlBg0snNeWC/QsIb6GZpIyvu9/7xlfrndKGQzif3YZDyVWBDXrcSUwcIiINll/TgxBV9GGNJjWrZ5xf1G7Y0U7GvmA0iwVjcPkOFuEzBsGQISZ9clS/YmS8c2xtHPjDzxCK1FXYrl5XDUPzw6mBJC9sSrmvqPfc9M84vZDdah/HN98Ru1oCirYH+C6Sm+a+a33ZdpkzFisFHw9j7YgtBtyWP8ftURlMh0g/VoQZ/wJKC4UXWtbsO1axIrjT9YbBHaHT1F/kf7/1ZIx4Fkg10yX8eqldUnlVH3XtZno06yJk3FbWwKK4OsHNBUQ9P4pqVKxHXvkX7m3ox0pQm4KhuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by CY8PR11MB7058.namprd11.prod.outlook.com (2603:10b6:930:52::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.23; Fri, 9 May
 2025 04:30:16 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%3]) with mapi id 15.20.8722.021; Fri, 9 May 2025
 04:30:16 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com,
        Deepesh.Varatharajan@windriver.com
Subject: [kirkstone][PATCH] glibc: stable 2.35 branch updates
Date: Thu,  8 May 2025 21:30:02 -0700
Message-ID: <20250509043002.356672-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH7P220CA0027.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:326::33) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|CY8PR11MB7058:EE_
X-MS-Office365-Filtering-Correlation-Id: cddb933d-660c-4f84-13cb-08dd8eb232da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?uKW++gDhuzcOHhDbvDe3EhEffAmI4utDH11jOb+2tSXGp9WCTPqDXM0fwgZC?=
 =?us-ascii?Q?A3MMWphGt2XyWc1/QrbHjuz3yrJo2WSWAgHO2qT87DeBZN0i1k3iux+lyizG?=
 =?us-ascii?Q?LLqDlflE54ov0bALebjo5DwtncUrbqA5pHTcyLqHbDcNLc7/IXZS9RCVk9sn?=
 =?us-ascii?Q?PIB84ZTzXRZ8I196J2QBWWuKNi9+Fh6MEx1rrGgRf8UZN6X6Mqf9ev9jk96d?=
 =?us-ascii?Q?LFUFIeOiTK9eiwJiJ0j6LVagOFC09X9jU2Um+kDYHl5yaR8FqAsc9wRRmo9m?=
 =?us-ascii?Q?gb7GIZZ+k52ZS01LaiL87d7Jli87XvbA1yIDqbPU/nS1ZiKMCIgbCLVnv/u6?=
 =?us-ascii?Q?QnqaRw7OAantUIO7VP2e6J4YV3lgEKEEHGYbaaMlRPVsjBq7cQ3fJrOXhJ9/?=
 =?us-ascii?Q?X5gugMt9r6k7ogLIoLFHo8UI/+X1lL4ElxPBF1FLkjP2CPsSnUSvC2CAfVgQ?=
 =?us-ascii?Q?cwEWFLHmq/fzYZYw0IrsNQAFsH46Km8aBrivBhUAyoj8XJautOLKxhE7B8EF?=
 =?us-ascii?Q?w63xqDcIkc5QENaKgiIWQ7Rnndn5qhpxf8LQTkcAjkhj92Ju8Dkg1EEyweEd?=
 =?us-ascii?Q?cIp32jnCGlPapqe4tYcOWlxLGssgFtmTaHhohf7zIdgGlmODaN/w5gvt6VX6?=
 =?us-ascii?Q?ZFOPGKcNkY5RKH/dV8QbAqlEYH7L4rrH6Gq1i/ux5xfmODnt95TzX0RNppcu?=
 =?us-ascii?Q?kjIEbYW6dSgKfn2zMDmaifiAAKv/fBgSdjOs16prcJ6RyDPw6DPvs/Adx3s8?=
 =?us-ascii?Q?yBKS/XMrKy51afby23AJY3tIQbxn3B7+YzdIGKw2WynPjrADhE22h2i9Bbmq?=
 =?us-ascii?Q?A24D+55mgQlnJHgad9+yLplqsbGoPdjn1Awux8r+Yx3lmXbfQYHLVftpN94B?=
 =?us-ascii?Q?4gttsG+4UGfiyZmH42Lz8lI8GTt+NFRcO7TNn1+q3FOW74CwGAQ0ng1mrX4Y?=
 =?us-ascii?Q?j7pkpfpY2ecajqA5MDAZx/6AIKnhU0fFmjsc2R8sEIWh3nimEmBE2vOehSDj?=
 =?us-ascii?Q?RcXaf/NDYi3aFcddvRvqpTcIQ5aON8ZcE5NFJ+wulLINtMUykyeskT+yuTMu?=
 =?us-ascii?Q?LfKsJrhUW8PIvGx9IagaDiTm0xO7d4N5Rs7JNVSzd0/9InWE4iXRfW2QpLiP?=
 =?us-ascii?Q?CWDI74Psi1FClHL9c5g+yltomCUsM2mTBJDpzGSKnYu+AmI0v2U/uU16LVTw?=
 =?us-ascii?Q?evOYItZIPDCjmcWrkM+gTxVVSmzbrElGj4+wWcrNstMu14nu2KsfslmryTWu?=
 =?us-ascii?Q?HcJq812mW30OYADv/OnStXSNmUv2HSqRM2tpS4IKwqVOPAeHM6KxksrcDlGg?=
 =?us-ascii?Q?y3rhxjXp8isZJ84FNZE2mfWVI04pJDzdyvc9zdl4Lo/EFcw1B+gfGq+A4BJB?=
 =?us-ascii?Q?0B8RzWG1Nu34fQugH8Kh12mx3c2Luz7N/Y2Avccu42o3kMEvk3DAYwXE/KhX?=
 =?us-ascii?Q?A7Zr725XsYdXMF6QzAuXNxtAZZvpq2kjvDJxXw8cn6mbXSLxxank9ZwhkR0c?=
 =?us-ascii?Q?cO+Egeln+l4GO2g=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?d2PcxV4qXoK7wUX7F4nyoAL6E+yNGzRTapsxThhgPV85tjnDlefdPi7/3v7F?=
 =?us-ascii?Q?NSqccVH+TZ2DlJoXzAkGBxR0D8lsjbcbqMn3c2xQkaBPUMFyIY00Js2DW3e9?=
 =?us-ascii?Q?P1Jqb/6yZg8+6Hje9No4un9Mc+Wnp3yWyCtiWTZyEA+dVsZR2jxOqda3TG/l?=
 =?us-ascii?Q?kWJmzUA9rfmj/Cqb+j60rtfV42fLFpyx3C7+BsADQ0E7mih8Igf5hFC1qV/W?=
 =?us-ascii?Q?ttqqtEGyTQzkNaf2U5NpvFpJKYGR673AZBxXuttX0o0dhvwMxnzQwgNb15pm?=
 =?us-ascii?Q?3s1c4hZsLRoX9kJ5WM/4xYodlONGimMdsmfg67DY8TxFZNE++Ytaiy0PB9y0?=
 =?us-ascii?Q?vVQsak4wwjka+7mE086kdPC5XfsYX+0LZyTDCKxACOGDoNq3Srpg4QWUXuD5?=
 =?us-ascii?Q?Ua7xnuXkRTFvOLk90PxaovZuMOWV/exRMO4JmYQKcf+O3PnAsMEMir92jZNz?=
 =?us-ascii?Q?ZaZjVUV6uSFyaDhpxYd7S9LNMoSBF5sPAxtartsbsznyRyAGeRjU6gta+qEt?=
 =?us-ascii?Q?+smp8kKZYAbwviJcuHjQ/I2WcdMJxCL8lC22waroJlo2arkyiY33Hl1rdBZA?=
 =?us-ascii?Q?Nsnf5NgGDwiV170dAg1vMs94khpd94hPak/Hy1BJxGtFN4buiTCL5cNgr0oM?=
 =?us-ascii?Q?1bCqJPCPYDDIhR9NPoIXI+g8/kTeMQhNkBPPM6vYtJx/u4+Ja863a+LT2ZC7?=
 =?us-ascii?Q?Sgu6a9emET4FeAew+XNxkBHZqRtWZJ6oCCtaA//RnE93ekhT/nEOR95ykjYW?=
 =?us-ascii?Q?sHdljsU6uOtTpzZfBF+nSCvyzPBwvcc6UMX/seHN9v4G3cpKhJI3aF3CXaI9?=
 =?us-ascii?Q?DeBkkWLEQ2DBJZOFz6JJZCzg1RNZFArBOMI2t9hbNmAhYhzXdAc51UleRmAk?=
 =?us-ascii?Q?63jl1TJ16wart2OQw3X4Avow7t9C7VzCvFa7hzt2PgesHe4+dAbpMLXSqwG3?=
 =?us-ascii?Q?2ldJZ/OMOPoUcNT3UDybetX9UZRUWTwhQKpw8dxaF+PuX3Lw0aBg9UxNU+yz?=
 =?us-ascii?Q?c+ucdH5WXeA52mxSPboiKY8UfA0AjlSnQtOS9IsNNFi1blK0rDMo0hesl4Uq?=
 =?us-ascii?Q?tncV1Htj4A4gMMq18Ku0NNbgmqNIOxqgb+ayNAAbj//2VtKJ+DP+7+oWOqoG?=
 =?us-ascii?Q?8cerQzMa/R5nzBFekTo+rSJspHJ/n9Lv9CObX/JXmYXT7lzPlWkJSMySFK9P?=
 =?us-ascii?Q?g0duWkP5vd01RMfz6OEf0nX7uTde4XihZGVzyPTrgc/AU9wJwnH+ZXZIWBnV?=
 =?us-ascii?Q?2N2M9LSML7mmf49e+uSgLFd2rf1kRej4xuWtk45yzgpw6zmC2Y+4omoQWyng?=
 =?us-ascii?Q?AHY0dRvRTU8CB9x6unxbJ/1i8SBnVioeXg2oAD1V3ACNCqfRxSfEZSYa2Wrf?=
 =?us-ascii?Q?kalLG46dUFf9H+lJRNy6Pry71ONuXk7oKlbTGi6oS4fV0h/SWH0iDJInJo4d?=
 =?us-ascii?Q?m22iSsvyZYLQEv0APULNVKvQh6c4ggaGSTF/5reELtdlVIvUDya1TlG86nqu?=
 =?us-ascii?Q?tTOVuJf63/EZbDGiLccXjkA24kMuD8G+GZLskb51m1VR9TdyCROS69Lz0/pD?=
 =?us-ascii?Q?6t+F5a554NKSgzz2AYrbIy5QK+IixSz7Acnn5KY+duxccFUtCekvMlWHVOKo?=
 =?us-ascii?Q?kEr9EV7Eie/kSTn3ofLT9KE=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cddb933d-660c-4f84-13cb-08dd8eb232da
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 04:30:16.6221
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AdqZwgMGZgjVQ4D2l+WXm1dXb61y7rqSVvd9aIhBFwfb+PyizClhgRhn+CYsOebyzV5kW2oumS8PhBwJH06MKsLXKNLOolkhbOKwESbZ6dZZTMA/vZu7qGAjAK6f2yNE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7058
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDA0MCBTYWx0ZWRfXzQGG6Jv+3sSX WA/184C+bPvPV1VND3ieIXf2b9dKnO7XeIxPt8OJLPOia1Q7F7YRX3j62j9Ep7MpT6nerWHw9m0 em6LYIUrGr8p/xD8fthXhwFtYdb7CjrP8NwENk4k3mXcXE0vmMZWgCTrfWjHfMAl2ElK7CfMibZ
 k6/GUjLt9IhAoEZAXsKx3Hxp0FYvjCcE1yODYJAGLhcC/A/WP36IpCNh8pS2XdxGNt574zLhL16 H1Ey2R6Jwd26anEWrEClHwUGN+7SYJJ0wDGkPOaYJ3IPxHkSJWYM/6OKQIBU31viGL1G6p15erB LzmJ7P9dTTWsKErZATIyYT1DkNPUBnw6SyNn18NNqqtFdhBABUZHhazOIdK2PtGxWFDgEQIDlMX
 mpUj1XLE97dgj4+OOOKVR9DC5r4fXjd/B8P2tzI6h08ykphLV9/wg8qH+2bEP6UiBxPnc7+t
X-Proofpoint-ORIG-GUID: c17HF5Ramb6ifERu26kC2LzccHV2m7KH
X-Proofpoint-GUID: c17HF5Ramb6ifERu26kC2LzccHV2m7KH
X-Authority-Analysis: v=2.4 cv=KdHSsRYD c=1 sm=1 tr=0 ts=681d84da cx=c_pps a=ZuQraZtzrhlqXEa35WAx3g==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=t7CeM3EgAAAA:8 a=CCpqsmhAAAAA:8 a=yxZPmukWksV4_oA86hcA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=ul9cdbp4aOFLsgKbc677:22
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_01,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=763
 suspectscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2505090040
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 04:30:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216183

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

d2febe7c40 math: Improve layout of exp/exp10 data
20b5d5ce26 AArch64: Use prefer_sve_ifuncs for SVE memset
9569a67a58 AArch64: Add SVE memset
59f67e1b82 math: Improve layout of expf data
904c58e47b AArch64: Remove zva_128 from memset
8042d17638 AArch64: Optimize memset
be451d6053 AArch64: Improve generic strlen
8b3d09dc0d assert: Add test for CVE-2025-0395
29d9b1e59e assert: Reformat Makefile.

Testresults:
Before update	|After update	 |Difference
PASS:  4832	|PASS:4833  	 |PASS:  +1
FAIL:  132	|FAIL:132	 |FAIL:  0
XPASS: 6	|XPASS:6 	 |XPASS: 0
XFAIL: 16	|XFAIL:16 	 |XFAIL: 0
UNSUPPORTED: 200|UNSUPPORTED:200 |UNSUPPORTED: 0

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index d98b6a4911..34b199c02b 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.35/master"
 PV = "2.35"
-SRCREV_glibc ?= "549d8315791aa8176ff1537db3e09c185c6e602f"
+SRCREV_glibc ?= "d2febe7c407665c18cfea1930c65f41899ab3aa3"
 SRCREV_localedef ?= "794da69788cbf9bf57b59a852f9f11307663fa87"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
-- 
2.43.0


