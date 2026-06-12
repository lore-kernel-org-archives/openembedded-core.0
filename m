Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3492BCD8C9D
	for <webhook@archiver.kernel.org>; Fri, 12 Jun 2026 03:47:09 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.63103.1781236021184080269
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 20:47:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=MfcIbC+W;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0623a0aa98=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C3XTqg1139516
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 20:47:00 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=kUJuDaExf
	FEkSBX2LVcIcCwJb4jHK+KaWIDMzvhzVbY=; b=MfcIbC+WamlzrzPC5BjaTBz8Z
	WAPHLK+dYXgISGg4jaOKZ1NL8Xt0/dpVy3meyucUQkxTwUNe3I/8+jtaE4nap4PF
	AVEGo6n5BPnE9fWVeZ8z4p8uf45jWnc42JhKTGKybNUwZqWHWPR7nm+GCiWrte2I
	fZKRZb+rVfgxnnxxHDMMXWPzyn+GfIL39NoxtRlyLpitu6m88vGIIVJ9rvqb6dre
	qaZgc0ASYirMGMIJbUM+yVQEQmaPbNXup2a6YoUf8u/NVRhqV19awCl+hS5jXVE8
	4yOaqU6LifVMTSi1I8Wct5R3fhABwYyu2o9c/Ax28P5cb5Fqotm/TuU0HtemQ==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010044.outbound.protection.outlook.com [52.101.56.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4eqe7sa98r-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 11 Jun 2026 20:47:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zGwKOrV92K2qBnV3WJqZohF45ClH6B8enQrGyLtvTcblzA8zMXSpsmTBIxDKQyZCA5/yWrG61InxuoQOtYTvYtdGAQbJ6vDSdZhON6VS6yttXohi/SrfZQY70Gdki/sRX3rrKCLT8Aa+rPCtRQRFN/l+HWh3t9ojscbe1dUd7sEZwuwDXloV7OBZ0jLbSEd5MwNuHu4FJuNrA5XWcDsdO9HlnvLTJlnHNrK2L6NQz8HAi9B7BFhv6mxoIOgKHRLUralZPX+eoLfTl67jhn5kRYxrcpBhPGlFm8pNw/rZmNOQRQMtlqng2TVskpkLOQzj/W9B1eIMKU0P4qd/4L71lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kUJuDaExfFEkSBX2LVcIcCwJb4jHK+KaWIDMzvhzVbY=;
 b=SIeLEm5H5ynMvEGyzYLGpfOMfUd7GweYBvX7EKxgzZKyyDp5JqXmxqxJIpLflAM8s13z+RuFkkgHVhnbzlwsS4sOfWahY8zOkp4BUXE+/fjPnuUieAHDap2hEn7kPcv0+KZdt6p1zWW9bhB3ClegmkqxaVEwCXqvPbMax2gv31zEtZIb+racXypOmgjeTXO2kZAFITMDaBviiveHFT/u05Ktyyq+1MU28vSrFopSfaibZKCqECLGIweYNa0J5Wv2BUV5j7eqDrc69cZ/SoTcwEEd8LZJUHRKDi7GpUG0H0bnivy8juOLwR9ZdgA8MUsq3fPPWISmh0Usf9QjXbzSkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6677.namprd11.prod.outlook.com (2603:10b6:806:26b::6)
 by DM3PPFF28037229.namprd11.prod.outlook.com (2603:10b6:f:fc00::f5f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.18; Fri, 12 Jun
 2026 03:46:57 +0000
Received: from SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab]) by SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab%6]) with mapi id 15.21.0092.017; Fri, 12 Jun 2026
 03:46:57 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com,
        richard.purdie@linuxfoundation.org
Subject: [PATCH v3] llvm/mesa/rust: simplify llvm-config handling
Date: Thu, 11 Jun 2026 20:46:43 -0700
Message-ID: <20260612034643.3215188-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0007.namprd05.prod.outlook.com
 (2603:10b6:a03:254::12) To SN7PR11MB6677.namprd11.prod.outlook.com
 (2603:10b6:806:26b::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6677:EE_|DM3PPFF28037229:EE_
X-MS-Office365-Filtering-Correlation-Id: 69e78885-a31c-4ab0-1305-08dec8354081
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|23010399003|1800799024|38350700014|18002099003|3023799007|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: 
	50mSEFSrlclF9m+lEZAkslQNXpZknuzEHXiyfWSrDxTCTcPfRRbVJGWa36MNLAfIkFchKBE5f/AiqXaFnQwBCl6sWooTsgxokxX3qluiU0kokNxe/7+OufNE0SKQFgR7tsThHBBZfOB2Z5++juhfeejQ60qI/FxAHzwouq4LwtipOo7GVtlR+varuF+8W0OsjcMuuYNmnTIrYbadCDSKcEVcg9fqjou6IRooMUph1T8vZDKuuUxneMD355teayGdrGhW/nPga75jknFgJMrc9kXCk+/Rh5ykoFqReL42vJZtodWrpHQRiltovQjeW/4SBDdspOS18asti1JoGdaIL5YCKwtvGc05C/3oG1tsSo1doGhQ3G9GckDaCFa+w6oS8X30GHapnkJf2TeHYW7+MIZvFwt5PFiSf429ox6kPvQ+SZLljJeG2KDxDu20H3muDyo8DTmLXpU3WX4QYXNHDCeCfoWKEq0RJB7mDL1mBfmKF99+Pu6s553BhFf2KU0436v+t4ug2mFfQWaA/l29U9EMOYwoxL2A9yICLbN/Z6Zo2NRtLFUwrqRNwIxgNRXAISEuW2s0x5g4hYb1zIgTuAXZNRxSNU11f/ZOaNQo9FesNW45qHoj2cN1euEHrX11zmV+vi7qZSRu8u7Qc0GQTNUk8qkqrS89uQg07ieAThf9owffynlsQgjtfp0qMb74Ojlt/EobOtIDF6GS7gqgZZv/nSfKMetvuiWOuHD0Qd3igwPdRLkYV/GXiJt3KBmA
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6677.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(23010399003)(1800799024)(38350700014)(18002099003)(3023799007)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?uNMSN4xHdS+/DIInVmu048ohXEhk2jCZz6FbeIGDTLbamR/trlIQQGah2HLr?=
 =?us-ascii?Q?j44w20v0Jsmwt4Qr7lCaApzGzoRJCk1fUbEaRUoi3vGzMvQcRnrsr5FeSr5J?=
 =?us-ascii?Q?/b9Kl6nM31pZCpSC7iACuf5t23qfcpuaKD83tj5YaLSKR33xapJZ5XN2GEru?=
 =?us-ascii?Q?LpAf7BXaZpBxeaBN4ygF/FZiQih8XRz+w3Ll7hRJuveTDZgie+cy+Mm1fZRG?=
 =?us-ascii?Q?lsSZa7groHR4gWaWtiNWkjGNFADv55I2xCWxGWvGEb+aydnSpgxDTQEEa4Ev?=
 =?us-ascii?Q?kd7vJbvv9DnlvE1f1lox8iNPVrEe5H8tqtsr0QLFTmR5eBJ6RFtSJMKPDDOb?=
 =?us-ascii?Q?GgE+NFGNtGbk44xyGn7Rq+T0MjeFzOAzeoFxY5V0jAgiqpsI0FLjRg4E4d6n?=
 =?us-ascii?Q?AwIHV4QOb9X4fM7U3DJusEooF3AmTWEFFYyfW7XkasadpwrBPX9JpRkBWrZL?=
 =?us-ascii?Q?viC7Ardz40vQRcTGr7AmTV2KAdFelL+KgOf+BmafM4W45jgUx3Rm4ZTO2ZKR?=
 =?us-ascii?Q?87I7PAJtaATZyt0Tvyjd/5lcD/B67KDn9OlqCHO9kqyoPLsgqEIMGwzQQhDt?=
 =?us-ascii?Q?iZlLRIR1U8NmTm8KKdUAvcLx/XSpppWR+L1bJC9xNqhJrCfa7KNcGcNui9c9?=
 =?us-ascii?Q?z0uZ0GzGwl0siiaSG3q+sddHsvVKsRXId8mHWAY8uuj6ywnZ4N8OE7FmS3M5?=
 =?us-ascii?Q?gAWTx0Te9FFQYxQ6aLe/Iw3rNxp5S+4gWY3WitAn0a8dZPRWLgTbE+QO1CVB?=
 =?us-ascii?Q?UijRjmthuOr0NbZb6thrlI/YnhMlzJfI7Wn2/2GPdAxkruzAZeWD5kdDZIkt?=
 =?us-ascii?Q?b8SoSzqzQWb117KyYvIC2zKz0KNIpQo8lVyegIIID3RHEES/mthFfyI8is/M?=
 =?us-ascii?Q?dgbRmIuPKCByHcj0sE6N65J+5pY64G6avEvSXv94L+ucqhdSPW+1U0VVH6VO?=
 =?us-ascii?Q?WKVgbN+2YS6IcBMWreCLLzboY+FOS2MNSG1w7Maap9PWz8yekxhSQf6wPaVg?=
 =?us-ascii?Q?m9cckF1HvKTSRBar6orikxGpsL52hRa8Q6PoOTcjU3sA2NsTXKJBUHE+wSTt?=
 =?us-ascii?Q?TbMrCwm+ZCB2SBkS1qvlT4SJ7hWwxXvpf+7fBrkd+TR/AU1XAvg+ymFUbubN?=
 =?us-ascii?Q?yBChWxKv+Uu2z3z0o6x2t6lpaKrP9sXkQDHyJnESo5LnIqSxxVxH6bSlI9Vi?=
 =?us-ascii?Q?DoMdJXsM0KOWOQ6BejdSiPDEwyfjdxMPbXxEyRMVLl7670bmwo3whL4/vnv/?=
 =?us-ascii?Q?WmStzCNoH/7kKiRswidWLc/KXsims7SPv+ieOo5m6ifhI2Zevl6svP9EK7rP?=
 =?us-ascii?Q?4yyOJBJfWqQkPi3Ts/nEcMDse7KV0z7upfP7WYNz82xm52w/Wk7YUsvjezjU?=
 =?us-ascii?Q?+XSu/1g6k81L+Q+NmnGNWnmqT+eB52gTtdkAPfTb73v9ipmLFpS52Bt4mTkh?=
 =?us-ascii?Q?lYNhYfWcRXJwYIYYpEA8PM/F/JYfz4HoI57t2Gy/2/i1czBe7CRI2ciTQHYs?=
 =?us-ascii?Q?GyBTbzRIOGW3HUzev8bFyDcdDdUBOCZGNDfiKHV0eJ0HaAbiBjpvbVcmzBBl?=
 =?us-ascii?Q?fdvos4WfDuviyC/G2MsVqCt0Hi0Mx9h94XjnyiS4wiQBkAp7WIXeNR02y0YI?=
 =?us-ascii?Q?r9i+WzPm5NMOgSWDOLQKSV6E4505faNF1fOl/gInXKEYAivLPX/EzC6W1XNv?=
 =?us-ascii?Q?Pzr/pcN/428zYSmi5yKMztW/gQdh7nRKyKkDw45J0WoyeZL/9kYsaQj3U+/C?=
 =?us-ascii?Q?ibXsXC5h/UQ4jGbGpODrd/YUOGV42Rq6dwGtN+1QZT8Gi+R1fAlc?=
X-Exchange-RoutingPolicyChecked: 
	mxT2AHdWtbOj6Q9XeumyaHOi2aFYvIJJIUrAIdrUKmr304jefX1noqZe2b7SD2LBgeLxfjJ25/wFCsxh8hdjYoU2cZ+bzESrusGSDck/ZdzR1C3GOqAg7sDbMndkFEvKgyXJS6SEt4iaUjrJXai8HhkNf5qV/hxJvT3mrUZ6iYSfJOH3/d9eLDvyzBQqpSdELVuecQOplsR9jwlf0K5CKcHwJ4kRNDuXTaA4vXWsg3bXcFsVfhSX50e5vKdtl0sYxjyeCPXsSQzuDhKYUcVbBQeoZUZjpfir+/RR/80/vhPmlbRMzL2O9taJsvb3CLQzBkj3LZtsjYeQgug1QwMPhQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69e78885-a31c-4ab0-1305-08dec8354081
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6677.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 03:46:57.5732
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cxexrAaDEcJrq/K7eGvVxjm3SRvtWXgRtXXxmZGnTdObLPzjTmq9ApnbvRkqtLFc72wR+wg4Ro3RqQMVr4zQGYjgjY/vEqW5AkwALve1OBV2vyP4yoNn3YocyIND8gCZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFF28037229
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDAzMCBTYWx0ZWRfXyObDqYwalnED
 ub9jg9tvp0SakCvzI/oECY49K7mjdPIaUfC+QKk1B6vEbqPP8UkwKHQ4275dX9QxwUDk3HJG+9f
 B/d6dxb8yU95USWd9JtIWWj7sOTMmTycuyISq4HCi5oJ9rgfoXti
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDAzMCBTYWx0ZWRfX+OyIhx3ToGbf
 9PciZqf+DEXrEBEN8i4bDcFAC3Z4aGsV96CDBaNhiJGZif0d70ftt92O+t3X9dQXF+gOqscO8js
 gqQQABemPE73C8H89Po1UcOkqInm0bs/grwDyCjGQzOWpYVtHTBLv9zOVDAuGWGQPuFi7nmQXos
 0afn/u+R/aO18IF41vVIfxYVhhJBd+YA3tuyx7uRAPK4OXvEG3/26MtFcxERz0y4mrZWmq5tYEJ
 XZg93APaM9tbKjQ6FQ3ocxTJpXXwh1YaGjJzGT7HCLU1G2Ru+9DUkIcPlcJi87eyjhiWgctc5BD
 rAqnIdRBCmEpUoKk72XWOft746LClAX3C3NY8EHP0gA72cugOK2pIE5Fz84aj/YxVjVwoMedu00
 I2hhz2M5PpDeTw6bpmt0KDVym1dMUchVmV0hX0xp7b7kN6mrGqAtoRDq81YUBCNr7Y+Ufe57P1F
 lyC45hDRhgQOYub+gSA==
X-Authority-Analysis: v=2.4 cv=XujK/1F9 c=1 sm=1 tr=0 ts=6a2b8134 cx=c_pps
 a=wV2zXAf6sYQQ4uINbIt3+g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=pGLkceISAAAA:8 a=dT9Y9HKPEq8aplpvp-8A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: U6HnBIOhLNYMsKzNqYJAjvFASHa5weBY
X-Proofpoint-ORIG-GUID: mircUamPreu9zfzVzgF69lNBv0vhJKoU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 spamscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120030
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2026 03:47:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238591

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Replace PATH-based llvm-config discovery with explicit sysroot-native
resolution and simplify the target llvm-config wrapper to act as a pure
pass-through while preserving Yocto alternate path handling.

The previous implementation relied on:

* `which -a llvm-config | sed -n 2p`
   which is unreliable in cross-build environments because it only
   searches executables present in $PATH. Native sysroot tools
   (e.g. recipe-sysroot-native llvm-config) are not guaranteed to be
   exposed via PATH, so they may not be discovered at all.

* `echo $base_libdir | sed -n '/lib64/p'`
   which depends on a BitBake variable that may be empty or unset
   in certain build contexts, leading to incorrect libdir selection.

Update the wrapper to:

* Use an @LLVM_CONFIG_PATH@ placeholder that is replaced during the
  build with the appropriate native llvm-config path.
* Detect libdir using filesystem inspection rather than variable
  parsing.
* Preserve `YOCTO_ALTERNATE_EXE_PATH` and
  `YOCTO_ALTERNATE_LIBDIR` handling.
* Delegate all arguments directly to the native llvm-config.

Update rust and mesa recipes to replace the placeholder with the native
llvm-config path during target and nativesdk builds.

Also remove the native llvm-config copy logic and lib/lib64 symlink
workarounds, relying instead on explicit native tool resolution.

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 ...unwind.pc.in-and-llvm-config-scripts.patch | 52 +++----------------
 meta/recipes-devtools/rust/rust_1.96.0.bb     | 52 ++++++-------------
 meta/recipes-graphics/mesa/mesa.inc           | 16 ++++++
 3 files changed, 39 insertions(+), 81 deletions(-)

diff --git a/meta/recipes-devtools/clang/clang/0026-llvm-Add-libunwind.pc.in-and-llvm-config-scripts.patch b/meta/recipes-devtools/clang/clang/0026-llvm-Add-libunwind.pc.in-and-llvm-config-scripts.patch
index eeb802732b..72ffdc6c1f 100644
--- a/meta/recipes-devtools/clang/clang/0026-llvm-Add-libunwind.pc.in-and-llvm-config-scripts.patch
+++ b/meta/recipes-devtools/clang/clang/0026-llvm-Add-libunwind.pc.in-and-llvm-config-scripts.patch
@@ -8,6 +8,7 @@ These are added by OE project
 Upstream-Status: Inappropriate [ OE-Specific ]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
 ---
  libunwind/libunwind.pc.in          |  9 ++++++
  llvm/tools/llvm-config/llvm-config | 52 ++++++++++++++++++++++++++++++
@@ -35,56 +36,19 @@ new file mode 100644
 index 000000000000..6a0dd54b8eab
 --- /dev/null
 +++ b/llvm/tools/llvm-config/llvm-config
-@@ -0,0 +1,52 @@
+@@ -0,0 +1,15 @@
 +#!/bin/bash
 +#
-+# Wrapper script for llvm-config. Supplies the right environment variables
-+# for the target and delegates to the native llvm-config for anything else. This
-+# is needed because arguments like --ldflags, --cxxflags, etc. are set by the
-+# native compile rather than the target compile.
++# The llvm-config wrapper will act as a pure pass-through to the native llvm-config
++# while preserving Yocto-specific environment variables used for alternate executable
++# and library path resolution.
 +#
 +SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
-+NEXT_LLVM_CONFIG="$(which -a llvm-config | sed -n 2p)"
++NEXT_LLVM_CONFIG="@LLVM_CONFIG_PATH@"
 +export YOCTO_ALTERNATE_EXE_PATH="${YOCTO_ALTERNATE_EXE_PATH:="$(readlink -f "$SCRIPT_DIR/../llvm-config")"}"
-+if [ -n "$( echo $base_libdir | sed -n '/lib64/p')" ]; then
++if [ -d "$(readlink -f "$SCRIPT_DIR/../../lib64")" ]; then
 +    export YOCTO_ALTERNATE_LIBDIR="${YOCTO_ALTERNATE_LIBDIR:="/lib64"}"
 +else
 +    export YOCTO_ALTERNATE_LIBDIR="${YOCTO_ALTERNATE_LIBDIR:="/lib"}"
 +fi
-+if [[ $# == 0 ]]; then
-+  exec "$NEXT_LLVM_CONFIG"
-+fi
-+
-+remain=""
-+output=""
-+for arg in "$@"; do
-+  case "$arg" in
-+    --cppflags)
-+      output="${output} ${CPPFLAGS}"
-+      ;;
-+    --cflags)
-+      output="${output} ${CFLAGS}"
-+      ;;
-+    --cxxflags)
-+      output="${output} ${CXXFLAGS}"
-+      ;;
-+    --ldflags)
-+      output="${output} ${LDFLAGS}"
-+      ;;
-+    --shared-mode)
-+      output="${output} shared"
-+      ;;
-+    --link-shared)
-+      break
-+      ;;
-+    *)
-+      remain="${remain} ${arg}"
-+      ;;
-+  esac
-+done
-+
-+if [ "${remain}" != "" ]; then
-+      output="${output} "$("$NEXT_LLVM_CONFIG" ${remain})
-+fi
-+
-+echo "${output}"
++exec "$NEXT_LLVM_CONFIG" "$@"
diff --git a/meta/recipes-devtools/rust/rust_1.96.0.bb b/meta/recipes-devtools/rust/rust_1.96.0.bb
index 3eb2a36406..8b0f1d1459 100644
--- a/meta/recipes-devtools/rust/rust_1.96.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.96.0.bb
@@ -31,7 +31,7 @@ PV .= "${@bb.utils.contains('RUST_CHANNEL', 'stable', '', '-${RUST_CHANNEL}', d)
 
 export FORCE_CRATE_HASH = "${BB_TASKHASH}"
 
-RUST_ALTERNATE_EXE_PATH ?= "${STAGING_BINDIR}/llvm-config"
+RUST_ALTERNATE_EXE_PATH = "${STAGING_BINDIR_CROSS}/llvm-config"
 RUST_ALTERNATE_EXE_PATH_NATIVE = "${STAGING_BINDIR_NATIVE}/llvm-config"
 
 # We don't want to use bitbakes vendoring because the rust sources do their
@@ -192,37 +192,22 @@ python do_configure() {
     bb.build.exec_func("setup_cargo_environment", d)
 }
 
-# llvm-config expects static/dynamic libraries to be in the 'lib' directory rather than 'lib64' when
-# multilibs enabled. Since we are copying the natively built llvm-config into the target sysroot
-# and executing it there, it will default to searching in 'lib', as it is unaware of the 'lib64'
-# directory. To ensure llvm-config can locate the necessary libraries, create a symlink from 'lib'
-do_compile:append:class-target() {
-    # Ensure llvm-config can find static libraries in multilib setup
-    lib64_dir="${STAGING_DIR_TARGET}/usr/lib64"
-    lib_dir="${STAGING_DIR_TARGET}/usr/lib"
-
-    if [ -d "$lib64_dir" ]; then
-        # If lib does not exist, symlink it to lib64
-        if [ ! -e "$lib_dir" ]; then
-            ln -s lib64 "$lib_dir"
-        fi
-
-        # Only do per-file symlinking if lib is a real directory (not symlink)
-        if [ -d "$lib_dir" ] && [ ! -L "$lib_dir" ]; then
-            for lib64_file in "${lib64_dir}"/libLLVM*.a "${lib64_dir}"/libLLVM*.so*; do
-                if [ -e "$lib64_file" ]; then
-                    lib_name=$(basename "${lib64_file}")
-                    target_link="${lib_dir}/${lib_name}"
-
-                    if [ ! -e "${target_link}" ]; then
-                        ln -s "../lib64/${lib_name}" "${target_link}"
-                    fi
-                fi
-            done
-        fi
+replace_llvm_config_path() {
+    if [ -f "${STAGING_BINDIR_CROSS}/llvm-config" ]; then
+        sed -i \
+            's#@LLVM_CONFIG_PATH@#${RUST_ALTERNATE_EXE_PATH_NATIVE}#g' \
+            ${RUST_ALTERNATE_EXE_PATH}
     fi
 }
 
+do_compile:append:class-target() {
+    replace_llvm_config_path
+}
+
+do_compile:append:class-nativesdk() {
+    replace_llvm_config_path
+}
+
 rust_runx () {
     echo "COMPILE ${PN}" "$@"
 
@@ -236,14 +221,6 @@ rust_runx () {
 
     export RUSTFLAGS="${RUST_DEBUG_REMAP} -Clink-arg=-lz -Clink-arg=-lzstd"
 
-    # Copy the natively built llvm-config into the target so we can run it. Horrible,
-    # but works!
-    if [ ${RUST_ALTERNATE_EXE_PATH_NATIVE} != ${RUST_ALTERNATE_EXE_PATH} -a ! -f ${RUST_ALTERNATE_EXE_PATH} ]; then
-        mkdir -p `dirname ${RUST_ALTERNATE_EXE_PATH}`
-        cp ${RUST_ALTERNATE_EXE_PATH_NATIVE} ${RUST_ALTERNATE_EXE_PATH}
-        patchelf --remove-rpath ${RUST_ALTERNATE_EXE_PATH}
-    fi
-
     oe_cargo_fix_env
 
     python3 src/bootstrap/bootstrap.py ${@oe.utils.parallel_make_argument(d, '-j %d')} "$@" --verbose
@@ -263,6 +240,7 @@ do_compile () {
 
 do_test_compile[dirs] = "${B}"
 do_test_compile () {
+    replace_llvm_config_path
     rust_runx build src/tools/remote-test-server --target "${RUST_TARGET_SYS}"
 }
 
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 15dad6eedd..f40fed5ebc 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -51,6 +51,22 @@ ANY_OF_DISTRO_FEATURES = "opencl opengl vulkan"
 
 PLATFORMS ??= "${@bb.utils.filter('PACKAGECONFIG', 'x11 wayland', d)}"
 
+replace_llvm_config_path() {
+    if [ -f "${STAGING_BINDIR_CROSS}/llvm-config" ]; then
+        sed -i \
+            's#@LLVM_CONFIG_PATH@#${STAGING_BINDIR_NATIVE}/llvm-config#g' \
+            ${STAGING_BINDIR_CROSS}/llvm-config
+    fi
+}
+
+do_configure:prepend:class-target() {
+    replace_llvm_config_path
+}
+
+do_configure:prepend:class-nativesdk() {
+    replace_llvm_config_path
+}
+
 # set the MESA_BUILD_TYPE to either 'release' (default) or 'debug'
 # by default the upstream mesa sources build a debug release
 # here we assume the user will want a release build by default
-- 
2.49.0


