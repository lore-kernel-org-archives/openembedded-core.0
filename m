Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 704E0FCA162
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 17:44:38 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20809.1773078277458366615
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Mar 2026 10:44:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=LtIeqT9E;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7528dde4fb=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629BLC5w2723199
	for <openembedded-core@lists.openembedded.org>; Mon, 9 Mar 2026 17:44:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=fUiq63CpipNAeH8sVGbYIkpQEnqxRiRjTd/av/tJzZU=; b=
	LtIeqT9EUflcrLsKOEMuVepJ0X1OHXc/8xRRTDB7s21+7QAlIr/NqGDdH6cm/zVJ
	DKfYQyCE3qAy4h0HyeHG25IZQ+4EKEsNKVTZilsVg8tky0D6LNB3a/4pasuF7PrF
	bLctnGRSqid0rMhF6AJqYWq08vJgnnnYAa3UzceXCzVDKi4rzfKLcCMdgGk43MA4
	E8Xt1Bt8MtLCG4y0Inx8oV0LyY+LWvz4g5Pekdhllo/AChXig/MIwK1DuMl33q6d
	2/zxXnPJdauOIdsyFoDzQVFxOzBl37zCLup1td0teaHEQwCRVUvdpJmPgPAH1Ywc
	V322jz3z4D2857uXug1cwg==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010007.outbound.protection.outlook.com [52.101.85.7])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cr97va9bs-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 09 Mar 2026 17:44:35 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y1IGY3k40iX56+ycb1PGp+D5ioR/S9dIu1kQk3+s68Z+fULvwJ+5a5qtJnPMnxu5M/QraaWiYzWinnMmcP2SrQMqUEKo4xSZbK/uI6zJSI2Km7DKrepj7qGvJ2gvgOtNSIWx0/7c+WLwvIlNMQ09u587qXVaf3UzxnTiBSt8gKlRtlIxDL6Wf4DzK6rD4Mc6sA/NPZK2XqcD34m7S0+P78cFLGzrbcxXtaCXf1fkhuqlSIQcLk7inlb3YMa2FH9QHS6oW7u3oGKqxfQksPBLBOutQh/IeU9lSJ3LsGf7Waha2LjT0uLExCMDkjR+IM4ASobY+eA6DDLvOJIyLU/A7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fUiq63CpipNAeH8sVGbYIkpQEnqxRiRjTd/av/tJzZU=;
 b=s5lO+SQ+tfEkreq9NdiOEyUc7radB9uvh3w7GOIgrli4JtBknYh38xuIm/Ep4g+pjm/bncU04arDam1AMPex6nyg2BYZrjxzTU3UIddjbhMScDHaQ4edgGJk91pt9jjNg9mMWP3PQizXyYZJpN7OQ/WJJOT45+XnBfQfQ8Ti8rGtTyRKOGbzYgIkHypk/yunR3CxMKMY43BuODj0xzRSHj3scshkhDss3hJQ+QzLHZ+hpRMF+sMfLGe92erwA+/7Wh4UY7KuhaW9D3cfrRV2Ov+X6EaYNImemKWihfF2M2wFkGz6bchzeKN/MFu413H/vPbwlv5K2q/Q7dk8DhsCTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by PH7PR11MB6029.namprd11.prod.outlook.com (2603:10b6:510:1d0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.8; Mon, 9 Mar
 2026 17:44:32 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9700.010; Mon, 9 Mar 2026
 17:44:32 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        yoann.congal@smile.fr, richard.purdie@linuxfoundation.org,
        ross.burton@arm.com, bruce.ashfield@gmail.com
Subject: [PATCH v8 14/14] runtime_test: Add rust-out-of-tree selftest
Date: Mon,  9 Mar 2026 10:43:46 -0700
Message-ID: <20260309174346.3384212-15-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260309174346.3384212-1-Harish.Sadineni@windriver.com>
References: <20260309174346.3384212-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0085.namprd05.prod.outlook.com
 (2603:10b6:a03:332::30) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|PH7PR11MB6029:EE_
X-MS-Office365-Filtering-Correlation-Id: 65c51aef-c94e-4385-ee56-08de7e0385b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	Fs4r3IML6PForYxB/0nlaFvBo3p9WkZopFAVSkZGSpRhWmGSsCH6PhcaMTUH5E4XWGX1HiL2fCmDjRffVf2lyOneuRW0VlZCvmVqTj/8OyHPghH4lGpS+MO4TCMJXX6KxTOIWpq6Rv+IJs1iQ6qfec8qVmMpAK0EdqEswa+3yi3U/ODbn+oRBq/1lQIB4qcD9T2o9dyy7CTPO+rHmutYF7ljgldapBiirXJIdNrbzYj7ADeGDZXrE03uDlKo6lETiVhjf79vCDHqw4ZcDEJg2Zj49ECBWyJ+81wkT7ZOyhqAfnnNeUs3Cpfl0C7Cn9C5ffUbmvO/apcBMx2v/G9ogjlzo9Db+NF8mVc91CBgHF1VzGutxpu/p8NclO+fpWRSIJR3zBdJGoHCE0w/AtzTbmEkQBJLqB/h34gL/JJAhBosy2ZYmgCQUtZf/JKT9pU+FySZxsOUNTM80x/0bIVUDah5Ys8OgiyG8zUFcvQwePwfgpgJAfZKI906YW71M2zJhsj04HDxw+izYMpHuOK8mSRcrJx2Nik9tJRZDl+EXOXbUMadx0E+4NOp2Z/LO/WOSeiMV0pbLRBWeT9jA464dI4+yEYNdtARzM8doen5aAXxvo99Mq0PHAwQ4abHa2p8Y0LBT+75p7b1mEgxdlboKLMfJQYczr7zCCAs6csYnDl6u+MjXYfiwoT6YTPEJfbKZXtjyythunN28m6y5xkx3OkbGZZ/0AXaWdUAJPh0JS9oqn3lQJDicfuaB2p71320VjL84fNGAjOSTgXLWm1UPwbiDhPt5/r0ICK7nQDha4c=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?cgUGW5necKfhgjACDenKbXGoraRk17lDF/hz+u6bamM6wncFpHBvxKpeovxC?=
 =?us-ascii?Q?9yHT1oGF2k49m3oDWX3JOZbwk2ZniFG71ZVcktEH1b4D/LZVS76FkjXOAgY8?=
 =?us-ascii?Q?Pvr2xkD2hjy5AsxA3VQZdNYLdKEKHx/Xr+VcVMlHnhhaGKm8KLuDgbhydH9T?=
 =?us-ascii?Q?8kAagAppvUQAOYrNFtUvAYhgoVGAnJdD5+CneXb3a9P6HXze0/BWf0UkB8GW?=
 =?us-ascii?Q?kqu4K6eYZ7A2f42/qNOC7V4zPv3ZBTdYA+rx6aHUwF2QW+su4m9Oe2+bTuEE?=
 =?us-ascii?Q?xJP0aLiTKnaRTtr3y8dZjPL+x8odRO88BRLKtZBZFVMVOzNLvZi+VQXRPpQB?=
 =?us-ascii?Q?mVCNholtiLYXTvD3b/AJtXpyjW0me9hh1SiwkQNEPG9PkbuzLLthGUYmUFU/?=
 =?us-ascii?Q?ZnGUM3+fQKrOau6GzRzF4zyFGdw3YUbZX3NHKj6OG1LMB0ps+E5hMgJ14VD/?=
 =?us-ascii?Q?/NcJqkFrfh9CnWE6pbEokENJtTeS99P7mmkffCfd5honul105xZZDSWaoM1S?=
 =?us-ascii?Q?IKpz1a/zAQCYvoHNCCl04vqiFFJ/YOM+T02CpLwZDrf2l5hD7wxjnOEZTyL8?=
 =?us-ascii?Q?xicnqLFxzfad3bA9tbYW0JzmDZ3DnIVToyxz/60DV6cyd//fb3d13YsXuyyw?=
 =?us-ascii?Q?rTielal74ddiekiftQL2L1NV4lfJbGkq82yG4D5DybHR9sBbIUiLBdMNwPvv?=
 =?us-ascii?Q?yJc4HyYpyFXcNdgCVduE7vEZS5vpY+HIkogAod6gCW4TBw+zAj9yV2EdJXAh?=
 =?us-ascii?Q?wl4PveHQWoDg5Ymr8KL+regBxj9TBYNtcvUfTFoRZ/G1kSQQZh2PKkVi7W0v?=
 =?us-ascii?Q?qZ+nBegmBguMuVBQ8xJQqrY/gY/0ZZzNGPmgpZxGAybmLBqGl4kZ5vzp5Ffe?=
 =?us-ascii?Q?yVCfIGWL2PdzZYXmGmzi5FIx34I/9VaElk5Lf2lRsrFYyqSBrt/7i3FEXGnT?=
 =?us-ascii?Q?EQbralGD+jddZ6/ig1+RWKwIEuZ+3/wSabvVepWzspLnhjn1YFADlDmOiI36?=
 =?us-ascii?Q?UQyIZYrJ0j0URdqRoTslx20oRqSUcT+L/8yKD8mnbAd7h57dkANjKF44RSkb?=
 =?us-ascii?Q?s/Zl67Gpb41f0uQyBQXrYen/BoN4Xg5bOcBn0vBKaf7vomb7qLvIClYhaWjK?=
 =?us-ascii?Q?psI5+kugMV8dnSOrF/2VLaQg3g7qqTu/8VBEJ9vuY8VbPmMmsY9385gMbzZh?=
 =?us-ascii?Q?AfsQH276zz8bnKs0VjOGVSyo9Eh8j+xomvBDxcTjISyj+GbyvxV5XQYURtA5?=
 =?us-ascii?Q?K8ryIC8j7/DUtfp0SNr3tJGwvt+8CTrhWn0ff++8WLg/u+TrghrG5oOFKiOU?=
 =?us-ascii?Q?Zyu41Z7sHbtcRB+0zwpeT+LxgAXK/bHvJ2cygvvhVkZ72+NXF8EAOVydQTYm?=
 =?us-ascii?Q?99MYDf7F2IIpAW+jAbrnkjd4wSg6jndkh+iH8vBJef6KbZwb0SxY79hhZZp+?=
 =?us-ascii?Q?gOYuUq73JFgcsr0zqPoqw35uBMAoVE5TiPvIfI4z8XyN42yzi1Rtk1nswqXd?=
 =?us-ascii?Q?jS19insQ6/d8r17IMtoSDPY0QnqiLLZx58sIEtoBijdurgKWQrwc8cW1LoC9?=
 =?us-ascii?Q?myXu6kAg6AvFDW75eqbuepwVYFTM21ZW9JPOmTlVWFwMgLmL+QOXmnjw/Ug5?=
 =?us-ascii?Q?GHvkMrcV9QVgPPCqqT5JFfGeJV04r40cee+sV66r/YM21c++cnIWOL0mU4cA?=
 =?us-ascii?Q?UgZW8bVf7gY+x+6U8ZgBYtXwqcvr3sWCUNhdxS7fG1SyiiqBX+98+N4Tm8Av?=
 =?us-ascii?Q?0Wq/PK6SZ/jXyhkUJ+zwRql12YWLHMA=3D?=
X-Exchange-RoutingPolicyChecked: 
	b5vwJfDnRgCoe+vTE+GzOE/WUG27sszG1lc+zmu18XeEBERK6w8o6jheDhIQ85mIAF0Q5UpO6MtBlUJw2pwqcaIhEE3MXIkp9maW8M/Lk7eTuKaDRLq3qS3l1HQlL6nfNgU+Y4p4EuSPb2NqrTIHuSOwRW4QOF+O12jB8nlbL1kQAqhqCsVqQtcDmCUOurA3O0wB0n0RLtLpJgOf30WsXmIuwsMfdNTwFOhla38y9C3Rh9qstjJvWYb2dxXqRDPfRidw2AxO0BJ3czZJfNf16t8jCvPsMxTR3aULk+KF+DAUXcjphYHJ7vdQ9VpaftYPkTlzAgIeolD2NVJ2hvoW6g==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65c51aef-c94e-4385-ee56-08de7e0385b5
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 17:44:32.7315
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fp0lTGz0i+NL3B1dlpPLtjzESBYUlJUKcC+WBHhsR6meZ+POTVT/vzMtTAphYnnmXaDwsAn/YBLhYUfrDz+2HsyliSgWzvWJBXYrnKDrkZg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6029
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: KQqI8j-Z62ANvNC-40mcbkoEOE7dAvCM
X-Authority-Analysis: v=2.4 cv=B9a0EetM c=1 sm=1 tr=0 ts=69af0704 cx=c_pps
 a=x36oJTDjInEio3y4qvlK/w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=iGHA9ds3AAAA:8
 a=t7CeM3EgAAAA:8 a=PMCPsi-Yzk6GkJUXyKcA:9 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDE2MCBTYWx0ZWRfXwb/yvOS/cm9R
 RjF9GpPxl4pTeJ/pwpfGqvcQBeYKNfl5mwncuF0twxPwCOf3n1PQ2NpE5MXX8h85gIlKq6Un8LL
 g3/JdDF8aCqgwjhA/LZdyDcs6CqLI1ux4RBPR+dG74U3rTzUvFnobSzQafuwQ3BlAAr/xmbJcb+
 eEnk8k6IP8fpM5WqPLp81j4pYWXPwGJ+k8YJWreCsJUlK4OAHOJI9yTNMqMLa0b5C0KisRxBS7n
 ZA1/OZGkcDoufCj705jZNzhyNQxiMZH5E4pX+uuq/5xfWXFR4feH8deaGcEGxART/XcHk7b0C5A
 mWpR622Fc2W4psifDjsF3LeS1dq7f+VU8REKEaXeKrs6vXBy3+BIu20GJOKM4mOrn8HrQBd8jR1
 YDvcSS7YWzzKesfWWFEIwATGe8xcfhICE5V1TdIsbC04HoUOLNdkzRSc8WNS3x9lnF1CvP0YexY
 A3w9a6W7PSrxG0qi0yA==
X-Proofpoint-GUID: K85BWsCRxDY37RUc1GgDfxlCoh4phuNg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_04,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 suspectscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090160
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 17:44:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232743

From: Yoann Congal <yoann.congal@smile.fr>

This new case tests that the rust-out-of-tree-module recipe compiles and
run properly: check that the dmesg output is as expected.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index 6b7cd45684..463dcc5396 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -493,8 +493,11 @@ class RustKernel(OESelftestTestCase):
             self.write_config(textwrap.dedent("""
                 KERNEL_RUST_SUPPORT = 'True'
                 KERNEL_EXTRA_FEATURES:append = ' features/kernel-sample/kernel-rust-sample.scc'
-                CORE_IMAGE_EXTRA_INSTALL += "kernel-module-rust-minimal"
+                CORE_IMAGE_EXTRA_INSTALL += "kernel-module-rust-minimal kernel-module-rust-out-of-tree"
             """))
+
+            runCmd('bitbake-layers add-layer %s' % os.path.join(get_bb_var("COREBASE"), 'meta-skeleton'))
+            self.add_command_to_tearDown('bitbake-layers remove-layer */meta-skeleton')
             bitbake(self.image)
 
             with runqemu(self.image, runqemuparams = "nographic") as qemu:
@@ -508,3 +511,14 @@ class RustKernel(OESelftestTestCase):
                 _, output = qemu.run_serial("dmesg")
                 self.logger.debug(f"rust_minimal dmesg output:\n" + textwrap.indent(output, "  "))
                 self.assertIn("Rust minimal sample", output, "Kernel Rust sample expected output not found in dmesg")
+
+                qemu.run_serial("dmesg -c > /dev/null")
+                status, _ = qemu.run_serial("modprobe rust_out_of_tree")
+                #Disable status check due to intermittent failures on armhost/qemuarm64.
+                #The module loads successfully, but qemu.run_serial() occasionally
+                #returns an incorrect status.
+                #Bug report: https://bugzilla.yoctoproject.org/show_bug.cgi?id=16189
+                #self.assertEqual(status, 1, "Loading rust_out_of_tree module failed!")
+                _, output = qemu.run_serial("dmesg")
+                self.logger.debug(f"rust_out_of_tree dmesg output:\n" + textwrap.indent(output, "  "))
+                self.assertIn("Rust out-of-tree sample", output, "Out-of-tree Rust sample expected output not found in dmesg")
-- 
2.49.0


