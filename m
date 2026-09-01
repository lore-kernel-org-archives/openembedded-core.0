Return-Path: <Ghanshyam.BanaitSanjay@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1562C624CF
	for <webhook@archiver.kernel.org>; Tue,  1 Sep 2026 10:40:12 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5113.1788259204946431377
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2026 03:40:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Te8yDogQ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3704ae816c=ghanshyam.banaitsanjay@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AKILi1314347
	for <openembedded-core@lists.openembedded.org>; Tue, 1 Sep 2026 10:40:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=J6LiZbf6WpfDDAEpJMSW
	eVS9wJlsoKVSFDYnO7JLruI=; b=Te8yDogQld9h1SE0H/vrzR1niTeTSzFBegno
	PiqCAgakeCTg2HT6QIJzyDB8DkpfZGIfymt1D9KALwduimeeCltiI0SrG147mFHg
	QcRS1OiXFmB219EqW/QgdDbVwLWZyKOd3fB2bNk1ELuQggi0euU4saqezdzUu5hE
	4lZJMft2QYrWS1yD++TWTxfcT45qIhxBFLsKM+Blw9HhyKIvbOlbOfCpmj6O7sDO
	46K9FZcLMUGO9nk72y4BfAhSQLZOVCMKI7tfkUNf9Z/JsLGZZrL6a0GlrGYPjVqi
	G844q/o7tELFncGT0u3iUbESEEZanxaVI2IWI3qMY7lnKuu3/A==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11021107.outbound.protection.outlook.com [52.101.62.107])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gbpd7v5e3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 10:40:03 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dSCnu9pV5x6jIFr6ODnwMCryFyIghKhE8xGn84isMuvt/I7t1IVfd9w/LdBv7MpSQpRQQiYnb2MzzrVpsnaMaWPsxIN6MuxSzjHMZrdro2m6JBDgbanB5EGOqxmISHTfz/1c6d3UexpjzX2WI0l6WveWBY/yfVqfoWaxhWaKkvvhRgkS4Y+9liv0BQ3YSZ7cE62/CaaeX90Tdh0TVx+k9ekIBThhmnEIxlqUcHYTxXXLiSyiypy+7sPyXb8344o2UyQImvHl/J/xKgqf2+9WO5AJ3ftz8HaBd+mApVuGLWEvyLo2+sjaKxXl1o2czkFVmtJk6w2s7wuJZwhLjPlkBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J6LiZbf6WpfDDAEpJMSWeVS9wJlsoKVSFDYnO7JLruI=;
 b=PvDm/X2wtmZWuxEyZlIk6AD3pNePUydCf0QUrTrNljtisuV/wqB0Rg0NJ4YtA/zbh3IdOu/oor16HGrSAOx0ks/f19RKpJ8Kb40DZ+CKigic2/rvswKWlde1c/llsrg2mWW0bimGJEd0O1URwouPne9/CDuyhb5msCwpmS3Tls1/yJZqXDZ1+yg0sEwNuQam5RoefINmJsqm4POCjrRmLQh+smQArf/tbwSw7xLK0KDgz9nmstuLFbG5hCwzmyeXy54uSipFjajMTZj5Oqv4Qg+XXBvA3XE3KWuaUSOMvxPFPhPIvE5Yi9ectOeecQS7df9F0OEm7DjVBFdcf6+2Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ5PPF57F27BA08.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::82b) by LV3PR11MB8482.namprd11.prod.outlook.com
 (2603:10b6:408:1bb::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 10:39:59 +0000
Received: from SJ5PPF57F27BA08.namprd11.prod.outlook.com
 ([fe80::68e:cafc:75a:3e02]) by SJ5PPF57F27BA08.namprd11.prod.outlook.com
 ([fe80::68e:cafc:75a:3e02%8]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 10:39:58 +0000
From: Ghanshyam Banait <Ghanshyam.BanaitSanjay@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-Core][PATCH] libssh2: fix CVE-2026-58051
Date: Tue,  1 Sep 2026 16:09:37 +0530
Message-Id: <20260901103937.1630469-1-Ghanshyam.BanaitSanjay@windriver.com>
X-Mailer: git-send-email 2.40.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0060.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2ba::8) To SJ5PPF57F27BA08.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::82b)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF57F27BA08:EE_|LV3PR11MB8482:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d87f2f2-8b6e-42ba-8744-08df08155eb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|52116014|10067099003|12006099003|11063799006|56012099006|18002099003|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	lx6u3fsi9WguyePU7oI/XIsd23DGsqNUfqeRBAJeoHKR7WDW9YDw/vHkHjk+MaZEjLWwpkEA2YHxjG8xMcOK5aWDnsfcvmU1cHrX90rnqyF1N4HVL/lr0aP0IdHI0goQM/5z6iQX+smFnIKdR8drY+nJPejjG2YwjKwRf3dmPtr3UZ5Mum67gXR00WDdYmfXScX4wvcqQc2g/tHVPfSYY4dPQ7UVBNN+EomifVpyJeeljSOA+d+0e0On9G9d6uEj2Y4BiD5TiD5BVnhQ2+6jzeCt+Q0frgTy6gwOwW9ZiCAQduuFxHnuI/0Clz0JsawsD4f/D0ZyS1u0yc1wUuceAQ6T244AyJ6/XUCJdZ0dJLPNnyp9aItR6/3wZpjjDEThxIH2/S3A3PcNWkqA4L4Qm5ixdhg3rNBOm0OCmt97R5wqOEx+wg3EhMJLBNASHQjugPPmNJZV2gOxZPtbXmzaDS+uPXzdLs36BbFATHEUhjl77un3tRA6PgGoIesAaWWVV7GlbPKp05iAlmkZH6iaVJrJrnGK1KD1xbXOKRJyHdv4n1OCahNjW62rPdYbbbfqRwrfkcK37fBXDRLm1k4m36+m9fxH4QPNmC4g3qx/xmXyU3cMYHlR7Vd7GrCg58axZ/z+wUWMluxuY9xGY8zd2qtzGRGOE43OuJk+PwrNX3Y=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ5PPF57F27BA08.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(52116014)(10067099003)(12006099003)(11063799006)(56012099006)(18002099003)(13003099007)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?oMHF2EwAnea3iQbn4WWVvqNFlIyNFHf6GTLwZ2sK89dvOmRXZ2/4M++qv/2t?=
 =?us-ascii?Q?xZWK0xEU3xnRmPbBw+3+VYA0nHY3Y1kefC20iQSNe1rGSl4Sp/VBvtssQ09g?=
 =?us-ascii?Q?XYpgwtS2ncfgflpaqeeNW3n1+sPHFjD33igEHYqJOkdArkIN7oxnmwFQWCnI?=
 =?us-ascii?Q?q08zXbyNg4170ZgbuCQwMvcpWCwZwqY9KwS9OhdHDS420os3XfbiR9UezrKW?=
 =?us-ascii?Q?7iCM+BREzNtt1Ra0NQ0WEv+wk9IrBWMsB3tdw36M7JRAxLoBYK7ZRhfK/CSE?=
 =?us-ascii?Q?1LPUcVeaAfmiDFKIQZP2SlvZvZu6pBKFXxe4RN65oh9SLgV94+gUJERoku0p?=
 =?us-ascii?Q?Eyczr2MvtKOKRArcRWtstFVufdoG8tAC4yPBuVRtvxAmrUI8wLNgQRUurpGS?=
 =?us-ascii?Q?YUfa3vJpXLVs+cSl5sAI3fxp7TuPRW5rJBXQtiCRhD4J0RnFLBpN7LFk7DFd?=
 =?us-ascii?Q?8CGSPsBhpwLxaKbbxgJZ26z41G2dFa5WRiTxwVIYXig7ebAwih2iZ7r4jtcN?=
 =?us-ascii?Q?w/aSZ1HrXKbBCfyvHCqTADZgqSR+qnuuEoWXSVIcaAa6h6QZMepjsMbBaOG1?=
 =?us-ascii?Q?aTwA+4Sze03CjvaEssLZOJauInuD57n20m3bwC7byoRw07uwGb+ql9VsHCoP?=
 =?us-ascii?Q?xkIU+ZZEWokLv8fJeilXBUfB9AYIGYTwIY5PI+JUf+Wrwix6z33QXPZt1t/I?=
 =?us-ascii?Q?0Hs/V5F5JsmIpcfbQMfec1sUHdKwBgAgU6lSH2jWRQpb7scrY4VqfIp6msZz?=
 =?us-ascii?Q?WBdTd0u0dE09Ax7e6Gl/7PFXlYs1OPBYP+ncq2oMlnyU8LKdPHpI3AEDw7S9?=
 =?us-ascii?Q?b5XEcKb4gyMx6l3P40QOUlbwJh28AxcViurDmT36eisRUnATHmvcqcumWWUP?=
 =?us-ascii?Q?DPZ5fEjzZEhvqEjrtLgR539q9jwA7l4jHJIUt2rNVKTP91JgFZoHk3mu8s8A?=
 =?us-ascii?Q?nOZRPMlbFrK+gNNLj4M9fwhiv5fm1Fl+hrVb1KJ6jqAqZlqlndHJGKW/0df4?=
 =?us-ascii?Q?qGHKujWlBJrZQzQhpYI/M1VT0btvvalNx4soDBTxIoWY03Xgd7DwTiInN/+a?=
 =?us-ascii?Q?QugbqGlXGOQkgh7gFDHqAxa0MxdRG5fIrj121gD4BAXGFOVm+xfWF0v0zIUk?=
 =?us-ascii?Q?zQMu2iXmrz1Xe6cbJkABErKfLUKfbn3i0uOSsr9DpzdR2/EvyRaUYscy5Ucx?=
 =?us-ascii?Q?VU5yRhjN2rB9FnDzHJYZLRsi+NNeLWjPHZxd4c4otzBViciUT4EAXArIN6Qs?=
 =?us-ascii?Q?DZSWG/TsqXIkIZzPjfhV1+mSMq5z80LiIZ7RQ0oVE5ShZfEg259PGf+WXS4E?=
 =?us-ascii?Q?lF/ut1s3sqP7Yfnt3s6tnmPhUl7kEp96qmfiTHxO46VacnKR4RtcE64H/vyV?=
 =?us-ascii?Q?UUoIkTmpcLKMDy3mDbRmL8bgK1sOwcr7P0ihHW1rZ9OINI3Ro5EGI8xqaJS8?=
 =?us-ascii?Q?u4MuwklSBkz63MyPpWkOYsbACuyHtBx4TvNA8EUdMn1cUCglUMxfX1qLgMXI?=
 =?us-ascii?Q?GrFkagn2KPEwZ1FMIAknNR7uaWrPesU2jIqKmw83dyALwn2ZY6kJ2Pg8Z7dq?=
 =?us-ascii?Q?2PsAi2WWqMqtUd2fDPWH5jUNs96wp6M/xwgXBwEzZRtvUMYCfG2Eh9oaWzjy?=
 =?us-ascii?Q?8OXgEzZZbFHvAv9tBnZ6RwM5AoUJ5tnWCJ6CS1u80Qp7C+Swx2QYLvX4TmVi?=
 =?us-ascii?Q?Xz4mmHrFNbobIbqf5G+LzyKz+4X8nZBBy1ROo5da1oAOIl8tAZsTB6V55AC1?=
 =?us-ascii?Q?w9IfAa8fQz5RWXaP0LiWBKFxLwnwNLQ/1pHAdpcAljGDFG3w8iHy?=
X-Exchange-RoutingPolicyChecked: 
	Ou39fiC2NHeG3WcGFYkJFn/a0PUEjqcCY9YtQ6fk8yVa8/QLnqrM1R7S/cRFZdHXuLX5ODB32ooHDUeRnXgpXmvWiCxdVTEpExKyFIpDkYPeOVq6vi+xNbCNcb9rm010esil4+BR1jmFr9gdbvKUSuzFC3iuKzyjXqInxN0VX0seCw11JO7QhlhAVgS+965C0I5mhEoC+mr9HnreqpHpZsS9sSypT6YErI7moyysdGqq8IsGnr8bornJeEjqVJJCLa7njtLmQuXeR67K8ORz7IGIvMnebF51g2qZ6K2LmOGeE6Wd1OqlYf31RgsVHU+RPWKkbEaOchpno60ceMBR1g==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d87f2f2-8b6e-42ba-8744-08df08155eb3
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF57F27BA08.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 10:39:58.9158
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G3EDYlCwNaCQr9m2JHgT00dvtiX8el7sNQzAV5yzjHZoYs5+OPTvpuhx0l15j4zxB4DJigM+HU7GrH7S3nOG7gGfr0i10TG8D19//dOmyWyQ2Ki591HF2LDlwkQlmk1c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8482
X-Authority-Analysis: v=2.4 cv=Ie63n2qa c=1 sm=1 tr=0 ts=6a96ab83 cx=c_pps
 a=+HJImzcKfBiIxAXIXfD3UA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=PYnjg3YJAAAA:8
 a=NEAV23lmAAAA:8 a=oeppcwj8AAAA:8 a=t7CeM3EgAAAA:8 a=aV93AJox-TxQ-MY7focA:9
 a=EbX5vdCAct3xugfmopdr:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA5NCBTYWx0ZWRfX7g1JHkG/P0nY
 eN3v1rR2eGT0h7c6G+Hx7ecE/fWrj5T+bATENjEiVWVpvHkXAH7vm+2up9GdC6tEQsyP/KsEwDh
 bnuL7vI71KHAkkH9NLoMa0Gv0OYoscO3u8McYK8SePWx66C09wsRUxrfk5KILzMgp+lW8+Ln2lG
 +KR/SIUUziJX6lDEMx4c2sxbE9fMiYG7AGeNtr8qtIk2mPP/qSfQY4gvIi3z9GcHyUKYqOmgezI
 vPFCj63G4kZZaexuQj1tc2ZbS9oHmPGLsgzpxT9gxDSB7EMF7srv10E7QegNksxGHI7S4ncv+V4
 6ToKmWKDjAqgt/2AjWIC3CdWMqCjETgHg7bz54D+aZPb9k9xCRp46p/NY9Qt2icRALCTSLLKw43
 HKhyc5+Amf/C4LhKP56VKB7gMGMUHL8Dv99KOBl0SEvrleb81shciXToxVOng0QNe/mGC0YrprM
 DaGD0cqVwwKGioJnWFA==
X-Proofpoint-ORIG-GUID: bGvNrU6wLb9HxSO5hUTS6BIAvVZqhGBq
X-Proofpoint-GUID: bGvNrU6wLb9HxSO5hUTS6BIAvVZqhGBq
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA5NCBTYWx0ZWRfX6Mz2w6+AzWPs
 aWsdrp/UYaU4RbedS8dt7OgA8Jz3A6ftig6Z1OcI55gH7XcJz9LfUKG5pRBE6s5ibqTmwGzdNSK
 lC+5U8VzZaFwWRv4kUIiCePzpzq6Q51uGgLr1wT4JI/Ixguj9vS6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010094
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 10:40:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244817

libssh2 through 1.11.1 grows its publickey list with SSH2_REALLOC but does not zero-initialize new entries before parsing populates them,
so a parse failure reaching the cleanup path leaves libssh2_publickey_list_free operating on an uninitialized entry.
A malicious SSH server offering the publickey subsystem can use a malformed response to make cleanup free an uninitialized,
attacker-influenceable attrs pointer in a connecting libssh2 client.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2026-58051

Backport the patch to fix CVE-2026-58051.
https://github.com/libssh2/libssh2/commit/a9758da45a52bc8c630ec9493804d0c6ea30b24a

Signed-off-by: Ghanshyam Banait <Ghanshyam.BanaitSanjay@windriver.com>
---
 .../libssh2/libssh2/CVE-2026-58051.patch      | 34 +++++++++++++++++++
 .../recipes-support/libssh2/libssh2_1.11.1.bb |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-58051.patch

diff --git a/meta/recipes-support/libssh2/libssh2/CVE-2026-58051.patch b/meta/recipes-support/libssh2/libssh2/CVE-2026-58051.patch
new file mode 100644
index 0000000000..20f454a304
--- /dev/null
+++ b/meta/recipes-support/libssh2/libssh2/CVE-2026-58051.patch
@@ -0,0 +1,34 @@
+From a9758da45a52bc8c630ec9493804d0c6ea30b24a Mon Sep 17 00:00:00 2001
+From: Viktor Szakats <vszakats@users.noreply.github.com>
+Date: Mon, 29 Jun 2026 19:12:21 +0200
+Subject: [PATCH] publickey: fix potential arbitrary free in
+ `libssh2_publickey_list_fetch()` (#2127)
+
+Due to uninitialized list entry.
+
+Reported-and-patch-by: Behzod Abdullayev
+Reported-by: Sharique Raza
+
+Follow-up to e15f5d97a04cc676ce117dd324fef85b046207a9
+
+CVE: CVE-2026-58051
+
+Upstream-Status: Backport [https://github.com/libssh2/libssh2/commit/a9758da45a52bc8c630ec9493804d0c6ea30b24a]
+
+Signed-off-by: Ghanshyam Banait <Ghanshyam.BanaitSanjay@windriver.com>
+---
+ src/publickey.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/publickey.c b/src/publickey.c
+index b7f384310e..a0d3100005 100644
+--- a/src/publickey.c
++++ b/src/publickey.c
+@@ -905,6 +905,7 @@ int libssh2_publickey_list_fetch(LIBSSH2_PUBLICKEY *pkey,
+                     goto err_exit;
+                 }
+                 list = newlist;
++                memset(&list[keys], 0, sizeof(list[keys]));
+             }
+             if(pkey->version == 1) {
+                 unsigned long comment_len;
diff --git a/meta/recipes-support/libssh2/libssh2_1.11.1.bb b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
index e8fa4a5eec..c579749dc3 100644
--- a/meta/recipes-support/libssh2/libssh2_1.11.1.bb
+++ b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
@@ -21,6 +21,7 @@ SRC_URI = "http://www.libssh2.org/download/${BP}.tar.gz \
            file://CVE-2026-66034.patch \
            file://CVE-2026-66035.patch \
            file://CVE-2026-58050.patch \
+           file://CVE-2026-58051.patch \
 	   "
 
 SRC_URI[sha256sum] = "d9ec76cbe34db98eec3539fe2c899d26b0c837cb3eb466a56b0f109cabf658f7"
-- 
2.40.0


