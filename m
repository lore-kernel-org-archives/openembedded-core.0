Return-Path: <Deepthi.Hemraj@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E391C2BD09
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 10:05:14 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.16076.1719828314442170410
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jul 2024 03:05:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=79127ccecd=deepthi.hemraj@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4619fUpM009069
	for <openembedded-core@lists.openembedded.org>; Mon, 1 Jul 2024 03:05:14 -0700
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2041.outbound.protection.outlook.com [104.47.57.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4033em0t43-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 01 Jul 2024 03:05:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z75NgUz82PBkcDwW7x50lkEhubsK1l7ZzEGTb9CfHTEVQGWEA+8s6s/hfS9sk18EpQbeysycXL1pj48S4RYvQnFHsVbHn8JXmPpx1HoWVsd6MGO7gRguXClDzLTJIJ9W5TqlYD2zFjCTUcv23sA+WSUkPyR8uyBh3kREW+sIx+bFMzeTp6c55MVf0BTKVDUU2EKN7glWlFvswyfIibdESZBt0wY+pCQO04nG8YofAELOJTZJDRjEq4VN2v6kteU0eJGd0KsmPmL+Q5KYGLJfxr+YhhwwjyeCAojguATXg6Ivc5uMciP/WQSDQXo77KQcAovBCBd/tGKQlFkt+D51ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=esxm6D+2DhyaH45khnByNe5LItOu4fAyTTMnPbzcrTI=;
 b=G6k5yhSMGpzaXXUPGOVC5pAl0FKwZtsefAY6E3aduJp6UR9m6Jus7Cm7DPe04gO982p87UqDBE6XYvjIjNcRc8mxrbDuLETO/YPeyeAT8HjM763Qt3qGecFg3SUhby6KTbMzlTEiqJFk3fwhvREt6PFPbVYHYqfqiBgiLKWZr9dXrjut4mHApXN2HtujH7wKa+Ny71EtX8XyW5jd2163tfTKR/iUMVwV0vakbHDrqRDt8/i/rB/+bUw3e0Auc6+K2yXey5facqVjzM1B+xLF0GWMkct50k4oQw9kTyTsMwknGZuTcrAVCB0rFKYMczQ5TCB2s9Lm8Liw+PXlJa69rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8602.namprd11.prod.outlook.com (2603:10b6:408:1b3::11)
 by DS0PR11MB7357.namprd11.prod.outlook.com (2603:10b6:8:136::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.26; Mon, 1 Jul
 2024 10:05:09 +0000
Received: from LV3PR11MB8602.namprd11.prod.outlook.com
 ([fe80::5e20:4508:a523:df39]) by LV3PR11MB8602.namprd11.prod.outlook.com
 ([fe80::5e20:4508:a523:df39%7]) with mapi id 15.20.7719.029; Mon, 1 Jul 2024
 10:05:08 +0000
From: Deepthi.Hemraj@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com,
        Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com
Subject: [PATCH] llvm: Fix CVE-2024-0151
Date: Mon,  1 Jul 2024 03:04:50 -0700
Message-ID: <20240701100450.121056-1-Deepthi.Hemraj@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0232.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::27) To LV3PR11MB8602.namprd11.prod.outlook.com
 (2603:10b6:408:1b3::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8602:EE_|DS0PR11MB7357:EE_
X-MS-Office365-Filtering-Correlation-Id: dc4613a1-ceef-46a0-de15-08dc99b549c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?7nK8nrACIaEackfUFu9ZoLe/aFR5go5CnYkOmPj9BZoKryRzLrFtFZp7gah0?=
 =?us-ascii?Q?mBwojmO8rnjN+zIa7jzduC0j0bkNCKHIuOZnZbqRhex9EcIrJiO49Wlg0m1z?=
 =?us-ascii?Q?QhMFHTw22AmIPidSBJuu/Qd9G+7R3KqofcVg/UzYPZmy+jAgBQ+2kDOUfjqK?=
 =?us-ascii?Q?zlENZNFjgYrOoLHT1DR4IecX8Xj/1T5XDHZQ8WWUHD+VaF6Y1nKwWM8dtUIY?=
 =?us-ascii?Q?A6UqXuk+AWNg6xXMBnALpntjDyiRW1YqCORbz0qtb5Q+R2LgjlfWBwt7omi9?=
 =?us-ascii?Q?42oroPRBwxGeEFqSHPiCqnHKBBTovoEzwGbd7cqfnazbTKQOATA00JS9VFh2?=
 =?us-ascii?Q?FzjcIHq53gS+9rZpAxzPeWQB/45yXWI5HPSqE2dFs7/w7DClHaRf4PkoxWJ4?=
 =?us-ascii?Q?OEuxhycCjS8+es0V3MK5YEExn+iraV3igX3q5kzAFQJs/kOT+jgVyDmHQ57X?=
 =?us-ascii?Q?iqbitHETdZ7/hpFCZOXAOla+mks2i+GpVvzRWfv02D+w3g6sgLIS1OBptYIa?=
 =?us-ascii?Q?q87d3VJN6LB/NZPSKUehKuHmywHq7/ZI+Ehm7wt6ghythwnag+MRlcqx9XUB?=
 =?us-ascii?Q?Lga3zEXp3O6bChyjxeLIn1PhfOJP2zCf0yN8WyCeq8zXun4RPOAmewwDt6h2?=
 =?us-ascii?Q?rKHZ22i/qrYarB4VcEl8Xo760g3Jn5bYLB0V8njgwaQixZOYkHd3X3o1Mk+m?=
 =?us-ascii?Q?Z9AwTzor0pJ5eHM48JwLOMGbAXAPSHL5WCXsKHhzros00SsmENngZ1ruax3M?=
 =?us-ascii?Q?6ViqburpnvktXKx6LIDmB5UZOL9Egh8Y/2g0+hw7R2Dcj1ElDEMFd4A5Ob4/?=
 =?us-ascii?Q?f3eoDD4mhccD3B/KsA1hXG92Yj3KKjF1QH8ggt2tsYqjkVjVA4xdTk35eBDx?=
 =?us-ascii?Q?AyNc69jpFPiyGHbg9ySOILK6c4YMM592TZn+LrrCdHtMZkJ8wKtwoSxMQs05?=
 =?us-ascii?Q?/iuchfJV25fUlrXmifWqdUrjgvhjSWc1bozRR4LMXzoLUcuPuliDvzjjxqmU?=
 =?us-ascii?Q?UD2yYtLnUindxGzKwhEHp1bhuUW+M1jU6RILyFx/HuilW/Miio0y4P+GZpV4?=
 =?us-ascii?Q?7NUDJrIT1uJgZE1MSBLsuh9fqdB928DSQpayPNeYJqN+jIi4in0SLbbRomfz?=
 =?us-ascii?Q?kELRCWKnaRFQjebYMtIGXNXHYOqEz/L1ATuQCWA6K6b2zp9bDxccXOq3wLOy?=
 =?us-ascii?Q?6Y5oWC0X4HLVo5eFMLc9+QeZKP3+F7zqkboc7hvaNuPp8HtmqjnryK+SEUVI?=
 =?us-ascii?Q?raNnK85HHhv4cuvst0gHy53+mOoaZRpbOmy5rfMpLX+A+ZiZ9frVJ6/K2I7e?=
 =?us-ascii?Q?JjC1fPVgvg4SXX2mcCNAtOW9eZQKLS64fOUTnQ23Axe49kBL6/aPk6YH/HTh?=
 =?us-ascii?Q?CNRmS8o=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?DOZlj101Hnvq7KXMzQbBMh0wQ9JuXAK8ZG/8yxDrJ+FCnSuf+cAUMLQVmdSa?=
 =?us-ascii?Q?unkj0sXUOUKvN5f6BmIMeq6pQhwRMlFP7PLCdqxPKOKkaWZ0IeFHGoDfPaA0?=
 =?us-ascii?Q?UAiUB5xKoAwBtBBUax+3gIyPPhyHlQ4qv7EBlX8ifBBvj7Qb4O28kBZf7zoO?=
 =?us-ascii?Q?JxF/9IRVU/D9rcFGnMCoubnRgm+QACp0dIZW1zbv3scf8Sx9uWDf4tCyM+Tm?=
 =?us-ascii?Q?nOIY8LLsaurPuZov7gA8FMm+r62eFbBpCr/coOX/QOsCDs9ndHFD/eYL7XYG?=
 =?us-ascii?Q?keppmy1AvyMpBqqYww1NMyP05cz2a571Wqb3p2UTKkv/czdAit9V/G90NbfR?=
 =?us-ascii?Q?ROv+0APK5CRDKedihRm+/VJC/DjLp/eLpYEZjm0fa6fO5tnqkEbq2dDyT//N?=
 =?us-ascii?Q?jgXrIULefyDg9I6HffCSr60Y3kloctf1+UAp+YnEvjWu4N4C4t7FXlNQOKrg?=
 =?us-ascii?Q?xdV1Ejyfh7psQlGo2zkczp3jDcowcvq7rljiAjyyRTor0xZMJFi1dyF05mJR?=
 =?us-ascii?Q?PNSd/QxZmDnb1OUuIyfI352tqnsT17FKeDKtQhV5KGB8Pred42QTWUk88kci?=
 =?us-ascii?Q?eUaEhHcyZ+Mv+pTN/hDOJp2TD1PFBIdhNyaGdF5ciWvxLbXgwOVK7sJtHoFf?=
 =?us-ascii?Q?v0Iu/1D0e1/AXyFBNTDPXIwnX8Ug5tt2YW7UvQxHz/fs6Wtbjz0Q4hasopuF?=
 =?us-ascii?Q?a2hSFAjJfYZ7P8eJmwXyMOZgz8PxxFxc26MkWb7vjT/hPWOGzg5z1vuYV3fo?=
 =?us-ascii?Q?/l5sOWIimFNPn5eI/8+HcG4UaxZbmM2z7etK2dR+fkW2HneaHDIdUDgsWQld?=
 =?us-ascii?Q?9YMaJJE9sXI50y0YyNxMEg7grauE+5BMBjLWr/6LJnQDR0GuSsnNU/DGYvA1?=
 =?us-ascii?Q?9D17Nwe9kFAzCdnr7aRn7EWaQ/Jq2ZCxpxQiXU/Fwwi1BMj24p0HF6Pl8rvq?=
 =?us-ascii?Q?T/J2GBlxcIqMGZZYYnv53ckYd3DU5qRCClyohaGeq1H5CyjAZu1ggOjMkWiH?=
 =?us-ascii?Q?sLGisix2PSofWsWSY7Q0r/mCAqJuOCpkRU6+BBwLsU125X8VTwDoZFk5K7In?=
 =?us-ascii?Q?VuA+d7nr2aqiQyDVc/VHP96xjbH3mERZspqg0OMBeLJ+e3U6YX0Fizo/9fut?=
 =?us-ascii?Q?UVK16MAwAE1hoA7DElEuzabqefpwK1kpOYaQA4TfwLaVBARCecQWc1ASjt5Q?=
 =?us-ascii?Q?nIppjv90HZLNDSnjIFqE/XwFZoT1RlgwqZ5Rrfy+0UMcc2j/1zsw6aD+0Adb?=
 =?us-ascii?Q?uChGt89xjFywX+utHcFw8Gi6reWheHpz1oYS+Buaz6FkKS2CCWnyMOitvOLX?=
 =?us-ascii?Q?yFgjLlOXXw6isv5ImfES64aMtlQ3taajd/fNGSu1O4LrYa/uumPvRw/QNjS3?=
 =?us-ascii?Q?wtr9TlX5vvKCQMFB4TjeH+HTbChpPvoP6F2p+9el2Xgzv7oK3PEvfnwzeo0H?=
 =?us-ascii?Q?bUmn+2sOd9qPfU3QuCxRJ5S8eLDKFcwl/SyxhOZX2/3rlY6Rzef4lSaUzg/X?=
 =?us-ascii?Q?SA3i9FfpzbtPrkqu3MM0Kk7DQEP6TsPyZRxst25zHWm+1y7QU7Etup0ctGhK?=
 =?us-ascii?Q?U6Y69lXVO6Uz83h867O8F+yQSrkyJ0aMEaqyvcGUvSf1rvaR9L0vsMT0kKn+?=
 =?us-ascii?Q?DQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc4613a1-ceef-46a0-de15-08dc99b549c3
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2024 10:05:08.7027
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p49v3kaqg4x6iSs8iTD996fGSByEUuiY5+YLkMAm5iVYV5G7rSb6qVsxVVdVj77mGtEz3LgUkhWx9EmjX14kOCeoj46HFTxWmrp2zRR4Jas=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7357
X-Proofpoint-GUID: 6ksEMrDIMJu_iB8ws0ltddaUjb-AfGHt
X-Proofpoint-ORIG-GUID: 6ksEMrDIMJu_iB8ws0ltddaUjb-AfGHt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-01_08,2024-06-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 suspectscore=0 clxscore=1011 spamscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2406140001 definitions=main-2407010078
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jul 2024 10:05:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201300

From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>

Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
---
 .../llvm/0002-llvm-Fix-CVE-2024-0151.patch    | 1086 +++++++++++++++++
 meta/recipes-devtools/llvm/llvm_18.1.8.bb     |    1 +
 2 files changed, 1087 insertions(+)
 create mode 100644 meta/recipes-devtools/llvm/llvm/0002-llvm-Fix-CVE-2024-0151.patch

diff --git a/meta/recipes-devtools/llvm/llvm/0002-llvm-Fix-CVE-2024-0151.patch b/meta/recipes-devtools/llvm/llvm/0002-llvm-Fix-CVE-2024-0151.patch
new file mode 100644
index 0000000000..0b8338d35b
--- /dev/null
+++ b/meta/recipes-devtools/llvm/llvm/0002-llvm-Fix-CVE-2024-0151.patch
@@ -0,0 +1,1086 @@
+commit 78ff617d3f573fb3a9b2fef180fa0fd43d5584ea
+Author: Lucas Duarte Prates <lucas.prates@arm.com>
+Date:   Thu Jun 20 10:22:01 2024 +0100
+
+    [ARM] CMSE security mitigation on function arguments and returned values (#89944)
+
+    The ABI mandates two things related to function calls:
+     - Function arguments must be sign- or zero-extended to the register
+       size by the caller.
+     - Return values must be sign- or zero-extended to the register size by
+       the callee.
+
+    As consequence, callees can assume that function arguments have been
+    extended and so can callers with regards to return values.
+
+    Here lies the problem: Nonsecure code might deliberately ignore this
+    mandate with the intent of attempting an exploit. It might try to pass
+    values that lie outside the expected type's value range in order to
+    trigger undefined behaviour, e.g. out of bounds access.
+
+    With the mitigation implemented, Secure code always performs extension
+    of values passed by Nonsecure code.
+
+    This addresses the vulnerability described in CVE-2024-0151.
+
+    Patches by Victor Campos.
+
+    ---------
+
+    Co-authored-by: Victor Campos <victor.campos@arm.com>
+
+Upstream-Status: Backport from llvm-project: https://github.com/llvm/llvm-project/commit/78ff617d3f573fb3a9b2fef180fa0fd43d5584ea
+CVE: CVE-2024-0151
+Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
+---
+diff --git a/llvm/lib/Target/ARM/ARMISelLowering.cpp b/llvm/lib/Target/ARM/ARMISelLowering.cpp
+index bfe137b95602..5490c3c9df6c 100644
+--- a/llvm/lib/Target/ARM/ARMISelLowering.cpp
++++ b/llvm/lib/Target/ARM/ARMISelLowering.cpp
+@@ -156,6 +156,17 @@ static const MCPhysReg GPRArgRegs[] = {
+   ARM::R0, ARM::R1, ARM::R2, ARM::R3
+ };
+ 
++static SDValue handleCMSEValue(const SDValue &Value, const ISD::InputArg &Arg,
++                               SelectionDAG &DAG, const SDLoc &DL) {
++  assert(Arg.ArgVT.isScalarInteger());
++  assert(Arg.ArgVT.bitsLT(MVT::i32));
++  SDValue Trunc = DAG.getNode(ISD::TRUNCATE, DL, Arg.ArgVT, Value);
++  SDValue Ext =
++      DAG.getNode(Arg.Flags.isSExt() ? ISD::SIGN_EXTEND : ISD::ZERO_EXTEND, DL,
++                  MVT::i32, Trunc);
++  return Ext;
++}
++
+ void ARMTargetLowering::addTypeForNEON(MVT VT, MVT PromotedLdStVT) {
+   if (VT != PromotedLdStVT) {
+     setOperationAction(ISD::LOAD, VT, Promote);
+@@ -2196,7 +2207,7 @@ SDValue ARMTargetLowering::LowerCallResult(
+     SDValue Chain, SDValue InGlue, CallingConv::ID CallConv, bool isVarArg,
+     const SmallVectorImpl<ISD::InputArg> &Ins, const SDLoc &dl,
+     SelectionDAG &DAG, SmallVectorImpl<SDValue> &InVals, bool isThisReturn,
+-    SDValue ThisVal) const {
++    SDValue ThisVal, bool isCmseNSCall) const {
+   // Assign locations to each value returned by this call.
+   SmallVector<CCValAssign, 16> RVLocs;
+   CCState CCInfo(CallConv, isVarArg, DAG.getMachineFunction(), RVLocs,
+@@ -2274,6 +2285,15 @@ SDValue ARMTargetLowering::LowerCallResult(
+         (VA.getValVT() == MVT::f16 || VA.getValVT() == MVT::bf16))
+       Val = MoveToHPR(dl, DAG, VA.getLocVT(), VA.getValVT(), Val);
+ 
++    // On CMSE Non-secure Calls, call results (returned values) whose bitwidth
++    // is less than 32 bits must be sign- or zero-extended after the call for
++    // security reasons. Although the ABI mandates an extension done by the
++    // callee, the latter cannot be trusted to follow the rules of the ABI.
++    const ISD::InputArg &Arg = Ins[VA.getValNo()];
++    if (isCmseNSCall && Arg.ArgVT.isScalarInteger() &&
++        VA.getLocVT().isScalarInteger() && Arg.ArgVT.bitsLT(MVT::i32))
++      Val = handleCMSEValue(Val, Arg, DAG, dl);
++
+     InVals.push_back(Val);
+   }
+ 
+@@ -2888,7 +2908,7 @@ ARMTargetLowering::LowerCall(TargetLowering::CallLoweringInfo &CLI,
+   // return.
+   return LowerCallResult(Chain, InGlue, CallConv, isVarArg, Ins, dl, DAG,
+                          InVals, isThisReturn,
+-                         isThisReturn ? OutVals[0] : SDValue());
++                         isThisReturn ? OutVals[0] : SDValue(), isCmseNSCall);
+ }
+ 
+ /// HandleByVal - Every parameter *after* a byval parameter is passed
+@@ -4485,8 +4505,6 @@ SDValue ARMTargetLowering::LowerFormalArguments(
+                  *DAG.getContext());
+   CCInfo.AnalyzeFormalArguments(Ins, CCAssignFnForCall(CallConv, isVarArg));
+ 
+-  SmallVector<SDValue, 16> ArgValues;
+-  SDValue ArgValue;
+   Function::const_arg_iterator CurOrigArg = MF.getFunction().arg_begin();
+   unsigned CurArgIdx = 0;
+ 
+@@ -4541,6 +4559,7 @@ SDValue ARMTargetLowering::LowerFormalArguments(
+     // Arguments stored in registers.
+     if (VA.isRegLoc()) {
+       EVT RegVT = VA.getLocVT();
++      SDValue ArgValue;
+ 
+       if (VA.needsCustom() && VA.getLocVT() == MVT::v2f64) {
+         // f64 and vector types are split up into multiple registers or
+@@ -4604,16 +4623,6 @@ SDValue ARMTargetLowering::LowerFormalArguments(
+       case CCValAssign::BCvt:
+         ArgValue = DAG.getNode(ISD::BITCAST, dl, VA.getValVT(), ArgValue);
+         break;
+-      case CCValAssign::SExt:
+-        ArgValue = DAG.getNode(ISD::AssertSext, dl, RegVT, ArgValue,
+-                               DAG.getValueType(VA.getValVT()));
+-        ArgValue = DAG.getNode(ISD::TRUNCATE, dl, VA.getValVT(), ArgValue);
+-        break;
+-      case CCValAssign::ZExt:
+-        ArgValue = DAG.getNode(ISD::AssertZext, dl, RegVT, ArgValue,
+-                               DAG.getValueType(VA.getValVT()));
+-        ArgValue = DAG.getNode(ISD::TRUNCATE, dl, VA.getValVT(), ArgValue);
+-        break;
+       }
+ 
+       // f16 arguments have their size extended to 4 bytes and passed as if they
+@@ -4623,6 +4632,15 @@ SDValue ARMTargetLowering::LowerFormalArguments(
+           (VA.getValVT() == MVT::f16 || VA.getValVT() == MVT::bf16))
+         ArgValue = MoveToHPR(dl, DAG, VA.getLocVT(), VA.getValVT(), ArgValue);
+ 
++      // On CMSE Entry Functions, formal integer arguments whose bitwidth is
++      // less than 32 bits must be sign- or zero-extended in the callee for
++      // security reasons. Although the ABI mandates an extension done by the
++      // caller, the latter cannot be trusted to follow the rules of the ABI.
++      const ISD::InputArg &Arg = Ins[VA.getValNo()];
++      if (AFI->isCmseNSEntryFunction() && Arg.ArgVT.isScalarInteger() &&
++          RegVT.isScalarInteger() && Arg.ArgVT.bitsLT(MVT::i32))
++        ArgValue = handleCMSEValue(ArgValue, Arg, DAG, dl);
++
+       InVals.push_back(ArgValue);
+     } else { // VA.isRegLoc()
+       // Only arguments passed on the stack should make it here.
+diff --git a/llvm/lib/Target/ARM/ARMISelLowering.h b/llvm/lib/Target/ARM/ARMISelLowering.h
+index 62a52bdb03f7..a255e9b6fc36 100644
+--- a/llvm/lib/Target/ARM/ARMISelLowering.h
++++ b/llvm/lib/Target/ARM/ARMISelLowering.h
+@@ -891,7 +891,7 @@ class VectorType;
+                             const SmallVectorImpl<ISD::InputArg> &Ins,
+                             const SDLoc &dl, SelectionDAG &DAG,
+                             SmallVectorImpl<SDValue> &InVals, bool isThisReturn,
+-                            SDValue ThisVal) const;
++                            SDValue ThisVal, bool isCmseNSCall) const;
+ 
+     bool supportSplitCSR(MachineFunction *MF) const override {
+       return MF->getFunction().getCallingConv() == CallingConv::CXX_FAST_TLS &&
+diff --git a/llvm/test/CodeGen/ARM/cmse-harden-call-returned-values.ll b/llvm/test/CodeGen/ARM/cmse-harden-call-returned-values.ll
+new file mode 100644
+index 0000000000..58eef443c25e
+--- /dev/null
++++ b/llvm/test/CodeGen/ARM/cmse-harden-call-returned-values.ll
+@@ -0,0 +1,552 @@
++; RUN: llc %s -mtriple=thumbv8m.main     -o - | FileCheck %s --check-prefixes V8M-COMMON,V8M-LE
++; RUN: llc %s -mtriple=thumbebv8m.main   -o - | FileCheck %s --check-prefixes V8M-COMMON,V8M-BE
++; RUN: llc %s -mtriple=thumbv8.1m.main   -o - | FileCheck %s --check-prefixes V81M-COMMON,V81M-LE
++; RUN: llc %s -mtriple=thumbebv8.1m.main -o - | FileCheck %s --check-prefixes V81M-COMMON,V81M-BE
++
++@get_idx = hidden local_unnamed_addr global ptr null, align 4
++@arr = hidden local_unnamed_addr global [256 x i32] zeroinitializer, align 4
++
++define i32 @access_i16() {
++; V8M-COMMON-LABEL: access_i16:
++; V8M-COMMON:       @ %bb.0: @ %entry
++; V8M-COMMON-NEXT:    push {r7, lr}
++; V8M-COMMON-NEXT:    movw r0, :lower16:get_idx
++; V8M-COMMON-NEXT:    movt r0, :upper16:get_idx
++; V8M-COMMON-NEXT:    ldr r0, [r0]
++; V8M-COMMON-NEXT:    push.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V8M-COMMON-NEXT:    bic r0, r0, #1
++; V8M-COMMON-NEXT:    sub sp, #136
++; V8M-COMMON-NEXT:    vlstm sp, {d0 - d15}
++; V8M-COMMON-NEXT:    mov r1, r0
++; V8M-COMMON-NEXT:    mov r2, r0
++; V8M-COMMON-NEXT:    mov r3, r0
++; V8M-COMMON-NEXT:    mov r4, r0
++; V8M-COMMON-NEXT:    mov r5, r0
++; V8M-COMMON-NEXT:    mov r6, r0
++; V8M-COMMON-NEXT:    mov r7, r0
++; V8M-COMMON-NEXT:    mov r8, r0
++; V8M-COMMON-NEXT:    mov r9, r0
++; V8M-COMMON-NEXT:    mov r10, r0
++; V8M-COMMON-NEXT:    mov r11, r0
++; V8M-COMMON-NEXT:    mov r12, r0
++; V8M-COMMON-NEXT:    msr apsr_nzcvq, r0
++; V8M-COMMON-NEXT:    blxns r0
++; V8M-COMMON-NEXT:    vlldm sp, {d0 - d15}
++; V8M-COMMON-NEXT:    add sp, #136
++; V8M-COMMON-NEXT:    pop.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V8M-COMMON-NEXT:    movw r1, :lower16:arr
++; V8M-COMMON-NEXT:    sxth r0, r0
++; V8M-COMMON-NEXT:    movt r1, :upper16:arr
++; V8M-COMMON-NEXT:    ldr.w r0, [r1, r0, lsl #2]
++; V8M-COMMON-NEXT:    pop {r7, pc}
++;
++; V81M-COMMON-LABEL: access_i16:
++; V81M-COMMON:       @ %bb.0: @ %entry
++; V81M-COMMON-NEXT:    push {r7, lr}
++; V81M-COMMON-NEXT:    movw r0, :lower16:get_idx
++; V81M-COMMON-NEXT:    movt r0, :upper16:get_idx
++; V81M-COMMON-NEXT:    ldr r0, [r0]
++; V81M-COMMON-NEXT:    push.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V81M-COMMON-NEXT:    bic r0, r0, #1
++; V81M-COMMON-NEXT:    sub sp, #136
++; V81M-COMMON-NEXT:    vlstm sp, {d0 - d15}
++; V81M-COMMON-NEXT:    clrm {r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, apsr}
++; V81M-COMMON-NEXT:    blxns r0
++; V81M-COMMON-NEXT:    vlldm sp, {d0 - d15}
++; V81M-COMMON-NEXT:    add sp, #136
++; V81M-COMMON-NEXT:    pop.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V81M-COMMON-NEXT:    movw r1, :lower16:arr
++; V81M-COMMON-NEXT:    sxth r0, r0
++; V81M-COMMON-NEXT:    movt r1, :upper16:arr
++; V81M-COMMON-NEXT:    ldr.w r0, [r1, r0, lsl #2]
++; V81M-COMMON-NEXT:    pop {r7, pc}
++entry:
++  %0 = load ptr, ptr @get_idx, align 4
++  %call = tail call signext i16 %0() "cmse_nonsecure_call"
++  %idxprom = sext i16 %call to i32
++  %arrayidx = getelementptr inbounds [256 x i32], ptr @arr, i32 0, i32 %idxprom
++  %1 = load i32, ptr %arrayidx, align 4
++  ret i32 %1
++}
++
++define i32 @access_u16() {
++; V8M-COMMON-LABEL: access_u16:
++; V8M-COMMON:       @ %bb.0: @ %entry
++; V8M-COMMON-NEXT:    push {r7, lr}
++; V8M-COMMON-NEXT:    movw r0, :lower16:get_idx
++; V8M-COMMON-NEXT:    movt r0, :upper16:get_idx
++; V8M-COMMON-NEXT:    ldr r0, [r0]
++; V8M-COMMON-NEXT:    push.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V8M-COMMON-NEXT:    bic r0, r0, #1
++; V8M-COMMON-NEXT:    sub sp, #136
++; V8M-COMMON-NEXT:    vlstm sp, {d0 - d15}
++; V8M-COMMON-NEXT:    mov r1, r0
++; V8M-COMMON-NEXT:    mov r2, r0
++; V8M-COMMON-NEXT:    mov r3, r0
++; V8M-COMMON-NEXT:    mov r4, r0
++; V8M-COMMON-NEXT:    mov r5, r0
++; V8M-COMMON-NEXT:    mov r6, r0
++; V8M-COMMON-NEXT:    mov r7, r0
++; V8M-COMMON-NEXT:    mov r8, r0
++; V8M-COMMON-NEXT:    mov r9, r0
++; V8M-COMMON-NEXT:    mov r10, r0
++; V8M-COMMON-NEXT:    mov r11, r0
++; V8M-COMMON-NEXT:    mov r12, r0
++; V8M-COMMON-NEXT:    msr apsr_nzcvq, r0
++; V8M-COMMON-NEXT:    blxns r0
++; V8M-COMMON-NEXT:    vlldm sp, {d0 - d15}
++; V8M-COMMON-NEXT:    add sp, #136
++; V8M-COMMON-NEXT:    pop.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V8M-COMMON-NEXT:    movw r1, :lower16:arr
++; V8M-COMMON-NEXT:    uxth r0, r0
++; V8M-COMMON-NEXT:    movt r1, :upper16:arr
++; V8M-COMMON-NEXT:    ldr.w r0, [r1, r0, lsl #2]
++; V8M-COMMON-NEXT:    pop {r7, pc}
++;
++; V81M-COMMON-LABEL: access_u16:
++; V81M-COMMON:       @ %bb.0: @ %entry
++; V81M-COMMON-NEXT:    push {r7, lr}
++; V81M-COMMON-NEXT:    movw r0, :lower16:get_idx
++; V81M-COMMON-NEXT:    movt r0, :upper16:get_idx
++; V81M-COMMON-NEXT:    ldr r0, [r0]
++; V81M-COMMON-NEXT:    push.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V81M-COMMON-NEXT:    bic r0, r0, #1
++; V81M-COMMON-NEXT:    sub sp, #136
++; V81M-COMMON-NEXT:    vlstm sp, {d0 - d15}
++; V81M-COMMON-NEXT:    clrm {r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, apsr}
++; V81M-COMMON-NEXT:    blxns r0
++; V81M-COMMON-NEXT:    vlldm sp, {d0 - d15}
++; V81M-COMMON-NEXT:    add sp, #136
++; V81M-COMMON-NEXT:    pop.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V81M-COMMON-NEXT:    movw r1, :lower16:arr
++; V81M-COMMON-NEXT:    uxth r0, r0
++; V81M-COMMON-NEXT:    movt r1, :upper16:arr
++; V81M-COMMON-NEXT:    ldr.w r0, [r1, r0, lsl #2]
++; V81M-COMMON-NEXT:    pop {r7, pc}
++entry:
++  %0 = load ptr, ptr @get_idx, align 4
++  %call = tail call zeroext i16 %0() "cmse_nonsecure_call"
++  %idxprom = zext i16 %call to i32
++  %arrayidx = getelementptr inbounds [256 x i32], ptr @arr, i32 0, i32 %idxprom
++  %1 = load i32, ptr %arrayidx, align 4
++  ret i32 %1
++}
++
++define i32 @access_i8() {
++; V8M-COMMON-LABEL: access_i8:
++; V8M-COMMON:       @ %bb.0: @ %entry
++; V8M-COMMON-NEXT:    push {r7, lr}
++; V8M-COMMON-NEXT:    movw r0, :lower16:get_idx
++; V8M-COMMON-NEXT:    movt r0, :upper16:get_idx
++; V8M-COMMON-NEXT:    ldr r0, [r0]
++; V8M-COMMON-NEXT:    push.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V8M-COMMON-NEXT:    bic r0, r0, #1
++; V8M-COMMON-NEXT:    sub sp, #136
++; V8M-COMMON-NEXT:    vlstm sp, {d0 - d15}
++; V8M-COMMON-NEXT:    mov r1, r0
++; V8M-COMMON-NEXT:    mov r2, r0
++; V8M-COMMON-NEXT:    mov r3, r0
++; V8M-COMMON-NEXT:    mov r4, r0
++; V8M-COMMON-NEXT:    mov r5, r0
++; V8M-COMMON-NEXT:    mov r6, r0
++; V8M-COMMON-NEXT:    mov r7, r0
++; V8M-COMMON-NEXT:    mov r8, r0
++; V8M-COMMON-NEXT:    mov r9, r0
++; V8M-COMMON-NEXT:    mov r10, r0
++; V8M-COMMON-NEXT:    mov r11, r0
++; V8M-COMMON-NEXT:    mov r12, r0
++; V8M-COMMON-NEXT:    msr apsr_nzcvq, r0
++; V8M-COMMON-NEXT:    blxns r0
++; V8M-COMMON-NEXT:    vlldm sp, {d0 - d15}
++; V8M-COMMON-NEXT:    add sp, #136
++; V8M-COMMON-NEXT:    pop.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V8M-COMMON-NEXT:    movw r1, :lower16:arr
++; V8M-COMMON-NEXT:    sxtb r0, r0
++; V8M-COMMON-NEXT:    movt r1, :upper16:arr
++; V8M-COMMON-NEXT:    ldr.w r0, [r1, r0, lsl #2]
++; V8M-COMMON-NEXT:    pop {r7, pc}
++;
++; V81M-COMMON-LABEL: access_i8:
++; V81M-COMMON:       @ %bb.0: @ %entry
++; V81M-COMMON-NEXT:    push {r7, lr}
++; V81M-COMMON-NEXT:    movw r0, :lower16:get_idx
++; V81M-COMMON-NEXT:    movt r0, :upper16:get_idx
++; V81M-COMMON-NEXT:    ldr r0, [r0]
++; V81M-COMMON-NEXT:    push.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V81M-COMMON-NEXT:    bic r0, r0, #1
++; V81M-COMMON-NEXT:    sub sp, #136
++; V81M-COMMON-NEXT:    vlstm sp, {d0 - d15}
++; V81M-COMMON-NEXT:    clrm {r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, apsr}
++; V81M-COMMON-NEXT:    blxns r0
++; V81M-COMMON-NEXT:    vlldm sp, {d0 - d15}
++; V81M-COMMON-NEXT:    add sp, #136
++; V81M-COMMON-NEXT:    pop.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V81M-COMMON-NEXT:    movw r1, :lower16:arr
++; V81M-COMMON-NEXT:    sxtb r0, r0
++; V81M-COMMON-NEXT:    movt r1, :upper16:arr
++; V81M-COMMON-NEXT:    ldr.w r0, [r1, r0, lsl #2]
++; V81M-COMMON-NEXT:    pop {r7, pc}
++entry:
++  %0 = load ptr, ptr @get_idx, align 4
++  %call = tail call signext i8 %0() "cmse_nonsecure_call"
++  %idxprom = sext i8 %call to i32
++  %arrayidx = getelementptr inbounds [256 x i32], ptr @arr, i32 0, i32 %idxprom
++  %1 = load i32, ptr %arrayidx, align 4
++  ret i32 %1
++}
++
++define i32 @access_u8() {
++; V8M-COMMON-LABEL: access_u8:
++; V8M-COMMON:       @ %bb.0: @ %entry
++; V8M-COMMON-NEXT:    push {r7, lr}
++; V8M-COMMON-NEXT:    movw r0, :lower16:get_idx
++; V8M-COMMON-NEXT:    movt r0, :upper16:get_idx
++; V8M-COMMON-NEXT:    ldr r0, [r0]
++; V8M-COMMON-NEXT:    push.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V8M-COMMON-NEXT:    bic r0, r0, #1
++; V8M-COMMON-NEXT:    sub sp, #136
++; V8M-COMMON-NEXT:    vlstm sp, {d0 - d15}
++; V8M-COMMON-NEXT:    mov r1, r0
++; V8M-COMMON-NEXT:    mov r2, r0
++; V8M-COMMON-NEXT:    mov r3, r0
++; V8M-COMMON-NEXT:    mov r4, r0
++; V8M-COMMON-NEXT:    mov r5, r0
++; V8M-COMMON-NEXT:    mov r6, r0
++; V8M-COMMON-NEXT:    mov r7, r0
++; V8M-COMMON-NEXT:    mov r8, r0
++; V8M-COMMON-NEXT:    mov r9, r0
++; V8M-COMMON-NEXT:    mov r10, r0
++; V8M-COMMON-NEXT:    mov r11, r0
++; V8M-COMMON-NEXT:    mov r12, r0
++; V8M-COMMON-NEXT:    msr apsr_nzcvq, r0
++; V8M-COMMON-NEXT:    blxns r0
++; V8M-COMMON-NEXT:    vlldm sp, {d0 - d15}
++; V8M-COMMON-NEXT:    add sp, #136
++; V8M-COMMON-NEXT:    pop.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V8M-COMMON-NEXT:    movw r1, :lower16:arr
++; V8M-COMMON-NEXT:    uxtb r0, r0
++; V8M-COMMON-NEXT:    movt r1, :upper16:arr
++; V8M-COMMON-NEXT:    ldr.w r0, [r1, r0, lsl #2]
++; V8M-COMMON-NEXT:    pop {r7, pc}
++;
++; V81M-COMMON-LABEL: access_u8:
++; V81M-COMMON:       @ %bb.0: @ %entry
++; V81M-COMMON-NEXT:    push {r7, lr}
++; V81M-COMMON-NEXT:    movw r0, :lower16:get_idx
++; V81M-COMMON-NEXT:    movt r0, :upper16:get_idx
++; V81M-COMMON-NEXT:    ldr r0, [r0]
++; V81M-COMMON-NEXT:    push.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V81M-COMMON-NEXT:    bic r0, r0, #1
++; V81M-COMMON-NEXT:    sub sp, #136
++; V81M-COMMON-NEXT:    vlstm sp, {d0 - d15}
++; V81M-COMMON-NEXT:    clrm {r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, apsr}
++; V81M-COMMON-NEXT:    blxns r0
++; V81M-COMMON-NEXT:    vlldm sp, {d0 - d15}
++; V81M-COMMON-NEXT:    add sp, #136
++; V81M-COMMON-NEXT:    pop.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V81M-COMMON-NEXT:    movw r1, :lower16:arr
++; V81M-COMMON-NEXT:    uxtb r0, r0
++; V81M-COMMON-NEXT:    movt r1, :upper16:arr
++; V81M-COMMON-NEXT:    ldr.w r0, [r1, r0, lsl #2]
++; V81M-COMMON-NEXT:    pop {r7, pc}
++entry:
++  %0 = load ptr, ptr @get_idx, align 4
++  %call = tail call zeroext i8 %0() "cmse_nonsecure_call"
++  %idxprom = zext i8 %call to i32
++  %arrayidx = getelementptr inbounds [256 x i32], ptr @arr, i32 0, i32 %idxprom
++  %1 = load i32, ptr %arrayidx, align 4
++  ret i32 %1
++}
++
++define i32 @access_i1() {
++; V8M-COMMON-LABEL: access_i1:
++; V8M-COMMON:       @ %bb.0: @ %entry
++; V8M-COMMON-NEXT:    push {r7, lr}
++; V8M-COMMON-NEXT:    movw r0, :lower16:get_idx
++; V8M-COMMON-NEXT:    movt r0, :upper16:get_idx
++; V8M-COMMON-NEXT:    ldr r0, [r0]
++; V8M-COMMON-NEXT:    push.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V8M-COMMON-NEXT:    bic r0, r0, #1
++; V8M-COMMON-NEXT:    sub sp, #136
++; V8M-COMMON-NEXT:    vlstm sp, {d0 - d15}
++; V8M-COMMON-NEXT:    mov r1, r0
++; V8M-COMMON-NEXT:    mov r2, r0
++; V8M-COMMON-NEXT:    mov r3, r0
++; V8M-COMMON-NEXT:    mov r4, r0
++; V8M-COMMON-NEXT:    mov r5, r0
++; V8M-COMMON-NEXT:    mov r6, r0
++; V8M-COMMON-NEXT:    mov r7, r0
++; V8M-COMMON-NEXT:    mov r8, r0
++; V8M-COMMON-NEXT:    mov r9, r0
++; V8M-COMMON-NEXT:    mov r10, r0
++; V8M-COMMON-NEXT:    mov r11, r0
++; V8M-COMMON-NEXT:    mov r12, r0
++; V8M-COMMON-NEXT:    msr apsr_nzcvq, r0
++; V8M-COMMON-NEXT:    blxns r0
++; V8M-COMMON-NEXT:    vlldm sp, {d0 - d15}
++; V8M-COMMON-NEXT:    add sp, #136
++; V8M-COMMON-NEXT:    pop.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V8M-COMMON-NEXT:    movw r1, :lower16:arr
++; V8M-COMMON-NEXT:    and r0, r0, #1
++; V8M-COMMON-NEXT:    movt r1, :upper16:arr
++; V8M-COMMON-NEXT:    ldr.w r0, [r1, r0, lsl #2]
++; V8M-COMMON-NEXT:    pop {r7, pc}
++;
++; V81M-COMMON-LABEL: access_i1:
++; V81M-COMMON:       @ %bb.0: @ %entry
++; V81M-COMMON-NEXT:    push {r7, lr}
++; V81M-COMMON-NEXT:    movw r0, :lower16:get_idx
++; V81M-COMMON-NEXT:    movt r0, :upper16:get_idx
++; V81M-COMMON-NEXT:    ldr r0, [r0]
++; V81M-COMMON-NEXT:    push.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V81M-COMMON-NEXT:    bic r0, r0, #1
++; V81M-COMMON-NEXT:    sub sp, #136
++; V81M-COMMON-NEXT:    vlstm sp, {d0 - d15}
++; V81M-COMMON-NEXT:    clrm {r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, apsr}
++; V81M-COMMON-NEXT:    blxns r0
++; V81M-COMMON-NEXT:    vlldm sp, {d0 - d15}
++; V81M-COMMON-NEXT:    add sp, #136
++; V81M-COMMON-NEXT:    pop.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V81M-COMMON-NEXT:    movw r1, :lower16:arr
++; V81M-COMMON-NEXT:    and r0, r0, #1
++; V81M-COMMON-NEXT:    movt r1, :upper16:arr
++; V81M-COMMON-NEXT:    ldr.w r0, [r1, r0, lsl #2]
++; V81M-COMMON-NEXT:    pop {r7, pc}
++entry:
++  %0 = load ptr, ptr @get_idx, align 4
++  %call = tail call zeroext i1 %0() "cmse_nonsecure_call"
++  %idxprom = zext i1 %call to i32
++  %arrayidx = getelementptr inbounds [256 x i32], ptr @arr, i32 0, i32 %idxprom
++  %1 = load i32, ptr %arrayidx, align 4
++  ret i32 %1
++}
++
++define i32 @access_i5() {
++; V8M-COMMON-LABEL: access_i5:
++; V8M-COMMON:       @ %bb.0: @ %entry
++; V8M-COMMON-NEXT:    push {r7, lr}
++; V8M-COMMON-NEXT:    movw r0, :lower16:get_idx
++; V8M-COMMON-NEXT:    movt r0, :upper16:get_idx
++; V8M-COMMON-NEXT:    ldr r0, [r0]
++; V8M-COMMON-NEXT:    push.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V8M-COMMON-NEXT:    bic r0, r0, #1
++; V8M-COMMON-NEXT:    sub sp, #136
++; V8M-COMMON-NEXT:    vlstm sp, {d0 - d15}
++; V8M-COMMON-NEXT:    mov r1, r0
++; V8M-COMMON-NEXT:    mov r2, r0
++; V8M-COMMON-NEXT:    mov r3, r0
++; V8M-COMMON-NEXT:    mov r4, r0
++; V8M-COMMON-NEXT:    mov r5, r0
++; V8M-COMMON-NEXT:    mov r6, r0
++; V8M-COMMON-NEXT:    mov r7, r0
++; V8M-COMMON-NEXT:    mov r8, r0
++; V8M-COMMON-NEXT:    mov r9, r0
++; V8M-COMMON-NEXT:    mov r10, r0
++; V8M-COMMON-NEXT:    mov r11, r0
++; V8M-COMMON-NEXT:    mov r12, r0
++; V8M-COMMON-NEXT:    msr apsr_nzcvq, r0
++; V8M-COMMON-NEXT:    blxns r0
++; V8M-COMMON-NEXT:    vlldm sp, {d0 - d15}
++; V8M-COMMON-NEXT:    add sp, #136
++; V8M-COMMON-NEXT:    pop.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V8M-COMMON-NEXT:    movw r1, :lower16:arr
++; V8M-COMMON-NEXT:    sbfx r0, r0, #0, #5
++; V8M-COMMON-NEXT:    movt r1, :upper16:arr
++; V8M-COMMON-NEXT:    ldr.w r0, [r1, r0, lsl #2]
++; V8M-COMMON-NEXT:    pop {r7, pc}
++;
++; V81M-COMMON-LABEL: access_i5:
++; V81M-COMMON:       @ %bb.0: @ %entry
++; V81M-COMMON-NEXT:    push {r7, lr}
++; V81M-COMMON-NEXT:    movw r0, :lower16:get_idx
++; V81M-COMMON-NEXT:    movt r0, :upper16:get_idx
++; V81M-COMMON-NEXT:    ldr r0, [r0]
++; V81M-COMMON-NEXT:    push.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V81M-COMMON-NEXT:    bic r0, r0, #1
++; V81M-COMMON-NEXT:    sub sp, #136
++; V81M-COMMON-NEXT:    vlstm sp, {d0 - d15}
++; V81M-COMMON-NEXT:    clrm {r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, apsr}
++; V81M-COMMON-NEXT:    blxns r0
++; V81M-COMMON-NEXT:    vlldm sp, {d0 - d15}
++; V81M-COMMON-NEXT:    add sp, #136
++; V81M-COMMON-NEXT:    pop.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V81M-COMMON-NEXT:    movw r1, :lower16:arr
++; V81M-COMMON-NEXT:    sbfx r0, r0, #0, #5
++; V81M-COMMON-NEXT:    movt r1, :upper16:arr
++; V81M-COMMON-NEXT:    ldr.w r0, [r1, r0, lsl #2]
++; V81M-COMMON-NEXT:    pop {r7, pc}
++entry:
++  %0 = load ptr, ptr @get_idx, align 4
++  %call = tail call signext i5 %0() "cmse_nonsecure_call"
++  %idxprom = sext i5 %call to i32
++  %arrayidx = getelementptr inbounds [256 x i32], ptr @arr, i32 0, i32 %idxprom
++  %1 = load i32, ptr %arrayidx, align 4
++  ret i32 %1
++}
++
++define i32 @access_u5() {
++; V8M-COMMON-LABEL: access_u5:
++; V8M-COMMON:       @ %bb.0: @ %entry
++; V8M-COMMON-NEXT:    push {r7, lr}
++; V8M-COMMON-NEXT:    movw r0, :lower16:get_idx
++; V8M-COMMON-NEXT:    movt r0, :upper16:get_idx
++; V8M-COMMON-NEXT:    ldr r0, [r0]
++; V8M-COMMON-NEXT:    push.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V8M-COMMON-NEXT:    bic r0, r0, #1
++; V8M-COMMON-NEXT:    sub sp, #136
++; V8M-COMMON-NEXT:    vlstm sp, {d0 - d15}
++; V8M-COMMON-NEXT:    mov r1, r0
++; V8M-COMMON-NEXT:    mov r2, r0
++; V8M-COMMON-NEXT:    mov r3, r0
++; V8M-COMMON-NEXT:    mov r4, r0
++; V8M-COMMON-NEXT:    mov r5, r0
++; V8M-COMMON-NEXT:    mov r6, r0
++; V8M-COMMON-NEXT:    mov r7, r0
++; V8M-COMMON-NEXT:    mov r8, r0
++; V8M-COMMON-NEXT:    mov r9, r0
++; V8M-COMMON-NEXT:    mov r10, r0
++; V8M-COMMON-NEXT:    mov r11, r0
++; V8M-COMMON-NEXT:    mov r12, r0
++; V8M-COMMON-NEXT:    msr apsr_nzcvq, r0
++; V8M-COMMON-NEXT:    blxns r0
++; V8M-COMMON-NEXT:    vlldm sp, {d0 - d15}
++; V8M-COMMON-NEXT:    add sp, #136
++; V8M-COMMON-NEXT:    pop.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V8M-COMMON-NEXT:    movw r1, :lower16:arr
++; V8M-COMMON-NEXT:    and r0, r0, #31
++; V8M-COMMON-NEXT:    movt r1, :upper16:arr
++; V8M-COMMON-NEXT:    ldr.w r0, [r1, r0, lsl #2]
++; V8M-COMMON-NEXT:    pop {r7, pc}
++;
++; V81M-COMMON-LABEL: access_u5:
++; V81M-COMMON:       @ %bb.0: @ %entry
++; V81M-COMMON-NEXT:    push {r7, lr}
++; V81M-COMMON-NEXT:    movw r0, :lower16:get_idx
++; V81M-COMMON-NEXT:    movt r0, :upper16:get_idx
++; V81M-COMMON-NEXT:    ldr r0, [r0]
++; V81M-COMMON-NEXT:    push.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V81M-COMMON-NEXT:    bic r0, r0, #1
++; V81M-COMMON-NEXT:    sub sp, #136
++; V81M-COMMON-NEXT:    vlstm sp, {d0 - d15}
++; V81M-COMMON-NEXT:    clrm {r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, apsr}
++; V81M-COMMON-NEXT:    blxns r0
++; V81M-COMMON-NEXT:    vlldm sp, {d0 - d15}
++; V81M-COMMON-NEXT:    add sp, #136
++; V81M-COMMON-NEXT:    pop.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V81M-COMMON-NEXT:    movw r1, :lower16:arr
++; V81M-COMMON-NEXT:    and r0, r0, #31
++; V81M-COMMON-NEXT:    movt r1, :upper16:arr
++; V81M-COMMON-NEXT:    ldr.w r0, [r1, r0, lsl #2]
++; V81M-COMMON-NEXT:    pop {r7, pc}
++entry:
++  %0 = load ptr, ptr @get_idx, align 4
++  %call = tail call zeroext i5 %0() "cmse_nonsecure_call"
++  %idxprom = zext i5 %call to i32
++  %arrayidx = getelementptr inbounds [256 x i32], ptr @arr, i32 0, i32 %idxprom
++  %1 = load i32, ptr %arrayidx, align 4
++  ret i32 %1
++}
++
++define i32 @access_i33(ptr %f) {
++; V8M-COMMON-LABEL: access_i33:
++; V8M-COMMON:       @ %bb.0: @ %entry
++; V8M-COMMON-NEXT:    push {r7, lr}
++; V8M-COMMON-NEXT:    push.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V8M-COMMON-NEXT:    bic r0, r0, #1
++; V8M-COMMON-NEXT:    sub sp, #136
++; V8M-COMMON-NEXT:    vlstm sp, {d0 - d15}
++; V8M-COMMON-NEXT:    mov r1, r0
++; V8M-COMMON-NEXT:    mov r2, r0
++; V8M-COMMON-NEXT:    mov r3, r0
++; V8M-COMMON-NEXT:    mov r4, r0
++; V8M-COMMON-NEXT:    mov r5, r0
++; V8M-COMMON-NEXT:    mov r6, r0
++; V8M-COMMON-NEXT:    mov r7, r0
++; V8M-COMMON-NEXT:    mov r8, r0
++; V8M-COMMON-NEXT:    mov r9, r0
++; V8M-COMMON-NEXT:    mov r10, r0
++; V8M-COMMON-NEXT:    mov r11, r0
++; V8M-COMMON-NEXT:    mov r12, r0
++; V8M-COMMON-NEXT:    msr apsr_nzcvq, r0
++; V8M-COMMON-NEXT:    blxns r0
++; V8M-COMMON-NEXT:    vlldm sp, {d0 - d15}
++; V8M-COMMON-NEXT:    add sp, #136
++; V8M-COMMON-NEXT:    pop.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V8M-LE-NEXT:        and r0, r1, #1
++; V8M-BE-NEXT:        and r0, r0, #1
++; V8M-COMMON-NEXT:    rsb.w r0, r0, #0
++; V8M-COMMON-NEXT:    pop {r7, pc}
++;
++; V81M-COMMON-LABEL: access_i33:
++; V81M-COMMON:       @ %bb.0: @ %entry
++; V81M-COMMON-NEXT:    push {r7, lr}
++; V81M-COMMON-NEXT:    push.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V81M-COMMON-NEXT:    bic r0, r0, #1
++; V81M-COMMON-NEXT:    sub sp, #136
++; V81M-COMMON-NEXT:    vlstm sp, {d0 - d15}
++; V81M-COMMON-NEXT:    clrm {r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, apsr}
++; V81M-COMMON-NEXT:    blxns r0
++; V81M-COMMON-NEXT:    vlldm sp, {d0 - d15}
++; V81M-COMMON-NEXT:    add sp, #136
++; V81M-COMMON-NEXT:    pop.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V81M-LE-NEXT:        and r0, r1, #1
++; V81M-BE-NEXT:        and r0, r0, #1
++; V81M-COMMON-NEXT:    rsb.w r0, r0, #0
++; V81M-COMMON-NEXT:    pop {r7, pc}
++entry:
++  %call = tail call i33 %f() "cmse_nonsecure_call"
++  %shr = ashr i33 %call, 32
++  %conv = trunc nsw i33 %shr to i32
++  ret i32 %conv
++}
++
++define i32 @access_u33(ptr %f) {
++; V8M-COMMON-LABEL: access_u33:
++; V8M-COMMON:       @ %bb.0: @ %entry
++; V8M-COMMON-NEXT:    push {r7, lr}
++; V8M-COMMON-NEXT:    push.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V8M-COMMON-NEXT:    bic r0, r0, #1
++; V8M-COMMON-NEXT:    sub sp, #136
++; V8M-COMMON-NEXT:    vlstm sp, {d0 - d15}
++; V8M-COMMON-NEXT:    mov r1, r0
++; V8M-COMMON-NEXT:    mov r2, r0
++; V8M-COMMON-NEXT:    mov r3, r0
++; V8M-COMMON-NEXT:    mov r4, r0
++; V8M-COMMON-NEXT:    mov r5, r0
++; V8M-COMMON-NEXT:    mov r6, r0
++; V8M-COMMON-NEXT:    mov r7, r0
++; V8M-COMMON-NEXT:    mov r8, r0
++; V8M-COMMON-NEXT:    mov r9, r0
++; V8M-COMMON-NEXT:    mov r10, r0
++; V8M-COMMON-NEXT:    mov r11, r0
++; V8M-COMMON-NEXT:    mov r12, r0
++; V8M-COMMON-NEXT:    msr apsr_nzcvq, r0
++; V8M-COMMON-NEXT:    blxns r0
++; V8M-COMMON-NEXT:    vlldm sp, {d0 - d15}
++; V8M-COMMON-NEXT:    add sp, #136
++; V8M-COMMON-NEXT:    pop.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V8M-LE-NEXT:        and r0, r1, #1
++; V8M-BE-NEXT:        and r0, r0, #1
++; V8M-COMMON-NEXT:    pop {r7, pc}
++;
++; V81M-COMMON-LABEL: access_u33:
++; V81M-COMMON:       @ %bb.0: @ %entry
++; V81M-COMMON-NEXT:    push {r7, lr}
++; V81M-COMMON-NEXT:    push.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V81M-COMMON-NEXT:    bic r0, r0, #1
++; V81M-COMMON-NEXT:    sub sp, #136
++; V81M-COMMON-NEXT:    vlstm sp, {d0 - d15}
++; V81M-COMMON-NEXT:    clrm {r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, apsr}
++; V81M-COMMON-NEXT:    blxns r0
++; V81M-COMMON-NEXT:    vlldm sp, {d0 - d15}
++; V81M-COMMON-NEXT:    add sp, #136
++; V81M-COMMON-NEXT:    pop.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V81M-LE-NEXT:        and r0, r1, #1
++; V81M-BE-NEXT:        and r0, r0, #1
++; V81M-COMMON-NEXT:    pop {r7, pc}
++entry:
++  %call = tail call i33 %f() "cmse_nonsecure_call"
++  %shr = lshr i33 %call, 32
++  %conv = trunc nuw nsw i33 %shr to i32
++  ret i32 %conv
++}
+diff --git a/llvm/test/CodeGen/ARM/cmse-harden-entry-arguments.ll b/llvm/test/CodeGen/ARM/cmse-harden-entry-arguments.ll
+new file mode 100644
+index 0000000000..c66ab00566dd
+--- /dev/null
++++ b/llvm/test/CodeGen/ARM/cmse-harden-entry-arguments.ll
+@@ -0,0 +1,368 @@
++; RUN: llc %s -mtriple=thumbv8m.main     -o - | FileCheck %s --check-prefixes V8M-COMMON,V8M-LE
++; RUN: llc %s -mtriple=thumbebv8m.main   -o - | FileCheck %s --check-prefixes V8M-COMMON,V8M-BE
++; RUN: llc %s -mtriple=thumbv8.1m.main   -o - | FileCheck %s --check-prefixes V81M-COMMON,V81M-LE
++; RUN: llc %s -mtriple=thumbebv8.1m.main -o - | FileCheck %s --check-prefixes V81M-COMMON,V81M-BE
++
++@arr = hidden local_unnamed_addr global [256 x i32] zeroinitializer, align 4
++
++define i32 @access_i16(i16 signext %idx) "cmse_nonsecure_entry" {
++; V8M-COMMON-LABEL: access_i16:
++; V8M-COMMON:       @ %bb.0: @ %entry
++; V8M-COMMON-NEXT:    movw r1, :lower16:arr
++; V8M-COMMON-NEXT:    sxth r0, r0
++; V8M-COMMON-NEXT:    movt r1, :upper16:arr
++; V8M-COMMON-NEXT:    mov r2, lr
++; V8M-COMMON-NEXT:    ldr.w r0, [r1, r0, lsl #2]
++; V8M-COMMON-NEXT:    mov r1, lr
++; V8M-COMMON-NEXT:    mov r3, lr
++; V8M-COMMON-NEXT:    msr apsr_nzcvq, lr
++; V8M-COMMON-NEXT:    mov r12, lr
++; V8M-COMMON-NEXT:    bxns lr
++;
++; V81M-COMMON-LABEL: access_i16:
++; V81M-COMMON:       @ %bb.0: @ %entry
++; V81M-COMMON-NEXT:    vstr fpcxtns, [sp, #-4]!
++; V81M-COMMON-NEXT:    movw r1, :lower16:arr
++; V81M-COMMON-NEXT:    sxth r0, r0
++; V81M-COMMON-NEXT:    movt r1, :upper16:arr
++; V81M-COMMON-NEXT:    ldr.w r0, [r1, r0, lsl #2]
++; V81M-COMMON-NEXT:    vscclrm {s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15, vpr}
++; V81M-COMMON-NEXT:    vldr fpcxtns, [sp], #4
++; V81M-COMMON-NEXT:    clrm {r1, r2, r3, r12, apsr}
++; V81M-COMMON-NEXT:    bxns lr
++entry:
++  %idxprom = sext i16 %idx to i32
++  %arrayidx = getelementptr inbounds [256 x i32], ptr @arr, i32 0, i32 %idxprom
++  %0 = load i32, ptr %arrayidx, align 4
++  ret i32 %0
++}
++
++define i32 @access_u16(i16 zeroext %idx) "cmse_nonsecure_entry" {
++; V8M-COMMON-LABEL: access_u16:
++; V8M-COMMON:       @ %bb.0: @ %entry
++; V8M-COMMON-NEXT:    movw r1, :lower16:arr
++; V8M-COMMON-NEXT:    uxth r0, r0
++; V8M-COMMON-NEXT:    movt r1, :upper16:arr
++; V8M-COMMON-NEXT:    mov r2, lr
++; V8M-COMMON-NEXT:    ldr.w r0, [r1, r0, lsl #2]
++; V8M-COMMON-NEXT:    mov r1, lr
++; V8M-COMMON-NEXT:    mov r3, lr
++; V8M-COMMON-NEXT:    msr apsr_nzcvq, lr
++; V8M-COMMON-NEXT:    mov r12, lr
++; V8M-COMMON-NEXT:    bxns lr
++;
++; V81M-COMMON-LABEL: access_u16:
++; V81M-COMMON:       @ %bb.0: @ %entry
++; V81M-COMMON-NEXT:    vstr fpcxtns, [sp, #-4]!
++; V81M-COMMON-NEXT:    movw r1, :lower16:arr
++; V81M-COMMON-NEXT:    uxth r0, r0
++; V81M-COMMON-NEXT:    movt r1, :upper16:arr
++; V81M-COMMON-NEXT:    ldr.w r0, [r1, r0, lsl #2]
++; V81M-COMMON-NEXT:    vscclrm {s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15, vpr}
++; V81M-COMMON-NEXT:    vldr fpcxtns, [sp], #4
++; V81M-COMMON-NEXT:    clrm {r1, r2, r3, r12, apsr}
++; V81M-COMMON-NEXT:    bxns lr
++entry:
++  %idxprom = zext i16 %idx to i32
++  %arrayidx = getelementptr inbounds [256 x i32], ptr @arr, i32 0, i32 %idxprom
++  %0 = load i32, ptr %arrayidx, align 4
++  ret i32 %0
++}
++
++define i32 @access_i8(i8 signext %idx) "cmse_nonsecure_entry" {
++; V8M-COMMON-LABEL: access_i8:
++; V8M-COMMON:       @ %bb.0: @ %entry
++; V8M-COMMON-NEXT:    movw r1, :lower16:arr
++; V8M-COMMON-NEXT:    sxtb r0, r0
++; V8M-COMMON-NEXT:    movt r1, :upper16:arr
++; V8M-COMMON-NEXT:    mov r2, lr
++; V8M-COMMON-NEXT:    ldr.w r0, [r1, r0, lsl #2]
++; V8M-COMMON-NEXT:    mov r1, lr
++; V8M-COMMON-NEXT:    mov r3, lr
++; V8M-COMMON-NEXT:    msr apsr_nzcvq, lr
++; V8M-COMMON-NEXT:    mov r12, lr
++; V8M-COMMON-NEXT:    bxns lr
++;
++; V81M-COMMON-LABEL: access_i8:
++; V81M-COMMON:       @ %bb.0: @ %entry
++; V81M-COMMON-NEXT:    vstr fpcxtns, [sp, #-4]!
++; V81M-COMMON-NEXT:    movw r1, :lower16:arr
++; V81M-COMMON-NEXT:    sxtb r0, r0
++; V81M-COMMON-NEXT:    movt r1, :upper16:arr
++; V81M-COMMON-NEXT:    ldr.w r0, [r1, r0, lsl #2]
++; V81M-COMMON-NEXT:    vscclrm {s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15, vpr}
++; V81M-COMMON-NEXT:    vldr fpcxtns, [sp], #4
++; V81M-COMMON-NEXT:    clrm {r1, r2, r3, r12, apsr}
++; V81M-COMMON-NEXT:    bxns lr
++entry:
++  %idxprom = sext i8 %idx to i32
++  %arrayidx = getelementptr inbounds [256 x i32], ptr @arr, i32 0, i32 %idxprom
++  %0 = load i32, ptr %arrayidx, align 4
++  ret i32 %0
++}
++
++define i32 @access_u8(i8 zeroext %idx) "cmse_nonsecure_entry" {
++; V8M-COMMON-LABEL: access_u8:
++; V8M-COMMON:       @ %bb.0: @ %entry
++; V8M-COMMON-NEXT:    movw r1, :lower16:arr
++; V8M-COMMON-NEXT:    uxtb r0, r0
++; V8M-COMMON-NEXT:    movt r1, :upper16:arr
++; V8M-COMMON-NEXT:    mov r2, lr
++; V8M-COMMON-NEXT:    ldr.w r0, [r1, r0, lsl #2]
++; V8M-COMMON-NEXT:    mov r1, lr
++; V8M-COMMON-NEXT:    mov r3, lr
++; V8M-COMMON-NEXT:    msr apsr_nzcvq, lr
++; V8M-COMMON-NEXT:    mov r12, lr
++; V8M-COMMON-NEXT:    bxns lr
++;
++; V81M-COMMON-LABEL: access_u8:
++; V81M-COMMON:       @ %bb.0: @ %entry
++; V81M-COMMON-NEXT:    vstr fpcxtns, [sp, #-4]!
++; V81M-COMMON-NEXT:    movw r1, :lower16:arr
++; V81M-COMMON-NEXT:    uxtb r0, r0
++; V81M-COMMON-NEXT:    movt r1, :upper16:arr
++; V81M-COMMON-NEXT:    ldr.w r0, [r1, r0, lsl #2]
++; V81M-COMMON-NEXT:    vscclrm {s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15, vpr}
++; V81M-COMMON-NEXT:    vldr fpcxtns, [sp], #4
++; V81M-COMMON-NEXT:    clrm {r1, r2, r3, r12, apsr}
++; V81M-COMMON-NEXT:    bxns lr
++entry:
++  %idxprom = zext i8 %idx to i32
++  %arrayidx = getelementptr inbounds [256 x i32], ptr @arr, i32 0, i32 %idxprom
++  %0 = load i32, ptr %arrayidx, align 4
++  ret i32 %0
++}
++
++define i32 @access_i1(i1 signext %idx) "cmse_nonsecure_entry" {
++; V8M-COMMON-LABEL: access_i1:
++; V8M-COMMON:       @ %bb.0: @ %entry
++; V8M-COMMON-NEXT:    and r0, r0, #1
++; V8M-COMMON-NEXT:    movw r1, :lower16:arr
++; V8M-COMMON-NEXT:    rsbs r0, r0, #0
++; V8M-COMMON-NEXT:    movt r1, :upper16:arr
++; V8M-COMMON-NEXT:    and r0, r0, #1
++; V8M-COMMON-NEXT:    mov r2, lr
++; V8M-COMMON-NEXT:    mov r3, lr
++; V8M-COMMON-NEXT:    mov r12, lr
++; V8M-COMMON-NEXT:    ldr.w r0, [r1, r0, lsl #2]
++; V8M-COMMON-NEXT:    mov r1, lr
++; V8M-COMMON-NEXT:    msr apsr_nzcvq, lr
++; V8M-COMMON-NEXT:    bxns lr
++;
++; V81M-COMMON-LABEL: access_i1:
++; V81M-COMMON:       @ %bb.0: @ %entry
++; V81M-COMMON-NEXT:    vstr fpcxtns, [sp, #-4]!
++; V81M-COMMON-NEXT:    and r0, r0, #1
++; V81M-COMMON-NEXT:    movw r1, :lower16:arr
++; V81M-COMMON-NEXT:    rsbs r0, r0, #0
++; V81M-COMMON-NEXT:    movt r1, :upper16:arr
++; V81M-COMMON-NEXT:    and r0, r0, #1
++; V81M-COMMON-NEXT:    ldr.w r0, [r1, r0, lsl #2]
++; V81M-COMMON-NEXT:    vscclrm {s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15, vpr}
++; V81M-COMMON-NEXT:    vldr fpcxtns, [sp], #4
++; V81M-COMMON-NEXT:    clrm {r1, r2, r3, r12, apsr}
++; V81M-COMMON-NEXT:    bxns lr
++entry:
++  %idxprom = zext i1 %idx to i32
++  %arrayidx = getelementptr inbounds [256 x i32], ptr @arr, i32 0, i32 %idxprom
++  %0 = load i32, ptr %arrayidx, align 4
++  ret i32 %0
++}
++
++define i32 @access_i5(i5 signext %idx) "cmse_nonsecure_entry" {
++; V8M-COMMON-LABEL: access_i5:
++; V8M-COMMON:       @ %bb.0: @ %entry
++; V8M-COMMON-NEXT:    movw r1, :lower16:arr
++; V8M-COMMON-NEXT:    sbfx r0, r0, #0, #5
++; V8M-COMMON-NEXT:    movt r1, :upper16:arr
++; V8M-COMMON-NEXT:    mov r2, lr
++; V8M-COMMON-NEXT:    ldr.w r0, [r1, r0, lsl #2]
++; V8M-COMMON-NEXT:    mov r1, lr
++; V8M-COMMON-NEXT:    mov r3, lr
++; V8M-COMMON-NEXT:    msr apsr_nzcvq, lr
++; V8M-COMMON-NEXT:    mov r12, lr
++; V8M-COMMON-NEXT:    bxns lr
++;
++; V81M-COMMON-LABEL: access_i5:
++; V81M-COMMON:       @ %bb.0: @ %entry
++; V81M-COMMON-NEXT:    vstr fpcxtns, [sp, #-4]!
++; V81M-COMMON-NEXT:    movw r1, :lower16:arr
++; V81M-COMMON-NEXT:    sbfx r0, r0, #0, #5
++; V81M-COMMON-NEXT:    movt r1, :upper16:arr
++; V81M-COMMON-NEXT:    ldr.w r0, [r1, r0, lsl #2]
++; V81M-COMMON-NEXT:    vscclrm {s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15, vpr}
++; V81M-COMMON-NEXT:    vldr fpcxtns, [sp], #4
++; V81M-COMMON-NEXT:    clrm {r1, r2, r3, r12, apsr}
++; V81M-COMMON-NEXT:    bxns lr
++entry:
++  %idxprom = sext i5 %idx to i32
++  %arrayidx = getelementptr inbounds [256 x i32], ptr @arr, i32 0, i32 %idxprom
++  %0 = load i32, ptr %arrayidx, align 4
++  ret i32 %0
++}
++
++define i32 @access_u5(i5 zeroext %idx) "cmse_nonsecure_entry" {
++; V8M-COMMON-LABEL: access_u5:
++; V8M-COMMON:       @ %bb.0: @ %entry
++; V8M-COMMON-NEXT:    movw r1, :lower16:arr
++; V8M-COMMON-NEXT:    and r0, r0, #31
++; V8M-COMMON-NEXT:    movt r1, :upper16:arr
++; V8M-COMMON-NEXT:    mov r2, lr
++; V8M-COMMON-NEXT:    ldr.w r0, [r1, r0, lsl #2]
++; V8M-COMMON-NEXT:    mov r1, lr
++; V8M-COMMON-NEXT:    mov r3, lr
++; V8M-COMMON-NEXT:    msr apsr_nzcvq, lr
++; V8M-COMMON-NEXT:    mov r12, lr
++; V8M-COMMON-NEXT:    bxns lr
++;
++; V81M-COMMON-LABEL: access_u5:
++; V81M-COMMON:       @ %bb.0: @ %entry
++; V81M-COMMON-NEXT:    vstr fpcxtns, [sp, #-4]!
++; V81M-COMMON-NEXT:    movw r1, :lower16:arr
++; V81M-COMMON-NEXT:    and r0, r0, #31
++; V81M-COMMON-NEXT:    movt r1, :upper16:arr
++; V81M-COMMON-NEXT:    ldr.w r0, [r1, r0, lsl #2]
++; V81M-COMMON-NEXT:    vscclrm {s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15, vpr}
++; V81M-COMMON-NEXT:    vldr fpcxtns, [sp], #4
++; V81M-COMMON-NEXT:    clrm {r1, r2, r3, r12, apsr}
++; V81M-COMMON-NEXT:    bxns lr
++entry:
++  %idxprom = zext i5 %idx to i32
++  %arrayidx = getelementptr inbounds [256 x i32], ptr @arr, i32 0, i32 %idxprom
++  %0 = load i32, ptr %arrayidx, align 4
++  ret i32 %0
++}
++
++define i32 @access_i33(i33 %arg) "cmse_nonsecure_entry" {
++; V8M-COMMON-LABEL: access_i33:
++; V8M-COMMON:       @ %bb.0: @ %entry
++; V8M-LE-NEXT:        and r0, r1, #1
++; V8M-BE-NEXT:        and r0, r0, #1
++; V8M-COMMON-NEXT:    mov r1, lr
++; V8M-COMMON-NEXT:    rsbs r0, r0, #0
++; V8M-COMMON-NEXT:    mov r2, lr
++; V8M-COMMON-NEXT:    mov r3, lr
++; V8M-COMMON-NEXT:    mov r12, lr
++; V8M-COMMON-NEXT:    msr apsr_nzcvq, lr
++; V8M-COMMON-NEXT:    bxns lr
++;
++; V81M-COMMON-LABEL: access_i33:
++; V81M-COMMON:       @ %bb.0: @ %entry
++; V81M-COMMON-NEXT:    vstr fpcxtns, [sp, #-4]!
++; V81M-LE-NEXT:        and r0, r1, #1
++; V81M-BE-NEXT:        and r0, r0, #1
++; V81M-COMMON-NEXT:    vscclrm {s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15, vpr}
++; V81M-COMMON-NEXT:    rsbs r0, r0, #0
++; V81M-COMMON-NEXT:    vldr fpcxtns, [sp], #4
++; V81M-COMMON-NEXT:    clrm {r1, r2, r3, r12, apsr}
++; V81M-COMMON-NEXT:    bxns lr
++entry:
++  %shr = ashr i33 %arg, 32
++  %conv = trunc nsw i33 %shr to i32
++  ret i32 %conv
++}
++
++define i32 @access_u33(i33 %arg) "cmse_nonsecure_entry" {
++; V8M-COMMON-LABEL: access_u33:
++; V8M-COMMON:       @ %bb.0: @ %entry
++; V8M-LE-NEXT:        and r0, r1, #1
++; V8M-BE-NEXT:        and r0, r0, #1
++; V8M-COMMON-NEXT:    mov r1, lr
++; V8M-COMMON-NEXT:    mov r2, lr
++; V8M-COMMON-NEXT:    mov r3, lr
++; V8M-COMMON-NEXT:    mov r12, lr
++; V8M-COMMON-NEXT:    msr apsr_nzcvq, lr
++; V8M-COMMON-NEXT:    bxns lr
++;
++; V81M-COMMON-LABEL: access_u33:
++; V81M-COMMON:       @ %bb.0: @ %entry
++; V81M-COMMON-NEXT:    vstr fpcxtns, [sp, #-4]!
++; V81M-LE-NEXT:        and r0, r1, #1
++; V81M-BE-NEXT:        and r0, r0, #1
++; V81M-COMMON-NEXT:    vscclrm {s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15, vpr}
++; V81M-COMMON-NEXT:    vldr fpcxtns, [sp], #4
++; V81M-COMMON-NEXT:    clrm {r1, r2, r3, r12, apsr}
++; V81M-COMMON-NEXT:    bxns lr
++entry:
++  %shr = lshr i33 %arg, 32
++  %conv = trunc nuw nsw i33 %shr to i32
++  ret i32 %conv
++}
++
++define i32 @access_i65(ptr byval(i65) %0) "cmse_nonsecure_entry" {
++; V8M-COMMON-LABEL: access_i65:
++; V8M-COMMON:       @ %bb.0: @ %entry
++; V8M-COMMON-NEXT:    sub sp, #16
++; V8M-COMMON-NEXT:    stm.w sp, {r0, r1, r2, r3}
++; V8M-LE-NEXT:        ldrb.w r0, [sp, #8]
++; V8M-LE-NEXT:        and r0, r0, #1
++; V8M-LE-NEXT:        rsbs r0, r0, #0
++; V8M-BE-NEXT:        movs r1, #0
++; V8M-BE-NEXT:        sub.w r0, r1, r0, lsr #24
++; V8M-COMMON-NEXT:    add sp, #16
++; V8M-COMMON-NEXT:    mov r1, lr
++; V8M-COMMON-NEXT:    mov r2, lr
++; V8M-COMMON-NEXT:    mov r3, lr
++; V8M-COMMON-NEXT:    mov r12, lr
++; V8M-COMMON-NEXT:    msr apsr_nzcvq, lr
++; V8M-COMMON-NEXT:    bxns lr
++;
++; V81M-COMMON-LABEL: access_i65:
++; V81M-COMMON:       @ %bb.0: @ %entry
++; V81M-COMMON-NEXT:    vstr fpcxtns, [sp, #-4]!
++; V81M-COMMON-NEXT:    sub sp, #16
++; V81M-COMMON-NEXT:    add sp, #4
++; V81M-COMMON-NEXT:    stm.w sp, {r0, r1, r2, r3}
++; V81M-LE-NEXT:        ldrb.w r0, [sp, #8]
++; V81M-LE-NEXT:        and r0, r0, #1
++; V81M-LE-NEXT:        rsbs r0, r0, #0
++; V81M-BE-NEXT:        movs r1, #0
++; V81M-BE-NEXT:        sub.w r0, r1, r0, lsr #24
++; V81M-COMMON-NEXT:    sub sp, #4
++; V81M-COMMON-NEXT:    add sp, #16
++; V81M-COMMON-NEXT:    vscclrm {s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15, vpr}
++; V81M-COMMON-NEXT:    vldr fpcxtns, [sp], #4
++; V81M-COMMON-NEXT:    clrm {r1, r2, r3, r12, apsr}
++; V81M-COMMON-NEXT:    bxns lr
++entry:
++  %arg = load i65, ptr %0, align 8
++  %shr = ashr i65 %arg, 64
++  %conv = trunc nsw i65 %shr to i32
++  ret i32 %conv
++}
++
++define i32 @access_u65(ptr byval(i65) %0) "cmse_nonsecure_entry" {
++; V8M-COMMON-LABEL: access_u65:
++; V8M-COMMON:       @ %bb.0: @ %entry
++; V8M-COMMON-NEXT:    sub sp, #16
++; V8M-COMMON-NEXT:    stm.w sp, {r0, r1, r2, r3}
++; V8M-LE-NEXT:        ldrb.w r0, [sp, #8]
++; V8M-BE-NEXT:        lsrs r0, r0, #24
++; V8M-COMMON-NEXT:    add sp, #16
++; V8M-COMMON-NEXT:    mov r1, lr
++; V8M-COMMON-NEXT:    mov r2, lr
++; V8M-COMMON-NEXT:    mov r3, lr
++; V8M-COMMON-NEXT:    mov r12, lr
++; V8M-COMMON-NEXT:    msr apsr_nzcvq, lr
++; V8M-COMMON-NEXT:    bxns lr
++;
++; V81M-COMMON-LABEL: access_u65:
++; V81M-COMMON:       @ %bb.0: @ %entry
++; V81M-COMMON-NEXT:    vstr fpcxtns, [sp, #-4]!
++; V81M-COMMON-NEXT:    sub sp, #16
++; V81M-COMMON-NEXT:    add sp, #4
++; V81M-COMMON-NEXT:    stm.w sp, {r0, r1, r2, r3}
++; V81M-LE-NEXT:        ldrb.w r0, [sp, #8]
++; V81M-BE-NEXT:        lsrs r0, r0, #24
++; V81M-COMMON-NEXT:    sub sp, #4
++; V81M-COMMON-NEXT:    add sp, #16
++; V81M-COMMON-NEXT:    vscclrm {s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15, vpr}
++; V81M-COMMON-NEXT:    vldr fpcxtns, [sp], #4
++; V81M-COMMON-NEXT:    clrm {r1, r2, r3, r12, apsr}
++; V81M-COMMON-NEXT:    bxns lr
++entry:
++  %arg = load i65, ptr %0, align 8
++  %shr = lshr i65 %arg, 64
++  %conv = trunc nuw nsw i65 %shr to i32
++  ret i32 %conv
++}
diff --git a/meta/recipes-devtools/llvm/llvm_18.1.8.bb b/meta/recipes-devtools/llvm/llvm_18.1.8.bb
index 3c804eddd2..8dad952923 100644
--- a/meta/recipes-devtools/llvm/llvm_18.1.8.bb
+++ b/meta/recipes-devtools/llvm/llvm_18.1.8.bb
@@ -25,6 +25,7 @@ LLVM_RELEASE = "${PV}"
 SRC_URI = "https://github.com/llvm/llvm-project/releases/download/llvmorg-${PV}/llvm-project-${PV}.src.tar.xz \
            file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2 \
            file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 \
+           file://0002-llvm-Fix-CVE-2024-0151.patch;striplevel=2 \
            file://llvm-config \
            "
 SRC_URI[sha256sum] = "0b58557a6d32ceee97c8d533a59b9212d87e0fc4d2833924eb6c611247db2f2a"
-- 
2.43.0


