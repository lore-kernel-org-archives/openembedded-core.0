Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2BB4C44503
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 18:58:13 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16048.1783537084727325456
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2026 11:58:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=QCdvPjcp;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1649b348d9=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668GJ8M0132053
	for <openembedded-core@lists.openembedded.org>; Wed, 8 Jul 2026 18:58:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=yWYVd5YXdOaPi2sefFQLF9mQMAR8lPr5bMrCYIXLKEs=; b=
	QCdvPjcpVwD77zmemDj4BObNpyhT/6OCecvKPAPiXrFktehLKB3q+DaFB9/ZK1Bd
	RJPLBwzTwjl2PS/kFhBBn2cDOExgvFfk2NOsoC1dE9GgIJCHE6FovLWEgdOs4wIx
	Pxim0Mik8858uL9FK4sSMmC4ZhISqofCPNCRSqSZKkzfVC3J+nO4Gcxfvnw7TDqF
	CP/mP37KwWx97cz0Sbmwlx40lg9q6TPSuMQtqTVjljr63z/iVMD1B+hTMOWr5hO9
	FwSloHd4ng5aFcqnt49u3h1QAwpZyuOqJPsnmpSQV7bgiEAdVqozwAfMEGjOQ6DS
	qMJVYKeCZTNcEEIY++hy8A==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012023.outbound.protection.outlook.com [52.101.53.23])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4f6s58ewku-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 08 Jul 2026 18:58:03 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yCb8diQgQ1BxnQEZDU8y/wHjvvd0Hiu35UJhWar/dHOU0eMT7oxyClwarhPIdvTgzAoMqMjzOGeo3pnUosFgPbO4FZXTp/mqagVDgN3vnfjrXiT6wYlgveG+3hr3ze2g8oiNYaTyPrS2x95IgO1+Zu5BtYk5ynuaCIKc7Zk273hptogeS8FTPM/VojNV5pewt2d63jhNIBYPQ08n6lvvO0OzEOnSndjd/j6KfGpPuJkOxyThTkcHN2o2CLzvfkCA4EtjZimUEvGh/BXY7//OdJCWtEwO/AM3a4Arz0SSDmhI3KYSSb7E9EIMfggbin6MR0wMkO9Ruxcw7ptlK1/ZcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yWYVd5YXdOaPi2sefFQLF9mQMAR8lPr5bMrCYIXLKEs=;
 b=sToOA2Te+CMw9Mf4gIWxFs2NwGs8RriiZdcxiwxSUUy6QBMSJu3X+JZ3rymU9mxPEU2ZbUm3y93BXFl0c2vhcEaHJwFe36OQQkWg/YpJku7MIBJxV11FBlyEq+g27NPb79ERkuZr6QRdnCwFdgmktX50v+HiztEhopyX+DPVJNioC0D1Jg2DANc13ioMFeOxSbFBxjs/+18SxzM9OojZfTGCADCtRf0XF5YNfSa1jSpvccf7/czjW6j1kfp+lqL3lw9v1cNTTytDpreysBNvXHw2pVJHf3bCWSbgxij3Eldp+tiOlK9dSR6+wQl0YjNbyBqtGjpbPFXJLsITUcVR3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by PH7PR11MB6697.namprd11.prod.outlook.com (2603:10b6:510:1ab::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 8 Jul 2026
 18:58:00 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%6]) with mapi id 15.21.0181.014; Wed, 8 Jul 2026
 18:58:00 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, bruce.ashfield@gmail.com,
        raj.khem@gmail.com
Subject: [PATCH v3 3/4] kernel-yocto-rust: Add lld-native to DEPENDS
Date: Wed,  8 Jul 2026 11:57:23 -0700
Message-ID: <20260708185724.2183159-4-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260708185724.2183159-1-Harish.Sadineni@windriver.com>
References: <20260708185724.2183159-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LV3P220CA0022.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:408:234::23) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|PH7PR11MB6697:EE_
X-MS-Office365-Filtering-Correlation-Id: ae3daafb-d7ff-481b-7d04-08dedd22d4e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|23010399003|376014|366016|22082099003|18002099003|11063799006|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info: 
	KAp0+nz82P3HZgPKQwlX2X3HHjsSuFSmVbUgz6xQOX/07zMR7fS9jkXfFJLnliydEBPn+92iMqshYe/bpQiHdHy8raQ6S2v+RNJrUw41DqD01DfKUfgOuTfk5LBwCQb/ydrJQIQIfUAm+BC0RQZDK/vQ/F0xiS3VRz2E1BeujAtMidVds1OjFsmxe1nqWdIsjEogMs/DddFBWSeIRlwlJjpj0YHvSGPcGHmjZef2SVY77HlT5lTxxtupF+55GNQYfbM2fsDXVPZoauv2+lr0Q/6VAIo7waA62vga0rCQqpS8Wl0+b5FNa/yT2WX57PpNwv9up1/A0Pr7r74vvrmHBmb6VTLyrpwGH5SDSOGyiUPG2zJZhN6xTQcUjGzvmz+Tsow4GSb48EHR8ubcjOGqX8uySsoatcS1XLdGtRyL+OK8HDb1eWXxtw1fgOtcAOv94+Dx+BSxz/ydYHcp40YTe1p1vDY7RsFwTQ8ihN0iKRJhBRT0nhbcamsOUujPa2mn0+R5jsDizzgXwWH6CkPNf0MolLZxKlPuS+wdgXLCOFK4Jg8Zi7I2NuoScN1dB1mrLJeeAhsxq4uq507QIccNIUijMv1/zra0+5fJROX5l/nqu5ubAwLS97w0dKIOWVMAwMCwebW5ieac01fEe/jVfvD2yaRqNp3F3pPeARY0EIkVnLfV8/byorKYxoD+uU9j5jmQXTYSCgs+UDYjGKEJUEXwXnnhnbAGbLTdpPSLObA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(23010399003)(376014)(366016)(22082099003)(18002099003)(11063799006)(56012099006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Zqn/a8L7MwgDTQV6wkg97nyWr4nyd2OgjVJdjYVmnc1K+1WZWzykPc6vH9Em?=
 =?us-ascii?Q?bvFe6Ont6C5M8ec640FHOyt+CecbwtV8+PNEscDw+/W494QbE1UimecMUmEx?=
 =?us-ascii?Q?i4WNA7MjWYxSOiEQGUwkW9YBLxa8iQYb8hedon4TkmT4R2YhHTyqmX+VMLwt?=
 =?us-ascii?Q?SuOX0jP42jA598hKc0Y7a0wW3fhOrDcAZhtGmewYYD+ZRCzkAm15pBOC0pLi?=
 =?us-ascii?Q?1Op19vU6NVGH2CazJKBApZTnA4SurnZc13ILXxSjsy7Mga7vZnGl5Q3f1QhV?=
 =?us-ascii?Q?ss2zum07A8HRlJGNkUVoPeYfP12kFHZpg5bBrHHyj3ekaZRxgrG0+1aAO9s5?=
 =?us-ascii?Q?RPQoQXia1PCGfmTCxU83Apwm1ZcXtFFQEYsLXWqCxn8ANowMU1JIYWvxqPMn?=
 =?us-ascii?Q?bG9/l2M9Z9M1rMIoCc29HbLLdfkP8gjnNHN+DIpTQUnoUqa1bbFhx5xjc59K?=
 =?us-ascii?Q?xL5GRIxN2P9relG1cMVKkllL5qxc9OrxR7W/U0Et7EK2KIbTyOJcNBiEqBzT?=
 =?us-ascii?Q?YX9YNFuETuGzRdk72VW96sh8zwLJ1zJmrimIJEgxcIwzwrKwMyTUPiyzuDWX?=
 =?us-ascii?Q?clIUBjEaU6IX1QLsyF11O2laIyXdXwY5ps48PS2dLAj9JzbWinclq4adaHp0?=
 =?us-ascii?Q?oxGv+0UHOJ9F5QvCil6vFZvKZLuF2EN3aZ5taadIqLC3c3WXFFUy+TiZq1pG?=
 =?us-ascii?Q?/JQ+McxsKXN56NueO77lYOZ2NyVJvR6tlEi48N8zVYf9jHW8WPih+pOVwvuR?=
 =?us-ascii?Q?dxj5YGvnPD5Z+qE7dc+bE8MBqxmL5aYYToEDayrGJmlTpwMew6ZdYBBcbzrf?=
 =?us-ascii?Q?vznl14fKMsgCZ6+I+1102KAXswhnigpKm0qJ/cch/4SSSckydYzkfa+ztcMT?=
 =?us-ascii?Q?2yrXZ2HWT/BayMhbAZ/wNaK0s8V6mX39MWFrARqsZ40QQZNu2Cv2gFykAJrk?=
 =?us-ascii?Q?a21gTtLwsdxYpA6o8QXIwv5kJR1rw2XT/7OASKkyPGXUJRJki2BwX+NpLHSw?=
 =?us-ascii?Q?a/GLwJxu72a+a5viX+UDCSl/oUsNSeAFmUYrjm36ooJEDlULDJD5U8tddlTE?=
 =?us-ascii?Q?EloHbB0h6Gd1IrurU+ZAWD+S85Kp6s7M7yv6rRCxFneyYLc3EWv7FqFJ8nzt?=
 =?us-ascii?Q?oabKBEwTcmcEyVHA1DcQ25hfZbnaMUmONig+vcA+Pv5fG/BMNkAMHhCHQq+l?=
 =?us-ascii?Q?cEOKSUBrnOtlwIrHn7gIpnrnC0mqiGrfk8LGGJ3bVMQcHTpvHRRPo4l/jtou?=
 =?us-ascii?Q?LjuKqbuKwuhbknFk2GSE+NQQYneZogPDWKDSNF5QH5BPfn3QgB0J3/YgoTnY?=
 =?us-ascii?Q?w2KKqrx98VerLP9v5/OyFc8gHs3t1jaKf51bT68mTuIriPCb0WQBOzgoOeWP?=
 =?us-ascii?Q?1oDV2F5SL+iTuO87InmulclsQlI9lPeNHNU9G9CQZ23KmEpYEWUCN0fyS4Ih?=
 =?us-ascii?Q?wQvH+a4qjfPJKitmRhGkfA2KNvKD7cAGdCK+SUf0Cg6bMFncHP3jNH1tmZsr?=
 =?us-ascii?Q?P4nY0hOoeemolnc+lOWPGkFnt71HGC6HjBpifK04DmOHvZQO2FrAsbEZ3Z2I?=
 =?us-ascii?Q?iHWHsQssRdc1f5UrO4brDciN4DR0IPgA5pS+HP8AjtAoBbvUozzqF0Phhieb?=
 =?us-ascii?Q?ftscURjvOM0DCOopKGiU9rg/y4vrRNiPn2X2vEXOyV6MB4Q/72BAqVC0zdoS?=
 =?us-ascii?Q?mzzy3hh9OFeRIoQr6yZ0ayrebuoQxcNKK4ABSoqWHOxLlJtgQYQLFLXIDysq?=
 =?us-ascii?Q?zGQ3GK9DMGmWg8fCHmFFRT0FsoBx4dg=3D?=
X-Exchange-RoutingPolicyChecked: 
	mtdFQLWxTOq4OhIryXOptvtA8ShQC4/ZpUc45WpZIEejAdAjliA+i0E48e+KQcJZlpeTEPWlrhW8Xfd6xCefA6Fu5Yk4jhhyKgMur/n58fqSczcZCnugp5FtWIW885WlO/fPf8MQsuhJ5Yx7YGP+Md208kru8zgzgl1M5r0rBf4n/3RhLgGWBpbSRviB/Jey/I/BAWIJUrbKWgaP8VR/EWZr2C/+18UQugUpm3a9mkjK7kksvr1ZPRJPgG94Sf069JMgOeZhKkqDapNoSPRJngqrend+Kpf9pYnllYV9U55sZ0VViDVcfVSnopxFuvbm3b91q8S55wcw4SD1GwU0kQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae3daafb-d7ff-481b-7d04-08dedd22d4e1
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 18:58:00.5403
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 18wiYQdNXGRL+XUC/06ZRhI8kvAGf2IvpYFxXdk7Lh1zyNXNwGuPdkGXEXYN+mMQun1BnmYSK0jvvfvV/eoRKE13Y4lr6Cd3v7HTxlN0d7c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6697
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE4NSBTYWx0ZWRfX0Y4v7ZEw5FMr
 M2ZkeeFQA9mJph/izCwR7KucF+I9pn+otkaO30m+pUUllcsGgudf9OwEeV9ILyOxo7FSMYP9+we
 /IV/DA3U718L8Eee2CaWohpxJbVGG2/PPMNiu0P+w8xYFbG5+COU
X-Proofpoint-ORIG-GUID: GWKdmwqK4mBWbHpNVKi_69APznSyWNDg
X-Proofpoint-GUID: xvP--EBaBLzR8a6mS1BBMOYyIRh22tYc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE4NSBTYWx0ZWRfXzPHnKqGEvRkM
 IxP/N5aqTaMeQcDEPMZu6Ugsly3yitzWObJtfAp7U75W0PToUl7Kz8YX5/n2qJh6C7aMHGK5VS0
 i+bKyAM3ji35+wkdJ6Z4cDp+LiRIYQL5/lMQ3uQDbgIwrLEo6CDqZYBxpu3a9YPttMox8Y1CkNh
 hD+Y5a5YzF8TYllxf3c6SM0LrO0SxmauaqCoOxStt6T4D6RZF8dadmP0Yw56dsGibOLxS5ozYxc
 Sd8EA6n+H2rY7U96J9qT8VIA9aqghgY2KBvPskmVGZ1qIPjT3GCL/i+8LXMZTJ7UdBR+McLqPrG
 sjN3fmiv16SH3g6VY9/vsSQk+552sJJmojXvoy4kgXEkwq/TFLIlMXqgzecseFqO0jD7cDmET+P
 jMjfFjRlgTiBd7LbBQjMsrB7MQxKqqrsGZkn2UZjTY6K1g7ASuWvu3kPUDRKuaun1mrDjrED9AK
 Nb3F1G024/vr5hyuypQ==
X-Authority-Analysis: v=2.4 cv=H5frBeYi c=1 sm=1 tr=0 ts=6a4e9dbb cx=c_pps
 a=ubW7OWQb4uJshPNbXurJQw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=LuRbOgls0ZB7qaaZkpYA:9
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_03,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080185
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 18:58:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240513

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Add lld-native to DEPENDS, As lld linker is required while building kernel
with clang.

Acked-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/classes-recipe/kernel-yocto-rust.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes-recipe/kernel-yocto-rust.bbclass b/meta/classes-recipe/kernel-yocto-rust.bbclass
index 49f2bfc1ae..1badb37476 100644
--- a/meta/classes-recipe/kernel-yocto-rust.bbclass
+++ b/meta/classes-recipe/kernel-yocto-rust.bbclass
@@ -25,3 +25,6 @@ do_kernel_configme:append () {
 # More details in: https://lists.openembedded.org/g/openembedded-core/message/229336
 # Disable ccache for kernel build if kernel rust support is enabled to workaround this.
 CCACHE_DISABLE ?= "1"
+
+DEPENDS:append:riscv64 = " lld-native"
+RUST_KERNEL_TASK_DEPENDS:append:riscv64 = " lld-native:do_populate_sysroot"
-- 
2.49.0


