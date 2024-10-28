Return-Path: <Jinfeng.Wang.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28ED6D13597
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 08:04:49 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.46414.1730102687111944024
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Oct 2024 01:04:47 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=003180f0fd=jinfeng.wang.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49S5A2rs009481
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Oct 2024 08:04:46 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42gqd8hydd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Oct 2024 08:04:46 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HTq6Jr/i9+6NB8660rGuppj4pdKrJepIHyQLLhAoPa1MANxOgaUMwbT/H1ziGDqhQ7ZuOXyEXlFrRNJfl7koNRYK6eFbu3eXrGE+UZx//jS7h0dv4Oil76w9SoeTjGG3Vu7ZIj5rOctaiT1y5ChnJzArLN7ZXCMZ6YZpyJ5exAqzeDDmailCNeWpxG6QBMMUztKovYLn/hzGOy/d0GvcnMbwO264Jt0zjrEVfVCLSYXTBZsg1k9vrLD4ZYvuHz9cV39WaQfIjjG/PByEpzzJJzcUTAx9z36rk5phpDOpGytwXFAttmL2gqR6TRpV9hzmTQXFk2PoNilTFGcs+vhfyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jjn4COp5rTUUpFD9b9QK3mCDsBmikgSyqD3WFS0I3uY=;
 b=MY5+4kY/9TbgBCYd9W1m7cMrsGSH4o59Hl8Oa4FS6I0BTWCdbwB4jdPEp1cASjHECLBxZH3BftcS/hgPOh1y52tLBToR07uupJtoMXxlfOgj59EZYEnDnBOnamDhJnaauX8/e1i4G55tu1j8ocVDfmFx1DqQhxdomyjJ7Sbls360eFV4K3qHe1+tpHmcPkEB0Ovhx6oajt0gp4jaD93evGbZUZ+LyWpDNFl3wYO4a+iR57fWVmJzgVjHDyrJZWmuY0yBiC3u6TYBTxO+R8tJjfPKoPJuizQYP9o91OOay5QwFFVSVxmwMZf3q3FEKsj/oTmL1b2QexILZJMzUlUSAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5533.namprd11.prod.outlook.com (2603:10b6:5:38a::7) by
 DM6PR11MB4754.namprd11.prod.outlook.com (2603:10b6:5:2ad::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8093.25; Mon, 28 Oct 2024 08:04:42 +0000
Received: from DM4PR11MB5533.namprd11.prod.outlook.com
 ([fe80::8ce3:74f6:33ca:3dfd]) by DM4PR11MB5533.namprd11.prod.outlook.com
 ([fe80::8ce3:74f6:33ca:3dfd%6]) with mapi id 15.20.8093.023; Mon, 28 Oct 2024
 08:04:41 +0000
From: jinfeng.wang.cn@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH 1/2]v2 tzdata&tzcode-native: upgrade 2024a -> 2024b
Date: Mon, 28 Oct 2024 16:04:24 +0800
Message-Id: <20241028080425.2232475-1-jinfeng.wang.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0088.jpnprd01.prod.outlook.com
 (2603:1096:405:3::28) To DM4PR11MB5533.namprd11.prod.outlook.com
 (2603:10b6:5:38a::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5533:EE_|DM6PR11MB4754:EE_
X-MS-Office365-Filtering-Correlation-Id: 57e27309-f051-4bfc-524b-08dcf7272d30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?5xRi+M6dbCrKEdAHjIRZYERk7+i1OMnNUFHBapUONdLsiOe13bMWNqmcFshO?=
 =?us-ascii?Q?/OclVfP4aWld4BH8c8jIKqn9LjwNB5XYQ5zN8cgsXCBt3T9E5n0okK3lp9uT?=
 =?us-ascii?Q?Ho2Jrin08yKOtVOzv4Oa9rfwEY1dhFqevlXy5Mns9hH9iIwprClYQsLfxB4P?=
 =?us-ascii?Q?VLgodnvy1yRY3k+zEk8BV2vlEUE3qzDTUDiIGQaXVzT47MlAHIqFEMmZzrmr?=
 =?us-ascii?Q?/c7MhtApzPo53E+qrz3Kdo/9KiR0n7cnLRkmYOxw12jjXSSfsdmRNsKob+Lb?=
 =?us-ascii?Q?yNxB9cRiO/40cDNLdQacbqzJ7fXX2rpx7paLX3rveRHYBcr6XW2e6umKUhxW?=
 =?us-ascii?Q?+o8RdUwqVxG+YckCQOdZ8ryiDRO3VRBYa3O0WAeK8VJIT4Dvrge+p/KpE7JC?=
 =?us-ascii?Q?8v0Z8QbEoORX9HfNSd9kMPFOXrf7uZecei63ZRPg4fJ1OWOLQm7eooJDi8bM?=
 =?us-ascii?Q?H/TTJxUbV9DARlnK04ofJgl3J8JEgDohgn4cnlR4iWRv1onjxjj4KKD9QiZT?=
 =?us-ascii?Q?TNtPmki4kfEUMQZvuizh/0Lh+MoIyRgBqJMA8JPk94burbOEqmGvl/MHCARN?=
 =?us-ascii?Q?5rlrX6saM7LBQx52bTTjhvkaU6bQDECKYFyEIS85Mjr/EPEp/Yy1kcBBHcMf?=
 =?us-ascii?Q?SDIS2FDU/IGb5QMA2DCGwX5BZkPY7HeyZqi1LBtSbqe6T71xCsGsQxSJ39sb?=
 =?us-ascii?Q?OcDVeqP0MD+0WWFlqG78/72LidyZqd7iigR4APp9CQZxv6L7OdOI2dZ271lD?=
 =?us-ascii?Q?pExATAzPMHctxPsmVDEZrlQFZHclKxwcbFTsjS9q6RjW7aFJUy7OTo52wxuu?=
 =?us-ascii?Q?ihq9QxgM8xoPVmcSavVNjgJXv8RExJJIT2REMEAnVG2CyO/TJHdIfVR4SQ7j?=
 =?us-ascii?Q?L8xv4p7rT/+Dwj8iGMfA4y12zTo1VXn8qcmHCkwXOzzT8/4ZiiIgzqjbeOfC?=
 =?us-ascii?Q?e3QwAeImh4A31qlW2UL9/jnmEyw3NtpxBULs3FkDtsg8dOVUWAEum3gmtNz2?=
 =?us-ascii?Q?M/F3WJlGvhgHnzOpMUMiB/KiJme6/2KF885IU0xCR5AhUunT3UdwH2+fc5fQ?=
 =?us-ascii?Q?wbkI082uaM0Ilagixn5jpv/cNOsUVvwOAfp77lPmxCdepNrjffvqylgTYXfV?=
 =?us-ascii?Q?0Dwldw4DvabGKC/QDaNjpF7s4U+KCmxi84rPsJ/Ga5NQbEjuZNlNsaDiQW+c?=
 =?us-ascii?Q?UmqqkFyPY1eEg9Rys5pBqJO4gjAaSMjYnJ944cxXOQvCn/aUX+5Lbt3MXilO?=
 =?us-ascii?Q?t51iSTZTSbWgS+MCAky20ZmVEjYcxbZ4wZGm/ekGEcW6mVFScp+AfxPHCVX4?=
 =?us-ascii?Q?dBYnzh6niVSj7RCagFwPDD9FgiWdOaDa/K9M+xJmGLYxDxUrGyC2I+YI3A62?=
 =?us-ascii?Q?bpO1wFq4pKmnbc9Mp0A/hehnR7Aa?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5533.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?KFqw9LeARephw5EJ0a5R/cpUWuyXe2gqwxRktlkjrYJTJbj4aCY2j9vTjDvN?=
 =?us-ascii?Q?8UsAUn/B3qWpl9Odcd7dtUZDRLF5ir75YaJSkrRIHhyQj0VyNAUADXAx6Egh?=
 =?us-ascii?Q?VhPDKa9H6vWuRdQu/SeTFqwHgUlpd1plT6DyIF9m4o9fKqpyu0ezbuNJ/L1Q?=
 =?us-ascii?Q?1rffNG3pN6oHnjYAGcGn/DKyD8jKb6dOLeVMTEfjoUrZQKkpAGyq8M/udFgU?=
 =?us-ascii?Q?pJrlOPMgHjPDQWIdOzLFxyCyLA62cSpVHqLUWg1P4474KrV5JzuW1apUCTcS?=
 =?us-ascii?Q?fVp6xQm9NjSNhbb56CCcQlBc2vt5+4rpB1ojPi6zTYM/ODYhnKVB5XO0mi6J?=
 =?us-ascii?Q?LMfA38oW6hcOCfvmhfyhxsT1yq5zv8wob86h/GLpYlZbPNMb3JqPqRIwoKOe?=
 =?us-ascii?Q?NwXUky0uHnyKQ/VzgVn0hVr/PswnWT6FaZ2GL/decKioLpMl+9KEdNlOr5AN?=
 =?us-ascii?Q?m/RP8WZGsw5U2pFFpd/C2kiNebiPfhy+T/Ogowu9IQTrDy6STZ+9ujtB7qCR?=
 =?us-ascii?Q?LVazoHIezUtsJzCVRzy15gLg64rJXh5SdYFlnmOV2pelllCT/ULO15iByEye?=
 =?us-ascii?Q?POcsHpbsk1mXqbWNsK3nBErM+KfVm2j31KkHiSSku187ae0KSCARSc+lUYai?=
 =?us-ascii?Q?8vIH2B+FUXTGxO9+ZqlSRcFs3uT4dE0C/5smEO1MyqNczgxlUedY7A6tT+ul?=
 =?us-ascii?Q?/j7C9e89PoYwzZBKMOwXDE/2J4b6o5gFUv+2dPB8F2hJM3r77BihIDRH1npf?=
 =?us-ascii?Q?EH3XT+t6E86dvZ/7wt7Nr4I8m0jorKBocwggEx1OgSSlKj1YDUbPdaQSNcdg?=
 =?us-ascii?Q?sBEVEUjcNXBgBR3Lr6rU+G0BxRbHNsln4wyG9Dz+zibhyOih/S4hcFLa8X8m?=
 =?us-ascii?Q?i7NwovQZdyXUiakEUIxAcfsZ4fbia/KmJJpNEuOEuU/GBemLD2VIZiv0RJ05?=
 =?us-ascii?Q?V8A1MFbgjc1G1Fg3hfo2z0867nb+3rRunbJmWy3uh5qoZJ2chKgNttszwTNU?=
 =?us-ascii?Q?2Ftha8naUV1x1QC3SQEhEemNszjvNl8Y3ySXymp7ZuwDt8eyEHLsgr3sxFf2?=
 =?us-ascii?Q?bgYE64/mJXCCwXxIGu+unDaOUcETqgz0Dnpz8jJ6Uuo3rSOSq/jMWCRCpVKh?=
 =?us-ascii?Q?DqzhHy54Q/iA/EQ6kdhozhsf6m7SDfxZ1gJeilmfLxwfExFjbCjDkex0n6Oy?=
 =?us-ascii?Q?zgXYS/2/3KPf/lW6b2ffth6fknxzto2d3VkaTrW/sBOa041ZAkCbypBnDqfZ?=
 =?us-ascii?Q?sr81wH7oDV7TLB/CJxlTZqVwbUM2XHk4lVP6LpbTV14VNJ4Gsqwm48pfWRtA?=
 =?us-ascii?Q?sx4nEfjfUsHe8p+NxWw6TXsnNUuGCBn+XSpFPfkORzO5++Abv8jotOnb/n+h?=
 =?us-ascii?Q?JYKKBqz85CqbotRUr5oyjw8bGMtPprrufC2lJvdvctt4Dnu0E92P8ReKKFjx?=
 =?us-ascii?Q?ZIijrd715ZiDDMKGoDMFInIRPUy5/SrMoxfR3j/eJJv1ZH7uRysEfYT1d8eH?=
 =?us-ascii?Q?YnRWnisII7QgoRJNE5tBHfRm8KHt+3DJjuh3PEv1PPLny/ULjuHWgUN1jF8P?=
 =?us-ascii?Q?Yq1fAKsjaIfLrrJedFxjYFnnlWRjuvcN5P4qrwhG/4kn1f2qVANZcZbAhJOx?=
 =?us-ascii?Q?kw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57e27309-f051-4bfc-524b-08dcf7272d30
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5533.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 08:04:41.6558
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uUgeJeL1yEUOLkYBcTAn7Zz7YZbNeebAUYFZsoOlQ8UVuwzF4nc6eyyZeGQvZ0YftVMiwo8ctugaexaYr03dT/h6NFJWLgJOg4ktYg7fmK8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4754
X-Proofpoint-ORIG-GUID: Ocn31k788z99AuZ02a3Rh7v5N-_MFMeX
X-Authority-Analysis: v=2.4 cv=dKj0m/Zb c=1 sm=1 tr=0 ts=671f459e cx=c_pps a=oQ/SuO94mqEoePT5f2hFBg==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=DAUX931o1VcA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=I0CVDw5ZAAAA:8 a=vEEcL3scq_NeQSkCwNIA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: Ocn31k788z99AuZ02a3Rh7v5N-_MFMeX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-27_08,2024-10-28_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 mlxlogscore=769
 adultscore=0 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1011
 spamscore=0 mlxscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2409260000 definitions=main-2410280065
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Oct 2024 08:04:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206422

From: Jinfeng Wang <jinfeng.wang.cn@windriver.com>

Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index 4734adcc08..adf095280f 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2024a"
+PV = "2024b"
 
 SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode;subdir=tz \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata;subdir=tz \
@@ -16,5 +16,5 @@ S = "${WORKDIR}/tz"
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "80072894adff5a458f1d143e16e4ca1d8b2a122c9c5399da482cb68cba6a1ff8"
-SRC_URI[tzdata.sha256sum] = "0d0434459acbd2059a7a8da1f3304a84a86591f6ed69c6248fffa502b6edffe3"
+SRC_URI[tzcode.sha256sum] = "5e438fc449624906af16a18ff4573739f0cda9862e5ec28d3bcb19cbaed0f672"
+SRC_URI[tzdata.sha256sum] = "70e754db126a8d0db3d16d6b4cb5f7ec1e04d5f261255e4558a67fe92d39e550"
-- 
2.34.1


