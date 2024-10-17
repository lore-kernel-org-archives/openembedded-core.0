Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15A70D37483
	for <webhook@archiver.kernel.org>; Thu, 17 Oct 2024 12:33:15 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.47246.1729168392005808207
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Oct 2024 05:33:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=002039483c=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49H4erCt016541
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Oct 2024 12:33:11 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2042.outbound.protection.outlook.com [104.47.58.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42a3dd9w71-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Oct 2024 12:33:10 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XbMyurReLtqca2PS6RIUfutMx15i+ITNOhBXrGAgpezIRNukLGTHloL+gnMLwFobuUJLI2/0NuHkBiFbmR3QiXMV666vHiLPbRcGifg0aNNE/OVEkyOKZxOzicS8EnjPPU9SvxG4IqvDsAwA6/8RHKrw3uwfvjjaDOOPx7pcpPp26VmHaQHmWIh14MNgpjrZONYYnCpOyfv8qtI8Pcq1VLUwxSGIwrXGjABwbwkWGbrVqKs+lmsRL9G6x3qlp8GqkueOmznndstwp1j8hRM3ZE9EZp9Mhub6mdw6AA6iCSnxFX+UOju6vLiq3+jC+s+VFyZw6AAruiur4g2QUhWbqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XRrWEC9u+34IVT9n8k0LUKpIySGU7T3GO4EFWfEayXU=;
 b=swBLeKH6sRNmqXjls3qat/nxBCHUEyWmtUIeS4tYnzntNTTvsa30CN2Avpltg0zr1IG7YCm2+jroB8d2fWkMlo+WmyeOFo0CSQ/dcTruxOMioaHfxz70tN0Uu5LOk2Sxs7W+VxG376Kx06QI3NfxmUsKp+r2BVrQM467O06beCOti9hwSP7bF+1g8ibGZw67x/kfP27ewIWFl5zmXsDIcuq33Z10qlbLZhdXAm7QwpayDrTPm18qYSn53G9cwK6flVw2EOo5wBOQ0TW/u9mGsQeYkvK2IpNi4k7b8LUh+S1qBSr/R7Xzq0RI4gUlGjvdsUOBls1uynukDFFVLsknpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by SA1PR11MB8349.namprd11.prod.outlook.com (2603:10b6:806:383::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Thu, 17 Oct
 2024 12:33:05 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%4]) with mapi id 15.20.8069.019; Thu, 17 Oct 2024
 12:33:05 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Naveen.Gowda@windriver.com, Shivaprasad.Moodalappa@windriver.com,
        Sundeep.Kokkonda@windriver.com
Subject: [PATCH] rust-target-config: Update the data layout for x86-64 target
Date: Thu, 17 Oct 2024 05:32:44 -0700
Message-ID: <20241017123244.2418344-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR01CA0015.prod.exchangelabs.com (2603:10b6:a02:80::28)
 To SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|SA1PR11MB8349:EE_
X-MS-Office365-Filtering-Correlation-Id: 24c40007-4d26-4948-0ec3-08dceea7d93d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?dG3FjVG4F2kBYhDLUZUJBWvp9Fy9Xb1PFOhWuFnEgFm9BrUuoH0+rQUf3HTH?=
 =?us-ascii?Q?2pl2lA9qrwZTZMfYHyw1xJWfiJGaUiWrO7fhEzWPn5Kk4pJLzUtrRf3/6o6W?=
 =?us-ascii?Q?2bKV5kS37CnFO1FoL9zvOW2RWbeTyDuwRKVPU4DM4BGal1z8mV5qT6CH31EA?=
 =?us-ascii?Q?XxdsE+4ta0uW2rGe1oTAsO51vV+8QLtheDA1l2fPVfyiMWqIbF7c4v9IG+62?=
 =?us-ascii?Q?71s79iWttJ/Y+V+silwbhagE3tWx6XHaMuiX8hvxfj8Iw1zYiACRNnaLuyr4?=
 =?us-ascii?Q?SyGIqX0tVKfGU/NKfqjbx6Pi7KYTB8okjws10XDqG8p45zACubhgOqjbr50L?=
 =?us-ascii?Q?H09gGAfo37c4OQn73h7Z9E2zQwrUP2ZTpmYTx3tw8FHaxeA5LUAi6sx49e9Z?=
 =?us-ascii?Q?xuwGMRZKb7HLb3pd2i+vn7er9ksbkqQJEH0lMIEmrmWSU5HVBllbx0mhhBgE?=
 =?us-ascii?Q?oBR99N6RsG2mZL4tlNu+vJTGSWGdP1wnU4gyoLYe6zkqZ/xi6O0WLdz9loVi?=
 =?us-ascii?Q?NTGGZjOHgUhgc1iMQ53PlkwNZ+F9lbVtq++49IfB6cvSP6eztMKXx50xYp9U?=
 =?us-ascii?Q?NSY07nCuMVmkR4XTntziffZrdsQL+RQKC1n4OF30v7P8Sbi/XPqNd19Whsio?=
 =?us-ascii?Q?Khoj8AMELbFd6k6QhJtBAjj/lMaLf/+A2+w5G/zZuZjOOXfgs5gjYp5pyZq1?=
 =?us-ascii?Q?diMKI4+3UJwvKL9u5Bm1Wrq5e++DNepBUwoxIJAD0Uomr8rqttwX3Z1l0GD4?=
 =?us-ascii?Q?u17H8nSwPvDjdyOOkHEIgqSUrZlEBjpUoLoQgtzoN5NJYLjq7c+/OPujHdAY?=
 =?us-ascii?Q?t70rYnHaQ5Hflyl56bWDXBqdMoSq9Wt3LHj2XUhN1ewvxvSwEDg/zIVWHBIp?=
 =?us-ascii?Q?6R+c31i1wJcSWSGKtbbsnDL0edgjr/cEugDF/fCJ9/rlYFZd/c9I+0y+bLBy?=
 =?us-ascii?Q?FZURCQDOlpUwdonzOii1W5Za0/VnV99ir1UBIC+uD/4w4ukOCbjEH04JRucN?=
 =?us-ascii?Q?FfNP+Ytw6PTvsXPRJsfvp6gNKQ0X7uMwUAVb2McFnKB8OtQCe8L0IJ1bnTHs?=
 =?us-ascii?Q?Vrh6hw4uOKiDO+hA5iIcXwaQ9VTvTlXeA0pzKCNx6VYwVGbQiSA7xyo5lLq0?=
 =?us-ascii?Q?Vf9YkVmB0i66CwtkC4B57jUKLowDWdkfBcNR2s/ypYS0MOaaNdJJHluOpu9G?=
 =?us-ascii?Q?NJHTcCrOvlFTnqh8zUn0MX8qPB1+EAjguX9bnLWhEwyxfYA0WefR9qQUea7e?=
 =?us-ascii?Q?54B1oRNtflnkMwEOwa+tmqepxdBrLW3VdgKA3/wuZbCSw3a1XxR0RCS+TbJa?=
 =?us-ascii?Q?5fZvVS9FZZDCrLo9q4PUYqBJvBQDauo/+QT4AS8npDUgFmwaY3b+6PO6IN5i?=
 =?us-ascii?Q?V20tM6l2JRAtw6VgnbnYNQTOr2UW?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?R0HlcMQ5qkTTUJ3uhbZKeSB5Hf49dMJRxOgd3QrhOqUu91I+Qk5PNYBpYBfW?=
 =?us-ascii?Q?ksDljMZgAY8jXvjMRC5QnIA31H3lwBRyKIzfF37bRuYuPkWReMsWSaw49h1R?=
 =?us-ascii?Q?qasR+qtmIwHsTPDPqHFARHSa7ZqJcG4qzxBMgMLIct4Hb6xzCYTAVm2IhxQQ?=
 =?us-ascii?Q?RX83hwxmGNf7rSYf9LFBRy0sDdiUEI+cRJqv0CnL71WigUsWK16Bw/z8WxAp?=
 =?us-ascii?Q?VX/ll2LdB0VqBabtO7kGVW78TaJv4LhRpiYZYsf0ygVc3CtIhNUz9zjSpKT8?=
 =?us-ascii?Q?Veeyhglj27Fg2RegoJKsQmElDMmtwOOFmHQz7/kV7NOZ3KnIc5BMaIlz8RcE?=
 =?us-ascii?Q?1DplSRP+m3Lq8V0D1FJ83XAsHWe2IGrr1TH0EfEvH1hjpJtvXhGnPWLSHcPl?=
 =?us-ascii?Q?n42gX9/oTfqy6MOtcwGIId3W1u1JYxtOz+R9fPzcDCqCNhB8BmVkgvew2Di2?=
 =?us-ascii?Q?oXScQ4/RO+K3XugZYh0ApAo+Dafz/QiFh6Piuh8n7x+f4ywatL3hLc/l3q3k?=
 =?us-ascii?Q?+zaj4vPH4iaH1Kz7Eoc0IxtntH+8Gf/zAZBEBGY8nNJvwd/unem79m84eZK/?=
 =?us-ascii?Q?Gz+smrnb2DO1v4er4L1MFcTlZlLqz2o99nNO5m8M4MKYjq/cAtfMdRAOGx+Q?=
 =?us-ascii?Q?3Znx1fTIH3HBriTwfnh/vFlRuO1ZZJaJw3+UJj7y5/aWRfNEQg9KlQgahEqt?=
 =?us-ascii?Q?qzal0bAtJa6wbT+rMjnlXf12aP/C3KiBsy9vHKP/0UwnHFiYRfyXTMQkmy6M?=
 =?us-ascii?Q?/mLbPPO9HzBGO3iOFw5YQD1MwHouschBOpedCEPpBNSi90/F4bvEfcTw50uJ?=
 =?us-ascii?Q?CyiRaT7vkooOCKDk8dSd6s16NzTy+UIcV0yzbovzOB4qJGWPszEOPF5mFjo5?=
 =?us-ascii?Q?8rXwVD7UBDVieZd6UhuhLJuzdAiBCboniNf2ii65SxgksA/L9vDwmmJWidD4?=
 =?us-ascii?Q?ZX+jUdVMmBi/b6CDhxdRyd4VH4RqUTTFaR+ez2AHGmjTgiJ5YmzkMcgjyqdg?=
 =?us-ascii?Q?IdtGeD/YIRlwnosJCgBV1DpXFq2ZFEoF12Ox5k+ijJ3i5is6G+C6TA8lBCBG?=
 =?us-ascii?Q?mMLobOTRZXWcEl2f0+yUkwFtSIwNammqZLh68S3K2v5+zs6VfnmAO9U+21Sn?=
 =?us-ascii?Q?CIaYQchlHTvIbCZeXj3SiQRi2XSsoriyTz11slVk/iNnxb8GJLReuFjzeYxr?=
 =?us-ascii?Q?YdJRqmQkp3ZyrbMOKad1F/vSd6WyUVz3ZC6+8XI6h0tCn4/OcuxvYmU6y4Rh?=
 =?us-ascii?Q?lyIw+ykYf++ycSLu7yjLX/Op4j7ZgtNQ6lDEGYM18k4FRG1Q5fOmoWA8XAhL?=
 =?us-ascii?Q?+FmKrhbV1bHaIatZReMfnZZ+QGe+x0gHVLhhtnQyRsF1V15puyTlqSqTz9/p?=
 =?us-ascii?Q?4lCy59JEQ5+/a3p9r2LAQOkBOW0HZn3hQ2LdhwldX7zIE13sRQmcwwWCGYKh?=
 =?us-ascii?Q?mu1sFccwkLzQxwAm3V3RZNeBxifPTrv7EGAWqLk0DtKRknEs9/TaznqQSgQ8?=
 =?us-ascii?Q?fAhVWXW/6yu8u3jq8K8iKBKFS3CqhidaQCMO3GCHA21nwidJizm21A160QDe?=
 =?us-ascii?Q?xPnORuX+TyRy+0h/48O5kdUTXanw0d5j2IuhgJyXToSWcFsnlYpeIkOFUHQt?=
 =?us-ascii?Q?bm4aoA5/CLja90uqM6Ks0d0=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24c40007-4d26-4948-0ec3-08dceea7d93d
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2024 12:33:05.2411
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: raeFmzuiiwgsBwv5OaEHptg9F28WcUzMAmU/KOsDJ3ZBCYkSSSAp8pigPoXyXCntY/5QsMYCzaYL6GQmFQKKw0+XPb+eEJE/97ITtCUu2vrPlDGG3Iw7nksjAtWDe1lX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8349
X-Proofpoint-GUID: -XEibmcjtmPht-PrunBW9i2Oc65o2z8o
X-Authority-Analysis: v=2.4 cv=EqyArjcA c=1 sm=1 tr=0 ts=67110407 cx=c_pps a=mEL9+5ifO1KfKUNINL6WGg==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=DAUX931o1VcA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=m6WZ_-0bhr0LfeFaOGEA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: -XEibmcjtmPht-PrunBW9i2Oc65o2z8o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-17_13,2024-10-17_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1011
 lowpriorityscore=0 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 adultscore=0 mlxlogscore=875 spamscore=0 mlxscore=0 priorityscore=1501
 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2410170086
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Oct 2024 12:33:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206017

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

The data layout for x86-64 target was different in rust from llvm.
It resulted in the following data layout error:
--------------------------------------------------------------------------------------
error: data-layout for target `x86_64-linux`, `e-m:e-i64:64-f80:128-n8:16:32:64-S128`,
differs from LLVM target's `x86_64-unknown-linux-gnu` default layout,
`e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128`
--------------------------------------------------------------------------------------

The issue was reported in meta-rust layer as:
https://github.com/meta-rust/meta-rust/pull/442

Hence, the data layout for x86-64 is modified as per the llvm sources which fixes the issue.

After running the testsuite with the modified data layout; it was observed that the
"tests/codegen/i128-x86-align.rs" passed. The modified data layout fixed the scalar pair which
resolved the testcase failure. Hence, the testcase has been removed from the exclude list.

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/classes-recipe/rust-target-config.bbclass | 2 +-
 meta/lib/oeqa/selftest/cases/rust.py           | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/classes-recipe/rust-target-config.bbclass b/meta/classes-recipe/rust-target-config.bbclass
index 334f2e7d5f..f7aa6c74d8 100644
--- a/meta/classes-recipe/rust-target-config.bbclass
+++ b/meta/classes-recipe/rust-target-config.bbclass
@@ -153,7 +153,7 @@ TARGET_C_INT_WIDTH[aarch64] = "32"
 MAX_ATOMIC_WIDTH[aarch64] = "128"
 
 ## x86_64-unknown-linux-{gnu, musl}
-DATA_LAYOUT[x86_64] = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
+DATA_LAYOUT[x86_64] = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
 TARGET_ENDIAN[x86_64] = "little"
 TARGET_POINTER_WIDTH[x86_64] = "64"
 TARGET_C_INT_WIDTH[x86_64] = "32"
diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftest/cases/rust.py
index cbe6366f75..88d7bb9518 100644
--- a/meta/lib/oeqa/selftest/cases/rust.py
+++ b/meta/lib/oeqa/selftest/cases/rust.py
@@ -83,7 +83,6 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):
                             'src/tools/tidy/src/',
                             'tests/assembly/asm/aarch64-outline-atomics.rs',
                             'tests/codegen/abi-main-signature-32bit-c-int.rs',
-                            'tests/codegen/i128-x86-align.rs',
                             'tests/codegen/issues/issue-122805.rs',
                             'tests/codegen/thread-local.rs',
                             'tests/mir-opt/',
-- 
2.43.0


