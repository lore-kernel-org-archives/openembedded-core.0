Return-Path: <Deepthi.Hemraj@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3DCEC2BD09
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 12:38:35 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.18493.1719837509134308458
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jul 2024 05:38:29 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=79127ccecd=deepthi.hemraj@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4615CoeY025585
	for <openembedded-core@lists.openembedded.org>; Mon, 1 Jul 2024 12:38:28 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4029869qrd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 01 Jul 2024 12:38:27 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ju36qiB2tNCdxTeudivLYL+6cwjriY4FH77hKYj4YuWMn9fOi5ODYVxrRvEtT7s2Zd2KF42ZBCbA/VEeOBkRDi/g3d9x+JY7aOhR+ZTixPMxFUtDQhCCn86abPkx0p2SGZT6KRTi+6ek6BS2rwfPWfesZuidI5x2umw0sNTvR08SXA1VERQjl6g0o3mditkPW66eLDfW8zpCmCuvpeIxy9X8fixWgmY8JfFHf05kF6oDN++bdNGU5A90MAqZec+qpgPwHOqxdSkp0gnyQ1GANk414GvJ+eJsHLcm0h+GCIQztgHC37mofEm1ET5DTMBh9co4AnzUnDKdQb5xdDIqrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OzQJvSWoFYMDR7D/cf2qOJ7l0pCIuhQLGLAc24LSF0M=;
 b=PbA32Cc3f/9Yw2qPoEnWRzO63TZVI1IuikMTGgz0zX+mqhif+T+FYHM6rAHc8mm3NjOYjXPtOpX0vO34Q6fty8RrzA71hUzu2yOr7M07SwnC0FlZmoFJv7zA72S+pJ+uDl936dkOACqIJj3zVS18feCz+M7Rbc5Ru95ABQHcS9WfZr983DWqgAil2rXhvTHx2ipRtyKktYIQDDrkS90C3sKBCF1GvFG8TKFtQH3BNEa+/0xlU29YSuSsXZFe0O90DQDKmFzk3lfJHk0rpgfrbuhmz+Dqlaa/NSMYy0ZTKUjLxzJ8/2LHsDNFaJZmTGotQDl66y/A4CHGIHcxzqUD6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8602.namprd11.prod.outlook.com (2603:10b6:408:1b3::11)
 by LV3PR11MB8726.namprd11.prod.outlook.com (2603:10b6:408:21a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.32; Mon, 1 Jul
 2024 12:38:13 +0000
Received: from LV3PR11MB8602.namprd11.prod.outlook.com
 ([fe80::5e20:4508:a523:df39]) by LV3PR11MB8602.namprd11.prod.outlook.com
 ([fe80::5e20:4508:a523:df39%7]) with mapi id 15.20.7719.029; Mon, 1 Jul 2024
 12:38:12 +0000
From: Deepthi.Hemraj@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com,
        Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com
Subject: [scarthgap][PATCH] llvm: Fix CVE-2024-0151
Date: Mon,  1 Jul 2024 05:37:52 -0700
Message-ID: <20240701123752.237702-1-Deepthi.Hemraj@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0051.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::26) To LV3PR11MB8602.namprd11.prod.outlook.com
 (2603:10b6:408:1b3::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8602:EE_|LV3PR11MB8726:EE_
X-MS-Office365-Filtering-Correlation-Id: e7ecfaea-ec07-4d3a-b650-08dc99caabf1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Ruomupezq4QWnVGMASFxf4FtDyMy1H/ItwiYxxaktHyDZl0yUNao7J+cj8Mr?=
 =?us-ascii?Q?WfEkNOUP6jfLxQU5Wrq6AlwkAyF+3wIE/K5YCm6kySXuMY7uHStUlY6tnan/?=
 =?us-ascii?Q?gQq7zRXENtlVrVBD27nHiR9dj+lqFLU6ouXMm1RAqfM0zVBafaHwXLD6VZdt?=
 =?us-ascii?Q?K2rZtkyYWl9m2dCl1IretTfjfgGyxOU28IJKNXyO5pvJ05ODx99zDh2+huk4?=
 =?us-ascii?Q?euANYO9qN9ipeLklRyLNIA+uiTQK7Q/FieWLVCVzmHxA1Nmrb2UApoqq1rvg?=
 =?us-ascii?Q?JdLY7S7rwbji0Sy/iIXLBqhyc6KUvCU7vB9ZZhEVkMSr4i4ZjIJkAjCyRXkc?=
 =?us-ascii?Q?5Fb5Vg9/yprQXckWkoCTulmn4DFJgewWMmI4uo3h1wwr4/5eH8XCkvSJZkzY?=
 =?us-ascii?Q?7vaNCmN6bDRcgn0s4cijvUj9if+XQv/Ecc+0algqbBuioy19v7fe1NoIBHEE?=
 =?us-ascii?Q?j8P42nR/LKDD9El1MuRWpy3tgxBqsicbe/7FX0v8xsG/xdIOcZ2JUGxyJcLH?=
 =?us-ascii?Q?HQlyk08pt0/1BKIloijpUqyIRmC7cVYcnJWtpLvXdSWeXKHjwwAOYpsaOueZ?=
 =?us-ascii?Q?dirQZA+JMsHwnnyLeN2dB5K90NJu+4eZHtjrUn8AhcBHCQ36kD/m0EwgdiWd?=
 =?us-ascii?Q?+qPtWMJdOcZ63YC89Fx83TtxLS66Zit2c0TDsusyP7hMphBudVhteFcrs02O?=
 =?us-ascii?Q?iZuy2E/qbG1dOFSErOlfFFPzYbe0/VhPzlLhxiD5HpB7My41pk6IzRNI/oJg?=
 =?us-ascii?Q?+taZFD1obrUU+3O58MpQy38jofgZq3+0FgqYshajJdP2u719YIEsoExddDe1?=
 =?us-ascii?Q?4HO566febnoI1EPOB0zWz+eKx+ylmAro4eIe8ZHL2pg+D0S5lv+OBP3x5frL?=
 =?us-ascii?Q?OmsDrsqME5N/YfED6uRTNlYcGevcblSvHekcaGEO/66sDtquqxQEEHsZjd9Y?=
 =?us-ascii?Q?qbClfnazYMf1OHRhaUAP2yDCquUDW7F7SqVDINiu2RU2ibvwKkmHs56/vweW?=
 =?us-ascii?Q?VCX8as/e6kVHVfPZ8aw5qk+YzIkffNxOY744rucN6wGJdxMJecfizjHRoov8?=
 =?us-ascii?Q?YOzoFT95xZZV05++Giu3tvJ4esmStWfp3cXn2+TZD7elrD19KQ6N0UvMVS1O?=
 =?us-ascii?Q?gyeIjPao0/I7gJrwk6ZMXlb28XNStgBN0dpILNu7rUyi3FXFDxbzjpeyMzDS?=
 =?us-ascii?Q?pjiNoPlylVkgxYxqtDNZ4kDxn8PfsBfaMJzW1t+AHXokpPyatHsGsOYs2PLm?=
 =?us-ascii?Q?AUvFRZMHdHiMdGH2gRJ8PLLrkW++jMft06Us7B4duNOLg5lSWnWbYqg+nw5B?=
 =?us-ascii?Q?q0WoKH/iGL1Tbqo/svbM2H/VY6dL+x3mLp+3+zKOTuK/6ZvEftVzTRokWNhU?=
 =?us-ascii?Q?8L9bJXE=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?yv4Mn2sEY3Uk3AJutjUQ1LcRyPn25quCpAuUtvIY/iOfYriXLDHtvPCmVr9K?=
 =?us-ascii?Q?NRloJawcklNzClJIwDyXjidStqnAiEMRiVwmT7Q6Egf1LZLgwNOY1xxmATiN?=
 =?us-ascii?Q?AjrmQPJ7guVNTZTKDfh5GaYnYin2JC3yMoZSlx3zozOufdsFo5XF7n5vHUcM?=
 =?us-ascii?Q?AMHvbZlQgTIpRnH0HpS8RiYJPxNrSOeKVtghUPa36VNK1K2E9SwyPxD5P8/m?=
 =?us-ascii?Q?xb7mLO36MR3ET1cGIxsF239PpaDi8XEzc7v/Qac0o2lzySrhZ3Ff+CH8WInw?=
 =?us-ascii?Q?RPpSyqMcN7Qg8kvh0JTKnB7QZ8n9KG18ez1HdtYmZaIu0smFABlA0bU5g+oI?=
 =?us-ascii?Q?8HNEqSWxQ6DKdo2RKfsS8MF9dzQkEL6LQbtGAQoHluZDhnpM+5dCNYbNfqGu?=
 =?us-ascii?Q?CDevrajpRRu3f7vY7rq0gnZPhRWWS/Y7XYF63/X2daUGb9KDJHlZ5h47A1FY?=
 =?us-ascii?Q?6ixJcAcZ/OoA7CpHlJVrdbQGHf03NTWx3zwbjUfmaea0Q2C2tb7pkguGtofU?=
 =?us-ascii?Q?QNiiSa+ZHMpoqRwiUs2c4G4HvyHZ9uAgXJYsz4y8lI11/FHEhjJ/m0Ovd0E5?=
 =?us-ascii?Q?a2JgA0RZlxPARud3AcPiRBb06t8FPswRQGl8WAAbbU990uGA6kYxKeKF4jUV?=
 =?us-ascii?Q?krmSq+/vm1wvtgQ961hJrZ3j0q/fv8IIVVUVtQD1dLJMP2oR/7fHHjwahLgq?=
 =?us-ascii?Q?KhFWbjIWhBwbySiVF7fMXdcktMAvapTLwahWy6N+dNFTQPTP5+FgZgJmbEmz?=
 =?us-ascii?Q?3vmynzALpwY1ubkIxiW7uXQ6dUt6vu+SHdRWBaZ2D8UcrFpRBiREn2wx0KJL?=
 =?us-ascii?Q?BR53hGSnTmPXQxJcllllzGntYRYV/fJHxzkQlcCXy48M5KjVAoelVx3LsPEA?=
 =?us-ascii?Q?soUDWrumwzBcjl9RLQ4FvrIwAE0EocePGVBOVAmnuKGTynK5OocoDpBh5Uvg?=
 =?us-ascii?Q?Yc3USQzkl4+0aK7M7qYVaWh66BDARdWQQupQ1BYEBkMZ05/yIKp1keXZUko7?=
 =?us-ascii?Q?IvLbgYf7idUpY6TA++GZ25ohaL4Uc/imtHpNcckqDv3y+i1BV5HIIj/O02CM?=
 =?us-ascii?Q?qMh0bn59Rm6p5/TGW3T9K8zckEVUk0c+bqnJMliceUaean+DSC8ryYv874N9?=
 =?us-ascii?Q?sC8MIl5Rp58A1rDc73ISMnETZgGmFrq4LkbxCp4fkfT+C5NBpM4uAadWpexy?=
 =?us-ascii?Q?Lc2ezJlDrIT3KxnMuEOif7MBfesB5zWwNdGLq5CPVZEcQxya3Aol4nf8AN5X?=
 =?us-ascii?Q?i36kLbhdLgkphFp1292wGkWU/8PO52LmHDMI3B+oMm8sbZTL+M5oVBjRRu26?=
 =?us-ascii?Q?JgVPW6DgkQtijb2Dgb5Rp0bZxixSRhshjd1Tlvei9n5di7h7we0yoM72g/Su?=
 =?us-ascii?Q?d13ANSFScmxMrDkOQ6fe1g4/RbkRpjlxaJtNasY4A+lurM01qiYN9VcE2bln?=
 =?us-ascii?Q?2mdFZb79d88S/bFBJoqLchvwkIBaAJkh1C5Iq5oCSVmSusSKNGh2q3HfFt/R?=
 =?us-ascii?Q?OXV72qQv3bEXvzOrxUAKA99Tal3WuvFGYWDf0j26FJWYaz6J2sGr33+TvfQO?=
 =?us-ascii?Q?pZqXLpl9Zt09BYGmVbpaApOKAF/Z0Pyy36bjcAk6qw1Fkcwsy/bhDAjpYLkd?=
 =?us-ascii?Q?IQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7ecfaea-ec07-4d3a-b650-08dc99caabf1
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2024 12:38:12.8984
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gJKcAmmRSgatIIQgv2RHAzfXfc9QZjTw7ZvvlqDEtvq+XX4P+f88PjYpoXYfrTGIvabiTLNIu/rTRq3tHXTLevtWuUXT19h/inZLvY5tt0s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8726
X-Proofpoint-GUID: o8AqJuszp7bbO6GIJWhj8bfrYulqivYQ
X-Proofpoint-ORIG-GUID: o8AqJuszp7bbO6GIJWhj8bfrYulqivYQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-01_10,2024-06-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 mlxlogscore=999 lowpriorityscore=0 spamscore=0
 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0 suspectscore=0
 malwarescore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2406140001 definitions=main-2407010097
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jul 2024 12:38:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201303

From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>

Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
---
 .../llvm/0002-llvm-Fix-CVE-2024-0151.patch    | 1086 +++++++++++++++++
 meta/recipes-devtools/llvm/llvm_18.1.5.bb     |    1 +
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
diff --git a/meta/recipes-devtools/llvm/llvm_18.1.5.bb b/meta/recipes-devtools/llvm/llvm_18.1.5.bb
index 4b6763e580..b03cf1465e 100644
--- a/meta/recipes-devtools/llvm/llvm_18.1.5.bb
+++ b/meta/recipes-devtools/llvm/llvm_18.1.5.bb
@@ -25,6 +25,7 @@ LLVM_RELEASE = "${PV}"
 SRC_URI = "https://github.com/llvm/llvm-project/releases/download/llvmorg-${PV}/llvm-project-${PV}.src.tar.xz \
            file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2 \
            file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 \
+           file://0002-llvm-Fix-CVE-2024-0151.patch;striplevel=2 \
            file://llvm-config \
            "
 SRC_URI[sha256sum] = "3591a52761a7d390ede51af01ea73abfecc4b1d16445f9d019b67a57edd7de56"
-- 
2.43.0


