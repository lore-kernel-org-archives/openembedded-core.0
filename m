Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 008F9106ACC3
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 16:11:34 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25671.1773331887893448484
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 09:11:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ATo9+YeW;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=75312e9bb6=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CCtti82473842
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 09:11:27 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=hePNIccYm4fV/szXF3ZWxUYopOYOPol1zax3a5y2jtk=; b=
	ATo9+YeWTR92E96QBo/hHg5ZIhEmR3A56LPblndPaW3abswjpoWkGsNazDYboh1h
	qnoth3eKdne49xF3Yxutb0hf3r750HaUyVWg2VBOFHG507q00un3rnzsjK5E91Rl
	0xeLs96aFQNS/yOYIZjiGXc0aLUy76bS2oA7tBWtR99bpU/kiVGXcvZpe+k1L2LA
	4zxbQZwJWJPwGDn3bJgw5JA/JbsAb+9Syg/4UJH2hRxFk6g+iJxv5gE9ImqK9O5G
	iYV4ov64qFqC1xknQeT4EA+muo139PVGRToZwMEZcWXt6FPaHHbwJWazfwMyqbpp
	Utyh8nBTgoWbeS/StttQKw==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011056.outbound.protection.outlook.com [52.101.57.56])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cuh6prxjg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 09:11:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P119qcMV4W3JLMt0fkOnv3Q+KesidG/SjVJGxqbTrbwB3nesVw6fmdKMeddKn3V2uUWaqq3VWBJBp9RF/mGUwONopTY18q4iVxds/HW1P32iDSQ1NuCiHSQz0pVqjrKP11sW4VyFoGL0I11VmYecIYE4fm6gzLcSefZyuC36Ur80O9MPFlczboxp8CNzNXcCzju0lNJ4ctP2CFR+d3fx76J4p8+ZjxaPzh9G7rtjSteKHkhkJPNTkHCYRltl9TBc2MGzf92vtN/MlPqBoMEqB6SyurFCduLsGBJzHbjmc/HDdxxk4162kmXrhfkVJ28bObb8y8GPNGXbSnkv+zYAHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hePNIccYm4fV/szXF3ZWxUYopOYOPol1zax3a5y2jtk=;
 b=aOVi7tYpkRU4fYavZ1+69aChPBIbtdXK4mI+W9+RebTbw1H0TDxOa6/t2w/n9gDZ7TpjrBDtNL9sQB/jhJoQGumUTxbtA/X3DzathRRzEawq3dnyqw7vIXFqQiXdIMN+SoQxRKk/PwJ++9aiav7b7XG4mgZQxZ3Fl6zrzJ6vJFSAoxquc3pJZcIlrbk3jvzrcBe5HPV9M4Mi/SYeuG5yrF3A8yYdF4MjlAlpnwocb7ZQ/X2CjxQwxc4/7tvjJftwW6QvR4hbiD6n5iQneJp7b7V+r9+w1R/eaXGTK0Ct5LvcV/rMGlisoUkSfoLYEOXDTbTAf2JIUWIGu5bnJFyimQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 CY5PR11MB6113.namprd11.prod.outlook.com (2603:10b6:930:2e::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.4; Thu, 12 Mar 2026 16:11:22 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%4]) with mapi id 15.20.9723.004; Thu, 12 Mar 2026
 16:11:22 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Hemanth.KumarMD@windriver.com
Subject: [PATCH v4 2/8] gettext: upgrade 0.26 -> 1.0
Date: Thu, 12 Mar 2026 09:10:17 -0700
Message-ID: <20260312161038.2578649-2-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260312161038.2578649-1-Hemanth.KumarMD@windriver.com>
References: <20260312161038.2578649-1-Hemanth.KumarMD@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DS7PR03CA0303.namprd03.prod.outlook.com
 (2603:10b6:8:2b::19) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|CY5PR11MB6113:EE_
X-MS-Office365-Filtering-Correlation-Id: a5be88cb-1843-4035-1a84-08de805200bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	8nZrRIPZVgOmIjcfL5uxjTyYhr+voX9bqM/8K5QxtDXeHQ/ehk4wTmP0OJO9X68PUw36U7tKjz+LlclRFMntfK5XHAnIs9z52G/VbFl/CY+1yz0coOfGlLpk6OpaQFpUwnCx8zXqPjk18SmaHZjoLRtspOuCwyHa+tFp3BKqnJfoaWuaSbwfVMEQvwfLQh9CZ9SZKNVWoYZmeuhI1Acs7NEHJySmisU/Iv4VLyhZSWvNjd0yeJ/vU7PqDetpdWeWyldiPPVnZzludMhyRQie+DcvCqZyhLSFzVW5LQtxhhCmiNOpGrB5wOzcVDzsRY6m2NmgxT1bZvJ2XCsYJ2eOY3c3lKnlxNycMilopH2ryu3DSYv3EVocFVPnMPIBsWDrEJcAy5E//Smm4eVwW2OwVx3TnpoSJVbX+/QFX08ROKDhzOyAzeaDDIs7vDzjGJ3vBYQK+JjwyKvtB22PIB5IfGKrFbIeo0Zf7Rer5G06IUyBPFEztFfomhWUCaQMYihkaM9whiJr/MSDNTk1rhezTNGPmGbtmMEtLSMPZqGBT37iL2lqsI3opw4im+XdVa72y7bO9luprJvdOSin1LefA/5cYvqNngKKayG+f567nP5426jDcdIVwrjob0k6D/gc7aUWZZNtLlQyGNjAvZGlcya8FsF/yiXRyRLwv2WTSOuDLk4G/oDK1Tz4/KC5kpvQsqc0epb12Msv84jfBeNl6aqkb+grqbCwKGtC4WSwdd92cqHoY5UowjT7RKTodYYE
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?r7Am8Q/XHUC6Al88NbfBaD2bGSDpXunTsgzB7890kB18jtxryBYhZ2atxwE5?=
 =?us-ascii?Q?fzeH7enaOSvfwfSZWKCRPfQkZ+7ytilpbcTqivOD/OQ+PtniurvobSrBePHB?=
 =?us-ascii?Q?XGiR3l3wWRnZYoaz41Q3t49t2cCtGFWTjo9ulkvpQbDWRrHQSDlFbHg/jc2/?=
 =?us-ascii?Q?AUgdjYS/G3FQLibAlPrGYTIJidp9WCZ0YiPnRabi70+R10dTKnFBaMcq40ga?=
 =?us-ascii?Q?ofOfpXn3JELUC1yu0gO5QcNZFQ1qkF8lk5NPZVJysenfCpSiUr7/ShhAOOkV?=
 =?us-ascii?Q?FYKol+5ifN/2Ur08p3nS2rXeiUa/8ilnI+dD7fCiLF+tjvrzgF7WePHECTgP?=
 =?us-ascii?Q?ICceXE3RJ1CdkUxOz5klohcHMJOUe6Wp82afgUnH8r2ZX9EQ8lVq7IiBb0wv?=
 =?us-ascii?Q?l3nrjUjG4YrEWLd6QwQ+l6j64f67n4+GxwhIE7twq4cyl6DA4A1/oBTgAgUu?=
 =?us-ascii?Q?ipJZ4K3vsNk0nrAc9YwCxpEmFXwzIMTL9HjDfiZxBWWMBpg9yJEjKzTwOmpt?=
 =?us-ascii?Q?HIIti5TpXdIcZ33/nqCwehAzm2aP19A42gQ46spQp6Hk8avbjGk2ykYMr6xl?=
 =?us-ascii?Q?a4YOa7G8NVD2cepVK1aDh2avASIVS3JVi/vryZ6wPJEYE4h7y87iy1qGmVm3?=
 =?us-ascii?Q?sbb8S419d55DRsclbT2bIm9Ch0CN4IprXIFK+3Umx72IvMkVcUbaynXdhEHH?=
 =?us-ascii?Q?WCBvNr67/6gKEPcc4+XjqJhj7H45k/KQGOPGLr4WBOvmTcIX4JDpEwoqKMkw?=
 =?us-ascii?Q?X7GngOVteVyCu0Y/T0QetLEgQPXEgwotvCC2LON0nyh1VQC7ab3gDsrN4KeP?=
 =?us-ascii?Q?mXskVxolqt0cCtJFibNM7FqyvsONm15ZLspv7T3DAWgIl9YNyanLJx0jkbLb?=
 =?us-ascii?Q?NblmyXeExsKUiHhHn3k1v+9YVEHNkFbrcV5U7YVAHI68cE+gClSudgOzR7o4?=
 =?us-ascii?Q?tF4Q+zZbF3mwa6E6+i/rV3hIomvVry4i6hSatnsDffpKvKtKOROsNiD2Mrze?=
 =?us-ascii?Q?soTIG6fJHrelb4I6G9ukOrOusIWloDnLlBR+SSaxajJ3VgJKses6Mbw+qoQs?=
 =?us-ascii?Q?Xu01FdRm5HRC3/9emVNcvlNZ4n7GJ6+dl8/bM5PzFLMH+dxyAkXiAZqbKAIA?=
 =?us-ascii?Q?cIaGB8ERvB2Y+MKcXn/2P/tRTSlyBT6Ek8sUdvnViRns/44fvzhgCxngnhbk?=
 =?us-ascii?Q?WXDatIO/4rkta+STIenqaFbWyCrWD+G65Y19yHD5DNfCCatYC5ZlpLUyL1Ce?=
 =?us-ascii?Q?OejVOdDot1NlMS6jtYqd9qCVeTYnNKQXdHMII9Z/VSjiCPbjB41wOlRE9+8U?=
 =?us-ascii?Q?qdExwb0q2cWJ/c9W4s/Vi/DNe6DPBc3AojavgRajHakGQmkgB2MA0fPz6aDe?=
 =?us-ascii?Q?j/XJKuQvFXJLEuMjiVV7gwvBCp8enbtLDTFgeu+xX4WGXZIvCJc/W22RXkaY?=
 =?us-ascii?Q?LOKQP6jUER//6A9pm7+3/JTpKYLmuqo6XswrPsqyVpjzSJF6SiEyFqa/qqxd?=
 =?us-ascii?Q?ld0XqbhX3WaVT8eL79IYeFS2iTb3aY+7A65IqxtxqOQDXMULrErA+pIc3syg?=
 =?us-ascii?Q?e99axs5hYH7wLZBdFQby0qAXafCCJZgSG13dcAhgbZcyBzJLTHmap8vH4XzY?=
 =?us-ascii?Q?7f7/c115wyuBq4QtxmmVNOuSCmqVaIIiHxGuVQNUhFZgQD8cYH5vNCVvWHyB?=
 =?us-ascii?Q?Ks5AmVIGzbP4oRCoUhvINGAseESrqo1m3+DaFa2tlcv6ukCfkXMMBo8EcRz/?=
 =?us-ascii?Q?98dFdoxG+jCbOP1u66OSyVer0GYFTFs=3D?=
X-Exchange-RoutingPolicyChecked: 
	UR/TwjF+Er5lroWfMnI5j8Dn4hsRAwX/D4AFbQpNFb9S6B+caLfB1CUFi3AjwtYjswD+7f/Uwcx3G1fN0Mm3ZNpu/F78RaVP1pm16+OV09WXIx+BqKiuzsXCnccOwbCNFc7ccBR0NKPXQK9/S7qEThHC2gFNyyr+CiGQ6HQATk4hGi3n1fS/GSXHZwUR+62UZEzI6t+ZViNJxAEh/wZED4l/DfIL2KPqoAdM0GjBH80mbCthYslx1lQV4Tav8CmT0lc6wXwvK7BL2uK6UACaWlEsWN7hO59RDF/Bh0ZytvG7rHwmlSNpu8Le7A3aCsjNRLV0AqiOZBjRkEYI3ZqZXA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5be88cb-1843-4035-1a84-08de805200bc
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 16:11:22.2794
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LcI5GzQNje9BtcaIdNKIy3IJrSQLeA93Ig+TvVfjkeF2t3sMPn9WOt6C4uSuwyor9PeI6KiKzFNrVK4HLXclGpMS9tJT+2bDYc9qG20VJjA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6113
X-Authority-Analysis: v=2.4 cv=ePAeTXp1 c=1 sm=1 tr=0 ts=69b2e5af cx=c_pps
 a=P8hJoqhRnqo/cwUvmyxmUw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=mDV3o1hIAAAA:8
 a=t7CeM3EgAAAA:8 a=_w0Y06NQe_0rs-Bk8U4A:9 a=pXiMMb81OCeSR7P-:21
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: vuXbaSng0cTEcwLwYuo7JfGN23uzSd6f
X-Proofpoint-GUID: vuXbaSng0cTEcwLwYuo7JfGN23uzSd6f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDEzMCBTYWx0ZWRfXzd+tPzoWjgiV
 L4aEjBwGkHcLVfQwWiIZ36zvadP6h94JapoDrJCU30UAwuj55Tr5+UPZ7NfSWO5MiUiiC52jU0R
 TScIYB623M3IFpnWxqKPopyTRJ/rqVcde+ADT1liwvWAlhzaWy6z1cQZv6cLR/wG1VFy+Rhuay5
 To1guXdPRsfKzO5NV/2KE7d29NQq2rb+WXvEf1AglLIc+EAQZmCF+FsD/SDjV5nc6k4MNkZJVjk
 rjdbQwUBVDBSGsPvjBRi3r312OLX2hnLNt3BM/TGTpuSw3NLbEkZMi6Km3iylWU00K2V4/HKr3S
 1a8YNHEM98n6/oTHyObBp9SApdQ6n5+TMpkjbBr+bKibJhF8Ol+paka9z3SVugQSeb8lubNn2A/
 58Wa/bBK+XOnttV6733zqfr9oi/SUUwGXi9vxl7Fc3WSyqh4NdhpyX7oRLxh9cs/Ib8NMK7lMkJ
 dkb5WFWr3vNKB1CyLSw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120130
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 16:11:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232987

From: Randy MacLeod <Randy.MacLeod@windriver.com>

Release notes:
https://savannah.gnu.org/news/?id=10853

Changelog:
1.0: https://lists.gnu.org/archive/html/info-gnu/2026-01/msg00007.html

- gettext-minimal-native: update Makevars.template source path to new
  location under gettext-tools/wizard/po-templates/traditional/

- use-pkgconfig.patch: refresh patch hunks to match updated upstream
  context in libxml.m4 and selinux-selinux-h.m4, update selinux
  discovery: replace AC_SEARCH_LIBS (getfilecon_raw) with
  PKG_CHECK_MODULES for correct sysroot handling

- gettext_1.0.bb: add autotools ptest directory and install
  gettext-tools autotools build artifacts for ptest

ptest results:

=======================
All 630 tests passed
(41 tests were not run)
=======================
DURATION: 45
END: /usr/lib/gettext/ptest
2026-03-09T17:58
STOP: ptest-runner
TOTAL: 1 FAIL: 0

With the previous version:
All 626 tests passed
(40 tests were not run)

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 ..._0.26.bb => gettext-minimal-native_1.0.bb} |  3 ++-
 meta/recipes-core/gettext/gettext-sources.inc |  2 +-
 .../gettext/gettext/use-pkgconfig.patch       | 25 +++++++++++--------
 .../{gettext_0.26.bb => gettext_1.0.bb}       |  2 ++
 4 files changed, 20 insertions(+), 12 deletions(-)
 rename meta/recipes-core/gettext/{gettext-minimal-native_0.26.bb => gettext-minimal-native_1.0.bb} (88%)
 rename meta/recipes-core/gettext/{gettext_0.26.bb => gettext_1.0.bb} (98%)

diff --git a/meta/recipes-core/gettext/gettext-minimal-native_0.26.bb b/meta/recipes-core/gettext/gettext-minimal-native_1.0.bb
similarity index 88%
rename from meta/recipes-core/gettext/gettext-minimal-native_0.26.bb
rename to meta/recipes-core/gettext/gettext-minimal-native_1.0.bb
index b5c32d0786..28392a26b5 100644
--- a/meta/recipes-core/gettext/gettext-minimal-native_0.26.bb
+++ b/meta/recipes-core/gettext/gettext-minimal-native_1.0.bb
@@ -44,5 +44,6 @@ do_install () {
 	cp ${S}/gettext-runtime/po/Makefile.in.in ${D}${datadir}/gettext/po/
 	cp ${S}/gettext-runtime/po/remove-potcdate.sed ${D}${datadir}/gettext/po/
 	# The gettext recipe also installs the same Makevars.template at the same place, rename it
-	cp ${S}/gettext-tools/po/Makevars.template ${D}${datadir}/gettext/po/Makevars.template.minimal
+	# cp ${S}/gettext-tools/po/Makevars.template ${D}${datadir}/gettext/po/Makevars.template.minimal
+	cp ${S}/gettext-tools/wizard/po-templates/traditional/Makevars.template ${D}${datadir}/gettext/po/Makevars.template.minimal 
 }
diff --git a/meta/recipes-core/gettext/gettext-sources.inc b/meta/recipes-core/gettext/gettext-sources.inc
index 2ddf47334d..02ad72fc9f 100644
--- a/meta/recipes-core/gettext/gettext-sources.inc
+++ b/meta/recipes-core/gettext/gettext-sources.inc
@@ -1,3 +1,3 @@
 HOMEPAGE = "http://www.gnu.org/software/gettext/gettext.html"
 SRC_URI = "${GNU_MIRROR}/gettext/gettext-${PV}.tar.gz"
-SRC_URI[sha256sum] = "39acf4b0371e9b110b60005562aace5b3631fed9b1bb9ecccfc7f56e58bb1d7f"
+SRC_URI[sha256sum] = "85d99b79c981a404874c02e0342176cf75c7698e2b51fe41031cf6526d974f1a"
diff --git a/meta/recipes-core/gettext/gettext/use-pkgconfig.patch b/meta/recipes-core/gettext/gettext/use-pkgconfig.patch
index 2b9fef1e94..031a44d4dd 100644
--- a/meta/recipes-core/gettext/gettext/use-pkgconfig.patch
+++ b/meta/recipes-core/gettext/gettext/use-pkgconfig.patch
@@ -27,7 +27,7 @@ diff --git a/gettext-tools/gnulib-m4/libxml.m4 b/gettext-tools/gnulib-m4/libxml.
 index c7160d7..8e46cc7 100644
 --- a/gettext-tools/gnulib-m4/libxml.m4
 +++ b/gettext-tools/gnulib-m4/libxml.m4
-@@ -14,6 +14,7 @@ dnl gl_LIBXML(FORCE-INCLUDED)
+@@ -15,6 +15,7 @@ dnl gl_LIBXML(FORCE-INCLUDED)
  dnl   forces the use of the included or an external libxml.
  AC_DEFUN([gl_LIBXML],
  [
@@ -35,7 +35,7 @@ index c7160d7..8e46cc7 100644
    AC_REQUIRE([AM_ICONV_LINK])
  
    ifelse([$1], , [
-@@ -31,106 +32,10 @@ AC_DEFUN([gl_LIBXML],
+@@ -33,106 +34,10 @@ AC_DEFUN([gl_LIBXML],
    INCXML=
    ifelse([$1], [yes], , [
      if test "$gl_cv_libxml_use_included" != yes; then
@@ -399,7 +399,7 @@ diff --git a/gettext-tools/gnulib-m4/selinux-selinux-h.m4 b/gettext-tools/gnulib
 index e2613fa..2a733a7 100644
 --- a/gettext-tools/gnulib-m4/selinux-selinux-h.m4
 +++ b/gettext-tools/gnulib-m4/selinux-selinux-h.m4
-@@ -71,6 +71,7 @@ AC_DEFUN([gl_LIBSELINUX],
+@@ -71,6 +71,7 @@
  [
    AC_REQUIRE([AC_CANONICAL_HOST])
    AC_REQUIRE([AC_CANONICAL_BUILD])
@@ -407,24 +407,29 @@ index e2613fa..2a733a7 100644
  
    AC_ARG_WITH([selinux],
      AS_HELP_STRING([[--without-selinux]], [do not use SELinux, even on systems with SELinux]),
-@@ -79,19 +80,8 @@ AC_DEFUN([gl_LIBSELINUX],
+@@ -79,24 +80,8 @@
    LIB_SELINUX=
    if test "$with_selinux" != no; then
      gl_saved_LIBS=$LIBS
--    AC_SEARCH_LIBS([setfilecon], [selinux],
--                   [test "$ac_cv_search_setfilecon" = "none required" ||
--                    LIB_SELINUX=$ac_cv_search_setfilecon])
+-    dnl On Android, in Termux, prefer libandroid-selinux.so, because it
+-    dnl defines many more API functions than /system/lib/libselinux.so.
+-    AC_SEARCH_LIBS([getfilecon_raw], [android-selinux selinux],
+-                   [test "$ac_cv_search_getfilecon_raw" = "none required" ||
+-                    LIB_SELINUX=$ac_cv_search_getfilecon_raw])
 +    PKG_CHECK_MODULES([SELINUX], [libselinux], [LIB_SELINUX=$SELINUX_LIBS])
      LIBS=$gl_saved_LIBS
    fi
    AC_SUBST([LIB_SELINUX])
 -
 -  # Warn if SELinux is found but libselinux is absent;
--  if test "$ac_cv_search_setfilecon" = no; then
--    if test "$host" = "$build" && test -d /selinux; then
+-  if test "$ac_cv_search_getfilecon_raw" = no; then
+-    if test "$host" = "$build" \
+-       && { test -d /sys/fs/selinux || test -d /selinux; }; then
 -      AC_MSG_WARN([This system supports SELinux but libselinux is missing.])
 -      AC_MSG_WARN([AC_PACKAGE_NAME will be compiled without SELinux support.])
 -    fi
--    with_selinux=no
+-    if test "$with_selinux" = maybe; then
+-      with_selinux=no
+-    fi
 -  fi
  ])
diff --git a/meta/recipes-core/gettext/gettext_0.26.bb b/meta/recipes-core/gettext/gettext_1.0.bb
similarity index 98%
rename from meta/recipes-core/gettext/gettext_0.26.bb
rename to meta/recipes-core/gettext/gettext_1.0.bb
index b99b301af4..37e46869a7 100644
--- a/meta/recipes-core/gettext/gettext_0.26.bb
+++ b/meta/recipes-core/gettext/gettext_1.0.bb
@@ -148,6 +148,7 @@ do_install_ptest() {
         mkdir -p                                        ${D}${PTEST_PATH}/tests
         mkdir -p                                        ${D}${PTEST_PATH}/src
         mkdir -p                                        ${D}${PTEST_PATH}/po
+        mkdir -p                                        ${D}${PTEST_PATH}/autotools
         mkdir -p                                        ${D}${PTEST_PATH}/misc
         mkdir -p                                        ${D}${PTEST_PATH}/its
         mkdir -p                                        ${D}${PTEST_PATH}/styles
@@ -172,6 +173,7 @@ do_install_ptest() {
         install ${B}/gettext-runtime/src/gettext        ${D}${PTEST_PATH}/src
         install ${B}/gettext-tools/src/.libs/cldr-plurals   ${D}${PTEST_PATH}/src
         install ${S}/gettext-tools/po/gettext-tools.pot ${D}${PTEST_PATH}/po
+        install ${B}/gettext-tools/autotools/*       ${D}${PTEST_PATH}/autotools
         install ${B}/gettext-tools/misc/*       ${D}${PTEST_PATH}/misc
         find ${D}${PTEST_PATH}/ -name "*.o" -exec rm {} \;
         chmod 0755 ${D}${PTEST_PATH}/tests/lang-vala ${D}${PTEST_PATH}/tests/plural-1 ${D}${PTEST_PATH}/tests/xgettext-tcl-4 \
-- 
2.49.0


