Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A88DC433FE
	for <webhook@archiver.kernel.org>; Mon, 14 Nov 2022 01:53:56 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.1130.1668390829817534392
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Nov 2022 17:53:50 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8317b30afd=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AE1kjCp018057
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Nov 2022 01:53:49 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2048.outbound.protection.outlook.com [104.47.74.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kt0q2s4dp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Nov 2022 01:53:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j7huFOVHEsbNyTixKDCuMnoITacAT5/a8l/hkApDNgmh+Idw3tnzPdBeNUwPI6o6bZnF7eEl2LXx5bQjzWddA3z6HUOJUiIyg4KrgwsyWGl0dsjYX/4cbyls0tVmFtPnRUCtYZGryY6ekLLH4IQxK1z3h9x451ME7+Nu/alQYhN2qDPhkG+Wu/yeudi4InJdTZAhEA57U4ojRKfhtPfeH82U5EupazCKsr8fbVHuulgHyaWp1n1bCJ+7c9fbRQvdCoXNTSuUj4XZA6J04Ev2VB26SUk9MTOfo+liH2KE/hrXSLxcT0jNjKEcBxXvKjRLnA65rf0+kK1okTdhLbF0Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b6tS6XdEAM0hB8O+Iik1tLad+Lmhj289bTJjyweZPIQ=;
 b=UbXcYGZgwk/CajGx3mW+Rih7Xuh3d/UYx/vJqog5N+G6Nttsxw1/Iq5MgU8dgzVVcxrwnL5qrbR0/qbL/rFpKkfBCqh98DgrqDJhKFbDEAKNq9HtNNNbPjOCL3+lzgZDzVs7thB7MKzrWbe5oWKsw18FU2uxpZ0OTUB+M0b2LEjKijs3d2xPOPUSk/4NcfUMru7AsGwjFEgK6h/Ln45hDZGD97FYSXk/QBxAkE/tDiAwwrsCey0xU0mNMsNNHXSoT/Cimn8olMPL/oyjXdZ2A+bAYuEVc1oQsSwCKB/GYDUW/er5k72nh3WsVHSC4jmPlm9uQNVD7rmbvs8bo1Z5vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by DS0PR11MB7334.namprd11.prod.outlook.com (2603:10b6:8:11d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Mon, 14 Nov
 2022 01:53:45 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::d252:a0d:467e:ad16]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::d252:a0d:467e:ad16%3]) with mapi id 15.20.5813.017; Mon, 14 Nov 2022
 01:53:45 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-Core][kirkstone][PATCH] dbus: fix CVE-2022-42010 Check brackets in signature nest correctly
Date: Mon, 14 Nov 2022 09:53:20 +0800
Message-Id: <20221114015320.45881-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2PR04CA0009.apcprd04.prod.outlook.com
 (2603:1096:100:2d::21) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|DS0PR11MB7334:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f6d7e1e-4451-44e0-2896-08dac5e30fdc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4VGnLs8hGf0NCfaeSg68egS2ra3KPg5Ba9aAtNmOo79qcUgfEfOm+OWDsVatl3O07Shoj1B6xN8ZChPLfGLCGK+f1zrbycUb+04PdpfP6XGkPoQm8WjkG0c072on7DVTod/3GZJ99/JBB6ycYUuO8KoLCx4wuICBKZpUTPZUd7n63z9RKYzLbY0JyQjqyeuEgPUv9LxpvWzpPqcIZ8MkZ2+3pTHiTi8GAIOwZtrA/vkUBIC7GGINv/eUd/rHIlcXPNlQBBq9QUuDckPDz2Sg/zrMFvpkZCESXu0L2OWHIPT/c56AOCKDKPQFZ1wJXXd9qFatPkdHiAm/ReeqCcyK51x0txurhq7Ko6F21uYoXit+0fVknOTPyfuL/XXK/vKfZDqcIOLxjeyYRStipYqGDUSDl3wsZd/M7+p8kz7kzI0pY7qblwdIpbvDhtLRu7VADtIzVGfJ6jMet+FDSo9nFzbbwblqyRnEumA6BqfehZujST+L3DgkBbTwVOcvdLSYtQqpwL1ba6jnarn1Gku4ficjCQhCO6RvTh2miSeS1fXSAM07jmgtk5aNYLp/qd2BVONWOeeI5T8i64eQDsGK935rjV1Lrtpf1WAsnTvIeoxUjYir1E5qDL2iqOtSUtJzMbzoHFJcbK1n/C9ZIZrEP4pHWn2S0I1Im8YRTVqUV30mTaZH4uEkxo9bUNx5y6FpkXsJhxNal1zfVucL0VLxTw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(366004)(396003)(39840400004)(346002)(451199015)(6486002)(966005)(6666004)(478600001)(83170400001)(38350700002)(38100700002)(52116002)(316002)(2906002)(83380400001)(41300700001)(6916009)(6506007)(5660300002)(26005)(66556008)(66476007)(6512007)(8676002)(66946007)(44832011)(8936002)(1076003)(186003)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VZ4JBZylxPc6SsBccQLRR7Xdg7M2CTWLcmgF3vs/V8eA4cqb3neKKB81Qaxw?=
 =?us-ascii?Q?suFNDWeF6eVgU1PYlHZ7ZKJQanhYKzexS/WCOBbEALQSYrc45EismMOoXeO3?=
 =?us-ascii?Q?ulrZojPB6CUzLoGKVXCstkTlsGo8K+Lj2Z1EB9Udjo2D9nVAIu+7iB6+HNGW?=
 =?us-ascii?Q?7oT1vsc5CRUKMwx9IbrSRzVL9Y8fDapPTtOGEpRCog5AxnJKE2yy5eGq+cc4?=
 =?us-ascii?Q?/GB1ra+panKrcpErYB2CqtsE5s1j/GsZUvk5WiRmU4m9bcTz5QsDJlBLz+xB?=
 =?us-ascii?Q?bqgeaCoyWTtXJsYuK3c3ydQsHo3G1iAxN3FMWkb8oHHhSyECmOycyKLmX9kv?=
 =?us-ascii?Q?SLjnPZMH/Wl6ba8vXLs1xyzGzVuVOvUw7ZPIt+cqQLshLejP7PbPQeq5yJyj?=
 =?us-ascii?Q?/56DwEVIeQlZWJ5IOs+xRM5xQbGv7LTj3UGF5hgD94gSUPZOQtdOTYzd56lx?=
 =?us-ascii?Q?f6HWfJNdKcX85AeXfiPdtvrJzTYHaSjB8R3t7ifKn2lzhGeLPFJbudnvGXF1?=
 =?us-ascii?Q?P3Nq+Zg10yCZ9C9/fKQ4BCj+xz0OMqmZKtb90JUbjQ+i6+HyTn6D0ys+Ks1B?=
 =?us-ascii?Q?rlhPLdWmLxEvmb6uW9V77HnuP5j8j097HMzgqeIW94iLIGKh18kLR5B38eNh?=
 =?us-ascii?Q?RmNPPGgEvO670X6r8lhPqcw+WHkENFh8h9OEf/OvsrN8qiT3A0gDsY7Ecwz+?=
 =?us-ascii?Q?AjYv/V8JsupoXWVcJl4V/ZZBCiVYup/iLf0YX0u/IBuSa2Ho9npGHUS32RZj?=
 =?us-ascii?Q?jALh7lnQ8kjyDI9mexbfxe55v/enGS/RWBj6PjgM5tQIfVrrwuXokEyeslXj?=
 =?us-ascii?Q?OsmI0Rv8uEiG075uGt75FKDZi3d17ZNDjCji6YO4Q/CMec/TGTbDUoQCNLjm?=
 =?us-ascii?Q?L1g7PKf9pAYNB7bZ62htb3bBAzXA3gGMXtOUOjNlIQRhbMvnNQUzRsKTpqhG?=
 =?us-ascii?Q?3drkPJ4xquwmXQ9kHOyp8lHNEsK8Srx0k/DMWbtLIgJhro7l5T3URzc4ZGmY?=
 =?us-ascii?Q?CEL07OYGDxsyDy7qaLirICrKJ8eD9EdhnlXiFhx/kE9SE04SG/DavWrAvcAU?=
 =?us-ascii?Q?K1DjbMmS12pTrfIvEHexOayIeW8qlWL0fJv9tU9wV1gDR3DZgH1mRs8P7oaM?=
 =?us-ascii?Q?a40zk7CG/TaE0guKH4sE/OGFA4N51/zlqiv8b9Bb9Efx8TjL8ccUmGpPqEnS?=
 =?us-ascii?Q?16angQbIcfY0EqwE//kgVrjanyRcVmAJmeWHWlsfph5FNL2MdnOTW9xs1l6j?=
 =?us-ascii?Q?VJMAsaEWSFpAp2VzefLM1ac0JNuEhJ6Sqkup8nD1xE04llupXgVG2U5JKJ3k?=
 =?us-ascii?Q?gDTDdIOUHnsw2PMaj+Vtzx+UAqVWOF3rDUYiLvJ/7gz2aBCze4daChA0LkFg?=
 =?us-ascii?Q?PafaMZIv+gh6VGqfu2Od7IDJasfbVxAf3G2K1CxGc5LARKvj49q95+ssUqQv?=
 =?us-ascii?Q?Z9+ZKwsPNQAmVqHzNxXrcG/GFoPmzO43LNGj2dcaJxy43xFP0sWVFl67vVIa?=
 =?us-ascii?Q?I92u/2bpsB58ngSEqM7SDlvtXeN9HHxIPXty1zXpvT6kDiHnDPeIHdiinQdy?=
 =?us-ascii?Q?M6517Urek7j3tgHMq+f+VJ0XIhxg4LzDDsY564tGXDwDm9ebAZQHVRQmdbIy?=
 =?us-ascii?Q?6w=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f6d7e1e-4451-44e0-2896-08dac5e30fdc
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2022 01:53:45.6146
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b+G5Zoc7e6QkrIAcRhtiNSU7uVeBqL593+KDdynryUgnVSAP03tOBAe3lhHAwNUVo6GH+SzKibk6FQfeQ2CxVJPVCjc6ehe/ekbGRAxRRwQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7334
X-Proofpoint-GUID: QnW6r-Jo2KnPcSz84wkru6dVlsRwIoaE
X-Proofpoint-ORIG-GUID: QnW6r-Jo2KnPcSz84wkru6dVlsRwIoaE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-14_01,2022-11-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 adultscore=0 mlxlogscore=999 priorityscore=1501
 clxscore=1015 spamscore=0 mlxscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2211140010
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Nov 2022 01:53:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173216

Signed-off-by: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
---
 ...idate-Check-brackets-in-signature-ne.patch | 119 ++++++++++++++++++
 meta/recipes-core/dbus/dbus_1.14.0.bb         |   1 +
 2 files changed, 120 insertions(+)
 create mode 100644 meta/recipes-core/dbus/dbus/0001-dbus-marshal-validate-Check-brackets-in-signature-ne.patch

diff --git a/meta/recipes-core/dbus/dbus/0001-dbus-marshal-validate-Check-brackets-in-signature-ne.patch b/meta/recipes-core/dbus/dbus/0001-dbus-marshal-validate-Check-brackets-in-signature-ne.patch
new file mode 100644
index 0000000000..f2e14fb8d5
--- /dev/null
+++ b/meta/recipes-core/dbus/dbus/0001-dbus-marshal-validate-Check-brackets-in-signature-ne.patch
@@ -0,0 +1,119 @@
+From 3e53a785dee8d1432156188a2c4260e4cbc78c4d Mon Sep 17 00:00:00 2001
+From: Simon McVittie <smcv@collabora.com>
+Date: Tue, 13 Sep 2022 15:10:22 +0100
+Subject: [PATCH] dbus-marshal-validate: Check brackets in signature nest
+ correctly
+
+In debug builds with assertions enabled, a signature with incorrectly
+nested `()` and `{}`, for example `a{i(u}` or `(a{ii)}`, could result
+in an assertion failure.
+
+In production builds without assertions enabled, a signature with
+incorrectly nested `()` and `{}` could potentially result in a crash
+or incorrect message parsing, although we do not have a concrete example
+of either of these failure modes.
+
+Thanks: Evgeny Vereshchagin
+Resolves: https://gitlab.freedesktop.org/dbus/dbus/-/issues/418
+Resolves: CVE-2022-42010
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/dbus/dbus/-/commit/3e53a785dee8d1432156188a2c4260e4cbc78c4d]
+
+Signed-off-by: Simon McVittie <smcv@collabora.com>
+(cherry picked from commit 9d07424e9011e3bbe535e83043d335f3093d2916)
+Signed-off-by: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
+---
+ dbus/dbus-marshal-validate.c | 38 +++++++++++++++++++++++++++++++++++-
+ 1 file changed, 37 insertions(+), 1 deletion(-)
+
+diff --git a/dbus/dbus-marshal-validate.c b/dbus/dbus-marshal-validate.c
+index 4d492f3f..ae68414d 100644
+--- a/dbus/dbus-marshal-validate.c
++++ b/dbus/dbus-marshal-validate.c
+@@ -62,6 +62,8 @@ _dbus_validate_signature_with_reason (const DBusString *type_str,
+ 
+   int element_count;
+   DBusList *element_count_stack;
++  char opened_brackets[DBUS_MAXIMUM_TYPE_RECURSION_DEPTH * 2 + 1] = { '\0' };
++  char last_bracket;
+ 
+   result = DBUS_VALID;
+   element_count_stack = NULL;
+@@ -93,6 +95,10 @@ _dbus_validate_signature_with_reason (const DBusString *type_str,
+ 
+   while (p != end)
+     {
++      _dbus_assert (struct_depth + dict_entry_depth >= 0);
++      _dbus_assert (struct_depth + dict_entry_depth < _DBUS_N_ELEMENTS (opened_brackets));
++      _dbus_assert (opened_brackets[struct_depth + dict_entry_depth] == '\0');
++
+       switch (*p)
+         {
+         case DBUS_TYPE_BYTE:
+@@ -136,6 +142,10 @@ _dbus_validate_signature_with_reason (const DBusString *type_str,
+               goto out;
+             }
+ 
++          _dbus_assert (struct_depth + dict_entry_depth >= 1);
++          _dbus_assert (struct_depth + dict_entry_depth < _DBUS_N_ELEMENTS (opened_brackets));
++          _dbus_assert (opened_brackets[struct_depth + dict_entry_depth - 1] == '\0');
++          opened_brackets[struct_depth + dict_entry_depth - 1] = DBUS_STRUCT_BEGIN_CHAR;
+           break;
+ 
+         case DBUS_STRUCT_END_CHAR:
+@@ -151,9 +161,20 @@ _dbus_validate_signature_with_reason (const DBusString *type_str,
+               goto out;
+             }
+ 
++          _dbus_assert (struct_depth + dict_entry_depth >= 1);
++          _dbus_assert (struct_depth + dict_entry_depth < _DBUS_N_ELEMENTS (opened_brackets));
++          last_bracket = opened_brackets[struct_depth + dict_entry_depth - 1];
++
++          if (last_bracket != DBUS_STRUCT_BEGIN_CHAR)
++            {
++              result = DBUS_INVALID_STRUCT_ENDED_BUT_NOT_STARTED;
++              goto out;
++            }
++
+           _dbus_list_pop_last (&element_count_stack);
+ 
+           struct_depth -= 1;
++          opened_brackets[struct_depth + dict_entry_depth] = '\0';
+           break;
+ 
+         case DBUS_DICT_ENTRY_BEGIN_CHAR:
+@@ -178,6 +199,10 @@ _dbus_validate_signature_with_reason (const DBusString *type_str,
+               goto out;
+             }
+ 
++          _dbus_assert (struct_depth + dict_entry_depth >= 1);
++          _dbus_assert (struct_depth + dict_entry_depth < _DBUS_N_ELEMENTS (opened_brackets));
++          _dbus_assert (opened_brackets[struct_depth + dict_entry_depth - 1] == '\0');
++          opened_brackets[struct_depth + dict_entry_depth - 1] = DBUS_DICT_ENTRY_BEGIN_CHAR;
+           break;
+ 
+         case DBUS_DICT_ENTRY_END_CHAR:
+@@ -186,8 +211,19 @@ _dbus_validate_signature_with_reason (const DBusString *type_str,
+               result = DBUS_INVALID_DICT_ENTRY_ENDED_BUT_NOT_STARTED;
+               goto out;
+             }
+-            
++
++          _dbus_assert (struct_depth + dict_entry_depth >= 1);
++          _dbus_assert (struct_depth + dict_entry_depth < _DBUS_N_ELEMENTS (opened_brackets));
++          last_bracket = opened_brackets[struct_depth + dict_entry_depth - 1];
++
++          if (last_bracket != DBUS_DICT_ENTRY_BEGIN_CHAR)
++            {
++              result = DBUS_INVALID_DICT_ENTRY_ENDED_BUT_NOT_STARTED;
++              goto out;
++            }
++
+           dict_entry_depth -= 1;
++          opened_brackets[struct_depth + dict_entry_depth] = '\0';
+ 
+           element_count = 
+             _DBUS_POINTER_TO_INT (_dbus_list_pop_last (&element_count_stack));
+-- 
+2.34.1
+
diff --git a/meta/recipes-core/dbus/dbus_1.14.0.bb b/meta/recipes-core/dbus/dbus_1.14.0.bb
index 7598c45f8e..4577da782c 100644
--- a/meta/recipes-core/dbus/dbus_1.14.0.bb
+++ b/meta/recipes-core/dbus/dbus_1.14.0.bb
@@ -13,6 +13,7 @@ SRC_URI = "https://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.xz \
            file://run-ptest \
            file://tmpdir.patch \
            file://dbus-1.init \
+           file://0001-dbus-marshal-validate-Check-brackets-in-signature-ne.patch \
 "
 
 SRC_URI[sha256sum] = "ccd7cce37596e0a19558fd6648d1272ab43f011d80c8635aea8fd0bad58aebd4"
-- 
2.34.1


