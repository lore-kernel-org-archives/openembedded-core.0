Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0BD0CCD184
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 14:45:30 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.18481.1760453121440610995
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Oct 2025 07:45:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=oxGEKwIn;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2382047737=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59EArZG82578317
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 07:45:21 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=jbwHp4oy0H0+9Zn0RMA+HuvvnovQxrmSIrrIpKpTZbM=; b=
	oxGEKwInj6HL+ybbycYjhHuzcDm2rlUcLXJXX54x1lp/vAgjABkzLuVg57oZHiJ0
	RBMUPYblA1dCI0c5It/mQ22aZWcIXwBMZo0kARkMOxiGyzHTp83Mgahe4TfEajwY
	B8nspBjaEwka0t0SzV46LMb7z5X2oyFL0j1C54o94h/MDQs4Xd0iiol2I124GuOu
	iDidleUXg2jWi8XDZVsRhE4i75LkAIAcPidMQmtAYIR/+Q3tMFfUxtNCs1wNHhqQ
	2e2t0puQ/mW3ZbIwe2NMS7Fws4OnMReF2xPfx9Up8tNuxNFuTlAlkajSvkboBSxa
	7Xbx/OQZef9mKPh54roI0w==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012042.outbound.protection.outlook.com [52.101.43.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49qprdty28-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 07:45:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HV/xkk84EbFIYvWaNyKnm8BatsQp+SE4rhb7KdVqmimtNEz2wEVdcfwiBlSwOmpVnYciRtY2Emtcs/LEt9k7aFle5aMURXkSjs3b7UmSCg8DoKFxesoIudGa8kRNoZ+4yBkAOv2Eg5IBwBRawEX7k6CndrZPemvh++cwRdACfKJHjTZUiu4mNd34vyhtHZlpRGiKFTimcMxN1kIVMNTjLnWnvo1DQ2y0qCmO1/NPFsc2uRoie88YXTc+5tGopbFIYPx0rRbEJ0pGULnI8DW5Npl/UxosdaV5IM2DTcWPKP6L4gWCaNKAURM5q5GXMMV1woNWEBdlTC9F/nbVA13GrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jbwHp4oy0H0+9Zn0RMA+HuvvnovQxrmSIrrIpKpTZbM=;
 b=A8/xwnw0igfvRdUJf2/0s3tUskngS+tAX8mNVuCiNXBfVxDMpSE05XwbnyaH99NirKYB2+Bqd/uUXtz+kwXcVZIz3bxROiTFIq9t8Oti+aXq18BOJ+LdfoH3GQL0GZekh8wkqD24mAfWEcsJuDWwXTPT7NRfsKQMVENnAElx/xLlwa0dlO+4mEOAKNslAKRWXBeAiqPQqWZQfCcTP0RsbUgZ1E09dw/cIvw3PDpmDKGou7XLYAtDHc66vqYcwzZRfRl13Npgwb3o+UiQ1VSsOlfuFf53qrDaprebzRqXR5TW3w9xnCdcqFHleqK3tN/zIrDzVhsrIB56yw+bT6d4nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 SJ2PR11MB8538.namprd11.prod.outlook.com (2603:10b6:a03:578::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 14:44:49 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d%3]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 14:44:47 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, sunilkumar.dora@windriver.com
Subject: [kirkstone][PATCH 10/11] glibc: nptl Use all of g1_start and g_signals
Date: Tue, 14 Oct 2025 07:43:46 -0700
Message-ID: <20251014144347.536537-11-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251014144347.536537-1-sunilkumar.dora@windriver.com>
References: <20251014144347.536537-1-sunilkumar.dora@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0279.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::14) To CH3PR11MB7896.namprd11.prod.outlook.com
 (2603:10b6:610:131::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|SJ2PR11MB8538:EE_
X-MS-Office365-Filtering-Correlation-Id: b83c7af4-4cd6-4536-5c54-08de0b3038ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?zi+O22A+QNzG+zY0HZ34HxpHRTYFUFlX7J3eI9gi/MPfjlpYRVrZFp1faBe5?=
 =?us-ascii?Q?cy0zggnH8Iq/qAM8dyNHLmuuNeJSyZVPkAHUTCrU9rMNZTnd9NVYRqKCLjRw?=
 =?us-ascii?Q?9WPZn6ESb563zorG7DgFY9/+Uxm+kvz5sKXanwyHr77Xd5jXp+VFclZwL7VK?=
 =?us-ascii?Q?07HbIvmAkXMKdOg2whOT0EGmUhEAkEW70Dur/3FEgdPq3ZFk1nm51MfjiQaw?=
 =?us-ascii?Q?sHtg1h/29bY0stjE2hsxTE3ljKNf09Zxtb3XUPLeRll2gxzQXHY5SHMx9AQ3?=
 =?us-ascii?Q?GFc4vqqsJn7nAGNDHNnqytwQMUO9Z05kETaotiNpOjcyPtQspjLvqPVDSLgx?=
 =?us-ascii?Q?Gm2ED9CzLYjhCXnAk9xJf1RTvqbV0ikv1iTeSQ7PA+cdFpvVUpmpUyMlOvjO?=
 =?us-ascii?Q?6Tr7cVMLyeGPUTukZzUyUhdjwKmJKZ/qYqMuWEmuxpyiPE85hRM2fw7z1wbI?=
 =?us-ascii?Q?6IlotasBvaycZIaZ1GTAdILi5Hj7Eh90HZJrHeLa1A/yBP5RpKfexQE/tgtc?=
 =?us-ascii?Q?Tl7sT9mchfTyf2c2XuHsIAf682n437XtPqjctX9OjMLT0dU/KVFFsXpTY356?=
 =?us-ascii?Q?NPE3vX6ET3YAN0Uyape1QyFwIocA1al817RKdUgxIsH1xOKM8Q11nO28svk6?=
 =?us-ascii?Q?cIlOoyakfzGwveHTuEFcN/cyRgYg5Z9rRbHKonC3KiXKObeCnw04Nqq+Rqcn?=
 =?us-ascii?Q?3EDjJb/UaKrc1EyhJp1YqeQvy5eyCfIO5KGKb7+6JjPi7MLvw9Qe6MWlvk9w?=
 =?us-ascii?Q?OBoh2fxumYJJ0zvDLHjdoZM+td6exZOFsvbF4svYBeED46MmFe6SHMpWzdVX?=
 =?us-ascii?Q?XXzMypGNR3+wugnnSGxoHIQnvsgJ0HlVgo+kOXLBaZm4RSTGuwur3wFKrbVg?=
 =?us-ascii?Q?L18jxl8I8VNBoY74nXfON7aegrN2a9seXy1ecocfgD8+5NolUpitN+V/WvRW?=
 =?us-ascii?Q?Q6d6ijALmpjynZ0snrDXStHh4JMVSnOr72HXm9g96ibOV8+Mvwwo6m9+exdU?=
 =?us-ascii?Q?xUKUvy0TLXS3mtiNItmkwmdOAOhm6ajCcRByWZ5rlWIurP6Xb2BHbaGjset/?=
 =?us-ascii?Q?Z2bLOAuwmCBp6mdbOpB0REQZ3Sqml01WdwkGQX6DqDk78Nk4hypqcO4xEkjj?=
 =?us-ascii?Q?uzSTV0nlhZ2h+W6XNhzfz1KkpkW28l+Sp8CMV+TsdeELpaYNuMQagWLmxsUk?=
 =?us-ascii?Q?uE5uRFYbmdPh5hbXxuAjSvY/1RazVCQeXTQARMD5ehcQdwSoeqtRCebOYaOc?=
 =?us-ascii?Q?TgX06nDsdps2ExRFh/tP3Fj/R1hE2ruKXWs54cZ8A3XBP1IJ/Q7KCnt0w02x?=
 =?us-ascii?Q?uMMv1ONUonM6lRpHeFSJmrDAE9cELv+riL0C6rGi+rra9tIIXQNdzTz7b+S+?=
 =?us-ascii?Q?V8Cc4Tne6aWiDSXoAvSNwXFMDoGDrYf4BurmXcBrFDPbBJtTIkpKsBh0ax16?=
 =?us-ascii?Q?bOU7HLDs09RU47CmhT2DOxr1M7EIVo6UpCwgZxKW+RjaTNxLXA9z/g=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?A/g275EF5tHMXOv4Tg0Z1cet19+QtMD0aEV29eg0ORRtxw46yb+mJaGtc7yL?=
 =?us-ascii?Q?q9jeRK0AtQyrQSqtpIem/beHRMG/RgpNa4+jL/vcyo5vfY/ffl8htE0NBnlR?=
 =?us-ascii?Q?DNY6Lu/ZwPJ8b/j8GHDYJTScBugZef57sITzcsske2UgOmAH/hCsHg4eq2Ah?=
 =?us-ascii?Q?IEM/YrRRg/W9dkCWmWWGQi8/dZX1tC/+o/iIWZh3PXERme2HNzv+On8FMGUA?=
 =?us-ascii?Q?o6OkvPDMmW23E8hcH0LOWF4aE4VLPoVPWbViRW5uErFjC+2VaRDrmaYKXRHx?=
 =?us-ascii?Q?Ptv43LtrGwkSkOKOfci6TXyXoM2ZB/pZGKwmLJBlSuas/dXlYeKCfvkyNjU9?=
 =?us-ascii?Q?oJ9Se6u1gL+cbxU5zBcS+eZkz9yxBSRTlMWP2unehn57Y++TPKv4auTQCdET?=
 =?us-ascii?Q?uivBVijNvsCJ45xwbXf/TtR/KcSFdcNTg/dpR7OeDJk12zaiQhLKSieMnIVl?=
 =?us-ascii?Q?UD8QTEz92bAGhoWCzYXYzl13S0TF0j/NAHniiHtknS8MBLSosf6IFCstE2zl?=
 =?us-ascii?Q?oKn7SbpMFT4PGyZQbn+kouWDn1bsUuvXdC+MTABB5VEzo+TAz1ta1GYXCQ1b?=
 =?us-ascii?Q?LW6w4+RPaQ1pJmCxl2vZcjqswUlE+YJQsZeFhroR9J0cSMPPCdsPdUyd97wr?=
 =?us-ascii?Q?6kUX1/ibimJYw8et4la6ukZJmuAWSUZRn3Kbnxv6cLk8F0aCcWXf140RqROR?=
 =?us-ascii?Q?Zg2hz7vW01/uZkSy00KCXdztP/vAjs6o6vOYpRYpzX2v6uCW12G7+u+dufxy?=
 =?us-ascii?Q?2lzWlkhJfOTSGdNOoSeQW1HLFtyz3DTCP0jiSAZJfc6Z+wtE/LyBdRrbYbRg?=
 =?us-ascii?Q?wlYLXqyjLMF5JKiWNdzqlyobZE+BQSnIvTZNEifL1n32RMa1YkXEB2wX7R2s?=
 =?us-ascii?Q?A2KAwTeBQkFDPNYkQn4vr8zLoAh6zC6uuDvccSC36Y7gB5wZ9GeIFOAIVJn3?=
 =?us-ascii?Q?MfAV37wVzA0reTwOc/BXPndZcfbraU6Hk67eCzrG/D9VPCgjf8Nsur+7d++n?=
 =?us-ascii?Q?VrBNxo/kQdBxhgc+TSIVnakLQgOOIT0w5h9XQApLkj1dzfE5v0/r7SxetMeK?=
 =?us-ascii?Q?kCecjDEjbRwNiw0Iyo1FPKACxIZSCvT0TCaCANNCcjQeOtE8mZmfuMkqTBJa?=
 =?us-ascii?Q?0OfND11PaPc82eRHjTmFds3LHRUG8ZQcma852JPt/l+u47COL+KYDE+0/4nX?=
 =?us-ascii?Q?2fh/goihzAL9yKqo9qRFvcFkjMUHXVWZPPtan6GH8e7fgl8/3Pk5pD/neKBR?=
 =?us-ascii?Q?SVELtGfVroV8aEFzOddhoak5gWcgdEh4WAJjfHCoTh/PErmmKJz45Hpcq4V8?=
 =?us-ascii?Q?yDWxmwFIfoD0BiCzXK8BljlbetCcnBvzAdR1TNTU+E6liuknQCMZ9VBkfVqf?=
 =?us-ascii?Q?EolgS/DADTdlQoHauMoaE7xwzNbPGSKrLpzzNGbV8t2xH2VyJe8G6okzBthE?=
 =?us-ascii?Q?CkBbeMkPWLwigXDVlyxWoY0WoxbINCA4HMvVF+9Yjebsq04q3e7HCjBW+r1Z?=
 =?us-ascii?Q?GmM/su8rH3lEn854VVlD5CTWOB3tSY7XLRqOg/wUCPxbNI6Xah+Y7PeB4P5M?=
 =?us-ascii?Q?UqflrukDHv1n/wkZdxR0ekt4CL9ns9fjbrq29bgcutAXCFs32GkxYpL7zmpq?=
 =?us-ascii?Q?eTZ1TbK8QWt6mJd7zsEvDOU=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b83c7af4-4cd6-4536-5c54-08de0b3038ea
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7896.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 14:44:47.8343
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +8/tvb6CaVQqd7sOdJwkNhSON2LHHEUpzPPgK8cfBm7XP9lZS7SEHVKYyRSiIwtcmr4ExykmYVC3w0tZUJ46h2MuxzL8VRWlqJa7HW3Xwns=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8538
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE0MDExMSBTYWx0ZWRfX0Y8bS4fHlJsr
 SNryn+odSeoXafAGs5fbWuj19PAgQTIYEwPEnfVPUGK0IMkC3VYc7hEmm2/URo8vVuyOSUieKD6
 rlgQOyh29+r2rJ3fT/36NZ2bKVSOK6z4QSHuO5V0t/MusmA6DWkIz/ukxEoUroYCavtK6IQDcNZ
 f9tVQjR9gigOYjm61JVh4kVGt28+Ruba8B9nZd8kpx8tV3Kb5rjeGqOs/XjFp/NT+gOdiO3zp22
 zMn0WTjLWkOpCcKEbLBsirO6Cni/WyKztRHUgdlMqSfplJvjjDACu4keGwKOLW1MXSdWoKDwof2
 Jfrq7Hv3FisF2RqbSLwGOSvWXe7QyiUrj9pJVx6iUh34b1qjmS7LRqvaKbeoPIrEQ33WREXK/dv
 K4+XUmW8OB4oHAIkRSWjv7jFDKzbUQ==
X-Proofpoint-GUID: FuQG6hqiTokA1SSG-Q4MRFTPH1u_Dzy4
X-Authority-Analysis: v=2.4 cv=JaKxbEKV c=1 sm=1 tr=0 ts=68ee6200 cx=c_pps
 a=vwzr6GK/qOZR+/kkcyjBFA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=X6uU5uM_jJMz_PZaGGwA:9 a=bmfxkABXaUYA:10
 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: FuQG6hqiTokA1SSG-Q4MRFTPH1u_Dzy4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 clxscore=1015
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510140111
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 14:45:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224829

From: Sunil Dora <sunilkumar.dora@windriver.com>

The following commits have been cherry-picked from Glibc master branch:
Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=25847
  [1] https://sourceware.org/git/?p=glibc.git;a=commit;h=91bb902f58264a2fd50fbce8f39a9a290dd23706
  [2] https://sourceware.org/pipermail/libc-stable/2025-July/002283.html

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
 .../glibc/glibc/0026-PR25847-9.patch          | 193 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.35.bb         |   1 +
 2 files changed, 194 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-9.patch

diff --git a/meta/recipes-core/glibc/glibc/0026-PR25847-9.patch b/meta/recipes-core/glibc/glibc/0026-PR25847-9.patch
new file mode 100644
index 0000000000..49815c6fb7
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0026-PR25847-9.patch
@@ -0,0 +1,193 @@
+From c2677e68956bb9677d8de4ee6c5341b1a744d490 Mon Sep 17 00:00:00 2001
+From: Malte Skarupke <malteskarupke@fastmail.fm>
+Date: Tue, 14 Oct 2025 06:40:57 -0700
+Subject: [PATCH] nptl: Use all of g1_start and g_signals
+
+The LSB of g_signals was unused. The LSB of g1_start was used to indicate
+which group is G2. This was used to always go to sleep in pthread_cond_wait
+if a waiter is in G2. A comment earlier in the file says that this is not
+correct to do:
+
+ "Waiters cannot determine whether they are currently in G2 or G1 -- but they
+  do not have to because all they are interested in is whether there are
+  available signals"
+
+I either would have had to update the comment, or get rid of the check. I
+chose to get rid of the check. In fact I don't quite know why it was there.
+There will never be available signals for group G2, so we didn't need the
+special case. Even if there were, this would just be a spurious wake. This
+might have caught some cases where the count has wrapped around, but it
+wouldn't reliably do that, (and even if it did, why would you want to force a
+sleep in that case?) and we don't support that many concurrent waiters
+anyway. Getting rid of it allows us to use one more bit, making us more
+robust to wraparound.
+
+The following commits have been cherry-picked from Glibc master branch:
+Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=25847
+commit: 91bb902f58264a2fd50fbce8f39a9a290dd23706
+
+Upstream-Status: Submitted
+[https://sourceware.org/pipermail/libc-stable/2025-July/002283.html]
+
+Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
+---
+ nptl/pthread_cond_broadcast.c |  4 ++--
+ nptl/pthread_cond_common.c    | 26 ++++++++++----------------
+ nptl/pthread_cond_signal.c    |  2 +-
+ nptl/pthread_cond_wait.c      | 14 +++++---------
+ 4 files changed, 18 insertions(+), 28 deletions(-)
+
+diff --git a/nptl/pthread_cond_broadcast.c b/nptl/pthread_cond_broadcast.c
+index a0743558..ef0943cd 100644
+--- a/nptl/pthread_cond_broadcast.c
++++ b/nptl/pthread_cond_broadcast.c
+@@ -57,7 +57,7 @@ ___pthread_cond_broadcast (pthread_cond_t *cond)
+     {
+       /* Add as many signals as the remaining size of the group.  */
+       atomic_fetch_add_relaxed (cond->__data.__g_signals + g1,
+-				cond->__data.__g_size[g1] << 1);
++				cond->__data.__g_size[g1]);
+       cond->__data.__g_size[g1] = 0;
+ 
+       /* We need to wake G1 waiters before we switch G1 below.  */
+@@ -73,7 +73,7 @@ ___pthread_cond_broadcast (pthread_cond_t *cond)
+     {
+       /* Step (3): Send signals to all waiters in the old G2 / new G1.  */
+       atomic_fetch_add_relaxed (cond->__data.__g_signals + g1,
+-				cond->__data.__g_size[g1] << 1);
++				cond->__data.__g_size[g1]);
+       cond->__data.__g_size[g1] = 0;
+       /* TODO Only set it if there are indeed futex waiters.  */
+       do_futex_wake = true;
+diff --git a/nptl/pthread_cond_common.c b/nptl/pthread_cond_common.c
+index 3baac4da..e48f9143 100644
+--- a/nptl/pthread_cond_common.c
++++ b/nptl/pthread_cond_common.c
+@@ -208,9 +208,9 @@ __condvar_switch_g1 (pthread_cond_t *cond, uint64_t wseq,
+      behavior.
+      Note that this works correctly for a zero-initialized condvar too.  */
+   unsigned int old_orig_size = __condvar_get_orig_size (cond);
+-  uint64_t old_g1_start = __condvar_load_g1_start_relaxed (cond) >> 1;
+-  if (((unsigned) (wseq - old_g1_start - old_orig_size)
+-	  + cond->__data.__g_size[g1 ^ 1]) == 0)
++  uint64_t old_g1_start = __condvar_load_g1_start_relaxed (cond);
++  uint64_t new_g1_start = old_g1_start + old_orig_size;
++  if (((unsigned) (wseq - new_g1_start) + cond->__data.__g_size[g1 ^ 1]) == 0)
+ 	return false;
+ 
+   /* We have to consider the following kinds of waiters:
+@@ -221,16 +221,10 @@ __condvar_switch_g1 (pthread_cond_t *cond, uint64_t wseq,
+        are not affected.
+      * Waiters in G1 have already received a signal and been woken.  */
+ 
+-  /* Update __g1_start, which closes this group.  The value we add will never
+-     be negative because old_orig_size can only be zero when we switch groups
+-     the first time after a condvar was initialized, in which case G1 will be
+-     at index 1 and we will add a value of 1. Relaxed MO is fine because the
+-     change comes with no additional constraints that others would have to
+-     observe.  */
+-  __condvar_add_g1_start_relaxed (cond,
+-      (old_orig_size << 1) + (g1 == 1 ? 1 : - 1));
+-
+-  unsigned int lowseq = ((old_g1_start + old_orig_size) << 1) & ~1U;
++  /* Update __g1_start, which closes this group.  Relaxed MO is fine because
++     the change comes with no additional constraints that others would have
++     to observe.  */
++  __condvar_add_g1_start_relaxed (cond, old_orig_size);
+ 
+   /* At this point, the old G1 is now a valid new G2 (but not in use yet).
+      No old waiter can neither grab a signal nor acquire a reference without
+@@ -242,13 +236,13 @@ __condvar_switch_g1 (pthread_cond_t *cond, uint64_t wseq,
+   g1 ^= 1;
+   *g1index ^= 1;
+ 
+-  /* Now advance the new G1 g_signals to the new lowseq, giving it
++  /* Now advance the new G1 g_signals to the new g1_start, giving it
+      an effective signal count of 0 to start.  */
+-  atomic_store_release (cond->__data.__g_signals + g1, lowseq);
++  atomic_store_release (cond->__data.__g_signals + g1, (unsigned)new_g1_start);
+ 
+   /* These values are just observed by signalers, and thus protected by the
+      lock.  */
+-  unsigned int orig_size = wseq - (old_g1_start + old_orig_size);
++  unsigned int orig_size = wseq - new_g1_start;
+   __condvar_set_orig_size (cond, orig_size);
+   /* Use and addition to not loose track of cancellations in what was
+      previously G2.  */
+diff --git a/nptl/pthread_cond_signal.c b/nptl/pthread_cond_signal.c
+index a9bc10dc..07427369 100644
+--- a/nptl/pthread_cond_signal.c
++++ b/nptl/pthread_cond_signal.c
+@@ -80,7 +80,7 @@ ___pthread_cond_signal (pthread_cond_t *cond)
+          release-MO store when initializing a group in __condvar_switch_g1
+          because we use an atomic read-modify-write and thus extend that
+          store's release sequence.  */
+-      atomic_fetch_add_relaxed (cond->__data.__g_signals + g1, 2);
++      atomic_fetch_add_relaxed (cond->__data.__g_signals + g1, 1);
+       cond->__data.__g_size[g1]--;
+       /* TODO Only set it if there are indeed futex waiters.  */
+       do_futex_wake = true;
+diff --git a/nptl/pthread_cond_wait.c b/nptl/pthread_cond_wait.c
+index 40a74342..d7e073ab 100644
+--- a/nptl/pthread_cond_wait.c
++++ b/nptl/pthread_cond_wait.c
+@@ -84,7 +84,7 @@ __condvar_cancel_waiting (pthread_cond_t *cond, uint64_t seq, unsigned int g,
+      not hold a reference on the group.  */
+   __condvar_acquire_lock (cond, private);
+ 
+-  uint64_t g1_start = __condvar_load_g1_start_relaxed (cond) >> 1;
++  uint64_t g1_start = __condvar_load_g1_start_relaxed (cond);
+   if (g1_start > seq)
+     {
+       /* Our group is closed, so someone provided enough signals for it.
+@@ -259,7 +259,6 @@ __condvar_cleanup_waiting (void *arg)
+      * Waiters fetch-add while having acquire the mutex associated with the
+        condvar.  Signalers load it and fetch-xor it concurrently.
+    __g1_start: Starting position of G1 (inclusive)
+-     * LSB is index of current G2.
+      * Modified by signalers while having acquired the condvar-internal lock
+        and observed concurrently by waiters.
+    __g1_orig_size: Initial size of G1
+@@ -280,11 +279,9 @@ __condvar_cleanup_waiting (void *arg)
+      * Reference count used by waiters concurrently with signalers that have
+        acquired the condvar-internal lock.
+    __g_signals: The number of signals that can still be consumed, relative to
+-     the current g1_start.  (i.e. bits 31 to 1 of __g_signals are bits
+-     31 to 1 of g1_start with the signal count added)
++     the current g1_start.  (i.e. g1_start with the signal count added)
+      * Used as a futex word by waiters.  Used concurrently by waiters and
+        signalers.
+-     * LSB is currently reserved and 0.
+    __g_size: Waiters remaining in this group (i.e., which have not been
+      signaled yet.
+      * Accessed by signalers and waiters that cancel waiting (both do so only
+@@ -391,9 +388,8 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+          too.  */
+       unsigned int signals = atomic_load_acquire (cond->__data.__g_signals + g);
+       uint64_t g1_start = __condvar_load_g1_start_relaxed (cond);
+-      unsigned int lowseq = (g1_start & 1) == g ? signals : g1_start & ~1U;
+ 
+-      if (seq < (g1_start >> 1))
++      if (seq < g1_start)
+         {
+           /* If the group is closed already,
+              then this waiter originally had enough extra signals to
+@@ -406,13 +402,13 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+          by now, perhaps in the process of switching back to an older
+          G2, but in either case we're allowed to consume the available
+          signal and should not block anymore.  */
+-      if ((int)(signals - lowseq) >= 2)
++      if ((int)(signals - (unsigned int)g1_start) > 0)
+         {
+          /* Try to grab a signal.  See above for MO.  (if we do another loop
+             iteration we need to see the correct value of g1_start)  */
+            if (atomic_compare_exchange_weak_acquire (
+                        cond->__data.__g_signals + g,
+-                       &signals, signals - 2))
++                       &signals, signals - 1))
+ 	      break;
+            else
+              continue;
+-- 
+2.49.0
+
diff --git a/meta/recipes-core/glibc/glibc_2.35.bb b/meta/recipes-core/glibc/glibc_2.35.bb
index 265dcb9129..26e8d8c408 100644
--- a/meta/recipes-core/glibc/glibc_2.35.bb
+++ b/meta/recipes-core/glibc/glibc_2.35.bb
@@ -70,6 +70,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0026-PR25847-6.patch \
            file://0026-PR25847-7.patch \
            file://0026-PR25847-8.patch \
+           file://0026-PR25847-9.patch \
            \
            file://0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch \
            file://0002-get_nscd_addresses-Fix-subscript-typos-BZ-29605.patch \
-- 
2.49.0


