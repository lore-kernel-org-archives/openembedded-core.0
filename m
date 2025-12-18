Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28C91D68BD1
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 02:54:21 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32668.1766026451644245401
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Dec 2025 18:54:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=QfBhWGu4;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=44473ad742=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI0Utl6178689
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 02:54:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=pLomYWlmE2AZPyvgm3E1
	2Ik5ZDbb1wzX347eX1nG/Ps=; b=QfBhWGu4LzAP6TSpWw16s1/8KUh8By2Ykx6Y
	TTYFNk/+VAKuyVF/znLNBzcaJbhZHEuRvBxrTHQ16q1cyboZ5I9V6i73W9C0y/tB
	DxJP7wW7zpxjfQa701eT1h0EUTASVqTnnWbX6ugQKeWnMJ2lavzeb4X2G2URg8yL
	/RHHaz3RHfvxTws3lAAjphhVn73Sf9/sz6796VORSl2COgGl8D9BAvKZIiLJcqnK
	nZ5p2BginZJI+Tm31+xqN7YKJMfRTzNz9KeRqjSkrW5lw3VwfOZppnAIf2kQ0Sq1
	jDBpbr2krXfG4dyDW4oJD6xqiUzJAMQX2G4E1DhDa3pd93H7uQ==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012021.outbound.protection.outlook.com [40.93.195.21])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b3k0bsdrh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 02:54:10 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y/7dkBqWicr3TSkVba9t2LlMvhadO4ivzKoyFAUJB7hVkk6t/l7lmqTdVj2UeaBG+9JKmfFb1QaaCfhQpjrEWCz+0DG2JMt6gFwY0R/ITn/aC3enZtjFrHuDJ9bN6lvlj9f+EdnwtWlhFMnsOciLTGPTYq6L58dMMUANN+ztl4iBFgafsoZjHbuQzrwcDGRL4xIMaX8LNSSnGs03i53b3QS7ZXIfKQZYjxwwYbT4OsPSsab1+aCbalcgK+t/LQhno4B7lM8YYEnzJ/OVfHCwxdunjZY2E13ump1or8RbrAj07n+qJ4xJWRLxm/HtGFT4Ijno51yizM/tV0oHoKdHPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pLomYWlmE2AZPyvgm3E12Ik5ZDbb1wzX347eX1nG/Ps=;
 b=u/MsbMpZKp7euj4yu7E2DfWUI0o38L5KV1JgxmuGXVLdYaFbrzhoYrOJVsW4PRwNg9ERKMPHke0Y1Qmh40ZSbKnBYrZLZlbQjVykmt61Et3LPC66XjJkxzh13fTJzRxKnOnORB5tB6u8WCPDy0OirB9ZrPJ7d/Qvmt/FSr8UZsAaRe7g9P6uXrlMl/KJn/MSv3aGDqoYqklbIsovhKBNuOyE3Ooy9ebL8kK9dbJNdrMTbcOp8CcDCeIXBi2Lfvri+Oo562DRUpq7y3MyvpOL9/+fdIele5udxOnQ6+0feFoHqf49TyHw1/eDFbgrmOmpGuJKg+MdLUFMOaGBSY+hdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by IA0PR11MB8380.namprd11.prod.outlook.com (2603:10b6:208:485::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 02:54:07 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a%7]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 02:54:07 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH V3] insane.bbclass: avoid unnecessary rerun of do_patch
Date: Thu, 18 Dec 2025 10:53:51 +0800
Message-Id: <20251218025351.427853-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: KU2P306CA0022.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:3b::12) To PH0PR11MB5611.namprd11.prod.outlook.com
 (2603:10b6:510:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5611:EE_|IA0PR11MB8380:EE_
X-MS-Office365-Filtering-Correlation-Id: ceaf5656-b27b-4b66-ccc3-08de3de0b634
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?RMupaVv+6qgvUb2byUvWviS9EMiSQif2/yZxRMBM0p7zimsGK5Rtz2E6d7gf?=
 =?us-ascii?Q?KqojL26ob8fGCUyrFvhGaqwxNJNLETjW/HF/pkDPX5IyQlHiPXcTzpuUolgb?=
 =?us-ascii?Q?evw1f+adF+XMkeOuAQ3jGYRL9mB62PzEtquTxZELYIJZfb+QCcQmDS5M5dgp?=
 =?us-ascii?Q?lwxzPq0rmYebh1pIDYZ57hIJNT3PgGe93mNBJt0D87MLL2+Mn0rk31TcjJBW?=
 =?us-ascii?Q?tU5B6a8lvLgJZJQ66LQifE3P8uu55LcGPBZoKq/LLySKp2zA9vMEPNfJcaeO?=
 =?us-ascii?Q?ej2UOn7LK8Me2TG+6ca5eGr5S6MWpgfEzobtav5Ycytmwt4Bux8JhXxXbIvo?=
 =?us-ascii?Q?f7lM/GHWSoAlUZYAwuyEd1JtiDTSiFWgzD5vgbng0dwub5C6Vfs/PIzfgc/q?=
 =?us-ascii?Q?kSSnvn6qrz/WObFyUOYQI6TCaV1O5HFzknSGobRXSn9mINU9yuKXlRfhizFp?=
 =?us-ascii?Q?ash12/WXWvAuwGLSQI5pnPZySEVomLOZarPG/2T+OT6S35hK/D4YcXlhffkB?=
 =?us-ascii?Q?In/IEVHG13ooJFVv2SYBNI/45I0YAHmaQ8/U60gWIU3rvr8qhjNABqfQVS9c?=
 =?us-ascii?Q?NyseT+jDDlTXG1Efr8Jt80TKTVVvj3PFdHmWH1X8jbWmPi7WoVOfPswCMBCP?=
 =?us-ascii?Q?AceLRtOI42fby7hQ44eqeLIeQfdL/esitMFm/zfLeuYHm4fISP87ocqg/fGp?=
 =?us-ascii?Q?QNVKA7DVtjFoNEciMaOHNfQ6gB/x2pisA9vDKH1LVf6tLNLZU27bzdIyZq20?=
 =?us-ascii?Q?BU00KB82/i2QWfveZyYu0KsIeoWu9RxvBrZzKxzBDXulYTUvHw7S8OdEHAXK?=
 =?us-ascii?Q?Bz1RgVnbPgWICijtelhMW12W9R0A8Xy0PaZdQc9c+KmBgdOqpnSrESH6HK6X?=
 =?us-ascii?Q?Z+2noUcZyK0UfIWzeV07QHUFDYJFPmQtSJwEMYXBMU5JgORjDijGqvYXGijS?=
 =?us-ascii?Q?jKIuWspKK6zLVXednP8YBUHmrBkJ2llglMc/72/liFAzxcyBBayI5CXBEFKm?=
 =?us-ascii?Q?QOzDvWNwmlM6Nsto3a1rLdfBqbbn2UCMfOFPFIDNWRuPJ5vwqLHc4he1WqKq?=
 =?us-ascii?Q?SHM4MJ+07PklqEDN65Zve6lemH3lA2AIMzVohfPBRlbskogSiukduGXBO6Hd?=
 =?us-ascii?Q?BKik6Nn8C+GagjQVr+W3krT/vQKnWaNSeuJS1b4Yd7PoU01HgqOqJiJLPabP?=
 =?us-ascii?Q?jBjL3xOz1XGCSvadrZziFPnck33uj1tH+u6f4HXBaRoRm4RGbn7gFVfLNq8K?=
 =?us-ascii?Q?bDwi8Q7az+B7wLIp3UrlSeZXpi1ACKBMxQ5K44MrY3G7qjUbtrts9ZfExjmo?=
 =?us-ascii?Q?aEXdEOMfg9E84z0K+cNi2RF402090VyfLd87dghZcjDz2r2iGPdsIH6q98LA?=
 =?us-ascii?Q?cZhycXlEIt2iWQKXsWm1FBnQ4BF9jNbNjAtwPFTf37mIG1Uu88MkohsEv5v5?=
 =?us-ascii?Q?9LhjKFVdT9nNhDzLUK3B92kPxGILgbPHghyIK380UaU+XHwmmOoQwlpXp6Z8?=
 =?us-ascii?Q?HgWFfLk0dOtdkKw=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3DNI7FqRbpeJDnwRaG6BLQsdBoB19d2J0WPvF/FOgKMpjiWYeDj/95LBlDme?=
 =?us-ascii?Q?h9pDJTNqzEcW9BOnRhGFaFmqztcw1Odkq5nQNGYtnhpDsjs3hQ/k/guumDAz?=
 =?us-ascii?Q?UiuEWIzvJzLoRr6geUDMbRg9gqeqkuBHVVTtRmUEnqAAssmZg9KWHUzlmYzw?=
 =?us-ascii?Q?PIbxnaS+PqpEfSuQxV6fGH6nsxp8tLJJFjyIIixIWn0vaHy0GetaplwYVace?=
 =?us-ascii?Q?WelA0zWV/JTsp4cprz2NtooH6+uXPNefuyED6scoiuJtuYlN/WFM7pf2gXYn?=
 =?us-ascii?Q?KXzikfQL5cCdwSDd3CtyOTET0vucPwIMd70VmImdXAStEgAFdeObGPFIVs1E?=
 =?us-ascii?Q?PwKtkqw7B2WXMmjVWi3G4iUd71enWgsGgrpCFVUbsv1r3il1lScjhy+0PXsv?=
 =?us-ascii?Q?JJamYf4A9ttSKVGurjC/K8J1wyCHk9CPJS720+34jTuP3jFGDnLIz/XvUcZ+?=
 =?us-ascii?Q?nZdyWk5S3B96fkk/bsV9zhaNFZy4In5ZCKmzRRpFhSBSDMyndBBCiHPun2BY?=
 =?us-ascii?Q?VfK1+N0qZrsvkE78OsO8ArlVJQSXqNruwD77fAtfjjzTpRr9e7Q4T4nLoiAV?=
 =?us-ascii?Q?pvhqE1rnpY1esfJbyPtM8Qd+TnOK7wdHfZRjlibTXZDrKwlvf0fXC5JqWHTy?=
 =?us-ascii?Q?WqKyTSZrTqyKM6dwylO4N08/L3rup9jtjZRwkv/I3noG5kqXQ0gma/f9wemp?=
 =?us-ascii?Q?MiCSEKKpq4T3fHKgAa9hMo81qGRE1ZfGqSZ/OEwGzRMKRxrgQok/kGR2DdKM?=
 =?us-ascii?Q?eu4tQ0zP96lH9rJpXfGOxnm6pkhM5ppf6ffabO1VSdXBpL3qsYzDvS0Vc17z?=
 =?us-ascii?Q?ew1H55YwxaxkbTRkknc3mDsuup8lkdpez6YQktUqAA1LAiSb1SGFhX+4VDhM?=
 =?us-ascii?Q?blRbq36ekIJ5nvQoXus4hx9P1Woc6fKSY9z1o10ALAzN4FA3SdHcRIP9kivO?=
 =?us-ascii?Q?yUsZmOk7LYvoqsEShysBgQKoc+lhnsuJnEmawgqzE6rZr7KXVsNxrVvaQzdv?=
 =?us-ascii?Q?0CsssKNZQJ6AxTHkdig5keJhncuvVX+3m5eAyyFxAh925EtDeuhh65BYn50V?=
 =?us-ascii?Q?8jduh8n/Dhw2u0ysRL19EN6j62F7m4v/ANn4dJIZ3vRjAqPNUKYzsZ0ElSo4?=
 =?us-ascii?Q?MLlVz75OtjefMnLkp4ayCo8zx0gVNgi/GZu2B3zkItcr9p1BYGf+C2ZB/M21?=
 =?us-ascii?Q?GUI4F35cqY2qzLFKx5J6u+f1Pcj69UlDp8dYvgQ0mT0PepP1xwRwqM03khSM?=
 =?us-ascii?Q?lCpUeZkYPG2lkxg2LrZcH9BqdTZH6s5t9i+J4g+gmvGqITpjXp3nGwlyn/xt?=
 =?us-ascii?Q?QE+hp5af3Cw5ezScJRYbQKZZn4vBX/cbfEo+xi3Lknz+vGdv6/AXgzYB/YfO?=
 =?us-ascii?Q?9kzu/fA9QkO2BoOaEcedPP6Zc6qqU9iXng69UthtO2FEAJBhNPxzRw1J7BYt?=
 =?us-ascii?Q?neVXqasaVWdJ8Vrx/8JesfBCudxIungAReT0FE/WpoatxmvrY4kTzLTFKEqU?=
 =?us-ascii?Q?EeExJUuEfzKwFyrQf2+ss93m2H1Hns0hV7tM1fVNqoaPtlnNETygg5UF799I?=
 =?us-ascii?Q?cIPdMtCTh6INSLinwCILa7xJrfhwuJM6inzlJCzO?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ceaf5656-b27b-4b66-ccc3-08de3de0b634
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 02:54:07.5308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sy9reM0xfCAt9RcpIWW+mdz3oTtunVJz8usFqQBMH/4uEwpTAi7Q+YZig/FEf/NicTiWUZ+rt9IL4Fbm5mY40w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8380
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDAyMSBTYWx0ZWRfX5UeOEyY1WxNh
 UCMMyo/lspXVtx40UYoRyCiAezGj8ZzR0SbipRPLytVwmr3IJhV58ikWjaBDSNaeBZN851DEsyB
 fZ07uez/aioObkb/YqkFXt5e0UKL/7hW45cAdxCujqOZQhG7+/UPYNGdJASKh1rBG1cPs9DiDer
 6QENTQNbMEoHjuhmTFaKDJTZPwO3dBX/ED+upQPjJcXX060D2gfgocWtjiSZcmIRvURO0qCyfwi
 2aJs8OFVFWWJHTTXkkWUamf0KdooIPEyZVKQB8DT1MaEDfIcpT7FlrpxDihhECxufPn18Zw1vHB
 vpvLt+e42K52wKOSula1VUCw8YP62Qq4vpCgV9PYl8LniLVFhq/9BXwphUYR28Oxmh3P3ld7Bzl
 dFvCy31Wn/tMx+lTctcmvkpfg1nsZQ==
X-Proofpoint-ORIG-GUID: SmbgQXpIGrUipHU15Gob1ca2H6qqQ7IS
X-Proofpoint-GUID: SmbgQXpIGrUipHU15Gob1ca2H6qqQ7IS
X-Authority-Analysis: v=2.4 cv=C+HkCAP+ c=1 sm=1 tr=0 ts=69436cd2 cx=c_pps
 a=Okhg0g0iqq/spNumFXwzOg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=jGvybPemh7eruCuoEQsA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 clxscore=1015 suspectscore=0 spamscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512180021
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 02:54:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228080

From: Chen Qi <Qi.Chen@windriver.com>

When toggling ptest for DISTRO_FEATURES, the do_patch function
gets rerun.

The dependency chain is:
do_patch -> do_qa_patch -> DISTRO_FEATURES{ptest}

Such rerun is not necessary. And it's kind of annoying because everything
gets rebuilt, including cross toolchain and recipes not using ptest.

The ERROR_QA and WARN_QA should be enough to trigger the re-run
if unimplemented-ptest is added to one of them. So remove the first
check of DISTRO_FEATURES on ptest to avoid these unnecessary reruns.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes-global/insane.bbclass | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index fed8163c3e..aeffee7983 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -1305,9 +1305,7 @@ python do_qa_patch() {
         return False
 
     srcdir = d.getVar('S')
-    if not bb.utils.contains('DISTRO_FEATURES', 'ptest', True, False, d):
-        pass
-    elif not (bb.utils.contains('ERROR_QA', 'unimplemented-ptest', True, False, d) or bb.utils.contains('WARN_QA', 'unimplemented-ptest', True, False, d)):
+    if not (bb.utils.contains('ERROR_QA', 'unimplemented-ptest', True, False, d) or bb.utils.contains('WARN_QA', 'unimplemented-ptest', True, False, d)):
         pass
     elif bb.data.inherits_class('ptest', d):
         bb.note("Package %s QA: skipping unimplemented-ptest: ptest implementation detected" % d.getVar('PN'))
-- 
2.34.1


