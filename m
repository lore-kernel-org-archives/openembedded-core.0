Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EE9EF0180A
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 08:24:51 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.65168.1772785485024247271
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Mar 2026 00:24:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=FqEjReUW;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=752549a871=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6263EPvZ335025
	for <openembedded-core@lists.openembedded.org>; Fri, 6 Mar 2026 08:24:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=a29xg3Jfu
	xBfYVcn2r7nm+yaUNjs1bz16sFBw7FGODQ=; b=FqEjReUW305o6VehEjcfgctZ2
	WTw210Xr+hbvA9eLiCEGUT1aj76gdXh6h8ibxFh/CtsmREfs3h1sJQDtNFV+BDgN
	aCT0Ozrb4F3G/CveUzswjkN71zf2LX3wXJqWxbY98JGGZf5glCLJOW9CMIHX1ZUB
	Nfw4X5/0D/Dl3rfNS77lt8fN7zNy9IWDymRGjsQFR3+3LE9Q4eFnIsGJYZ/007tz
	XTAv31bREN5numv7QWDgOKb3aTEe6ChZbzRmC53TPB3flkydj9XpDk5iatlQEPET
	3D4qq0TJ9cQaAj8CG+ry7QSCx2uao47Xjt529hqQJfOUMV0HWmc7jLKiqqoLA==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013041.outbound.protection.outlook.com [40.93.196.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ckqb4qmct-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 08:24:43 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KNBTnTkS5+J85i4HEAE3SFEIZCj6iGx2aAQ1BDkzP29QWYSwXng2U9+Yi3uuNmeM878/7hdI67GWMvbWhqKVtubi7iYpfQVhtesUHDRUl1mWnpWfxQhNAkgtb6f4zzVTggF1OhndwtXSF8vShe51VeV4ph30SmNYK+/Yr5NY5n6t2PzK4UQ2ZYLpO8TkbwriERkSkLsCJVnW663Hj/3Oc+AHaMLTU7cERhwBIduD0eOjyMl0lcznamWp4wuFf+4SpKNTtx+u9jZswFcyLFQU1IcDdZSurKAQ2imLPP9lBzaBtXAVb9MJi9FFEx3JW07dxWy4j8vL46WkZE8WsewnMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a29xg3JfuxBfYVcn2r7nm+yaUNjs1bz16sFBw7FGODQ=;
 b=JsjMlnk8pXjwsfRLa/BeD1IA8uo0rc+jr+TZsZ50YyvLXycn65h+OI0Y87pAxuNTbXkPC7YoD3iDvv6vyjORbspiOO22E6rYiwJlfZUtTOoYsismkL2VYJafE20GRMZKT9fcs8wh0ICsg6MRsthgK77oMyXKw8d0kdGti1UNx5vfCP5Za5B4icwszvQRhMvFdpObhDUtoXTTpLDVpdkS6QMXpwbVltiNqPuq0Wamd11ooA4pki6H0B6OaH431QcTlNGAekTJ6Re05XoMrpiNOUv9B8Gi/YoesimUAwPGDgMiIreR4hQ4axFX/kBoD53ZTS1qExlyhVsM+xL41z0DbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6677.namprd11.prod.outlook.com (2603:10b6:806:26b::6)
 by MN0PR11MB6034.namprd11.prod.outlook.com (2603:10b6:208:375::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Fri, 6 Mar
 2026 08:24:40 +0000
Received: from SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab]) by SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab%7]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 08:24:40 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [PATCH] cargo-c: Move recipe out of rust directory
Date: Fri,  6 Mar 2026 00:24:28 -0800
Message-ID: <20260306082428.203033-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0387.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::32) To SN7PR11MB6677.namprd11.prod.outlook.com
 (2603:10b6:806:26b::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6677:EE_|MN0PR11MB6034:EE_
X-MS-Office365-Filtering-Correlation-Id: f248b81f-0d45-4b6d-80ce-08de7b59cff2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	ugTrbTFLzmXI0TrrVz1O3u5TVj/likihkrVXX6gL66NHVey02KF8AJANzbYNFAud7rvOrg8hqFmWj5+CEVQ6ipqw/CcC4jIYrKlZ73s8/MFecFcXibyBrNNi12oX0aVwzRE3M7z2vwhNRa64sknMnLSJd7YvZDfMRJUMBfp4V90bDmuIVmaEqPjxdT7n4NCoMv/jTJ7CrhuvNTOoZeV1sg/ccT7rYx7WpBcnwbjwBPvfcUgd5uUyYMoCps8+sz84wrTdeU2VJkmkm7GKoxGS/0zr3BbUt8RySg1x98WBLdgeOqhDMVdhOsGEzVKP5Pmn3l8IEw5oZjJe1LEQQ8M4pPKQghgAxyU//kUldW8WVkmAG4eDv6M6w9750gZyrmIy+F7Ur0EMMz8uZkpPkmArKKKNy0R4gTrEzRpTB7zXDRVGwoa8GgFJIMT2Ls3bB72XNnpBEtQp1MDdSTEoK7HNc0FqkyNpwSsMWTP6mfszZVXKwdUkJkID6qDlVzmiOh01+ze4kQxdv6L8wq/X0EXe++QFFTZkB51U7z/I0yQoaOVrddsdBWmLIAGHzANsYuahhlhZ7kELgkFBW9ff62oxJCCP0k9+GgORB8OcfJaG6dJE9OhnLZLvbVHSpcl/lIQYLRiyhr7w2D+joegPOyt5dP89/+RWk14qcfvi3zUeiaalFyAGs3pFx370uLOlstCLivAYLECqw06E3S3ZaxfouEIBpyHKZaLVnnfJNyYL092EbQl3q4LxYk5bkN+Cd6IiBK7SeOM7D9ej9UbSfxAyQfNgxA7Djnt9VUWz/sTfWp4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6677.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?j9+WANWVQQcPHlICeJE3ycRp3eIYevt+qlCI3q7HGYL7gdblos4XggrM1NCq?=
 =?us-ascii?Q?j9NRdL2QB8kcmfpKGyXkDusdnsf6nuwGtIUTMBB/CEXSAIkOOzdOBuAk5NfH?=
 =?us-ascii?Q?9Mc1NnNJH6Wb3IlXMzg7JLt15cM7bMPLKv37jtn3+yi5n8zZqHXPBTgsp5+q?=
 =?us-ascii?Q?mkEs1ce+WnCJE334tdqq7qCG/wBgc+2FSImaCzoRhzCxKVTHocZK6Pr18zIM?=
 =?us-ascii?Q?2tqK46vJyFMWfzoSNbSCfTltc6GizeUJ6uIQQoGhZSf4HqBspu36SAjuBsqC?=
 =?us-ascii?Q?0FQSKJH7mhvYlgZXo0F/2wfClNwh8cu4Fgb1nVCUI+HlLi7QzdFX1dJQOg9y?=
 =?us-ascii?Q?Z3oXa23c0l6VBJPAi6ESALuxipQtIlTzssYkwAc2f8gHRLRw6j/4eHZjcodc?=
 =?us-ascii?Q?gvOYbgF8SJZUm5sSVge1vJHI3Hn2kVjz1Cpnamjk0D3P04iGrY9peESrN4/s?=
 =?us-ascii?Q?QiqQSRNHBPD4hVx7gq6YXDRdubP0XjNUZsa6vsLjEDFRBkynhd8zYylgi4AO?=
 =?us-ascii?Q?LRSuVlU1//lP5ffrXVW/skb71PoaBvf5DBDKJvY8y08NB1ygQvp9+ElCsi1I?=
 =?us-ascii?Q?bQEd72GY06djWwyI4TksGPoDqs2nyaz+sxJfsUW7mtNWOs4R6hotuh5Jbdrg?=
 =?us-ascii?Q?Cc9yNgzVNk9Gm/BulY+ogxFE9ujcPeJw9oaA2SntniTVdDe42AOTAnb3vyis?=
 =?us-ascii?Q?7WauB+Ty7++VaNnbCjYd/MD09T7ISyr8aY38/xHeUAgENKkpOdjRO/GCTnXH?=
 =?us-ascii?Q?sZkzoVaPjQIfPwNGXIBLdH1vAbU5udKWx7AIuTQRBpBBrbr/vX7wMNuvBsR/?=
 =?us-ascii?Q?kl78CuRY7lYtwZR1frmH4uqhdcUPKpvgepiWro112ilexJ8Wc3suFKqrk98H?=
 =?us-ascii?Q?2kM6Jkd7sAkhka6cSmMnfllAc3CQ7KBFWljMavDGmtsVtrhrtQQUiOKXOkYc?=
 =?us-ascii?Q?TfAB4d33rDXcNUxMDUcxF/b4OVPNdS9Awf4zt6iXVNJ4hz57zXfiIQswGqMc?=
 =?us-ascii?Q?t/QfcCFDJx6j/5XeWs+v9My+WpDEfeCd7XeLvrFQCdgZuMr8G3xhlygebovX?=
 =?us-ascii?Q?Az/OzA0mGVqecLHf6D1XxePtfTJzhXXJQIDiPYBysHVCGDfzOvEA3ZGXO9vZ?=
 =?us-ascii?Q?311kws7DogrBvbfXwe0XwvSiK3PzaVfx9gdLHv56pAOodLgjue90CJhv68J4?=
 =?us-ascii?Q?gf44nJ+Wz0weIK0e/VvMCbLietOeYGKyI6XHI8w7Z5zWk7BB8rLhLV8HGHo3?=
 =?us-ascii?Q?Hh0wOXbKB0E39X64g/WQkjo8V1wfI4+LUtJLoOg7PX1OecC/6jsWRMcI0D8e?=
 =?us-ascii?Q?RH0NPdTXU30eygZoS8NTGnZOynKlYW6r8MQq6Zz3Gn07K2AySRFb66GZlm6Q?=
 =?us-ascii?Q?VlHB1Ea30ha9R9S8RF3wJ9DwDCfM4kkFbIz2i1i2yn1QE9NgS4pgNsVU2o7w?=
 =?us-ascii?Q?PQhbgyUl7Yh9WKzhWHaV/joC+exeLW9F4w1kIkD/OBT46PRA4PEORWOQNyr6?=
 =?us-ascii?Q?bhC+JC0evtrLrO+fyXTkGBKtEvFNxLTPw2JNfCsQACOvGIfXYRFXRCt6uU01?=
 =?us-ascii?Q?Q4pTPXnVY9+dS6uOfGW2Ds/IKwSLDi/X4Yvdg2kkubEmEjHA19ted/QDD+g3?=
 =?us-ascii?Q?T6v3BWmCGuqwer+hJjOAYaEAdn0vXMCNz3xG0NE0yu4E8hCuHvNWI6U8VSie?=
 =?us-ascii?Q?8jbarN63m2ucNTGJjo4u2KU31zr1OEQmT+uqFZdjHvonB72E+lyN5FxljN5H?=
 =?us-ascii?Q?byui8/5qwy6ksecSWzwdsAG12nBkFVmoSYnxORo7V4SqadvMLhTN?=
X-Exchange-RoutingPolicyChecked: 
	ABDs2G4OKeruxA8996NXCquy5ny4FlYiOarEslo1+caDVppJcNp95NfHc7xwFJECpScmU3DTWUPdRIeWXhRPp+v4ieUPruRhwkCx0AvZs6O2rH+u4lwNV3iGZcM8ktlE82Yo19JYxmoA6D2nAIcmVwivTpMQhxGpxahs4JDEVrIA3jxUb/+yd3Eu9YVQr1r/YWAf3u1bS+seFzT6mRZGH2O9ofSW8U+3/gMaEvJjk1p5AIsMkS25PHLS7uD4BwUWTFgK1mbGyNnJaAOwfVBsrpsTmvVwmUWbWfCHOnJ8lmbZ/qgv2f1q4MTk3IFWBTRRtbY6NsX9dyEkrU/Ly8n6sg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f248b81f-0d45-4b6d-80ce-08de7b59cff2
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6677.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 08:24:40.5725
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ag5EDLnP7iTirPGFPni9sE9o585F540NX0fxy/mTt7faGxDgEIUMJQi/tFOxWG64ehmwrUJ6I9uSXW5Cs3agm3rBr9cEqs6VK5vUg5OFvSWU73YHX4l3xF10Yo6nGfbk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6034
X-Authority-Analysis: v=2.4 cv=LqWfC3dc c=1 sm=1 tr=0 ts=69aa8f4b cx=c_pps
 a=7U6MwrGrMRcsJNK5547h+w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8
 a=r7x3q_pfjZkM4uloMnAA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: mZnY0gbK3PnOjbsewZIr-wRUceQcDypo
X-Proofpoint-ORIG-GUID: mZnY0gbK3PnOjbsewZIr-wRUceQcDypo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDA3OSBTYWx0ZWRfX2NJHzWDJGo9L
 Nzl0BkT9Yot4jbiEAoriXQ+25a4ckdzYkftZ8G6iyYLDHSU5iUZD9A3qXbJOqmn/Swd17xLt8sj
 ttVNngJ5w6KZTO5GPZWnMfCGqzwIJJfO8C85drpFPCxdldwEX0L6rbR6AwlxFqRghkndvTTaCrV
 cMqRUYL9eSGyR/AzOHQ8DmmyHhpQz7wH01u1XhiB4+tLsMeAslmwN1Op8K7YMMAb7OciFV3AddS
 hnGNov8g3paHjxgU810e4V6PUNDwLutvmV13BYI6ek9UtnkhgRQFRF4j8Buqr6UIR/EdRp1bw+z
 v4DPyuaIorx/8ucmWpENs7B5vqAWqywNJKNpm+taWNEfLmxZ0/X2TWOHW9gaqG64fX6nzCQF8Ph
 NqDrEmPfc2RB/g8a9tsIwZeli0JUZurjSWj+3el63O5hWKh7lJPja1qfHWP6Ei45W5QbcwBj0Me
 4zPibrEpn6qJjZB9k7g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060079
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 08:24:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232556

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

cargo-c is an external Cargo extension used to build Rust libraries
with a C-compatible ABI and generate C headers and pkg-config files.
Since it is not part of the standard Rust toolchain, move it from the
rust directory to cargo-c under recipes-devtools for better organization
and maintainability.

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/recipes-devtools/{rust => cargo-c}/cargo-c-crates.inc        | 0
 .../0001-parking-lot-Use-libc-SYS_futex_time64-on-riscv32.patch   | 0
 .../{rust => cargo-c}/cargo-c_0.10.20+cargo-0.94.0.bb             | 0
 3 files changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-devtools/{rust => cargo-c}/cargo-c-crates.inc (100%)
 rename meta/recipes-devtools/{rust => cargo-c}/cargo-c/0001-parking-lot-Use-libc-SYS_futex_time64-on-riscv32.patch (100%)
 rename meta/recipes-devtools/{rust => cargo-c}/cargo-c_0.10.20+cargo-0.94.0.bb (100%)

diff --git a/meta/recipes-devtools/rust/cargo-c-crates.inc b/meta/recipes-devtools/cargo-c/cargo-c-crates.inc
similarity index 100%
rename from meta/recipes-devtools/rust/cargo-c-crates.inc
rename to meta/recipes-devtools/cargo-c/cargo-c-crates.inc
diff --git a/meta/recipes-devtools/rust/cargo-c/0001-parking-lot-Use-libc-SYS_futex_time64-on-riscv32.patch b/meta/recipes-devtools/cargo-c/cargo-c/0001-parking-lot-Use-libc-SYS_futex_time64-on-riscv32.patch
similarity index 100%
rename from meta/recipes-devtools/rust/cargo-c/0001-parking-lot-Use-libc-SYS_futex_time64-on-riscv32.patch
rename to meta/recipes-devtools/cargo-c/cargo-c/0001-parking-lot-Use-libc-SYS_futex_time64-on-riscv32.patch
diff --git a/meta/recipes-devtools/rust/cargo-c_0.10.20+cargo-0.94.0.bb b/meta/recipes-devtools/cargo-c/cargo-c_0.10.20+cargo-0.94.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/cargo-c_0.10.20+cargo-0.94.0.bb
rename to meta/recipes-devtools/cargo-c/cargo-c_0.10.20+cargo-0.94.0.bb
-- 
2.49.0


