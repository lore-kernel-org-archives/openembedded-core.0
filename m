Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C33D4CA9ED0
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 10:18:37 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10227.1791800314391176897
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2026 03:18:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=MDch9K28;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=47453a78d5=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C8NC592390905
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 03:18:34 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=ADlC0ZbzB
	yFm6XNIzvoLkCbbLqcyqRsbK+JW7iI2MqM=; b=MDch9K286/Hj9txloss65Nz4B
	p3l+SyYu3u4wr8ldQPUKH8f5VhuGVv2Inq25Ng9JqPYQ0F1b7c+8elZO/pEcJDax
	HBswpzMqTY7eesOmzulw5vCgN1htrAI2Lix87INNtZ0hYtrD6XvTcOiaAO5VSFM4
	zDdtGs7OijS864d9OyzOeGxLP+wX3qxVSATRnqzXmF+Hyb8ke4OpG5aH1OSFmWMm
	W+T9SVkTJltJu56VzcEyUizUAW8N9CkJgMFe0qTdmmiZMhrirRzZSoaCSVeWEWVK
	r2riBEzqg0z3fsSN6Eg5TG/5fU6RHu3zRxKzJIwmP80kiR2ekUs0wSdqU+d3w==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11020091.outbound.protection.outlook.com [52.101.85.91])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4h7gn19wgb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 03:18:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J3AXciNJB8rrdF6cSXI4s68xPTMSX49BIZ7tclCl6D36UDlIfn6R2j+hgClLrrnLU1tNzrMRBBJct1qTezKL7keTsfgOsGRF9oTxrG5b39krEJAwlqTrOtvIYh28hlf1IdzGD+vSi7eO6/WXnj9OtEKSs/d76L8/bfFFXfaeEDn6zxTXpeZNnnw9PgIt3TnFRhEtGjbQXsRe/2o3IwPtrOAe0Y1soGDYv69Qy7dOgg+XVkSMod4KmwMp0lPiP3JJH19tmRfmdcWTPiJJJaqVoOq8L2dt+e7+cAHx2ZAA1C9Fmrli7orApP8eIJx9A4uuV/RYqbE/8rjLxQj/iZzeJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ADlC0ZbzByFm6XNIzvoLkCbbLqcyqRsbK+JW7iI2MqM=;
 b=lCAPlp7pPEh/CeLngVm/aDcLH36b4SlgEJpsQ4AHmGmSu6u0Om9dS9li+fD6ucTCuhX/A/Jodhr8zvOUuZfsfrVo35wSmoktcIYjJuYkRlOw6QDDNxLzGaRZetAzIqovc4t8gc2PR1y14a9gnXc7sEWlMhVAtRwmkdlH0ZHdTz7PQuwn6wY6B3YKZ1WCOonFCrwnck5QCOyF0B87R+XxxkkYdxrZGAMmRS4LKKTPz5pOueXGJ2ONwQ49GRJscCB1CG62SYMP4QL/vWHPAayn+i2Xr8Bd19BXydrCp9In2djrAlOyonFeVnj5Q2dqmlXvV5Vw57CDWYIDiV3sCVtPBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from DM4PR11MB7328.namprd11.prod.outlook.com (2603:10b6:8:104::9) by
 DM4PR11MB6191.namprd11.prod.outlook.com (2603:10b6:8:ac::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.20; Mon, 12 Oct 2026 10:18:30 +0000
Received: from DM4PR11MB7328.namprd11.prod.outlook.com
 ([fe80::26e8:ea57:9a33:9a86]) by DM4PR11MB7328.namprd11.prod.outlook.com
 ([fe80::26e8:ea57:9a33:9a86%4]) with mapi id 15.21.0451.026; Mon, 12 Oct 2026
 10:18:29 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [PATCH] rust: Squash rust-cross-canadian.inc into the recipe
Date: Mon, 12 Oct 2026 03:18:12 -0700
Message-ID: <20261012101812.1485365-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0003.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::8) To DM4PR11MB7328.namprd11.prod.outlook.com
 (2603:10b6:8:104::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7328:EE_|DM4PR11MB6191:EE_
X-MS-Office365-Filtering-Correlation-Id: d66237ba-89e2-4fd1-cec5-08df284a294e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|23010399003|1800799024|6133799003|10067099003|18002099003|260925021911599003|260925021311599003|260925022911599003|11063799006|261009223027099003|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info: 
	OjQWZ8raOj+w6du1E7StyxzWuUS8QDBOALk/X/XLGctW3NMPMCEI30dJsgiVJyk5WucHPrj/IQ2bIfj24Rl469H9ZgxYrkJmrMUXX9j5sgfjrTU4guefZRH9kBoGncZTK/Iqc6MYEwiUzot/ioKg9p86d5pzo+geWqYv7+mQgFpbCimrFd2AxXaMsNTUkwtvlJQZNW0hjMGQ/2075FpenrcyDg3dd+ccgtntV4r4SoivHxWJxYVOAa7I9lKm8erNRSZ2Bn1wOkklSl1VXzlZ/Ut+hbh9FvIst9A8JSgjLk9xZfxuQNy+jHMUXFo6LVFSkE/cR5r1nfm0mzHjRolAW0vSdrp7DXEsKP0OXpbsnpyRoCb65zdm6XwJTIyU1z9EMwEOwRjmp6+PfhuhCHMLPRO7VAJWKVlW2VZGZesrJLu2FuPCUeExYe/80f04/+cApAfaAjzyghN0E8uEusUmhXYGGU7YyX5TwQm7q8xLr3lbavevBkA6O/B67C00ravRCB21EolCbdR2ILyp3SznG3KvFDltA+lKU1UQ3Em7K4ri1P0mo3BTDVHaE/tSdcdtnvqm+CxchjhYYDEV9B/EK9b8TIEtFgirCmkH6ToMNW0qAp71Ceu3X9wceKHVyUzNajgEu2084nw5XiNZlJ/TR2odiSBN6N9eZekS9zu11J5lSEIGQyxa+nX0C9KJnepDK5QcRdFnyUHLS4ene9MFjRGUjh65rm4vXmGuIiWJAZQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7328.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(23010399003)(1800799024)(6133799003)(10067099003)(18002099003)(260925021911599003)(260925021311599003)(260925022911599003)(11063799006)(261009223027099003)(56012099006)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Jr13QpfvdYRgvqJ0XAhQuFEozlXUoUfpy4llt8zuCmlEdNS2+Lg/c9qtc6Ye?=
 =?us-ascii?Q?jIBOQ24SLM495viq81Z+FvQ+GCR5TZO5gzO+iXdYH6Xea73pBOLcwjhjShMO?=
 =?us-ascii?Q?giIG/qpqnk6OB2wTiKrTW+xezbI8UaRRADV6ePPex1glJQBtHbXCV5I+ba2N?=
 =?us-ascii?Q?PF2PZbwICwSN3YJgfyldgWv/hPmL7CM+2i46b0cdNb6tP+yEqERv8GZsUh04?=
 =?us-ascii?Q?6VUfy2xDRYNeesStscJ+K934HENUdfmYjk/DdJDEOzk5oP3WBgrBsYhpYqGq?=
 =?us-ascii?Q?0lolMpVKv9rk4CRKRIyqjW/6Lp/L/jqlyL4JXKVtA0qY8ylU2qdpMez8fkDb?=
 =?us-ascii?Q?D6eo+y8uHsBkTyd3vD0zAaBO8d2Av01HbWSONjNBObDhgaN6Pad8RDr6owIe?=
 =?us-ascii?Q?gCtHLvgAhql2f+OY05mn81p89oHuZshtBViNpIzKUQ8eatquosbFuqcXffv6?=
 =?us-ascii?Q?jO1tDDC89+hhIJ8EaBoYOnGmqWq4WrWbQHZ8qlU+eKMyZNTUXIhBQYYiiB+y?=
 =?us-ascii?Q?QKB9hXQJJnYQ5FkDbvHM+RYWZ2ZJJo5/Pl3YHq4EfHFWaYdkr90Pdbz7zXPH?=
 =?us-ascii?Q?autv148L5umbA8Bciph9yxhqnojuJ6Znjoa0jxEDmklcYfunu7gU18Gf3gSg?=
 =?us-ascii?Q?RnMiayml4wNpbsQx40ZPpsp9XQKakF+i0pxfzQUDwLnPufouCSnuDLVy2/e8?=
 =?us-ascii?Q?NzmY8uGLmxfS0xFiXChnYlEeCTAvesFirCEvLs2HZhneVjCz+95PWmzp4kyW?=
 =?us-ascii?Q?Hakbo+UgziyOk+vLpwEbCpVZGiRYr6MI+nNKS7U68xlZUndjHfF+gFixxruc?=
 =?us-ascii?Q?m2+SGRzwLqxtiQ61JFYOv+7EGjwzWImHzW6heI2u6n6YaeJcGr7sjQTpxdW3?=
 =?us-ascii?Q?JhIrAkVep3tGsNRpe8Ie+ZdzxtWvelbqzrghngLoRxlTIwCigwQ+77gTJ4BH?=
 =?us-ascii?Q?SruM17siRd99hTVcqDXraSX8YsD7gi93MK+X6+sM8VvVxJ76PyDRJvdSjjtX?=
 =?us-ascii?Q?3mL37P08enlYQSY6nP+ntkbFLox9r0//Am95IKNvJQadL56MsH71rmKsh7on?=
 =?us-ascii?Q?Ady9qlRA8Ymq66cfUj9w+XZPHla4PApwEzz8Pn0RYZs58OcLKb+/T5HwQqEV?=
 =?us-ascii?Q?1+ZgCfqBB1Gr1vN5Ux8HGtoTYuxe/IiShJnLHm/6towvhC9s0rebKZBJmr5O?=
 =?us-ascii?Q?B28MykSpd5ijlO5VDAAmCD2u+g4ARXMsbCl3llGlb4S9KMU2VJN1/GjW9bpY?=
 =?us-ascii?Q?dUvC4AwXS5oJFtdNv8mJwjNT3yKlYlEi8Damlws4WVKJuiQb8XhMv4UR3X6D?=
 =?us-ascii?Q?wHe4RiEYqdr+glA2zg3peG2Vu57HfMwdCa+cg7nEOZqEpeHErgDwYIAEUHrk?=
 =?us-ascii?Q?s39V7rwX2K04QCHbh7NjQjUgOWqKcZQwPglIEHE5MpP6tQYJ373JT9AWZ7ni?=
 =?us-ascii?Q?/X7JtxcpBHy/hEORlO25LQard+YBFLabg0p2tu+a1QM9rJ1nwhsjfLxMjFHr?=
 =?us-ascii?Q?eZGSCfDNXIs0efUZT8/TMkrtkiUqrXsfMi49IWjmPIA+f7R72hr4e/w8xH5H?=
 =?us-ascii?Q?WaKP4JikVDv3gKmW/9SsEb8K/AZBMq7RbO49I5wLxEeIEvqRcfIilWLl5fio?=
 =?us-ascii?Q?paGjIN8yOzHK02L8ZC6kEgRi4X27cpEXsPffs1uVMQ3ehUeWgqg85wo7rgSF?=
 =?us-ascii?Q?fvNJhjgt4FAcaqtGgqexObMOqyxo6s0hGc+BBNUKKuW8oVOz6qEhnxwo1nH/?=
 =?us-ascii?Q?ILWgGZjVKTg40EcS09XXSP+HEuDNv6KxBuR+kXVHJQExVRAZaBWP?=
X-Exchange-RoutingPolicyChecked: 
	vsV4MT+3L2OidOvJUZ3ptRi8xBgJbdAWFSHhZpcFk8t59Li/nlu7gmyhpAZeB5QudKMkwBlSG67QA2stPAI+TEWKbAINO4e/3SEenfaV99PSn3K+t0RgUH779e3dG2nzb/5R6+8326HRAOlVOPCvx9jANEgsClZYQrM3xSIxp68DshhKqJHh6Qy81mD7cFfwBDXTVpM1g0a3+NfyuUp045cLKiCdLkFmfP5aOqAjx+dk/j2QofUrBKbOSWrWgGeICo+dUDWYd6aKgMFfn87+3nDAOrGeA4Kw3ubMQbaQowrWAYoxJQ1/nTrGScg4nUKKqVj6gNTvSDtxMWp6AjCBrg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d66237ba-89e2-4fd1-cec5-08df284a294e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7328.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 10:18:29.8743
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cQ72KkU6ehdYYJPzlyIFLo55gbDm0lwYihBKCTVXG07vKgAbEevYaWAQsw6HbOCvQg67572/kxGG3FobYJNW/CfV2HZa6MeKkjxxfa9PjWBsu52azNAsH4FVU/SStuxr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6191
X-Authority-Analysis: v=2.4 cv=KcNHIgYD c=1 sm=1 tr=0 ts=6accb3f9 cx=c_pps
 a=kkQK6hjpUACXm7ua2zl0Pg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=yBHewc_lufBPQI8ecRQA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: E1OJ3E-DDAQB_JfieQl4lMZkPDZrXhfN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA0MCBTYWx0ZWRfX1WmABwaJTUul
 HX2vDieZp0z30/mvZUEQ9mMvF0X/mUGH8LTKyqhHZDjME/lGRNnonEK2CBnBSilgsT2T9NMH2La
 iO8qzIDY24daWHStFAdbI4JIRwRhWj59oBgk2eCaEBcJkI2GvJxh
X-Proofpoint-GUID: E1OJ3E-DDAQB_JfieQl4lMZkPDZrXhfN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA0MCBTYWx0ZWRfX2OSLYEjV84im
 YFTL4quiFE1GnE9gw+LQZkgyy2s62Q5Uj6SVM3a9YORdNHtbdoB45tLMTkJL/CdmX+6BKv4G6PI
 z5kbxFKobdShuHuIqoTjg78hKmWnK1kvj9LtqE8AUPODOxmQHQCv8oE1yt/2Wi06xQX7qMe1iav
 0Ckc4DG+OTXQOMTVsw95vy7NEXhylN2SSiSE1m4pWYzO0Rr33J5JQn8fX0BwxcQpKA1MvRY9tiT
 G6klwjfLrmSPzLjPu3BhEjr9MNeNlEX+5uVBwzO5k9uwWdrt5ysDrS6MytKkXlwgd3h4q+0vo08
 V9r6EoILFELZy1b2o5Xxkn5S7w1IYWhI3zmKVDtaduX/RCIeWOYvc3o0gyZrxiaHiJ+7bb7TDOU
 6PgyezMIDgiAYiTP183y46v9tCW7AK758agObZl5kU5Dw4snPasXC6H5GejWYLE5xHNU/Ra5CFm
 iqtX5ZGnUnpgqpWuAVg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120040
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 10:18:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247623

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

It was only used by rust-cross-canadian recipe.

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 .../rust/rust-cross-canadian.inc              | 72 ------------------
 .../rust/rust-cross-canadian_1.99.0.bb        | 73 ++++++++++++++++++-
 2 files changed, 72 insertions(+), 73 deletions(-)
 delete mode 100644 meta/recipes-devtools/rust/rust-cross-canadian.inc

diff --git a/meta/recipes-devtools/rust/rust-cross-canadian.inc b/meta/recipes-devtools/rust/rust-cross-canadian.inc
deleted file mode 100644
index 689ffa7efd..0000000000
--- a/meta/recipes-devtools/rust/rust-cross-canadian.inc
+++ /dev/null
@@ -1,72 +0,0 @@
-SUMMARY = "Rust compiler and runtime libaries (cross-canadian for ${TARGET_ARCH} target)"
-PN = "rust-cross-canadian-${TRANSLATED_TARGET_ARCH}"
-CVE_PRODUCT = "rust"
-
-inherit rust-target-config
-inherit rust-common
-
-LICENSE = "MIT"
-
-MODIFYTOS = "0"
-
-DEPENDS += "virtual/nativesdk-cross-cc virtual/nativesdk-libc virtual/nativesdk-compilerlibs"
-
-SRC_URI += "file://target-rust-ccld.c"
-LIC_FILES_CHKSUM = "file://target-rust-ccld.c;md5=af4e0e29f81a34cffe05aa07c89e93e9;endline=7"
-S = "${UNPACKDIR}"
-
-# Need to use our SDK's sh here, see #14878
-create_sdk_wrapper () {
-        file="$1"
-        shift
-        cat <<- EOF > "${file}"
-		#!/bin/sh
-		\$$1 \$@
-		EOF
-
-        chmod +x "$file"
-}
-
-do_install () {
-    # Rust requires /usr/lib to contain the libs.
-    # The required structure is retained for simplicity.
-    SYS_LIBDIR=$(dirname ${D}${libdir})
-    SYS_BINDIR=$(dirname ${D}${bindir})
-    RUSTLIB_DIR=${SYS_LIBDIR}/${TARGET_SYS}/rustlib
-
-    install -d ${RUSTLIB_DIR}
-    install -m 0644 "${RUST_TARGETS_DIR}/${RUST_HOST_SYS}.json" "${RUSTLIB_DIR}"
-    install -m 0644 "${RUST_TARGETS_DIR}/${RUST_TARGET_SYS}.json" "${RUSTLIB_DIR}"
-
-    # Uses SDK's CC as linker so linked binaries works out of box.
-    # We have a problem as rust sets LD_LIBRARY_PATH and this will break running host
-    # binaries (even /bin/sh) in the SDK as they detect a newer glibc from the SDK
-    # in those paths and we hit symbol errors. We saw particular problems with symbol
-    # mismatch on ubuntu1804 during development. To avoid this we have an SDK built
-    # binary which unsets LD_LIBRARY_PATH, which can then call the wrapper script
-    # where the context is easier to do the env maniupations needed
-    install -d ${SYS_BINDIR}
-    outfile="${SYS_BINDIR}/target-rust-ccld"
-    ${CC} ${S}/target-rust-ccld.c -o $outfile
-    chmod +x "$outfile"
-    create_sdk_wrapper "${SYS_BINDIR}/target-rust-ccld-wrapper" "CC"
-
-    ENV_SETUP_DIR=${D}${base_prefix}/environment-setup.d/${TARGET_ARCH}
-    mkdir -p "${ENV_SETUP_DIR}"
-    RUST_ENV_SETUP_SH="${ENV_SETUP_DIR}/rust.sh"
-
-    RUST_TARGET_TRIPLE=`echo ${RUST_TARGET_SYS} | tr '[:lower:]' '[:upper:]' | sed 's/-/_/g'`
-
-    cat <<- EOF > "${RUST_ENV_SETUP_SH}"
-	LIB_PATH="\$OECORE_TARGET_SYSROOT/usr/${baselib}/rustlib/${RUST_TARGET_SYS}/lib"
-	export CARGO_TARGET_${RUST_TARGET_TRIPLE}_RUSTFLAGS="--sysroot=\$OECORE_TARGET_SYSROOT/usr -C link-arg=--sysroot=\$OECORE_TARGET_SYSROOT -L \$LIB_PATH"
-	export CARGO_BUILD_TARGET="${RUST_TARGET_SYS}"
-	export RUST_TARGET_PATH="\$OECORE_NATIVE_SYSROOT/usr/lib/${TARGET_SYS}/rustlib"
-	EOF
-
-    chown -R root.root ${D}
-
-}
-
-FILES:${PN} += "${base_prefix}/environment-setup.d"
-
diff --git a/meta/recipes-devtools/rust/rust-cross-canadian_1.99.0.bb b/meta/recipes-devtools/rust/rust-cross-canadian_1.99.0.bb
index 55865238ab..5f91de2178 100644
--- a/meta/recipes-devtools/rust/rust-cross-canadian_1.99.0.bb
+++ b/meta/recipes-devtools/rust/rust-cross-canadian_1.99.0.bb
@@ -1,2 +1,73 @@
+SUMMARY = "Rust compiler and runtime libaries (cross-canadian for ${TARGET_ARCH} target)"
+PN = "rust-cross-canadian-${TRANSLATED_TARGET_ARCH}"
+CVE_PRODUCT = "rust"
+
 inherit cross-canadian
-require rust-cross-canadian.inc
\ No newline at end of file
+inherit rust-target-config
+inherit rust-common
+
+LICENSE = "MIT"
+
+MODIFYTOS = "0"
+
+DEPENDS += "virtual/nativesdk-cross-cc virtual/nativesdk-libc virtual/nativesdk-compilerlibs"
+
+SRC_URI += "file://target-rust-ccld.c"
+LIC_FILES_CHKSUM = "file://target-rust-ccld.c;md5=af4e0e29f81a34cffe05aa07c89e93e9;endline=7"
+S = "${UNPACKDIR}"
+
+# Need to use our SDK's sh here, see #14878
+create_sdk_wrapper () {
+        file="$1"
+        shift
+        cat <<- EOF > "${file}"
+		#!/bin/sh
+		\$$1 \$@
+		EOF
+
+        chmod +x "$file"
+}
+
+do_install () {
+    # Rust requires /usr/lib to contain the libs.
+    # The required structure is retained for simplicity.
+    SYS_LIBDIR=$(dirname ${D}${libdir})
+    SYS_BINDIR=$(dirname ${D}${bindir})
+    RUSTLIB_DIR=${SYS_LIBDIR}/${TARGET_SYS}/rustlib
+
+    install -d ${RUSTLIB_DIR}
+    install -m 0644 "${RUST_TARGETS_DIR}/${RUST_HOST_SYS}.json" "${RUSTLIB_DIR}"
+    install -m 0644 "${RUST_TARGETS_DIR}/${RUST_TARGET_SYS}.json" "${RUSTLIB_DIR}"
+
+    # Uses SDK's CC as linker so linked binaries works out of box.
+    # We have a problem as rust sets LD_LIBRARY_PATH and this will break running host
+    # binaries (even /bin/sh) in the SDK as they detect a newer glibc from the SDK
+    # in those paths and we hit symbol errors. We saw particular problems with symbol
+    # mismatch on ubuntu1804 during development. To avoid this we have an SDK built
+    # binary which unsets LD_LIBRARY_PATH, which can then call the wrapper script
+    # where the context is easier to do the env maniupations needed
+    install -d ${SYS_BINDIR}
+    outfile="${SYS_BINDIR}/target-rust-ccld"
+    ${CC} ${S}/target-rust-ccld.c -o $outfile
+    chmod +x "$outfile"
+    create_sdk_wrapper "${SYS_BINDIR}/target-rust-ccld-wrapper" "CC"
+
+    ENV_SETUP_DIR=${D}${base_prefix}/environment-setup.d/${TARGET_ARCH}
+    mkdir -p "${ENV_SETUP_DIR}"
+    RUST_ENV_SETUP_SH="${ENV_SETUP_DIR}/rust.sh"
+
+    RUST_TARGET_TRIPLE=`echo ${RUST_TARGET_SYS} | tr '[:lower:]' '[:upper:]' | sed 's/-/_/g'`
+
+    cat <<- EOF > "${RUST_ENV_SETUP_SH}"
+	LIB_PATH="\$OECORE_TARGET_SYSROOT/usr/${baselib}/rustlib/${RUST_TARGET_SYS}/lib"
+	export CARGO_TARGET_${RUST_TARGET_TRIPLE}_RUSTFLAGS="--sysroot=\$OECORE_TARGET_SYSROOT/usr -C link-arg=--sysroot=\$OECORE_TARGET_SYSROOT -L \$LIB_PATH"
+	export CARGO_BUILD_TARGET="${RUST_TARGET_SYS}"
+	export RUST_TARGET_PATH="\$OECORE_NATIVE_SYSROOT/usr/lib/${TARGET_SYS}/rustlib"
+	EOF
+
+    chown -R root.root ${D}
+
+}
+
+FILES:${PN} += "${base_prefix}/environment-setup.d"
+
-- 
2.49.0


