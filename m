Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FCA1C43458
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 06:32:00 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15497.1782801113344309288
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 23:31:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=H/XPDCEk;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1641d3c438=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U5gltL324757
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 06:31:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=osDsieAKJ
	c1KgTMM/62TlxaCNImklYID6UAvdghu0xI=; b=H/XPDCEkCZq3+wyiHYmFetvWP
	9YmjDcZojz4+2HDPsyDFd4mrfCpZwDttv0gokf2Zq98Gb8b57bEl5dQfPpO7+aov
	bF4WGILLChLFdPDoCuOGyECOfQUAr3qRDuh9BB6rpRE2RhPt2IfYcamLiJg+bn4U
	Z9aRYOCgJBR9/e67YDTGM2YL0zTr7LgYjVOnSNzFjribh/xBF79VMcGQc+XL+Z0d
	/iGNrtU3nhWBiiDCPEmPFGAC74DYp1jVD252YfNi1lEYVY2Y/3Y0+WRGHyVUnE3C
	Zno+u4nsbaPlzNTS9Y1Hjq7n9Gczus+/fPmupwTkc6w2VD0ZW57zdWCDSM/ng==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012049.outbound.protection.outlook.com [52.101.48.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4f23r0bfn9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 06:31:51 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=opWvjAbCF6ES0p53gPOV2G+LnHiMJPyCQe6Lv9NQMQaxAWfq+iIHS2VF515DKhxSR+3DNUHjPUEe6YMXIksiFmp/NMq5AXkHdhXZFRcRRuYY6TBov2140yYAYMP/4T57/vxWqD3teZA0Ao3qzHFUPIq754uWfvPnHyHRQ6YIci+dlY9vzjLhpaCX+dAuuGNUjzuO1TdRHeztCtfD/sMdOoP6+e0y6frFEcKWBZiDe+Kn0SGrAv7sgbwWPwwS9UhOtlPesmBxJYdGOT8n9GJpiUp2LxKj6atAnpfQPIl0TeouSsxY0pHakyr6PokE877NWhqoVwk4VRNy0GO+BhfDyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=osDsieAKJc1KgTMM/62TlxaCNImklYID6UAvdghu0xI=;
 b=YwFSL7U4jYbOcIlkMtlEExuivF+hVkuzpz9HtgbX2tyy8+h5Q8cuPHa8ny+pxNWojdu6SOe2QWL4j5m0oNQoLe6h7VLJPLWrv3/d3tZiJSqWeWoOvnjcA2MVTGVDPwK+bsICydqng6jits86XgUneZqrae+jEw4kYNskvkvlW6ytaC1wNKvUUN9N2UxI6ydHVcGVAtaBCGMqwSw+TqHc2A0tPrBT2ABukA3BEqeFUWImy2EoRuGp8sL+mKz8yIA7EsmDzkq8aJIS3icERLRHwoEX8v04gnEMSMSdR0DI7d9KWQuRqtE2fdCTuaRSYe/mGJupXWJYJUZgv/g1fZ1+vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 SA1PR11MB8812.namprd11.prod.outlook.com (2603:10b6:806:469::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.19; Tue, 30 Jun 2026 06:31:47 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%3]) with mapi id 15.21.0181.008; Tue, 30 Jun 2026
 06:31:47 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Hemanth.KumarMD@windriver.com
Subject: [PATCH v3] sanity.bbclass: warn on cargo config files outside the build tree
Date: Mon, 29 Jun 2026 23:29:49 -0700
Message-ID: <20260630062950.1098664-1-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR04CA0019.namprd04.prod.outlook.com
 (2603:10b6:a03:217::24) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|SA1PR11MB8812:EE_
X-MS-Office365-Filtering-Correlation-Id: 19b9544f-0345-444c-d245-08ded671425f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|23010399003|376014|1800799024|366016|18002099003|38350700014|11063799006|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info: 
	arGk86leg9XLqVW/lfHuAEGBhWeeAIPaAVQlghBuD9MXkZgYn8rUqGP12PXLSTgLTcUtLPj6K7cUAQSn03mzxwYCULQDgIZvGM0gK2Gc8ZeRurzVk6e4BfgxLLcwDohJHXfS74bCxhtR/iG2/zjDTbiNPSbjiAEMThteKUuVw+HXXrcKiokzooRSBkx7p2uDc53/1v5IbV3JJCzmxRsWIKRlpwT6Vj6tisenJvbIrIFcrh3yZi92P+XYJWCL/cqf8jJKPgnn17kEQJnzoNN4QIAyPYg86XdAT9t1gJiKjcwOOPlvRzX/MauNMjUgL1D4IeJcylqkSZCdVJErw1sl8mIVeMfM9W9Pq7toEmo8XMd1/MKSJFXHUy2XDh7cd5OLIKteA9zmI5p9QM7xUC4A9cxNtrwiF5haDVJbYo9gEJW7YHNU19dKVU9P7wmYmsvNFk8+MlnwyqjGvbNdLnAPzkTYk8bnTHzU8BoAh0ETM753Ot0K6WSKSyw0qiDDqd+v6wFAfzysmrdrNDyEDGav21whWQ1967S2V14AvQy5UWvYGKb2VXK3U7XbQke0vQg5Hque4KxwpVDiPDdOt3Ya5WRaoOa8BsiKNaKNr1HhM+c3JtbSz9un6al7PHhUvxGslXSz18eo0lMPvjXEoBrZPjueCI9r/d987T8sUf9rlCs=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(23010399003)(376014)(1800799024)(366016)(18002099003)(38350700014)(11063799006)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ejO3s/tFGBu6/jHPQT+JApRIA921gGc+EN3hYDbUuuKWtL2UCBhcXgXXghlj?=
 =?us-ascii?Q?Zyy32d6kxewlHAP1CQsscSw7SojaMyjGkmuQKnRV1IJp/whpxBBVDqCCloLy?=
 =?us-ascii?Q?2bPe/vjSywzW4kiNsVg4TEtEpdAJIF/qR8TSFq8HJhAPL7I1f1Z1REiN2UpA?=
 =?us-ascii?Q?/eaE/f/GnbCNnUMv5dHKPLWNeq+zfiB4+MXTez7hV5b2wh15gFY8Yo1+Q+vK?=
 =?us-ascii?Q?gn87pGdOBg0Hw+M+IKh1exOJx6bE377haf4pLbTPE5SVZbEVo+nmm7fYBJ2q?=
 =?us-ascii?Q?T1UGLY5IS12nPhHBJtDdpdtK4UeIOH2OiqS3+Yx+Zcr30ZPWvgBqXTi1jYU2?=
 =?us-ascii?Q?O78Bpri6RN6sdE9MlTJK78YdCx90ODGyU69Z6KEBKccqX7XKQ/RReJ+W7+VN?=
 =?us-ascii?Q?+KSvxwHCfHIMId1DnmVzKhg5zDPbTGIOSZpOqn3I1aEq2NGegPLviUg4wmU4?=
 =?us-ascii?Q?s9/mIzoE84roFNG2n1PmyWB6gNrAJitqWLGb0+0NM0A0EOgZy/yKl7GjK8gV?=
 =?us-ascii?Q?fjfyN5SyjDmyUBt4VGPT6kEfKdr9m21DxFnjgBU/lsn6BHA+y8vq/Gi61/hv?=
 =?us-ascii?Q?8qEtA3ShMkAsT+DqWAcHHlisbsyw8u34PVVzEiVIK8JcZuex7bIEo8K9DVG0?=
 =?us-ascii?Q?kW6m0clADhCNvyCOMpJdZPyy6V7pesJRnIOcSLhiLQsiK3I0ayzmPjOjqFKE?=
 =?us-ascii?Q?C6yU0ExMTqVrVWMUeweppZsZi19YsVEqG+vltCzzjFw+UQQfBuB9z32+Y7Gk?=
 =?us-ascii?Q?HUMR/8Fx0q+S9TLVmc31Y3k2sIgf4zspe19vrlvBE8Dpy8rNJfNQvCWttyuk?=
 =?us-ascii?Q?XLdX/H7GyyW+e8wOEqEsVp0xeKEXWBNUtjBdsldRN0VFfDfqDVsM20Gg9IuP?=
 =?us-ascii?Q?z2ZckHEFq7iZHJx+MYKKBJUP24VtMhnA6Pmwyhg+T2SXOijm+/5FvVjqqduz?=
 =?us-ascii?Q?sZP2XoHp4BJVEQ/6jZ7vEHYM5Bo6MvRdG3JHcb74QQ9vPbMfkDwCHlU6E/P1?=
 =?us-ascii?Q?X1IR5Au4Ig2Db1mbjEU8OZJPZn4H2+fDYbc62zE2T7ilMYPAw3JVkXiwsQX9?=
 =?us-ascii?Q?+D53m7k8Bf9M4fZzjMU7ktouQ/tK4q7S0X5E4vtzTZ2YXaPANi8CemK9kUPl?=
 =?us-ascii?Q?RbmcmQ8J/OsHKWLUXKRZoeGrBEY1mIyadsm/MUH9NgoSLz1ww3eodIRgnnEk?=
 =?us-ascii?Q?tO4it+dViIxdJ/XH0KARzG6+PBkM0USsOIlEC6OUMuPPNN3XuVzepex7EKzT?=
 =?us-ascii?Q?3TSzX/myG/yftWRsnU/JIIzkGqYLB7NAMqdbsP0l6gyJjdzcv4r8wNsp7n1G?=
 =?us-ascii?Q?XL/t3K7TO84SACqjuzxYUxepJuk42M/+6T4cj/06+N8iJj0Ml/hA94oxBh77?=
 =?us-ascii?Q?BkJ1gLbi0WdT805c9BQwqstXynQNA6SFQJFGE8c5vCPSqZG8hQIREsEW/2TW?=
 =?us-ascii?Q?9pUT5ou3IA0zQFis6Lc3juQAV8agySR0P0aveL49C74CswA+jJOtWbTtcGAv?=
 =?us-ascii?Q?VglNmzVeNlvEAccKrCYEEs2DfeIjYbtO5sxRwUYnh4PjtqWKjuB6QVuY3CMf?=
 =?us-ascii?Q?8HrFEGgl0qoWAckP7Uj3OAWDuyALC4E52CnzcUo9TkG8NG+dy0KHarq6N8fQ?=
 =?us-ascii?Q?lb+rVLYZZhs6UqRpqplFzXXDNqo1ZwNOFTv+SvcyU79qQ9D8p9dLi+QsRl2J?=
 =?us-ascii?Q?ADIIjIipfPyfC4bLs3G18IyOhzqLbWZKwEwk92V6X+iZa8Z7CH/ydJdOXp2d?=
 =?us-ascii?Q?ezN2H9uDEC3WucNDnTjC3jCHuhHD0s4=3D?=
X-Exchange-RoutingPolicyChecked: 
	PtDwbYAfldqjC+aEG3v3kEorFtu/xFxszoUpZICfwumy+W4YmKg74GIoD9qGQpziSYDLpQNpJ1An5eyt2NrDo+g0wioLkeTSTAH01criork75+oVOUpkdswf1PVAOnD2jQVkO2q7kuFjowsUCHU2xEJyzOnVIx1qQclxTlo48Wh4OT1/y7IT85ABi+NtuWl/CYN+UvVJcWLenGAWRTxaiGfbRQUOlxFoifm0EzE9rq7T3KKke5UO+7NPJ3nIkMYsWAnqd8p1JDcS16XQU/v9xqwYe8bLTFoyFqDEjVaW6cvOg+REuACILLn2Mu9P6ifrtpDKZLrRLwiHVOI+wo8DBQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19b9544f-0345-444c-d245-08ded671425f
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 06:31:46.9417
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bfXtyrIZy8S5zW6QxOLUDI1vAxet1POqEex74ewQ07w6rw/szjYsepffoEn/CwOnAMWKq++/hCRhLlN8utPBQLSG7GzzXyy5HB89QoP2gDs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8812
X-Authority-Analysis: v=2.4 cv=DNC/JSNb c=1 sm=1 tr=0 ts=6a4362d7 cx=c_pps
 a=w9jTARCbdo3hRO6w7Rsibg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=NEAV23lmAAAA:8
 a=iGHA9ds3AAAA:8 a=t7CeM3EgAAAA:8 a=IXJ3IMwHZfiimHfNxs8A:9
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: M_8PbHbnrsxB77ArBZxzoQcEcb_oe3qi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA1MyBTYWx0ZWRfX0SJWk0tXeVj7
 RsUwTHQ1EPWw39WMojUYOzlTlqvdmQM1D6CuHlMRhFxaqHkLboH9VfYcIo4xRagmoxasDBo2OUe
 Y2UNtQsSZQsoAaP66rOpS12AUE6PlYR/sTUPuJzMBRALZIF2FCO1ipd2Mj2EN3EGx8qiSyq7lLr
 snWXFV92RLrUUUYUnod961+33yb7pC3qpVicbC/yahfYWB14tDS3dhfjKinFQtaJ+JTaSiao1S+
 ZXR6L2OvfQD+Cc8Qur2DaawoDqb807pcI3JAUoWYw8can/VKwCP5S8taEcXh9Wy9Zld0fIiGojV
 /3DZ3eSXftEQqhkzNWgb0C6BKb6N4vNLGItcbT+3tLrOLw4wSUGG6nh53E/h3Z4yrOAjcK1M4DZ
 qTg/hEnC8FHJm9KIRS7WpqAbHPyUxFcv2wCExeXzI2hDIjwQ8b+qkhzTRWSIBzY/sobFSKZMzAw
 NrWm73y+glMlYS68A6g==
X-Proofpoint-GUID: M_8PbHbnrsxB77ArBZxzoQcEcb_oe3qi
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA1MyBTYWx0ZWRfX+Em0scrc+CPS
 zxXlgPLrYCBUVokOPLCl1ctqBoZt6s8Zx/vwunzNYskka4dq34wKA+R3KRe+qQ9N/lqch5MJEUk
 opfSQLVMcHPU33DnDG/5D+XypyvdKFJ2GjMxSaywBct+aWzGj8RF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300053
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 06:32:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239850

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

Cargo walks from CWD up to the filesystem root merging every
.cargo/config[.toml] it finds. Any such file above BASE_WORKDIR
is silently picked up and can override Yocto's linker, registry
or compiler settings, leading to build failures.

Until cargo provides a proper fix upstream, add a warning so users
get a clear diagnostic instead of a build error.

Upstream meta-issue: https://github.com/rust-lang/cargo/issues/9769

[YOCTO #15637]

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 meta/classes-global/sanity.bbclass | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/sanity.bbclass
index bdfa7f059d..85e262d383 100644
--- a/meta/classes-global/sanity.bbclass
+++ b/meta/classes-global/sanity.bbclass
@@ -854,6 +854,30 @@ def sanity_check_locale(d):
     except locale.Error:
         raise_sanity_error("Your system needs to support the en_US.UTF-8 locale.", d)
 
+def check_cargo_config(d):
+    # Cargo merges .cargo/config[.toml] from every directory between CWD and
+    # the filesystem root. Warn for anything found in ancestor directories
+    # above BASE_WORKDIR that Cargo would pick up silently.
+    from pathlib import Path
+
+    base_workdir = Path(d.getVar('BASE_WORKDIR'))
+    found = []
+    for ancestor in base_workdir.parents:
+        for name in ('.cargo/config', '.cargo/config.toml'):
+            cfg = ancestor / name
+            if cfg.exists():
+                found.append(str(cfg))
+                break  
+    if found:
+        bb.warn("Cargo config file(s) found at %s which is/are outside the build "
+                "directory. Cargo will silently apply their settings during the "
+                "rust/cargo build and can override Yocto's settings like linker, "
+                "registry or compiler settings causing build failures. You can "
+                "either remove these file(s) or move your build directory outside "
+                "of %s to fix this. "
+                "See https://bugzilla.yoctoproject.org/show_bug.cgi?id=15637 for more details."
+                % (', '.join(found), Path(found[-1]).parents[1]))
+
 def check_sanity_everybuild(status, d):
     import os, stat
     # Sanity tests which test the users environment so need to run at each build (or are so cheap
@@ -873,6 +897,7 @@ def check_sanity_everybuild(status, d):
         status.addresult('Bitbake version %s is required and version %s was found\n' % (minversion, bb.__version__))
 
     sanity_check_locale(d)
+    check_cargo_config(d)
 
     paths = d.getVar('PATH').split(":")
     if "." in paths or "./" in paths or "" in paths:
-- 
2.49.0


