Return-Path: <Kris.Gavvala@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D547CD98D2
	for <webhook@archiver.kernel.org>; Sat, 13 Jun 2026 02:44:01 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.84796.1781318632927098672
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jun 2026 19:43:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Rfrb7DwX;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0624a503c1=kris.gavvala@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65D2eg3Y2943793
	for <openembedded-core@lists.openembedded.org>; Sat, 13 Jun 2026 02:43:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=LdAm8FzoAfYxXV0B+UVh2+yA+EzRbmywayiXjw6i77o=; b=Rfrb7DwXd1/w
	Gc/87xB+5PwgG1fyeEUi5KXkpLtSkhNkRUIFnMr9BfH27h5L9h3PT1UjOwUSuH5K
	j2Wo9N+F7rPfnDb3inAJ0oRRt+YXXiojYsxuYxLw8c3db5Qk5PS3ZJ3oXT3RRQ6j
	oxBheHT4lk6/dMfzng/odpi/wgJX9+nNKK2PRKPh/Z68QQmAJGJ9gMRjVBPPQEix
	EwJrnAjIBsy3BAmC9NKBRP6tkqzvG6jW21bQsxOTEHKb4rhBih0deWdgoWsWHAkK
	F4MGMbfDblDpBHvYh4MY8mjuO1oEY+a+LcemXw9k4vZF4Ajh8pPeqx45BxmRSDUl
	7QvggWXAww==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010030.outbound.protection.outlook.com [52.101.61.30])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4erx63r0kt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 13 Jun 2026 02:43:51 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s+Ra29unAB2IgY3Agq26ZVCg6s9L/x8bc8BRMsrfxl3ixkh56UzLqlm34P9eNd5CIE4C6oP5Peq8be8epmFf+zFE7mpkA1jKqlSCTnSNGDk2p3WA5eNGE7jk5dhMZAkpS1BWJDCsYR0j+EJ+jrm+IFMUAtIJC1HRlLvVZ1yF5qn/uGV2kLp+CzmpP7eygTs95hxjQPwUYMMTP+8jIUUBTI/2tgCJT0tjNaovp0fTXNzmaTy+OnRRb1K956CoC1XXbW+01/IuyUHi8rtUuUbmbn8KL7dbrvXnyHCgCPfLI7PEQ2JG0ZkZf67gtaMQee1GWUiXWM54QudLPy83kYTyGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LdAm8FzoAfYxXV0B+UVh2+yA+EzRbmywayiXjw6i77o=;
 b=zUDqUYJZjil0Gcl5P49XOj0uLCne9khcdJONlpkOjSfi+c9Wu22sPrIMr9HqVG6+MKxGn1amK+JwK++UWrCwhNXVT09FlJwDSjcVmGZ+ZsRyVQ5RMeq2UA27kn+SflmoXKH7bKp982cGJhQD5nDxNuJ7Mue1xxYNwEOv04GPGPf8Ufjh3Ga7KT2gl+qyuWM2fnNr28C8FvZUpEf0fEDh4i0TnDMpWDC6fuKdof2uI1xaaQfdsM2mfWj75WzNjQDB8cWY45Zdj18ksoRu75M9wIXiQ6tLpWKT4MX6TkEJdmJ+tsB/fwicpjy5Twwl57CuGl1AMCe/D7DQVEQQKmPauQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS7PR11MB7783.namprd11.prod.outlook.com (2603:10b6:8:e1::17) by
 DS4PPF7551E6552.namprd11.prod.outlook.com (2603:10b6:f:fc02::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Sat, 13 Jun
 2026 02:43:49 +0000
Received: from DS7PR11MB7783.namprd11.prod.outlook.com
 ([fe80::aa04:56da:f40e:96a1]) by DS7PR11MB7783.namprd11.prod.outlook.com
 ([fe80::aa04:56da:f40e:96a1%5]) with mapi id 15.21.0113.013; Sat, 13 Jun 2026
 02:43:49 +0000
From: Kris Gavvala <kris.gavvala@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 2/2] libcap: fix hang in libcap psx_test
Date: Fri, 12 Jun 2026 19:43:35 -0700
Message-ID: <20260613024335.377418-3-kris.gavvala@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 1205cb0e-8f04-4115-f26d-08dec8f598d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|376014|1800799024|23010399003|56012099006|11063799006|6133799003|5023799004|3023799007|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	uKtoWjN6OlS80GdO4KupCSLljDMY0ww2kmCOD87kkC99uInRb/W2DiQfxA943EVi5W4McDqqAcHscuVYe3SOqiEvMr+XqdS4uFZDZxb1edrlUPp0qUty1rsRYXkECRCkmiJ1yMKa79Yeea1bur0jATwKiC6SPB6irhyKuKumXjfycPXtOTpTShYwXUeyX4FL+qwsWnITk9zTOOgQ+r793Q7JY4qA0iG90Vmip1iomgvXeyZJn9fnnT3IBEIHcQ2wza6lsb0mVbkyyujPEKUY/ly9Qroxqb89WRIgnyIoYpWF+3YynYEXn87IzzPSwtd1ZwuxjXuh5cSoKdQC+17loe29WjiXz4k/p6t/zHEhZl0rUs9c8sccDAUgQuzWG2mcb+uv0XeqMvKKIuCeLjW6fqp/6QA6iHTWG3MxsnOt+jl1TzAmbHr1I3dvqxeBcMRA8PyFk3TR/Msgl8X4GZVDAMARX4D4YpWS9A1dIKUvIaT8VUrvy26cBeUUjltRAP4kKiiQan/PzGmKFgbiVDkfo1hkDNrlIeNohjG//uQ7lohpaMbg/jeZ/gT4q5kZBLgb+QRLbkteArCclcYXE+1CqpgrFaW/yEHzH80v01pmF1KKfvbKjr+vOfP6w1tcMCh1PgWJLgt5XWKezFRX9Pc6GhpJ5WQrJq1E4MzWsUrocRS61MqXZvkkd6jwLM6FQmwJnLfhApuPMcHRKjQIAwBJqwBv//fasGF4UYZ7BRksHGzd7gm9WZRWm2ap6nLnShb8
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB7783.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(1800799024)(23010399003)(56012099006)(11063799006)(6133799003)(5023799004)(3023799007)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2R3FlBghEU3a0IAZFF0HX3vh+nNuqzM++qY6Ayu2PhjOYAUBHYjji0+SNjLj?=
 =?us-ascii?Q?UWhwDQM/1g6QP4mzGWUuX8WluGhOJSEVsaErJ9terOoP/yd5IQZsKHcGKDO9?=
 =?us-ascii?Q?Aj85bS8XCPFgiYYazEF+ehcR9/7lSyTX2vCisgMnU+d1PoJ31+rRgLd+vfOm?=
 =?us-ascii?Q?BlGmcj/B/CjwuY9iseXZGgCrSHRflCa3wKu5N5HZE7xuUT92fn5asWXIo6+e?=
 =?us-ascii?Q?9uYVKSpETbUXYfsGnyASTRuhpJOfKCD57K0CMg3COvMlZ+zCJZoqrwA234be?=
 =?us-ascii?Q?0w+tF7KTBMUynk1M5ct7m9QaFppbnq6eZLd05ldMo/hxQ3UKVhbVv+dWvjHY?=
 =?us-ascii?Q?AFluxQzXJ42EhNQnL6SXRIBCLRrfFq4gyIQAPgn4cB5cBM30xP10pwC94iLo?=
 =?us-ascii?Q?BFGlxp4z1buG/nyIzGj+m5wBYcHMTTmAsy4D8JLBl3ABTqIYvRbZKWpJb6QE?=
 =?us-ascii?Q?1wrdFsIFIOsTWhuennqQema9URqRum1U4wdqRbRw/advYfpqr3GPTVdy4wfM?=
 =?us-ascii?Q?QMX/bngaxza5CBb1V1F9NDQrG2ooSliWzjII+C4NF3pW5WRLOe4GAhbPw4F1?=
 =?us-ascii?Q?7Pob61qn2iTCulB+JvpTWSvi0gkT1mvJGeSHBGtKy2BTbWPNLBzNyd8Q4U9O?=
 =?us-ascii?Q?pQnNXjFLOH8gs4Ia/f5JV9HOwOg8M7JQKTiflQUE8Qorppt+d4s+QENeu0qh?=
 =?us-ascii?Q?ZjAqZXIZG8jii0pmSwOKYm+63Pp1PDQi0Hw5+YynfO0N77aa30h0QD9dQKtP?=
 =?us-ascii?Q?XFUJhFOUIwQwjA41txgSj+o2jF8YB/rgdscU0rG6rPv1kIt9jRNDRy+ZLLSw?=
 =?us-ascii?Q?3H118eQb9c0OzQKveGEF/Vwj2v8eMqffi/A65Op8Tv7im74jR0sJ/TLx62ka?=
 =?us-ascii?Q?J6Q3af+8lIMZQwPHZvrHQptD/WkJiQpH2zXBgAx9xrmvAnrKFDsoYBlMbqUJ?=
 =?us-ascii?Q?wtGnAvOirdAWhn0X9z8sopyP3LHAwcufRIH018/trZ/5tFx9nL5+GBuoReUO?=
 =?us-ascii?Q?zpmD3Ue9IQ9Hev9j9l54vzx6rE+LSIfWn5rrogVZpiWDbBxptMca5lNlFxZO?=
 =?us-ascii?Q?86pjdoJyN36WS2TUDRXeaf9LX7wFfpAIRhTd0loEc2xIeEvTbUNUTvRU/nZF?=
 =?us-ascii?Q?nBA+ratgFHPl0Dj751W9hSCMjYBUyTzSYsjDElocb1jT/ClSSEnp2voYJ3Dj?=
 =?us-ascii?Q?cRao9B8bzVoGoWPrcTgTH9+711CKG+nfcG8IxbVzDF9JuzqaDLD5EzrRt/PH?=
 =?us-ascii?Q?MOwN30JG+Jj+1LUtsPPU7/H/TZeh7313yvmdnz91FKDtZZZK6ik6qyeNYHiQ?=
 =?us-ascii?Q?eMVNQyIL0UbrbVEe3HJiuAfiIBWmI28XRZitdZPCJAvdtnVdiCWsfAk34xqx?=
 =?us-ascii?Q?MRH5+WYKR3IHQSaf+uVUAuEHlbcCKCf79stDrncKyqBcLdDqENPgJz1X1iWr?=
 =?us-ascii?Q?/OVuJkl4qgdGhYVqz04/2Dr/3tn7S/Oq4aXx9oUog7FGgtddg12A4JpqCRG/?=
 =?us-ascii?Q?lIzrJ8S6zlOS06/Gys8pBQqEuoFsalx+27p/MvSP45Sa1Hl1XuYydp2OXzQS?=
 =?us-ascii?Q?z8kYwSjFh/N19UM1RUfW39xvhUTy03uATpwr9JDF1nHzHQ57+1zX2zSorGCv?=
 =?us-ascii?Q?fTwE36R33di5ezbTwM4mABS//q+fpywEyEW/0G59wRumDjAN42zF7eK7rMij?=
 =?us-ascii?Q?m9BmDkIqc9ytsXUipkkYhGW0MFHwaJvXDaMVXEM/YDSrljfUgxUpP03jnD97?=
 =?us-ascii?Q?al0aYwn0ZFvR01nHESqjMZue0ghfnnI=3D?=
X-Exchange-RoutingPolicyChecked: 
	kBniAtRPUxkmr00KcisXi4qaccHDf0dreYpC+xRvwR0OWKMSsZ/B9l0t8nGmvC+IfZSJkLhTaiB6AKfT6IYbWp7eNMFNgjwihacr2n+piL/i4vO/8Agpzw7cqcO2b+3ucVR1Qxlev8Ho+BAp19/wltQkhFmUJMqNdwh47kgtE0Cm8jYCT9ygPzi5yGlu0nPj0IO7XpOp+aOeL6/u8iQVMQGxp8n4y9SnoVHzb8mGPyL5Cyh16wFsFcWa+Y10yav7h/IZNEEcWajS3qr4Z3D58MQC2KJWzr1lTPugg+2vMJ9NlNO8pqyyK7Y9UrvJVMXTpLZQ7ywrUcPR95t+9/gnqQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1205cb0e-8f04-4115-f26d-08dec8f598d3
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7783.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2026 02:43:49.1277
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YcH9jeolAfH6FjDeOVF7Zcq5+9icldPwFxHzdEfaUq3+VSWpp6IhambTQftMQ+kJ+RmkjIvnYdHQRvhBLlWAFnBo/jrFscUT/gVcEjVoTos=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF7551E6552
X-Authority-Analysis: v=2.4 cv=SvmgLvO0 c=1 sm=1 tr=0 ts=6a2cc3e7 cx=c_pps
 a=eGdyP8VkvOZnUY1FLHxo4w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=VwQbUJbxAAAA:8 a=IRCfwvbBwB6KfeHA4ccA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: UZg1xg6AYdXFdmXxXFrM8U9BQtAAmyti
X-Proofpoint-ORIG-GUID: UZg1xg6AYdXFdmXxXFrM8U9BQtAAmyti
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEzMDAyNCBTYWx0ZWRfX3Lq6Tui7O+ZV
 /FVkN85Zli6pPkV5Ae+QqB4aRl/VuAH1+X8+0nTQ76+3za7dr8eXA7JXnv82VjxTaj9lRVYtGcY
 5eFnMLj++5D83Z5TuFLxZ165pXJ8ZedZKvcXq8hTROIfqNzBto8/XVX8QdGugN8njlkmxUoQgsh
 lXyWQZAdZVV5lPvdU1BkPmjvx2axTK94YcXP0bcqTdMVTDw5VnK0z9n0c7VqqP83zYSZ3rkM9L9
 FK/ss8yc7qQQOlwK7G5Y7rBXK4hFF5cU+ix3ORQyh1Cuves/lELjIVFULekqJNmIORRyJFD71kr
 7YbPqBhc1Fic7ayEWuBEoObN85o5kUYrF44lvJh23WcHoXG+aJoOOnKVdmuYoU3ED7u4PZ2Q7om
 wbNIYJymOKcjdMiwc89qxCD5jC8bodxoD3Rkmce9GfeooMrwozN9y7H3NEOyQEOwpkjd5CjtjHq
 +hahv3JcgQARa6voEoQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEzMDAyNCBTYWx0ZWRfX9ThySxNTOR2V
 t/hfUqQQsxD6MmwYGzNFCLHGqubOCPUo0JA7yQPMr2EmNiC6NDFvZCwzIYjDZxmJVNXzYYWD8o6
 pHmQn0b0u2yy0Ev+kD4kuigK1nxr/bQXWLW8IiKDzVtrclpXYNoJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-13_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606130024
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Jun 2026 02:44:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238648

This adresses a bug in libcap_psx_test, one of the ptests.
libcap_psx_test checks that capability state remains
consistent when concurrent changes to process capability state
are made across multiple threads that each perform a fork().

libcap_psx_test outputs that it passed, but leaves
a child process in an S state after executing. A fix was found by
changing the exit() in a child process to _exit, avoiding the exit
handlers that were causing the deadlock.

Signed-off-by: Kris Gavvala <kris.gavvala@windriver.com>
---
 ...1-libcap-fix-hang-in-libcap_psx_test.patch | 47 +++++++++++++++++++
 meta/recipes-support/libcap/libcap_2.78.bb    |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-support/libcap/files/0001-libcap-fix-hang-in-libcap_psx_test.patch

diff --git a/meta/recipes-support/libcap/files/0001-libcap-fix-hang-in-libcap_psx_test.patch b/meta/recipes-support/libcap/files/0001-libcap-fix-hang-in-libcap_psx_test.patch
new file mode 100644
index 0000000000..353d7358f2
--- /dev/null
+++ b/meta/recipes-support/libcap/files/0001-libcap-fix-hang-in-libcap_psx_test.patch
@@ -0,0 +1,47 @@
+From a51273125b90157de70ae2615a91f82c1775615b Mon Sep 17 00:00:00 2001
+From: Kris Gavvala <kris.gavvala@windriver.com>
+Date: Fri, 12 Jun 2026 14:55:11 -0700
+Subject: [PATCH] libcap: fix hang in libcap_psx_test
+
+When running libcap_psx_test on some non-x86-64 targets, a hang occurs.
+In thread_fork_exit(), the forked child calls exit(0), which invokes exit
+handlers and blocks waiting for an internal lock.
+
+Use of exit() is unsafe in a forked child of a multithreaded process because
+of the internal handlers that can causing blocking.
+
+This commit replaces exit() with _exit() in the child to bypass
+exit handling and prevent a deadlock from occuring.
+
+Signed-off-by: Kris Gavvala <kris.gavvala@windriver.com>
+Upstream-Status: Submitted [morgan@kernel.org] 
+Upstream tracking: [https://github.com/AndrewGMorgan/libcap_mirror/issues/12#issue-4652587116]
+
+---
+ tests/libcap_psx_test.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/tests/libcap_psx_test.c b/tests/libcap_psx_test.c
+index 58a13ec..693aeb5 100644
+--- a/tests/libcap_psx_test.c
++++ b/tests/libcap_psx_test.c
+@@ -24,13 +24,13 @@ static void *thread_fork_exit(void *data) {
+     if (pid == 0) {
+ 	if (cap_prctlw(PR_SET_KEEPCAPS, !start, 0, 0, 0, 0) != 0) {
+ 	    perror("failed to set proc");
+-	    exit(1);
++	    _exit(1);
+ 	}
+ 	if (cap_prctlw(PR_GET_KEEPCAPS, 0, 0, 0, 0, 0) == start) {
+ 	    perror("failed to have set forked proc");
+-	    exit(1);
++	    _exit(1);
+ 	}
+-	exit(0);
++	_exit(0);
+     }
+     int res;
+     if (waitpid(pid, &res, 0) != pid || res != 0) {
+-- 
+2.49.0
+
diff --git a/meta/recipes-support/libcap/libcap_2.78.bb b/meta/recipes-support/libcap/libcap_2.78.bb
index d91ece4aaf..54c965a130 100644
--- a/meta/recipes-support/libcap/libcap_2.78.bb
+++ b/meta/recipes-support/libcap/libcap_2.78.bb
@@ -18,6 +18,7 @@ SRC_URI:append:class-nativesdk = " \
            "
 SRC_URI:append = " \
            file://run-ptest \
+           file://0001-libcap-fix-hang-in-libcap_psx_test.patch \
            "
 SRC_URI[sha256sum] = "0d621e562fd932ccf67b9660fb018e468a683d7b827541df27813228c996bb11"
 
-- 
2.49.0


