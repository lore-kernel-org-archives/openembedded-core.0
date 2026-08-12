Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 688E1C5CFDB
	for <webhook@archiver.kernel.org>; Wed, 12 Aug 2026 23:49:25 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8326.1786578563739297171
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2026 16:49:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=UvJbU945;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2684dbd6f8=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CNj2bH4005569
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 23:49:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=9fHc6cgZgRbhKyjY4NXr914NBxt6aPRaq7TIYGoB/pY=; b=
	UvJbU945/DOyONyZCM5GAmU9tQzbsQQPI6CUQAqw4Z9PAGZieSxDjoU5DnDiNChm
	cY0QGqTYglRgaeWWvEFOf7t//f4VKDMRkSbV63VmAlUZoT+JFJu826O5s55f2vU+
	X8Wj129j2N43pVOC9kqLhfg+0qyrGvL7oUKE4rzXmFJYRMQ4LPJ7VuVDGMks9KGX
	lZFfoSJGWTUFZ8ezoGJNxpSzflz4UYRqUnGwlgZScAbf9dmt1P9PsX3nyJV81Jfd
	P+4v5fsHoXL/iyKSn7GWGYa4qX9yK1+w3h0o1ULyiTXAq7E97HNjNIhW3DAOujM8
	SCDwOToIsBvBc/EPxw01Aw==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11021138.outbound.protection.outlook.com [52.101.57.138])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fyshwv4n0-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 12 Aug 2026 23:49:22 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tCL2Ht+dKyaKs1YGOdJrxmgwwpwRjxiFpXtsVijcheYHvZjc5sa2sOyi6w+JO3wJ8+Fjm+lRAv7qmPVlXwgji/Y4XP4v8mcNFhZId6yoDpGq8cKlTTfXfWqsnKZWZqiCJRwMw8x9hL5G2R+fpU/2gYG+KWURAA5mtqEKooqJA/5TR/VG4DCSNl4U8HWLZ4BUS6r/WzlLUIsy1hwtjG5rDCHEYxdt0A6McJ0SXu2lBfvB7q23+P0WHBUMMHeHlERSJbgHSwxCtCrhoGd9jUcGdBmb3BNxwSi46b2gl1Ag/ettAEcNZhMWfn69lPFsgH2zv/ZYD8Gtagm7Aoi+t3p+SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9fHc6cgZgRbhKyjY4NXr914NBxt6aPRaq7TIYGoB/pY=;
 b=I8qTsVD1CqunKLy5jYoVEAxUw2LLMzS7npsB/7gUZxClhmCZLR7mm/R9gxhP+CvlepqjuAmkmwAadCevQWPuFkdALUHMk59F1s3B6ZchvLdrLJHHwCgbpZi/cRX8UlSVnYlGSALNswyni5FfETuWoUY0meP5DE9VGw6o8ZimlGZ6ixLtBpIKNYtHoh7lMQc0S10yaGAowDMHshZLcvNsNXK1N7TJSyCyl73rRydd7xIhYOLI5i/svE4UnMPZzcIbcTIOzpcblF4906y3xVN+SoIco1EOaHKGlJMmOTXhbyXJ9A+kh+5SKG0oAPgDnekszpWW8Epu6TnYv5zSzvJedg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 by DM4PR11MB5296.namprd11.prod.outlook.com (2603:10b6:5:393::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Wed, 12 Aug
 2026 23:49:19 +0000
Received: from IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23]) by IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23%4]) with mapi id 15.21.0270.016; Wed, 12 Aug 2026
 23:49:19 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com,
        mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com,
        randy.macleod@windriver.com
Subject: [PATCH v14 01/10] package_rpm.bbclass: Drop external dependency generator to support rpm 6
Date: Wed, 12 Aug 2026 16:48:51 -0700
Message-ID: <20260812234900.866436-2-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260812234900.866436-1-sumanth.gavini@windriver.com>
References: <20260812234900.866436-1-sumanth.gavini@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0102.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::17) To IA3PR11MB9256.namprd11.prod.outlook.com
 (2603:10b6:208:57f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9256:EE_|DM4PR11MB5296:EE_
X-MS-Office365-Filtering-Correlation-Id: c2fdc479-fe1c-4b1e-35cf-08def8cc534f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|23010399003|10067099003|56012099006|11063799006|22082099003|6133799003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	QHgX0P9sqYy2gJEgtxBMmF5dnLEKf/9kLy3gdP3+wCJWugX8bX8Q6Jpl3isMnmo8uPevZKYJyHY+G/Bb9flfNBDfufevMEPi/pbvKFIQOyrIgVWAst+CZxe4c/GtAVFnBXBRsBmB0A3Sriui2o1OjED9CdLPcMhDvUfKdy8i3QevdTfepj7eZQbypvO861WacaWTQ9InbPWK7/t2jd6eoHm3m/dA03JruaQmYVIzwO+5vqY4LNTQJCVHTSD7e6l63rlpgD/eGFek/k2jUttlKORbkrAMYWsTQJN9IzJ3HrW8/T1Y8v4k5Ch1Ui8RxU2qNIM7O6Y0vmoQkBlGF3nqxRhE53iBiqXvbn+UJlGJR5e5qz0BxTbLwhxtyTBR9R5Sh1XQEWJk1YmdaZQHXrlav4S7bot84QcJXiKTLo/tbqedT4WHutJ4XFWuIG0iVs4oPu5pSa8W/lvxC0yc32hXcJ54dYTHZ4qTgRHqFlKw19QVA24unPDyQCA/af8k0gWy1SGQLWTQ44fXUqVnX8o0krj6PuBNUL/Utx6IXOTRACUYDRCMT63QTbQquvv6uTytVfNegEjcJpvfog+3eudXtNFw5HXUMW4eRW9MU/BWt+ZNElbqFRJM+Imp0elE6tC+sL3rDDkK+tVFgOhNUtIq+iHHygz+ZfGftNse2aiwoZZaeh1nRmmkl40Pi/6HWsN8ZtaZDuw+Tgzhlyqngav1VhHw8Uvh7c3csiQciurTPi4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(23010399003)(10067099003)(56012099006)(11063799006)(22082099003)(6133799003)(18002099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?tbBDY3eW3ii7k2vWKj7A1Vk5gmkfmRInV+ltEclvR1KtsqOdJHMoW4ZkS2zY?=
 =?us-ascii?Q?Ybv9slmRZ71yFaB144PS7wwjVNl4VTpiFeTjPdGl6I0n0ud67MwiS47YgYIi?=
 =?us-ascii?Q?Fg7atcZKFah1t30r2jewG2eS7aeqDcDmjwvQY643wJ7IWcoD96TML3misP7F?=
 =?us-ascii?Q?l92tTrcMarYPoBI+f8YPYcbxQABqqjOU34ddFk1vhDY0ZaH7detF4CDc8dM8?=
 =?us-ascii?Q?sNaR8wGvEW31DHr1FyJjVxrjBUo0ZAcs+wb+wpg1xcvV5OPtkUJ/J6jdfBlg?=
 =?us-ascii?Q?yL7PLP3wrkyfIM+HcdRH/SzG3Qo2QCw7DwSahJI69pS/FPuFKwEuScAIMBov?=
 =?us-ascii?Q?FrYce+lN6SIdlekjUyusKC2WFE/S8MO9tkXWORP7LBvIycA2WoXwxY0wTcQf?=
 =?us-ascii?Q?S8s6YCCWeH1nzQ32DIuzVcw2Vk5QGpsnIXnhTAgHMczvB3mnGjpVh4svv06r?=
 =?us-ascii?Q?8aa7RcTbsSpwIxmO32mE4WcU7bLbbJFIZ2zLMs0v4oHeS1nm62+rH0IT8vjp?=
 =?us-ascii?Q?uWxD5mVxFq9QNoh1uMn/S0bbXhX3dGIONqkkfT72KnrKxxTyFdpJP0VRvj5N?=
 =?us-ascii?Q?ZEO0X3X9+G4LTkLCNId3nukkcIqFY5NgJR9ePDujj+KdIifchBL/LZ9ctBmM?=
 =?us-ascii?Q?XAC9copRSiufKxQ3x1o+SvxAIwxJlQF03KV+vdhHko38sis9DVxsQNoyLdbk?=
 =?us-ascii?Q?kF6Q2BCvja9NOdE0hHH5Q6/HTwkUl0Tduqmv2Ep0eGEyB0VmyhDbA9X/JxGm?=
 =?us-ascii?Q?jSbe5E7dGi17IFqG5ZCxv82DI5njH1b4baC3ONgyBXzYhfV2V/pyPgj3TxnB?=
 =?us-ascii?Q?XpOFmT52ox+IvHg/l0Ai/yrWJVQnNnwppEE+U9ta2E8PpXmbPS97t70QrUD4?=
 =?us-ascii?Q?UomO567Ok4gNeGV/kfRCCtMEHS13Tm8j5ojBztmj0B5/p9suau20DO9kbSA1?=
 =?us-ascii?Q?pDSJMwNFbjqdhH2uQjog1dGAi0KoEUfJV7+DFzbE2FHaGh6nC6PSSe+HNRdp?=
 =?us-ascii?Q?Xrzoz/DQOkNJ8z9jY9a1Qv8yq4flzb5lFUXknXlv3A1ok+JFNOM8GDU+82UC?=
 =?us-ascii?Q?FqWaZ7biE6kRCrB3NF22iRCPv9oWUQ/RY0/S7r8GgLc0h+NMbfFAnVb2CVJk?=
 =?us-ascii?Q?24cZTNSyezYeHdZZDnvE4TUYT7JpF+wbwPx1t6PUZwfgfWLz//q/iSJDlSA0?=
 =?us-ascii?Q?a/fofHZF/r1dlDmn0DR7cmqhk8HHpLEx/PEdxwmGs3sngFgFmENtIGeP1Xh8?=
 =?us-ascii?Q?wQ3rXAE7KjdmLke/wHFZkry3zIyKHfeJRel4F0PXT+aVAQ7Qw+3u+tcuaWqu?=
 =?us-ascii?Q?V9A+zBLPFE/m69zVbNtpu28VFr4DDbxUlR0N+lONmTeUy42Pax1TnAc/Z2Ed?=
 =?us-ascii?Q?uilpZ3UOKU2euMtjl3MhcO5HQQ4T6HLRVZtHS1EPUfsKrNr6KM6smTnoIsv0?=
 =?us-ascii?Q?/NhikHcwDCDU+Mx/qpudtdAGq35IYOxxcI8uQjrUUmm7vpYBIXkUrAg7Pofu?=
 =?us-ascii?Q?XNjFVy2s+1bXv8vTS/ZMS2k4mR+SPgqGz4Bc1Pkygoujhj1CtsA0OBDlKVBh?=
 =?us-ascii?Q?ls6wyO4vIOK8Cz/FbIAs52uuoQDaQ5XtkM7kPH6YmQd/AL1wH//+Z51yeJyo?=
 =?us-ascii?Q?qcIeCtlqa92+dF2ffO7wQHTobdH2IAXZ0veasxNFBgLYjWf8n+W4hNrFmJI9?=
 =?us-ascii?Q?vkT6JIALLW8yjbyaMsHL0C5yeTdzNAdsCgCIdpdg2V0doWe8iuEGQUh1NwbO?=
 =?us-ascii?Q?1uoTWka5vxt2neiBh7qgzS+1YEqX4U8=3D?=
X-Exchange-RoutingPolicyChecked: 
	CPFCn2lzXscxj+e+1+g03fiM2W+DoD25G4xIMK2zkLnNJRfPZBOL7fUYoZ2Qqtysx1hRo6Nno5RfOBK+tOZZUb3L9+QtLBCgKzCX74yu3+SeHFfZeOwxJ6B83JrE1gfh/moeNwJRO7uRj9kFIHqg2eAULMZGLca2f2bRwZ8xx70fm5pD+yVX8e6rXxjGkvwWtotbn3KxhjuSTB4v477qRdm5u+o0Y6P944NekcEQL988LGnRxRNRFyOrtMHLJehdGcNMCNCDj4kHYzIQ0X9b6EXcXLq+7tCsJoZcf+q7LFlXjybSsypUdEd55f+X8HO9FdXtRj0lkQLKnyW/k+fbng==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2fdc479-fe1c-4b1e-35cf-08def8cc534f
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 23:49:18.8990
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BLayGdeeodLvGK7ZGENquIdK5R87b3TbTiNw908hnatwzCtvE0rQhJ1LWq3xNkiRBAf6KlOgdgyz5yF8vLk2pLPdH3W0Dv1UmSYDR9HfOGA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5296
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=IYK3n2qa c=1 sm=1 tr=0 ts=6a7d0682 cx=c_pps
 a=i28SWj9gb4XoQK1xikdYvA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=gH8vcDOTmKDoYkm8A40A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDE5MiBTYWx0ZWRfX7WG3YApQMugy
 pO7iDf7QBC/j/Bbe0cLvFed+VmNdY3C+YGo6YqPzPWrXWaHHjzG+K3YON1l5HKaDDcMV+rXUHJO
 d7z55fSQ/zLwR4V7HplxyOz6aGP5G5P5+0TMB5+HLU3Tc3UaS3/j
X-Proofpoint-GUID: gTteeqlcrfBblmpBdsxHikmngRG-56il
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDE5MiBTYWx0ZWRfX93U8vDeodeJi
 qCGeZpEsPslwW1L4AdDgXfHXuM68lVj7d1WFnXre5M08jh6LMImPCmVhfpjkXtLyVLocVw38WME
 rqwXjHpz0s63TSkAPVlOz7wkpENQ5fZ/jd6/wVvcBr4cILuw+dWdYZ5EAJjxb4Fsy3TSaoGWyrN
 D/0NVRoB0h22RdkN1XPKyWzQpX47a3UcO2OPo3J9y0qqsGwglhDmZPyWafP9mkJnmuXl9BCXbba
 qvVsBmMOVc+KPZhdXilZnwk6ZVXyjPTnAFqrChuT86KOssPfilsjHIjM5pTVjLxYR6wDudz9nsJ
 KFLyEes1Pw733wkT5fEbqxjGMiM0gAHdQdsZ8dYqb0z9zNsSMNi+WrMJqOoB0pDaf3ig6PANAao
 S4tsAMSioP4vDKNPvJmhlSlaJU9Ih3z+vBKqsrp0LDYADZOIjoOr72X0Rst3N8LHxnSWOIbzK/h
 F0/IQuXqI3nTiTq2sXw==
X-Proofpoint-ORIG-GUID: IAzrd6uF9UPi2PeOQGcGI9sX8zD1L9eV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_07,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 malwarescore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 23:49:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243310

The rpm 6 doesn't support external dependency generator. Oe-core used it for
per file dependency which was saved into pn.requires and pn.provides,but that
hasn't been used any more since 2012 (rev:
be40f6d0bb80274366af00461112af65687a4de8), and there were no complains or
updates in the past 13 years, so just drop it to support rpm 6.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
---
 meta/classes-global/package_rpm.bbclass | 84 +------------------------
 1 file changed, 3 insertions(+), 81 deletions(-)

diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/package_rpm.bbclass
index 9eacd91cbc..f286d3a0e2 100644
--- a/meta/classes-global/package_rpm.bbclass
+++ b/meta/classes-global/package_rpm.bbclass
@@ -14,10 +14,6 @@ RPMBUILD_COMPMODE ?= "${@'w%dT%d.zstdio' % (int(d.getVar('ZSTD_COMPRESSION_LEVEL
 
 PKGWRITEDIRRPM = "${WORKDIR}/deploy-rpms"
 
-# Maintaining the perfile dependencies has significant overhead when writing the
-# packages. When set, this value merges them for efficiency.
-MERGEPERFILEDEPS = "1"
-
 # Filter dependencies based on a provided function.
 def filter_deps(var, f):
     import collections
@@ -36,67 +32,6 @@ def filter_nativesdk_deps(srcname, var):
         var = filter_deps(var, lambda dep: not dep.startswith('/') and dep != 'perl' and not dep.startswith('perl('))
     return var
 
-# Construct per file dependencies file
-def write_rpm_perfiledata(srcname, d):
-    import oe.package
-    workdir = d.getVar('WORKDIR')
-    packages = d.getVar('PACKAGES')
-    pkgd = d.getVar('PKGD')
-
-    def dump_filerdeps(varname, outfile, d):
-        outfile.write("#!/usr/bin/env python3\n\n")
-        outfile.write("# Dependency table\n")
-        outfile.write('deps = {\n')
-        for pkg in packages.split():
-            dependsflist_key = 'FILE' + varname + 'FLIST' + ":" + pkg
-            dependsflist = (d.getVar(dependsflist_key) or "")
-            for dfile in dependsflist.split():
-                key = "FILE" + varname + ":" + dfile + ":" + pkg
-                deps = filter_nativesdk_deps(srcname, d.getVar(key) or "")
-                depends_dict = bb.utils.explode_dep_versions(deps)
-                file = oe.package.file_reverse_translate(dfile)
-                outfile.write('"' + pkgd + file + '" : "')
-                for dep in depends_dict:
-                    ver = depends_dict[dep]
-                    if dep and ver:
-                        ver = ver.replace("(", "")
-                        ver = ver.replace(")", "")
-                        outfile.write(dep + " " + ver + " ")
-                    else:
-                        outfile.write(dep + " ")
-                outfile.write('",\n')
-        outfile.write('}\n\n')
-        outfile.write("import sys\n")
-        outfile.write("while 1:\n")
-        outfile.write("\tline = sys.stdin.readline().strip()\n")
-        outfile.write("\tif not line:\n")
-        outfile.write("\t\tsys.exit(0)\n")
-        outfile.write("\tif line in deps:\n")
-        outfile.write("\t\tprint(deps[line] + '\\n')\n")
-
-    # OE-core dependencies a.k.a. RPM requires
-    outdepends = workdir + "/" + srcname + ".requires"
-
-    dependsfile = open(outdepends, 'w')
-
-    dump_filerdeps('RDEPENDS', dependsfile, d)
-
-    dependsfile.close()
-    os.chmod(outdepends, 0o755)
-
-    # OE-core / RPM Provides
-    outprovides = workdir + "/" + srcname + ".provides"
-
-    providesfile = open(outprovides, 'w')
-
-    dump_filerdeps('RPROVIDES', providesfile, d)
-
-    providesfile.close()
-    os.chmod(outprovides, 0o755)
-
-    return (outdepends, outprovides)
-
-
 python write_specfile () {
     import oe.packagedata
     import os,pwd,grp,stat
@@ -311,7 +246,6 @@ python write_specfile () {
     spec_files_top = []
     spec_files_bottom = []
 
-    perfiledeps = (d.getVar("MERGEPERFILEDEPS") or "0") == "0"
     extra_pkgdata = (d.getVar("RPM_EXTRA_PKGDATA") or "0") == "1"
 
     for pkg in packages.split():
@@ -365,10 +299,9 @@ python write_specfile () {
         splitrpostrm   = localdata.getVar('pkg_postrm')
 
 
-        if not perfiledeps:
-            # Add in summary of per file dependencies
-            splitrdepends = splitrdepends + " " + get_perfile('RDEPENDS', pkg, d)
-            splitrprovides = splitrprovides + " " + get_perfile('RPROVIDES', pkg, d)
+        # Add in summary of per file dependencies
+        splitrdepends = splitrdepends + " " + get_perfile('RDEPENDS', pkg, d)
+        splitrprovides = splitrprovides + " " + get_perfile('RPROVIDES', pkg, d)
 
         splitrdepends = filter_nativesdk_deps(srcname, splitrdepends)
 
@@ -630,10 +563,6 @@ python do_package_rpm () {
     d.setVar('OUTSPECFILE', outspecfile)
     bb.build.exec_func('write_specfile', d)
 
-    perfiledeps = (d.getVar("MERGEPERFILEDEPS") or "0") == "0"
-    if perfiledeps:
-        outdepends, outprovides = write_rpm_perfiledata(srcname, d)
-
     # Setup the rpmbuild arguments...
     rpmbuild = d.getVar('RPMBUILD')
     rpmbuild_compmode = d.getVar('RPMBUILD_COMPMODE')
@@ -658,7 +587,6 @@ python do_package_rpm () {
     cmd = cmd + " --define '_topdir " + workdir + "' --define '_rpmdir " + pkgwritedir + "'"
     cmd = cmd + " --define '_builddir " + d.getVar('B') + "'"
     cmd = cmd + " --define '_build_name_fmt %%{NAME}-%%{VERSION}-%%{RELEASE}.%%{ARCH}.rpm'"
-    cmd = cmd + " --define '_use_internal_dependency_generator 0'"
     cmd = cmd + " --define '_binaries_in_noarch_packages_terminate_build 0'"
     cmd = cmd + " --define '_build_id_links none'"
     cmd = cmd + " --define '_smp_ncpus_max 4'"
@@ -668,12 +596,6 @@ python do_package_rpm () {
     cmd = cmd + " --define 'use_source_date_epoch_as_buildtime 1'"
     cmd = cmd + " --define '_buildhost reproducible'"
     cmd = cmd + " --define '__font_provides %{nil}'"
-    if perfiledeps:
-        cmd = cmd + " --define '__find_requires " + outdepends + "'"
-        cmd = cmd + " --define '__find_provides " + outprovides + "'"
-    else:
-        cmd = cmd + " --define '__find_requires %{nil}'"
-        cmd = cmd + " --define '__find_provides %{nil}'"
     cmd = cmd + " --define '_unpackaged_files_terminate_build 0'"
     cmd = cmd + " --define 'debug_package %{nil}'"
     cmd = cmd + " --define '_tmppath " + workdir + "'"

