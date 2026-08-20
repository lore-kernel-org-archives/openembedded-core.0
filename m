Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49812C5DF87
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 11:54:20 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5250.1787225957937268440
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2026 04:39:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=NKeK9F+f;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2692c8c704=ghanshyam.banaitsanjay@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K4FglV922743
	for <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 11:12:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=1QlCwD6gypyHFLa/lCF5
	KzdxEchj8AhjP0mMXuQbKeA=; b=NKeK9F+fC8LegUKDNWbselDggMoq1vKiYU4N
	rwi4qOu6hSDa+2k7VtpUJpn3V1wKOA3/u4Q3gp691zIAIYczka18dirjGJWk30Jp
	FWs0bHNCrLjHZEtA1pkOH98oKgn4sKAAp7Aujsh4A7YPBvBrNjldsgwyohhmqqyu
	QnozW9jCnQCmgijjMY6xRSWkezMvhmLM7rKNOTpFUBe57uup6lc1mC2sJFwcM3Z1
	5mhERNnsBWoHSByQnMTRIjm1hEn4q11sXsF4P4Cv/pbQNmj0lQxybUT5VCrnOVeg
	wznd078PYTF7pIHhr6ftfzsJEPuYRtn2m8ETbe458kyqyWniyQ==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023137.outbound.protection.outlook.com [40.93.201.137])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4g4yd9jxhx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 11:12:39 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tURpz4d1CJHj2PCHcHswV1yb9sYwVk6GwT0v79ndaiVMpd0noEm6QFVtBKhzHjU/ooniewFYxF+itg+0G8RxW9jNuqKKJ8FSxJm3hxGCNYWj0XoYUp1cf6iF22kTWZdES9F+bgTtxw4g7m8yc/0iaDFU6WbMFKMMqhUHkX4MgkwE5cB7gKoOYdbpYX7ADL7ohgCFY/YfVA+C9+vsgnnLt02UnIxG98nv1//qVujNIjaO3RhtUl2tndAyweoFRnWVtc6lngEiCsDML/0pnl10a/A6mRKWOdCQJ2Hl+bMk0yBpxyzGg1q0z6V//QQT+ioDuC+J6rr9nXGNCeolvDv3HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1QlCwD6gypyHFLa/lCF5KzdxEchj8AhjP0mMXuQbKeA=;
 b=CAOGU8ikwmGXQSyFQWENSEZ+pKfP25gWkCAC3+1jTUJoLQ8iHTRRMyWyG0TFxzoYr3KV6IIz/wWLzCwXPczclgC0QUzL+9HqlQpAmsPiQhbAmjUdSDQ8TpQlWr5eMV7+RaKUrR2HJ0006nTS4vYN9SKuFoG9318w2m3W1QnVRgpv6NmvAAOFlMbTFGjh0Omhv8MUDNRoIson/DnxM6ZahXQbJ3AteZbioHBszc932uf1MV5gIv5cfY6o+2dvFLSKKiVQne13NrE6lflGj0ZFfq0dp15k4M97VtUJQ06BUHKKEbLrxIm66z4ZSjhBG1YxZhN1YJFJNHdxbyMY3Eynmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ5PPF57F27BA08.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::82b) by DS4PR11MB789483.namprd11.prod.outlook.com
 (2603:10b6:8:514::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 11:12:37 +0000
Received: from SJ5PPF57F27BA08.namprd11.prod.outlook.com
 ([fe80::68e:cafc:75a:3e02]) by SJ5PPF57F27BA08.namprd11.prod.outlook.com
 ([fe80::68e:cafc:75a:3e02%8]) with mapi id 15.21.0339.007; Thu, 20 Aug 2026
 11:12:37 +0000
From: Ghanshyam Banait <Ghanshyam.BanaitSanjay@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] wget: fix CVE-2026-58471
Date: Thu, 20 Aug 2026 16:42:15 +0530
Message-Id: <20260820111215.4115782-1-Ghanshyam.BanaitSanjay@windriver.com>
X-Mailer: git-send-email 2.40.0
X-ClientProxiedBy: SI2PR01CA0014.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::17) To SJ5PPF57F27BA08.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::82b)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF57F27BA08:EE_|DS4PR11MB789483:EE_
X-MS-Office365-Filtering-Correlation-Id: 43677b2a-bff0-4a43-ff5c-08defeabf124
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|23010399003|1800799024|366016|13003099007|38350700014|10067099003|11063799006|56012099006|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	3H6G1fl4PfWKP/JP06Y4k+0Iw68mv6cIzT1sA+qfIwKVSp4KZO8oG10hxCao+5/PqU8DJkgc8a9OkwnNW9axBx1gB+FmfrEEPHVSLzOamwIs21Qw6NzKTU7Qy/b8UCt/FtSYj7GLhUWtgp34f/uiZ7Xo60B0VNR51XyswCnPm1nlqo3awFdw2dzb+q1s6iX2pC+bFz6j2ZzQzAdqZDpUAlElYQs0pZ/0YhhapWDsVAEAHBxqmX44JNT8Cqv3w+vC2pIPrXg06jhNRlTAo7KdsqnFLrIMFW8s5tGMs/KvRw+z+tV1l2GJ2puWAYMQBu4h+5uikxvrgMREA13DG7FCcv06/71Dr6VntPWYWoXF1t9JjD5/zU4M+LgnxtYuHKck6KDaTnTluyGmPOowvUXXdqJl7jYQxLsXZMM2lQv3cYipAoRGcKnZOAbcjmtG9w++0mL9ed3b/YFZtG8GdfQLejKv+agBTVrFUUX0WjuMv3uIf1BT/aPrS8nI9NCSplv9e9s97J17zzI1TDIeaw74no7KBuCQYueKL6jm7tipXB7aSSn/IXORYCnZXu3RMMhc/ct+TvJeTDjygEUkFLwX4Zw5xCMPF4xXbEpmfqCRtwUqdHEkG/tf1Fh0/dKwRU7oLKxFrsC6o49omHTWiWxIv4cKaTEZG5x6zR1OVzDZXx0Y6CcdQFaKRx4G08W8jvrAOyNUk8cwWUmMInG4+8zNAL3Lyr9AEA+Z+ONJ6pUdE7s=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ5PPF57F27BA08.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(23010399003)(1800799024)(366016)(13003099007)(38350700014)(10067099003)(11063799006)(56012099006)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?xzG1TOyDpl3wWc20NeSqOJmt+3dxJUTQYpGzJ0fJpiUfjywZyn8XRTu6RRMf?=
 =?us-ascii?Q?C8W8KGTs7aTUaLuMDkJo+F6+JM/YuMTUQs0q0KnUNoumxEzQmvDnUyLPwUep?=
 =?us-ascii?Q?QmLJbTDRfnV8IN0vusVbFee1EnG1vbnVg8gF/1gCGci01kpJaa422KHTxpFp?=
 =?us-ascii?Q?N1i3zHtOp0RYL/3cyO57HL+6nWFWEvCsQhgwsyLPZ8H5nuMBJNDyWtEMKDZ5?=
 =?us-ascii?Q?nuvTPFQ2lkE6xlI61pCst1vgU18WWoPjTF5IDEgzvPgbTO4mNWOYZx2bIW9s?=
 =?us-ascii?Q?dRdpQVnc9nZDQCDTswMDUbhs7ya6gCaUEklS6QPjp7QA5gFa4/5s2jubuSg2?=
 =?us-ascii?Q?j2FoRbNv+apj+756N/dJWDfnbzdNXKoWJ7yF0zoev+e9zRH7RY6HohCAWW4t?=
 =?us-ascii?Q?mirlAVs90YQflnXclOou3Kdmx24SEDMBA27P6c/XmgF60rrpX7AWXgRgdDG2?=
 =?us-ascii?Q?y2roYCR+YBb0ol0l3QBxPwINfqaeV909II02Fye5m0/NbQq6UkLsgBerxwaz?=
 =?us-ascii?Q?40R1AHxfDKYAo8TuetWFAQaeogwoUW8ji2uMEZnneSY8Isf5QDg54+QjjGwD?=
 =?us-ascii?Q?zsbWEAHTwux9BMuEmutajZ2ZUmzAsGOgwmMqpc4Hv8VsytTdIx66qlV/LjLx?=
 =?us-ascii?Q?OV2loDHsTyZxJN9KhXtp258qU7HN8q4dTF4ULF6D/eeb01lgRhuhnnPn3c5W?=
 =?us-ascii?Q?/PmsB+C3jFdkR+WWf2XbxOVXCuAyvp0Ci7JLogQ+21ixvE4IqZkov0+4bi3b?=
 =?us-ascii?Q?AeT7vmq0nMZtnZBX1MNqJedkNMq2DU2exJLSiykPc2qqkVL/aITazto1qBwK?=
 =?us-ascii?Q?ivcxQcj06uAM0nwiIizy63p2Lf0P49TF0y5ipfQLmMCky44/9LWZhqMCv3/u?=
 =?us-ascii?Q?hyYHG4af3shcdxO/mYqLRGtHnk6YVogvzqCDzVK2mskTcA94JSmt5gR0M92K?=
 =?us-ascii?Q?eyt/LJn/GvhyNwhNR6QNBLY8ZezaRktUhxZr56JGMlBLVkhI8W1Q1XGB+zZp?=
 =?us-ascii?Q?eW2c4WAQllWz27ZrXQsCeFx47BJKDConuuwcd9stlbqM3wXlaUTd1Brj7Wej?=
 =?us-ascii?Q?xa4zDIS1pcLDeUIg7tq+H3+UoaP37JceqAjCzoONa01lrRqFB/ZzMPCx0oVG?=
 =?us-ascii?Q?VtlXYNaLjr3U0QPQcjvidIXodayOD9XQaVMD+/OoHbbRxSFf7C58e5CxIIZA?=
 =?us-ascii?Q?D9BtPtwFjzL3o0ASJXrbNR+bLoAUGhdJ6BT30Pk+FEOVtl0qSjlDN4bYAboo?=
 =?us-ascii?Q?lg8fk0xnTKH5XIwSuYo+TQr6M5qnketo8AuwMKrchF6TpuI82YDFjOL6UigD?=
 =?us-ascii?Q?fTs+CtSDeys5KzMJalfAcXwafAqEJCJm9n1UGyVwnYRmrD1KysDn3SDe5sJv?=
 =?us-ascii?Q?JxceI219qyMpn7vcGQm2+HJUaSZysxb+ZY+hWpq0ARD/Pg8Ny3eunQNvWHLZ?=
 =?us-ascii?Q?M4p+mFYPHcMZNW6GvFfIWsJMHnUWLJIqfFu9lzT4NWoC+tALF4HDHjsdQAtQ?=
 =?us-ascii?Q?FEKCBcRND3SPXYgkHn56haSwhxYnPlGGzPIFBaJZ0mM9j4kCWGBPGJo+4f9i?=
 =?us-ascii?Q?uGUBSrsIB35tST1U65p6P1yiCioIxhhjstgpzlqDzrvmgm8rawB6Z2eYO6fL?=
 =?us-ascii?Q?oQ8/Os2qYOkrxWLUTl1raqPKrTJG8MJVsi48eZ7rp0l7MQv97CcbYF5wUK90?=
 =?us-ascii?Q?dSIM5eAMmiFbOM7vtXLEobBggCRm3pnY3vCXZ7IxlAvUcja3+KZ51NfaE5Ho?=
 =?us-ascii?Q?xT2lltZfS2KArbDe7HRXy45LhpaXz7DcmICg1oq25WQUpMi8prWm?=
X-Exchange-RoutingPolicyChecked: 
	leyjrKC4F6/Ym9jIySPOoxSK1qbFqf3daL3U/aVWbVI2pM3mQh0G5lFZGW+ialGq40nTMXUj57lZZldzyeDyqwuYxWys8UZwNjPfCghrZWXvPTIAcXQK50IDclwOgl10EyL/74ymI5sQQcUznbCg6OmYwpA2H73kpjsJ2F+7F5kdRh820LLGKtaSdjeLDeYb1a0dXdfBC5EwNb04vWIwX4auDSGTGsHoFqppZbN35wgIXZFSaB/+234thM9TBAKJEe55f2C6QM5/pkViJP8Mw1+EnyBDx9fmqVpRCHMBlyOPNNwL381aQhmFr3Z+dBluVnJl5JNcANXbuJSFiGoTRQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43677b2a-bff0-4a43-ff5c-08defeabf124
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF57F27BA08.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 11:12:37.3151
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m5udk2TxiDH6bQ0SXBgUv4L/yhuW+nK4kutgvbEAgIekcI9QgLF7Z70EsAWaOAg9lQddP+WN07cV8IOERrgDGtVjscj8dPNTAzLzlWN7K//HjoFziogZn7Uclgi995+m
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR11MB789483
X-Authority-Analysis: v=2.4 cv=MbJcfZ/f c=1 sm=1 tr=0 ts=6a86e127 cx=c_pps
 a=lhMG70nIYFfcSaqvxYvWRA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=PYnjg3YJAAAA:8
 a=p0WdMEafAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=QhM6qkWOIZOezFH_UlMA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA4MyBTYWx0ZWRfX+GI0u/K8LZ1i
 4mWwhNO1IDioVAP5kOJU4xx2RNY2xAXOZNlDXqU31SInYz8cimEQ9/nWl0FtjTKvkwXX9SFZzHr
 VFtJzlwSRbCEJowiD7S2Jf4tPFScsM7ND6C5+TZmQdyTsboN3euQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA4MyBTYWx0ZWRfX2Yol3d0dF6HR
 wjeC77RZzSnwPYq6u03GIyUs+zBy3qWipCHuLrK9sn6MLJ9LvL1b3fSTvL0s/lfhgj7hN8szI8X
 IbB9497E5M8Y2HiNq77ZVyR9WsgH0r9W2ZZliMDWqgoXEXlY2dSP4Pf+oyf6PcSPwsYYRkD7eaw
 fw0ubB10RbHnv+FJ4ts756e4r/hgaBX+OidcDasc8Yr6UdkSpQ0CFPps49RgMPgH3bOC+qoRH4l
 uKMV4+un3DZbDBnRq1JVx23Ku963yXpnYzgU9V+/tNuYrOzqhwO6dVuPyZW3ioBWcdSs/BDRFKI
 Tev2HzsHka9AvCewiwPcyVmZPUfthHm1pbBpfx2ZrBVIJbE+LEjg6UsnNkCpLS0zfppe4m5z3Vx
 Oq8wrEItB21uH8+r3YQfseDeKAK0rOkVicK6Cm1MAgULUbE1GyzP+vLDGCZKt2XWtmcCqS8T+Tp
 OVSMr/SAi7NeP4nwGdw==
X-Proofpoint-ORIG-GUID: -s2DXiTASJk2A9SLiwJNeX4t3Oab9jre
X-Proofpoint-GUID: -s2DXiTASJk2A9SLiwJNeX4t3Oab9jre
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1011 priorityscore=1501 bulkscore=0
 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200083
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 11:54:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243932

Backport patch to fix CVE-2026-58471.

References:
https://nvd.nist.gov/vuln/detail/CVE-2026-58471

Upstream fix:
https://gitlab.com/gnuwget/wget/-/commit/c2640fe5171c59f87c58dc9fcb195b2d18b010ee

Signed-off-by: Ghanshyam Banait <Ghanshyam.BanaitSanjay@windriver.com>
---
 .../wget/wget/CVE-2026-58471.patch            | 74 +++++++++++++++++++
 meta/recipes-extended/wget/wget_1.25.0.bb     |  1 +
 2 files changed, 75 insertions(+)
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-58471.patch

diff --git a/meta/recipes-extended/wget/wget/CVE-2026-58471.patch b/meta/recipes-extended/wget/wget/CVE-2026-58471.patch
new file mode 100644
index 0000000000..2477505ff3
--- /dev/null
+++ b/meta/recipes-extended/wget/wget/CVE-2026-58471.patch
@@ -0,0 +1,74 @@
+From c2640fe5171c59f87c58dc9fcb195b2d18b010ee Mon Sep 17 00:00:00 2001
+From: Arkadi Vainbrand <arkadva8@gmail.com>
+Date: Tue, 13 Jan 2026 12:22:04 +0200
+Subject: [PATCH] Fix buffer size handling in filename conversion
+
+* src/url.c (convert_fname): Fix buffer overflow.
+
+Copyright-paperwork-exempt: Yes
+
+CVE: CVE-2026-58471
+
+Upstream-Status: Backport [https://gitlab.com/gnuwget/wget/-/commit/c2640fe5171c59f87c58dc9fcb195b2d18b010ee]
+
+Signed-off-by: Arkadi Vainbrand <arkadva8@gmail.com>
+Signed-off-by: Ghanshyam Banait <Ghanshyam.BanaitSanjay@windriver.com>
+---
+ src/url.c | 20 +++++++++++++-------
+ 1 file changed, 13 insertions(+), 7 deletions(-)
+
+diff --git a/src/url.c b/src/url.c
+index 7540e90f..f334456c 100644
+--- a/src/url.c
++++ b/src/url.c
+@@ -1614,7 +1614,7 @@ convert_fname (char *fname)
+   const char *from_encoding = opt.encoding_remote;
+   const char *to_encoding = opt.locale;
+   iconv_t cd;
+-  size_t len, done, inlen, outlen;
++  size_t len, inlen, outlen;
+   char *s;
+   const char *orig_fname;
+ 
+@@ -1636,7 +1636,6 @@ convert_fname (char *fname)
+   inlen = strlen (fname);
+   len = outlen = inlen * 2;
+   converted_fname = s = xmalloc (outlen + 1);
+-  done = 0;
+ 
+   for (;;)
+     {
+@@ -1644,7 +1643,7 @@ convert_fname (char *fname)
+       if (iconv (cd, (ICONV_CONST char **) &fname, &inlen, &s, &outlen) == 0
+           && iconv (cd, NULL, NULL, &s, &outlen) == 0)
+         {
+-          *(converted_fname + len - outlen - done) = '\0';
++          *s = '\0';
+           iconv_close (cd);
+           DEBUGP (("Converted file name '%s' (%s) -> '%s' (%s)\n",
+                    orig_fname, from_encoding, converted_fname, to_encoding));
+@@ -1667,10 +1666,17 @@ convert_fname (char *fname)
+         }
+       else if (errno == E2BIG) /* Output buffer full */
+         {
+-          done = len;
+-          len = outlen = done + inlen * 2;
+-          converted_fname = xrealloc (converted_fname, outlen + 1);
+-          s = converted_fname + done;
++          size_t used = s - converted_fname;
++          size_t newlen = used + inlen * 2 + 1;
++
++          /* Ensure we actually grow the buffer */
++          if (newlen <= len)
++            newlen = len * 2;
++
++          converted_fname = xrealloc (converted_fname, newlen + 1);
++          len = newlen;
++          s = converted_fname + used;
++          outlen = len - used;
+         }
+       else /* Weird, we got an unspecified error */
+         {
+-- 
+GitLab
+
diff --git a/meta/recipes-extended/wget/wget_1.25.0.bb b/meta/recipes-extended/wget/wget_1.25.0.bb
index d1dd6a1598..00667a1e24 100644
--- a/meta/recipes-extended/wget/wget_1.25.0.bb
+++ b/meta/recipes-extended/wget/wget_1.25.0.bb
@@ -20,6 +20,7 @@ SRC_URI = "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
            file://CVE-2026-58469-regression_p2.patch \
            file://CVE-2026-58472.patch \
            file://CVE-2026-58472-regression.patch \
+           file://CVE-2026-58471.patch \
            "
 
 SRC_URI[sha256sum] = "766e48423e79359ea31e41db9e5c289675947a7fcf2efdcedb726ac9d0da3784"
-- 
2.40.0


