Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 830C0CA5FBA
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 12:49:48 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12664.1790772581567460808
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2026 05:49:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=geqzFNwN;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4733047ffa=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UB8uBX2369488
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 05:49:41 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=cNNn2cDRK0w8Aqhwbt/Q03BDmBjX/1gPqQfKeGgdhKM=; b=
	geqzFNwNO/KZmsMXDjMCkZzmrz4v/JqePfS1TO0w26DBMBRIppL+viCjZZov7pFK
	h2U6j+2x1HBxwcSquHlA/OjNW4eE32DztA2xNB+RBTVOcV0SGzfCf/9elkZ15adb
	dcJYax5IRMfBIVNPyFPVNeDyeuYoyjSLQ0vmAC57e8zd2kjylHqVvsiaCYufTUp2
	WSmX3yx9sE2Hm33tCgVl0qMqchKnk+7KvupRRX05n/GFcWgqAmCJYTyh8nHasbWB
	oSg2JiJkJAuQ7ZJhPiIL10pLqEoHaYrrD05UvOuZ8w1YcH0EZGowNaVWldXk0xts
	6zCagNHmA7SIw8kafDWcxg==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11023077.outbound.protection.outlook.com [40.93.196.77])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gx9b1xfh7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 05:49:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rgLbuAFbozBtj3zrTAYmtzXwRsn93qx4xJW9tfE/vhWVFmXT3qbGV/+z9CjIiR0i37fjHRyRK5Iy5GP+iHXRPBXCkfuKc9Wj0tLdU9MSRSfVk+e/FNxBX/qIRF+qdERrwD8avbEIiMipuScLgfC8BUDLYCcd9cCiEj32EPljx68qzi4YXFYh2G9gQsb70Mj/rfsASRq7QLsl3s3Itws0YPISGr1mVgMH9jaWMUpjM1oMwQkWKFgBK1DAwIzkp/Exb37HQmKbGlnr+O/FIfazrRNZ6ixRJm0zMatmjT53X6CGGTdcWH2+l6fLZ5j/AKY8hHFBXv6pmMOCaX2ni/Iezw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cNNn2cDRK0w8Aqhwbt/Q03BDmBjX/1gPqQfKeGgdhKM=;
 b=dRQSC0+buskbZUnTmLa2sJ79UtQ2yM9UI9/sapUy+og3seLzzIundNDl+uJihg65urMeSYff+BOisXYaZkbx6JQ3j+T803sq3wF2GCIalY2BGfDLWXw9FcxOdvf1TbulkXiDgHPLCr6q5j7xj50vCTZhjO9J5PfS6HWhgRZuPcyavUL7UfNacSrEbzBDG/nAa/LGX/OWMiAxO5YXnge1J1+rHKoOp/ZOrZijpNm47b15X+B7cqHjRV+ThHmXfhXtdzGNHQOOSN3b+G51Aw/6un7oAMg+Nvqcu9OGwdYUTpECTKCqBiHErDtQXKbxH+hTBLm3tDmpkjSyXAFnh26efg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by SJ0PR11MB5120.namprd11.prod.outlook.com (2603:10b6:a03:2d1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 30 Sep
 2026 12:49:39 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%3]) with mapi id 15.21.0472.015; Wed, 30 Sep 2026
 12:49:39 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [PATCH v3 2/4] toolchain-scripts: source target-specific environment setup scripts
Date: Wed, 30 Sep 2026 05:49:20 -0700
Message-ID: <20260930124922.2397906-2-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260930124922.2397906-1-Harish.Sadineni@windriver.com>
References: <20260930124922.2397906-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0246.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::11) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|SJ0PR11MB5120:EE_
X-MS-Office365-Filtering-Correlation-Id: 1870cad5-dc79-4989-a8d5-08df1ef14a76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|366016|376014|23010399003|10067099003|56012099006|11063799006|6133799003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	LaKroOksbbZUDPEWbmxDHjToqqI5cDUYRIAVE/0/KbrWzwx9eFRtCfOpIrAbeLW56Sjsi0pWp3tBEJF20lm6Vi829SaZ333xNG7e3lSrcwN/4kSh+Gz9oAJqlLkmxS6MzpGkJjVfm/3oABWWGD/85I/9opBsrvJepVEj+xE8ebEgP0E9lBhwxy+szOqUzFrH3eztMdBUnTBVKKOD7idZZD7aSTV8BSI5l+wNbegKlcWSHWv8mFFqMwMVNFaDhug+ZzhtJx4OVuTnTgnAZ5Dx+/xIEHNojq5qDpC+rZq04SlXtSfpQiL7tqOloJNNeybJs461Ks/nsnNaRMxEben5OGkNBHu7oUcA0+3KhXgg1csHgW9x1gSve4IynoduleMXcP7FJfRqJ7hB8emBUOFdoLk6ac7JzTlQ+mnjb5hsyctKZ6wrb2DHwJUyKiyddnEHlEAoID3qfd4/U3chBNkYnEKFdJYM7LtCaKEcS0/hLETO6KFKdRhwjsR7YuB4waFFzG5ffboBZT6C/z3ON9ds6ShDflQAu/Fy52s9rxlAmg511NPgGyMfMLG663YnnddnjctRPe6o7Zte2mfZWtUxIssywmdai9ss90mk7HFEyz/10peQbR5AEddiHS8pOxsLAZOzgBq5+yPzoNu1QmhQK1zv++BHUpxn9MixXSTaalZrexWo+ifjbmGs5KFiOsya47nUTzRT3/t8jvLNmlODkubBNj5BmCViqTa1muaRqGg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(376014)(23010399003)(10067099003)(56012099006)(11063799006)(6133799003)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?CDnKwqlCjcgeCc/gPVOnytwyO+Hwi99OAFBsk6DLwVwgULy18zFQvyTQaSw6?=
 =?us-ascii?Q?2eFZVaz1PR4K0lN2NN1KWyq5xiiFLpMLtjMoWkPBmc321XdJcmsOQPsX8V/j?=
 =?us-ascii?Q?fz2mLxDkXQevE3iTyYDPVk4ejY55UVzDtpdnHKWrYX9KI0AjQkejkRF51am3?=
 =?us-ascii?Q?Q2LbMOajQgjcyVWnRJ4ZMhUjeCmIrN7i0DbFMUMpqyxAy/k8TE0J5czbU9us?=
 =?us-ascii?Q?gwgtXXzW15O9SP+gl/dFMSGZPFFNSpD3wo1lbC6zhz0r/Jz4H1mF4lwfOk3X?=
 =?us-ascii?Q?21rhtzDJLwWyWcKkJBcRiH9MH5GxeHSfmAEmKnkHYPIoeLzpMLRGITaGFxor?=
 =?us-ascii?Q?JROBVac3ZUX7J91f/LvR/UEfuJGw2YT/Nb+HVFnNfIn4uwUBQej8VQfjL12i?=
 =?us-ascii?Q?39cIOMkd9CZk3Ma2ivIiaIRuz/6ZPupyXKcp24GfsuLV0lTzzHVJ0dSe9Mbw?=
 =?us-ascii?Q?MW2OlK3ZwbiDFuVCznnazv8h/Img8IpdI15heW6vv3+fhyR1V3FxNEq30uhF?=
 =?us-ascii?Q?gd0+wljSwPe96dmuC61qbYvkQ+m17VdJPuIorvUHYnBiateI2laedjSBZU6q?=
 =?us-ascii?Q?yG1nWT73fE6AZ/Ah21XqJtjMtFI0LFOBtercWxyntPTfH3pNW8gVggb+FEgL?=
 =?us-ascii?Q?brIQ/l3rZjQdTi7hp1BaLVvFoX3YoWxHjWRjv2PY3KBeveULBbKmw8xOml9b?=
 =?us-ascii?Q?Ae4h/D8oQRbI2aPXORNnWHA8Cq5xk3cgWNoeoaAohmHdVNmrUL0+KA2muiv0?=
 =?us-ascii?Q?IyWla+vB4fgKF2IvIyNEzSP3oRL31nC+ZujGier48DvrAqbDY+v2CmMPTsFP?=
 =?us-ascii?Q?2RGs5HMVPDBlkBwa4nsDDw8n73ZZWk4Y16ftY+NPh9QkNkP0eOhJGogReo74?=
 =?us-ascii?Q?IctCxUzSe3Gy/HP/u8TMCwzhbrh3c48E+GnEDJ9J/0EoyPJpcxIXNNCi++av?=
 =?us-ascii?Q?1n5I09Zsfh6JCWN5ixRRjNjH8YaR1X95kPs8SINnWPzOnGMRhjH37fvLynJ6?=
 =?us-ascii?Q?0Xd+ma9xh7iJE0xHhqe4snIzqh8mSRSUDfP3YtDNjdR/HTVpOkYgjgle/x75?=
 =?us-ascii?Q?ggcO38Mf2CR22oqlwtqFjpMkccIvR7QMblq1IaALGc+6cth7NiFSm1LHjoEB?=
 =?us-ascii?Q?8kqRt2iP8f+Pbx1GBwiCJxdww3DY/7mCPH/7Mmss3ekbBtuEKPA6NvvllFWt?=
 =?us-ascii?Q?/K8yn4g7zmuGFzQ0XW8tdOgx/TYWTCO7RFBU7AbiPwmjXyJp7k26PCaULOiz?=
 =?us-ascii?Q?rgQTWB0xiPLj3FEi8P392qaKXE5RGqbSNnKnQhqGA2CZYUNI1UL25UAnTI8v?=
 =?us-ascii?Q?R3uCu20LBru2mu1n9fxjAyToP4AU9NyN7pr0Sl+Q1uLen/nF2vZa6KEHLEAS?=
 =?us-ascii?Q?4XQh/aUhfuE84tehVmbqUAYEDuGzBcdmFccTYWAqMKiKF6yvq89pZMN+rBeG?=
 =?us-ascii?Q?i64SQPOU0LeQauG5bWWXFL60f1WNdI4PHpo71WUTLmmAClVc56AkqPyAa/T/?=
 =?us-ascii?Q?e/4EwZGUG8hUgHps9oL5Bwqi0IaOZcN4GrO9mTEHDeKuRtpSJocxte6x8000?=
 =?us-ascii?Q?czqWCPjyFsQ59yqP+6tMoKYTuGHeuJprzzQr53HczU/96GQLGc/xZRP6JaEe?=
 =?us-ascii?Q?tpnhWNBboXe2IHMSnQNU/UeYopT1a63gj9N+M53vNUXUom3nTXRuFP0tzZHa?=
 =?us-ascii?Q?9fAV3CZXi9ZVSqUIqktItdBwLh0uAFe9BLq8wv4hcLAVsvPt4Rl+/K0meHmo?=
 =?us-ascii?Q?kyKup4Qf7hmNa5Iaf9KuoMK3uCdFRRY=3D?=
X-Exchange-RoutingPolicyChecked: 
	b5wsB4xYNk6tR88pA2ZWd+LBUsVYCyUF3tiQ4T+fapXdM3RcvEre8jwfgCOSWdlXG9KMsPEHfZ/BXUKnd4223tFd4lbr/J2M1C0yBUXX5Q5h0z7Dfah/8MH+EnMJ9lzrFnLU599sqEmJLZQM5tiu9cFismCBbeUhohy+ZyXNCLzQBUxexMR9xsto3pNXwp1UTb1vLJmuxN79TWR0hXGWSgadcH5nY5gO0Rso6P93hEs6ZB3w61afjGoGc1oTq0DDchdQS3ZLb1/ajfdyJYiatYin5ZNr07UVpKVRMarbG3c9oAAMuV7Z/JH6HSpgTf+ZnrrHOS+geMoKZFkw/gpJsw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1870cad5-dc79-4989-a8d5-08df1ef14a76
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 12:49:39.6415
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WmpFN2AUtOiDcEKiyHnFxO7KpXcbWhCc5+P1foerH20SCBkoCANI/CY5wWhPbEUR02a8vQ4x/CHeHwYl5vPTt7xks/S3JqmUdx0qifeup2Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5120
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA1MCBTYWx0ZWRfXx1NYLkRWVx8S
 okVXWuVdqsJqQr3E+nvzx/Im3rANa2YdvzCxLcoQdpstGqWFRz8vvd849oNRH8cx/hbMo+vvzas
 PiT9zZROYSex74bDoBhg4Jfc90EfPMgOK1NZpw0PULMctI33eM5D5gb9S6WLsA5hvjYsf6KNFlo
 USqmkaHfTglKFH4malmQMW2fdR7xcQvMsR4Fv5L/JLiPCz9CxxGZ/j/9/WoxrpL7o46ACvU49QL
 qVgcV3PNPLG99Edl3aBlP8KWHu+pcTPQq9Gmm1rxi/h084Oi+V6sRmH9YmQBUlZ8iKkt91F7A76
 y+wlYxfMHyDy9/4hwms7nGUVG6XP+O9AQDqqL82TQD4S4wcrx9dnHPH3pkfUbAIhZRLT+OftqPs
 a4MO2R/40TBMjwEveQR7FQyx8ab9A9JwGi0Jh3Qw2VKwemHmu+o1TOWpoSOc7X8SSnVqtVaE7k5
 B3r3dZMCLg+3lI3NByA==
X-Authority-Analysis: v=2.4 cv=bvrZl0ai c=1 sm=1 tr=0 ts=6abd0565 cx=c_pps
 a=I1rsLqJrwb5vkj+WUQplAA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=5IpqCTPlAPx7f6KQeWQA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: b7IqYWVW2PdpzZfExTO1NPNfhuIUub1f
X-Proofpoint-GUID: b7IqYWVW2PdpzZfExTO1NPNfhuIUub1f
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA1MCBTYWx0ZWRfX856MB58z3Sjv
 C8kM3ulfDEZJAKvHpRmfRDp1Lr6qFilY0Ce095EQ02gNWw7BYMK0UIZXsnkuXpZ7u9v/PLZiTer
 vnPi+WHq+NwC1t1j4BqpeNnTDprVxo8CQre5aENX130UMFa319lt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609300050
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 12:49:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246965

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Fixes [YOCTO #15061]

Source any *.sh files from environment-setup.d/${TARGET_ARCH} in
addition to the existing environment-setup.d directory in the generated
SDK and tree environment setup scripts.

This complements the rust-cross-canadian changes, where Rust
environment setup scripts are installed under a target-specific
directory. By sourcing only the scripts that match the active target,
the SDK avoids loading environment settings for other target variants,
such as mixing 32-bit and 64-bit configurations in multilib SDKs.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/classes-recipe/toolchain-scripts.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes-recipe/toolchain-scripts.bbclass b/meta/classes-recipe/toolchain-scripts.bbclass
index 8bfcde55b5..7b10b76609 100644
--- a/meta/classes-recipe/toolchain-scripts.bbclass
+++ b/meta/classes-recipe/toolchain-scripts.bbclass
@@ -169,6 +169,11 @@ if [ -d "\$OECORE_NATIVE_SYSROOT/environment-setup.d" ]; then
 	    . \$envfile
     done
 fi
+if [ -d "\$OECORE_NATIVE_SYSROOT/environment-setup.d/\$OECORE_TARGET_ARCH" ]; then
+    for envfile in \$OECORE_NATIVE_SYSROOT/environment-setup.d/\$OECORE_TARGET_ARCH/*.sh; do
+            . \$envfile
+    done
+fi
 EOF
 }
 
-- 
2.51.0


