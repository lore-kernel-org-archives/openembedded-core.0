Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EE53C54F55
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 22:56:31 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43754.1785192983541654987
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2026 15:56:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=k1SRK5QT;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1668b11650=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RLcrRW1516469
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 22:56:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=9fHc6cgZgRbhKyjY4NXr914NBxt6aPRaq7TIYGoB/pY=; b=
	k1SRK5QT0W7oVCRdABXaW1iCpoUXn+kpArn2icm9E8dpx2a0CpQyWDYHv4wPV2gE
	SnOO3gMFGvy7K60+9uC99U/3RqdCYr8Vfh+8HcjlnayHWlnf13Zf/+p+re3cRfh/
	QMtx0FKjBXlDjmFtTvnQJq8FcCKjx6irj6kc8AvDmsH4Wx66fQ0WYzO4Ok0NHgEc
	ivsohs1uT/LcYsXBrjyH5c0TFWuBVaspUAe7oHJ9tXbydiHdPj7WRkx4CDRIDD2Q
	IjOETUTGh4g6dzJN4OzG8pTp4772LR3nyLlCeLFNcx4I697bInFXrxGZFrWqjLEr
	wAPEjXNNl6Jkr9ebzVCCSA==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011046.outbound.protection.outlook.com [52.101.62.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fmm43u17m-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 27 Jul 2026 22:56:21 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h7EwsnWSsOu1KJ7admNt2iThbcvU0TLTCPNT0ruon6cqxCsXZb67vdquhu5L/Sh3/8LfoFZ+p7HUbvxCZeFrVkEJN1HCHyfazTLf2PrvNSUKlyxsRUodic458kqDTx4KSDSlamJ7qI9OTgMpXj612VOHwL7fMPY8i+H/+7MgQzsQCv/UvfgXPZUu1kKLkYco2n2LH8eL3sn4opGuHUix0VdG+/pmf6ogwrQWlMQIV9MNIXRZoJo/SsQ5svX+a3KJKsKiuo4i15iEFtmnM79R2Z8V2ARKNOIJsBBaDfaH5Pl0UatfaVVe8t1OpjNmeZlI5e5s9ftDlcWnVd7pV3j1Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9fHc6cgZgRbhKyjY4NXr914NBxt6aPRaq7TIYGoB/pY=;
 b=NqMPyNzBG/x07qHM8H2NR62KDKQPxfjg4Z8HqXXDiCGQtqJR+s2UzrU8AH0ZUQD8ubeafN68tFWjEE3NFFzPsHfcUv0ScVQquHQTM6EYMJTRxVBH31+geUNu5N3GAUDeV1CM6SFZ93TNnZMu8l+gZ07//qTN1Ig9bYy368QUbC99ocYw+fAdRjMyB7utH40/quLD7AeRA1SEEUf3hnP9NPTwPiFzIg3uwZ4887ZNNJTfEXt9FAd+HwiwG+TsUbnYtnMp2x3eul/yYJZCQraHLZtE/vJRA1QYKfyvJgCF1mRxqOoJ6yjZKfw3J/c4NZs0Kg3cdMTCPDmKZdzSxdYoXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 by PH3PPF8517B3F27.namprd11.prod.outlook.com (2603:10b6:518:1::d35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 22:56:18 +0000
Received: from IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23]) by IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23%4]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 22:56:18 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com,
        mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com,
        randy.macleod@windriver.com
Subject: [PATCH v10 1/8] package_rpm.bbclass: Drop external dependency generator to support rpm 6
Date: Mon, 27 Jul 2026 15:55:53 -0700
Message-ID: <20260727225602.342005-2-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260727225602.342005-1-sumanth.gavini@windriver.com>
References: <20260727225602.342005-1-sumanth.gavini@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ2PR07CA0005.namprd07.prod.outlook.com
 (2603:10b6:a03:505::29) To IA3PR11MB9256.namprd11.prod.outlook.com
 (2603:10b6:208:57f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9256:EE_|PH3PPF8517B3F27:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c84805d-e178-462e-6f99-08deec324463
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|23010399003|52116014|1800799024|38350700014|6133799003|11063799006|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	QLagPcwbSdMc+lHbu23U1Np5kv1nB6FONwOkoYA26gkRcShIVP40EJUIZrSXWfgWf1H3cCOWtvV+hVcIlE5hvlXrB1OPe8Lt52gYx1r7xOkdDvfk7M7ajVaq2xCNm927iJZTLrzy7CnXV5qN2MNfR+fyh56nGhIYBxZuIg5y1mMowoUOdNNaqgigdBehcVRNmn23+5PucpsNLpd5nk7yrttMCdqMiKSI1Agd0y7Syre3UL2k2t+iR7dzvSi+vW9YuXp1OnD+ISK3MQdGeGWh5Q8X0ASr4sag1t5NGqbs513DHIQnfNf0qMPJhfoKSVhR/vrqldpXohB9uT8CE9/M4o2F0whbCzkQgVa7/IbOBrsXP5OT4BFoOU//vVAfofh6Hmo7O2EYDkeMDdIIIYh5+QDc3yRHqt7lK6txhRNFNpPJ86k+byqsDloaDjKYHv3wQ3j66BPIIYhOIS4fM4CFlvjDo9wcJD6dRJzQ18pKS+0IA8qCGSQigfN8kRgkbJGAmls1JeaBlGq61vgy6/hDiolaHVH20CbZxPbLRoH3HN3Yg/RmYPxztksgRZXX99O6xtIrwaJgMW4J8uLcQHnHxJtNkCG9x9i1YneL+Y9L1mF7IkewiG7oFFYqKvRzyOd50czoA48pyi6RQryvVYTExA2VAKYqhnBpr05N+71fZf4JJaH9mb69oYEiMS8mtIAAqhp2kD79nZN5HF29w9EZQPf7J2/l92090eh/N9eQEGU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(52116014)(1800799024)(38350700014)(6133799003)(11063799006)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?qAHShuIGEo+u4D7ohLgv/6Y9PwDubXIG1guvBq/A+s8MD8/GAUhjp7FR21YK?=
 =?us-ascii?Q?3sHVziSTA02NBT3GfxQs1hC5SljQJPkV4gp3cVS8mjpVMRFkqzAPzFa1gpDN?=
 =?us-ascii?Q?pCDuUDpVVn2rR0WQ8HVenAcFoa/opbP2O0+0qC5lKQ8YkLV9sI+XLB4ICu0x?=
 =?us-ascii?Q?FXPmMozmlj40EPRY4cQJgX9lBk5ya5U3aMmqgQ+TJS+HTOWu2seCID78MCXN?=
 =?us-ascii?Q?TXFL0exr4jEbnp9PyADS8V9vvJbKmgC4ExcfHAX0RQfqzpPiseXl8ffuEqiT?=
 =?us-ascii?Q?uEFrYMuMO3+fiH/si0Hccq/LYA+vj4a/4J/L0Qzn3jGFk4b2ZAvS6yvrbEsX?=
 =?us-ascii?Q?Th/rFBrxQk1v6qXoygOQKBCJCLdNVc1eSbFGTyhysUIVqjxyKU/SYEewfmRl?=
 =?us-ascii?Q?zPV+bZzPjR+kQxby85++3ES20xYzrDLptYLLma6jSZRm4rGtIiWGf0yppbPX?=
 =?us-ascii?Q?pXIoDldxQxJ6w9EriFktZS3pw3rgh0RoGkzwNd9RVa7bINNAyAxa/y9lEOIR?=
 =?us-ascii?Q?ziNWmggtJ+8hGf7lfdPs9/cx2PoZAPp4AglWaNPoFBWBlpJK037db7q4GX2f?=
 =?us-ascii?Q?/+zu0WI4Zr5+9XU0Mdw4WU4UsJ25FNSqsHwWVQNd+lTD5+OQsFPch3zaZY0q?=
 =?us-ascii?Q?Pp47sHCa4Zm84ch/f9xD/K/5AskX2VDf7ZDYUKppFR2YrxEpZMohWEWGbQRC?=
 =?us-ascii?Q?T8gMDZ7NEXQY0AmNWF2GTWLCrx7xSBXMM/MvbezzLl0oRuPtkesi+95BNDoQ?=
 =?us-ascii?Q?xixsHF2ysdDif+sDNGkcsYZ2yD98BoNs2qO2GB8oyQXmE/+090zI9TNi5yCl?=
 =?us-ascii?Q?NiOYcaxbn+AhSCoGqY1eQv7u2ZNZ1JT3M+wC/z7wYWF+hRZFmJZtP2nl7LH0?=
 =?us-ascii?Q?LLI6ekIvQI/SzaD8wDvjT0Rpqfi40FTpcUjsWfm6FQs+Q988Go6TVUWo81RI?=
 =?us-ascii?Q?P/XUb9j5bB9LvGSZJnQeWJzpRmKo0j/b8KDvEomilyv+G9w9p2li62FGbfPC?=
 =?us-ascii?Q?tAe3za8ShLIhyf9omzN23FilQMGz20BNuyrOr92KcbfGX7GPnQkMMXh4TB+1?=
 =?us-ascii?Q?gzsJfO4amWcyujVyS6oKEa+Sgh9HwzB5iG1J+IkQ1bjW+ExSOpdymimX9JPk?=
 =?us-ascii?Q?tus9eCXYA8gnvlKs6CXineavU3a6lyuMjWuC8eawjGCZl/wsZtak3HGegQLv?=
 =?us-ascii?Q?qdlvGHEdEvZtJYHx1CBG8qZEtsY62ePCugRT3jDddBIB85QOa/P5z6C2XHKG?=
 =?us-ascii?Q?XttfWa+tRXSRf4sIrfT0h/icfBlomq+PBZgvfHKffyrKs9CZL5CbAjy9uJQT?=
 =?us-ascii?Q?UBtNRLjsgYQJ+9BqTDPkv2uooO+RyrALDyBb6UNugtgpuKCWRU4s202DdfSG?=
 =?us-ascii?Q?VbkNSntg742BkdUNf0jdL6LYvwSDRPMa+CJOAZzcNUDe982g4lhGVQTZdF4m?=
 =?us-ascii?Q?AMDcGTVovJPHcJf1RJJk+/5Of82oo00Poh5/vPWYKuhjJSpEM/+OQA25PIs1?=
 =?us-ascii?Q?4rPVhOcZtkp446MdYNMYBGN949MRh+Dme9Z2wuSZxvXEQyyztjL8pd/THQ1G?=
 =?us-ascii?Q?PHBJ+R4VniTe/sImitcJp4WjOazipFaH5SN0KOCtYcQB7weHXkyANNSo3JZP?=
 =?us-ascii?Q?+1yNpxLvLVr3UeNSFDOpfQTtwC7rcPBdyk5EcAktXARsKaaRkhquNID4QYYo?=
 =?us-ascii?Q?8kzcewQbavC3FOGunFIbacm+q7AIC2nnpgPP3dScnw45vYiYivA05gIAEZPj?=
 =?us-ascii?Q?4na3NqfyXn1PH5hbb7sgW4vnLOzPScQ=3D?=
X-Exchange-RoutingPolicyChecked: 
	ErBLQzOJUKpDXLB7DSwAGF7fhSaeHLiVUC3jZXQ8C+fsS5ei2VYKjRI0viKIdb7MAZeXq7U8MuJ9zueZWVgMPP9s5w4tWFcpoH0yJU73FNWQ3tGfIm0dyCNFO6jGQGP2XEvUfUIpv1GDxFrIaUop8SW5ITRJt5tBtVhYbOjuUIsVLv9f622TAcD76Tow+t/EvvPyafoz+rn1qgI3Jg0KGCmSK/HEWC40SkODvGYNsgszXO7r26BX/e7/CMsgIIZAkc+zS+cVkpF8ozuqgXJEeSzdMlAtxcY0xvYNGf0g6WWeW14gi7OX6TMU1ifzip8hnRGAj7fOps8qd2McVSRWaQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c84805d-e178-462e-6f99-08deec324463
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 22:56:17.4186
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tgh4GW4ke4gVGjd6rxZmHcDXUVXnOWER5Jm+sbE9NuBlBljMaOsU4pj6cZQmWKYWHw3WBotvL9rLaLuOB7Ss09Tjy46zdHDuT6Hp4yCx100=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF8517B3F27
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=I/JVgtgg c=1 sm=1 tr=0 ts=6a67e216 cx=c_pps
 a=m/LAOfpIcXRJv0ug5Ru3ZQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8
 a=gH8vcDOTmKDoYkm8A40A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: ym-SoIxAd7Qe8tOQAZ5hWyMMFhaxdrwm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDIwNSBTYWx0ZWRfXyM3ul4UE210l
 hsHCTx/GVj5ig3B/ZkEyUd5fFvk1DkBm/ZWPAEmjI01qxeeBFbaDEfQ96BGSK6c0LHqWMkk3F6Y
 dhm1UtnqNz5iedEv/NT8uSVAkE5aVJbD0LcRmY84thwt11Q458L5uvQ7nRNerbGIL8/dz4pw6Tw
 Z9VSOlaoFx1G+jb7cNuJ2IOMim0hS4pIv2O+1Hr0JvXcJoMZN8vC9hl7+yP6/7zFnSWP5BndIlC
 OKv5/gOkCakujD0gV6kScZTFmfGpoTZW9QJpiQiZz227uXY6zdeU/rMo1kY0/xnqrswrbIto2wf
 KK+QBimyEleHIDHUujpNP4XV3lx6qv4vu+7secTXWXjgasFWmfnz63eKEpVQ4kmNlG5Zh83NGvh
 xWS/LKX5y56kesX9OqXceobvjBdskN6lnWDX/tOU9WiuQXwoLktzOjrQVi0LtJbCv8YXSnY/v+r
 vTF+jHSuhnUOiVLLg1A==
X-Proofpoint-ORIG-GUID: lR7gtej2fF21CGhV-Fq_ebSQgi8I64tr
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDIwNSBTYWx0ZWRfX2CJwTAQVsi8/
 fj3QcXveqjVWrQWSTZqG+yB/KEW83PonH/qTLwd/tRl4o/eDoRBYe3p/lQK5K5jgsTYtNgjYYYn
 lolPTPuqvfL+BVMjXqv9aY5sglphDOER07j5vmwyiVdxk9ym/noa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_06,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 phishscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270205
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 22:56:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242126

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

