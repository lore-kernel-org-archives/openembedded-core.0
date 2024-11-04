Return-Path: <Deepthi.Hemraj@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD817D111AC
	for <webhook@archiver.kernel.org>; Mon,  4 Nov 2024 05:48:00 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.51324.1730699277087083766
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Nov 2024 21:47:57 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1038b71f78=deepthi.hemraj@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A45SvOQ026224
	for <openembedded-core@lists.openembedded.org>; Mon, 4 Nov 2024 05:47:56 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2041.outbound.protection.outlook.com [104.47.58.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42nb289e8n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 04 Nov 2024 05:47:55 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=InMtYmivloJoRsAgcMTPkG0CyPX9X6HhIuGSDBmVg4eR77iBHLMpCdjN6chHp56TpaM1VKTpZmtiz0cTImLozBOsiZEFIDJSYb3RQ1C2XJ51tvsTJ9/XXzwtGE83mNgQCtLm1Bi29eqOWSwuoz8UVrE1jTOEBLgNFF02zA3J55/re+Y0oyUoS43H2H/9NVybLXUI2WSlX43BtcJZfYW0R/5xyA2EldPv11e9iYnVSgrFeVASfWShnZUAVrQ/lM6+kPugEYU5gj7IkboSuWrOLNFL/ByL62fz8W+NkT8f11tFm70Ut8vOiehc25OWuflTuX0Xk3QYtG79OWNiIxGEdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wyd81U5ye9+AnsSjPay5FtmbMnYHzjRjUHmnWG4Tt2k=;
 b=J0Qmls/8OvzGZ5dpmPFiXroCWIno3m55zbfdUOhMLkyyFRnl25TdNIPrPrxQNKoCfn9G1PY0l18g2jFbLldc9nThW/4EabxBpZGO/WNQL+GvCDWA2peKf/YT23iqZd9gJQKELKhL7gvs/Yq0JbXHIqssCmKEPbWnMEim1FclocorA3gRuC9R9bjiwVJSG2WsnbUkBmwP1wVINIzm9a7De6dQgLvGKRY6WUf218HTgN5vCLh+ytAgjFdi1LEOlIQrczbEbl09w4ZTvR4ib3ot6RyrRvFtxaUKORWOA7TD1JtAW5vWcZPSx66cjYhEdqKvD6e85fkfoFdyd1c5zdcFWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8602.namprd11.prod.outlook.com (2603:10b6:408:1b3::11)
 by BL1PR11MB5285.namprd11.prod.outlook.com (2603:10b6:208:309::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 05:47:51 +0000
Received: from LV3PR11MB8602.namprd11.prod.outlook.com
 ([fe80::5e20:4508:a523:df39]) by LV3PR11MB8602.namprd11.prod.outlook.com
 ([fe80::5e20:4508:a523:df39%3]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 05:47:50 +0000
From: Deepthi.Hemraj@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com
Subject: [scarthgap][PATCH] rust-llvm: Fix CVE-2024-0151
Date: Sun,  3 Nov 2024 21:47:13 -0800
Message-ID: <20241104054713.3383032-1-Deepthi.Hemraj@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0232.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::27) To LV3PR11MB8602.namprd11.prod.outlook.com
 (2603:10b6:408:1b3::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8602:EE_|BL1PR11MB5285:EE_
X-MS-Office365-Filtering-Correlation-Id: 38894746-24cd-4850-852c-08dcfc9437ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?pSae2FkGucR8JVkj33KfkLeqIinyM1D2LKm3yAmCoh/11rPrDg7RUJrdkPTZ?=
 =?us-ascii?Q?ZwRQqYL0EkHwf7pg9SpHCjTVFfll2S1p6tcY6PVuL+YQz/EXpv+MONMDcJRX?=
 =?us-ascii?Q?ZEhWpGGiPP2RbVjMMJGjbhV6F3WqEiBSUVbuznyw+NmRDoYqNeleoogrx+Wx?=
 =?us-ascii?Q?Xl4ixHqSC7za6Hs8j0tep/jVp7t3pHazIact2e5FglrIwOHQ6qb7MOvOJgbV?=
 =?us-ascii?Q?W4koE6/twjR2TPFUTtflTUN26p8E6F+pUf4bLNA6RB2waBC8oj2dmdb7/xwm?=
 =?us-ascii?Q?/RnhTYVRNqW+6MrX0odnf7AFimReI43T1knxtsDEP2SapvgkxHAksuH0M42s?=
 =?us-ascii?Q?A+6E4kmYXaQwSjYEP22cboqWZBbHwPAe5xUGKISisIUDBmvbFrTLQmN26Rb0?=
 =?us-ascii?Q?jFKn5pc8j3uXvJe58nZbGjwIeANEV6rPNLjeM73yv3ROgTZyvUHClCVCmw6I?=
 =?us-ascii?Q?JYPAq/Na3iYRavwJHiMjJTP+fBlRta/93Uu0ERgfFVFYZ9M/rP2pptVShNo3?=
 =?us-ascii?Q?VEI/53WhGswnhEo0bzYU0oq3hvj0PBC1QJKbYY9zMDCE80f9edGMzavj9f79?=
 =?us-ascii?Q?ONatrAIfR6KuQYNgWQY/QuIylgJaQaJMeFX0/DM1d1i5SPvF2VvDSkclwD5p?=
 =?us-ascii?Q?icRZ9OvoD3zYYpyBF7opUq8rcNzXlQbJbIBbIgjdFWffBFly2CKIF34ENpDU?=
 =?us-ascii?Q?S6Zf6alQFgIlGuLgMk2GZZBPuusnKQR32h4dQe80ywxXm0ABYi64ouGW9BKH?=
 =?us-ascii?Q?+bB+0HbfG42xClOE1SmdsD2rZTCmPBeLZkluZ3DtgCOBFwJXc7YmeWmSClIC?=
 =?us-ascii?Q?2ssOBwqkKT11mF0ReBN+q295zS3yH8m6OF0l48ihgQO7aC6kYkq8wF494qY3?=
 =?us-ascii?Q?M8Z4801U8X7FvjHkycjYwB7D4ogEN6VRd0lfL6TLQoAN7huF9ciwTE2Rcleg?=
 =?us-ascii?Q?2qJhbxpL6UoLaOw5n+i2DD3FTbCF63GyngG3EGkP8TsOWr6a/WwIIhX6P7O1?=
 =?us-ascii?Q?Cvx54tMqCDBySg9qCIWzNx4G9kMZscofXiTFuTNRDkJ5AwbGnSb2CnIuYJnr?=
 =?us-ascii?Q?BUvi4uta5hQFd/uZK9w+CdllAJHcf+9KTOiGEPRXx0QKBZaFyoeSJzlvNuom?=
 =?us-ascii?Q?2Z+/PI5ZmA/KFBvF7LwLr/dZ2Z2Ge8J/rPQoQghslC/6V5z06gQiei51dace?=
 =?us-ascii?Q?XK/NZrwjN3KB5Z0/LJX+oVHzSB6RI8QUYqmgJuk5d9j2JPGeOLb0XC8UD8vs?=
 =?us-ascii?Q?wB/tS1mPnvStOSuMwtqK+2GG2nApwX/wrRmI5OsXJC4aHx7yIHy4XCccPK5R?=
 =?us-ascii?Q?T1MYoGf6RvprbT0CKsc0LWzN?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?fGcODmoRNikKuq3AwCltw3IUAnlytvjJnamW8dVXzrHAJBE4olTxQ+A9K7bk?=
 =?us-ascii?Q?u7nopU9xCvWjkVlsU3qkDCDgGb34UWKcUfyh3oWISG+4lMDhuKbZ5l/0UiKV?=
 =?us-ascii?Q?CPXV5RvYLty6r3ouSsQ/d3A1FFFjoyidMIPN0DJBOXTl09g1VAdiCpfd66hl?=
 =?us-ascii?Q?WrDVtop15S3v4S8JZ6UXViKmu5sow47+i9Tp9ckZIgdXLxqlViQ9HktrxA04?=
 =?us-ascii?Q?9BNsz+75A1m6BUjkiA44ViTu1Eg4oR+eZ7qMzZ35h+0IHS8tFIZ2UXmRUn9i?=
 =?us-ascii?Q?JyHIQ+Y7RB99JCMyO9nYxrItytDJgEylKdjsYbCb4zjkn+Whj58BPnxsHve1?=
 =?us-ascii?Q?F518OuOOvQr4byxyicAo75OTQzbmZFPhoMpvHbVCmvZB6se20mB9lmOXijSi?=
 =?us-ascii?Q?WkuwNMdzPNImNmGEGcqU5ErdYb5NY2EArtGha3WAwAVUn8Nyg3psCL+wMxty?=
 =?us-ascii?Q?bOG5GZk6L+li7zndby/9I0lsXIBY2SvaSeW+xidGmU6uHoJKA8bMqNQlp+zG?=
 =?us-ascii?Q?L/utn/npqgolETuiIPgqvwyKNLqlDafYosmYkwzosmTmcnamuw0PlHDFlKYd?=
 =?us-ascii?Q?MNaoViSU9a2dka5/pETcg5U6QhwX6Gq/wryi+BdntbbLrmi3jyTCGKk+k24D?=
 =?us-ascii?Q?qQ+9J82f1mKyzOb4coOsHy+clB8ioEjxiRTmKj9wdL4e4fV7jvkDTW4xNwKG?=
 =?us-ascii?Q?xzf58eHq6AA54lBu4vdUvxUYb5WIg7oyGV+98yhzGzN7/OeXoRd0ZAXuPX9S?=
 =?us-ascii?Q?GF8IpyN7V4FOOzixvvxg/kt5drlVgu+1Pmbk3pxs9HXiv3Cs2rmjRVOBWtOU?=
 =?us-ascii?Q?UNZMcl3L4/ORR0j9PNvk+F8g+23NwbP+vt13NisPyyqReqOWMKDg3XbbQQCK?=
 =?us-ascii?Q?NKasiAfhaYsMXuhy0cXtFPYmAOgazoW0m5kN7YTu31rM+Y4bPD0emQeXGRSP?=
 =?us-ascii?Q?8daiIQPx8ZDxaB6uAyOoJSFa3dkvBg+YZ7lymwyG+hfQ0GUqUbnq7pnvfNuC?=
 =?us-ascii?Q?R4PJBEgBj2K155yxs8u1CaGy9OP5HPC8ZIESSr1HUkRvBEOkM4TlyJLoeo0V?=
 =?us-ascii?Q?CV4v+J8Sg7Lpy/OouJbkS7bWNz9L5DGwHZZ5CdiGuimMgiZveinnuD1/MtPY?=
 =?us-ascii?Q?XHInLVEjUapXEXnbjwN/+9SnWszlkj342hQZ0MIVWiMI7UawpsRJTOD0Zv7l?=
 =?us-ascii?Q?4z8h3JDMI1KmagQov9U98hKhA2W+sUzbeYwBWPaJ3aSLC5QGLesEqGivvB+h?=
 =?us-ascii?Q?KzTd7jCs74GThBm1yfcUh471fE7IBNw8ygtrCh6jRW7COkuJtr2JztWDpPfZ?=
 =?us-ascii?Q?HwBokcS3gG4dG266kM2MkDZiAetfOmiqvjbXKZaQ0obgvJ/5MY90R3A9jbQI?=
 =?us-ascii?Q?I/PjfeLa/wugON0LwENTu+5GyZkHGts7z59JmEtUoEJvilXkXYHlkbHPMflK?=
 =?us-ascii?Q?Vx9MpiBTyGnorTsFkGEqZ+wNZiiWtzrsEsi7yZ3vPwhzanFPF7FlwiuLs1qi?=
 =?us-ascii?Q?4A6EvWhYGFijlmKV0aplcnE8PKzzMlFmsuPLUPO3QzX1HoZ++c6wQTQOxelN?=
 =?us-ascii?Q?BdBkAioVAOV0WXyXZLCujErooLCRdIw03Cb0xS9o2fbB9bCA9rJNq2g0HNYC?=
 =?us-ascii?Q?cA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38894746-24cd-4850-852c-08dcfc9437ee
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 05:47:50.5607
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BRmUk4ND5MumpMouO5wT/PdhLjC9IAhdNdJ7okBd7smDUAC8qK7bB9mMBSFJzxEoW+ZZFPqdcHV8ezhAyDtPq9DQYzRPdmwiYHqo/1isMeI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5285
X-Authority-Analysis: v=2.4 cv=CfNa56rl c=1 sm=1 tr=0 ts=6728600c cx=c_pps a=OnljjeCONrlUuPUItWmgXA==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=7CQSdrXTAAAA:8 a=NEAV23lmAAAA:8
 a=wQfKxpVCxC01tQNuVb0A:9 a=BqPj7hXHN4eIruYc:21 a=FdTzh2GWekK77mhwV6Dw:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: fVJ4Sy5lDUZEVk142UtOwQRiCmmkHkk0
X-Proofpoint-GUID: fVJ4Sy5lDUZEVk142UtOwQRiCmmkHkk0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-04_03,2024-11-01_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=999
 spamscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1011 impostorscore=0
 phishscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411040050
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Nov 2024 05:48:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206671

From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>

Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
---
 .../0004-llvm-Fix-CVE-2024-0151.patch         | 1086 +++++++++++++++++
 .../recipes-devtools/rust/rust-llvm_1.75.0.bb |    3 +-
 2 files changed, 1088 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/rust/rust-llvm/0004-llvm-Fix-CVE-2024-0151.patch

diff --git a/meta/recipes-devtools/rust/rust-llvm/0004-llvm-Fix-CVE-2024-0151.patch b/meta/recipes-devtools/rust/rust-llvm/0004-llvm-Fix-CVE-2024-0151.patch
new file mode 100644
index 0000000000..c05685e64d
--- /dev/null
+++ b/meta/recipes-devtools/rust/rust-llvm/0004-llvm-Fix-CVE-2024-0151.patch
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
+Upstream-Status: Backport [https://github.com/llvm/llvm-project/commit/78ff617d3f573fb3a9b2fef180fa0fd43d5584ea]
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
diff --git a/meta/recipes-devtools/rust/rust-llvm_1.75.0.bb b/meta/recipes-devtools/rust/rust-llvm_1.75.0.bb
index 13bdadb5e7..292fc15c55 100644
--- a/meta/recipes-devtools/rust/rust-llvm_1.75.0.bb
+++ b/meta/recipes-devtools/rust/rust-llvm_1.75.0.bb
@@ -10,7 +10,8 @@ require rust-source.inc
 
 SRC_URI += "file://0002-llvm-allow-env-override-of-exe-path.patch;striplevel=2 \
             file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 \
-	    file://0003-llvm-fix-include-benchmarks.patch;striplevel=2"
+	    file://0003-llvm-fix-include-benchmarks.patch;striplevel=2 \
+            file://0004-llvm-Fix-CVE-2024-0151.patch;striplevel=2"
 
 S = "${RUSTSRC}/src/llvm-project/llvm"
 
-- 
2.43.0


