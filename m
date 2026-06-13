Return-Path: <Kris.Gavvala@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D924CD98CE
	for <webhook@archiver.kernel.org>; Sat, 13 Jun 2026 02:44:01 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.84797.1781318633167355575
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jun 2026 19:43:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=jKuGBF2Y;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0624a503c1=kris.gavvala@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65D2eg3Z2943793
	for <openembedded-core@lists.openembedded.org>; Sat, 13 Jun 2026 02:43:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=r+j9xtHoAoetiP/49SJJmDBhxFLxYQ/6koNYqvj9yHU=; b=jKuGBF2YDs8s
	pwbzWe0BgMi/BIhWME6aqe4s8D+RcT/KH4GyQY0mikOgXSnA9Po9cLt1yP/vQiSq
	/b7U8KavhzYYEjIHo0YZuFXxXg72DpTcUw1qMDq0Uwzhbyfttb9/WLYTLaESy4Ls
	V/Ha6/grZX6ceAC1KXAl4FMF40cFMrDqrycoytewrd88r6YF2KepMDOwDFzjpd2h
	ufFctrWsXhsZ8e5LSg2zjLIZjHpDBoaN1ucERgP8ZZ8RS1sywyrlflX4SOIowCoD
	SMDsl+cV3+LQHuAyCRPqm3qYZkARL1/s27h0AF2UGeQoK6YEP74/FHujIPYklysk
	UQmAaPEu5Q==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010030.outbound.protection.outlook.com [52.101.61.30])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4erx63r0kt-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 13 Jun 2026 02:43:51 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sxaYgFafsFZ3yODx0zyT1bMn0pR22eAcSakHXgBCtt4j1hofH6dnzciOfXDQhKiS5E6y4LdJIjcVRiXcV3x2RgOixksk6z22BlSRfnHrRTttuxHjDEZrP9ebZNRlIwyevK5JkNZRNu4ZockwjTV1TVgc9zmf68aJWYASQVWDR0wU7e13D2y+kjRS9zIsDob1Y9Sx/BPRbXUCj5bN7vG9dhV6/k5jE1CKHJowsuSir+/BlGDPKgFS2Z5C6dusR3WXqUin2/tq22stz+HoIE8GC3+sq7UWvb2rsp8MuZkFmd2HMRStbxEd52Ev0NIO9/XVkbDUF0WOrWWVs4ZNpq1QjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r+j9xtHoAoetiP/49SJJmDBhxFLxYQ/6koNYqvj9yHU=;
 b=I/VfPb06STv0Uqo0TeRjgsraIHcvVDO53zm6O3DPdk1Xf3SS+eG33MUS1kqOMIwWzhgXnaOuHWFlY7j0Ox1fFVhHQhfHn8CzVY07RZh3bG424Vyg2NaViyA7UtvPZX8yGW2QEJmDkfGldVQueXCS7YHaO421pr7H4XNfAg6PRXlkQlMyRLq6UGxohyzZiU9cWHMrngfCRUcJzz3IabYt/jGD048YawuOHIj9wcuaSFlXbAhy1/+icw929yMO5vsjcDAKe9WN+tylT5Fw2i24xMmOAb0HOY2uzn2XZ2fWgxz+4zc39sEeekZVPCAwfhK76nkDXZvwoZT8ZIrWHZWzKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS7PR11MB7783.namprd11.prod.outlook.com (2603:10b6:8:e1::17) by
 DS4PPF7551E6552.namprd11.prod.outlook.com (2603:10b6:f:fc02::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Sat, 13 Jun
 2026 02:43:48 +0000
Received: from DS7PR11MB7783.namprd11.prod.outlook.com
 ([fe80::aa04:56da:f40e:96a1]) by DS7PR11MB7783.namprd11.prod.outlook.com
 ([fe80::aa04:56da:f40e:96a1%5]) with mapi id 15.21.0113.013; Sat, 13 Jun 2026
 02:43:48 +0000
From: Kris Gavvala <kris.gavvala@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 1/2] libcap: add ptest support
Date: Fri, 12 Jun 2026 19:43:34 -0700
Message-ID: <20260613024335.377418-2-kris.gavvala@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260613024335.377418-1-kris.gavvala@windriver.com>
References: <20260613024335.377418-1-kris.gavvala@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0358.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::33) To DS7PR11MB7783.namprd11.prod.outlook.com
 (2603:10b6:8:e1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7783:EE_|DS4PPF7551E6552:EE_
X-MS-Office365-Filtering-Correlation-Id: 2640ca71-98e0-4328-74b6-08dec8f5989e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|376014|1800799024|23010399003|56012099006|11063799006|12006099003|3023799007|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	qOGRcXFbcInECX80KZ/5zTYuLXahX9xHwbshZBjuPmP/dGvoWufH8regAXuX1yQMjUlHnhLacJFU1Uv1KnILjdb5EXx3gwSF2nP8ZBE6Ii9qAr9TfUlXrrbyGvYIg/PDEqFhneiz11uuAil9qrVJbHt0O+oXoyyxd++G256dnXJ0t1TSsDam8mxlK1x1okYY7+XXrFkyCL8ZuweNEdNNIBpWSi9sSeugzcUxNLTaDga7vLVmsdpbudSYopJbLm7z1Cu8cdvLnkVCoMnbIG9VG/1u8AWGs/TbTvUE+Y09o0bub9XbJBj7zyVGMFcBVxQWH2LfllMQprqaFbhEP6abwrxjx1I6CPg3ZmBwvt5Cyup4G8GrSSSRyeeVRxhb7mpx9USJlgbSmBcnK18e1zhja4DAHyw7twjyK9qqlt38+ZEfUvYO2eyO5xOJMeeSkD8P18zAtihGZRfx2noR8d5KDPCFl4tAMndE+mrMzK88YwVdn4C4/Kd3cDrJ0scpppVECMn4+uxbzhpH8ot+7DTBsFP/9u7WvjCo8GLxPWgS3o164bPTy6gO9/FVFQTEoO3bExqXPayCvIkPraKkBFy1Vkn1iS3PAs2lxHhZoTLLV0sOgVK+cpqQQg+iqUMxKuigIYnIWCDMLZLDNakt7F+0WOrya84LKeI4YePOHJesItxuOY3Lhps0WGOTlI2+sh/ZoPaPZ7qfH+HAAGv6MpkVjBGHiGcUr3z7LiSyLBlsASMJIiBBYe+dRzz56sS8tf7a
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB7783.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(1800799024)(23010399003)(56012099006)(11063799006)(12006099003)(3023799007)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?M1hUj2A0fIB+ahYZMDPyee8kMmWccHA+xJvFVv8OJYy8U2g341tfkkkZX3VI?=
 =?us-ascii?Q?VA2fdv5r4k0H9xbzqA/LhhZHtegdeIdm30FpR2nUCfqFNRdip8S4vUY8kPCW?=
 =?us-ascii?Q?af6+kp1R7WBpWr4gL6O24/EZUB+gvR5QEWSP058C5FXBKW6AJaXSSGtmTXl4?=
 =?us-ascii?Q?xZs/KIakTNVkAs7FfKoVHRWR+15jd8DyfCffvmwWoh0SyMAOtWe65h8GZ6tK?=
 =?us-ascii?Q?6ZKJ08VyMenOEG+pf3lT5Xx3eHflD7+NDct/MNz3eEEzOlZoSsZZVXZArW/l?=
 =?us-ascii?Q?SBrppdqBwED+mKjWaHtFDwD1Dq+NGteTO1H9BymeMHFw1uOk+Tq+EqFy6FOZ?=
 =?us-ascii?Q?Ddin8EEmDjX4VLRYUkNPJjubpfwYBl4HECOG4S+Ar1A0lBWDSOv4i/JYsWeh?=
 =?us-ascii?Q?e3UPy0Cc5UobPRHcWNLSfHJxpjOH6LxzedViPVCnbqiaV/Ge9OxnTpIoJfCi?=
 =?us-ascii?Q?L3HY4Po4sUXiQBQhqIr7dLhM0xqcR+a3oGGyi5WqRX7DEEeyQEDNnR0HvQ/F?=
 =?us-ascii?Q?92oj+6AakxdisqWU51jgHvuDsN9oNiUdN2Hgn99hNxqAU1w5sRYfqjAGy5NZ?=
 =?us-ascii?Q?IxwYjP/H7B1WoDa4NyhOA/IGEXrkTwWIFbQ/wwMatq9l7OeqbBU7lMBcJfJi?=
 =?us-ascii?Q?wg5KMmZB6I6JvOQVdoZ4MDDveu0Rk/UtSpjiSzcTvKapCub1CxuKY8cMspuR?=
 =?us-ascii?Q?EsOoQFrC1/0bbdQubNc/CpeCb7ScZbiQGAwm4OHgWezSPxhEPblmK5XsLdpM?=
 =?us-ascii?Q?nZhgP0U1LHLHOGNpP0WXsR5qBBP4oMoJ/Zon56gZTINKHB4p1S8t6OCOuE/t?=
 =?us-ascii?Q?cGfbdjVufM8wdn0o9aDVkh8BTZpY9k+kITWvZuGrR7cV4lalZcJCipQpX5G9?=
 =?us-ascii?Q?Xg8vNfGeOTsZFVNLWu7xCwE41ntm85XpxMQPmUGcN+ai+uVvARcwXFl/FIw/?=
 =?us-ascii?Q?w8I4Y7gmbzjFla6guZCk6VsORRP3YIVaBxKDEZkctEhGHWE6n44Cd502q6UU?=
 =?us-ascii?Q?zTV5j2cV+jUskdcgiez4DMfWcYwsKM8uMPYuWNMZNYDBE6XXOXZVTg71lvdk?=
 =?us-ascii?Q?PgPMnveE+YYifDty4JPLee/sgRuh98vWL64V0StwqNriArVDSMMR9sPGK/SW?=
 =?us-ascii?Q?BUyh93tZ2ZQhr84nMbykZXG03qHNma5lRPCNxJBPQiUeY2DLGisy9xW+LMla?=
 =?us-ascii?Q?TwF7vRLAiGCnQdprvgd+0ZUkNokfGqQLP9rVi4Pd4TPqTL0Bt7fwJHLKzNNS?=
 =?us-ascii?Q?MNwZpe+txAv838v7kEsgjMkoInccIJ3Nb8vXAt2QV/baAYOcCvgbyRm5bUvk?=
 =?us-ascii?Q?Ge2//YYhj83lTDDInjWeD/2ON8z2h8g170G0xXi4JGebN5nVVK0/Owht3ZyG?=
 =?us-ascii?Q?xGXwlsWaXWq5o8ntpbkozZ+S2rBuA/oFJ6EmmpFogqcsrQArATPY/XA9z4sz?=
 =?us-ascii?Q?rjXMKwEtJlVOhFRf0AvVtCZnmNcajZm25YwNvJwOiI8g4rVjMvxA25GWnTBl?=
 =?us-ascii?Q?eoZ3Mey9QOzeRKQMOSivt66DPmWumdndrRzyxUffMO7vDHZent5bVPMvTUxN?=
 =?us-ascii?Q?J1Y0VuAH3P/dD85Wt/CXimZOhbNpbw3sAOr9imsYuCFHldgzoYJYsB6Xa5Q4?=
 =?us-ascii?Q?B8voG2PF5gkLIKZirMhU32gzrRt8Zgc6cUc/GTg1WThEuYNSrXAuZoffWDyE?=
 =?us-ascii?Q?EL8lp2jEoJ+Jg1APCXgMsCeE87BfzZZs8MpPOB5nOhJ0QcIdicV/1kajKXy4?=
 =?us-ascii?Q?L0FyWTB3eOtWuCDWes5YkMFQvrzIa2s=3D?=
X-Exchange-RoutingPolicyChecked: 
	psoL2QtCGuG0FXmd2ewScOqZBqHxtm1MWvet9r0xcPc3QD1GKQxWyd2YXp/71OkkRLUinxkf5lN9Kg1bUj+o18qRZBBtq81PiYFheR1gyG5x31V0EFxtw2sjkmwpJ9LP6NlxKR63ld4W5GQcoA5Lpt2AUD1NispThdT0OKBr6Q4nzFr7S+/PUhAbent1LT8+BYPet501oJqBGQm1AIXmmW719/rSgF/hLAAPFFvo6QVx4QmyWYUqjQzgOBFyX3fi+eNSO1KWWWOyYM4tGl4Y4AiFTRdeJL5dE9m01raocGoSgHYp8VzO1ixqHK6/5g06NWQVGuC6fzpLEgHtG5BdFA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2640ca71-98e0-4328-74b6-08dec8f5989e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7783.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2026 02:43:48.7106
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kj9rNLRYkU1dyYOG2lWG+7ocX/OZ7GBCQztmTE3T2Ssk2JlRbaPHaffQgZuwAPWG2XTbt1aqXTdKpxnI5sLtnsntwD8TTjvTudMKZNERiM4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF7551E6552
X-Authority-Analysis: v=2.4 cv=SvmgLvO0 c=1 sm=1 tr=0 ts=6a2cc3e8 cx=c_pps
 a=eGdyP8VkvOZnUY1FLHxo4w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=VwQbUJbxAAAA:8
 a=t7CeM3EgAAAA:8 a=Q7LFDE9GamHE2BZ3A4wA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: S3VQk9yYQiRBC4JpYL7uYYSTKz6-0Z4V
X-Proofpoint-ORIG-GUID: S3VQk9yYQiRBC4JpYL7uYYSTKz6-0Z4V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEzMDAyNCBTYWx0ZWRfX/h3B2DFdIrVy
 7+/MDPnKlPFSS2UvVLFcmAReHnANnNy0IsbmXMsqQQGeMKCeIkMDS3UE3x/Yx7p+IwNqPjHJUwp
 cbgNQdK3FXDQkqv08jLZCzh+MDqi5Am+dJ4xqthInrromBLm8HCFMvltE6NvVZR/B2MsQTpWMBM
 78vrWYdMYh4M+fH2uIOCzKuBURrxDOeHc/tkYMt0jKoap1V+8izmPOVKuZCYqEQ91Pbu76hQVQv
 2FnYHNOhKijoHmwCAScf1MVcMRBBXzalxQVT3yfqIlKWKuLqplqQQ4s1Gx8EKY4mLU45VreI+8Q
 ArBv5qGK+dwbt46VktE+tm64fDRdnU+LFDjv/8n4wky7xapeHccQuJdiQTDs3A9ebvi0giLP9Jc
 LSXVgkynxQT4xjz1oc/vAm/tgnwPXo2DDwQL4HOXGP2oaAW/R+/o1jyG4tQQysybB0UBp+SiKUr
 pCp+ji3sGlaTizzgk3g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEzMDAyNCBTYWx0ZWRfX2N4OoiVdd+w9
 e5ysQxfjuxvRdLjUqTZNFC2HuP+FzK2YoaTur1+LDUkIL4NZ/bKVtz7whghavH3QrUS/gvpmUE5
 Dbbudym5JYqq0iF2QVAUT2HIsbuvCrxIb+zOegNDQv2Pt6vo2QEj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-13_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606130024
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Jun 2026 02:44:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238649

This ptest implementation includes a subset of upstream
tests that provide functional coverage of core libcap and libpsx
behavior across target systems.

This approach is preferred instead of using libcap's quicktest.sh
script because the later assumes the upstream build-tree layout and
has too many dependencies not available after installation.
Quicktest exercises a wide range of kernel capability features and
environment-specific functionality that is too comprehensive for ptests.

The ptests include the following libcap/tests executables:
uns_test, psx_test, libcap_psx_test, libcap_launch_test, and
exploit/noexploit. cap_test from libcap/libcap is also included.

These provide coverage for capability manipulation, libpsx
integration, launch handling, and basic security validation.

Signed-off-by: Kris Gavvala <kris.gavvala@windriver.com>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 meta/recipes-support/libcap/files/run-ptest   | 25 +++++++++++
 meta/recipes-support/libcap/libcap_2.78.bb    | 43 ++++++++++++++++++-
 3 files changed, 68 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libcap/files/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index f3f42f908a..1254a9e204 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -31,6 +31,7 @@ PTESTS_FAST = "\
     libarchive \
     libassuan \
     libatomic-ops \
+    libcap \
     libcheck \
     libconfig \
     libconvert-asn1-perl \
diff --git a/meta/recipes-support/libcap/files/run-ptest b/meta/recipes-support/libcap/files/run-ptest
new file mode 100644
index 0000000000..c56d483545
--- /dev/null
+++ b/meta/recipes-support/libcap/files/run-ptest
@@ -0,0 +1,25 @@
+#!/bin/sh
+
+EXPECT_FAIL=1
+EXPECT_PASS=0
+
+cd tests || exit
+
+for t in uns_test psx_test libcap_psx_test libcap_launch_test cap_test exploit noexploit; do
+        output=$("./$t" 2>&1 )
+        status=$?
+
+        expected="$EXPECT_PASS"
+
+        if [ $t = 'exploit' ]; then
+                expected="$EXPECT_FAIL"
+        fi
+
+        if [ "$status" -eq "$expected" ]; then
+                echo "PASS: $t"
+        else
+                echo "FAIL: $t"
+                echo "$output"
+        fi
+done
+
diff --git a/meta/recipes-support/libcap/libcap_2.78.bb b/meta/recipes-support/libcap/libcap_2.78.bb
index 782ad02665..d91ece4aaf 100644
--- a/meta/recipes-support/libcap/libcap_2.78.bb
+++ b/meta/recipes-support/libcap/libcap_2.78.bb
@@ -16,11 +16,14 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/libs/security/linux-privs/${BPN}2/${BPN}-${
 SRC_URI:append:class-nativesdk = " \
            file://0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch \
            "
+SRC_URI:append = " \
+           file://run-ptest \
+           "
 SRC_URI[sha256sum] = "0d621e562fd932ccf67b9660fb018e468a683d7b827541df27813228c996bb11"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/linux/libs/security/linux-privs/${BPN}2/"
 
-inherit lib_package
+inherit lib_package ptest
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}"
 PACKAGECONFIG[pam] = "PAM_CAP=yes,PAM_CAP=no,libpam"
@@ -62,6 +65,44 @@ do_install:append() {
 	fi
 }
 
+LIBCAP_PTEST_TESTS = " \
+  uns_test \
+  psx_test \
+  libcap_psx_test \
+  noop \
+  libcap_launch_test \
+  exploit \
+  noexploit \
+"
+ 
+do_compile_ptest() {
+    oe_runmake -C tests uns_test psx_test libcap_psx_test noop libcap_launch_test exploit noexploit \
+                AR="${AR}" \
+                CC="${CC}" \
+                RANLIB="${RANLIB}" \
+                OBJCOPY="${OBJCOPY}" 
+	oe_runmake -C libcap cap_test \
+		AR="${AR}" \
+                CC="${CC}" \
+                RANLIB="${RANLIB}" \
+                OBJCOPY="${OBJCOPY}" 
+	oe_runmake -C progs tcapsh-static \
+		AR="${AR}" \
+		RANLIB="${RANLIB}" \
+                OBJCOPY="${OBJCOPY}" \
+		CC="${CC}" 
+}
+
+do_install_ptest() {
+	install -d ${D}${PTEST_PATH}/tests ${D}${PTEST_PATH}/progs
+
+	for f in ${LIBCAP_PTEST_TESTS}; do
+		install -m 0755 ${B}/tests/${f} ${D}${PTEST_PATH}/tests
+	done
+	install -m 0755 ${B}/libcap/cap_test ${D}${PTEST_PATH}/tests
+	install -m 0755 ${B}/progs/tcapsh-static ${D}${PTEST_PATH}/progs
+}
+
 # pam files
 FILES:${PN} += "${base_libdir}/security/*.so"
 
-- 
2.49.0


