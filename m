Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2DA1C55174
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 17:47:15 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1433.1785952017636306541
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2026 10:47:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=QOzfKtF6;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=267792312e=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675HRoSs2797023
	for <openembedded-core@lists.openembedded.org>; Wed, 5 Aug 2026 17:46:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=ZeXGGoQ7R
	toPg5v7ghDHxDGjT0f8F1wf/53YYgJxcc4=; b=QOzfKtF6OjwL1crVx8HR035zs
	bZLE8me3PihxbyGCgQWidMblWb97EUKQEoag4BE/2ihMkkwJIetlUHrynSPI9KZ+
	si3Xc4MaOigXKbq56TbuESZA8OupHKhJVFEdDrPw+zQTHCjAt5dJAOD+quBIZRk1
	4yTmeLD4VoROhsKOM9vwzhoAcHYJMPgHh0s17tzyJHkymbjGlzXtV6mKmeanK5Al
	P9BRaEU/FiqdD9tOD/xKi2QIIFjRBQ11HvRIwjBtmf4zvgVeVF2w7WmUNRqChCVH
	6clT5uvP5z5xCiz+atVXOethPiXC6lCG/CJFM5WoZW973+j1ycNq/xhyF1kMA==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012055.outbound.protection.outlook.com [52.101.48.55])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fs60x7b61-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2026 17:46:56 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IEb+k9QSuRpdC1xW46cN4rEKVmFK8wBrbdqNBP9FaRic3EM9seRt14VzeBGDZBEB1MfLo2KVUyZDRp2XcrbqgNRXrplneFa3tbsZXwAvzVSKO9WcZWrTUJ0cZoWH0qBEWrLWAhuRvbxzPhQ4iozs0S9FAv8FqvCjaEiIhP/9BSnkIL8uboPZj+G4c9MLGf4KvXxvqw7C/kPlB48vNAu0z5TYb3bgxjiUdn7F46uS/vN1jrv4ja47gSvEBc3efdVXNHiXCfUhWeRhqknw62TC83Xl+V//VTM2LQRM4HygpQrfOl77dXQpe2gjx0tbpq+AXjdv1dCkn/NVZIt/lXywkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZeXGGoQ7RtoPg5v7ghDHxDGjT0f8F1wf/53YYgJxcc4=;
 b=egSqWkNePOJ4Zwl2bAyTyR4U2Qs2WKXJh8/jd5XJZ8r7EaQFgFEqgv+rpBIQ7vzlu2ICpA6LVqsTFvyzehP1R7zLXJTk4k9QLnlHqoWPlsBmy+F8vafDWz1hKDykB+FOZXoaa1Q30vXBslwWHZG4V5tyyTfSLE6ePPbf5Qhz9ZLa2bBt6LlilXAfR0n1ppCfQmnMdBcwqwBIFgZ5B5NL0R8rFFFl/L/jTRYx4thGnHKDZt0QUGzJjmMfOmATE8XlAk/DB+zvf+7j3ABi8pVUhVn+y9Qx678Wf8odZWIMTeE9fw6VG5/lVo1OpaiHXbV85e2o63KIHmFwcpPbNwFiYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by SJ2PR11MB7598.namprd11.prod.outlook.com (2603:10b6:a03:4c6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Wed, 5 Aug
 2026 17:46:52 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%6]) with mapi id 15.21.0292.018; Wed, 5 Aug 2026
 17:46:52 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [PATCH] kernel-yocto-rust: Add clang toolchain check for riscv64
Date: Wed,  5 Aug 2026 10:46:39 -0700
Message-ID: <20260805174639.1193331-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR21CA0028.namprd21.prod.outlook.com
 (2603:10b6:a03:114::38) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|SJ2PR11MB7598:EE_
X-MS-Office365-Filtering-Correlation-Id: 1609c8f2-4069-4526-8cc1-08def3198843
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|23010399003|366016|1800799024|38350700014|13003099007|56012099006|10067099003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	K2XuuCDqrmu/MdE9MNQkx/8bH8sAmB8Uf9iTvYkGnSaMhdtFrwxkGkS+r98YcLwKKjhv/1c79HKqJsOYMY8OXnddnnscs7QoLlQpi75WsH0H9oSwNFcD5ldr5sWB4rSWbl8oNV13PfEbVpRYk1hWyhkanspynCLZUdBkmAahUcFrwcQ0dHATkQ72RjqJEgAB7oP4nHt5AOtA3ooO1nCEUB7EMC6yf1myw7KAtWp+1SBEUN6iQXr+sXd0dOJsT+LkE0JP9+veWdx58yFLmnXFCtAhfd6KBZRMT9ZBubGFKhKh9mNPnMd9Op86EzXBxIAE30MpkDKWWTyfZ+G/gHFdUS+mZaWkzNJMh8qKoYrARbm+Apgo65y92QkB/+fUFff4GIEvuqfeZ5UXA0Kj8F16xIyIDCOBmHWiFo8vfbuA88fx8Gv3z+g4dVMeMNDqTfvR7oNNM5u3/Z0KrnxKLzpy7Y6kzy0W81Nz3W4sYMV9mFfl3ddxtOZYhpcZHDd57KWsMUq8ruON10odMguwYGdZSz4n+444YfaeE7YJQ15NBCYoM9OoPzNiRaQx1nDUUfnxdQxeK1A6SQpfyjfsjLiFZvULWERHcN59/8wj3nijQFMQrjodsm0/+/lFujWfK5NnOhLr0/Fo9ttPBMIFkj2oWTPS7aOuyY2w/fFJbQSa8T+RtmaLOVjW+eWFSs4uCWSL2UfEBygg6h2cY5xoKBqgQjKy4w4JytxEtUGiGhkWI7o=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(23010399003)(366016)(1800799024)(38350700014)(13003099007)(56012099006)(10067099003)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Bts5qAV8ZlUX4juDFkCi8M3DANsmuAqzH4xEV7HnlHgUdvL/rEarQLti28sm?=
 =?us-ascii?Q?AtYSL69vzle9WxfyjR1QLb8OCk4VC5b9eY2o5zKaey2oj/FR4N2DQJrup2ps?=
 =?us-ascii?Q?BxMuh453EtaZ9rCJ6M3MnHqapTX/KWiULZ6L9Wb8CZo/PRhQ6kSVAKcHx5oW?=
 =?us-ascii?Q?UvWtGnCsY5b0qWnvT0DlYfDgt4L3yDwliem2xqPdE0Oo1zSS3Yvg6i6C/Vo2?=
 =?us-ascii?Q?eZ9/j0tqfV1MU8GzcdOh5wlesGddpofuqDtBxOtze6yaahj/+Zye4UYGKlq6?=
 =?us-ascii?Q?N5Twd1sUfJc21v+uiM3QqF87sWT1ftdPabJVhr4JbaUM/JdcFX8ur9hBms8w?=
 =?us-ascii?Q?BlL/0p96RQvP8WfQfchVRcHbC9DnMajSkj7u635Y/UJanIV76uRxTAYoKDq3?=
 =?us-ascii?Q?Rx9TlSWFz8+3p9rJ0VyYCvUDt0AhdPRB9vm07443FnWaox+EIUFlAqe/BdeD?=
 =?us-ascii?Q?utkyrAFL+7R/QNcmr/8Y96sX1nflwo3FoXABrGZWtjdoBlJm/Y1LAKQ9Fda2?=
 =?us-ascii?Q?uj34LkvqmXieVxFBpfNc5WAQpZVhY9zKS3mRZVUyvPrekVhn0kEGi8n6suGQ?=
 =?us-ascii?Q?PtlMKxJMQd0fop21wcutAbmm/9ihVcdL1PCFvdq2uYUFWePVLmW7pVqtbcZp?=
 =?us-ascii?Q?H9dxAxDGuOqKX21Z7I6TP6ILnzHLZu8cvV/+6aHoQTxtklrzMyFcd/1X0f8g?=
 =?us-ascii?Q?qyVKHfQZOuT2JqiqTxeP1xIZLuq5mAnyO72LLlTvFnEr+ajvqjdZQtzFDxVt?=
 =?us-ascii?Q?jNMbpaL0QwvaVl9t9roEWQwVMYrKhNDi3CPSIQsSsUnqLywwPuVW+gjDUISx?=
 =?us-ascii?Q?3GMQDPrx6r3U5CK+dnUNYXV90F6FjfU3k9YnGD3vZqhZQOyb6Dk/EIRwicFx?=
 =?us-ascii?Q?H//hG/9iT2BR+x08gs/Twoz3a+DmipCsFYydJFpUF3f/0Xo/XnkzNocOQf81?=
 =?us-ascii?Q?kb9gzZBBbcDgWxs9DjoeG6WbhfsWXB+zXIP/ypgnmfp1mnkfGj66nmpFpxKU?=
 =?us-ascii?Q?xdH738HgfChg0zo1ILbZqrGlV87uBq27nqbDthZ+eu1cmbRGZohcDGLwIA9Q?=
 =?us-ascii?Q?bYYDpYJuldPFsyRPOmFaXyakJNWOLRDS6drZJa6YCqz0j26s4ATCEHfRYeF1?=
 =?us-ascii?Q?Ziiy9p7Y5AGwWyJ3kMaY9nEVBtArm2cF9obgsSeudWco2u1TBnhKqpIRjNb/?=
 =?us-ascii?Q?bjc/EmCU8qSw73OwIyPRQXb7wIm2jf7/DB4cDluvSkyShUBkbxPRHYUZeT0J?=
 =?us-ascii?Q?nqqHX36FmcIB0nMkA8UGID65IA+6vIexN0UzDDUfgLxQYabzuiprVd5dHrSo?=
 =?us-ascii?Q?1VQ7M+90ulz+vnMzkt6tcxAQgbJM2kw59nt9pVoOqazmRo2e4wnmvnSJnys9?=
 =?us-ascii?Q?Yf44UdvDe2c6vMGO9Z/epLvk6UbL598xigS/kkSs8Q4g4xeFtGro+GqSmmyN?=
 =?us-ascii?Q?1fick+xSI76AXiDLpRsfrbwEsncRQIxZOBKkv+MrQD/CUm41IIUinEjk9mwT?=
 =?us-ascii?Q?oHbGMStZzlQn2vLSriTpJakVvp6BHl0tOwb6DTA2U9L56qF9r9ZSPG5cz1NB?=
 =?us-ascii?Q?QD8Sc2hbrpnr911dlyGels9SbBUKv9fQX7d6TaqyWb1NWKunp8baLwz5lth+?=
 =?us-ascii?Q?cI9pgFBOwb5r0rvHxiRQ3fhGCpAC7yETsqhuZt+X7aECYOcPJj9KY3kSPXRg?=
 =?us-ascii?Q?XqvpURFVm35NaL3prMkotkSCiQ9oyNn+QeFlZ42nJVCiQ5Hha4KLJq0vCVeE?=
 =?us-ascii?Q?XGUdV25T4Dbb5d6IDlVbrt9u98DlDHE=3D?=
X-Exchange-RoutingPolicyChecked: 
	K58WrKKzjo0XopxhH34awsKTPiyvaIV2BkhnNnzDCGURdkAxw5GiQq9tvYjIO5ln2QKrjvhj2302M20zBNl7GYVCSSNPdmkqhIlio85HRS4j/oTQZOMnWQ1vVUmZQgT1DUuRWgRk0QKK8jCgIqD6Ii3Y59yvVaWuHTt0oWT9MpMCxqnQCZMTu3Y24uOx2ajk3TctZcLn+55MHpVSg7cZGT26gPZI8OncR291uemg5AmpmDfRY3Q/suSk0qzuSyMhJoLfz3fiY0yNceSf/ZZf+3QHuwYBlrbFmGYeuiSdPgiKPDjfRLPz1BCUENBSydfg8oiJaknTrx87Rj8TCPyEgA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1609c8f2-4069-4526-8cc1-08def3198843
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 17:46:52.0114
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hJHg6lgKZpbODbvRiHYk41ObvO2FCTTLk/K28YgCJU1k72Kx3BnDbQZ8vuP7j5QI0l/uHG2rRoHOn93anX98Wudw0Aa8uf6vDylJ29Z8Lp4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7598
X-Proofpoint-ORIG-GUID: XMlAtMOdEMyKs7VRQhzaH1ZDz31xVO-9
X-Authority-Analysis: v=2.4 cv=eL8jSnp1 c=1 sm=1 tr=0 ts=6a737710 cx=c_pps
 a=FXm+OvNBiSWvAu5LmLLQ3Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=VwQbUJbxAAAA:8
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=XnjOQZLLih9-KuhPR2MA:9
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: XMlAtMOdEMyKs7VRQhzaH1ZDz31xVO-9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDE0NSBTYWx0ZWRfX5LSfkRAy7LS+
 91IrH/YIx8y4A3O6S3tmQ9/Dh14+VpLVlIjXSF5OZW8X9baZRgK8bDqJcdjXGmYcF0onN9hf8vV
 0gGDEhAAXTBdivVsAHql1Ik9HFnNF0nN4TfgaRxVzHqdMpa+//mN00IG6GQjvjoZ7oi9Uc1vjr1
 +f7Dx3jxOI9ZG2QFXq836wRUTOv09b9qWLKNWkEVbr3lsdKYrxVFZ0xn8Xl/3i/PC7dMA0s1IT7
 ejwHJOwXzKP7T2sPSg7yWCxu0c1/lh1ztEhIM4v1C22j+lNAnF6gISw3Bh7TJGnhbU+TJiWZ226
 vg1B96i9sF1nCfm4eg3immD17E5R1qCNofVvyGNTmtYFE92qn16jAFj2OWXkr6L6M5xR31nApbP
 d83vzeoLoTRsG6K9ZYJSwJ+wpTPtIdedRGDyNQKYX3dnd5HBk+Aqykd8uP6UYYy0L4zICxnL3r+
 fbC+JPHb1FpJvk2Uf7A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDE0NSBTYWx0ZWRfXwTKNTOenHuGS
 yzlYl1O7+p5j/pN4YhEUZjyKCB5374L3X/4FFM8eqzZwRk38mjDtrQMuGUb2+uPaaBDzE0jDh6u
 tnFjkjBpzP5NzAQfJvFqMSsdPwpHGm6Y4D1kpIQMLZ0N+gLPJJLC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_05,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0
 adultscore=0 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050145
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2026 17:47:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242887

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Rust support in the upstream kernel on riscv64 currently requires the
LLVM/Clang toolchain and does not work with gcc [1]. Add a sanity check to skip
the recipe if TOOLCHAIN is not set to "clang" when building a riscv64 kernel with
rust support enabled, point the user to the local.conf change needed to fix it.

[1] https://docs.kernel.org/rust/arch-support.html

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/classes-recipe/kernel-yocto-rust.bbclass | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/classes-recipe/kernel-yocto-rust.bbclass b/meta/classes-recipe/kernel-yocto-rust.bbclass
index 49f2bfc1ae..c7dc01ba1c 100644
--- a/meta/classes-recipe/kernel-yocto-rust.bbclass
+++ b/meta/classes-recipe/kernel-yocto-rust.bbclass
@@ -25,3 +25,15 @@ do_kernel_configme:append () {
 # More details in: https://lists.openembedded.org/g/openembedded-core/message/229336
 # Disable ccache for kernel build if kernel rust support is enabled to workaround this.
 CCACHE_DISABLE ?= "1"
+
+python () {
+    if d.getVar('TARGET_ARCH') == 'riscv64' and d.getVar('TOOLCHAIN') != 'clang':
+        raise bb.parse.SkipRecipe(
+            "Rust support in the kernel on riscv64 requires the clang "
+            "toolchain, but TOOLCHAIN is set to '%s'. Set "
+            "KERNEL_TOOLCHAIN = \"clang\" in local.conf to build a "
+            "riscv64 kernel with rust enabled. See "
+            "https://docs.kernel.org/rust/arch-support.html for details."
+            % d.getVar('TOOLCHAIN')
+        )
+}
-- 
2.49.0


