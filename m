Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A98B7F433E2
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 04:07:58 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5776.1776312474805642276
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 21:07:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=NwTZSDyR;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8566fdd02c=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G2YTRX2305375
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 04:07:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=U/bMOJTvjn0TAwJs/8nZ
	spLO56ebjRttq6adLQSe1z4=; b=NwTZSDyR7miUiiZVzOVKFPkz91++U8pTZiM6
	kORBf3YCxH7dwIENI+le448DtbE/NDu3FM1/eqUbCEfafvtUnycY5UtUNyBZtZFz
	H7ci8atWEmRb2XcIdTcSY/74d9ZjucpLxc3R2ghJSORbbgbhHLe3yZRT0nV3czWB
	wk9f/aQBZroO2G1CGaiAzCx6CG/mq1Vwtra0rm99H9H9VELI6iW7JRznHxKrzTcu
	lI8SBZ8sFECDDmgVjvAZUUomNgVF7XOf32IMtIsvsvK3vAmsL+lle9W+qemNiprj
	0G+ZiZQdw71dkod17/kIkBeib0IoPEfIyC8Wgx1UFwzkSSjGEg==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011051.outbound.protection.outlook.com [40.93.194.51])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dh877k4cu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 04:07:53 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dgtAVflyGI772TbIwm3jddlm+3d4waLifWkmHI3SmAj4yTPlyAJErhteEW1nqqz8pl781mlsWmvw3pjSmtB2N6G7DGdkL2DBD6H/9B4KRIoo2yuMWjghnwfmPrD9rdOj4lJ40NasF3KtvUWTd4z2QGaxXQrgnAdvq4WbUXuay0+9tSvJE9QVOF2HYRmUSd3kbHwbFTnXfOEXToSq2jTDLt25J2Q8Nytl0PkVhbIs3NBM0asI/qQiAl9Gk+m/aoJCe0ZGeaiAlGGBhTDKlxoKF8OTAwREeDKyh95XDAXp8+QpLCKJaXc/FBv4VYN5HixsNwEU8gfMLsN64CiEnI42SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U/bMOJTvjn0TAwJs/8nZspLO56ebjRttq6adLQSe1z4=;
 b=QqZ2B+G9KGK5VAcfU5dl6eY6ZaZx/aXglUGK3Eqb4tRjqCmBZa9dREOF2dXDfgMudn5Sq15n4RUSnKXZKsjnwofxONi/H4KNMzcGcUCOTbbHWQcNR0QcvolyAAuXpfXHv3P1WZXUKzUoJ6zRT/Jbh1clpXai/ZaSBJe3UgRA2WjigSpV09EXZ1g+59eZ3QGnDRpOgwzDgccm5ZI+aNRKDHa9v6UBvBK9OjdIcJvDFpnLtxBX9s66k09bxJIQYB9MGDYHlBND/BvU4VFfFZK4a2IJb0MF/D/Phxx3wPhJgj5Bo0suw1BgMEfoyTsk4ec/9KJnKeMe+FeBw8UL3SUTkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by CO1PR11MB5201.namprd11.prod.outlook.com (2603:10b6:303:95::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Thu, 16 Apr
 2026 04:07:50 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::ecf9:dbb:16bf:5b2d]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::ecf9:dbb:16bf:5b2d%4]) with mapi id 15.20.9818.017; Thu, 16 Apr 2026
 04:07:50 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] systemd: drop unneeded sysv compat patch
Date: Thu, 16 Apr 2026 12:07:35 +0800
Message-Id: <20260416040735.3563483-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0132.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::17) To PH0PR11MB5611.namprd11.prod.outlook.com
 (2603:10b6:510:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5611:EE_|CO1PR11MB5201:EE_
X-MS-Office365-Filtering-Correlation-Id: aaa35b93-4891-4bc9-b5a7-08de9b6db9a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|18002099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	Xn3zic5I/kd4+0AWy9Nwo/v/qAuxZ7yxQulZtVOW+nBeiDsvltLmIr/oBikXQ7cnMcvph5BkwZgC2Z6Mc9JlZvZup1PTQ9cCsfgySJavv23WSUe559exTvY0+2III8xtXGpgzEhU05k4yKCHjPqvWlofUmGsewBssKuc29vIhKKnm9botMkMaeeQ8s0Tee6api1zoEzocQchp3DfbCmscja7lNJQM/NzmqvkA8SpP6C2fzPWIU0PVjqx/+g9U7c2KbeyCUcyLkzCVUDiBVPGu5aWKFjimM/ktoBsoV/sao8/BEXNZ/3pqIbKeZPwM1T5GWoYIIfJzX1fkpEP0h7dxdjuAusZnYYDXbzbj53rmo9PefGoh4QDcGUnguUFUG6vDcWr8NTGJNRaWjiT6gkQxkVf12HayvcZQ1vcDPB7rF5lK5wvOkmYGwNWECy1C64jshZ8oXPbijm6swKF4UZMgSRwn81RicyMDuzOl7/ox7qzrfASqAa0EFSc8LUp+xkjWbURHQlojmV+VcJ+pkQxRE6+NsvPT6LsfoBjsIvU7ZayJkCBIQutVRZ2my3iP1a5Fy5sKoGpEq5/DYxvC4LQw02bTSR7pEMjr376OV1rwEtTQfL8v2lmvvFaRvkim5OmIsAl7/uOdlnDqXWmr3NCJfX8sLiYKggzhk+Y/tGqYALXdqBiccYznlXgHrcDiL1OoiKFw6bPBAVS2+yH1DSQeC+hIB6MqgdALnZD+mjlEzE26HJFZJI39YqKtISZO5QXtvEQ2MVyqEtN33/rwPVWvYL+VH+mpzaNCzq5KmphR1A=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(18002099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?fP/93DU+kqUSLb5N+LLPyd/1V2yD/PwlCOIEu9B9JCdY+SD7XsydS+yd3D4D?=
 =?us-ascii?Q?EqYMAGkGg/ufxGjyPIQgb8t+vn1sXsmv5YvozL3xUJBA+Vyn00JaxO21mgXk?=
 =?us-ascii?Q?oSmi1VYhdf3o4DlUKXm6KpuIpEf2WIx58ytuRs3Yi6L5Ch6kfLXID2Z3AnnO?=
 =?us-ascii?Q?BjnM1HzK33PQ/VuG+8L1hrv76MTJSqI5/NgR1T9yeFqJrQ/rmQ8OpalW3nTA?=
 =?us-ascii?Q?1QjlR6T1ybsfKg7OTSFG6VY7fiIMCiyqplws+3Dyz9IZ1y+g+e3OgOoPEpSD?=
 =?us-ascii?Q?wcSs6gac/n+m0jwv8lk6aKMrLXfSYu6XVBEGfdlHtFhaxilQ1qIHrK41/uIF?=
 =?us-ascii?Q?BP6pBAYSie9owOYLGVCfi8Pbf+34OzAza798UcUjaE7sqqz9snNwnK/gZ4FO?=
 =?us-ascii?Q?Gq5FKFAzVU/DzNhILBDGDX2JNF8tYJmcyZDNOvjG1+VK614saRYwNAANF5ni?=
 =?us-ascii?Q?xgW9J6Wr1xTGFUxehA6qsirF+a2FFKEVJSFEW62vUHEXABP6Zm+h63Uc8esy?=
 =?us-ascii?Q?QtWoJq88sru75r7xOkwup1PozKxcsS8SrliFLvMrXk2E+Qa2WDqkFsHoP1PK?=
 =?us-ascii?Q?FmZTfNgbJRvJXjBvad9Kz2fijhqWVOC8P7iyjriSG0BmIYNjiCt59McAPXq4?=
 =?us-ascii?Q?erwFiT0HGXKHX5qYYDMreS7lgpI+j+jst7t2i+IPW5ptdeoQVXnRU3waa105?=
 =?us-ascii?Q?0OLJOD65VNqep8lrX+vrMo6eavbox6NmOWWBQ/NXBf0gQaU/b7OBdRn8cSot?=
 =?us-ascii?Q?7wSKgKKikqrd360da8M3FLyOwHnAmnjP66mgHVkZTrxfOgkfUXP4UMLuBM8M?=
 =?us-ascii?Q?8Xa+Cn9BTV8xSKL10jWaidnhjhyGBKW+2Pod6+fXW7VgoqFyK3QToSgMRT6d?=
 =?us-ascii?Q?I6k0uzfb24/EwJW7NQ0BGwDEarb4op7O8bMklCF+6SLopslL4a7hVhMSqEPq?=
 =?us-ascii?Q?wtP9Dd8qdfa7YZYI5WMxwxqxchNcxMcrfgdqcoUNzON61zICcflfooPwAc22?=
 =?us-ascii?Q?TY19O+h7NY5Dt2oTraBy+zDVIbMySpvr1qbko+yuHFITadrwK5VJ0x72XX/o?=
 =?us-ascii?Q?SaVS9Vo2Y6OITl+3gi2hzAk7whX4dxfdT0EAdPivigWyzBo+dOhcoRWKQ1zF?=
 =?us-ascii?Q?6CRjfiAR/ZMTl7+0cyfr0YnxZrvqEjAknjS3L6nYCoS9wL8QaU0KI9jIyOBs?=
 =?us-ascii?Q?ps9ZFKOWRXkEI4if1bkUjH512S4IxkiVugSRUcrGmlhdRr7+a3jO3brObIbt?=
 =?us-ascii?Q?cJt1UIgxfTXd5eHBaGHWfIzZqmH8u44AALublGBUcniZBMPbq/wyN4TbRWNm?=
 =?us-ascii?Q?md6/upUzOcFxh9lMDmI7ZjRA0kJw/kxI/hIYT+9hNiPCubpcCkyL825AAqjV?=
 =?us-ascii?Q?0pmf/EW03VDttTzwD8syUOBshoRpFvOsoHkrZBqGHLswHHzqzAjchvY5ahLN?=
 =?us-ascii?Q?YY2yr7im2bzVUjOswAnaexRlUN1EE2CjAx4JtAhkPPgBoL9PQGiFdNVMwgmx?=
 =?us-ascii?Q?wT9ybjH3sn23ciXJTu+jk9/NVNwXZcTorgt+whH/rEtlT1YE/xEZKAfdNhX7?=
 =?us-ascii?Q?5p/eMSZQPgPrfxJ1aYJ+mhb2WK2ivrHz4Ttl8oYrKzn/hmWBxH7Zbxuqz6RR?=
 =?us-ascii?Q?IYmPp8/RrE0q1MEMbzj/qYdM+Jb2ntk/+VysTOoJJe06TBvKll1UjhLjXFbc?=
 =?us-ascii?Q?rahyQeDpN7biRn7eyLV9xMUBjy/rk9We95MDOgZSA5oxpQi0Em4CV/RX6Dvq?=
 =?us-ascii?Q?/V+1/d+MLA=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	RCZ/bCuhJRoM6FBa5TEaDMkjv4ItnAvzdJ8AqC8h61HDLfGBtqE5PYp/qeRcGauv+F9lpl35YvTAVnszJ1xrcRPHbBSGP/gqmzr5iS0p6x3WAAFptTvO0KquB//bBjAan0QIyGWvw7tmk21NfPBuMjcL9DILnPyqsgfyThXwHoj18nyshRV8OZtTkUGOJov9Ox/dDRlwBuAjCX8ciEce28dK0redYth2mjtSpCoaF2V3cw0qm97xZ0p1wD+u1xDUWqG9iOsFtKFXWif2QlW/AeOifjzb43CfF6ZpO9GMTMEyu5oqcy+kErJNVdsA5bbeDrN4zdcRh4fjot2S89JqAA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aaa35b93-4891-4bc9-b5a7-08de9b6db9a3
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 04:07:50.4133
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fy8HBfLO4vL3rqBWhPJnxfldw3h+6HqgkPXz4WUK9D7LJnDOq404bNci1N15WumhcoZIek/Uw46QFUWZeEgR0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5201
X-Proofpoint-ORIG-GUID: xM0X-pxsygofLMvmEaY9_4hWWv9hzEM4
X-Authority-Analysis: v=2.4 cv=ZtHd7d7G c=1 sm=1 tr=0 ts=69e06099 cx=c_pps
 a=TqpEWdQu6X+pWU0GeT7YGQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8
 a=pGLkceISAAAA:8 a=5kt-UXRuMvd9_DzCxTkA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: xM0X-pxsygofLMvmEaY9_4hWWv9hzEM4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDAzNiBTYWx0ZWRfX09y4BUy8vur1
 yG2sVLX55xVz+WgAcF3n90lluJUHqiee2oy1DQNGLTzBMgRFjrU9FrQNYJfkkanoqelm0fCJHmH
 bJprAJ3YSP9pC1GC37mnCwEDZ4C35rjF/s2EbA/rLzY9b6hGPIHck81JypffRsNNvOv8YWqULpI
 lcYBrpj5PDn4JGSeOG8x9yHSWhL2LJuxu85+7Ejwb1JoCAFItXi6p46q0yxZLTDU4S4ToDhFXZt
 UXmu5OUSYGPFWT+QkDQt6m/Qdcx41RaSvUHgsb4DRgbec5lUFdFlA2r0/AEYdo34WtbJjJfZLpz
 +6i9WbxJqMWQ3JQBXwDlI9HQDHcV2abkN4aIBncj7HjLXUYEN5CtDLDfWzcz5n4PurjhqtkoSQu
 Av9jQkPDdBhUmJRiFDCqEXQedl8Kdz1lKH70B28aZndcGc36XT3K10B5TGvzJpvTwUvUxSLPfWl
 +bfF3uaJ0D7p0tg/+3w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0 adultscore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160036
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 04:07:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235332

From: Chen Qi <Qi.Chen@windriver.com>

Our systemd is not compatible with sysvinit any more. So drop
this sysv compat patch as it's not needed any more.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...implment-systemd-sysv-install-for-OE.patch | 43 -------------------
 meta/recipes-core/systemd/systemd_259.5.bb    |  1 -
 2 files changed, 44 deletions(-)
 delete mode 100644 meta/recipes-core/systemd/systemd/0002-implment-systemd-sysv-install-for-OE.patch

diff --git a/meta/recipes-core/systemd/systemd/0002-implment-systemd-sysv-install-for-OE.patch b/meta/recipes-core/systemd/systemd/0002-implment-systemd-sysv-install-for-OE.patch
deleted file mode 100644
index 7529abe668..0000000000
--- a/meta/recipes-core/systemd/systemd/0002-implment-systemd-sysv-install-for-OE.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 08ab9f1eaa86ca2c6a0bb45219a0153495708acb Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 5 Sep 2015 06:31:47 +0000
-Subject: [PATCH 02/16] implment systemd-sysv-install for OE
-
-Use update-rc.d for enabling/disabling and status command
-to check the status of the sysv service
-
-Upstream-Status: Inappropriate [OE-Specific]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/systemctl/systemd-sysv-install.SKELETON | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/src/systemctl/systemd-sysv-install.SKELETON b/src/systemctl/systemd-sysv-install.SKELETON
-index cb58d8243b..000bdf6165 100755
---- a/src/systemctl/systemd-sysv-install.SKELETON
-+++ b/src/systemctl/systemd-sysv-install.SKELETON
-@@ -34,17 +34,17 @@ case "$1" in
-     enable)
-         # call the command to enable SysV init script $NAME here
-         # (consider optional $ROOT)
--        echo "IMPLEMENT ME: enabling SysV init.d script $NAME"
-+        update-rc.d -f $NAME defaults
-         ;;
-     disable)
-         # call the command to disable SysV init script $NAME here
-         # (consider optional $ROOT)
--        echo "IMPLEMENT ME: disabling SysV init.d script $NAME"
-+        update-rc.d -f $NAME remove
-         ;;
-     is-enabled)
-         # exit with 0 if $NAME is enabled, non-zero if it is disabled
-         # (consider optional $ROOT)
--        echo "IMPLEMENT ME: checking SysV init.d script $NAME"
-+        /etc/init.d/$NAME status
-         ;;
-     *)
-         usage ;;
--- 
-2.34.1
-
diff --git a/meta/recipes-core/systemd/systemd_259.5.bb b/meta/recipes-core/systemd/systemd_259.5.bb
index 6987d4ad54..3d63b0eefe 100644
--- a/meta/recipes-core/systemd/systemd_259.5.bb
+++ b/meta/recipes-core/systemd/systemd_259.5.bb
@@ -31,7 +31,6 @@ SRC_URI += " \
            file://99-default.preset \
            file://systemd-pager.sh \
            file://0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch \
-           file://0002-implment-systemd-sysv-install-for-OE.patch \
            file://0003-Do-not-create-var-log-README.patch \
            file://0001-meson-use-libfido2_cflags-dependency.patch \
            file://0018-shared-fdset-add-detailed-debug-logging-to-fdset_new.patch \
-- 
2.34.1


